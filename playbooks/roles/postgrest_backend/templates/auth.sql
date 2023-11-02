-- See https://postgrest.org/en/stable/how-tos/sql-user-management.html

-- First we’ll need a table to keep track of our users:

create schema if not exists basic_auth;

create table if not exists
basic_auth.users (
  api_id   text primary key check (length(api_id) < 512),
  api_key  text not null check (length(api_key) < 512),
  role     name not null check (length(role) < 512)
);

-- We would like the role to be a foreign key to actual database roles, however PostgreSQL does not support these constraints against the pg_roles table.
-- We’ll use a trigger to manually enforce it.

create or replace function
basic_auth.check_role_exists() returns trigger as $$
begin
  if not exists (select 1 from pg_roles as r where r.rolname = new.role) then
    raise foreign_key_violation using message =
      'unknown database role: ' || new.role;
    return null;
  end if;
  return new;
end
$$ language plpgsql;

drop trigger if exists ensure_user_role_exists on basic_auth.users;
create constraint trigger ensure_user_role_exists
  after insert or update on basic_auth.users
  for each row
  execute procedure basic_auth.check_role_exists();

-- Next we’ll use the pgcrypto extension and a trigger to keep passwords safe in the users table.

create extension if not exists pgcrypto;

create or replace function
basic_auth.encrypt_pass() returns trigger as $$
begin
  if tg_op = 'INSERT' or new.api_key <> old.api_key then
    new.api_key = crypt(new.api_key, gen_salt('bf'));
  end if;
  return new;
end
$$ language plpgsql;

drop trigger if exists encrypt_pass on basic_auth.users;
create trigger encrypt_pass
  before insert or update on basic_auth.users
  for each row
  execute procedure basic_auth.encrypt_pass();

-- With the table in place we can make a helper to check a password against the encrypted column.
-- It returns the database role for a user if the id and password are correct.

create or replace function
basic_auth.user_role(api_id text, api_key text) returns name
  language plpgsql
  as $$
begin
  return (
  select role from basic_auth.users
   where users.api_id = user_role.api_id
     and users.api_key = crypt(user_role.api_key, users.api_key)
  );
end;
$$;

-- As described in JWT from SQL, we’ll create a JWT inside our login function.
-- Note that you’ll need to adjust the secret key which is hard-coded in this example to a secure (at least thirty-two character) secret of your choosing.

-- add type
DO $$ BEGIN
    CREATE TYPE basic_auth.jwt_token AS (
      token text
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- Copied from https://raw.githubusercontent.com/michelp/pgjwt/master/pgjwt--0.2.0.sql

CREATE OR REPLACE FUNCTION basic_auth.url_encode(data bytea) RETURNS text LANGUAGE sql AS $$
    SELECT translate(encode(data, 'base64'), E'+/=\n', '-_');
$$ IMMUTABLE;

CREATE OR REPLACE FUNCTION basic_auth.url_decode(data text) RETURNS bytea LANGUAGE sql AS $$
WITH t AS (SELECT translate(data, '-_', '+/') AS trans),
     rem AS (SELECT length(t.trans) % 4 AS remainder FROM t) -- compute padding size
    SELECT decode(
        t.trans ||
        CASE WHEN rem.remainder > 0
           THEN repeat('=', (4 - rem.remainder))
           ELSE '' END,
    'base64') FROM t, rem;
$$ IMMUTABLE;

CREATE OR REPLACE FUNCTION basic_auth.algorithm_sign(signables text, secret text, algorithm text)
RETURNS text LANGUAGE sql AS $$
WITH
  alg AS (
    SELECT CASE
      WHEN algorithm = 'HS256' THEN 'sha256'
      WHEN algorithm = 'HS384' THEN 'sha384'
      WHEN algorithm = 'HS512' THEN 'sha512'
      ELSE '' END AS id)  -- hmac throws error
SELECT basic_auth.url_encode(public.hmac(signables, secret, alg.id)) FROM alg;
$$ IMMUTABLE;

CREATE OR REPLACE FUNCTION basic_auth.sign(payload json, secret text, algorithm text DEFAULT 'HS256')
RETURNS text LANGUAGE sql AS $$
WITH
  header AS (
    SELECT basic_auth.url_encode(convert_to('{"alg":"' || algorithm || '","typ":"JWT"}', 'utf8')) AS data
    ),
  payload AS (
    SELECT basic_auth.url_encode(convert_to(payload::text, 'utf8')) AS data
    ),
  signables AS (
    SELECT header.data || '.' || payload.data AS data FROM header, payload
    )
SELECT
    signables.data || '.' ||
    basic_auth.algorithm_sign(signables.data, secret, algorithm) FROM signables;
$$ IMMUTABLE;

-- login should be on your exposed schema

create or replace function
{{ postgrest_schemas.0 }}.login(api_id text, api_key text) returns basic_auth.jwt_token as $$
declare
  _role name;
  result basic_auth.jwt_token;
begin
  -- check email and password
  select basic_auth.user_role(api_id, api_key) into _role;
  if _role is null then
    raise invalid_password using message = 'invalid user or password';
  end if;

  select basic_auth.sign(
      row_to_json(r), '{{ postgrest_jwt_key }}'
    ) as token
    from (
      select _role as role, login.api_id as api_id,
         extract(epoch from now())::integer + 60*60 as exp
    ) r
    into result;
  return result;
end;
$$ language plpgsql security definer;

grant execute on function {{ postgrest_schemas.0 }}.login(text,text) to {{ postgrest_anon_role }};

# Instalación

## Servidor postgres

Referencia: https://www.postgresql.org/about/news/postgresql-16-released-2715/

```bash
sudo apt install -y postgresql-common
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh

sudo apt install postgresql-16 postgresql-16-postgis python3-psycopg2 acl
```

## Servidor API

### HAProxy

```bash
sudo apt install -y haproxy
```

### postgRest

Referencia: https://postgrest.org/en/stable/explanations/install.html#install

```
wget -O postgrest-v11.2.1-linux-static-x64.tar.xz "https://github.com/PostgREST/postgrest/releases/download/v11.2.1/postgrest-v11.2.1-linux-static-x64.tar.xz"
tar -xvf postgrest-v11.2.1-linux-static-x64.tar.xz
sudo mv postgrest /usr/local/bin
```

### pgAdmin

Referencia: https://www.pgadmin.org/download/pgadmin-4-apt/

```bash
# Install the public key for the repository (if not done previously):
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

sudo apt install pgadmin4 uwsgi uwsgi-plugin-python3
```

# Configuración

```bash
ansible-playbook -i inventory/hosts --ask-pass --ask-become.pass playbooks/deploy.sh
```

Nota: El playbook no configuran el usuario y password inicial de pgadmin, porque para eso se necesita un script interactivo que pregunta al usuario el email y password.

Por eso, una vez ejecutado el playbook por primera vez, es necesario a continuación lanzar el script de setup inicial de pgadmin:

```bash
sudo bash
export PGPASSWORD="password del usuario pgadmin"
/usr/pgadmin4/venv/bin/python /usr/pgadmin4/web/setup.py
```

Y tras esto, volver a ejecutar el playbook:

```bash
ansible-playbook -i inventory/hosts --ask-pass --ask-become-pass --ask-vault-pass playbooks/deploy.sh
```

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Ubuntu 16.0-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.0 (Ubuntu 16.0-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: bd_empleados; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bd_empleados;


ALTER SCHEMA bd_empleados OWNER TO postgres;

--
-- Name: bd_terceros; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bd_terceros;


ALTER SCHEMA bd_terceros OWNER TO postgres;

--
-- Name: bd_territorios; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bd_territorios;


ALTER SCHEMA bd_territorios OWNER TO postgres;

--
-- Name: cat_empleados; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cat_empleados;


ALTER SCHEMA cat_empleados OWNER TO postgres;

--
-- Name: cat_global; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cat_global;


ALTER SCHEMA cat_global OWNER TO postgres;

--
-- Name: cat_terceros; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cat_terceros;


ALTER SCHEMA cat_terceros OWNER TO postgres;

--
-- Name: cat_territorios; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cat_territorios;


ALTER SCHEMA cat_territorios OWNER TO postgres;

--
-- Name: meta; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA meta;


ALTER SCHEMA meta OWNER TO postgres;

--
-- Name: SCHEMA meta; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA meta IS 'Esquema dedicado a metadatos para la base de datos de territorios';


--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: topology_earth; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology_earth;


ALTER SCHEMA topology_earth OWNER TO postgres;

--
-- Name: address_standardizer; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;


--
-- Name: EXTENSION address_standardizer; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';


--
-- Name: address_standardizer_data_us; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;


--
-- Name: EXTENSION address_standardizer_data_us; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_raster; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;


--
-- Name: EXTENSION postgis_raster; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';


--
-- Name: postgis_sfcgal; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;


--
-- Name: EXTENSION postgis_sfcgal; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


--
-- Name: postgres_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgres_fdw WITH SCHEMA public;


--
-- Name: EXTENSION postgres_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgres_fdw IS 'foreign-data wrapper for remote PostgreSQL servers';


--
-- Name: territorios_ext; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER territorios_ext FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'territorios',
    host '172.17.121.36'
);


ALTER SERVER territorios_ext OWNER TO postgres;

--
-- Name: USER MAPPING postgres SERVER territorios_ext; Type: USER MAPPING; Schema: -; Owner: postgres
--

CREATE USER MAPPING FOR postgres SERVER territorios_ext OPTIONS (
    password 's2EqBUvXMYyNphw33qg8kcSQSd22mN6PR8YtZo68kJ49wZR5',
    "user" 'postgres'
);


--
-- Name: empresa_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.empresa_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.empresa_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE empresa_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.empresa_gid_seq IS 'secuencia para la clave primaria de la tabla empresa';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: empresa; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.empresa (
    gid integer DEFAULT nextval('bd_empleados.empresa_gid_seq'::regclass) NOT NULL,
    cod_empresa integer NOT NULL,
    nombre_empresa character varying(100) NOT NULL,
    siglas_empresa character varying(6),
    direccion character varying(50),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.empresa OWNER TO postgres;

--
-- Name: grupo_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.grupo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.grupo_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE grupo_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.grupo_gid_seq IS 'secuencia para la clave primaria de la tabla grupo';


--
-- Name: grupo; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.grupo (
    gid integer DEFAULT nextval('bd_empleados.grupo_gid_seq'::regclass) NOT NULL,
    cod_grupo integer NOT NULL,
    nombre_grupo character varying(100) NOT NULL,
    siglas_grupo character varying(2),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.grupo OWNER TO postgres;

--
-- Name: organizacion_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.organizacion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.organizacion_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE organizacion_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.organizacion_gid_seq IS 'secuencia para la clave primaria de la tabla organizacion';


--
-- Name: nivel_organizacion; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.nivel_organizacion (
    gid integer DEFAULT nextval('bd_empleados.organizacion_gid_seq'::regclass) NOT NULL,
    cod_organizacion integer NOT NULL,
    id_organi_padre integer NOT NULL,
    nombre_organizacion character varying(100) NOT NULL,
    siglas_organizacion character varying(2),
    observaciones character varying(100),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    id_empresa integer NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.nivel_organizacion OWNER TO postgres;

--
-- Name: permiso_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.permiso_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.permiso_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE permiso_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.permiso_gid_seq IS 'secuencia para la clave primaria de la tabla permisos';


--
-- Name: permiso; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.permiso (
    gid integer DEFAULT nextval('bd_empleados.permiso_gid_seq'::regclass) NOT NULL,
    cod_permiso integer NOT NULL,
    nombre_permiso character varying(100) NOT NULL,
    descripcion character varying(50),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.permiso OWNER TO postgres;

--
-- Name: puesto_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.puesto_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.puesto_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE puesto_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.puesto_gid_seq IS 'secuencia para la clave primaria de la tabla puesto';


--
-- Name: puesto; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.puesto (
    gid integer DEFAULT nextval('bd_empleados.puesto_gid_seq'::regclass) NOT NULL,
    cod_puesto integer NOT NULL,
    nombre_puesto character varying(100) NOT NULL,
    siglas_puesto character varying(2),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    id_empresa integer NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.puesto OWNER TO postgres;

--
-- Name: rel_empre_grupo_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.rel_empre_grupo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.rel_empre_grupo_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rel_empre_grupo_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.rel_empre_grupo_gid_seq IS 'secuencia para la clave primaria de la tabla relacion empresa grupo';


--
-- Name: rel_grupo_rol_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.rel_grupo_rol_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.rel_grupo_rol_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rel_grupo_rol_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.rel_grupo_rol_gid_seq IS 'secuencia para la clave primaria de la tabla relacion grupos y roles';


--
-- Name: rel_grupo_rol; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.rel_grupo_rol (
    gid integer DEFAULT nextval('bd_empleados.rel_grupo_rol_gid_seq'::regclass) NOT NULL,
    id_grupo integer NOT NULL,
    id_rol integer NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.rel_grupo_rol OWNER TO postgres;

--
-- Name: rel_orga_grupo; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.rel_orga_grupo (
    gid integer DEFAULT nextval('bd_empleados.rel_empre_grupo_gid_seq'::regclass) NOT NULL,
    id_organizacion integer NOT NULL,
    id_grupo integer NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.rel_orga_grupo OWNER TO postgres;

--
-- Name: rel_rol_permiso_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.rel_rol_permiso_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.rel_rol_permiso_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rel_rol_permiso_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.rel_rol_permiso_gid_seq IS 'secuencia para la clave primaria de la tabla relacion usuario rol permiso';


--
-- Name: rel_rol_permiso; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.rel_rol_permiso (
    gid integer DEFAULT nextval('bd_empleados.rel_rol_permiso_gid_seq'::regclass) NOT NULL,
    id_rol integer NOT NULL,
    id_permiso integer NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.rel_rol_permiso OWNER TO postgres;

--
-- Name: rel_usuario_grupo_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.rel_usuario_grupo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.rel_usuario_grupo_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rel_usuario_grupo_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.rel_usuario_grupo_gid_seq IS 'secuencia para la clave primaria de la tabla relacion usuario grupo';


--
-- Name: rel_usuario_grupo; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.rel_usuario_grupo (
    gid integer DEFAULT nextval('bd_empleados.rel_usuario_grupo_gid_seq'::regclass) NOT NULL,
    id_usuario integer NOT NULL,
    id_grupo integer NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.rel_usuario_grupo OWNER TO postgres;

--
-- Name: rel_usuario_rol_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.rel_usuario_rol_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.rel_usuario_rol_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rel_usuario_rol_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.rel_usuario_rol_gid_seq IS 'secuencia para la clave primaria de la tabla relacion usuario rolo';


--
-- Name: rel_usuario_rol; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.rel_usuario_rol (
    gid integer DEFAULT nextval('bd_empleados.rel_usuario_rol_gid_seq'::regclass) NOT NULL,
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.rel_usuario_rol OWNER TO postgres;

--
-- Name: rol_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.rol_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.rol_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rol_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.rol_gid_seq IS 'secuencia para la clave primaria de la tabla rol';


--
-- Name: rol; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.rol (
    gid integer DEFAULT nextval('bd_empleados.rol_gid_seq'::regclass) NOT NULL,
    cod_rol integer NOT NULL,
    nombre_rol character varying(100) NOT NULL,
    descripcion character varying(50),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.rol OWNER TO postgres;

--
-- Name: usuario_empleado_gid_seq; Type: SEQUENCE; Schema: bd_empleados; Owner: postgres
--

CREATE SEQUENCE bd_empleados.usuario_empleado_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_empleados.usuario_empleado_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE usuario_empleado_gid_seq; Type: COMMENT; Schema: bd_empleados; Owner: postgres
--

COMMENT ON SEQUENCE bd_empleados.usuario_empleado_gid_seq IS 'secuencia para la clave primaria de la tabla usuario_empleado';


--
-- Name: usuario_empleado; Type: TABLE; Schema: bd_empleados; Owner: postgres
--

CREATE TABLE bd_empleados.usuario_empleado (
    gid integer DEFAULT nextval('bd_empleados.usuario_empleado_gid_seq'::regclass) NOT NULL,
    cod_usuario_empleado integer NOT NULL,
    nombre_usuario_empleado character varying(100) NOT NULL,
    descripcion character varying(50),
    id_puesto integer,
    id_nivel_organizacion integer,
    id_ext_tercero integer,
    id_ext_direccion integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_empleados.usuario_empleado OWNER TO postgres;

--
-- Name: area_interes_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.area_interes_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.area_interes_gid_seq OWNER TO postgres;

--
-- Name: area_interes; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.area_interes (
    gid integer DEFAULT nextval('bd_terceros.area_interes_gid_seq'::regclass) NOT NULL,
    codigo character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    id_grupo_area_interes integer NOT NULL,
    nombre_producto character varying(100),
    ind_privado boolean,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.area_interes OWNER TO postgres;

--
-- Name: banco_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.banco_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.banco_gid_seq OWNER TO postgres;

--
-- Name: banco; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.banco (
    gid integer DEFAULT nextval('bd_terceros.banco_gid_seq'::regclass) NOT NULL,
    codigo character varying(12) NOT NULL,
    nombre_banco character varying(50) NOT NULL,
    codigo_bic character varying(11) NOT NULL,
    direccion character varying(150),
    telefono character varying(15),
    email character varying(40),
    url character varying(100),
    cod_tipo_banco integer,
    observaciones character varying(100),
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.banco OWNER TO postgres;

--
-- Name: canal_notif_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.canal_notif_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.canal_notif_gid_seq OWNER TO postgres;

--
-- Name: canal_notificacion; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.canal_notificacion (
    gid integer DEFAULT nextval('bd_terceros.canal_notif_gid_seq'::regclass) NOT NULL,
    id_tercero integer NOT NULL,
    cod_tipo_canal_notif integer NOT NULL,
    descripcion character varying(80) NOT NULL,
    valor character varying(150) NOT NULL,
    ind_canal_defecto boolean,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.canal_notificacion OWNER TO postgres;

--
-- Name: cuenta_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.cuenta_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.cuenta_gid_seq OWNER TO postgres;

--
-- Name: cuenta; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.cuenta (
    gid integer DEFAULT nextval('bd_terceros.cuenta_gid_seq'::regclass) NOT NULL,
    id_oficina integer NOT NULL,
    digito_control character varying(2) NOT NULL,
    numero_cuenta integer NOT NULL,
    titular_cuenta character varying(30) NOT NULL,
    cod_pais_iban character varying(2) NOT NULL,
    digito_control_iban character varying(2) NOT NULL,
    codigo_iban character varying(30) NOT NULL,
    codigo_bic character varying(11) NOT NULL,
    ind_cuenta_defecto boolean DEFAULT false NOT NULL,
    etiqueta_cuenta character varying(80),
    observaciones character varying(100),
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    cod_estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.cuenta OWNER TO postgres;

--
-- Name: direcc_tercero_no_geo; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.direcc_tercero_no_geo (
    gid integer DEFAULT nextval('bd_terceros.banco_gid_seq'::regclass) NOT NULL,
    id_tercero integer NOT NULL,
    id_acceso integer,
    desc_acceso character varying(80),
    desc_direccion character varying(80),
    ref_catastral character varying(20) NOT NULL,
    desc_puerta character varying(10),
    extension_direccion character varying(100),
    tiponimia character varying(30),
    direccion_visualizar character varying(120),
    numero integer,
    segundo_numero integer,
    duplicado integer,
    segundo_duplicado integer,
    nombre_via character varying(60),
    ind_poligono boolean,
    codigo_postal character varying(5),
    id_tramo integer,
    desc_tramo integer,
    siglas character varying(5) NOT NULL,
    bloque character varying(4) NOT NULL,
    ind_kilom_manzana character(1),
    num_kilom_manzana numeric(7,2),
    ind_bloq_poligono character(1),
    ind_acceso_compartido boolean,
    desc_bloq_poligono character varying(4) NOT NULL,
    valor_escalera integer,
    valor_planta integer,
    valor_puerta integer,
    toponimia character varying(25) NOT NULL,
    referencia_catastral_parc character varying(20) NOT NULL,
    entrada_principal boolean,
    observaciones character varying(25),
    fuente_datos integer,
    id_parcela integer,
    des_parcela character varying(80),
    id_nucleo_diseminado integer,
    id_tipo_vial integer,
    id_tipo_portal integer,
    id_valor_sentido integer,
    id_valor_sentido_pk integer,
    id_tipo_colectivo integer,
    id_tipo_inmueble integer,
    id_tipo_acceso integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 1 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.direcc_tercero_no_geo OWNER TO postgres;

--
-- Name: direcccion; Type: FOREIGN TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE FOREIGN TABLE bd_terceros.direcccion (
    gid integer NOT NULL,
    desc_direccion character varying(80) NOT NULL,
    ref_catastral character varying(20) NOT NULL,
    cod_tipo_inmueble integer,
    cod_tipo_colectivo integer,
    valor_escalera integer,
    valor_planta integer,
    valor_puerta character varying(10),
    observaciones character varying(150) NOT NULL,
    id_acceso integer,
    fuente_datos integer,
    ind_vigente boolean,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL
)
SERVER territorios_ext
OPTIONS (
    schema_name 'territorios',
    table_name 'direccion'
);


ALTER FOREIGN TABLE bd_terceros.direcccion OWNER TO postgres;

--
-- Name: grupo_area_interes_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.grupo_area_interes_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.grupo_area_interes_gid_seq OWNER TO postgres;

--
-- Name: grupo_area_interes; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.grupo_area_interes (
    gid integer DEFAULT nextval('bd_terceros.grupo_area_interes_gid_seq'::regclass) NOT NULL,
    codigo character varying(20) NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(80) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp(),
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.grupo_area_interes OWNER TO postgres;

--
-- Name: idioma_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.idioma_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.idioma_gid_seq OWNER TO postgres;

--
-- Name: oficina_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.oficina_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.oficina_gid_seq OWNER TO postgres;

--
-- Name: oficina; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.oficina (
    gid integer DEFAULT nextval('bd_terceros.oficina_gid_seq'::regclass) NOT NULL,
    cod_oficina character varying(10) NOT NULL,
    nombre_oficina character varying(50),
    horario character varying(150),
    id_banco integer NOT NULL,
    direccion_oficina character varying(80) NOT NULL,
    tipo_banco character varying(1) NOT NULL,
    cod_provincia integer,
    cod_municipio integer,
    entidad_colectiva integer,
    entidad_singular integer,
    telefono1 character varying(15) NOT NULL,
    telefono2 character varying(15) NOT NULL,
    fax character varying(15) NOT NULL,
    cod_postal character varying(5) NOT NULL,
    observaciones character varying(100) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    cod_estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.oficina OWNER TO postgres;

--
-- Name: pais_nacimiento_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.pais_nacimiento_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.pais_nacimiento_gid_seq OWNER TO postgres;

--
-- Name: pais_tercero_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.pais_tercero_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.pais_tercero_gid_seq OWNER TO postgres;

--
-- Name: pais_tercero; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.pais_tercero (
    gid integer DEFAULT nextval('bd_terceros.pais_tercero_gid_seq'::regclass) NOT NULL,
    cod_pais integer NOT NULL,
    descripcion character varying(80) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp(),
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.pais_tercero OWNER TO postgres;

--
-- Name: profesion_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.profesion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.profesion_gid_seq OWNER TO postgres;

--
-- Name: rel_cuenta_banco_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.rel_cuenta_banco_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.rel_cuenta_banco_gid_seq OWNER TO postgres;

--
-- Name: rel_cuenta_oficina_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.rel_cuenta_oficina_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.rel_cuenta_oficina_gid_seq OWNER TO postgres;

--
-- Name: rel_oficina_banco_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.rel_oficina_banco_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.rel_oficina_banco_gid_seq OWNER TO postgres;

--
-- Name: rel_tercero_area_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.rel_tercero_area_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.rel_tercero_area_gid_seq OWNER TO postgres;

--
-- Name: rel_tercero_area; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.rel_tercero_area (
    gid integer DEFAULT nextval('bd_terceros.rel_tercero_area_gid_seq'::regclass) NOT NULL,
    id_tercero integer NOT NULL,
    id_area_interes integer NOT NULL,
    ind_auto_envio_info boolean,
    ind_auto_envio_mail boolean,
    ind_auto_envio_movil boolean,
    ind_auto_envio_fax boolean,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp(),
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.rel_tercero_area OWNER TO postgres;

--
-- Name: rel_tercero_cuenta_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.rel_tercero_cuenta_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.rel_tercero_cuenta_gid_seq OWNER TO postgres;

--
-- Name: rel_tercero_cuenta; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.rel_tercero_cuenta (
    gid integer DEFAULT nextval('bd_terceros.rel_tercero_cuenta_gid_seq'::regclass) NOT NULL,
    id_tercero integer NOT NULL,
    id_cuenta integer NOT NULL,
    ind_defecto boolean,
    num_prioridad integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp(),
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.rel_tercero_cuenta OWNER TO postgres;

--
-- Name: rel_tercero_direccion_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.rel_tercero_direccion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.rel_tercero_direccion_gid_seq OWNER TO postgres;

--
-- Name: rel_tercero_direccion; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.rel_tercero_direccion (
    gid integer DEFAULT nextval('bd_terceros.rel_tercero_direccion_gid_seq'::regclass) NOT NULL,
    id_tercero integer NOT NULL,
    ind_tiene_dir_geo boolean NOT NULL,
    id_direcc_geo integer NOT NULL,
    id_direcc_no_geo integer NOT NULL,
    cod_tipo_direccion integer NOT NULL,
    ind_defecto boolean,
    num_prioridad integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp(),
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.rel_tercero_direccion OWNER TO postgres;

--
-- Name: rel_tercero_tercero_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.rel_tercero_tercero_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.rel_tercero_tercero_gid_seq OWNER TO postgres;

--
-- Name: status_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.status_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.status_gid_seq OWNER TO postgres;

--
-- Name: tercero_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.tercero_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.tercero_gid_seq OWNER TO postgres;

--
-- Name: tercero; Type: TABLE; Schema: bd_terceros; Owner: postgres
--

CREATE TABLE bd_terceros.tercero (
    gid integer DEFAULT nextval('bd_terceros.tercero_gid_seq'::regclass) NOT NULL,
    cod_tipo_tercero integer NOT NULL,
    nif character varying(15) NOT NULL,
    cod_tipo_nif integer NOT NULL,
    digito_control character varying(2) NOT NULL,
    cod_pais_nacionalidad integer NOT NULL,
    cod_identificador integer,
    nro_identificador integer,
    nivel_administracion integer,
    tipo_entidad_pub character varying(2),
    nivel_entidad integer,
    nombre_completo character varying(120) NOT NULL,
    primer_nombre character varying(25) NOT NULL,
    segundo_nombre character varying(25),
    primer_apell character varying(30) NOT NULL,
    primer_apell_prepo character varying(6),
    segundo_apell character varying(30),
    segundo_apell_prepo character varying(6),
    nombre_empresa character varying(120),
    otro_nombre character varying(100),
    fecha_nacimiento date NOT NULL,
    fecha_registro date NOT NULL,
    fecha_baja date,
    fecha_actualizacionn date,
    cod_tipo_genero integer,
    cod_tipo_canal_notif integer,
    cod_status_tercero integer NOT NULL,
    cod_pais_tercero integer NOT NULL,
    cod_pais_nac_tercero integer NOT NULL,
    cod_ciudad_nac_tercero integer NOT NULL,
    cod_idioma_tercero integer,
    cod_profesion integer,
    gid_direccion_defecto integer,
    gid_cuenta_defecto integer,
    es_admin_publica boolean,
    link_fotografia character varying(100),
    ind_terc_no_solvente boolean,
    ind_terc_ficticio boolean,
    observaciones character varying(150) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp(),
    baja_db date,
    cod_estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_terceros.tercero OWNER TO postgres;

--
-- Name: tipo_canal_notif_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.tipo_canal_notif_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.tipo_canal_notif_gid_seq OWNER TO postgres;

--
-- Name: tipo_direccion_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.tipo_direccion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.tipo_direccion_gid_seq OWNER TO postgres;

--
-- Name: tipo_genero_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.tipo_genero_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.tipo_genero_gid_seq OWNER TO postgres;

--
-- Name: tipo_nif_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.tipo_nif_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.tipo_nif_gid_seq OWNER TO postgres;

--
-- Name: tipo_reg_matrimonial_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.tipo_reg_matrimonial_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.tipo_reg_matrimonial_gid_seq OWNER TO postgres;

--
-- Name: tipo_relacion_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.tipo_relacion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.tipo_relacion_gid_seq OWNER TO postgres;

--
-- Name: tipo_tercero_gid_seq; Type: SEQUENCE; Schema: bd_terceros; Owner: postgres
--

CREATE SEQUENCE bd_terceros.tipo_tercero_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_terceros.tipo_tercero_gid_seq OWNER TO postgres;

--
-- Name: acceso_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.acceso_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.acceso_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE acceso_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.acceso_gid_seq IS 'secuencia para la clave primaria de los Accesos';


--
-- Name: acceso; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.acceso (
    gid integer DEFAULT nextval('bd_territorios.acceso_gid_seq'::regclass) NOT NULL,
    cod_acceso integer NOT NULL,
    desc_acceso character varying(80) NOT NULL,
    tipo_acceso integer,
    id_codigo_postal integer,
    id_tramo integer,
    id_nucleo_diseminado integer,
    geom public.geometry(Point,4326),
    nombre_calle character varying(60) NOT NULL,
    numero integer,
    segundo_numero integer,
    duplicado integer,
    segundo_duplicado integer,
    siglas character varying(5) NOT NULL,
    bloque character varying(4) NOT NULL,
    ind_kilom_manzana character(1),
    num_kilom_manzana numeric(7,2),
    ind_bloq_poligono character(1),
    ind_acceso_compartido boolean,
    desc_bloq_poligono character varying(4) NOT NULL,
    valor_escalera integer,
    valor_planta integer,
    valor_puerta integer,
    toponimia character varying(25) NOT NULL,
    referencia_catastral_parc character varying(20) NOT NULL,
    entrada_principal boolean,
    observaciones character varying(25) NOT NULL,
    fuente_datos integer,
    id_parcela integer,
    tipo_portal integer,
    valor_sentido_pk integer,
    tipo_colectivo integer,
    tipo_inmueble integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.acceso OWNER TO postgres;

--
-- Name: codigo_postal_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.codigo_postal_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.codigo_postal_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE codigo_postal_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.codigo_postal_gid_seq IS 'secuencia para la clave primaria de los codigos postales';


--
-- Name: codigo_postal; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.codigo_postal (
    gid integer DEFAULT nextval('bd_territorios.codigo_postal_gid_seq'::regclass) NOT NULL,
    codigo_postal numeric(5,0) NOT NULL,
    geom public.geometry(Polygon,4326),
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.codigo_postal OWNER TO postgres;

--
-- Name: comunidad_autonoma_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.comunidad_autonoma_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.comunidad_autonoma_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE comunidad_autonoma_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.comunidad_autonoma_gid_seq IS 'secuencia para la clave primaria de comunidad autonoma';


--
-- Name: comunidad_autonoma; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.comunidad_autonoma (
    gid integer DEFAULT nextval('bd_territorios.comunidad_autonoma_gid_seq'::regclass) NOT NULL,
    cod_comu_autonoma integer NOT NULL,
    nombre_com_autonoma character varying(100) NOT NULL,
    id_pais integer NOT NULL,
    geom public.geometry(MultiSurface,4326),
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.comunidad_autonoma OWNER TO postgres;

--
-- Name: construccion_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.construccion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.construccion_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE construccion_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.construccion_gid_seq IS 'secuencia para la clave primaria de las construcciones';


--
-- Name: construccion; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.construccion (
    gid integer DEFAULT nextval('bd_territorios.construccion_gid_seq'::regclass) NOT NULL,
    cod_construccion integer NOT NULL,
    desc_construccion character varying(150) NOT NULL,
    id_parcela integer NOT NULL,
    id_direccion integer NOT NULL,
    geom public.geometry(Polygon,4326),
    tipo_construccion integer,
    fuente_datos integer,
    fecha_construccion date,
    fecha_reforma date,
    ind_protegido boolean,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.construccion OWNER TO postgres;

--
-- Name: direccion_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.direccion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.direccion_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE direccion_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.direccion_gid_seq IS 'secuencia para la clave primaria de las direcciones';


--
-- Name: direccion; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.direccion (
    gid integer DEFAULT nextval('bd_territorios.direccion_gid_seq'::regclass) NOT NULL,
    desc_direccion character varying(80) NOT NULL,
    ref_catastral character varying(20) NOT NULL,
    cod_tipo_inmueble integer,
    cod_tipo_colectivo integer,
    valor_escalera integer,
    valor_planta integer,
    valor_puerta character varying(10),
    observaciones character varying(150) NOT NULL,
    id_acceso integer,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.direccion OWNER TO postgres;

--
-- Name: div_territorial_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.div_territorial_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.div_territorial_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE div_territorial_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.div_territorial_gid_seq IS 'secuencia para la clave primaria de division territorial';


--
-- Name: division_territorial; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.division_territorial (
    gid integer DEFAULT nextval('bd_territorios.div_territorial_gid_seq'::regclass) NOT NULL,
    codigo character varying,
    id_municipio integer,
    desc_div_territorial character varying(80),
    id_div_terr_padre integer,
    ind_subdivision boolean,
    cod_tipo_div_terr integer,
    id_div_ter_pad integer,
    ind_valida_acc boolean,
    familia character varying(30),
    valido_desde date,
    valido_hasta date,
    ind_manzanas_cens boolean,
    ind_tram_editab boolean,
    ind_zonas_visibles boolean,
    ind_exis_tr_acc boolean,
    ind_no_paridad boolean,
    ind_nucleos_postal boolean,
    ind_copia_trab boolean,
    copiado_desde integer,
    fuente_datos integer,
    ind_vigente boolean,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.division_territorial OWNER TO postgres;

--
-- Name: entidad_colectiva_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.entidad_colectiva_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.entidad_colectiva_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE entidad_colectiva_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.entidad_colectiva_gid_seq IS 'secuencia para la clave primaria de entidades colectivas';


--
-- Name: entidad_colectiva; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.entidad_colectiva (
    gid integer DEFAULT nextval('bd_territorios.entidad_colectiva_gid_seq'::regclass) NOT NULL,
    cod_entidad_colectiva integer NOT NULL,
    desc_entidad_colectiva character varying(150) NOT NULL,
    id_municipio integer NOT NULL,
    geom public.geometry(MultiSurface,4326),
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.entidad_colectiva OWNER TO postgres;

--
-- Name: entidad_singular_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.entidad_singular_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.entidad_singular_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE entidad_singular_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.entidad_singular_gid_seq IS 'secuencia para la clave primaria de entidades singular';


--
-- Name: entidad_singular; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.entidad_singular (
    gid integer DEFAULT nextval('bd_territorios.entidad_singular_gid_seq'::regclass) NOT NULL,
    cod_entidad_singular integer NOT NULL,
    desc_entidad_singular character varying(150) NOT NULL,
    id_entidad_colectiva integer NOT NULL,
    geom public.geometry(MultiSurface,4326),
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.entidad_singular OWNER TO postgres;

--
-- Name: indicador_ambiental; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.indicador_ambiental (
    gid integer NOT NULL,
    id_construccion integer NOT NULL,
    tipo_indicador integer NOT NULL,
    nombre_indicador character varying(80) NOT NULL,
    valor_indicador numeric(9,2) NOT NULL,
    normativa character varying(80) NOT NULL,
    valor_min_permitido numeric(9,2) NOT NULL,
    valor_max_permitido numeric(9,2) NOT NULL,
    fecha_registro date,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.indicador_ambiental OWNER TO postgres;

--
-- Name: indicador_ambiental_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.indicador_ambiental_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.indicador_ambiental_gid_seq OWNER TO postgres;

--
-- Name: indicador_ambiental_gid_seq; Type: SEQUENCE OWNED BY; Schema: bd_territorios; Owner: postgres
--

ALTER SEQUENCE bd_territorios.indicador_ambiental_gid_seq OWNED BY bd_territorios.indicador_ambiental.gid;


--
-- Name: linea_auxiliar_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.linea_auxiliar_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.linea_auxiliar_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE linea_auxiliar_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.linea_auxiliar_gid_seq IS 'secuencia para la clave primaria de Linea Auxiliar';


--
-- Name: linea_auxiliar; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.linea_auxiliar (
    gid integer DEFAULT nextval('bd_territorios.linea_auxiliar_gid_seq'::regclass) NOT NULL,
    cod_linea_auxiliar integer NOT NULL,
    desc_linea_auxiliar character varying(150) NOT NULL,
    id_municipio integer NOT NULL,
    geom public.geometry(LineString,4326),
    tipo_linea_auxiliar integer,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.linea_auxiliar OWNER TO postgres;

--
-- Name: manzana_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.manzana_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.manzana_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE manzana_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.manzana_gid_seq IS 'secuencia para la clave primaria de las Manzanas';


--
-- Name: manzana; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.manzana (
    gid integer DEFAULT nextval('bd_territorios.manzana_gid_seq'::regclass) NOT NULL,
    cod_manzana integer NOT NULL,
    cod_manzana_ayto integer NOT NULL,
    desc_manzana character varying(150) NOT NULL,
    id_municipio integer NOT NULL,
    geom public.geometry(MultiSurface,4326),
    tipo_manzana integer,
    fuente_datos integer,
    hoja_parcelario character varying(4) NOT NULL,
    ref_plano_catas character varying(7) NOT NULL,
    ref_catastro character varying(5) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.manzana OWNER TO postgres;

--
-- Name: municipio_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.municipio_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.municipio_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE municipio_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.municipio_gid_seq IS 'secuencia para la clave primaria de municipios';


--
-- Name: municipio; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.municipio (
    gid integer DEFAULT nextval('bd_territorios.municipio_gid_seq'::regclass) NOT NULL,
    cod_municipio integer NOT NULL,
    desc_municipio character varying(150) NOT NULL,
    id_provincia integer NOT NULL,
    geom public.geometry(MultiSurface,4326),
    ind_calles_cod boolean,
    ind_calles_nt_codif boolean,
    ind_fachada_parcela boolean,
    direccion_ayuntamiento integer,
    direccion_dep_estad integer,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.municipio OWNER TO postgres;

--
-- Name: nucleo_diseminado_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.nucleo_diseminado_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.nucleo_diseminado_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE nucleo_diseminado_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.nucleo_diseminado_gid_seq IS 'secuencia para la clave primaria de nucleos diseminados';


--
-- Name: nucleo_diseminado; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.nucleo_diseminado (
    gid integer DEFAULT nextval('bd_territorios.nucleo_diseminado_gid_seq'::regclass) NOT NULL,
    cod_nucleo_diseminado integer NOT NULL,
    desc_nucleo_diseminado character varying(150) NOT NULL,
    id_entidad_singular integer NOT NULL,
    geom public.geometry(MultiSurface,4326),
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.nucleo_diseminado OWNER TO postgres;

--
-- Name: pais_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.pais_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.pais_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE pais_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.pais_gid_seq IS 'secuencia para la clave primaria de pais';


--
-- Name: pais; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.pais (
    gid integer DEFAULT nextval('bd_territorios.pais_gid_seq'::regclass) NOT NULL,
    cod_pais character varying(3) NOT NULL,
    nombre_pais character varying(159) NOT NULL,
    nombre_pais_eng character varying(100) NOT NULL,
    siglas_pais character varying(3) NOT NULL,
    nacionalidad character varying(159) NOT NULL,
    capital character varying(27),
    estado_europeo boolean,
    ind_prov_codif boolean,
    ind_com_auto_codif boolean,
    geom public.geometry(MultiPolygon,4326),
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.pais OWNER TO postgres;

--
-- Name: parcela_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.parcela_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.parcela_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE parcela_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.parcela_gid_seq IS 'secuencia para la clave primaria de las parcelas';


--
-- Name: parcela; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.parcela (
    gid integer DEFAULT nextval('bd_territorios.parcela_gid_seq'::regclass) NOT NULL,
    cod_parcela integer NOT NULL,
    cod_parcela_ayto integer NOT NULL,
    desc_parcela character varying(150) NOT NULL,
    id_manzana integer NOT NULL,
    geom public.geometry(Polygon,4326),
    ref_plano_catas character varying(7) NOT NULL,
    ref_parcela_catas character varying(7) NOT NULL,
    ind_parcela_inte boolean,
    tipo_parcela integer,
    superficie_parc numeric(9,2),
    superficie_bajo_ras numeric(9,2),
    superficie_sobre_ras numeric(9,2),
    superficie_cubierta numeric(9,2),
    cobertura integer,
    ref_catastral character varying(14) NOT NULL,
    clase_inmueble integer,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.parcela OWNER TO postgres;

--
-- Name: provincia_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.provincia_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.provincia_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE provincia_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.provincia_gid_seq IS 'secuencia para la clave primaria de provincia';


--
-- Name: provincia; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.provincia (
    gid integer DEFAULT nextval('bd_territorios.provincia_gid_seq'::regclass) NOT NULL,
    cod_provincia integer NOT NULL,
    desc_provincia character varying(100) NOT NULL,
    id_comunidad_autonoma integer NOT NULL,
    geom public.geometry(MultiSurface,4326),
    ind_muni_codif boolean,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.provincia OWNER TO postgres;

--
-- Name: rel_vial_municipio; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.rel_vial_municipio (
    gid integer NOT NULL,
    id_vial integer NOT NULL,
    id_municipio integer NOT NULL,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.rel_vial_municipio OWNER TO postgres;

--
-- Name: rel_vial_municipio_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.rel_vial_municipio_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.rel_vial_municipio_gid_seq OWNER TO postgres;

--
-- Name: rel_vial_municipio_gid_seq; Type: SEQUENCE OWNED BY; Schema: bd_territorios; Owner: postgres
--

ALTER SEQUENCE bd_territorios.rel_vial_municipio_gid_seq OWNED BY bd_territorios.rel_vial_municipio.gid;


--
-- Name: rel_vial_tramo; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.rel_vial_tramo (
    gid integer NOT NULL,
    id_vial integer NOT NULL,
    id_tramo integer NOT NULL,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.rel_vial_tramo OWNER TO postgres;

--
-- Name: rel_vial_tramo_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.rel_vial_tramo_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.rel_vial_tramo_gid_seq OWNER TO postgres;

--
-- Name: rel_vial_tramo_gid_seq; Type: SEQUENCE OWNED BY; Schema: bd_territorios; Owner: postgres
--

ALTER SEQUENCE bd_territorios.rel_vial_tramo_gid_seq OWNED BY bd_territorios.rel_vial_tramo.gid;


--
-- Name: rel_zona_manzana_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.rel_zona_manzana_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_territorios.rel_zona_manzana_gid_seq OWNER TO postgres;

--
-- Name: rel_zona_manzana; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.rel_zona_manzana (
    gid integer DEFAULT nextval('bd_territorios.rel_zona_manzana_gid_seq'::regclass) NOT NULL,
    id_zona integer NOT NULL,
    id_manzana integer NOT NULL,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.rel_zona_manzana OWNER TO postgres;

--
-- Name: rel_zona_parcela_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.rel_zona_parcela_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_territorios.rel_zona_parcela_gid_seq OWNER TO postgres;

--
-- Name: rel_zona_parcela; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.rel_zona_parcela (
    gid integer DEFAULT nextval('bd_territorios.rel_zona_parcela_gid_seq'::regclass) NOT NULL,
    id_zona integer NOT NULL,
    id_parcela integer NOT NULL,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.rel_zona_parcela OWNER TO postgres;

--
-- Name: rel_zona_tramo_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.rel_zona_tramo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE bd_territorios.rel_zona_tramo_gid_seq OWNER TO postgres;

--
-- Name: rel_zona_tramo; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.rel_zona_tramo (
    gid integer DEFAULT nextval('bd_territorios.rel_zona_tramo_gid_seq'::regclass) NOT NULL,
    id_zona integer NOT NULL,
    id_tramo integer NOT NULL,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.rel_zona_tramo OWNER TO postgres;

--
-- Name: toponimo_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.toponimo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.toponimo_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE toponimo_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.toponimo_gid_seq IS 'secuencia para la clave primaria de Toponimos';


--
-- Name: toponimo; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.toponimo (
    gid integer DEFAULT nextval('bd_territorios.toponimo_gid_seq'::regclass) NOT NULL,
    cod_toponimo integer NOT NULL,
    desc_toponimo character varying(150) NOT NULL,
    id_municipio integer NOT NULL,
    geom public.geometry(Point,4326),
    tipo_toponimo integer,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.toponimo OWNER TO postgres;

--
-- Name: tramo_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.tramo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.tramo_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE tramo_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.tramo_gid_seq IS 'secuencia para la clave primaria de los tramos';


--
-- Name: tramo; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.tramo (
    gid integer DEFAULT nextval('bd_territorios.tramo_gid_seq'::regclass) NOT NULL,
    cod_tramo integer NOT NULL,
    desc_tramo character varying(150) NOT NULL,
    desc_tramo_corto character varying(50) NOT NULL,
    siglas_acronimo character varying(50) NOT NULL,
    tipo_tramo integer,
    tipo_acceso integer,
    codigo_fonetico character varying(10) NOT NULL,
    geom public.geometry(LineString,4326),
    cod_acceso_inicial integer,
    cod_acceso_final integer,
    sentido integer,
    num_tramo integer,
    manzana_catastral integer,
    tipo_calzada integer,
    tipo_clase integer,
    tipo_estado_fisico integer,
    valor_firme integer,
    longitud numeric(9,2),
    num_carriles integer,
    fuente_datos integer,
    orden integer,
    tipo_situacion integer,
    tipo_vehiculo integer,
    tipo_titular integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.tramo OWNER TO postgres;

--
-- Name: vial_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.vial_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.vial_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE vial_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.vial_gid_seq IS 'secuencia para la clave primaria de vial';


--
-- Name: vial; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.vial (
    gid integer DEFAULT nextval('bd_territorios.vial_gid_seq'::regclass) NOT NULL,
    cod_vial integer NOT NULL,
    desc_vial character varying(150) NOT NULL,
    desc_vial_corto character varying(50) NOT NULL,
    siglas_acronimo character varying(50) NOT NULL,
    tipo_vial integer,
    codigo_fonetico character varying(10) NOT NULL,
    geom public.geometry(Polygon,4326),
    ind_denom_hist boolean,
    ind_sinonimo boolean,
    fecha_aprob date,
    nombre_ofic_aprob character varying(100) NOT NULL,
    observaciones character varying(255) NOT NULL,
    num_inic_par character varying(5) NOT NULL,
    dup_num_inic_par character varying(5) NOT NULL,
    num_fin_par character varying(5) NOT NULL,
    dup_num_fin_par character varying(5) NOT NULL,
    num_inic_impar character varying(5) NOT NULL,
    dup_num_inic_impar character varying(5) NOT NULL,
    num_fin_impar character varying(5) NOT NULL,
    dup_num_fin_impar character varying(5) NOT NULL,
    vial_entrada integer,
    vial_salida integer,
    sentido integer,
    longitud numeric(9,2),
    fecha_rotulacion date,
    fuente_datos integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.vial OWNER TO postgres;

--
-- Name: zona_gid_seq; Type: SEQUENCE; Schema: bd_territorios; Owner: postgres
--

CREATE SEQUENCE bd_territorios.zona_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_territorios.zona_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE zona_gid_seq; Type: COMMENT; Schema: bd_territorios; Owner: postgres
--

COMMENT ON SEQUENCE bd_territorios.zona_gid_seq IS 'secuencia para la clave primaria de zonas';


--
-- Name: zona; Type: TABLE; Schema: bd_territorios; Owner: postgres
--

CREATE TABLE bd_territorios.zona (
    gid integer DEFAULT nextval('bd_territorios.zona_gid_seq'::regclass) NOT NULL,
    id_div_territorial integer,
    cod_zona_ter character varying(30),
    desc_zona_ter character varying(30),
    id_zona_padre integer,
    superficie integer,
    superficie_comp integer,
    fecha_alta_zona_pad date,
    fecha_inser_zona_hij date,
    fecha_inser_tram_rel date,
    cod_postal_zona character varying(30),
    copiado_desde integer,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE bd_territorios.zona OWNER TO postgres;

--
-- Name: estado_gid_seq; Type: SEQUENCE; Schema: cat_global; Owner: postgres
--

CREATE SEQUENCE cat_global.estado_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_global.estado_gid_seq OWNER TO postgres;

--
-- Name: cat_valor_estado; Type: TABLE; Schema: cat_global; Owner: postgres
--

CREATE TABLE cat_global.cat_valor_estado (
    gid integer DEFAULT nextval('cat_global.estado_gid_seq'::regclass) NOT NULL,
    codigo integer NOT NULL,
    desc_estado character varying(25) NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    ind_vigente boolean DEFAULT true NOT NULL
);


ALTER TABLE cat_global.cat_valor_estado OWNER TO postgres;

--
-- Name: fuente_gid_seq; Type: SEQUENCE; Schema: cat_global; Owner: postgres
--

CREATE SEQUENCE cat_global.fuente_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_global.fuente_gid_seq OWNER TO postgres;

--
-- Name: cat_valor_fuente; Type: TABLE; Schema: cat_global; Owner: postgres
--

CREATE TABLE cat_global.cat_valor_fuente (
    gid integer DEFAULT nextval('cat_global.fuente_gid_seq'::regclass) NOT NULL,
    desc_fuente character varying(50) NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    codigo integer NOT NULL,
    estado integer DEFAULT 2 NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL
);


ALTER TABLE cat_global.cat_valor_fuente OWNER TO postgres;

--
-- Name: idioma_gid_seq; Type: SEQUENCE; Schema: cat_terceros; Owner: postgres
--

CREATE SEQUENCE cat_terceros.idioma_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_terceros.idioma_gid_seq OWNER TO postgres;

--
-- Name: cat_idioma; Type: TABLE; Schema: cat_terceros; Owner: postgres
--

CREATE TABLE cat_terceros.cat_idioma (
    gid integer DEFAULT nextval('cat_terceros.idioma_gid_seq'::regclass) NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion character varying(150) NOT NULL,
    cod_pais integer,
    idioma_part_bdc integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp(),
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_terceros.cat_idioma OWNER TO postgres;

--
-- Name: profesion_gid_seq; Type: SEQUENCE; Schema: cat_terceros; Owner: postgres
--

CREATE SEQUENCE cat_terceros.profesion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_terceros.profesion_gid_seq OWNER TO postgres;

--
-- Name: cat_profesion; Type: TABLE; Schema: cat_terceros; Owner: postgres
--

CREATE TABLE cat_terceros.cat_profesion (
    gid integer DEFAULT nextval('cat_terceros.profesion_gid_seq'::regclass) NOT NULL,
    codigo integer NOT NULL,
    descripcion character varying(150) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_terceros.cat_profesion OWNER TO postgres;

--
-- Name: status_gid_seq; Type: SEQUENCE; Schema: cat_terceros; Owner: postgres
--

CREATE SEQUENCE cat_terceros.status_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_terceros.status_gid_seq OWNER TO postgres;

--
-- Name: cat_status; Type: TABLE; Schema: cat_terceros; Owner: postgres
--

CREATE TABLE cat_terceros.cat_status (
    gid integer DEFAULT nextval('cat_terceros.status_gid_seq'::regclass) NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion character varying(80) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_terceros.cat_status OWNER TO postgres;

--
-- Name: tipo_canal_notif_gid_seq; Type: SEQUENCE; Schema: cat_terceros; Owner: postgres
--

CREATE SEQUENCE cat_terceros.tipo_canal_notif_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_terceros.tipo_canal_notif_gid_seq OWNER TO postgres;

--
-- Name: cat_tipo_canal_not; Type: TABLE; Schema: cat_terceros; Owner: postgres
--

CREATE TABLE cat_terceros.cat_tipo_canal_not (
    gid integer DEFAULT nextval('cat_terceros.tipo_canal_notif_gid_seq'::regclass) NOT NULL,
    codigo character varying(20) NOT NULL,
    descripcion character varying(150) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_terceros.cat_tipo_canal_not OWNER TO postgres;

--
-- Name: tipo_direccion_gid_seq; Type: SEQUENCE; Schema: cat_terceros; Owner: postgres
--

CREATE SEQUENCE cat_terceros.tipo_direccion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_terceros.tipo_direccion_gid_seq OWNER TO postgres;

--
-- Name: cat_tipo_direccion; Type: TABLE; Schema: cat_terceros; Owner: postgres
--

CREATE TABLE cat_terceros.cat_tipo_direccion (
    gid integer DEFAULT nextval('cat_terceros.tipo_direccion_gid_seq'::regclass) NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion character varying(150) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_terceros.cat_tipo_direccion OWNER TO postgres;

--
-- Name: tipo_genero_gid_seq; Type: SEQUENCE; Schema: cat_terceros; Owner: postgres
--

CREATE SEQUENCE cat_terceros.tipo_genero_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_terceros.tipo_genero_gid_seq OWNER TO postgres;

--
-- Name: cat_tipo_genero; Type: TABLE; Schema: cat_terceros; Owner: postgres
--

CREATE TABLE cat_terceros.cat_tipo_genero (
    gid integer DEFAULT nextval('cat_terceros.tipo_genero_gid_seq'::regclass) NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion character varying(80) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_terceros.cat_tipo_genero OWNER TO postgres;

--
-- Name: tipo_nif_gid_seq; Type: SEQUENCE; Schema: cat_terceros; Owner: postgres
--

CREATE SEQUENCE cat_terceros.tipo_nif_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_terceros.tipo_nif_gid_seq OWNER TO postgres;

--
-- Name: cat_tipo_nif; Type: TABLE; Schema: cat_terceros; Owner: postgres
--

CREATE TABLE cat_terceros.cat_tipo_nif (
    gid integer DEFAULT nextval('cat_terceros.tipo_nif_gid_seq'::regclass) NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion character varying(80) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_terceros.cat_tipo_nif OWNER TO postgres;

--
-- Name: tipo_reg_matrimonial_gid_seq; Type: SEQUENCE; Schema: cat_terceros; Owner: postgres
--

CREATE SEQUENCE cat_terceros.tipo_reg_matrimonial_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_terceros.tipo_reg_matrimonial_gid_seq OWNER TO postgres;

--
-- Name: cat_tipo_reg_matrimonial; Type: TABLE; Schema: cat_terceros; Owner: postgres
--

CREATE TABLE cat_terceros.cat_tipo_reg_matrimonial (
    gid integer DEFAULT nextval('cat_terceros.tipo_reg_matrimonial_gid_seq'::regclass) NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion character varying(80) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_terceros.cat_tipo_reg_matrimonial OWNER TO postgres;

--
-- Name: tipo_relacion_gid_seq; Type: SEQUENCE; Schema: cat_terceros; Owner: postgres
--

CREATE SEQUENCE cat_terceros.tipo_relacion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_terceros.tipo_relacion_gid_seq OWNER TO postgres;

--
-- Name: cat_tipo_relacion; Type: TABLE; Schema: cat_terceros; Owner: postgres
--

CREATE TABLE cat_terceros.cat_tipo_relacion (
    gid integer DEFAULT nextval('cat_terceros.tipo_relacion_gid_seq'::regclass) NOT NULL,
    codigo integer NOT NULL,
    descripcion character varying(80) NOT NULL,
    ind_grupo boolean,
    ind_representante boolean,
    ind_conyugal boolean,
    cod_regimen_matrimonial integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_terceros.cat_tipo_relacion OWNER TO postgres;

--
-- Name: tipo_tercero_gid_seq; Type: SEQUENCE; Schema: cat_terceros; Owner: postgres
--

CREATE SEQUENCE cat_terceros.tipo_tercero_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_terceros.tipo_tercero_gid_seq OWNER TO postgres;

--
-- Name: cat_tipo_tercero; Type: TABLE; Schema: cat_terceros; Owner: postgres
--

CREATE TABLE cat_terceros.cat_tipo_tercero (
    gid integer DEFAULT nextval('cat_terceros.tipo_tercero_gid_seq'::regclass) NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion character varying(150) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_terceros.cat_tipo_tercero OWNER TO postgres;

--
-- Name: cat_tipo_calzada; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_tipo_calzada (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    ind_vigente boolean DEFAULT true NOT NULL,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_tipo_calzada OWNER TO postgres;

--
-- Name: cat_tipo_colectivo; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_tipo_colectivo (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(50) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_tipo_colectivo OWNER TO postgres;

--
-- Name: tipo_div_ter_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.tipo_div_ter_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.tipo_div_ter_seq OWNER TO postgres;

--
-- Name: cat_tipo_div_territorial; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_tipo_div_territorial (
    gid integer DEFAULT nextval('cat_territorios.tipo_div_ter_seq'::regclass) NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_tipo_div_territorial OWNER TO postgres;

--
-- Name: cat_tipo_indicador_amb; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_tipo_indicador_amb (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_tipo_indicador_amb OWNER TO postgres;

--
-- Name: cat_tipo_inmueble; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_tipo_inmueble (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_tipo_inmueble OWNER TO postgres;

--
-- Name: cat_tipo_portal; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_tipo_portal (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_tipo_portal OWNER TO postgres;

--
-- Name: cat_tipo_portal_pk; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_tipo_portal_pk (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_tipo_portal_pk OWNER TO postgres;

--
-- Name: cat_valor_acceso; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_acceso (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_acceso OWNER TO postgres;

--
-- Name: valoracceso_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valoracceso_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valoracceso_gid_seq OWNER TO postgres;

--
-- Name: valoracceso_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valoracceso_gid_seq OWNED BY cat_territorios.cat_valor_acceso.gid;


--
-- Name: cat_valor_acceso_pk; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_acceso_pk (
    gid integer DEFAULT nextval('cat_territorios.valoracceso_gid_seq'::regclass) NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_acceso_pk OWNER TO postgres;

--
-- Name: cat_valor_clase; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_clase (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_clase OWNER TO postgres;

--
-- Name: cat_valor_estado; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_estado (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_estado character varying(25) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date
);


ALTER TABLE cat_territorios.cat_valor_estado OWNER TO postgres;

--
-- Name: cat_valor_estado_fisico; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_estado_fisico (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_estado_fisico OWNER TO postgres;

--
-- Name: cat_valor_firme; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_firme (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_firme OWNER TO postgres;

--
-- Name: cat_valor_fuente; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_fuente (
    gid integer NOT NULL,
    desc_fuente character varying(50) NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    codigo integer NOT NULL,
    estado integer DEFAULT 2 NOT NULL
);


ALTER TABLE cat_territorios.cat_valor_fuente OWNER TO postgres;

--
-- Name: cat_valor_orden; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_orden (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_orden OWNER TO postgres;

--
-- Name: cat_valor_sentido; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_sentido (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_sentido OWNER TO postgres;

--
-- Name: cat_valor_sentido_pk; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_sentido_pk (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_sentido_pk OWNER TO postgres;

--
-- Name: cat_valor_situacion; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_situacion (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_situacion OWNER TO postgres;

--
-- Name: cat_valor_tipo_linea_aux; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_tipo_linea_aux (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_tipo_linea_aux OWNER TO postgres;

--
-- Name: cat_valor_tipo_vial; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_tipo_vial (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_tipo_vial OWNER TO postgres;

--
-- Name: valortipovial_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valortipovial_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valortipovial_gid_seq OWNER TO postgres;

--
-- Name: valortipovial_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valortipovial_gid_seq OWNED BY cat_territorios.cat_valor_tipo_vial.gid;


--
-- Name: cat_valor_tipo_toponimo; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_tipo_toponimo (
    gid integer DEFAULT nextval('cat_territorios.valortipovial_gid_seq'::regclass) NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_tipo_toponimo OWNER TO postgres;

--
-- Name: cat_valor_tipo_tramo; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_tipo_tramo (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_tipo_tramo OWNER TO postgres;

--
-- Name: cat_valor_tipo_vehic; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_tipo_vehic (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_tipo_vehic OWNER TO postgres;

--
-- Name: cat_valor_titular; Type: TABLE; Schema: cat_territorios; Owner: postgres
--

CREATE TABLE cat_territorios.cat_valor_titular (
    gid integer NOT NULL,
    codigo integer NOT NULL,
    desc_codigo character varying(80) NOT NULL,
    fuente integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE cat_territorios.cat_valor_titular OWNER TO postgres;

--
-- Name: estado_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.estado_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.estado_gid_seq OWNER TO postgres;

--
-- Name: estado_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.estado_gid_seq OWNED BY cat_territorios.cat_valor_estado.gid;


--
-- Name: fuente_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.fuente_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.fuente_gid_seq OWNER TO postgres;

--
-- Name: fuente_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.fuente_gid_seq OWNED BY cat_territorios.cat_valor_fuente.gid;


--
-- Name: indicador_ambiental_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.indicador_ambiental_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.indicador_ambiental_gid_seq OWNER TO postgres;

--
-- Name: indicador_ambiental_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.indicador_ambiental_gid_seq OWNED BY cat_territorios.cat_tipo_indicador_amb.gid;


--
-- Name: tipo_colectivo_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.tipo_colectivo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.tipo_colectivo_gid_seq OWNER TO postgres;

--
-- Name: tipo_colectivo_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.tipo_colectivo_gid_seq OWNED BY cat_territorios.cat_tipo_colectivo.gid;


--
-- Name: tipo_inmueble_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.tipo_inmueble_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.tipo_inmueble_gid_seq OWNER TO postgres;

--
-- Name: tipo_inmueble_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.tipo_inmueble_gid_seq OWNED BY cat_territorios.cat_tipo_inmueble.gid;


--
-- Name: tipocalzada_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.tipocalzada_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.tipocalzada_gid_seq OWNER TO postgres;

--
-- Name: tipocalzada_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.tipocalzada_gid_seq OWNED BY cat_territorios.cat_tipo_calzada.gid;


--
-- Name: tipoportal_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.tipoportal_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.tipoportal_gid_seq OWNER TO postgres;

--
-- Name: tipoportal_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.tipoportal_gid_seq OWNED BY cat_territorios.cat_tipo_portal.gid;


--
-- Name: tipoportal_pk_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.tipoportal_pk_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.tipoportal_pk_gid_seq OWNER TO postgres;

--
-- Name: tipoportal_pk_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.tipoportal_pk_gid_seq OWNED BY cat_territorios.cat_tipo_portal_pk.gid;


--
-- Name: valor_firme_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valor_firme_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.valor_firme_gid_seq OWNER TO postgres;

--
-- Name: valor_firme_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valor_firme_gid_seq OWNED BY cat_territorios.cat_valor_firme.gid;


--
-- Name: valoracceso_pk_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valoracceso_pk_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.valoracceso_pk_gid_seq OWNER TO postgres;

--
-- Name: valoracceso_pk_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valoracceso_pk_gid_seq OWNED BY cat_territorios.cat_valor_acceso_pk.gid;


--
-- Name: valorclase_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valorclase_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valorclase_gid_seq OWNER TO postgres;

--
-- Name: valorclase_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valorclase_gid_seq OWNED BY cat_territorios.cat_valor_clase.gid;


--
-- Name: valorestadofisico_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valorestadofisico_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valorestadofisico_gid_seq OWNER TO postgres;

--
-- Name: valorestadofisico_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valorestadofisico_gid_seq OWNED BY cat_territorios.cat_valor_estado_fisico.gid;


--
-- Name: valorlineaaux_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valorlineaaux_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE cat_territorios.valorlineaaux_gid_seq OWNER TO postgres;

--
-- Name: valorlineaaux_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valorlineaaux_gid_seq OWNED BY cat_territorios.cat_valor_tipo_linea_aux.gid;


--
-- Name: valororden_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valororden_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valororden_gid_seq OWNER TO postgres;

--
-- Name: valororden_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valororden_gid_seq OWNED BY cat_territorios.cat_valor_orden.gid;


--
-- Name: valorsentido_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valorsentido_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valorsentido_gid_seq OWNER TO postgres;

--
-- Name: valorsentido_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valorsentido_gid_seq OWNED BY cat_territorios.cat_valor_sentido.gid;


--
-- Name: valorsentidopk_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valorsentidopk_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valorsentidopk_gid_seq OWNER TO postgres;

--
-- Name: valorsentidopk_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valorsentidopk_gid_seq OWNED BY cat_territorios.cat_valor_sentido_pk.gid;


--
-- Name: valorsituacion_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valorsituacion_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valorsituacion_gid_seq OWNER TO postgres;

--
-- Name: valorsituacion_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valorsituacion_gid_seq OWNED BY cat_territorios.cat_valor_situacion.gid;


--
-- Name: valortipotramo_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valortipotramo_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valortipotramo_gid_seq OWNER TO postgres;

--
-- Name: valortipotramo_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valortipotramo_gid_seq OWNED BY cat_territorios.cat_valor_tipo_tramo.gid;


--
-- Name: valortipovehic_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valortipovehic_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valortipovehic_gid_seq OWNER TO postgres;

--
-- Name: valortipovehic_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valortipovehic_gid_seq OWNED BY cat_territorios.cat_valor_tipo_vehic.gid;


--
-- Name: valortitular_gid_seq; Type: SEQUENCE; Schema: cat_territorios; Owner: postgres
--

CREATE SEQUENCE cat_territorios.valortitular_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cat_territorios.valortitular_gid_seq OWNER TO postgres;

--
-- Name: valortitular_gid_seq; Type: SEQUENCE OWNED BY; Schema: cat_territorios; Owner: postgres
--

ALTER SEQUENCE cat_territorios.valortitular_gid_seq OWNED BY cat_territorios.cat_valor_titular.gid;


--
-- Name: empresa_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.empresa_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.empresa_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE empresa_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.empresa_gid_seq IS 'secuencia para la clave primaria de la tabla empresa';


--
-- Name: empresa; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.empresa (
    gid integer DEFAULT nextval('topology_earth.empresa_gid_seq'::regclass) NOT NULL,
    cod_empresa integer NOT NULL,
    nombre_empresa character varying(100) NOT NULL,
    siglas_empresa character varying(2),
    direccion character varying(50),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.empresa OWNER TO postgres;

--
-- Name: grupo_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.grupo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.grupo_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE grupo_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.grupo_gid_seq IS 'secuencia para la clave primaria de la tabla grupo';


--
-- Name: grupo; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.grupo (
    gid integer DEFAULT nextval('topology_earth.grupo_gid_seq'::regclass) NOT NULL,
    cod_grupo integer NOT NULL,
    nombre_grupo character varying(100) NOT NULL,
    siglas_grupo character varying(2),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.grupo OWNER TO postgres;

--
-- Name: organizacion_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.organizacion_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.organizacion_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE organizacion_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.organizacion_gid_seq IS 'secuencia para la clave primaria de la tabla organizacion';


--
-- Name: nivel_organizacion; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.nivel_organizacion (
    gid integer DEFAULT nextval('topology_earth.organizacion_gid_seq'::regclass) NOT NULL,
    cod_organizacion integer NOT NULL,
    id_organi_padre integer NOT NULL,
    nombre_organizacion character varying(100) NOT NULL,
    siglas_organizacion character varying(2),
    observaciones character varying(100),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.nivel_organizacion OWNER TO postgres;

--
-- Name: permiso_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.permiso_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.permiso_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE permiso_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.permiso_gid_seq IS 'secuencia para la clave primaria de la tabla permisos';


--
-- Name: permiso; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.permiso (
    gid integer DEFAULT nextval('topology_earth.permiso_gid_seq'::regclass) NOT NULL,
    cod_permiso integer NOT NULL,
    nombre_permiso character varying(100) NOT NULL,
    descripcion character varying(50),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.permiso OWNER TO postgres;

--
-- Name: puesto_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.puesto_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.puesto_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE puesto_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.puesto_gid_seq IS 'secuencia para la clave primaria de la tabla puesto';


--
-- Name: puesto; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.puesto (
    gid integer DEFAULT nextval('topology_earth.puesto_gid_seq'::regclass) NOT NULL,
    cod_puesto integer NOT NULL,
    nombre_puesto character varying(100) NOT NULL,
    siglas_puesto character varying(2),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.puesto OWNER TO postgres;

--
-- Name: rel_empre_grupo_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.rel_empre_grupo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.rel_empre_grupo_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rel_empre_grupo_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.rel_empre_grupo_gid_seq IS 'secuencia para la clave primaria de la tabla relacion empresa grupo';


--
-- Name: rel_empre_grupo; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.rel_empre_grupo (
    gid integer DEFAULT nextval('topology_earth.rel_empre_grupo_gid_seq'::regclass) NOT NULL,
    id_empresa integer NOT NULL,
    id_grupo integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.rel_empre_grupo OWNER TO postgres;

--
-- Name: rel_grupo_rol_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.rel_grupo_rol_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.rel_grupo_rol_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rel_grupo_rol_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.rel_grupo_rol_gid_seq IS 'secuencia para la clave primaria de la tabla relacion grupos y roles';


--
-- Name: rel_grupo_rol; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.rel_grupo_rol (
    gid integer DEFAULT nextval('topology_earth.rel_grupo_rol_gid_seq'::regclass) NOT NULL,
    id_grupo integer NOT NULL,
    id_rol integer NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.rel_grupo_rol OWNER TO postgres;

--
-- Name: rel_orga_grupo; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.rel_orga_grupo (
    gid integer DEFAULT nextval('topology_earth.rel_empre_grupo_gid_seq'::regclass) NOT NULL,
    id_organizacion integer NOT NULL,
    id_grupo integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.rel_orga_grupo OWNER TO postgres;

--
-- Name: rel_rol_permiso_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.rel_rol_permiso_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.rel_rol_permiso_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rel_rol_permiso_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.rel_rol_permiso_gid_seq IS 'secuencia para la clave primaria de la tabla relacion usuario rol permiso';


--
-- Name: rel_rol_permiso; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.rel_rol_permiso (
    gid integer DEFAULT nextval('topology_earth.rel_rol_permiso_gid_seq'::regclass) NOT NULL,
    id_rol integer NOT NULL,
    id_permiso integer NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.rel_rol_permiso OWNER TO postgres;

--
-- Name: rel_usuario_grupo_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.rel_usuario_grupo_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.rel_usuario_grupo_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rel_usuario_grupo_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.rel_usuario_grupo_gid_seq IS 'secuencia para la clave primaria de la tabla relacion usuario grupo';


--
-- Name: rel_usuario_grupo; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.rel_usuario_grupo (
    gid integer DEFAULT nextval('topology_earth.rel_usuario_grupo_gid_seq'::regclass) NOT NULL,
    id_usuario integer NOT NULL,
    id_grupo integer NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.rel_usuario_grupo OWNER TO postgres;

--
-- Name: rel_usuario_rol_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.rel_usuario_rol_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.rel_usuario_rol_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rel_usuario_rol_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.rel_usuario_rol_gid_seq IS 'secuencia para la clave primaria de la tabla relacion usuario rolo';


--
-- Name: rel_usuario_rol; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.rel_usuario_rol (
    gid integer DEFAULT nextval('topology_earth.rel_usuario_rol_gid_seq'::regclass) NOT NULL,
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.rel_usuario_rol OWNER TO postgres;

--
-- Name: rol_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.rol_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.rol_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE rol_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.rol_gid_seq IS 'secuencia para la clave primaria de la tabla rol';


--
-- Name: rol; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.rol (
    gid integer DEFAULT nextval('topology_earth.rol_gid_seq'::regclass) NOT NULL,
    cod_rol integer NOT NULL,
    nombre_rol character varying(100) NOT NULL,
    descripcion character varying(50),
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.rol OWNER TO postgres;

--
-- Name: usuario_empleado_gid_seq; Type: SEQUENCE; Schema: topology_earth; Owner: postgres
--

CREATE SEQUENCE topology_earth.usuario_empleado_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE topology_earth.usuario_empleado_gid_seq OWNER TO postgres;

--
-- Name: SEQUENCE usuario_empleado_gid_seq; Type: COMMENT; Schema: topology_earth; Owner: postgres
--

COMMENT ON SEQUENCE topology_earth.usuario_empleado_gid_seq IS 'secuencia para la clave primaria de la tabla usuario_empleado';


--
-- Name: usuario_empleado; Type: TABLE; Schema: topology_earth; Owner: postgres
--

CREATE TABLE topology_earth.usuario_empleado (
    gid integer DEFAULT nextval('topology_earth.usuario_empleado_gid_seq'::regclass) NOT NULL,
    cod_usuario_empleado integer NOT NULL,
    nombre_usuario_empleado character varying(100) NOT NULL,
    descripcion character varying(50),
    id_puesto integer,
    id_nivel_organizacion integer,
    id_ext_tercero integer,
    id_ext_direccion integer,
    ind_vigente boolean DEFAULT true NOT NULL,
    fuente_datos integer,
    alta_db date DEFAULT clock_timestamp() NOT NULL,
    baja_db date,
    estado integer DEFAULT 2 NOT NULL,
    CONSTRAINT gid_check CHECK (((gid > 0) AND (gid <= 998999)))
);


ALTER TABLE topology_earth.usuario_empleado OWNER TO postgres;

--
-- Name: indicador_ambiental gid; Type: DEFAULT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.indicador_ambiental ALTER COLUMN gid SET DEFAULT nextval('bd_territorios.indicador_ambiental_gid_seq'::regclass);


--
-- Name: rel_vial_municipio gid; Type: DEFAULT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_municipio ALTER COLUMN gid SET DEFAULT nextval('bd_territorios.rel_vial_municipio_gid_seq'::regclass);


--
-- Name: rel_vial_tramo gid; Type: DEFAULT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_tramo ALTER COLUMN gid SET DEFAULT nextval('bd_territorios.rel_vial_tramo_gid_seq'::regclass);


--
-- Name: cat_tipo_calzada gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_calzada ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.tipocalzada_gid_seq'::regclass);


--
-- Name: cat_tipo_colectivo gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_colectivo ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.tipo_colectivo_gid_seq'::regclass);


--
-- Name: cat_tipo_indicador_amb gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_indicador_amb ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.indicador_ambiental_gid_seq'::regclass);


--
-- Name: cat_tipo_inmueble gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_inmueble ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.tipo_inmueble_gid_seq'::regclass);


--
-- Name: cat_tipo_portal gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_portal ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.tipoportal_gid_seq'::regclass);


--
-- Name: cat_tipo_portal_pk gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_portal_pk ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.tipoportal_pk_gid_seq'::regclass);


--
-- Name: cat_valor_acceso gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_acceso ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valoracceso_gid_seq'::regclass);


--
-- Name: cat_valor_clase gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_clase ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valorclase_gid_seq'::regclass);


--
-- Name: cat_valor_estado gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_estado ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.estado_gid_seq'::regclass);


--
-- Name: cat_valor_estado_fisico gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_estado_fisico ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valorestadofisico_gid_seq'::regclass);


--
-- Name: cat_valor_firme gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_firme ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valor_firme_gid_seq'::regclass);


--
-- Name: cat_valor_fuente gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_fuente ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.fuente_gid_seq'::regclass);


--
-- Name: cat_valor_orden gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_orden ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valororden_gid_seq'::regclass);


--
-- Name: cat_valor_sentido gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_sentido ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valorsentido_gid_seq'::regclass);


--
-- Name: cat_valor_sentido_pk gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_sentido_pk ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valorsentidopk_gid_seq'::regclass);


--
-- Name: cat_valor_situacion gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_situacion ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valorsituacion_gid_seq'::regclass);


--
-- Name: cat_valor_tipo_linea_aux gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_linea_aux ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valorlineaaux_gid_seq'::regclass);


--
-- Name: cat_valor_tipo_tramo gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_tramo ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valortipotramo_gid_seq'::regclass);


--
-- Name: cat_valor_tipo_vehic gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_vehic ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valortipovehic_gid_seq'::regclass);


--
-- Name: cat_valor_tipo_vial gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_vial ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valortipovial_gid_seq'::regclass);


--
-- Name: cat_valor_titular gid; Type: DEFAULT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_titular ALTER COLUMN gid SET DEFAULT nextval('cat_territorios.valortitular_gid_seq'::regclass);


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.empresa (gid, cod_empresa, nombre_empresa, siglas_empresa, direccion, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
10	1	UPDATED NOMBRE 1	UTEST1	UPDATED DIRECCION TEST1	t	32	2023-12-14	\N	2
\.


--
-- Data for Name: grupo; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.grupo (gid, cod_grupo, nombre_grupo, siglas_grupo, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: nivel_organizacion; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.nivel_organizacion (gid, cod_organizacion, id_organi_padre, nombre_organizacion, siglas_organizacion, observaciones, ind_vigente, fuente_datos, alta_db, baja_db, estado, id_empresa) FROM stdin;
\.


--
-- Data for Name: permiso; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.permiso (gid, cod_permiso, nombre_permiso, descripcion, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: puesto; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.puesto (gid, cod_puesto, nombre_puesto, siglas_puesto, ind_vigente, fuente_datos, alta_db, baja_db, estado, id_empresa) FROM stdin;
\.


--
-- Data for Name: rel_grupo_rol; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.rel_grupo_rol (gid, id_grupo, id_rol, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_orga_grupo; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.rel_orga_grupo (gid, id_organizacion, id_grupo, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_rol_permiso; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.rel_rol_permiso (gid, id_rol, id_permiso, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_usuario_grupo; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.rel_usuario_grupo (gid, id_usuario, id_grupo, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_usuario_rol; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.rel_usuario_rol (gid, id_usuario, id_rol, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.rol (gid, cod_rol, nombre_rol, descripcion, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: usuario_empleado; Type: TABLE DATA; Schema: bd_empleados; Owner: postgres
--

COPY bd_empleados.usuario_empleado (gid, cod_usuario_empleado, nombre_usuario_empleado, descripcion, id_puesto, id_nivel_organizacion, id_ext_tercero, id_ext_direccion, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: area_interes; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.area_interes (gid, codigo, descripcion, id_grupo_area_interes, nombre_producto, ind_privado, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
6	IA	Inteligencia Artificial	6	\N	\N	\N	t	2023-12-19	\N	2
7	PAM	Pintura y Arte Moderno	7	\N	\N	\N	t	2023-12-19	\N	2
8	FP	Finanzas Personales	8	\N	\N	\N	t	2023-12-19	\N	2
9	MM	Meditación y Mindfulness	9	\N	\N	\N	t	2023-12-19	\N	2
\.


--
-- Data for Name: banco; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.banco (gid, codigo, nombre_banco, codigo_bic, direccion, telefono, email, url, cod_tipo_banco, observaciones, ind_vigente, alta_db, baja_db, estado) FROM stdin;
11	BSCH	Banco Santander	BSCHESMMXXX	Ciudad Grupo Santander\nAvda de Cantabria s/n\n28660 Boadilla del Monte MADRID – ESPAÑA	902 11 22 11 	comunicacion@gruposantander.com	https://www.santander.com/	\N	\N	t	2023-12-19	\N	2
12	BBVA	BBVA	BBVAESMMXXX	Bilbao, Plaza de San Nicolás, número 4, código postal 48005.	900 102 801	comunica@bbva.com	https://www.bbva.com/	\N	\N	t	2023-12-19	\N	2
13	CX	CaixaBank	CAIXESBBXXX	calle Pintor Sorolla, 2-4, 46002, Valencia	900 40 40 90	servicio.cliente@caixabank.com	https://www.caixabank.es/	\N	\N	t	2023-12-19	\N	2
\.


--
-- Data for Name: canal_notificacion; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.canal_notificacion (gid, id_tercero, cod_tipo_canal_notif, descripcion, valor, ind_canal_defecto, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: cuenta; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.cuenta (gid, id_oficina, digito_control, numero_cuenta, titular_cuenta, cod_pais_iban, digito_control_iban, codigo_iban, codigo_bic, ind_cuenta_defecto, etiqueta_cuenta, observaciones, ind_vigente, alta_db, baja_db, cod_estado) FROM stdin;
2	2	21	201514900	UPPPP TITULAR FICTICIO	ES	21	ES21 0182 3204 17 02015149XX	BBVAESMM	t	Cuenta de Prueba	\N	t	2024-01-04	\N	2
\.


--
-- Data for Name: direcc_tercero_no_geo; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.direcc_tercero_no_geo (gid, id_tercero, id_acceso, desc_acceso, desc_direccion, ref_catastral, desc_puerta, extension_direccion, tiponimia, direccion_visualizar, numero, segundo_numero, duplicado, segundo_duplicado, nombre_via, ind_poligono, codigo_postal, id_tramo, desc_tramo, siglas, bloque, ind_kilom_manzana, num_kilom_manzana, ind_bloq_poligono, ind_acceso_compartido, desc_bloq_poligono, valor_escalera, valor_planta, valor_puerta, toponimia, referencia_catastral_parc, entrada_principal, observaciones, fuente_datos, id_parcela, des_parcela, id_nucleo_diseminado, id_tipo_vial, id_tipo_portal, id_valor_sentido, id_valor_sentido_pk, id_tipo_colectivo, id_tipo_inmueble, id_tipo_acceso, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: grupo_area_interes; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.grupo_area_interes (gid, codigo, nombre, descripcion, ind_vigente, alta_db, baja_db, estado) FROM stdin;
2	2	Ecologistas	Preocupados por el medio ambiente	t	2023-12-18	\N	2
6	1	Tecnología y Ciencia	Interesados en tecnologia y la Ciencia	t	2023-12-19	\N	2
7	4	Arte y Cultura	Interesados en arte y la cultura	t	2023-12-19	\N	2
8	5	Negocios y Finanzas	Interesados en Negocios y Finanzas	t	2023-12-19	\N	2
9	6	Salud y Bienestar	Interesados en salud y bienestar	t	2023-12-19	\N	2
10	3	33Entusiastas del Deporte	33Amantes de deportes variados	t	2023-12-18	\N	2
\.


--
-- Data for Name: oficina; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.oficina (gid, cod_oficina, nombre_oficina, horario, id_banco, direccion_oficina, tipo_banco, cod_provincia, cod_municipio, entidad_colectiva, entidad_singular, telefono1, telefono2, fax, cod_postal, observaciones, ind_vigente, alta_db, baja_db, cod_estado) FROM stdin;
2	6161	UPPP Oficina BBVA 6161	De lunes a viernes de 08:30 a 14:15 (festivos cerrado)	12	Av. Aurelio Alvarez, 4 , 28521, Rivas - Vaciamadrid , Madrid	s	\N	\N	\N	\N	914990602			28521		t	2024-01-04	\N	2
\.


--
-- Data for Name: pais_tercero; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.pais_tercero (gid, cod_pais, descripcion, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_tercero_area; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.rel_tercero_area (gid, id_tercero, id_area_interes, ind_auto_envio_info, ind_auto_envio_mail, ind_auto_envio_movil, ind_auto_envio_fax, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_tercero_cuenta; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.rel_tercero_cuenta (gid, id_tercero, id_cuenta, ind_defecto, num_prioridad, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_tercero_direccion; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.rel_tercero_direccion (gid, id_tercero, ind_tiene_dir_geo, id_direcc_geo, id_direcc_no_geo, cod_tipo_direccion, ind_defecto, num_prioridad, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: tercero; Type: TABLE DATA; Schema: bd_terceros; Owner: postgres
--

COPY bd_terceros.tercero (gid, cod_tipo_tercero, nif, cod_tipo_nif, digito_control, cod_pais_nacionalidad, cod_identificador, nro_identificador, nivel_administracion, tipo_entidad_pub, nivel_entidad, nombre_completo, primer_nombre, segundo_nombre, primer_apell, primer_apell_prepo, segundo_apell, segundo_apell_prepo, nombre_empresa, otro_nombre, fecha_nacimiento, fecha_registro, fecha_baja, fecha_actualizacionn, cod_tipo_genero, cod_tipo_canal_notif, cod_status_tercero, cod_pais_tercero, cod_pais_nac_tercero, cod_ciudad_nac_tercero, cod_idioma_tercero, cod_profesion, gid_direccion_defecto, gid_cuenta_defecto, es_admin_publica, link_fotografia, ind_terc_no_solvente, ind_terc_ficticio, observaciones, ind_vigente, alta_db, baja_db, cod_estado) FROM stdin;
\.


--
-- Data for Name: acceso; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.acceso (gid, cod_acceso, desc_acceso, tipo_acceso, id_codigo_postal, id_tramo, id_nucleo_diseminado, geom, nombre_calle, numero, segundo_numero, duplicado, segundo_duplicado, siglas, bloque, ind_kilom_manzana, num_kilom_manzana, ind_bloq_poligono, ind_acceso_compartido, desc_bloq_poligono, valor_escalera, valor_planta, valor_puerta, toponimia, referencia_catastral_parc, entrada_principal, observaciones, fuente_datos, id_parcela, tipo_portal, valor_sentido_pk, tipo_colectivo, tipo_inmueble, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: codigo_postal; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.codigo_postal (gid, codigo_postal, geom, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: comunidad_autonoma; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.comunidad_autonoma (gid, cod_comu_autonoma, nombre_com_autonoma, id_pais, geom, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: construccion; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.construccion (gid, cod_construccion, desc_construccion, id_parcela, id_direccion, geom, tipo_construccion, fuente_datos, fecha_construccion, fecha_reforma, ind_protegido, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: direccion; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.direccion (gid, desc_direccion, ref_catastral, cod_tipo_inmueble, cod_tipo_colectivo, valor_escalera, valor_planta, valor_puerta, observaciones, id_acceso, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	direccion_prueba	1234567912346	1	1	1	2	A	borrar es solo una prueba	\N	\N	t	2023-11-15	\N	2
\.


--
-- Data for Name: division_territorial; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.division_territorial (gid, codigo, id_municipio, desc_div_territorial, id_div_terr_padre, ind_subdivision, cod_tipo_div_terr, id_div_ter_pad, ind_valida_acc, familia, valido_desde, valido_hasta, ind_manzanas_cens, ind_tram_editab, ind_zonas_visibles, ind_exis_tr_acc, ind_no_paridad, ind_nucleos_postal, ind_copia_trab, copiado_desde, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: entidad_colectiva; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.entidad_colectiva (gid, cod_entidad_colectiva, desc_entidad_colectiva, id_municipio, geom, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: entidad_singular; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.entidad_singular (gid, cod_entidad_singular, desc_entidad_singular, id_entidad_colectiva, geom, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: indicador_ambiental; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.indicador_ambiental (gid, id_construccion, tipo_indicador, nombre_indicador, valor_indicador, normativa, valor_min_permitido, valor_max_permitido, fecha_registro, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: linea_auxiliar; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.linea_auxiliar (gid, cod_linea_auxiliar, desc_linea_auxiliar, id_municipio, geom, tipo_linea_auxiliar, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: manzana; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.manzana (gid, cod_manzana, cod_manzana_ayto, desc_manzana, id_municipio, geom, tipo_manzana, fuente_datos, hoja_parcelario, ref_plano_catas, ref_catastro, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.municipio (gid, cod_municipio, desc_municipio, id_provincia, geom, ind_calles_cod, ind_calles_nt_codif, ind_fachada_parcela, direccion_ayuntamiento, direccion_dep_estad, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: nucleo_diseminado; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.nucleo_diseminado (gid, cod_nucleo_diseminado, desc_nucleo_diseminado, id_entidad_singular, geom, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: pais; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.pais (gid, cod_pais, nombre_pais, nombre_pais_eng, siglas_pais, nacionalidad, capital, estado_europeo, ind_prov_codif, ind_com_auto_codif, geom, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
6	ES	España	Spain	ESP	España	Madrid	t	t	t	0106000020E61000006C000000010300000001000000930000007DCA3159DC5F1040A1BDFA78E8074440CCB22781CD691040910BCEE0EF054440878BDCD3D56D104072A774B0FE0544402444F98216721040546EA296E60644401492CCEA1D7E1040357EE1952407444095641D8EAE8210402504ABEAE5074440A2EBC20FCE87104033FD12F1D607444079E92631087C1040AD69DE718A04444075E789E76C811040785F950B950344409BAA7B647385104054724EECA1034440A5D93C0E8389104033A48AE2550444409BABE639228F1040417FA1478C0444402CF2EB87D8901040CFD8976C3C0644407EAB75E2728C104013471E882C084440B4AD669DF18D1040A64412BD8C084440478E7406469E1040EA094B3CA0084440D0807A336AAE104036B05582C50744403FE603029DA9104060E7A6CD380744407E1D386744A91040A2258FA7E50544403604C765DCA41040CEA78E554A054440B3F0F5B52EA51040F6CE68AB920444404128EFE368AE10400C21E7FD7F044440E00ED4298FAE1040802DAF5C6F03444093C49272F7B91040BAA1293BFD0244409337C0CC77C010402A52616C210444409013268C66C51040C30DF8FC30044440D712F241CFC610406840BD1935034440040473F4F8CD1040D0EE906280024440CA3505323BCB104073D9E89C9F004440BC94BA641CD31040DACA4BFE27FF43408F19A88C7FCF10400F5F268A90004440976F7D586FD41040C8258E3C10014440ED2B0FD253E41040F1BC546CCCFF4340AA46AF0628FD104001344A97FEFF43407B14AE47E10A1140B491EBA694FF4340C554FA0967071140CE3461FBC9FE4340FC8D76DCF00B11400E2F88484DFD43409EEFA7C64B071140F225547078FB43408670CCB227111140E42F2DEA93FA4340FFAF3A72A4131140CBBF9657AEF94340C6F7C5A52A1D1140868DB27E33F94340CAC16C020C1B1140909E228788F74340BB0A293FA926114030815B77F3F443402657B1F84D311140588E90813CF3434027F73B14053A11407F130A1170F24340B6A0F7C6104011402BBEA1F0D9F0434074081C09344811400D39B69E21F04340AC71361D013C11407EA7C98CB7EF43401CEE23B7262D1140AF93FAB2B4F1434068AED3484B151140F69507E929F24340562C7E53581911407E5182FE42F14340151E34BBEE1D1140C554FA0967F1434089B14CBF442C1140D5592DB0C7F04340DF196D55123911403106D671FCEE43402AE09EE74F3B11405F0CE544BBEC4340130F289B7235114028B7ED7BD4EB434089B5F8140033114044520B2593EB4340DF8B2FDAE3351140143FC6DCB5EA43409D819197353111405BB22AC24DEA4340A4E029E44A2D114015C9570229E943403E40F7E5CC2611400E83F92B64E84340766D6FB7241711401232906797E74340D55DD90583FB1040DC4B1AA375E843403FADA23F34F3104002B859BC58E843409DBB5D2F4DE1104002F4FBFECDE9434034BE2F2E55D91040778192020BEA434081936DE00ED410403E20D099B4E943401D554D1075CF1040DBDC989EB0EA4340603E59315CCD1040849CF7FF71EA4340EAAEEC82C1C51040CF4BC5C6BCEA4340BB97FBE428A010403B6EF8DD74ED43401CCD91955F8610407CD3F4D901EF43406D1ADB6B417F1040F8C610001CEF43404C6C3EAE0D651040C68B852172F04340F163CC5D4B5810405ED6C4025FF1434025B1A4DC7D4E1040F7C77BD5CAF24340C47B0E2C4738104029EACC3D24F44340137EA99F3715104031EC3026FDF543406C5F402FDC091040A2258FA7E5F54340331B649291031040C4B5DAC35EF643403B53E8BCC6EE0F4041B96DDFA3F643401424B6BB07E80F40D7FA22A12DF7434084807C0915DC0F40744012F6EDF64340B5A4A31CCCC60F401898158A74F74340C1A8A44E40B30F40603E59315CF743400DC347C494A80F40359886E123F84340DC63E94317940F404D13B69F8CF74340B7442E38837F0F40081F4AB4E4F74340B85B920376750F402AFD84B35BF74340B345D26EF4510F4058C9C7EE02F743406DE690D442490F402594BE1072F643401B649291B3300F40C828CFBC1CF643401EC3633F8B250F40DBDC989EB0F643400AA2EE03901A0F4013B534B742F64340B6D782DE1B030F401C9AB2D30FF6434003EB387EA8D40E408A20CEC309F643406214048F6FAF0E40522B4CDF6BF6434085B53176C2AB0E406BD8EF8975F64340C231CB9E04960E401C08C90226F6434088D51F6118900E40C9772975C9F643401155F833BC990E403D601E32E5F9434047C66AF3FFAA0E409148DBF813FB4340D1CC936B0AA40E403D5FB35C36FC434072DD94F25AA90E40CE1C925A28FD4340378E588B4FA10E4018EAB0C22DFF4340FD4CBD6E11980E40809BC58B85FF43405186AA984A7F0E4020425C397BFF43407B4ACE893D740E403599F1B6D2FF4340E90B21E7FD5F0E40E28FA2CEDCFF43401897AAB4C5550E402EAD86C43D02444036E9B6442E780E404089CF9D6003444030F5F3A622750E40DDD1FF722D044440CE6F986890820E40CE6F986890044440328FFCC1C0930E40467D923B6C064440B020CD58349D0E40EF004F5AB80644406214048F6FAF0E40B2D5E59480064440D13C80457EBD0E404582A966D6064440B6D8EDB3CAEC0E40B003E78C28074440925852EE3E070F40376C5B94D9064440B01C210379160F407A7077D66E0744404162BB7B802E0F40079B3A8F8A074440166EF9484A3A0F4079B130444E0744401EFD2FD7A2450F40B3EC4960730644407BD7A02FBD5D0F40A54C6A68030644406F1283C0CA610F401E1840F8500644403048FAB48A5E0F40E831CA332F074440A391CF2B9E7A0F4056BC9179E4074440CEFC6A0E108C0F404529215855074440F94A202576AD0F40CF656A12BC074440EE9579ABAEC30F40755776C1E0064440616BB6F292DF0F40CF2EDFFAB0064440FB592C45F2F50F400BB6114F760744406902452C62081040E2ADF36F97074440DE57E542E50F10405F79909E2207444057975302621210406C94F59B89074440094FE8F52721104058A835CD3B084440809C3061342B10401EA7E8482E074440D7C397892234104097749483D9064440D9243FE2573C10401CD0D2156C07444026C79DD2C14A10406F8104C58F074440DB519CA38E4E1040C32973F38D0844406EDA8CD310551040CD74AF93FA08444030BABC395C5B10400742B280090A44404628B682A6551040377172BF430B44407097FDBAD35D1040056EDDCD530B444073F1B73D41621040FB57569A940A44407DCA3159DC5F1040A1BDFA78E807444001030000000100000007000000F20698F90E2E1140B1F9B83654E64340E0BBCD1B27251140DE9046054EE64340F357C85C19241140BF7D1D3867E64340EEB43522182711402E71E481C8E64340B3075A81212B114001A60C1CD0E64340C3D66CE5252F1140BCCADAA678E64340F20698F90E2E1140B1F9B83654E64340010300000001000000070000003480B7408222114014D044D8F0FA43408C6A11514C1E1140AE122C0E67FA434054FCDF11151A11402864E76D6CFA4340527DE71725181140608F899466FB434025E99AC9371B1140984EEB36A8FB4340D0EFFB372F1E11408CF337A110FB43403480B7408222114014D044D8F0FA434001030000000100000005000000C1E61C3C13DA104049641F6459024440C0EB33677DDA1040A4DE5339ED01444036AD1402B9D41040BE16F4DE18024440C214E5D2F8D51040DAE3857478024440C1E61C3C13DA104049641F645902444001030000000100000005000000B76114048F4F1040ABED26F8A60B4440CA4FAA7D3A4E10402E7590D7830B4440E4DBBB067D4910400A9E42AED40B4440DD088B8A384D1040EA043411360C4440B76114048F4F1040ABED26F8A60B44400103000000010000004D01000077F69507E96909404644317903FA4340B282DF86186F09404D124BCADDF9434049DA8D3EE683094006F6984869FA43407EAA0A0DC49209407B336ABE4AFA4340A48D23D6E2B3094017A06D35EBFA43408CD651D504B109402A6F47382DFA4340D61BB5C2F49D094007D15AD1E6F8434087FBC8AD49770940ABB184B531F843404C1B0E4B033F094058AEB7CD54F64340A58636001B10094040683D7C99F643406D567DAEB602094054C4E9245BF54340355EBA490CE20840BE66B96C74F44340793D98141FDF0840548F34B8ADF34340FD2FD7A205C808405646239F57F44340CB811E6ADBB008409DD5027B4CF44340C61858C7F1A3084099B7EA3A54F34340F38FBE49D3A0084041800C1D3BF24340E17F2BD9B1B10840807EDFBF79EF4340984C158C4ACA0840F7AC6BB41CEE4340ACFD9DEDD1DB0840B3EE1F0BD1ED43401A4F04711EEE08404FB2D5E594EE434050E1085229F60840A568E55E60EE4340A4897780270D09402330D63730EF43409B745B22171C09403579CA6ABAEE4340D2C3D0EAE42C0940914259F8FAEE434020D3DA34B637094072512D228AEF4340A0A9D72D02430940D6FF39CC97EF43400C5BB395977C09400F46EC1340F143407347FFCBB5880940C2F693313EF24340DD79E2395BA009402FA86F99D3F143408A93FB1D8A820940B587BD50C0F0434014ECBFCE4D7B0940C2A2224E27EF43401ADD41EC4C8109402D211FF46CEE4340B27F9E060C920940BA4C4D8237EE43409AEAC9FCA36F09406D59BE2EC3EB4340EB01F390295F0940ABE80FCD3CEB434020CF2EDFFA50094090D959F44EEB4340D3307C444C290940C40B2252D3EA4340A12DE7525C150940EE5BAD1397EB43403EE94482A90609400516C09481EB4340A6D24F38BBF50840F5F23B4D66EA43405726FC523FEF084096EA025E66E84340F99E91088D000940CA6E66F4A3E54340077AA86DC32809406A85E97B0DE34340D47FD6FCF86B0940B6D8EDB3CAE043402C4487C091A00940CA8B4CC0AFDF43408B1A4CC3F0B109401689096AF8DE4340C5AEEDED96E40940B41CE8A1B6DD434047CCECF318050A40B70A62A06BDD4340B5FE9600FC130A40ADF6B0170ADE434082C5E1CCAF260A406D3B6D8D08DE4340C93A1C5DA53B0A40B0AD9FFEB3DE4340AE2B6684B7470A40B874CC79C6DE43406155BDFC4E530A4036B1C05774DF43408718AF7955670A4059C0046EDDDF4340F2ED5D83BE740A404FAC53E57BE04340A298BC01669E0A409ED2C1FA3FE1434093C6681D55AD0A40E3A430EF71E24340390B7BDAE1AF0A40F27A30293EE44340E8BD310400C70A40FDBE7FF3E2E44340D53C47E4BBF40A401FDB32E02CE34340FEB4519D0E040B40D2A8C0C936E243400DE36E10AD150B40B1868BDCD3E1434079E75086AA380B40503A9160AAE143409697FC4FFE4E0B407786A92D75E04340BA826DC4935D0B40C72E51BD35E043403CFA5FAE456B0B4054C8957A16E043408F71C5C551790B40AD8A709351DF43400AA0185932A70B4003E962D34ADF43408849B89047B00B40F16261889CDE43401EF98381E79E0B40882F134548DD4340C959D8D30E9F0B402FF7C95180DC4340882AFC19DEAC0B405F99B7EA3ADC43404016A243E0C80B40F5673F5244DC4340F981AB3C81D00B40933A014D84DB4340274BADF71BCD0B401157CEDE19DB43400685419946B30B405C76887FD8DA43409ED2C1FA3FA70B400344C18C29DA434025917D9065A10B4019ABCDFFABD843408C497F2F85A70B40369204E10AD843400AD6389B8EA00B403F58C6866ED643405C902DCBD7A50B4074435376FAD5434064EAAEEC82A10B40261C7A8B87D543406E313F3734A50B406380441328D44340ADFA5C6DC59E0B404B598638D6D34340B24B546F0D8C0B403CA06CCA15D4434078B5DC9909860B40390B7BDAE1D34340105CE509847D0B40614F3BFC35D14340116F9D7FBB6C0B4034D6FECEF6D0434087527B116D470B40C898BB9690D14340D636C5E3A23A0B40043A933655D14340909F8D5C37250B40DAC9E02879CF434042791F4773240B406DCA15DEE5CE434043A9BD88B6230B405C035B2558CE434079245E9ECE150B4026E4839ECDCC43409702D2FE07180B4059FCA6B052CB43407C0DC17119370B4065726A6798CA4340D90A9A9658390B4066BE839F38CA4340931804560E2D0B40C7D8092FC1C94340B0928FDD050A0B406B8313D1AFC94340F03504C765FC0A40E563778192C84340478E740646FE0A407F33315D88C743403A2009FB76F20A40D9B3E73235C74340191C25AFCEF10A40643E20D099C643401FBC7669C3E10A408908FF2268C6434055151A8865B30A4097C5C4E6E3C44340F086342A70B20A40060DFD135CC4434037C2A2224EA70A40C2DA183BE1C3434093E1783E038A0A403E23111AC1C24340F2ED5D83BE740A4083C30B2252C14340D53E1D8F19680A40D5264EEE77C04340ED9C668176670A4055302AA913C04340E04DB7EC105F0A4010786000E1BF434067800BB265590A40153AAFB14BBE43400F5F268A903A0A40C878944A78BA43409EEFA7C64B370A400D8AE6012CB8434077D844662E300A40A930B610E4B64340E4874A2366360A40C2137AFD49B64340BF6378EC67310A4037C2A2224EB543405436ACA92C2A0A40F1A1444B1EB54340342E1C08C9220A40925B936E4BB64340685E0EBBEF180A405342B0AA5EB643408EEBDFF599130A40F1660DDE57B5434043209738F2200A403CFA5FAE45B54340137CD3F4D9210A403EB48F15FCB44340EDF5EE8FF70A0A40F2CEA10C55B34340B3B6291E17F50940BDE13E726BB043406B64575A46EA0940B5E0455F41B04340193DB7D095E809405FECBDF8A2AF4340EA04341136DC094007B309302CAF4340C0ED0912DBDD09400A4AD1CABDAE4340F59CF4BEF1D50940286552431BAE4340A5A0DB4B1AC30940149337C0CCAD4340740B5D8940B509408099EFE027AE43409CDD5A26C3B10940BB25396057AD4340FE0DDAAB8F870940F20A444FCAAC434070CE88D2DE8009405001309E41AB4340056C0723F6690940EAD0E97937AA434056D80C7041560940DBFCBFEAC8A94340D47FD6FCF82B094056D3F544D7A943407C7E18213C1A0940AEF4DA6CACA84340B58AFED0CCF308409AB51490F6A74340BB473657CD93084012FB04508CA24340520DFB3DB18E084031CEDF8442A2434086A92D7590770840C5C72764E7A143407B12D89C836708404B1E4FCB0FA243409DF2E846585408402DB5DE6FB4A34340944DB9C2BB3C0840637FD93D79A44340D9CD8C7E343C08408466D7BD15A543402882380F273008409A0986730DA54340978C63247B2408409AE95E27F5A54340F6D1A92B9F250840170E846401A74340E8A04B38F4160840C09657AEB7A74340FB027AE1CE050840A64412BD8CA843403BAA9A20EAFE0740B477465B95A843400D1D3BA8C4F507408FE3874A23A84340FDF84B8BFAE40740AD18AE0E80A843403483F8C08EDF07403DB9A64066A94340F241CF66D5E70740C66AF3FFAAA9434023BE13B35EEC074094FB1D8A02AB43400307B47405DB07403EEAAF5758AC434024B4E55C8AAB0740139ED0EB4FAE43406B44300E2E9D074088F2052D24AE4340A779C7293A720740C34659BF99AE4340C6E061DA3757074075E5B33C0FAE4340D07EA4880C4B0740A77686A92DAD4340DB4E5B2382110740793E03EACDAE434070404B57B0ED0640637FD93D79AE4340E485747808C306406EC493DDCCAE43408944A165DD9F064009A52F849CAD4340F46E2C280C8A06401ADB6B41EFAD4340E9D32AFA43730640B763EAAEECAE43401749BBD1C75C0640FEEDB25F77AE43408E959867254D06404A404CC285AE434088670932022A06402A1BD65416B14340F50EB743C30206409ECE15A584B24340BF99982EC4EA05403ECC5EB69DB44340AAB8718BF9F90540AF7B2B1213B843409F3D97A949F00540F04E3E3DB6B9434002F2255470D80540E3A8DC442DBB4340CA8AE1EA00C805404303B16CE6BC4340253FE257ACE105403DB7D09508BE43407C7C4276DEE605407E8CB96B09BF4340BC04A73E90FC054010786000E1BF4340A64412BD8C020640CDCD37A27BC04340CA880B40A3F4054067614F3BFCC14340F14927124CD5054030D63730B9C34340D2C2651536C305405AB8ACC266C443400F98874CF9B005405BB22AC24DC44340A699EE75527F0540A88E554ACFC64340AD31E884D0210540A69BC420B0C843405E807D74EA0A0540C90391459AC8434027DC2BF356FD04402E910BCEE0C543401B834E081DF40440486C770FD0C543403EEB1A2D07DA04408ACDC7B5A1C64340F3E505D847C70440656D533C2EC64340E8A38CB800B404401F69705B5BC443409031772D217F0440D8F15F2008C4434093AB58FCA6500440D2C3D0EAE4C243403596B036C64E04409AD2FA5B02C243405854C4E9245B04408195438B6CC143406E8AC745B5480440CC7B9C69C2C04340847EA65EB7480440B75ED38382BE4340D976DA1A112C04401DE38A8BA3BC4340A794D74AE82E044082E15CC30CBB4340E90FCD3CB92604405932C7F2AEBA43408B34F10EF0040440D68C0C7217BB43400BB77C2425FD03407C629D2ADFBB4340DCB8C5FCDCF003409AD18F8653BC43409D4B7155D9D70340C18EFF0241BC434060E4654D2CD00340F986C267EBBE4340DC2A8881AEBD0340B4E4F1B4FCBE4340930035B56CAD034082E49D4319C04340D5CBEF3499B10340D253E41071C143400B0BEE073CD00340FEEF880AD5C14340AEEFC34142D403402D228AC91BC24340C7B8E2E2A8BC0340394371C79BC24340832F4CA60AA603406EA296E656C44340198D7C5EF194034076C075C58CC44340BC900E0F617C03403929CC7B9CC343406C938AC6DA5F0340E1B54B1B0EC3434041481630815B0340A4552DE928C3434010070951BE600340B03907CF84C4434095D5743DD15503400F7BA180EDC443405B96AFCBF03F0340F0DDE68D93C44340A9C29FE1CD3A03409A25016A6AC343405323F433F51A03402272FA7ABEC2434016C3D501101703408AE3C0ABE5C24340EECEDA6D171A03403BE0BA6246C44340514A0856D50B0340CCD4247843C44340DC68006F810403405E64027E8DC44340574277499CF50240A86DC32808C4434066BFEE74E7E90240815F234910C44340D6355A0EF4F00240C269C18BBEC44340FF3EE3C281100340FC8F4C874EC54340B6696CAF051D0340728A8EE4F2C54340003CA2427513034030F2B22616C64340BF7CB262B8FA0240E8C1DD59BBC54340525F96766AEE0240D00A0C59DDC643408461C092ABD802407D5D86FF74C743408A39083A5AD502406667D13B15C8434080F10C1AFAC70240726C3D4338C84340B0E595EB6DD3024087A2409FC8C94340B8CD548847C202400264E8D841CB43406A15FDA199C70240B876A22424CC4340CC7B9C69C2D602400A68226C78CC43406C5F402FDCD902401A34F44F70CD43404D4D8237A4F102407A8A1C226ECE4340643E20D09914034035EECD6F98CE4340BC3E73D6A75C03405645B8C9A8D04340FD4D2844C061034058AA0B7899D143403CA06CCA157E03401557957D57D24340BEBF417BF5B10340A9FA95CE87D34340085A8121ABDB0340799274CDE4D54340111956F146E6034076DF313CF6D54340CA181F662FFB034028D53E1D8FD7434060234910AE2004405AF2785A7ED843405DFC6D4F903804403B1C5DA5BBD94340A724EB70745504407C293C6876D943401FD95C35CF7104406B9A779CA2D943409CC58B8521B20440137CD3F4D9DB4340946A9F8EC7CC04407B116DC7D4DD434028B517D176EC04409F1D705D31DF4340AF5DDA7058FA044047382D78D1DF4340037B4CA434FB0440172CD505BCE04340289CDD5A26030540973B33C170E043405E807D74EA0A0540AEF36F97FDE04340D6E07D552E140540BFB9BF7ADCE14340DE21C50089260540556CCCEB88E1434068041BD7BF4B05401A87FA5DD8E24340EC866D8B325B0540102219726CE54340A835CD3B4E71054044334FAE29E643406308008E3D7B0540CD3E8F519EE543403F1D8F19A88C054072C0AE264FE54340179D2CB5DE8F05409A7B48F8DEE543403B527DE71785054057AF22A303E643406CCCEB884396054031B3CF6394E743405854C4E9249B05401897AAB4C5E743409F91088D60A305402DAF5C6F9BE743407B849A2155B40540684293C492E84340919DB7B1D9D10540EF1B5F7B66E943400C21E7FD7FDC05409BC6F65AD0E9434051BB5F05F8EE0540034356B77AEA4340D93EE42D57FF05407A51BB5F05EA43407FA1478C9E1B06404EB857E6ADEA4340ED461FF3012106403CA1D79FC4EB4340640795B88E310640DFFAB0DEA8EB43401D91EF52EA320640AF5B04C6FAEC434014268C66653B064044183F8D7BED434087FD9E58A74A0640E71A66683CED4340172D40DB6A560640477364E597ED43402BA1BB24CE6A06408CBFED0912ED4340D8F15F2008700640DA0418963FED434003249A40116B06403C1570CFF3ED4340AA436E861B7006401827BEDA51EE4340AED9CA4BFE8706405C7347FFCBED4340FBE93F6B7E9C064048895DDBDBED434054FD4AE7C3B306406478EC67B1EE4340C6F99B5088C006404777103B53EE4340834C327216D606405E83BEF4F6EF4340CF2EDFFAB0FE0640D0807A336AF0434053B4722F302B0740F819170E84F24340A9177C9A933707402618CE35CCF24340410E4A98693B074077BF0AF0DDF24340D07EA4880C4B07406403E962D3F24340700A2B1554540740CDCCCCCCCCF243409A0AF148BC5C07400A48FB1F60F3434051DCF126BF650740EE3F321D3AF343408A3DB48F157C0740C6C1A563CEF343402F14B01D8C9807401ABFF04A92F54340552E54FEB5BC07402D27A1F485F44340FF76D9AF3BDD0740CF2F4AD05FF4434040A54A94BD050840518369183EF64340E8A04B38F416084078B306EFABF64340DCA16131EA3A084080B8AB5791F7434011C7BAB88D460840A92F4B3B35F7434050C58D5BCC4F08408E76DCF0BBF74340BA69334E43540840A73CBA1116F74340E3E313B2F37608406493FC885FF74340679E5C532073084018D00B772EF64340F46DC1525D8008409964E42CECF54340BB473657CD9308406F4BE48233F643405532005471A308408D2958E36CF643404DA1F31ABBC408400135B56CADF74340CF2C095053CB0840FA0967B796F74340B9196EC0E7C708401D91EF52EAF64340A7406667D1FB08407D91D09673F74340CCF10A444F0A094099BB96900FF843402C0C91D3D713094020CF2EDFFAF84340AC376A85E93B09400CE71A6668FA43400F7C0C569C6A09405A65A6B4FEFA4340A8C4758C2B6E094093196F2BBDFA434077F69507E96909404644317903FA43400103000000010000009D1100000002D6AA5D93FCBFA777F17EDCAC45400586AC6EF55CFCBFDE57E542E5AB4540988A8D791D31FCBF0DFFE9060AAC4540D2890453CD2CFCBF0B9755D80CAC45403B014D840D0FFCBFE6EB32FCA7AB45404CC631923D02FCBF3318231285AA4540B79BE09BA6CFFBBFF1F5B52E35AA454080457EFD10DBFBBF17B83CD68CA84540F54C2F3196A9FBBF49DA8D3EE6A545403B191C25AF8EFBBFC24D469561A64540FA2B64AE0C6AFBBF6808C72C7BA64540F5BC1B0B0A43FBBFEC51B81E85A74540207EFE7BF01AFBBF25B37A87DBA74540454772F90FE9FABFD369DD06B5A74540E4F38AA71EA9FABFC6FA062637A845407008556AF680FABF645DDC4603A84540BB99D18F8653FABF7A53910A63A74540594FADBEBA2AFABFCE4F711C78A74540CF8767093202FABF3A58FFE730A74540096EA46C91F4F9BF2D5BEB8B84A6454088BA0F406A13FABFA3CB9BC3B5A44540137CD3F4D901FABF82A8FB00A4A24540240F441669E2F9BF7633A31F0DA14540514F1F813FBCF9BF8CBB41B456A04540FC8EE1B19F85F9BF0F5F268A90A0454007077B134332F9BF469561DC0DA0454078431A153819F9BF9961A3ACDFA045409E4319AA62EAF8BF732D5A80B6A3454012C0CDE2C502F9BFCF108E59F6A44540F81741632691F8BFADDA3521ADA54540ADA415DF5078F8BF1F0E12A27CA54540376F9C14E63DF8BF13B70A62A0A54540E0D572672618F8BFD87E32C687A54540C2C1DEC490DCF7BF2F50526001A445405B99F04BFDBCF7BF0D8AE6012CA445407E6E68CA4E7FF7BFE2CCAFE600A34540ACC77DAB7522F7BF05DF347D76A245407C5F5CAAD2D6F6BFAF06280D35A245406CE8667FA09CF6BFC64FE3DEFCA2454070EA03C93B47F6BF384D9F1D70A145402D6002B7EE26F6BF5C7171546EA045406919A9F7540EF6BFED66463F1A9E45402AA8A8FA950EF6BFC8073D9B559D4540D34B8C65FA25F6BFDD0BCC0A459C45404DDA54DD231BF6BFB136C64E789B45404298DBBDDC27F6BFF7C77BD5CA9A45407495EEAEB321F6BFA8514832AB99454064E8D841252EF6BF0F5EBBB4E198454075029A081B1EF6BF7B2DE8BD31984540A2258FA7E547F6BFEF1AF4A5B797454045DAC69FA86CF6BF8D62B9A5D5964540029CDEC5FB71F6BFB9AAECBB22944540528028983185F6BF91BA9D7DE59345407558E1968FA4F6BFACC5A70018934540E0DBF4673F92F6BFA088450C3B924540E6046D72F8A4F6BFF913950D6B904540371C96067ED4F6BF6ABE4A3E768F4540AD8905BEA2DBF6BFE15E99B7EA8E4540DDEF5014E813F7BFDD0BCC0A458E4540B58AFED0CC13F7BF0E85CFD6C18D454083893F8A3A73F7BF9E4319AA628C45406E35EB8CEF8BF7BFFAF202ECA38B4540E9B7AF03E78CF7BFE94482A9668A4540D367075C574CF7BFE945ED7E15884540A986FD9E5827F7BF93020B60CA8645403944DC9C4A06F7BF7B2E5393E0854540041F8315A7DAF5BF9EEDD11BEE8345405001309E41C3F5BF9A417C60C7834540EB909BE106BCF5BF54AC1A84B9834540514D49D6E1A8F5BF66F4A3E194834540B98C9B1A687EF5BF02486DE2E486454019E76F422182F5BFC87C40A03389454031EBC5504E74F5BF41D7BE805E8A45408143A852B387F5BFB29DEFA7C68B4540FFB27BF2B050F5BF81B1BE81C98D45406876DD5B9118F5BFB0CBF09F6E8E4540BDE13E726B52F4BFA1681EC0228F4540A46DFC89CAC6F4BFF4346090F48B45400D535BEA20EFF4BFBAF8DB9E20894540062B4EB516E6F4BF272F3201BF8845400C91D3D7F3B5F4BFB01D8CD827884540FAD4B14AE999F4BFF8E0B54B1B8845407022FAB5F553F4BF7D073F7100874540200DA7CCCD37F4BF5C1C959BA885454093DFA293A516F4BF5000C5C892854540E8667FA0DCF6F3BF0D6FD6E07D85454042CF66D5E7AAF3BF0B7DB08C0D874540D333BDC45866F3BFA93121E69286454043C6A354C253F3BF4EB4AB90F2854540174A26A77646F3BF83FC6CE4BA854540F2785A7EE0EAF2BFD6C9198A3B8445409D465A2A6FC7F2BFB0FECF61BE8445409204E10A2854F2BFDF6A9DB81C8345404F75C8CD7043F2BF7B4E7ADFF8804540D95A5F24B425F2BF04C6FA0626814540BD00FBE8D4D5F1BF7CB60E0EF68245404C35B3960292F1BF732D5A80B6814540D8D30E7F4D56F1BFADA7565F5D8145409D7FBBECD75DF1BF815EB87361804540FDA4DAA7E331F1BF45B9347EE17F4540C2853C821B29F0BF5E4C33DDEB7E4540C51D6FF25BF4EFBF5BCD3AE3FB7C45402A55A2EC2D65EFBF9C16BCE82B7C4540DB148F8B6A11EFBFFEB7921D1B7B45402F4E7CB5A3B8EEBFCD069964E47A4540967A1684F23EEEBFADDF4C4C177A4540D23AAA9A20EAEDBF040473F4F8794540DA38622D3E85EDBF0CAD4ECE507A45408675E3DD9131EDBF87359545617B4540AD4CF8A57EDEECBF98F8A3A8337B45402C2B4D4A41B7ECBF0FD3BEB9BF7A454063D1747632B8ECBFFCC6D79E597A4540C139234A7B03ECBFDB696B44307A4540BB26A435069DEBBF7EA7C98CB7794540ACAC6D8AC7C5EABFD7C39789227A4540B33F506EDBF7E9BF4AD40B3ECD79454032B08EE3874AE9BFF7065F984C7B4540E02A4F20EC14E9BF71AFCC5B757B4540863AAC70CBC7E8BFDA03ADC0907B45408429CAA5F18BE8BFF855B950F97B45404A6249B9FB1CE8BF59A31EA2D17B45404F92AE997CB3E7BFAF7D01BD7079454082035ABA826DE7BF12859675FF78454043AA285E656DE7BF624CFA7B29784540342C465D6B6FE7BF39252026E1764540DF6A9DB81C2FE7BF8E93C2BCC7754540B136C64E7889E7BF8C118942CB74454018CDCAF6216FE7BF94A46B26DF72454082E673EE763DE7BF28D3687231724540313F37346527E7BFA359D93EE4714540F94B8BFA24F7E6BF3881E9B46E7145405610035DFB82E6BFEBC726F911714540F0F78BD99255E6BFC02500FF9470454093ACC3D155BAE5BF60ADDA3521714540AD6D8AC74535E5BF8A3F8A3A736F4540923D42CD902AE5BF967B8159A16E45409CDEC5FB71FBE4BF9F211CB3EC6D454020CF2EDFFAB0E4BF3DB9A640666D4540FD8348861C5BE4BF0D8D2782386D4540321EA5129ED0E3BF234DBC033C6B4540C2887D022846E3BFAE635C71716A4540637E6E68CA4EE3BFD462F030ED6945405FD218ADA32AE3BF0B28D4D347684540DDB5847CD033E3BFB70C384BC9664540E1D231E719FBE2BF5796E82CB3664540641EF9838167E2BFE4A1EF6E65674540F8A75489B237E2BFEB1ED95C35674540CE716E13EE15E2BFD44334BA83664540CE716E13EE15E2BFCB49287D2166454098C28366D73DE2BF75560BEC31654540C47AA356983EE2BFEE76BD3445644540BEDD921CB02BE2BF027FF8F9EF634540CE716E13EE15E2BFAC545051F56345400C04013274ECE1BF27DA5548F96345409C6C0377A0CEE1BFF6ED2422FC6345409BE271512DA2E1BF6C94F59B89634540689604A8A965E1BF02D8800871654540A5164A26A7F6E0BF7B87DBA161654540B5519D0E64BDE0BF054EB6813B664540D8D2A3A99ECCE0BF5437177FDB674540DE9387855A53E0BF2235ED629A694540761893FE5E0AE0BF897E6DFDF469454001FA7DFFE6C5DFBFCD3AE3FBE268454092088D60E3FADEBF6FF3C64961684540FF959526A5A0DEBF2AABE97AA2674540408864C8B1F5DCBF022B8716D96645408B53AD855968DCBF09707A17EF65454057EE05668522DCBFF1811DFF056645405E68AED3484BDABF9AEB34D25267454018EDF1423A3CD9BF2B4B749659664540C8073D9B559FD8BFB77BB94F8E664540A515DF50F86CD8BF1747E5266A67454028637C98BD6CD7BF2F6CCD565E684540DFC0E44691B5D6BF4643C6A3546A45406B9C4D470037D6BF39B69E211C6B4540FD87F4DBD781D5BF3E7958A8356B45404B3E76172829D5BFE7E104A6D36A4540357D76C075C5D4BFC18C2958E36A454098A59D9ACB0DD4BFFBAE08FEB76C4540A724EB707495D3BFFBE59315C36B4540ABEAE5779ACCD1BF4A6249B9FB6A45403F1D8F19A88CD1BF0D33349E086A4540C136E2C96E66D0BFB1C398F4F76845402AC93A1C5DA5CFBF2DCE18E604694540F2CEA10C5531CFBFA14ACD1E68694540919DB7B1D991CEBFBF2B82FFAD684540577A6D365662CEBF6FD921FE616745409F8F32E202D0CCBFDFE00B93A9664540FCC8AD49B725CCBFE8A1B60DA36645400EF5BBB0355BCBBFFFCBB56801664540B8E864A9F57EC9BFEAE8B81AD96545406B662D05A4FDC7BFBC95253ACB64454021ACC612D6C6C6BF8D63247B846445401C5DA5BBEB6CC4BF72F8A413096645400EDC813AE5D1C3BF88D7F50B7665454062BB7B80EECBC3BFB6BDDD921C644540D87F9D9B36E3C2BFE77283A10E634540BB63B14D2A1AC3BFCAFD0E4581624540679E5C5320B3C1BFF2D24D6210624540DC2C5E2C0C91BFBF7C444C8924604540A9143B1A87FABDBF5E64027E8D5E454018E945ED7E15BCBF51A1BAB9F85D454039D384ED2763BCBFC4961E4DF55C4540F7949C137B68BBBF2F6CCD565E5C45404182E2C798BBB6BF9E094D124B5C454019575C1C959BB4BFD690B8C7D25B45407214200A664CB1BF6A6CAF05BD5B45404F5AB8ACC266B0BFA71FD4450A5B454005A73E90BC73B0BFD00EB8AE985945408D614ED02687AFBFE71BD13DEB58454037A8FDD64E94ACBFC093162EAB584540750470B378B1A8BFC70F9546CC5845407B6649809A5AA6BFD923D40CA9584540BAF770C971A784BFA530EF71A657454029779FE3A3C5593F5B0BB3D0CE5745401DAD6A494739883F618BDD3EAB58454001BF4692205C913F315BB22AC2594540802DAF5C6F9B993F6B2BF697DD5945400B0BEE073C30A83F2E8D5F78255945406F4562821ABEAD3FC1E270E6575945401348895DDBDBB13F397F130A115A4540029F1F46088FB23F6C79E57ADB5A4540E1B20A9B012EB43F136058FE7C5B454036E9B6442E38B73F37C7B94DB85B4540A911FA997ADDBA3FE86C01A1F55A4540670DDE57E542BD3F54742497FF5A4540A016838769DFC03F6B2C616D8C5B4540E3C5C210397DC13FEC4E779E785C45404FE5B4A7E49CC43F2C7E5358A95C45401DCBBBEA01F3C43FC51A2E724F5D45401A88653387A4C63F3BE0BA62465E45402FFD4B529962CA3F172AFF5A5E5D4540D313967840D9CC3FE7012CF2EB5B4540CBD58F4DF223D03F4CFBE6FEEA5B45401A51DA1B7C61D03FF224E99AC95B454079E8BB5B59A2D03F04392861A65B45404AB890477023D13FF486FBC8AD594540D190F12895F0D03F4F3DD2E0B6584540D6390664AF77D13FBBEEAD484C5845401EA4A7C821E2D23FCFBBB1A03056454016342DB1321AD43FD6E253008C5745406490BB085394D43F4D6A6803B0574540C5025FD1ADD7D43F279F1EDB325A45407C0A80F10C1AD63FB8567BD80B5B454044C18C2958E3D63F5B5B785E2A5C4540D95E0B7A6F0CD73F075DC2A1B75C4540E1D39CBCC804D83F707B82C4765B4540C9E369F981ABD83FC2853C821B5B45408E57207A5226D93F927538BA4A5B45402C9D0FCF1264D93F2EA9DA6E825945401D21037976F9D93FE8DA17D00B594540C4245CC823B8DA3F882AFC19DE584540B212F3ACA415DB3F24438EAD6758454067D47C957CECDB3F9F71E140485845404D13B69F8CF1DC3F05FBAF73D358454051BEA085048CDD3F2A1C412AC55845400BF0DDE68D93DE3FE1455F419A594540D595CFF23CB8DF3FCA54C1A8A458454036CB65A3737EE03F57EE056685584540323ECC5EB69DE03F8CD7BCAAB3584540DBDE6E490ED8E03F3A5CAB3DEC5945402366F6798CF2E03FC91CCBBBEA594540A7936C753925E13FE01115AA9B59454051137D3ECA88E13F00529B38B9594540C32CB4739A85E23FE17B7F83F6584540ABEB504D49D6E23FE4D6A4DB1259454076172829B000E33F06483481225A45402905DD5ED218E33F27A5A0DB4B5A4540632B685A6265E33F3196E99788594540FCFD62B664D5E33FC0AF912408594540679C86A8C21FE53F8B8D791D7158454012876C205D6CE53FD74E948444584540A3409FC893A4E53FEF1EA0FB72584540E1421EC18D94E53F10AD156D8E5945404D4D8237A4D1E53F1B13622EA95A454093E52494BE90E53FC9FFE4EFDE5B454092955F0663C4E53F1AA54BFF925C45405E8429CAA571E53F1F48DE39945D454015A8C5E0615AE53F5AF2785A7E5E45402DEE3F321D3AE53F63D4B5F63E5F454070B20DDC813AE53FAB2006BAF65F45401EFE9AAC518FE43F08008E3D7B604540BBEF181EFBD9E43FAB3DEC8502624540FB5C6DC5FE32E53FB360E28FA2624540C3B986191A4FE53F4B3E761728634540386744696FF0E43FE998F38C7D634540A4880CAB78A3E43FA7AD11C138644540A12E52280BDFE43F9A44BDE0D3644540BCE9961DE21FE53F147B681F2B66454090BFB4A84F72E53F7009C03FA56645407711A6289746E53F9835B1C057684540062CB98AC56FE53F5CAFE941416945401D1EC2F8695CE53F4241295AB9694540A857CA32C431E53FE3A59BC4206A45402E58AA0B7819E53F35ED629AE96A454066868DB27E33E53FB3976DA7AD6B45403D4679E6E5B0E53F52B648DA8D6C45406493FC885FB1E53F3B6EF8DD746D4540637AC2120F28E63FCA17B490806D4540CF66D5E76AABE63FABCE6A813D6E4540AE11C138B874E73F3B342C465D6D4540D9B3E7323589E73F76FA415DA46C4540B24B546F0DECE83F05C078060D6B4540113AE8120E3DE93F2009FB76126B45401840F850A2A5E93FAED4B320946B45409EEA909BE106EA3F7C6473D53C6B4540B4E386DF4DB7EA3F732CEFAA076A45406346787B1002EB3F9FC9FE791A6A4540F4F8BD4D7F76EB3FB1FB8EE1B16945409CE1067C7E98EB3F9E4143FF046945407CB438639813EC3F1EDE73603968454003EFE4D3635BEC3FE76F42210268454081ECF5EE8FF7EC3FCA4E3FA88B664540A393A5D6FB0DED3FE62494BE10664540083E062B4EB5ED3FB1E07EC003654540938AC6DADF59EE3F965E9B8D95664540164F3DD2E0B6EE3F50AA7D3A1E674540A7406667D13BEF3FF98381E7DE654540CCB8A981E673EF3F29B4ACFBC7644540A1D79FC4E7CEEF3F4969368FC3644540B0CA85CABF16F03FEE3F321D3A654540B03DB324404DF03F116F9D7FBB644540A5DDE8633EA0F03F44F7AC6BB464454048A30227DBC0F03F3D9AEAC9FC6345401BD7BFEB3327F13F753C66A032644540E5EFDE516342F13F488C9E5BE8644540A8565F5D1568F13FCD3E8F519E634540B0AF75A911BAF13F1B649291B36245401D3A3DEFC6C2F13F3B1BF2CF0C6245402272FA7ABEE6F13F3BFF76D9AF614540965D30B8E60EF23FA795422097604540C85C19541B1CF23F679B1BD313604540A438471D1D17F23FE36F7B82C45E45403E75AC527A26F23FDE736039425E45400F9A5DF75624F23F66A4DE53395D454050C58D5BCC8FF23F6EA5D766635B4540EC34D25279BBF23F76FA415DA45A4540B60E0EF62606F33FED4ACB48BD5B4540F833BC598377F33F4CC631923D5C4540D575A8A624ABF33F0BEBC6BB235D4540226DE34F54F6F33FA0FCDD3B6A5C4540F3203D450E11F43FCFA0A17F825B4540A8C821E2E654F43F07B7B585E75B45407633A31F0D67F43FE6B0FB8EE15B45406E3315E29178F43F92E9D0E9795B4540F91400E319B4F43F537765170C5C45404D81CCCEA2F7F43F4CC79C67EC5B454098F8A3A83337F53FE75608ABB15C4540F4FC69A33A5DF53F7D3CF4DDAD5C4540DB6CACC43C6BF53F8B54185B085C454004AE2B6684B7F53FEF022505165C45409F93DE37BEB6F53F711DE38A8B5B4540E7A8A3E36AA4F53FAA81E673EE5A4540A3957B8159A1F53F6B2BF697DD594540514B732B84D5F53F2F36AD140259454024809BC58B05F63FC87DAB75E2584540E62494BE1032F63FA04E797423584540DD239BABE639F63F282CF180B2574540B8C83D5DDD31F63FE1455F419A55454019CBF44BC45BF63F452FA3586E554540787DE6AC4F79F63F9D9B36E334544540D9B5BDDD929CF63FE55FCB2BD753454065389ECF80BAF63F0DFFE9060A504540910BCEE0EFD7F63F567DAEB6624F45406326512FF8F4F63FD55DD905834D454003250516C014F73F24D236FE444D4540C382FB010F0CF73FD7F7E120214C45401D739EB12FD9F63F8940F50F224B454098FBE42840D4F63F1286014BAE4A454064B14D2A1AEBF63FB07614E7A8494540D238D4EFC216F73FF4C29D0B23494540F818AC38D51AF73F93DFA293A5484540B4226AA2CFC7F63F15E63DCE34474540247CEF6FD09EF63F39268BFB8F444540836C59BE2E03F73FCC7F48BF7D45454070EEAF1EF72DF73F473A03232F454540FF91E9D0E979F73F115663096B414540A662635E471CF73FCDE7DCED7A3F4540B1A4DC7D8ECFF63F4C38F4160F3F45400B613596B0B6F63F06BD3786003E4540B3B27DC85BEEF63F66DD3F16A23D4540BF47FDF50A0BF73FFB22A12DE73C454006BB61DBA20CF73FBB48A12C7C3B45400A2FC1A90F24F73F670DDE57E53A45409F7763416110F73FE0F25833323A45400438BD8BF723F73F1478279F1E394540EC67B114C917F73FF8FBC56CC9384540C5FEB27BF230F73FBC7A15191D384540384A5E9D63C0F73F6F2A52616C37454059A65F22DEFAF73FCF328B506C3745401BD82AC1E230F83F2E5393E00D37454092955F066344F83FEDD808C4EB364540558A1D8D437DF83F99B7EA3A543745405E81E84999D4F83F8CF84ECC7A374540B80375CAA3DBF83F698CD651D53845407E3672DD94F2F83FF8FF71C28439454033A6608DB3E9F83F06651A4D2E3A4540F73AA92F4BFBF83FDFE00B93A93A4540F46F97FDBA13F93FEA5A7B9FAA3A4540F46C567DAE36F93F1A33897AC13945409CC1DF2F664BF93FB8E68EFE97394540444DF4F92863F93F9B711AA20A3B45407D21E4BCFF8FF93F689604A8A93B45408DF161F6B2ADF93F4BC8073D9B3B45404563EDEF6C0FFA3F287E8CB96B3B4540060DFD135C2CFA3FEDB8E177D33B454052EDD3F19881FA3F4D4C1762F53B4540D3DC0A613596FA3F8E3F51D9B03C454092E68F696D9AFA3F53CBD6FA223F45402CB7B41A12B7FA3FA0FCDD3B6A404540897E6DFDF4DFFA3FBB253960573F4540D578E9263108FB3F37DF88EE593F4540228D0A9C6C43FB3FBB44F5D6C03E4540EECF4543C663FB3FB3B6291E173F45402D776682E19CFB3FBC04A73E904045409642209738B2FB3F44C2F7FE063F4540807EDFBF79F1FB3FDBC35E28603F4540A702EE79FE34FC3FDECA129D653E4540FA0CA837A3A6FC3F2BA391CF2B3E454072FE261422E0FC3F842D76FBAC3E4540193735D07C0EFD3F09707A17EF3D4540D4450A65E12BFD3F2FC4EA8F303E45409A43520B2553FD3F051555BFD23D4540BF0F0709517EFD3F9DF6949C133D454076FA415DA490FD3F4206F2ECF23B454002D9EBDD1FAFFD3F9E29745E633B45403A7AFCDEA6BFFD3F295B24ED463B454010B056ED9AD0FD3F61545227A03B4540B16F2711E1DFFD3F8B321B64923B4540F86D88F19A17FE3FD525E318C93A4540B18861873129FE3F06A1BC8FA33945400CCA349A5C4CFE3F99B7EA3A54394540FE5F75E44867FE3F48A7AE7C96394540132C0E677E75FE3FD09A1F7F69394540AA0EB9196E80FE3FE09D7C7A6C394540D40B3ECDC98BFE3FF8510DFB3D39454015191D9084BDFE3FE197FA7953394540F4531C075EEDFE3FC45E28603B3A4540EEB3CA4C69FDFE3F0DFFE9060A3A4540FB592C45F215FF3F5019FF3EE338454024253D0CAD0EFF3F46B58828263745404E9CDCEF5054FF3F89601C5C3A364540A7ECF483BA48FF3F774B72C0AE344540D3F544D7855FFF3F5589B2B7943345402C47C8409E5DFF3F1F69705B5B32454082AE7D01BD70FF3F166C239EEC304540698D4127848EFF3F4AF1F109D92F4540B5E21B0A9FADFF3FECFA05BB612F45402ECA6C9049C6FF3F73F7393E5A2E45401407D0EFFB1700404CA60A46252D4540842BA0504F1F0040D09D60FF752C4540AA436E861B300040E9818FC18A2D4540F41ABB44F5760040F70489EDEE2D4540F4E0EEACDD9600402997C62FBC2E454038BC202235AD0040E2E5E95C512E4540DE0033DFC1AF004079CA6ABA9E2E45401BF4A5B73FB700408978EBFCDB2F4540BD73284355EC004010E9B7AF03314540FE2C9622F9EA0040F390291F82324540CA6DFB1EF5F7004091D442C9E4324540744694F606FF0040DB8651103C344540992EC4EA8F100140D4D347E00F35454009E066F1624101403A3E5A9C31364540FD12F1D6F957014093C3279D48364540C616821C947001409831056B9C354540348639419B9C01403ACC971760354540BBB7223141CD01400951BEA085364540F9F36DC152DD0140572250FD83364540B3EDB43522F8014045D95BCAF9364540DB519CA38E0E0240CF6A813D2638454061E124CD1F530240950ED6FF39364540605AD427B9630240D15D1267453645409CBF0985087802402B6D718DCF364540C70F9546CC8C0240CB2BD7DB66364540037D224F928E0240B345D26EF435454088BB7A15199D02403ACC971760354540FE7DC68503C102404487C09140354540FDBE7FF3E2C40240FC17080264344540EA42ACFE08E30240B5C5353E933345407F4B00FE291503403080F0A144334540BF27D6A9F23D0340BEDBBC715232454014AE47E17A7403402E043928613245407026A60BB17A03403DD52137C331454011E15F048D790340C72E51BD35304540FA7ABE66B98C0340498446B0712F45402EABB019E0A20340A65F22DE3A2F45400936AE7FD7A7034092205C01852E4540456458C51BB9034040DEAB56262E4540E52A16BF29CC034039268BFB8F2C454000E1438996DC0340C898BB96902B454086AA984A3F01044069C36169E02B45402F51BD35B035044090DB2F9FAC2A4540DE9046054E56044040BFEFDFBC2A4540242BBF0CC66804403E5A9C31CC2B4540F5BA4560AC6F0440E561A1D6342D45405D6A847EA67E04406D7022FAB52D454011514CDE00B30440603DEE5BAD2D4540CD3E8F519EB904404F1E166A4D2D4540155454FD4AE70440745FCE6C572C45407F33315D8835054076FC1708022C45402BDEC83CF247054097C9703C9F2B4540658EE55DF5600540D07CCEDDAE2B4540438EAD67086705402DE8BD31042C4540D1EB4FE27367054044A4A65D4C2D4540B4AA251DE5600540902E36AD142E45402592E865144B0540B325AB22DC2E4540950ED6FF394C0540A1832EE1D02F454067B8019F1F460540F9872D3D9A304540138255F5F23B0540CADDE7F868314540E10CFE7E315B05407AE40F069E3145401BDA006C40640540E542E55FCB3345403D7C9928428A0540E1CFF0660D344540909E228788BB0540F392FFC9DF3545400F7C0C569CCA0540A3EA573A1F364540520ABABDA4D10540749A05DA1D36454026C808A870040640EF6FD05E7D3645409F1EDB32E00C0640338D261763364540F6B4C35F931506405E4A5D328E354540C91D3691992B06409E5F94A0BF344540FCE25295B638064040F9BB77D43445407C6473D53C47064002D880087135454019FED30D14580640EC51B81E853545400917F2086E6406404F0647C9AB3545403F8EE6C8CA6F0640963FDF162C374540A988D349B67A0640BABDA4315A3745401ADEACC1FB8A064020B41EBE4C384540E1F1ED5D839E0640E73A8DB4543845408044132862B10640978C63247B3A454013EF004F5AB8064090F8156BB83A4540F8A8BF5E61C10640C767B27F9E3A45409833DB15FAE00640024A438D423A4540D7BD158909EA06402C82FFAD643B4540213D450E11F70640317898F6CD3B4540D042024697170740C6151747E53A45407ADE8D05852107403AEAE8B81A3B45402E03CE52B23C07402FE065868D3A4540D07EA4880C4B074026361FD7863A4540454948A46D5C07401EC022BF7E3A4540E7E26F7B826407400612143FC63A4540B6D9588979760740D3A0681EC03C4540C6C1A563CE930740D76D50FBAD3D4540299831056BBC07400169FF03AC3B45405A9BC6F65AD00740624D6551D83B454080828B1535D8074000A94D9CDC3B454049111956F1E607403673486AA13C45402060ADDA350108403750E09D7C3C4540E8A04B38F4160840F12A6B9BE23B4540265305A3921A0840AB7823F3C83B4540A6D3BA0D6A3F08406344A2D0B23C4540BDA772DA53520840D449B6BA9C3C454082E673EE765D084016C3D501103B45404D4A41B7977408403D450E113739454053211E8997870840D5CE30B5A5384540734BAB21718F08404CDE0033DF374540BB473657CD930840DF516342CC374540E6779ACC789B084055F7C8E6AA374540A5DAA7E331A3084089981249F43645405073F22213B008400C21E7FD7F364540F086342A70D2084059F8FA5A9736454079EBFCDB65DF0840433BA759A03745402025766D6FF70840F9484A7A18384540BDC799266CFF0840E8F527F1B93745405C21ACC6121609409D11A5BDC1374540D333BDC45826094063997E89783745400CAEB9A3FF6509407D3F355EBA374540A4A7C821E2660940D1B01875AD3745408BFED0CC934B09405F7AFB73D1364540321F10E84C5A0940126A865451364540D15790662C5A0940F5F411F8C3354540C39FE1CD1A5C0940D2C26515363545403ECDC98B4C40094027F73B140534454042B456B4394E0940A530EF71A6334540CC99ED0A7D500940AF264F594D33454015A8C5E0613A0940A1F65B3B51324540B08EE3874A4309405F9A22C0E93145404DBED9E6C6540940A4703D0AD7314540359BC761303F094019541B9C88304540E7DF2EFB75470940CD5B751DAA2F45405F251FBB0B5409403ED00A0C592F4540E99C9FE238500940AA2C0ABB282E45403387A4164A660940E2395B40682D4540A45181936D800940B35F77BAF32C45406CD097DEFE7C0940C652245F092C4540FB743C66A092094028F4FA93F82A4540ACCABE2B829F0940CF842689252B4540D2C8E7154F9D0940D5963AC8EB2B45409CA8A5B915A209400150C58D5B2C454075CDE49B6DAE094060EAE74D452C454001857AFA08BC0940A988D349B62C4540F8A75489B2D70940C075C58CF02C454033FB3C4679E60940A5164A26A72C4540B49080D1E5ED094085CE6BEC122B45404D2F3196E9F7094045D95BCAF92A45400282397AFCFE094001A1F5F0652A4540D38558FD11060A4016325706D52A4540FCC3961E4D150A40DA56B3CEF82A45408F537424971F0A40431EC18D942B454013D4F02DAC3B0A40E4857478082B454006499F56D13F0A40D7DF12807F2A4540CCEB884336700A406F63B323D5294540F2ED5D83BE740A40AC38D55A98294540881057CEDE790A402387889B53294540A1F2AFE5958B0A40B8CA13083B2945408274B169A5900A4008CBD8D0CD284540F2ED5D83BE740A40452E3883BF274540FA27B85851630A401E6D1CB116274540D9EE1EA0FB520A401CD13DEB1A2745402D5E2C0C91530A40DFDDCA129D25454026C45C52B55D0A400A2B1554542545406D8C9DF0125C0A40800D881057244540D591239D81510A40362383DC452445400C5872158B3F0A4050DF32A7CB244540861DC6A4BF370A40221B48179B2445401764CBF275390A4067EDB60BCD234540F73FC05AB54B0A40349E08E23C22454008910C39B63E0A40B4942C27A1204540DEAF027CB7190A40D731AEB83820454006103E9468090A40FA7B293C68204540BEF8A23D5E080A40CB2E185C731F45404B033FAA611F0A40DAFE9595261F4540EE056685221D0A406EF9484A7A1E4540F225547078010A4026FBE769C01E45407EC51A2E72EF0940A0C37C790120454082C8224DBCE309402579AEEFC31F45404F779E78CED60940AE47E17A14204540C190D5AD9ED30940DC4AAFCDC61E4540433866D993C00940E99D0AB8E71D45409F008A91259309408AADA069891F4540732D5A80B67509402463B5F97F1F4540C2120F289B7209401BF5108DEE204540A72215C616620940BAF605F4C22145402D944C4EED4C09405DA79196CA2145403D65355D4F3409409FE3A3C519214540DD94F25A091D0940A8A78FC01F204540BAF3C473B600094074D4D171351E454021E7FD7F9CF00840488787307E1C4540CAA5F10BAFE4084041295AB9171A4540077DE9EDCFE508402CBAF59A1E164540390B7BDAE1EF0840E78A5242B0124540FCC401F4FBFE08409D2CB5DE6F104540043A93365517094060764F1E16104540E4BB94BA641C0940AB7B6473D50E4540009013268C260940EF1D3526C40E454081B2295778370940EDF483BA480F4540D5EDEC2B0F52094048C153C8950E45404E9D47C5FF5D0940DCF3FC69A30E4540357A3540696809407DE6AC4F390E45401FDB32E02C6509409BE3DC26DC0D454003B5183C4C5B0940079ACFB9DB0D4540EF39B01C21630940643C4A253C0D4540F8E12021CA7709403CF4DDAD2C0D4540BFEFDFBC38910940FEB8FDF2C90A45401764CBF27599094060AFB0E07E0A4540EC89AE0B3F9809409C51F355F20945401C42959A3DB00940904946CEC20845406682E15CC3AC0940952BBCCB45084540471CB28174B109400D36751E15074540BB6070CD1D9D0940E107E753C70645401FF818AC38950940CC26C0B0FC054540236937FA988F09402B306475AB03454077499C1551930940B686527B110145405531957EC29909404A9BAA7B64FF4440B37E33315DA809409AEAC9FCA3FD4440BA4A77D7D9B0094010B056ED9AFC44409A97C3EE3BC60940B7B585E7A5FC44400BD28C45D3D90940B4226AA2CFFB4440D2C43BC093D6094003B5183C4CFB44408F6E844545DC0940AAB9DC60A8F9444082A966D652C0094000ADF9F197F8444000E48409A3B9094094DBF63DEAF744408D5DA27A6BC009407B87DBA161F744400E1478279FBE0940E90FCD3CB9F64440F4A3E194B9B909407D9752978CF54440E7FEEA71DFAA0940C782C2A04CF544406CEA3C2AFEAF0940B42094F771F44440F486FBC8ADA9094074B7EBA529F44440F38DE89E75AD0940827170E998F34440D8D47954FC9F0940124DA08845F244407808E3A7718F09409414580053F24440FC170802648809409450FA42C8F1444080D4264EEE770940377007EA94F144405299620E826E09405EA0A4C002F044403677F4BF5C6B0940FB96395D16EF4440C84274081C490940892650C422EE44409DD497A59D3A0940FF9600FC53EE44409737876BB527094068041BD7BFED444053094FE8F5270940E25817B7D1EC4440BCC96FD1C91209401D1EC2F869EC44404CC79C67EC0B09409163EB19C2EB4440EC681CEA770109406C06B8205BEC44408675E3DD91F1084014B4C9E193EC444056F146E691DF0840CC7C073F71EC4440444E5FCFD7CC084011FDDAFAE9EB4440FBB0DEA815A608406C94F59B89E94440BB473657CD9308404701A260C6E8444076A8A624EB90084039605793A7E84440751E15FF77840840E370E65773E64440287FF78E1A730840CC988235CEE44440098CF50D4C6E0840132D793C2DE54440A7255646235F084003999D45EFE444406FD8B628B36108407E1AF7E637E444408BC22E8A1E58084050A8A78FC0E34440C362D4B5F63E08401FBC7669C3E344407C6308008E3D08401092054CE0E244409E60FF756E1A0840950C0055DCE24440E8A04B38F4160840C4D155BABBE24440F37684D382F70740377007EA94E144408D9AAF928FDD074021020EA14AE144405A9BC6F65AD007400B26FE28EAE04440C3A04CA3C9C507404819710168E0444025EA059FE6A4074078B471C45ADE444000529B38B99F07408DF161F6B2DD4440CB2DAD86C47D0740855CA96741DC4440ADF6B0170A78074014EB54F99EDB4440D07EA4880C4B074026AAB706B6DA44403C2F151BF33A0740A05225CADEDA4440EF3A1BF2CF2C0740C45E28603BDA44400AA2EE03901A0740B33F506EDBD94440F94A2025760D074006DA1D520CDA4440CBD6FA22A1ED06405111A7936CD94440B37C5D86FFD406402A711DE38AD94440E146CA1649BB0640E4D70FB1C1D844404F7974232CAA06400A67B796C9D84440295C8FC2F5880640EE0912DBDDD74440D3BF249529860640C84109336DD74440B3CD8DE9096B0640D595CFF23CD6444045D95BCAF9620640732B84D558D644404B02D4D4B25506402106BAF605D6444037161406653A06403B35971B0CD34440B83D4162BBFB054023A12DE752D2444023145B41D3D20540983270404BD14440B5DD04DF34BD054008008E3D7BD04440AB7823F3C89F0540FFAECF9CF5CF4440D9B11188D79505403A7AFCDEA6CF4440D270CADC7C830540145AD6FD63CF4440D99942E7357605407D7555A016CF44407FBDC282FB61054022C32ADEC8CE4440A933F790F05D054058FE7C5BB0CE444081CEA44DD51D05407C0C569C6ACD4440DE76A1B94EC30440CB85CABF96CB444060B1868BDC930440F6083543AACA444036EA211ADD410440295C8FC2F5C84440BA4DB857E62D044068EBE0606FC84440BEF90D130D120440FA60191BBAC744400B96EA025EE6034000C45DBD8AC6444059C4B0C398B403400533A6608DC544401327F73B146503401E6FF25B74C24440BC04A73E905C034041800C1D3BC24440D9942BBCCB450340965CC5E237C14440DFA5D425E33803401024EF1CCAC044403B8F8AFF3B02034056F2B1BB40BF4440454AB3791CC60240DF3312A111BE4440D447E00F3F5F02402A1DACFF73BC4440B680D07AF8520240BE33DAAA24BC444088F37002D329024097FF907EFBBA4440B1524145D50F0240DDE9CE13CFB94440AEB7CD5488070240CDCAF6216FB944406DC7D45DD9E50140E1F1ED5D83B64440EDD79DEE3CD1014042959A3DD0B4444065726A67989A01408D5F7825C9B144406B0C3A21749001408509A359D9B04440EC1681B1BE810140191D90847DAF4440931D1B81787D01401E6CB1DB67AF444024D40CA9A27801402C9E7AA4C1AF44404084B872F66E0140B2BB404981AF44401E8CD82780620140E59997C3EEAD4440C075C58CF0360140220038F6ECAB44402C7DE882FA36014079B130444EAB4440D671FC5069440140D253E41071AB4440020D36751E350140B8AD2D3C2FA94440E5982CEE3F320140FC8A355CE4A84440F8A6E9B3032E01405628D2FD9CA84440185C7347FF2B01403108AC1C5AA8444089B2B794F32501408C9FC6BDF9A74440D7338463961D01407E5182FE42A74440460BD0B69A150140B0045262D7A644401C261AA4E00901407B849A2155A6444039D6C56D34000140F0A5F0A0D9A544407AE063B0E2F40040F1B73D4162A5444090D8EE1EA0DB0040CC5EB69DB6A444401D3EE94482C900409B560A815CA44440873254C554BA0040132A38BC20A44440810A47904AB10040D9EBDD1FEFA34440A5F8F884EC9C004070067FBF98A3444007978E39CF98004049A12C7C7DA344401AFD6838658E004059198D7C5EA34440F3AB394030870040909F8D5C37A34440FCA9F1D24D820040992CEE3F32A34440247CEF6FD05E0040F3E7DB82A5A24440EDF483BA4841004083C0CAA145A24440AA27F38FBE290040369204E10AA244402158552FBF130040B77D8FFAEBA1444089EC832C0B0600403FC8B260E2A14440A83AE466B8C1FF3F1EA5129ED0A14440382EE3A6065AFF3F77D9AF3BDDA1444001A777F17E1CFF3F36E49F19C4A144401973D712F2C1FE3F645930F147A144406308008E3D7BFE3FFB0626378AA04440C136E2C96E66FE3F0B630B410EA04440A6457D923BECFD3FA0C6BDF90D9F4440D3C08F6AD8AFFD3FC83F33880F9E4440B0C91AF5100DFD3F247EC51A2E9E44402783A3E4D5B9FC3F96D05D12679D44408E5C37A5BC96FC3FCC41D0D1AA9C44405245F12A6B1BFC3FBAF59A1E149C4440F816D68D7707FC3F3ECE3461FB9B444072FA7ABE6679FB3F0762D9CC219B44404B5AF10D854FFB3F5307793D989A4440FED30D147827FB3FEC884336909A444051A3906456EFFA3FF9669B1BD3994440AD50A4FB39C5FA3FAB3FC23060994440B62E35423F53FA3F96B4E21B0A9944401AFB928D071BFA3FBBB9F8DB9E984440FC8A355CE4DEF93FF48AA71E699844408DF161F6B2ADF93F969350FA42984440DD7BB8E4B813F93F98A59D9ACB974440D3D85E0B7A6FF83F1631EC30269744401BD82AC1E230F83F1E34BBEEAD9644402B86AB0320EEF73FEF3CF19C2D96444016C09481035AF73F3BAA9A20EA94444092EA3BBF2841F73FB8921D1B819444401844A4A65D0CF73F9947FE60E09344409700FC53AA84F63F68E6C935059244400E2C47C8405EF63FDD7D8E8F169144406BF294D5743DF63F5C01857AFA9044400B0C59DDEAF9F53F663046240A9144403BC8EBC1A478F53F960854FF20904440B75ED3838212F53FA1D80A9A96904440E3FDB8FDF2C9F43F6058FE7C5B904440FB5C6DC5FE72F43FD5CC5A0A488F44400536E7E09950F43FD122DBF97E8E444040A6B5696C2FF43F6876DD5B918E4440D0B7054B7501F43F506D7022FA8D4440D1B01875AD7DF33F103FFF3D788D444054FCDF11152AF33F2638F581E48B44404759BF9998EEF23F2C9E7AA4C189444006BD378600E0F23F232C2AE274884440999A046F48E3F23FDAAA24B20F884440E1B4E0455FC1F23F289CDD5A268744401DC9E53FA49FF23F91990B5C1E87444050C58D5BCC8FF23FEC1681B1BE8744401E15FF774485F23F50E1085229884440906802452C62F23FD671FC506988444016A6EF350447F23F38D906EE40894440E141B3EBDE0AF23F1EE0490B97894440F0A31AF67BE2F13F834E081D74894440A6B73F170D59F13F81EA1F443288444064E76D6C7624F13F9D2CB5DE6F88444060B01BB62DCAF03FEE08A7052F884440172EABB01960F03F800C1D3BA8864440CF9F36AAD341F03F23F8DF4A76864440919DB7B1D911F03F4E64E60297854440BC3E73D6A79CEF3FD717096D39854440179CC1DF2FE6EE3F14B1886187834440AB77B81D1A16EE3F1C98DC28B2804440A6D590B8C7D2ED3F35ED629AE97E4440AE635C717154ED3F04711E4E607E444089B14CBF44BCEC3F93E52494BE7C4440580394861A05EC3F278925E5EE794440F0C16B97369CEB3FA8C7B60C3879444044300E2E1D73EB3F30682101A37744403123BC3D0881EA3FBDA772DA5374444070ED44494824EA3FAAB706B64A7244402828452BF782E93FF1BBE9961D704440BABF7ADCB75AE93F21205F42056F4440A08CF161F6B2E83F02F4FBFECD6D444028999CDA19A6E83FAF5FB01BB66D44406C7BBB253960E83F2FF7C951806C4440223999B85510E83F1AC39CA04D6C44405133A48AE2D5E73F5AF624B0396B44400F5F268A90BAE73FC9CC052E8F694440F1D8CF622992E73F512E8D5F786944409696917A4F65E73F651A4D2EC6684440BC3FDEAB56A6E63F7C0BEBC6BB674440E3C3EC65DB69E63F03931B45D66644406DE34F5436ACE63FCCD24ECDE564444017B83CD68C0CE73F2DCC423BA763444093DFA293A556E73F0C8FFD2C96624440D4D17135B2ABE73F9279E40F06624440ED2B0FD25364E83F490F43AB936144409355116E32AAE83F4AEB6F09C0614440D0B9DBF5D214E93FC6F99B5088624440C251F2EA1C03E93FDEE522BE136344406E6AA0F99CBBE83FD2E4620CAC6344407EFCA5457D92E73FAEF36F97FD6444409E9ACB0D86BAE73F8718AF79556544408F8AFF3BA242E83F22C7D63384654440D8614CFA7BA9E83FA92F4B3B3565444071AB2006BAF6E83F9A0B5C1E6B6444409FE579707756EA3FA43330F2B25E4440B4E386DF4DB7EA3F6CCEC133A15D44407D23BA675DA3EB3FB4E6C75F5A5C44409DA1B8E34DFEEB3F527E52EDD35D4440319A95ED435EEC3F33FCA71B285C4440D7DF12807F4AEC3F037AE1CE855B4440A6D24F38BB35EC3FE8154F3DD25A4440B39943520B25EC3F7973B8567B5A4440B64C86E3F90CEC3FAD1402B9C45944408B54185B08F2EB3FBEA4315A47594440081C0934D8D4EB3FF54883DBDA584440BA9F53909F8DEB3F06F1811DFF574440749A05DA1D52EB3FFD14C78157574440FB1EF5D72B2CEB3F910E0F61FC564440B4E386DF4DB7EA3F7923F3C81F56444035F0A31AF67BE93FED82C1357754444023DDCF29C84FE93F2FC37FBA815444408E06F0164850E93F363AE7A738544440187B2FBE688FE83F4DF8A57EDE5244402635B401D800E83FF2B1BB4049514440999EB0C403CAE73F5BCEA5B8AA5044403C3080F0A1C4E73FEDD808C4EB5044406728EE7893DFE73F15AB06616E514440C68503215940E73F1805C1E3DB5144407689EAAD81ADE63FF0DAA50D875144405C1E6B460639E63F73A25D8594514440221807978E39E53F6F7F2E1A32504440774A07EBFF1CE43FF2B0506B9A4F444066F6798CF24CE33FB77EFACF9A4F4440DF37BEF6CC92E23F8C84B69C4B4D44407EC34483143CE13F029A081B9E484440BB0CFFE9060AE13FA643A7E7DD46444074ED0BE885BBE03FD40CA9A27845444079E57ADB4C85E03F77F86BB246434440B6F5D37FD67CE03FAF3E1EFAEE424440DFC5FB71FB65E03F06D49B51F341444026C808A87004DF3F390EBC5AEE3C44407D586FD40AD3DD3F29B4ACFBC73A444051BEA085048CDD3F410C74ED0B3A4440F67F0EF3E505DD3FF73C7FDAA8384440362383DC4598DC3F8E1EBFB7E9374440B188618731E9DB3FADF886C2673544405708ABB184B5DA3FBD19355F25334440E4310395F1EFD93F984F560C572F4440651D8EAED2DDD93F5342B0AA5E2E4440603DEE5BAD13DA3F4F9143C4CD2D44405C1B2AC6F99BD93F78B6476FB82D44403562669FC728D93F397CD289042D44404084B872F6CED83F56BC9179E42B44405A12A0A696ADD83F5DA8FC6B792B444082AD122C0E67D83F51C1E105112B4440772FF7C95180D73F29B16B7BBB29444079944A7842AFD63FD3FA5B02F0274440F9484A7A185AD63FC44142942F264440F48C7DC9C683D53F30BABC395C254440EDBAB7223141D53F7F1475E61E2444400ED76A0F7BA1D43F5C5837DE1D234440D49B51F355F2D33F64ADA1D45E224440598638D6C56DD33F38F6ECB94C21444011DF89592F86D23F1FD7868A71204440B9A7AB3B16DBD13FF8174163261F444040321D3A3DEFD03FC5FEB27BF21A44409DF3531C075ED03F4510E7E1041A4440EC18575C1C95CD3F8448861C5B19444053793BC269C1C93FA1681EC022174440CC5D4BC8073DC73FA52E19C748144440C1E61C3C139AC43F00A94D9CDC0F444028EE7893DFA2C33F76711B0DE00D444093382BA226FAC23FB03907CF840C4440EFAA07CC43A6C23FD5777E51820A44409015FC36C478C13FF5A10BEA5B0A44402C2E8ECA4DD4C03F1361C3D32B09444088D7F50B76C3BE3FEB909BE106084440BE1589096AF8BA3FA94C310741074440C408E1D1C611B73F1899805F23074440A661F8889812B53F12DC48D9220744401E15FF774485AA3FBDFDB968C804444098FBE4284014A43F69FD2D01F8014440E34F5436ACA99C3F4EF04DD367FF4340BF4692205C01953F3352EFA99CFC434087FE092E56D4903F6ADE718A8EFC43401D91EF52EA92813F723447567EFB4340D1ADD7F4A0A0643FE8BE9CD9AEF843404832AB77B81D5A3F4704E3E0D2F74340000000000000000076E107E753F74340B020CD58349D6DBF629D2ADF33F6434060730E9E094D72BFF46F97FDBAF54340B2632310AFEB77BFC310397D3DF54340AAEE91CD55F37CBF9B20EA3E00F54340D17AF832518484BF5628D2FD9CF44340279F1EDB32E09CBF2618CE35CCF243407B6649809A5AA6BF685DA3E540F143409C4F1DAB949EB1BF3411363CBDEE43405C59A2B3CC22B4BF978DCEF929EE43406C0723F609A0B8BFA27DACE0B7EB4340D0D1AA967494BFBFBA313D6189E74340726E13EE9579C3BF49F59D5F94E243407A56D28A6F28C4BF4CA4349BC7E14340EA0775914259C4BFE7ABE46377E1434014D044D8F0F4C4BFC24CDBBFB2E04340102043C70E2AC5BF8672A25D85E04340B6D8EDB3CA4CC5BFC634D3BD4EE043402FE1D05B3CBCC5BF1348895DDBDF434079CDAB3AAB05C6BF136058FE7CDF43407BF5F1D077B7C6BFFCFF3861C2DE43400EA14ACD1E68C7BFB3D1393FC5DD43409A07B0C8AF1FC8BFB29B19FD68DC4340F052EA92718CC8BFD2E5CDE15ADB4340CC24EA059FE6C8BF520DFB3DB1DA4340018A9125732CC9BFE61E12BEF7D9434041834D9D47C5C9BF8330B77BB9D743404E469561DC0DCABFDE91B1DAFCD54340FC19DEACC1FBCABFFBB1497EC4D343406F4562821ABECBBF340EF5BBB0D34340817687140324CCBF30BC92E4B9D24340B6BA9C121093CEBFC5C9FD0E45D1434088F71C588E90D0BF971DE21FB6CE4340B5A4A31CCC26D1BF4FE61F7D93CC4340E753C72AA567D1BFEEAF1EF7ADCA4340156F641EF983D1BF9D4A06802ACA4340037976F9D687D1BFA52F849CF7C943407AFB73D190F1D1BF69705B5B78C84340632992AF0452D2BFC07971E2ABC743400EA48B4D2B85D2BFA38FF98040C74340035E66D828EBD2BFECF7C43A55C64340878C47A98427D3BFA723809BC5C54340C784984BAAB6D3BF342F87DD77C4434073D9E89C9FE2D3BF3D2CD49AE6C3434096438B6CE7FBD3BF7AC7293A92C34340A3ACDF4C4C17D4BF8D7E349C32C34340AFE94141295AD4BFE700C11C3DC24340E82E89B3226AD4BF1FF64201DBC1434043AD69DE718AD4BF9850C1E105C14340A986FD9E58A7D4BF5FECBDF8A2BF4340CB694FC939B1D4BFC1C8CB9A58BE4340BBD39D279EB3D4BF1AE1ED4108BE43405B9544F64196D4BFA2EE0390DABA43400875914259F8D4BFA87004A914BB434099D87C5C1B2AD5BF8350DEC7D1BA43403A083A5AD592D4BFC87BD5CA84B94340CA1649BBD1C7D4BF9A42E73576B943402BC24D469561D5BF69AB92C83EB84340A38FF9804067D5BFF52D73BA2CB6434070D234289A07D4BF2FDE8FDB2FAD43407427D87F9D9BD2BF5F96766A2EA7434049F3C7B4368DD1BF4ACE893DB4A343406919A9F7544ECFBFF54883DBDA9C4340FF3EE3C28190CCBF21904B1C7998434012BF620D17B9CBBFC4EBFA05BB974340CC7F48BF7D1DCCBFDFA46950349743400135B56CAD2FCEBF59A65F22DE964340813E912749D7CEBF7C2AA73D25954340BEF90D130D52CEBF5B3FFD67CD914340465F419AB168CCBF72512D228A8D4340892650C42286C9BFD270CADC7C874340D34CF73AA92FC7BFFC8D76DCF0834340ABEAE5779ACCC2BF1669E21DE07D4340A5BF97C28366C1BF8DD2A57F497C4340FAEE5696E82CC1BFF778211D1E7C4340228D0A9C6C03C1BF755AB741ED7B4340EFC7ED974F56C0BFB9FE5D9F397B4340490ED8D5E429BFBF40DD4081777A4340E222F77475C7BEBF4C3448C1537A4340BBF1EEC8586DBEBFFD69A33A1D7A434047AB5AD2510EBEBF06F1811DFF794340A779C7293A92BBBF5AA0DD21C57843401ADF1797AAB4B1BFEF1EA0FB727443407B6649809A5AA6BF3DB7D0950872434012D89C836742A3BFE7DF2EFB75714340D847A7AE7C9697BF2D0B26FE28704340DF516342CC2585BF4EF04DD3676F4340E0F2583332C88D3FC2120F289B6E4340E2B034F0A31A963FCF11F92EA56E43408E5BCCCF0D4DA13FCDB1BCAB1E6E4340F6083543AA28A63FF1BBE9961D6E4340473B6EF8DD74AB3F020F0C207C6E43407380608E1EBFB73F5C3AE63C636D4340605B3FFD67CDBB3FC93EC8B2606C43407286E28E37F9BD3F74EE76BD346B4340E89FE062450DC03FF6083543AA6A43408FC2F5285C8FC03FD9B5BDDD926A4340B1C05774EB35C13F7BDAE1AFC96A4340EFAA07CC43A6C23F7BDB4C85786A434028EE7893DFA2C33F47382D78D1694340C495B377465BC53F718E3A3AAE6843406B9E23F25D4AC93FD272A087DA6643405055A1815836C93F6E162F1686664340EB538EC9E2FEC73FFA0D130D52664340ACE3F8A1D288C73F1B2C9CA4F9654340E1EEACDD76A1C73F84B9DDCB7D6443401BDA006C4084C83F325706D5066343400553CDACA580CA3FA62A6D718D614340BF45274BADF7CB3F2861A6ED5F614340D2A92B9FE579CC3F840D4FAF94614340771211FE45D0CC3F994869368F5F4340E7E104A6D3BACD3FC8B60C384B5F43400BF148BC3C9DCD3FD15CA791965E4340CE1951DA1B7CCD3F3E5A9C31CC5D4340CC4065FCFB8CCB3FC19140834D5D43404833164D6727CB3FEF1AF4A5B75D4340B4E89D0AB8E7C93FD597A59D9A5D434022C495B37746C93F9487855AD35C434028D368723106C83F52B648DA8D5C4340A3CEDC43C2F7C63F39807EDFBF5B4340AF97A608707AC53FA52C431CEB5A4340634337FB03E5C43FC9E88024EC594340B519A721AAF0C33FEA758BC0585943404C88B9A46ABBC33FAC1A84B9DD57434028EE7893DFA2C33F1CB28174B15743409B3924B55032C33F18B0E42A16574340EFAA07CC43A6C23F2DB4739A05584340FA43334FAE29C03F4966F50EB7574340006F8104C58FBD3FD4B837BF61564340FA08FCE1E7BFBB3FC4E9245B5D564340B7990AF148BCB83F5FCE6C57E85543407E569929ADBFB53F1CEA77616B5443403691990B5C1EB33FC136E2C96E52434044FB58C16F43B43F19AA622AFD504340B79BE09BA6CFB23F5C5837DE1D5143406F0ED76A0F7BB13FD4282499D55143405EF23FF9BB77AC3F68EC4B361E524340B22C98F8A3A8A33FD3122BA39151434045BA9F53909F9D3F8E3A3AAE465043400C5872158BDF843F1E335019FF504340EB1C03B2D7BB8FBFC1711937355043404F75C8CD70039EBFF8C610001C4F43407B6649809A5AA6BF121615713A4D43403AAE4676A565ACBF594C6C3EAE4B434058FFE7305F5EB0BF00A94D9CDC494340FC7266BB421FB0BF18CDCAF6214943407BC1A7397991A9BF397F130A1148434077103B53E8BCAEBFCEC4742156474340FA7B293C6876B1BFD064FF3C0D464340CC2A6C06B820B3BFFFCEF6E80D454340327381CB63CDB8BF5A0D897B2C434340BE4C1421753BBBBFD3A414747B4343401A53B0C6D974BCBF478E74064644434055682096CD1CC2BF0E315EF3AA4443404A7EC4AF58C3C3BFF163CC5D4B4443407A51BB5F05F8C4BF0282397AFC424340691D554D1075C5BFA67D737FF54243408A1F63EE5A42C6BF51DB8651104243400B410E4A9869C9BF99D9E731CA414340CD936B0A6476CCBF310C5872154143405C3CBCE7C072CEBF45D61A4AED3F43405358A9A0A2EAD0BF2657B1F84D3F434011FE45D09849D3BF3BFF76D9AF3D434035B39602D2FED5BF03CFBD874B3A43408D9C853DEDF0D7BFB5FCC0559E384340526518778368D8BFF4A96395D23743405532005471E3D8BF2F88484DBB3643407E39B35DA10FD9BF0113B87537354340CC441152B7B3D9BF054D4BAC8C344340F6B2EDB43522DABFE3FA777DE6304340444E5FCFD72CDABFAAD55757052E434077BE9F1A2FDDD9BF5B41D3122B2D4340E8DA17D00B77DABFA4FE7A85052D4340AC38D55A9885DBBF1EE1B4E0452D43400BD3F71A82E3DBBF779E78CE162E434040F7E5CC7685DCBFC1C8CB9A582E43407EE36BCF2C09DFBF060FD3BEB92B4340C5E74EB0FF3ADFBFA439B2F2CB2A43406005F86EF3C6DFBF2A1BD654162B43409CFA40F2CE21E0BF5A83F755B92A4340377172BF4351E0BF4DF564FED12943400056478E7486E0BF25ADF886C2274340FD4D2844C0A1E0BF0CAEB9A3FF254340B343FCC3969EE0BF064B75012F2343404A24D1CB2896E0BF8099EFE027224340C712D6C6D889E0BFE10CFE7E31214340E96168757286E0BF522AE109BD204340EDD808C4EB7AE0BFA9A5B915C21E4340F2272A1BD654E0BFECDFF599B31C4340705D3123BC3DE0BF014EEFE2FD1A4340DB334B02D454E0BF28B7ED7BD41943409D103AE8128EE0BF6DE7FBA9F118434030BABC395C2BE1BF6118B0E42A1843400C04013274ECE1BF1A31B3CF63184340CE716E13EE15E2BFAF97A608701843405F5CAAD216D7E2BF8C81751C3F1843405FB4C70BE9F0E2BF7B2DE8BD31184340EBFF1CE6CB0BE3BFADC266800B18434066F4A3E19439E3BF4FE960FD9F174340AA436E861B70E3BF24F0879FFF1643400070ECD97399E3BFE82D1EDE7316434034F6251B0FB6E3BF6AA67B9DD41543404E0E9F7422C1E3BFDD7C23BA67154340B9FC87F4DBD7E3BF7D93A641D1144340C2BD326FD5F5E3BFC03DCF9F36144340F88A6EBDA607E4BFE8120EBDC513434064E8D841252EE4BFE030D12005134340F226BF45274BE4BF3B8F8AFF3B124340BF805EB87361E4BFBADA8AFD65114340F81A82E3326EE4BF2DEDD45C6E10434038A1100187D0E4BF0E30F31DFC0643402E3883BF5FCCE4BFF4C0C760C5034340F86EF3C649E1E4BF4AED45B41D0343408C6A11514CDEE4BF5D8B16A06D014340823B50A73CBAE4BFFB2477D844004340297AE063B0E2E4BF2639605793FF4240D6FCF84B8BFAE4BFB4722F302BFE4240280B5F5FEB52E5BF1B6327BC04FD42402D5BEB8B84B6E5BF280CCA349AFC424003CDE7DCEDFAE5BF9BC937DBDCFC4240AF230ED9403AE6BF5646239F57FC4240E04DB7EC107FE6BF7BBE66B96CFA42400A6AF816D68DE6BF6B0C3A2174F842407BF65CA626C1E6BFCDE49B6D6EF842402D7AA702EEF9E6BFE8F527F1B9F7424069519FE40E1BE7BF280EA0DFF7F542409B1DA9BEF30BE7BF7D3CF4DDADF44240AD8905BEA25BE7BF3EAE0D15E3F44240AB92C83EC8B2E7BF19726C3D43F442405DC30C8D2702E8BF446B459BE3F242401633C2DB8310E8BF577C43E1B3F142401D007157AF22E8BFC366800BB2EF4240E1CFF0660D5EE8BF1E520C9068EE4240FA6184F06863E8BFA6B915C26AEC42403694DA8B683BE8BF3ACD02ED0EE94240D1E638B709F7E7BFB2D991EA3BE54240410FB56D1805E8BF63B323D577E44240CA3159DC7FE4E7BF0FEECEDA6DE342404DD6A88768F4E7BF3737A6272CE342402BC24D469561E8BF3E20D099B4E54240AEBA0ED59464E8BF81AFE8D66BE64240F9DA334B02D4E8BF2448A5D8D1E84240594C6C3EAE0DE9BF67F0F78BD9E842401C295B24ED46E9BF11DF89592FE84240B95510035D7BE9BFB6847CD0B3E742402522FC8BA0B1E9BFC5C6BC8E38E642404B00FE2955A2E9BF4D86E3F90CE44240CB13083BC52AEABF083C3080F0E1424069C9E369F981EABFDF313CF6B3E042404969368FC3E0EABF9B3924B550E04240B894F3C5DE0BEBBF2579AEEFC3DF4240950D6B2A8B42EBBF55A0168387DD4240A8E507AEF284EBBF0E66136058DC4240A0A9D72D0263EBBFAE4A22FB20DB42406BB933130CE7EABF9D9E776341D942403108AC1C5A64EABFFA7B293C68D64240EEB25F77BAF3E9BF55A2EC2DE5D44240FBB0DEA81526E9BF5FD0420246D3424019ABCDFFAB0EE8BFAE64C74620D242402AC423F1F2F4E7BFA0F99CBB5DD14240CF11F92EA5AEE7BF2524D236FED0424033FCA71B2870E7BFAE10566309D14240624CFA7B293CE7BFC53D963E74D14240D9CC21A98512E7BF4CA60A4625D34240F4FE3F4E9830E7BFCBDAA6785CD44240D769A4A5F276E7BF2F6AF7AB00D54240E947C3297373E7BF95F3C5DE8BD5424031D28BDAFDAAE7BF373465A71FD84240B306EFAB72A1E7BFACC77DAB75D84240178046E9D23FE7BFA69883A0A3D54240EDF318E59997E6BF3D9B559FABD142406E179AEB3452E6BF1DE8A1B60DD1424071AE6186C613E6BF9DF529C764D1424097CADB114E0BE6BFD2C2651536D14240DFFDF15EB532E6BF6495D233BDD042407E1EA33CF372E6BF0ABFD4CF9BD042401F662FDB4EDBE6BF2524D236FECE4240DD5CFC6D4F10E7BF9561DC0DA2CD4240C32B499EEB7BE7BF68AF3E1EFACC424084D382177D05E9BFDC63E94317CC424020D1048A5844E9BF236AA2CF47CB42408F72309B00C3E9BFE0F60489EDCA4240D80DDB166536EABFE4A08499B6C94240FB7953910AE3EABF0E2DB29DEFC9424000917EFB3AF0EABFD503E62153CA424009A4C4AEEDEDEABF2FFCE07CEACA4240134548DDCE3EEBBFCF84268925CB4240772B4B749659EBBF03098A1F63CA4240E65B1FD61BB5EBBFEB387EA834CA4240D5B14AE999DEEBBFDBDFD91EBDC94240685DA3E5400FECBF2D40DB6AD6C94240FFAF3A72A433ECBFCC0C1B65FDC842403ECBF3E0EEACECBF742497FF90C842404D69FD2D0178EDBFABE80FCD3CC74240FE62B6645504EEBF3659A31EA2C74240E2ADF36F977DEEBF6458C51B99C74240FE7F9C3061B4EEBF2638F581E4C7424077BF0AF0DD66EEBF5E4C33DDEBC84240463F1A4E999BEEBF3A57941282C9424098BD6C3B6D0DEFBF45D7851F9CC942408944A165DD3FEFBFBC5CC47762CA4240E02C25CB4928EFBF096F0F4240CC4240C5AA4198DBBDEFBFBDFDB968C8CC4240D5963AC8EBC1EFBF30BDFDB968CC42406EA46C91B49BEFBF6C257497C4CB4240675F79909EA2EFBFA41CCC26C0CA4240CCB73EAC37EAEFBF452A8C2D04CB4240DA3A38D89B18F0BFC6151747E5CA4240F94CF6CFD340F0BFA4C2D84290C94240EBC4E5780562F0BF938B31B08EC942406286C613419CF0BF982F2FC03ECA42409E978A8D79DDF0BF58569A9482CA4240172CD505BC0CF1BFD316D7F84CCA42403E3F8C101E2DF1BF18096D3997CA4240314278B47184F1BF8FE046CA16C9424005C1E3DBBBC6F1BFB6300BED9CC84240B24B546F0DECF1BF1BA19FA9D7C742406CCD565EF2FFF1BF207F69519FC64240DD9733DB15FAF1BFE945ED7E15C642402CB81FF0C0C0F1BFCB4752D2C3C44240F1D8CF6229D2F1BFFA980F0874C442408A5759DB140FF2BFFD6662BA10C542409F91088D60A3F2BF705E9CF86AC542403E0455A357C3F2BFCD76853E58C64240B3D2A41474BBF2BF640795B88EC74240A165DD3F16E2F2BF4145D5AF74C84240BE6BD097DE3EF3BFA9A3E36A64C94240D9E89C9FE278F3BFCEA623809BC9424060CAC0012D9DF3BF145AD6FD63C9424012DC48D922A9F3BF2C9E7AA4C1C942407CB60E0EF6E6F3BFAB9509BFD4C9424093DFA293A516F4BF29CB10C7BAC842404D11E0F42E1EF4BF768C2B2E8EC84240B3791C06F317F4BF69739CDB84C74240486DE2E47E47F4BFFCC8AD49B7C742401AFCFD62B664F4BFA88C7F9F71C74240C7BC8E386483F4BF952710768AC74240022CF2EB8798F4BF377172BF43C74240111956F146A6F4BF7B698A00A7C74240F8510DFB3DF1F4BF65C5707500C84240AC55BB26A435F5BFD9EBDD1FEFC7424036902E36AD54F5BF7E5182FE42C742402E3C2F151B73F5BF9A94826E2FC742401492CCEA1DAEF5BFFFB3E6C75FC64240FDFA213658F8F5BF12C2A38D23C442402E55698B6B3CF6BF9D64ABCB29C342402C7DE882FA56F6BFE00F3FFF3DC2424090BFB4A84F72F6BF62BEBC00FBC04240CF656A12BCE1F6BF9B3924B550C04240D40AD3F71A42F7BFA3224E27D9BE4240BF9A03047374F7BF0C01C0B167BD4240C959D8D30E7FF7BF8F8AFF3BA2BC42406EF9484A7A98F7BFD00EB8AE98BB42407E74EACA67B9F7BFC158DFC0E4B84240705D3123BCBDF7BFC6A4BF97C2B742407670B03731A4F7BFA70705A568B742405F0839EFFFA3F7BF7CF0DAA50DB74240E4C0ABE5CECCF7BF1171732A19B6424055A1815836F3F7BFB2B96A9E23B64240C91D3691990BF8BF4A27124C35B742409D2E8B89CD47F8BF73D712F241B7424087DD770C8F7DF8BFB29C84D217B642401E6E8786C5A8F8BF9F05A1BC8FB542404208C89750C1F8BF12C0CDE2C5B442405073F22213F0F8BF55DD239BABB44240A06EA0C03BF9F8BF6D59BE2EC3B3424044E048A0C126F9BF11AB3FC230B442408446B071FD3BF9BFF9BD4D7FF6B3424038143E5B0747F9BFDC0E0D8B51B34240F4A78DEA7460F9BFCE893DB48FB342401F2C6343377BF9BFB534B74258B3424045F295404AACF9BFC39E76F86BB24240ECDADE6E49CEF9BF8D9B1A683EB1424023658BA4DDE8F9BFF05014E813B142408C69A67B9D14FABFF1811DFF05B04240D107CBD8D04DFABF3A747ADE8DAF4240CB2C42B11574FABFAFCE31207BAD4240D2E4620CACA3FABF31444E5FCFAD42405BE9B5D958C9FABFBB2BBB6070AD42401F2E39EE940EFBBF643DB5FAEAAA4240D8BB3FDEAB56FBBF55850662D9A64240E1968FA4A487FBBF079ACFB9DBA54240718DCF64FFFCFBBFE2E5E95C51A24240689604A8A925FCBF529CA38E8EA14240840D4FAF9465FCBF3BC8EBC1A49E42404301DBC188BDFCBFB398D87C5C9D42408C683BA6EECAFCBF611C5C3AE69C4240BF60376C5BD4FCBFC26A2C616D9C42408928266F80D9FCBF87E123624A9C4240AEF199EC9FE7FCBF4A9BAA7B649B42403D9CC0745AF7FCBF0F0F61FC349A4240CEFA9463B2F8FCBF8B4E965AEF994240FC8D76DCF0FBFCBFCB10C7BAB8994240B96E4A79AD04FDBFD0D03FC1C59842401669E21DE009FDBF8A93FB1D8A984240533D997FF40DFDBF8A5A9A5B2198424076DD5B919820FDBF1E4FCB0F5C97424033C51C041D2DFDBF92AE997CB395424034F5BA45602CFDBF9679ABAE43934240A164726A6758FDBF9FCC3FFA268F42408ECEF9298E83FDBF3E5A9C31CC8D42405182FE428F98FDBF8751103CBE8B42401EFF05820099FDBF200A664CC18842403C670B08ADC7FDBF1C06F357C88642407E5182FE42CFFDBF6AA67B9DD4854240205D6C5A2904FEBFE3AAB2EF8A8442405B9544F64116FEBF485167EE21834240FD4B5299620EFEBF317898F6CD814240705CC64D0D34FEBF5DDE1CAED58042405A8121AB5B3DFEBF5DF92CCF837F42405A10CAFB385AFEBFF1D58EE21C7F424066DAFE959566FEBFD00B772E8C7E4240AA0A0DC4B259FEBF85CD00176479424067B62BF4C172FEBF8E5C37A5BC784240DCF3FC69A37AFEBF562AA8A8FA7742401343723271ABFEBFF9BEB854A5774240F30181CEA4CDFEBF1B66683C11784240CC7B9C69C2F6FEBF6B9F8EC70C784240AAD4EC815620FFBFE7543200547742409DF6949C137BFFBF7E00529B387342400E492D944C8EFFBFDB15FA60197342401B9B1DA9BEB3FFBF793C2D3F70734240EB56CF49EFDBFFBFBF49D3A068724240CF11F92EA5EEFFBFA81E69705B7142400DC68844A10500C07B32FFE89B7042407E350708E60800C0768D96033D6E42408B6CE7FBA9F1FFBF1D740987DE6C4240ADF71BEDB80100C0E9818FC18A6B4240992EC4EA8F1000C0206118B0E46A42408F554ACFF43200C004AA7F10C96A4240A7E7DD58505800C05298F738D3684240EED11BEE237700C0F20703CFBD674240AB7823F3C87F00C0C1AA7AF99D664240AA454431798300C039984D8061634240BDC282FB01AF00C064575A46EA614240164F3DD2E0D600C0B610E4A084614240A930B610E4E000C0E126A3CA30604240AC1BEF8E8CF500C0952710768A5F424045A165DD3FF600C0E6E786A6EC5E4240FD3383F8C0EE00C09B90D618745E4240753C66A032FE00C033E02C25CB5D4240630E828E561501C0DC48D922695D424066683C11C43901C092E9D0E9795D4240978E39CFD85701C0C4E8B985AE5C42400070ECD9737901C06C06B8205B5C424073A087DA368C01C05F7B6649805C4240CA4FAA7D3A9E01C0FACF9A1F7F5D424026FDBD141E1402C01AF9BCE2A9654240EF01BA2F675602C0D9D138D4EF684240492A53CC419002C0904946CEC26A42406649809A5AD602C0952D9276A36B42403620425C39DB02C0FE7BF0DAA56B42400ADB4FC6F8F002C05227A089B06B42402C47C8409E3D03C04BB1A371A86942407E8E8F16676C03C05F43705CC6674240BF49D3A0689E03C08DB62A89EC694240F6083543AAC803C0A2B3CC22146B42409A266C3F19E303C0B81D1A16A36A42409E7AA4C16DED03C01CCEFC6A0E6A42402A55A2EC2D0504C0AD6C1FF2966942409FE8BAF0833304C0AE8383BD89694240FC8EE1B19F4504C02635B401D8684240FE9DEDD11B6E04C076FA415DA4684240295B24ED467F04C012F5824F73684240D80FB1C1C28904C0DBA4A2B1F667424062156F641E9904C0CB4DD4D2DC664240DD7A4D0F0ACA04C0D2E5CDE15A634240444FCAA486D604C06F0C01C0B1614240DA006C4084D804C0C68B8521726042408E3A3AAE46F604C0D1B2EE1F0B5D4240747E8AE3C02B05C062BB7B80EE59424041649126DE4105C0AEF204C24E594240BEBD6BD0975E05C0F437A110015942404913EF004F7A05C09818CBF44B584240B6696CAF059D05C00CCD751A69574240C93846B247C805C06B8313D1AF5742402DB308C5561006C0D388997D1E5742402CB64945632D06C0B03DB324405742404E452A8C2D6406C026C45C52B559424041481630817B06C0BEA1F0D93A5A4240D047197101A806C0749A05DA1D5A424023A298BC01C606C0BBF2599E075942400B43E4F4F5DC06C0F96706F1815942402DEA93DC611307C0EF91CD55F35C424008C89750C14107C02D08E57D1C5F4240207A5226355407C05437177FDB5F424023F3C81F0C5C07C0D655815A0C6042400A815CE2C86307C0CAFE791A30604240DBF813950D6B07C01230BABC396042402C465D6BEF7307C028999CDA19604240AE2990D9599407C0EC8497E0D45F424088BD50C076D007C04583143C855E424019575C1C95DB07C026C79DD2C15E42402F35423F53EF07C024986A662D5F42405C9198A0860F08C0A96A82A8FB5E4240696E85B01A2B08C01FF7ADD6895F42407FA0DCB6EF3108C0770FD07D395F42400394861A854408C023BA675DA35F424047904AB1A39108C0A320787C7B5F4240F850A2258F0709C0BC7A15191D6042401D041DAD6A2909C030D7A205685F4240286211C30E4309C09C525E2BA15F4240FCFD62B6645509C04C378941605F4240EB538EC9E27E09C043572250FD5F424061342BDB879C09C06CEA3C2AFE5F4240CF30B5A50EB209C078D49810735F42407EFCA5457DD209C0172EABB019604240207BBDFBE3DD09C093E1783E0360424013B9E00CFEFE09C090A1630795604240427A8A1C222E0AC0F645425BCE5F4240D7D9907F66700AC0664F029B735E42407D5EF1D4238D0AC0A5F8F884EC5E42402541B8020AB50AC01633C2DB835E42406B6116DA39CD0AC08E5A61FA5E5D4240745C8DEC4AEB0AC049D576137C5B42409869FB57561A0BC00E30F31DFC5A4240ADBEBA2A502B0BC063450DA6615A42406954E0641B380BC03563D174765A4240F6D4EAABAB420BC0922232ACE259424099D87C5C1B4A0BC07FBDC282FB594240C76647AAEF5C0BC09529E620E85842405DC47762D68B0BC011346612F5584240A8380EBC5AAE0BC0B87361A417594240EA9788B7CEBF0BC060AE450BD0584240D7DD3CD521D70BC03620425C3959424091B6F1272A1B0CC074081C09345C42400281CEA44D350CC0ADC090D5AD5C424042CC2555DB4D0CC0A704C4245C5C4240DB87BCE5EA670CC00BD3F71A825B424072DD94F25A890CC00742B280095C42403F19E3C3ECA50CC0494C50C3B75C4240E9D66B7A50D00CC01AA37554355F424052D4997B48F80CC046240A2DEB5E4240FA0E7EE2001A0DC086E5CFB7055F4240207C28D192470DC082E673EE765F42402D42B115346D0DC05B0C1EA67D5D42402AE27492AD8E0DC0EBA9D557575D4240ADA580B4FFA10DC049BDA772DA5D42409279E40F06BE0DC08A7269FCC25D424086048C2E6FCE0DC083A62556465D4240871A8524B3DA0DC0FD69A33A1D5C424061FE0A992BE30DC0452C62D8615C4240A67B9DD497E50DC02F35423F535D4240F0FB372F4EFC0DC0CF126404545E42401A3048FAB40A0EC0CC7C073F715E4240B7B585E7A5220EC0984F560C575D4240C45E28603B380EC01E6FF25B745E4240CF81E50819480EC0C6BE64E3C15E4240E8667FA0DC560EC098DA5207795F42403AE97DE36BAF0EC06BD8EF8975604240CF85915ED4CE0EC03DD4B6611460424056478E7406E60EC076A4FACE2F6042409FCC3FFA260D0FC0910E0F61FC5E4240B14E95EF19490FC065DF15C1FF5E4240B9FB1C1F2D4E0FC06C21C841095F424015747B4963540FC0BD378600E05E424008CBD8D0CD5E0FC01CD2A8C0C95E4240B7D4415E0F660FC097C62FBC925E4240A60EF27A30690FC0ED48F59D5F5E42405778978BF86E0FC07D03931B455E424089981249F4720FC09F20B1DD3D5E424090A1630795780FC0BAA46ABB095E42404C55DAE21A7F0FC03AADDBA0F65D424093FDF33460900FC09772BED87B5D4240FFCEF6E80D970FC081785DBF605D424094FB1D8A029D0FC04CE0D6DD3C5D4240070C923EADA20FC0F3035779025D42404CA8E0F082A80FC055BFD2F9F05C42404241295AB9B70FC0E333D93F4F5D42404C1B0E4B03BF0FC04DBC033C695D424048C2BE9D44C40FC0861E317A6E5D4240F168E388B5D80FC0E085ADD9CA5D42406D567DAEB6E20FC0551344DD075E4240CB845FEAE7ED0FC089EB18575C5E4240BDA8DDAF02FC0FC0423EE8D9AC5E424054573ECBF30010C0BD8FA339B25E4240B3B6291E170510C095D8B5BDDD5E4240D5264EEE770810C04E4354E1CF5E424036ACA92C0A0B10C0207EFE7BF05E424013B9E00CFE0E10C06FF1F09E035F4240B401D880081110C03FA7203F1B5F4240B2497EC4AF1810C0DFC14F1C405F424006BB61DBA21C10C0164ED2FC315F42403160C9552C1E10C07497C459115F4240EBC4E578052210C05D52B5DD045F4240C05DF6EB4E2710C09C4D4700375F4240A988D349B62A10C097E13FDD405F424044DFDDCA123D10C0AB3E575BB15F424009371955865110C031B3CF63945F42403CBEBD6BD06710C06729594E425D4240C5387F130A7110C0D8463CD9CD5C4240300F99F2218810C08A7615527E5C4240494BE5ED08A710C00893E2E3135C424082E7DEC325B710C0BCCD1B27855B4240FEB5BC72BDED10C07C7BD7A02F5B424010768A55830011C035ED629AE95A4240EF1CCA50152311C09E29745E635B42409BFF571D394211C08DCF64FF3C5B42402EFEB627485C11C046EF54C03D5B424053EC681CEA6711C05395B6B8C65B4240C6BFCFB8709011C015C5ABAC6D5C4240B3EC4960739E11C0F2D24D62105C4240BA6B09F9A0A711C07E5704FF5B5B424029AE2AFBAEA811C0C576F700DD5B4240B3CD8DE909AB11C05F605628D25B4240E789E76C01B111C038328FFCC15A4240E6B1666490BB11C09B92ACC3D1594240C74CA25EF0C911C0C66D3480B7564240B3B45373B9D111C09CA5643909554240A8E2C62DE6E711C07288B8399552424099F04BFDBC0912C037E15E99B74C4240F7AE415F7A0B12C0255B5D4E094C4240191F662FDB0E12C0705B5B785E4C4240F5D89601672912C063804413284A424045D5AF743E3C12C0BD395CAB3D4A42407349D576135C12C0247B849A2149424003D19332A97112C0D6355A0EF44642409D499BAA7B8412C001BEDBBC714242409697FC4FFE8E12C090A0F831E64042405280289831A512C00C207C28D1404240B438639813B412C015C5ABAC6D404240B587BD50C0C612C0CDE9B298D83E42403D7E6FD39FED12C054707841443E4240FC3905F9D90813C001F9122A383E424001DC2C5E2C6C13C01A53B0C6D9404240CBF27519FEA313C013D731AEB8404240228D0A9C6CB313C00E677E350740424004FF5BC98EBD13C01686C8E9EB3F42408F34B8AD2DCC13C0315F5E807D3E4240D9D0CDFE40E913C01E5036E50A3D424012BD8C62B90514C0A0353FFED23A4240FFB27BF2B02014C072DEFFC7093B4240724EECA17D3C14C0280F0BB5A6394240B61490F63F5014C00473F4F8BD39424099D36531B16914C0BAA46ABB093842407901F6D1A97B14C0A1A3552DE9364240CA1AF5108D8E14C02383DC4598364240DAA84E07B29E14C03737A6272C354240C4793881E9A414C0A228D027F23442400454388254AA14C03A419B1C3E354240486B0C3A21B414C0FBCA83F41435424044300E2E1DD314C0E92ADD5D673142406E8B321B64E214C07233DC80CF2F4240CEDF844204FC14C06CCCEB88432842403563D174760215C0FD87F4DBD72742404298DBBDDC0715C01553E9279C274240D2E4620CAC1315C0DB3521AD312642402AFEEF880A1515C03080F0A144254240ACC5A700181F15C035B742588D234240A8ACA6EB892E15C0280F0BB5A61F42403563D174763215C06C956071381F4240EE5A423EE83915C096B4E21B0A1F4240BBB4E1B0344015C05587DC0C371E424022718FA50F4D15C0AD86C43D961A42403370404B575015C0D270CADC7C194240B988EFC4AC5715C016BEBED6A516424041F163CC5D5B15C0766C04E275134240E3FC4D28446015C02BA5677A891342404D4C1762F56715C014B1886187134240C32D1F49496F15C0B8AE9811DE144240139A2496947B15C0DFFAB0DEA8154240EA2285B2F08515C09E280989B4154240C34483143C8515C079909E228716424004029D499B8A15C0130A1170081742403DF19C2D209415C08483BD89211742407007EA94479715C0C826F911BF164240A48B4D2B85A015C01A868F8829174240978E39CFD8A715C0D7A3703D0A1742402C67EF8CB6AA15C0D3F885579216424079793A5794B215C0CD3B4ED1911642400C022B8716B915C0369204E10A16424027A3CA30EEC615C0027FF8F9EF1342402387889B53C915C0CC26C0B0FC1142406C4084B872C615C0DACA4BFE27114240A8E3310395C115C00EF5BBB035114240F435CB65A3C315C0888384285F104240F12BD67091BB15C0C3F01131251042405B24ED461FC315C07CB5A338470F42402B4F20EC14BB15C0EFE6A90EB90D4240F5824F73F2C215C069C6A2E9EC0C424085CE6BEC12C515C01B683EE76E0B42403866D993C0B615C03065E080960A424046459C4EB2B515C05227A089B0094240C4CE143AAFD115C04A6249B9FB0642407C293C6876DD15C088DA368C82064240425A63D009F115C0446B459BE306424031B5A50EF2FA15C0C26A2C616D064240AD1402B9C41116C0302AA913D0044240CE548847E22516C05C72DC291D044240977329AE2A4B16C0D5D006600302424073A087DA365C16C011902FA182014240FC5069C4CC6E16C09014916115014240334E4354E17F16C0D107CBD8D003424098309A95ED9316C06F2EFEB627064240957F2DAF5CBF16C0D40FEA228508424076F9D687F5C616C0081D7409870842403FAA61BF27D616C0F81C588E90074240E31B0A9FADE316C035423F53AF074240F20BAF2479EE16C08A7615527E084240A038807EDFFF16C01B9DF3531C09424029064834811217C0DF37BEF6CC0A42409F758D96031D17C02D5F97E13F0B4240A7052FFA0A2217C03D2828452B0B4240A4A99ECC3F2A17C07974232C2A0A4240D26EF4311F3017C0ADDF4C4C170A4240A5D93C0E833917C069FF03AC550B42404AEB6F09C03F17C0E947C329730B424098C11891284417C094C2BCC7990C4240711E4E603A4D17C00CB08F4E5D0D42407BA2EBC20F5E17C0B8B06EBC3B1042408C3045B9347E17C01288D7F50B1442404BE7C3B304A917C013B70A62A01742407EA99F3715B917C0CE37A27BD617424035F0A31AF6BB17C09CC1DF2F661742408940F50F22C917C0F7ADD689CB174240EA76F69507E917C02121CA17B4164240E5266A696E1518C03B56293DD317424092770E65A81A18C01BB80375CA174240C9737D1F0E2218C0CFBEF2203D174240BFD364C6DB2A18C0AD174339D1184240CAE1934E243818C021054F21571A42408753E6E61B5118C078094E7D201F4240B9162D40DB5A18C0041BD7BFEB214240B58D3F51D96018C0098A1F63EE224240787DE6AC4F6918C090DC9A745B244240E4874A23667618C05051F52B9D254240C9737D1F0E9218C0F1643733FA2542403BFF76D9AF9B18C0BE4C1421752742406D3B6D8D08A618C05D3123BC3D2A42404E7CB5A338A718C0EA03C93B872A42409225732CEFAA18C0419E5DBEF52B424050711C78B5AC18C01A4E999B6F2C42405A2BDA1CE7B618C0109370218F2E4240E2B034F0A3BA18C08F1A13622E2F4240C171193735C018C0E1D05B3CBC2F42407157AF22A3C318C07C9C69C2F62F42402E3BC43F6CC918C0C0EC9E3C2C30424065E3C116BBCD18C0B1506B9A77304240518369183ED218C0994A3FE1EC304240E63E390A10D518C0FF93BF7B4731424008AF5DDA70D818C070067FBF9831424014CFD90242DB18C0501C40BFEF31424033C2DB8310E018C07AE2395B40324240B16A10E676DF18C0386BF0BE2A334240D2FF722D5AE018C03929CC7B9C33424064ADA1D45EE418C07E18213CDA3442406553AEF02EE718C083A5BA8097354240289D4830D5EC18C07F129F3BC1364240BE310400C7EE18C0A2EC2DE57C374240E945ED7E15F018C079758E01D93742403480B74082F218C0F3AE7AC03C3842408BAA5FE97CF818C096236420CF3842406CCD565EF2FF18C01004C8D0B13942402CF3565D870A19C031242713B73C42406F1118EB1B2819C03A596ABDDF424240E6913F18782E19C0CFA0A17F824342401903EB387E3819C0384C3448C143424043908312663A19C050E1085229444240C90391459A3819C0CA1AF5108D444240C537143E5B2719C023D923D40C454240FB3E1C24442919C0FC6F253B364442406AA510C8251E19C02849D74CBE434240B9E2E2A8DC1419C063997E897841424068CF656A120C19C078280AF489404240DCF3FC69A30A19C0425E0F26C53F4240F06C8FDE700F19C05F24B4E55C3E424064CF9ECBD40419C0A3073E062B3C424072874D64E6F218C026A8E15B583B42401805C1E3DBEB18C0BC5983F7553B424063D1747632E818C096CFF23CB83B424020EC14AB06E118C06AA0F99CBB3B4240AFB48CD47BDA18C022C50089263C4240D8F2CAF5B6D918C01F0E12A27C3D42408E5A61FA5ED318C011E15F048D3D4240CB9D996038C718C01E1840F8503E4240FE62B66455C418C012F758FAD03F42408A3BDEE4B7B818C0CD91955F064142407C65DEAAEBB018C05DE2C803914142409CA8A5B915B218C017D522A29842424011C4793881C918C0AF946588634342401E882CD2C4CB18C045BDE0D39C4242406891ED7C3FD518C08A39083A5A4142402713B70A62E018C03A58FFE730414240452C62D861EC18C087E0B88C9B4042408A8EE4F21FF218C00C957F2DAF404240C619C39CA0FD18C05A46EA3D954142400A9FAD8383FD18C09B3924B55042424048A5D8D1380419C024D40CA9A24242401D59F965300619C0931E865627434240D732198EE70319C032384A5E9D434240EB1B98DC28F218C0EA92718C644342406EC328081EEF18C0AF5FB01BB64342408A5B0531D0E518C0E542E55FCB4742404434BA83D8E918C09ED0EB4FE2494240BFB5132521F118C0E5B512BA4B4A42408C101E6D1CF118C057D0B4C4CA4A4240A7EA1ED95CF518C00DC2DCEEE54A42401C7A8B87F7FC18C0BE310400C74A4240BBED42739D0619C0DFE2E13D074A4240771211FE451019C0FFE7305F5E4A4240FD1186014B1E19C035B22B2D234D42409BFF571D393219C047E350BF0B4F4240D65757056A4119C038328FFCC14E4240D65757056A4119C06A4B1DE4F54E4240D65757056A4119C0DEB06D51664F4240BE6BD097DE4E19C09964E42CEC4F4240D238D4EFC25619C0304B3B35974F4240E4A1EF6E655919C009C1AA7AF94F4240F450DB86516019C0A6EECA2E18504240A20A7F86376B19C077F700DD974F424051BB5F05F86E19C01FF30181CE4E4240F9DB9E20B18D19C0068195438B5042404391EEE7149419C0A38FF98040514240676490BB089319C0E674594C6C52424057B3CEF8BE9819C0DBA337DC47544240511212691B9F19C0C5AD8218E85442402B4D4A41B7A719C0C66D3480B7564240DFFB1BB457AF19C059164CFC51584240B262B83A00C219C0E0A128D0275C4240420A9E42AEC419C005DF347D765E4240902DCBD765B819C04D9EB29AAE5F42407E3B8908FFB219C0209A79724D5F424042CC2555DBAD19C0624ED026875F4240959EE925C6A219C0F5BBB0355B614240E9EDCF45439619C0E1455F419A61424065FD6662BA6019C01D7233DC806542409C1727BEDA6119C0E00F3FFF3D664240AF42CA4FAA7D19C004ADC090D5654240EBE2361AC08B19C01D1EC2F869664240B37C5D86FF9419C0B6114F76336742401BBCAFCA85CA19C0D2A92B9FE57342403716140665DA19C017105A0F5F764240B119E0826C091AC0B9FC87F4DB7B42402E1D739EB15F1AC0B806B64AB082424041D47D0052EB1AC0A471A8DF858B42401CEE23B726ED1AC0FCABC77DAB8B42404F1E166A4DF31AC0B0928FDD058C4240DC7F643A740A1BC0136058FE7C8D4240988A8D791D111BC0BFB9BF7ADC8D4240EE98BA2BBB301BC0168733BF9A8F42401C98DC28B2761BC05C02F04FA99242407FF78E1A13921BC00B0A83328D944240B62DCA6C90991BC0D1402C9B3994424025B03907CFA41BC00AF65FE7A69342403DD2E0B6B6B01BC0A053909F8D9442409F008A9125C31BC0EB6F09C03F95424030D5CC5A0AC81BC01344DD0720954240419E5DBEF5D11BC048E00F3FFF954240A391CF2B9EDA1BC0E7C589AF7696424034F5BA45601C1CC0B22E6EA3019A4240F4160FEF39301CC0A9143B1A879A4240423F53AF5B341CC0E1CFF0660D9A4240774B72C0AE361CC01A1A4F04719A4240D52478431A351CC0FB5DD89AAD9A4240070B2769FE381CC0103CBEBD6B9A4240512FF834273F1CC0A22424D2369A4240B0C56E9F55461CC0622EA9DA6E9A424059FAD005F59D1CC0CA4E3FA88B9A4240C8ED974F56EC1CC037E33444159A424016A4198BA6231DC0240B98C0AD994240950B957F2D3F1DC0C13BF9F4D8984240FC5580EF364F1DC09F76F86BB2984240EC4D0CC9C9541DC0E294B9F946984240D97C5C1B2A561DC01DE6CB0BB097424058E20165535E1DC03EEDF0D7649742400C5C1E6B46761DC07E552E54FE954240B134F0A31A861DC095490D6D009642406C787AA52C931DC0938E72309B964240E0F42EDE8F9B1DC099BA2BBB60964240E8BE9CD9AEA01DC038F6ECB94C97424074B2D47ABFA11DC027DBC01DA89742406CEC12D55BA31DC0EA42ACFE0899424083177D0569A61DC0B9347EE1959A424076E107E753A71DC02C2CB81FF09A4240CC63CDC820A71DC063B9A5D5909C424094F6065F98AC1DC087C43D963E9E42400E4C6E1459BB1DC023DDCF29C89F4240B515FBCBEEB91DC0096CCEC133A1424010B056ED9AB01DC0679E5C5320A342408A5A9A5B21BC1DC0D1E638B709A5424058E1968FA4C41DC0D367075C57A8424002D6AA5D13C21DC061FC34EECDA94240984F560C57C71DC085285FD042AC4240C26C020CCBBF1DC06CCD565EF2AD4240ABECBB22F8BF1DC067800BB265AF4240FF04172B6AC01DC04D9EB29AAEAF4240C6504EB4ABC01DC0AA7D3A1E33B04240ED6305BF0DC11DC0D4B837BF61B042405853591476C11DC04FE61F7D93B04240984D8061F9C31DC07F4E417E36B2424032E719FB92CD1DC02FC03E3A75B342403F389F3A56D91DC0552FBFD364B4424076FEEDB25FD71DC007D15AD1E6B44240C3482F6AF7CB1DC018EAB0C22DB542403410CB660EC91DC000016BD5AEB54240B34291EEE7D41DC0975643E21EB74240B5C4CA68E4D31DC02CBB6070CDB9424059FAD005F5DD1DC043705CC64DBB42405F5D15A8C5E01DC003603C8386BC424055F65D11FCDF1DC07D23BA675DBD4240B3EF8AE07FDB1DC0749A05DA1DBE42402D08E57D1CDD1DC02AFF5A5EB9BE4240E884D04197F01DC0529B38B9DFBF42405B5B785E2AF61DC0CFF9298E03C14240C3D7D7BAD4F81DC0274C18CDCAC24240DC82A5BA80071EC00B43E4F4F5C242406CD097DEFE0C1EC071A94A5B5CC3424021020EA14A0D1EC053E9279CDDC442403CBF28417F111EC0211E8997A7C54240D671FC5069141EC039B35DA10FC6424042B0AA5E7E171EC021787C7BD7C6424072F8A41309161EC0D236FE4465C742403CBF28417F111EC0F705F4C29DC74240B491EBA694071EC0569A94826EC742409702D2FE07081EC068CEFA9463C84240E17D552E540E1EC08DB454DE8EC84240404F0306490F1EC0BA84436FF1C842401A6EC0E787011EC0BF61A2410ACA4240F1BBE9961D021EC07769C36169CA42408061F9F36D011EC03D9E961FB8CA4240499C155113FD1DC039454772F9CB4240394206F2EC021EC0957F2DAF5CCD4240DE205A2BDAFC1DC0CBB9145795CD4240910E0F61FCF41DC0DC2BF3565DCD42407D3CF4DDADEC1DC08940F50F22CF4240E3344415FEEC1DC04721C9ACDECF4240452BF702B3E21DC0B83CD68C0CD0424080D591239DE11DC0E6CFB7054BD1424024D1CB2896DB1DC0427A8A1C22D2424070B4E386DFDD1DC0566133C005D34240153AAFB14BD41DC08E5C37A5BCD242404E2B85402ED11DC06B7F677BF4D242409B1F7F6951CF1DC073A087DA36D44240ABE97AA2EBD21DC06CEEE87FB9D4424058E36C3A02C81DC0D40D147827D54240E6913F1878CE1DC029B4ACFBC7D64240CCEF3499F1C61DC036AFEAAC16D84240D8614CFA7BC91DC04563EDEF6CD94240D55C6E30D4C11DC033C34659BFD942400588821953C01DC0F59ECA694FDB4240FCE07CEA58B51DC033E02C25CBDD4240282A1BD654B61DC05F97E13FDDDE424098FC4FFEEEAD1DC068E89FE062DF4240D06394675EAE1DC022A5D93C0EE14240A9D903ADC0A01DC0D95F764F1EE24240F22213F06B941DC0E5417A8A1CE24240226DE34F54761DC023A46E675FE54240C2189128B44C1DC053B0C6D974E8424058C6866EF6471DC0802DAF5C6FE942404E2844C021441DC0779FE3A3C5E942406E4C4F58E2411DC0271422E010EA4240B77EFACF9A3F1DC0E2CD1ABCAFEA424077DB85E63A3D1DC01327F73B14EB4240635FB2F1603B1DC02481069B3AEB4240A7ECF483BA381DC0EFCA2E185CEB424000CADFBDA3361DC0ED9C668176EB4240E82FF488D1331DC0CCB8A981E6EB4240A0FB7266BB321DC02FA699EE75EC42404F95EF1989301DC0658C0FB397ED4240960A2AAA7E251DC0C843DFDDCAEE4240CFF9298E031F1DC09F71E14048F04240D7A4DB12B9201DC00072C284D1F242402387889B53191DC0695721E527F34240ACFD9DEDD10B1DC0397F130A11F642403AE8120EBD051DC0DA3BA3AD4AF642406F29E78BBD071DC08869DFDC5FF742404089CF9D60FF1CC0D2C5A69542FA4240F9A3A833F7001DC04C7155D977FB424020F12BD670011DC0922232ACE2FB4240A54FABE80F0D1DC0BF0CC68844FD424083A7902BF5FC1CC0145CACA8C1FE42403E97A949F0F61CC0F41ABB44F5FE424049F4328AE5E61CC0F6EB4E779EFE4240C6A52A6D71DD1CC0118AADA069FF424019AA622AFDD41CC0E4326E6AA0FF424056B77A4E7ACF1CC0F5A10BEA5B0043401D8F19A88CBF1CC08CD8278062004340CF143AAFB1BB1CC0A01518B2BAFF4240580394861AB51CC0FDF675E09CFF42404D6551D845B11CC00B2593533BFF424033880FECF89F1CC01ADD41EC4CFF4240499D8026C2961CC021CB82893F0043406FD921FE618B1CC02385B2F0F5FF42401553E9279C7D1CC06CB41CE8A10043403E26529ACD831CC07100FDBE7F01434062BCE6559D851CC0596C938AC6024340F8DD74CB0E811CC0389F3A56290343402997C62FBC821CC0B726DD96C803434086747808E3771CC05BED612F14044340AE2AFBAE086E1CC0F7CC9200350543405DDDB1D826651CC0909E2287880543404B5AF10D855F1CC05B5EB9DE360543403D618907944D1CC027BC04A73E044340832F4CA60A461CC0D74E948444044340CC423BA759401CC0A0C552245F03434015C440D7BE401CC0812381069B0243403D27BD6F7C3D1CC03F52448655024340D61F6118B0341CC0DA756F4562024340BA6587F8872D1CC07847C66AF301434078B7B24467191CC0F38E53742403434020D3DA34B6071CC06631B1F9B8024340FB7953910A031CC027DD96C805034340D943FB58C1FF1BC061E3FA777D04434059C2DA183B011CC08B54185B080643409483D90418F61BC0BF0CC6884407434071917BBABAF31BC0857B65DEAA094340F6EE8FF7AAF51BC0328FFCC1C00B4340475854C4E9F41BC054C8957A160C434084F068E388F51BC0B0C56E9F550C4340478D093197F41BC052B648DA8D0C43409A43520B25F31BC0EA245B5D4E0D434037C2A2224EE71BC0E40F069E7B0D434006D7DCD1FFE21BC0B03A72A4330E434065FB90B75CDD1BC000C974E8F4104340A391CF2B9EDA1BC0F792C6681D114340E9EDCF4543D61BC0A167B3EA731143405BCF108E59D61BC0B7D26BB3B11243404DD9E90775D11BC0463F1A4E99134340A391CF2B9EDA1BC0630CACE3F813434039B4C876BEDF1BC0BEA085048C14434011A62897C6DF1BC0386BF0BE2A154340A391CF2B9EDA1BC0946C753925164340653909A52FD41BC0BE1248895D1743401AFD683865BE1BC02EE3A6069A19434005C3B98619BA1BC05B9A5B21AC1A4340AB048BC399BF1BC008AEF204C21A4340D1CFD4EB16C11BC076711B0DE01B43402E3BC43F6CC91BC0E9F010C64F1B434078EE3D5C72CC1BC0B7D5AC33BE1B4340AE8383BD89D11BC089EDEE01BA1B4340A391CF2B9EDA1BC0E0D91EBDE11A4340A0FB7266BBE21BC0C0CFB870201A434010919A7631ED1BC0A05225CADE1A43402367614F3BFC1BC0A5D76663251A4340CEFFAB8E1C091CC0EF535568201A4340CFA0A17F820B1CC028F38FBE491943409D64ABCB29111CC01B6327BC041943404A5E9D6340161CC0AD889AE8F317434001A777F17E1C1CC0B87878CF811743409BABE639222F1CC0BCE9961DE21743401212691B7F321CC0F243A51133174340C5C551B9893A1CC0E44BA8E0F016434025E99AC9373B1CC04CA4349BC717434011C5E40D30431CC046D09849D41743408ACA863595451CC097917A4FE5164340575F5D15A8551CC0022EC896E515434024456458C55B1CC0AF795567B5164340DC114E0B5E641CC0FB96395D16174340897AC1A739691CC0C5591135D1174340B32616F88A6E1CC06D58535914184340959D7E5017791CC0C6A52A6D711B4340651C23D923841CC0D717096D391D434036EA211ADD911CC0E21E4B1FBA1E4340DD0720B589931CC0ACCABE2B822143408A58C4B0C3981CC0A9893E1F65224340BC04A73E909C1CC01A1A4F0471224340022EC896E59B1CC086764EB34023434012FA997ADDA21CC0E2218C9FC6234340E99AC937DBAC1CC0E52B8194D82343401D1EC2F869AC1CC0581CCEFC6A2443402C616D8C9DB01CC0085740A19E244340580394861AB51CC01EA7E8482E25434031D3F6AFACC41CC090A4A487A1274340B79BE09BA6CF1CC04AF086342A2A434095607138F3FB1CC036954561172F4340F5BC1B0B0A131DC0F4C5DE8B2F32434011E0F42EDE1F1DC0632AFD84B33543400A82C7B7772D1DC0D80C7041B6364340D47E6B274A321DC0558671378836434023F94A2025361DC0D82E6D382C3743403C3080F0A1441DC083A3E4D5393843404A7A185A9D4C1DC07155D977453843408CDAFD2AC0571DC0931CB0ABC9374340D940BAD8B4521DC08D45D3D9C9384340EFAD484C50431DC094BF7B478D394340753E3C4B90411DC0E8323509DE3A434068B3EA73B5351DC0F0C34142943B43406571FF91E9301DC0C34659BF993C4340D464C6DB4A2F1DC0CEC47421563D434066D828EB37331DC05B28999CDA3D43403198BF42E63A1DC0E466B8019F3D434085EE92382B421DC0B308C556D03C434033FD12F1D6491DC0C2DCEEE53E3D4340F73C7FDAA83E1DC04982700514424340E7559DD5023B1DC0AD2F12DA72424340B2DAFCBFEA381DC0889FFF1EBC424340D1C952EBFD361DC01327F73B14434340B28174B169351DC08BC404357C434340F701486DE2341DC06D75392520444340EF8D210038361DC09B38B9DFA144434061527C7C42361DC0BB9BA73AE4444340321D3A3DEF361DC0406CE9D154454340828C800A47301DC0833463D1744643402F4E7CB5A3281DC0A9FA95CE8747434064CA87A06A241DC0CF328B506C494340C98FF8156B181DC0D32EA699EE494340B24B546F0D0C1DC00F0F61FC344C4340FEF2C98AE10A1DC09A5C8C81754C434015562AA8A80A1DC010E84CDA544D4340E36C3A02B8091DC0EFACDD76A14D43401BBCAFCA85FA1CC0ECF82F1004504340B1C1C2499AFF1CC0EC4E779E785043401EDC9DB5DB0E1DC066A032FE7D50434027327381CB131DC0D5CBEF3499514340BE66B96C740E1DC0EBFEB1101D5A434060B1868BDC031DC038BA4A77D75B434041834D9D47051DC0E124CD1FD35C43406A6D1ADB6B011DC0CF2C0950535D4340C806D2C5A6F51CC0556AF6402B5E434093AAED26F8E61CC0EBFD463B6E5E4340035FD1ADD7E41CC0D15CA791965E43401CB1169F02D01CC0B9DE3653216043408C868C47A9C41CC0F88898124962434006D671FC50A91CC0E179A9D898634340AD6BB41CE8A11CC0622EA9DA6E644340FE0C6FD6E09D1CC0BC581822A7654340700A2B1554841CC0C7F484251E6843400455A35703741CC02A745E63976843404912842BA0601CC032AA0CE36E68434069C878944A581CC08448861C5B6943409A27D714C84C1CC08B36C7B94D6C434079B0C56E9F451CC0B804E09F526D43406CCEC133A1291CC04EECA17DAC6E4340BD8FA339B2221CC013EF004F5A70434075E4486760241CC09C887E6DFD7043402F14B01D8C281CC0263ACB2C427143402E9276A38F291CC0A703594FAD72434098FBE42840341CC003D0285DFA73434079060DFD131C1CC033A48AE255764340C7D9740470131CC01C412AC58E7843404969368FC3F01BC08E3D7B2E537D4340A391CF2B9EDA1BC0AC55BB26A4814340BD0166BE83CF1BC0CC0C1B65FD824340A391CF2B9EDA1BC0AA4885B185844340A950DD5CFCDD1BC0B4E4F1B4FC84434033C005D9B2DC1BC044FB58C16F8543408F8B6A1151DC1BC0E8120EBDC5854340A391CF2B9EDA1BC0965F0663448643405473B9C150D71BC0B20DDC813A874340A391CF2B9EDA1BC0CE37A27BD687434016FC36C478ED1BC0728C648F508B43408AAC3594DAFB1BC07D08AA46AF8C4340FDBD141E341B1CC07A3881E9B48E43403E78EDD286231CC069519FE40E8F4340D1AFAD9FFE331CC07F2E1A321E8F43404912842BA0601CC004392861A68D43400B613596B0661CC096ED43DE728D434085D0419770681CC0E012807F4A8D434017618A72696C1CC072DF6A9DB88C4340AAEE91CD55931CC00DE2033BFE8D43403C4A253CA1971CC07B30293E3E8F434091D6187442981CC089EDEE01BA8F434001A260C6148C1CC08E91EC116A9243402A3927F6D08E1CC014ECBFCE4D934340D313967840891CC03B545392759443407F87A2409F881CC04E5E64027E954340F566D47C958C1CC04C35B39602964340B8019F1F46981CC0E7C6F48425964340FB3E1C2444A91CC067D2A6EA1E974340687A89B14CAF1CC008CA6DFB1E9743406B8313D1AFBD1CC0776682E15C974340FF5D9F39EBC31CC0E355D636C5974340187D0569C6D21CC0B6494563ED9743408B89CDC7B5E11CC01152B7B3AF98434018D00B772EEC1CC02F336C94F599434048BF7D1D38F71CC06EBE11DDB39A4340C2DF2F664BF61CC0B4AD669DF19B43401AC1C6F5EFFA1CC084B70721209D4340D02A33A5F5F71CC09D6516A1D89E43409E978A8D79FD1CC024438EAD67A04340C689AF7614F71CC04298DBBDDCA14340B6696CAF05ED1CC0A69883A0A3A3434054C6BFCFB8101DC046EBA86A82A64340DBBFB2D2A4141DC0FE47A643A7A74340F3CAF5B6991A1DC0A704C4245CA84340AEF36F97FD2A1DC0B262B83A00AA434056EF703B343C1DC0CB9D996038AB4340609335EA213A1DC0221807978EAD43405760C8EA563F1DC06CB2463D44AF43401A87FA5DD84A1DC0F0DC7BB8E4B04340888384285F401DC043C879FF1FB34340AD156D8E733B1DC0CD5CE0F258B343400264E8D841351DC0B58CD47B2AB543409AEE75525F361DC0EF02250516B6434079CC4065FC3B1DC0A14B38F416B7434018B14F00C5381DC0F9A3A833F7B843403082C64CA22E1DC01E3526C45CBA4340772CB64945331DC06C5B94D920BB4340A7785C548B381DC08CF2CCCB61BB43402106BAF605441DC0295FD04202BC43407B6B60AB044B1DC058552FBFD3BC434088F2052D24601DC0467A51BB5FBD43408198840B79641DC0F62686E464BE4340A0DE8C9AAF721DC0B743C362D4BD434090A4A487A1751DC0B8EA3A5453BE43404606B98B30851DC039B69E211CBF4340F3CB608C48841DC0DD41EC4CA1BF434043CA4FAA7D8A1DC069C36169E0BF4340D5B14AE9998E1DC0D53DB2B96AC043408C48145AD68D1DC090DB2F9FACC24340C0594A9693901DC0B1524145D5C3434094DC611399991DC08F6E844545C4434065FED13769AA1DC0A72215C616C4434092AF045262B71DC0BF49D3A068C44340F3E505D847C71DC032AB77B81DC64340FF092E56D4D01DC01BD47E6B27C84340F4C29D0B23DD1DC086C613419CC94340486FB88FDCEA1DC0821E6ADB30CA434087191A4F04F11DC07F129F3BC1CA43402AA8A8FA95FE1DC0B43A394371CB434070B20DDC810A1EC088BB7A1519CF4340F7E978CC40151EC0551344DD07D043405798BED7101C1EC00E9E094D12D14340ED478AC8B01A1EC01D0247020DD24340DF6A9DB81C1F1EC045F30016F9D34340ECDE8AC404251EC05932C7F2AED443402F336C94F52B1EC02D26361FD7D44340B43EE5982C2E1EC0321D3A3DEFD44340570740DCD52B1EC0B8AD2D3C2FD54340639CBF0985281EC059198D7C5ED543409C31CC09DA241EC0876F61DD78D543402DE8BD3104201EC0C6C210397DD54340C022BF7E881D1EC040DAFF006BD543404BAB21718F151EC0200890A163D543408849B89047101EC039471D1D57D54340FF092E56D4D01DC077103B53E8D443408159A148F7B31DC01FBDE13E72D34340F25B74B2D49A1DC0357F4C6BD3D2434091B8C7D2878E1DC09411178046D3434021CA17B490801DC0CF49EF1B5FD34340628731E9EF551DC079573D601ED24340DE5A26C3F14C1DC007B5DFDA89D2434089096AF816461DC0F92EA52E19D3434015A8C5E0612A1DC01BBD1AA034D4434073124A5F08291DC072FDBB3E73D4434034BC5983F7251DC013EE9579ABD4434065506D70221A1DC0E44BA8E0F0D44340CCB56801DA161DC0DE8E705AF0D443407DAF21382E131DC0917C259012D54340B343FCC3960E1DC08121AB5B3DD543405456D3F544071DC0D9D0CDFE40D54340419AB1683AFB1CC0A0F99CBB5DD543406479573D60DE1CC0BA68C87894D44340D8D47954FCCF1CC09A27D714C8D4434003B68311FBC41CC0D881734694D443409C69C2F693C11CC0A9143B1A87D443406C76A4FACEBF1CC0522B4CDF6BD4434072193735D0BC1CC0A9893E1F65D443402634492C29B71CC02F3201BF46D443407AA69718CBB41CC05B785E2A36D443408446B071FDAB1CC0E02D90A0F8D34340FCFD62B664A51CC06F9D7FBBECD34340CEC7B5A1629C1CC0CC0A45BA9FD343402C280CCA349A1CC05A46EA3D95D34340FB07910C39961CC089963C9E96D34340AF22A30392801CC087FC3383F8D443404912842BA0601CC0E9D495CFF2D443401E3526C45C421CC0A2F0D93A38D44340899B53C900101CC0C79DD2C1FAD543402BC0779B370E1CC0F5F75278D0D64340357A354069081CC0268A90BA9DD74340AC39403047FF1BC0FE7C5BB054DB4340BB0D6ABFB5F31BC0B9A7AB3B16DD4340F2EF332E1CF81BC0DB19A6B6D4DD4340EDD45C6E30F41BC0425C397B67E04340D591239D81F11BC0B35C363AE7E1434062F3716DA8E81BC02CB7B41A12E34340346612F582EF1BC04C55DAE21AE5434042791F4773F41BC0128942CBBAE5434054FD4AE7C3F31BC01E1840F850E643400DE198654FF21BC081ECF5EE8FE74340ED7E15E0BBED1BC004594FADBEE84340C24F1C40BFDF1BC02DB5DE6FB4E94340A391CF2B9EDA1BC0F435CB65A3E94340249D819197D51BC07F8461C092E94340FB03E5B67DCF1BC097715303CDE94340A25F5B3FFDC71BC07500C45DBDEA43400C8FFD2C96C21BC0CE8B135FEDEA4340A8C4758C2BBE1BC0145AD6FD63EB43402499D53BDCBE1BC07BFA08FCE1EB4340D942908312B61BC0C6DFF60489ED4340761893FE5EAA1BC03FC8B260E2ED4340CBB91457959D1BC06F1283C0CAEF43403FE08101849F1BC0C6A354C213F24340594FADBEBA9A1BC073D712F241F34340925A28999C9A1BC078978BF84EF4434016A75A0BB3A01BC088F37002D3F543402AE09EE74F9B1BC07E6FD39FFDF643406268757286921BC0A226FA7C94F743404165FCFB8C8B1BC026361FD786F84340EE96E4805D8D1BC029ED0DBE30FB4340AC0320EEEA851BC08A027D224FFC4340D74E9484448A1BC0EE04FBAF73FD4340292158552F7F1BC0289B728577FF4340D9EC48F59D7F1BC0C573B680D000444015713AC956771BC04DDA54DD230144409488F02F82761BC0FE9E58A7CA014440D68C0C7217811BC09F3D97A949024440BB9C121093801BC0C5387F130A0344409F76F86BB2861BC007F01648500444405A828C800A871BC0B9382A3751054440132C0E677E951BC0BDA60705A50644404BCB48BDA7921BC0B4AED172A00744402176A6D0799D1BC02CF52C08E5074440F3E32F2DEAA31BC0CB14731074084440A48CB80034AA1BC0A872DA5372084440CA1AF5108DAE1BC027DE019EB40A4440E63DCE3461BB1BC0A12FBDFDB90C4440A9DC442DCDBD1BC0F08AE07F2B0D44405111A7936CC51BC0C4EC65DB690D4440FCC3961E4DC51BC03C9F01F5660E444083C13577F4CF1BC0F1F44A59860E44404298DBBDDCD71BC0BF9B6ED9210E4440A391CF2B9EDA1BC059A7CAF78C0E4440C102983270F01BC025AFCE31200F444019AC38D55AF81BC0B81D1A16A30E4440793BC269C1FB1BC0B796C9703C0F444038BA4A77D7091CC001F9122A38104440D4B837BF61121CC06DAE9AE788124440B4E73235090E1CC0728BF9B9A113444028D6A9F23D131CC04014CC9882154440FEF15EB532111CC0C4E8B985AE1644400150C58D5B1C1CC080D4264EEE1744400B2AAA7EA5131CC0581F0F7D77194440BBEF181EFB091CC0A9C1340C1F1D444093C6681D55FD1BC03143E389201E4440F2EEC8586DEE1BC04BCB48BDA71E4440F7B182DF86E81BC0425BCEA5B81E4440971B0C7558E11BC0C7D63384631E4440A391CF2B9EDA1BC04BAE62F19B1E444037001B1021CE1BC0363E93FDF3204440F25F200890B11BC044C2F7FE062144408E3EE60302AD1BC0EE06D15AD12044408A3BDEE4B7A81BC0B55373B9C120444053245F09A4A41BC0A5F9635A9B2044403C33C170AEA11BC0CA880B40A3204440268FA7E5079E1BC042959A3DD020444043E21E4B1F9A1BC0EFA83121E62044409E279EB305941BC024D236FE442144402FDE8FDB2F8F1BC06D0377A04E2144400A117008558A1BC06249B9FB1C2144406EA5D76663851BC0C2BF081A332144400AD6389B8E801BC00A48FB1F6021444089B663EAAE7C1BC05725917D90214440BDE0D39CBC781BC0083C3080F0214440EDB94C4D82771BC07C2766BD182244408F52094FE8751BC0999CDA19A6224440C8B7770DFA721BC0DF8C9AAF9223444055DB4DF04D731BC0B2683A3B192444407B4ACE893D741BC0C91D3691992544406938656EBE711BC0B24AE9995E264440DFA7AAD0405C1BC0C2F693313E284440FE9E58A7CA471BC096ED43DE72294440C156091687431BC02C8194D8B5294440F2ED5D83BE341BC0C687D9CBB629444054C4E9245B2D1BC0919C4CDC2A2A4440D7A02FBDFD291BC07CF1457BBC2A4440E4BB94BA642C1BC0F67AF7C77B2D4440CC0D863AAC201BC04565C39ACA2E444032384A5E9D231BC0CAA31B61512F4440D7A205685B2D1BC0C38366D7BD2F4440C6C1A563CE331BC05E13D21A83304440E564E256413C1BC07286E28E37314440CF68AB92C83E1BC0304AD05FE83144402B4F20EC144B1BC03E5DDDB1D832444037FC6EBA65571BC0C6A2E9EC6434444075ADBD4F55611BC061191BBAD9374440070951BEA0651BC0EBE2361AC039444064E76D6C76641BC027A5A0DB4B3A444046B41D5377551BC0FCE1E7BF073D4440645930F147511BC06C3D4338663D4440956247E3504F1BC03A234A7B833D444087A6ECF4834A1BC027BD6F7CED3D444061FD9FC37C491BC05D3123BC3D3E44406475ABE7A4471BC0A2D288997D3E4440D5AE09698D411BC0C05AB56B42404440DA39CD02ED2E1BC074ED0BE885414440323B8BDEA9301BC0BD546CCCEB424440069D103AE8321BC077F86BB246434440B1A888D349361BC0259694BBCF4344402AC6F99B50381BC0E4F38AA71E454440C5CBD3B9A2341BC042EE224C51464440239F573CF5381BC0F6B6990AF146444059F78F85E8601BC06555849B8C4844407250C24CDB5F1BC047E350BF0B49444065A9F57EA35D1BC05725917D90494440C15774EB355D1BC069554B3ACA49444010C99063EB591BC0FC6F253B364A4440732F302B14591BC0FCA886FD9E4A4440DACBB6D3D6581BC0813FFCFCF74A4440E3A6069ACF591BC02C9FE579704B44405DDF878384581BC0AD6A4947394C44402F19C748F6481BC02174D0251C4E4440276A696E85401BC01AF9BCE2A94F4440BE310400C73E1BC0D7A6B1BD16504440087250C24C3B1BC06C97361C96504440789ACC785B391BC0D237691A14514440591822A7AF371BC0577C43E1B35144403A03232F6B321BC06BF12900C6534440CC4065FCFB2C1BC0B0AD9FFEB3544440BA2C26361F371BC0F8F9EFC16B5544401F477364E5371BC0A01A2FDD2456444072FDBB3E73361BC0F183F3A9635744405A7EE02A4F401BC080B56AD7845A44403A7AFCDEA63F1BC0F7729F1C055C4440A114ADDC0B4C1BC0A5BC5642775D44404739984D80511BC0F3ACA415DF5E444012C0CDE2C5521BC01CCD91955F6044407DB262B83A501BC0EAEA8EC53661444043705CC64D4D1BC0B2101D024764444031B3CF6394471BC0577C43E1B3654440E04C4C1762451BC0EC4B361E6C674440FE277FF78E4A1BC0A05225CADE684440BC41B456B4491BC09335EA211A6B4440594C6C3EAE4D1BC0F84F3750E06B4440E50D30F31D4C1BC0384BC972126C4440F08975AA7C3F1BC0EE3D5C72DC6B44407C2766BD183A1BC093C3279D486C44409BAA7B6473351BC0EF3CF19C2D6C44403012DA722E351BC0022D5DC1366E444081B4FF01D63A1BC0B48F15FC367044401BF33AE2903D1BC07DCD72D9E8704440A4552DE928471BC0B75D68AED37044403D9E961FB85A1BC05454FD4AE771444017450F7C0C661BC07A185A9D9C73444073BED87BF1651BC05D88D51F61764440ED2C7AA7026E1BC025085740A1784440E622BE13B36E1BC0ADDD76A1B978444086E464E256711BC01A6EC0E78779444090BE49D3A0781BC0ED9FA701837A4440F705F4C29D7B1BC09581035ABA7A4440DA8EA9BBB28B1BC075C7629B547C44403067B62BF4911BC06745D4449F7D4440289D4830D59C1BC0A5F9635A9B7E4440352905DD5EA21BC01B84B9DDCB7F4440FC8F4C874EAF1BC0FF21FDF675804440B7EEE6A90EB91BC0205D6C5A2982444025CFF57D38B81BC0062CB98AC58344404C512E8D5FA81BC08B34F10EF0844440DE718A8EE4821BC0309C6B98A1834440E4F8A1D288691BC0B29E5A7D75834440BEBC00FBE8541BC089EDEE01BA834440A01B9AB2D34F1BC03811FDDAFA834440CC9A58E02B4A1BC043C5387F138444407F315BB22A421BC09F02603C83844440664AEB6F09401BC094F6065F98844440B29DEFA7C63B1BC013BA4BE2AC8444404CC2853C823B1BC0E04BE141B38544407C7E18213C2A1BC0F0A7C64B37874440EFFE78AF5A191BC0B29E5A7D7589444089B7CEBF5D161BC077D66EBBD08A4440C170AE6186061BC06901DA56B38C44404DD6A88768041BC020B75F3E598D4440A3923A014D141BC0FAD4B14AE98F4440A1F65B3B51121BC030D80DDB16914440C3F352B131FF1AC03944DC9C4A924440B47405DB88F71AC0740B5D8940934440978BF84ECCEA1AC0E411DC48D9944440FFB1101D02D71AC0F7C95180289644400EC0064488CB1AC09EB4705985974440179E978A8DC91AC01230BABC3998444031D28BDAFDCA1AC0041F8315A798444069A9BC1DE1C41AC06571FF91E9984440901150E108C21AC029CFBC1C7699444062F4DC4257C21AC030664B56459A4440EFAD484C50C31AC093E52494BE9A44401EA33CF372B81AC022516859F79B444006F1811DFFA51AC0F06B2409C29D44408350DEC7D19C1AC06E179AEB349E4440C571E0D572971AC04628B682A69F4440799109F835921AC04966F50EB79F4440E04735ECF7841AC0806264C91C9F444094675E0EBB6F1AC0A646E867EA9F4440E012807F4A651AC0C537143E5B9F444082E15CC30C5D1AC0B4942C27A1A044402FFCE07CEA581AC0730E9E094DA044401ADCD6169E571AC07C7BD7A02F9F44404A61DEE34C531AC0B64DF1B8A89E4440AEBB79AA434E1AC02C4487C0919E444056444DF4F9481AC08257CB9D999E444002D369DD06451AC03F56F0DB109F44404B1FBAA0BE351AC01747E5266A9F4440A1A2EA573A2F1AC0BABE0F0709A144401C446B459B131AC03BA92F4B3BA34440130EBDC5C30B1AC0840CE4D9E5A1444059880E8123011AC0C74CA25EF0A144402575029A08EB19C05DA9674128A3444024B4E55C8AEB19C0F0A65B7688A34440C632FD12F1F619C0B8CCE9B298A44440F4FBFECD8BF319C0D996016729A544403CDD79E239EB19C0594C6C3EAEA544409EF0129CFAE019C05114E81379A64440C24CDBBFB2D219C05723BBD232A644403C69E1B20ACB19C044A7E7DD58A64440DB19A6B6D4C119C05340DAFF00A7444014B1886187C119C0BEBF417BF5A74440F9156BB8C8BD19C0E7A7380EBCA8444097E4805D4DAE19C0FBB1497EC4A94440FDA19927D7B419C09757AEB7CDAA4440FE80070610AE19C0730F09DFFBAB44405F61C1FD80A719C0029A081B9EAC444006685BCD3A9319C0B9162D40DBAC4440838593347F8C19C0B9FE5D9F39AD444007EFAB72A18219C08EE9094B3CAE444030D80DDB168519C0FB0626378AAE4440611C5C3AE68C19C01BF67B629DAE444024F25D4A5D9219C0D00F238447AF44406B11514CDE9019C01478279F1EB14440F6CE68AB927819C07863416150B24440EBC9FCA36F7219C07633A31F0DB144401D0247020D6619C00D384BC972B044406F4A79AD844E19C087C0914083B14440011764CBF24519C057CEDE196DB1444098309A95ED4319C02BDEC83CF2B14440D2A755F4874619C08CA2073E06B34440E92ADD5D675319C06F8099EFE0B3444052BAF42F495519C0D4D51D8B6DB444404A99D4D0065019C0D575A8A624B544401EA67D737F4519C0FE0E45813EB54440BA9F53909F3D19C0FCDF1115AAB54440452E3883BF2F19C005F9D9C875B74440F433F5BA453019C02907B30930B844408F71C5C5513919C0A7EA1ED95CB944407DE71725E82F19C07651F4C0C7BA44407AABAE43352519C06500A8E2C6BB4440D6FD63213A2419C00C3CF71E2EBD4440CDAE7B2B121319C052D4997B48BE444083F92B64AE0C19C042D13C8045BE4440E0D6DD3CD51119C08753E6E61BBF44400F63D2DF4B1119C0F7CB272B86BF4440BDE13E726B0219C076711B0DE0BF44403BE3FBE2520519C035423F53AFC14440A3E8818FC1FA18C00D1CD0D215C244403E75AC527AF618C07F87A2409FC24440D234289A07E018C045F5D6C056C54440C72C7B12D8DC18C0B874CC79C6C644403387A4164AD618C0560DC2DCEEC7444091BA9D7DE5C118C00AD9791B9BC9444035B8AD2D3CCF18C0799109F835CC44405794128255D518C06614CB2DADCC4440334FAE2990E918C05CE333D93FCD4440CCB6D3D688F018C0158DB5BFB3CD4440EC6AF294D50419C0821B295B24D144404FEB36A8FD2619C065C5707500D44440CD1FD3DA343619C0FC3905F9D9D44440CD57C9C7EE4219C0D7FA22A12DD54440268BFB8F4C4719C0E8D9ACFA5CD54440051A6CEA3C4A19C0467A51BB5FD544407B832F4CA66A19C0501A6A1492D64440EBC9FCA36F7219C059F8FA5A97D64440A5315A47558319C075C7629B54D644408F8D40BCAE9F19C030293E3E21D7444054C554FA09A719C030478FDFDBD6444032E6AE25E4B319C038F7578FFBD64440FBC9181F66BF19C09C6A2DCC42D7444002840F255AC219C02BF697DD93D744407E52EDD3F1C819C032E719FB92D744403CDA38622DCE19C0FE0E45813ED744404640852348D519C00CCD751A69D544402C2CB81FF0E019C0B03DB32440D544401AF7E6374CF419C018D00B772ED444404FCAA48636001AC0AA2C0ABB28D4444061DD7877640C1AC0350BB43BA4D44440EA92718C640F1AC0454772F90FD5444023A0C211A4121AC020B75F3E59D54440F418E59997131AC03929CC7B9CD54440707841446A1A1AC0A60BB1FA23D644406D3A02B8591C1AC0C53A55BE67D644401CEDB8E177231AC05307793D98D64440BDE3141DC9251AC026FBE769C0D64440204432E4D82A1AC01D39D21918D74440AE2CD15966311AC08A7269FCC2D74440E36F7B82C4361AC054E3A59BC4D844402D78D15790361AC0C51F459DB9D94440ABB4C5353E331AC05F605628D2D94440D6726726182E1AC0EDB94C4D82D944406EFB1EF5D72B1AC0C02154A9D9D94440E2CB441152371AC00AF4893C49DC44402D5E2C0C91331AC050DF32A7CBDC444090F8156BB8381AC087DF4DB7ECDC4440A9C29FE1CD3A1AC04E0D349F73DD4440D200DE02093A1AC0B56B425A63DE44402E39EE940E461AC0728C648F50DF44401DAED51EF6421AC02A01310917E04440CD565EF23F391AC00F0D8B51D7E0444074081C0934381AC038BF61A241E24440C85BAE7E6C321AC044DE72F563E34440F8544E7B4A2E1AC09561DC0DA2E34440AC5626FC522F1AC0910C39B69EE544409468C9E369291AC0D3156C239EE644408CF4A276BF2A1AC06798DA5207E744409E98F56228271AC016C26A2C61E74440444FCAA486261AC0EC1516DC0FE84440618A7269FC221AC0AEEFC34142E844405C3CBCE7C0221AC01FF30181CEE844406552431B801D1AC054E23AC615E9444060014C1938201AC0AF3E1EFAEEEA4440E09D7C7A6C1B1AC0A774B0FECFEB44402FA704C4241C1AC0C22FF5F3A6EC44402B137EA99F171AC0029EB47059ED444001FC53AA44191AC0C5A9D6C22CEE44404E0E9F7422111AC0355F251FBBEF4440D17AF83251141AC011548D5E0DF04440BCB376DB85261AC09BFF571D39F04440D9E89C9FE2481AC07BD976DA1AF1444071AE6186C6431AC0CEAACFD556F244403160C9552C3E1AC0B325AB22DCF2444026DF6C73633A1AC0D3669C86A8F44440F6419605132F1AC0FBE769C020F744407F86376BF02E1AC0850662D9CCF74440FCA9F1D24D321AC02BDB87BCE5F844406DC7D45DD9351AC091990B5C1EF9444005DB8827BB391AC0C11C3D7E6FF94440ADDD76A1B93E1AC0FC8D76DCF0F94440E0F42EDE8F4B1AC00A0F9A5DF7FA4440C284D1AC6C4F1AC09A266C3F19FB44407AABAE4335551AC0448655BC91FB4440C5E23785955A1AC0E1270EA0DFFB4440580394861A651AC033FE7DC685F944409A5B21ACC6721AC0AFEC82C135F9444009F9A067B37A1AC0CEFBFF3861F8444039ECBE63788C1AC0A5DC7D8E8FF84440CF81E50819C81AC069A7E67283F74440ABB4C5353ED31AC0A86E2EFEB6F74440E97FB9162DE01AC072158BDF14F84440EACDA8F92AE91AC0632992AF04F84440B47405DB88F71AC0543541D47DF844403F1F65C405001BC0ADFA5C6DC5F8444032755776C1101BC0828B153598FC4440062E8F3523131BC0492BBEA1F0FD44407E6E68CA4E1F1BC088BD50C076FE444023827170E9381BC07506465ED6FE444090BDDEFDF13E1BC012A27C410BFF444010B3976DA73D1BC053CE177B2FFC4440DA56B3CEF83E1BC07C45B75ED3FB44401E17D522A2481BC0E57E87A240F944400C772E8CF4521BC050C8CEDBD8F84440D331E719FB621BC07DEBC37AA3F84440369204E10A781BC00247020D36F94440D86322A5D97C1BC033F9669B1BF944408C9DF0129C8A1BC099BA2BBB60F84440EDBC8DCD8E941BC02E1B9DF353F8444062122EE411BC1BC0FC1BB4571FF9444028F04E3E3DC61BC0840F255AF2F844403A57941282D51BC047C9AB730CFC4440A391CF2B9EDA1BC0AA7D3A1E33FC4440456458C51BE91BC04FCFBBB1A0FC44405396218E75F11BC00E66136058FC4440139CFA40F2FE1BC0D3F6AFAC34FB44402FFCE07CEA081CC0DA20938C9CF94440651C23D923241CC0FC19DEACC1F94440508E0244C12C1CC080B6D5AC33FA444004745FCE6C371CC078F17EDC7EF94440B0E600C11C4D1CC0F4C0C760C5F94440C651B9895A5A1CC00A100533A6FC4440EF53556820761CC0A089B0E1E9FD4440FC19DEACC17B1CC05F07CE1951FE4440CB694FC939911CC0AE62F19BC2FE44409E9ACB0D869A1CC06C98A1F144FE44403CA2427573A11CC01A18795913FD4440D04543C6A3B41CC0B83EAC376AFD444033E202D028BD1CC057D11F9A79FC4440DA56B3CEF8BE1CC01AA54BFF92FA4440FE0A992B83BA1CC00C74ED0BE8F9444080643A747ABE1CC020EBA9D557F944407429AE2AFBBE1CC0FF3EE3C281F84440E411DC48D9B21CC0DEC66647AAF544404390831266BA1CC073BB97FBE4F44440C5E74EB0FFBA1CC02E20B41EBEF44440C53BC09316BE1CC0651A4D2EC6F244406EBF7CB262C81CC0A20BEA5BE6F04440F419506F46CD1CC027D87F9D9BF0444032E884D041D71CC060E97C7896F044407C6308008EED1CC071C79BFC16EF44406616A1D80AFA1CC0D2C2651536EF4440AE8383BD89011DC089B5F81400EF4440B3B112F3AC241DC0EC18575C1CED44403FADA23F34331DC0E621533E04ED4440C47762D68B411DC06170CD1DFDEB4440626A4B1DE4451DC02DE8BD3104EC44402CD8463CD94D1DC0D976DA1A11EC4440C138B874CC591DC0BFB854A52DEC44403672DD94F26A1DC0A83462669FEB4440533D997FF46D1DC01763601DC7EB4440C59107228B741DC0289CDD5A26ED44405704FF5BC98E1DC02A1900AAB8EB44401366DAFE95951DC0DA3C0E83F9E94440D462F030EDAB1DC0B2D7BB3FDEE74440F0DAA50D87B51DC0BF4692205CE7444099107349D5B61DC0A680B4FF01E844404A61DEE34CB31DC0E0DA899290E84440AE65321CCFB71DC0F88BD99255E944405ABA826DC4B31DC0129F3BC1FEE94440F17EDC7EF9B41DC0C767B27F9EEA44409128B4ACFBC71DC0A1496249B9EB444014268C6665CB1DC02DB1321AF9EC4440293FA9F6E9C81DC0E90C8CBCACED44402E008DD2A5CF1DC0F8DEDFA0BDEE44405D8B16A06DD51DC091D5AD9E93EE444050C3B7B06EDC1DC0B2A19BFD81EE44409B8E006E16DF1DC08AE42B8194EE44409B3BFA5FAEE51DC062855B3E92EE44400A100533A6F01DC08C81751C3FEE4440BC22F8DF4AF61DC0927538BA4AEF4440BB44F5D6C0F61DC0DDD3D51D8BEF4440F419506F46FD1DC0DDCD531D72EF44404981053065001EC0A7EA1ED95CEF44400D8AE6012C021EC083F755B950EF4440DD09F65FE7061EC0A0C03BF9F4EE44407A19C5724B0B1EC06116DA39CDEE4440384D9F1D700D1EC02426A8E15BEE4440BFB67EFACF0A1EC0B3D1393FC5ED4440AF601BF164071EC01D7233DC80ED44406CB41CE8A1061EC002D369DD06ED4440514B732B84051EC09BC937DBDCEC4440C74CA25EF0091EC0DCD6169E97EC44405D50DF32A70B1EC06A6AD95A5FEC4440F65E7CD11E0F1EC09BFF571D39EC4440685C381092151EC0AD1402B9C4EB44408192020B602A1EC0B16B7BBB25EB4440E146CA16494B1EC086ADD9CA4BEA44402CD7DB662A641EC0A25D85949FEA444018CFA0A17F721EC0C0EC9E3C2CEA44409B012EC896751EC002B7EEE6A9EA4440E44BA8E0F0721EC0782975C938EC4440B41CE8A1B66D1EC0AB75E272BCEC4440FE7C5BB054671EC0363AE7A738EE44407BA35698BE671EC058ACE122F7EE4440DD5B9198A0561EC02063EE5A42F04440731074B4AA551EC00664AF777FF04440ADA415DF50581EC0193C4CFBE6F04440F33E8EE6C85A1EC07E703E75ACF044408EB27E33316D1EC0E884D04197F04440C32E8A1EF8781EC00D8D278238F14440E57B462234821EC0B519A721AAF044406FD6E07D558E1EC04BCB48BDA7F04440912C6002B79E1EC0475854C4E9F04440F46BEBA7FFAC1EC01406651A4DF244405A9F724C16B71EC045662E7079F244402AC76471FFC11EC017BB7D5699F34440BA11161571CA1EC0F5108DEE20F4444020CF2EDFFAD01EC0D9CD8C7E34F444404D4D8237A4D11EC0780C8FFD2CF44440753A90F5D4DA1EC07E9065C1C4F34440B5334C6DA9E31EC079E57ADB4CF344408735954561E71EC0DA73999A04F34440558847E2E5F91EC09161156F64F244402A1BD65416051FC0D07EA4880CF344400BCF4BC5C60C1FC07784D38217F344400B5EF415A4191FC0FE2955A2ECF144405F96766A2E271FC09D81919735F14440CE37A27BD6351FC0ED0C535BEAF044408881AE7D013D1FC026529ACDE3F04440BBB4E1B034401FC0E6CAA0DAE0F044407DB262B83A601FC0D0D03FC1C5F04440B857E6ADBA5E1FC06A334E4354EF4440CAA8328CBB611FC0C093162EABEE444005BF0D315E731FC03A3E5A9C31EE4440CD72D9E89C7F1FC04303B16CE6EC44408D62B9A5D5901FC09B1DA9BEF3ED444000C79E3D97891FC0B2A03028D3F044403F524486558C1FC07764AC36FFF344407E1D386744891FC08750A5660FF64440C0D02346CF8D1FC09AD024B1A4F644400C3B8C497F9F1FC0A4FFE55AB4F64440E4F4F57CCDA21FC0C79DD2C1FAF544403D433866D9A31FC02655DB4DF0F34440AA7D3A1E33B01FC097C62FBC92F044408449F1F109C91FC015E5D2F885EF44408F6FEF1AF4D51FC0242713B70AF0444044A4A65D4CE31FC023BF7E880DF04440297B4B395FEC1FC0029D499BAAEF4440278925E5EEF31FC096B4E21B0AEF44407505DB8827FB1FC05F28603B18ED444083FB010F0C0020C09D6516A1D8EC44404CE3175E490220C0B42094F771EC4440C6151747E50620C026378AAC35EA444087A4164A260F20C05740A19E3EEA4440D940BAD8B41220C061527C7C42EA44408A3A730F091720C0A320787C7BE9444070CFF3A78D1A20C0E3512AE109E9444004392861A61D20C00B2769FE98E84440AA4885B1853020C0562B137EA9E7444023861DC6A43720C02098A3C7EFE744400893E2E3134220C0ECA2E8818FE74440E109BDFE244E20C05FD218ADA3E844403FC6DCB5845420C02E20B41EBEE84440E141B3EBDE5220C08E3BA583F5ED4440F10F5B7A345520C06555849B8CEE4440992D5915E15620C060EAE74D45F044404DF564FED15720C02DEDD45C6EF0444026E1421EC15D20C0DC12B9E00CF0444017D7F84CF65F20C0719010E50BF044407B6AF5D5556120C0CBDB114E0BF04440A5F8F884EC6420C0BAA46ABB09F04440D6E6FF55476620C0FEB4519D0EF044409E0B23BDA86520C0DD955D30B8F044404EB7EC10FF6820C0B344679945F244402CB64945636D20C0F9D7F2CAF5F244401E6CB1DB676D20C00551F70148F34440E8667FA0DC6E20C09BC937DBDCF44440E8BB5B59A26B20C076C1E09A3BF644408CDB68006F6920C0BA68C87894F64440863DEDF0D76420C04BE9995E62F844407B6AF5D5556120C0A0A9D72D02F9444017D7F84CF65F20C0266E15C440F94440DDEEE53E395A20C0B8019F1F46FA4440E0B9F770C95920C0B1F7E28BF6FA4440E8F7FD9B175720C01CB3EC4960FB4440BAF59A1E145420C04FCFBBB1A0FC4440F209D9791B5320C07BF486FBC8FD4440C4D2C08F6A4820C0A1BB24CE8AFE444046B6F3FDD44020C0DD442DCDAD004540F3AD0FEB8D3A20C0FDF9B660A900454023861DC6A43720C032E9EFA5F0004540630B410E4A3020C0520ABABDA4014540AF5E4546072C20C025B20FB22C024540F8C1F9D4B12A20C0F3C7B4368D034540E12538F5812C20C081E84999D406454050C6F8307B3120C072FBE593150945402920ED7F803520C08E0244C18C0945404A97FE25A93C20C0ED9FA701830A45400936AE7FD73F20C014E81379920A4540655419C6DD4020C06B0C3A21740A4540F2EEC8586D4620C060C8EA56CF09454057B1F84D614D20C0CB49287D210A4540AB798EC8775920C0F69A1E149408454075AF93FAB25C20C0670E492D940845408099EFE0275E20C0A4A7C821E20845407B6AF5D5556120C07651F4C0C70E45407B6AF5D5556120C05A2BDA1CE70E45409A5B21ACC66220C02A58E36C3A1045407B6AF5D5556120C008556AF640114540DFDFA0BDFA6020C058703FE0811145407B6AF5D5556120C0F0FD0DDAAB114540D9CEF753E36520C0C5707500C413454040683D7C996820C063D009A183124540AE105663097320C0BDAB1E300F114540988922A46E7720C032AEB8382A1145408F1CE90C8C7C20C0BA13ECBFCE11454044C18C29588320C025CCB4FD2B114540EE9579ABAE8320C0E86C01A1F5104540BCB1A030288320C07B336ABE4A104540138255F5F28320C08751103CBE0F4540441669E21D8820C011902FA1820F4540A837A3E6AB8C20C014596B28B50F4540670E492D949420C0A1478C9E5B0E4540BAD7497D599A20C0807EDFBF790D454083A10E2BDCA220C08E209562470D4540791F477364A520C09C1A683EE70C4540C72DE6E786A620C048C2BE9D440C454046EA3D95D3A620C06AF816D68D0B4540BAF8DB9E20A920C093AAED26F80A45400D8CBCAC89AD20C09A44BDE0D30A45405FCFD72C97B520C0FF4124438E0B45405111A7936CBD20C07FDC7EF9640B4540BA675DA3E5C020C06B0C3A21740A45402C103D2993C220C07D21E4BCFF094540AFB2B6291EC720C0A7069ACFB9094540022CF2EB87C820C0E1B20A9B010A4540AA0F24EF1CCA20C02EFEB627480A45403BDF4F8D97CE20C09BE8F351460A45404DF564FED1D720C099B7EA3A5409454053CDACA580DC20C0C9586DFE5F0945404D309C6B98E120C018CFA0A17F0A454078D1579066E420C0895FB1868B0A45404F3E3DB665E820C021E7FD7F9C0A45404EB7EC10FFF020C06B0C3A21740A4540BFD53A7139FE20C04A0D6D00360A454001857AFA080421C07A1D71C8060A45402655DB4DF00D21C066A208A9DB09454056D3F544D70D21C0E371512D22084540DEAE97A6081821C027C0B0FCF90645406473D53C471C21C00612143FC6064540030AF5F4112821C0E21E4B1FBA064540B01C2103792E21C09293895B05074540B54E5C8E573021C093E4B9BE0F074540A29C6857213521C00ABE69FAEC064540397EA834623621C0F54883DBDA0645405C72DC291D4421C06F9C14E63D064540AE9AE7887C4721C096ECD808C40545403B72A433304A21C0C573B680D0044540C72E51BD355021C0C8EE022505044540185FB4C70B5121C05704FF5BC9024540971C774A075321C06B0C3A2174004540E38BF678215D21C03A02B859BCFE444093C83EC8B26021C014D1AFAD9FFE444050C422861D6621C0BA8102EFE4FD44402448A5D8D17021C0FE7DC68503FD44408481E7DEC37521C0A5F9635A9BFC44409143C4CDA97C21C0C9E9EBF99AFB4440DAE21A9FC97E21C02EABB019E0FA44406DE4BA29E57D21C04F57772CB6F94440573ECBF3E07E21C0245F09A4C4F844401EC539EAE88021C000A8E2C62DF84440CEFBFF38618221C0F19F6EA0C0F7444049490F43AB8321C0136058FE7CF74440245E9ECE158521C0155454FD4AF744408B87F71C588621C0541C075E2DF744402F19C748F68821C0685E0EBBEFF6444043572250FD8B21C092205C0185F64440C1C760C5A98E21C0F5A276BF0AF6444068075C57CC9021C0D7BE805EB8F544402B155454FD9221C0BF805EB873F54440516B9A779C9A21C07500C45DBDF4444008E753C72A9D21C0F7B182DF86F444402592E86514A321C04F22C2BF08F44440103B53E8BCA621C0884B8E3BA5F34440D009A1832EA921C09E23F25D4AF344409EEFA7C64BAF21C08AAE0B3F38F1444068E7340BB4B321C03C31EBC550F04440E9BAF083F3B921C00DFAD2DB9FEF44409A6038D730BB21C04298DBBDDCEF444051853FC39BBD21C07AE40F069EEF44403674B33F50BE21C08E942D9276EF44408524B37A87C321C0C2DD59BBEDF0444087C3D2C08FC221C0471FF30181F2444094895B0531C021C0EE224C512EF34440F660527C7CC221C02522FC8BA0F34440A20914B188C121C0EEEA556474F44440C7B8E2E2A8C421C009C21550A8F544409831056B9CC521C074D3669C86F84440605628D2FDC421C047E350BF0BFB44406C4084B872C621C0618BDD3EABFC4440849ECDAACFC521C0A4C684984BFE444014E8137992C421C0F9DC09F65FFF4440EF7211DF89C121C07B1684F23E004540CBF3E0EEACC521C0BB7B80EECB014540CBD58F4DF2C321C0DAAD65321C054540BC0512143FC621C053B3075A81054540952710768AC521C004711E4E60064540C78157CB9DC921C0A0A52BD84608454038DC476E4DCA21C088484DBB9808454013BBB6B75BCA21C02BA4FCA4DA094540C78157CB9DC921C0533C2EAA450A454009A69A594BC921C06B0C3A21740A45402618CE35CCC821C0C4D155BABB0A4540C78157CB9DC921C01B84B9DDCB0B45404ED026874FCA21C0815D4D9EB20C45407383A10E2BCC21C04910AE80420D45402F6D382C0DCC21C0062B4EB5160E4540C02500FF94CA21C0ED48F59D5F0E4540C78157CB9DC921C030A017EE5C0E4540645A9BC6F6C221C0166EF9484A0E45403674B33F50BE21C0D8D825AAB70E4540DCF29194F4B821C00820B589930F4540C2DEC4909CB421C0E770ADF6B00F4540662FDB4E5BB321C0AE0CAA0D4E10454058703FE081B121C01FBB0B941410454014EB54F99EB121C0855FEAE74D0F4540D6C743DFDDAA21C097A949F0860E454084D9041896A721C01135D1E7A30E4540832F4CA60AA621C040321D3A3D0F45403DD175E107A721C084471B47AC0F454005BF0D315EA321C06EA7AD11C1104540EE60C43E01A421C08DF0F620041245409E7C7A6CCBA821C0206118B0E412454097C9703C9FB121C0959D7E501713454061C43E0114B321C075C93846B213454083C2A04CA3B121C074CE4F711C144540E813799274AD21C0A2D3F36E2C144540632992AF04AA21C06D1FF296AB134540055262D7F6A621C0E2218C9FC61345401557957D57A421C01364045438144540F08B4B55DAA221C098DBBDDC2715454041F4A44C6AA021C0C0AF912408174540EE98BA2BBBA021C06F2EFEB6271845404E2A1A6B7F9F21C0516C054D4B18454025CFF57D389021C0E04A766C041A4540299831056B8C21C0552FBFD3641C454073DA53724E8421C0581B6327BC1C45401EC539EAE88021C07E3A1E33501D4540DCB75A272E7F21C003CDE7DCED1C4540ABCC94D6DF7A21C09B8E006E161D4540E94482A9667621C0BFB67EFACF1E45406AD95A5F247421C0029F1F46081F45402448A5D8D17021C00A0F9A5DF71E45405F950B957F6D21C0137F1475E61E4540371B2B31CF6A21C0C37E4FAC531F4540EA5DBC1FB76721C03A58FFE730214540CA518028986121C0E86C01A1F5204540BAA29410AC5A21C098F6CDFDD5214540C3D50110775521C0747E8AE3C0234540A306D3307C4C21C0D5B0DF13EB244540B071FDBB3E4321C0EE4108C897244540FFCC203EB03B21C0A930B610E4244540DE3D40F7E53C21C0AABA473657254540198C1189423B21C02C9CA4F9632645409566F3380C3E21C06E8786C5A8274540CF30B5A50E3A21C0D1CDFE40B929454078D0ECBAB73A21C0A2F0D93A382A454003E962D34A3921C076C1E09A3B2C45405F420587173C21C0971DE21FB62C45406971C630274021C073DA53724E2C4540029CDEC5FB4121C00ED940BAD82C454031B1F9B8364421C0399A232BBF2C454091D26C1E874921C096E7C1DD592B454050FEEE1D354621C0CFA3E2FF8E2A454012143FC6DC4521C0C91CCBBBEA2945403B35971B0C4D21C0BAA1293BFD284540BD1E4C8A8F4F21C0FA28232E00294540B9718BF9B95121C0E1B721C66B284540FC00A436715221C09A07B0C8AF274540033E3F8C104E21C000A8E2C62D264540506F46CD575121C073F4F8BD4D254540C9AD49B7255A21C08EB27E3331254540D1E7A38CB86021C02368CC24EA234540D2FE0758AB6621C0B7088CF50D244540BEC0AC50A46B21C00E863AAC70234540B11875ADBD6F21C032005471E32445402448A5D8D17021C0B0CA85CABF2445405436ACA92C7221C0EA20AF0793244540BE66B96C747621C04051D9B0A62445402B89EC832C7B21C03B53E8BCC62245401EC539EAE88021C003ED0E2906224540BCADF4DA6C8421C063D34A21902145404D2F3196E98721C08E03AF963B214540022CF2EB879021C05F9B8D95982145406D01A1F5F09521C06C76A4FACE1F4540936E4BE4829B21C0CA32C4B12E2045404E2A1A6B7F9F21C08AE3C0ABE5204540A5129ED0EBA721C0E6E95C514A20454079B0C56E9FAD21C07E6FD39FFD20454064ADA1D45EB421C0560F98874C2145407BD80B056CB721C08F72309B002145401B48179B56BA21C028D4D347E01F4540011764CBF2BD21C00AA359D93E204540EDF0D7648DBA21C09D67EC4B3622454076C1E09A3BBA21C0E1D05B3CBC2345408BFB8F4C87B621C026C632FD12274540CEAACFD556B421C0A05225CADE264540679DF17D71B121C048C49448A22545409696917A4FAD21C0CAA4863600254540116DC7D45DA921C0399D64ABCB234540CA15DEE522A621C0D11F9A79722345404C530438BDA321C00EA2B5A2CD2345404A4563EDEFA421C07FBDC282FB254540520B259353A321C040BFEFDFBC264540E38A8BA372A321C065FF3C0D182845405A0EF450DBA621C0FFEBDCB41929454034D593F947A721C00394861A852A4540868E1D54E2AA21C07E18213CDA2A454050E09D7C7AAC21C073F4F8BD4D2B4540C0046EDDCDAB21C09F73B7EBA52B454065FCFB8C0BA721C0506EDBF7A82B4540CC0A45BA9FA321C07C98BD6C3B2B45404E2A1A6B7F9F21C08DEC4ACB482B4540B0928FDD059A21C0DE9387855A2B4540B2A03028D39821C06BBB09BE692A454070B378B1309421C09C340D8AE6294540FF58880E818B21C0EE073C30802A4540DB317557768121C023A298BC012C45401EC539EAE88021C0CF2F4AD05F2C454039F1D58EE27C21C0944C4EED0C2F45402448A5D8D17021C039D219187931454009C4EBFA056B21C06EDBF7A8BF3245408E3EE603026521C0103CBEBD6B324540423EE8D9AC6221C04834812216334540C1E5B166646021C0A33D5E48873345407825C9737D5F21C0A9A27895B5334540AA6395D2335521C095B88E71C535454044F98216125021C0139ED0EB4F36454071766B990C4F21C05322895E46374540A3CA30EE065121C0EB54F99E913645404C70EA03C95B21C0AD889AE8F33545405038BBB54C5E21C0E2C8039145364540A1478C9E5B6021C048C32973F337454021CB82893F6221C0B45549641F384540F58590F3FE6721C089EE59D7683745407AFD497CEE6C21C0BE672442233645402448A5D8D17021C06170CD1DFD354540B493C151F27A21C0CCD24ECDE534454064CC5D4BC87F21C0A9A27895B5334540D4D688601C8421C09FAEEE586C334540431EC18D948521C0CB4752D2C332454043C70E2A718D21C0A7406667D1314540EC1681B1BE9121C055DD239BAB324540D591239D819921C01C3F541A313345404E2A1A6B7F9F21C03620425C39334540C79BFC169DA421C001BD70E7C232454000917EFB3AA821C00A1346B3B23145402942EA76F6AD21C0F1F109D979314540812381069BB221C0615111A7933245404641F0F8F6B621C072DEFFC709334540C64D0D349FBB21C0F9D85DA0A434454081AFE8D66BC221C07AC8940F41354540D238D4EFC2BE21C0147B681F2B38454013471E882CC221C036936FB6B939454086ADD9CA4BC621C0B48EAA26883A4540C78157CB9DC921C0BEF73768AF3A4540D862B7CF2AD321C0679E5C53203B4540915F3FC406DB21C0289A07B0C83945409C4F1DAB94DE21C0E962D34A213A4540AF5DDA7058E221C009C38025573B454095D6DF1280DF21C0C896E5EB323C45409015FC36C4E021C0904FC8CEDB3C45401DE6CB0BB0DF21C018EAB0C22D3D45405F5D15A8C5D021C06B7F677BF43C454050C24CDBBFCA21C00533A6608D3D4540C78157CB9DC921C0BEA25BAFE93D454046990D32C9C821C09BE271512D3E45401C97715303C521C041D7BE805E3E45401C97715303C521C0E5EE737CB43E4540B37E33315DC821C03BE466B8013F4540B1A4DC7D8EC721C0BDAAB35A603F454017105A0F5FBE21C0016E162F16404540ECA012D731BE21C0B1C1C2499A3F454093E2E313B2BB21C0586FD40AD33F4540A3ACDF4C4CB721C04D49D6E1E83E4540CFF57D3848B821C025E7C41EDA3D45406B459BE3DCB621C03733FAD1703C454093E2E313B2BB21C044696FF0853B4540630E828E56BD21C061FD9FC37C3B45405A65A6B4FEBE21C0BB9BA73AE43A4540718E3A3AAEBE21C096422097383A4540D5B0DF13EBBC21C032569BFF5739454093E2E313B2BB21C0A6B6D4415E39454082AD122C0EB721C02C0C91D3D739454021B0726891B521C0103CBEBD6B3A4540363D282845B321C01A31B3CF633A454051DA1B7C61B221C0ABCC94D6DF3A4540B83F170D19AF21C0E606431D563A45402750C42286AD21C0FFB27BF2B03A454079758E01D9AB21C0C68B8521723A4540DC8310902FA921C09AD024B1A43A4540DFC0E44691A521C01990BDDEFD394540D49CBCC804A421C0AAB8718BF939454008944DB9C2A321C0E90FCD3CB93A45407497C45911A521C09C1727BEDA3B45403A419B1C3EA921C050E10852293C4540B1A4DC7D8EA721C09F1EDB32E03C4540EF38454772A921C07DD0B359F53D4540C158DFC0E4A621C04E0E9F74223F4540643DB5FAEAA221C0A96A82A8FB3E45404E2A1A6B7F9F21C05F622CD32F3F45402864E76D6C9E21C080B9162D403F4540211E8997A79B21C029931ADA0040454022C32ADEC89C21C07F4E417E364045404E2A1A6B7F9F21C0AD307DAF2140454055DFF94509A221C02B685A6265404540DCA16131EAA221C04CFE277FF74045400762D9CC21A121C0B1C398F4F742454042CD902A8AA721C0E36F7B82C4424540D6A8876874A721C0F59CF4BEF143454073A25D8594A721C0179F02603C4545405F5E807D74AA21C09FAC18AE0E464540E9F17B9BFEAC21C08E791D71C8464540A81DFE9AACA921C057410C74ED4745403C2EAA4544A921C07B12D89C83494540DFA815A6EFA521C07B8505F7034A45404E2A1A6B7F9F21C048895DDBDB494540DC9E20B1DD9D21C0FA9AE5B2D14945408AC8B08A379A21C001F8A754894A4540D26EF4311F9821C0A6D6FB8D764A4540BA15C26A2C9121C0E17EC003034C4540F321A81ABD8A21C0E294B9F9464C45405FB4C70BE98821C0B779E3A4304D454090BC7328438D21C0DC7F643A744E4540139B8F6B438D21C086C8E9EBF94E4540FE0C6FD6E08521C0541C075E2D5145401EC539EAE88021C03C32569BFF5145405D876A4AB27E21C083FA96395D5245409B00C3F2E77B21C0BB438A0112534540394206F2EC7A21C0AA9A20EA3E54454018B49080D17521C0B41D5377655545400BF0DDE68D7321C0344B02D4D4564540E0F42EDE8F7321C0F7729F1C0558454029CDE671187421C03B38D89B1858454064CBF275197621C07AE40F069E574540EB1D6E87867521C0D26D895C7056454005FA449E247D21C013F4177AC45445406F9C14E63D7E21C0AA9A20EA3E544540E00F3FFF3D8021C05C001AA54B5345402C29779FE38321C0336E6AA0F9524540B515FBCBEE8921C0651877836853454072BF4351A08F21C06AD95A5F2452454068CC24EA059721C0B80375CAA3514540D40B3ECDC99B21C0D76D50FBAD5145404E2A1A6B7F9F21C096EA025E66524540267156444DA421C0AAF06778B35245409CDD5A26C3A121C0AA9A20EA3E5445400745F30016A121C051888043A85445402461DF4E22A221C007793D98145545408A3E1F65C4A521C0AB22DC64545545401898158A74A721C0AB22DC6454554540A73E90BC73A821C0AB22DC64545545405517F032C3AE21C05437177FDB57454064CC5D4BC8AF21C0496760E465574540BDC282FB01AF21C05778978BF85445402F1686C8E9B321C003B68311FB5445406891ED7C3FB521C0AA9A20EA3E5445403F1F65C405B821C0075DC2A1B752454076374F75C8B521C0D1CC936B0A524540A795422097B021C0E4A08499B6514540F06B2409C2AD21C0836DC493DD504540ED9C668176AF21C09EEBFB70905045407BBFD18E1BB621C03716140665504540A7B228ECA2B821C0431A1538D94E454084D9041896B721C0AF997CB3CD4D4540CB48BDA772BA21C0F04E3E3DB64D4540DE57E542E5BF21C0240F4416694E454087C5A86BEDC521C00CE6AF90B94E4540012F336C94C521C038F581E49D4F4540CDB1BCAB1EC021C024D40CA9A25045402FBE688F17C221C09D6340F67A514540B1A4DC7D8EC721C058923CD7F7514540C78157CB9DC921C09AB51490F651454037C5E3A25ACC21C077137CD3F4514540CAFE791A30D021C01EA8531EDD50454050C58D5BCCDF21C0DECCE847C34D4540FCE07CEA58DD21C022FE614B8F4C4540C8EF6DFAB3D721C03A2174D0254C4540043A933655D721C0B5DD04DF344B45406E4C4F58E2E121C09DD497A59D4A4540C40B2252D3E621C0C007AF5DDA4A45406EF9484A7AE821C0C573B680D04A4540304AD05FE8E921C0AAB69BE09B4A4540AE10566309EB21C0F8A6E9B3034A4540C1745AB741ED21C0BB7EC16ED84845401F4B1FBAA0F621C0184339D1AE4845404487C09140FB21C0C40776FC174845406FD921FE61FB21C0FE5F75E44847454044A7E7DD58F821C09FAC18AE0E46454042EA76F695F721C039807EDFBF454540FA0967B796F921C0696FF085C944454059A48977800722C0C72C7B12D8424540C1CAA145B60B22C0C74B378941424540CFD8976C3C1022C0C9207711A64245405DDDB1D8261522C0D0B4C4CA68424540780C8FFD2C1622C05B7D7555A0424540508A56EE051622C0C72C7B12D8424540EF3A1BF2CF1422C00EF7915B93444540880FECF82F1022C01FDAC70A7E454540C80C54C6BF0F22C09FAC18AE0E464540ACCABE2B820F22C07D09151C5E46454063D2DF4BE11122C0BF28417FA14745401B4B581B631722C0BEBC00FBE848454004ADC090D51D22C011E0F42EDE494540F5F3A622152622C007B309302C4945405512D907592622C000E14389964845407AC37DE4D62C22C069519FE40E4945407D5A457F682E22C0CE6C57E883494540E19A3BFA5F2E22C055A52DAEF1494540D28C45D3D92922C0F2237EC51A4A454061A5828AAA2722C047E4BB94BA4A4540F3E505D8472722C0E20511A9694B4540B745990D322922C04C18CDCAF64B4540BF7FF3E2C42722C01BBCAFCA854C4540645930F1472122C018B14F00C54C4540D1949D7E501F22C06E4DBA2D914D4540529E7939EC1E22C0A6D425E3184F45401B4B581B631722C03A3DEFC6825045407DCC07043A1322C0C6E1CCAFE652454035B742588D1522C07EE19524CF534540F9F36DC1521522C0AA9A20EA3E5445403CDEE4B7E81422C09CA564390955454000AC8E1CE91422C0CF488446B05545405B79C9FFE40F22C06614CB2DAD564540ADFA5C6DC50E22C0AAF3A8F8BF594540E8D84125AE0B22C0CD751A69A95A45401EF98381E70622C01A53B0C6D95A45400B9A9658190522C00C3CF71E2E5B454056D28A6F280422C0F56569A7E65C4540CE37A27BD6FD21C08C67D0D03F5D454097E65608ABF921C05FEE93A3005F454084BA48A12CF421C022FC8BA0315F45401E17D522A2F021C0B612BA4BE25E4540AE10566309EB21C07C293C68765F4540C00303081FEA21C0C30FCEA78E5F4540232F6B6281E721C06FB9FAB1496045409B1F7F6951E721C0620FED6305614540B6813B50A7E421C0EA58A5F44C6145407A6F0C01C0E121C060E4654D2C624540CB4C69FD2DE121C0A583F57F0E63454026512FF834DF21C01F2BF86D88634540EE27637C98DD21C0CC7F48BF7D634540D3BD4EEACBDA21C0062AE3DF6764454004763579CAD221C0F98557923C654540C78157CB9DC921C0F4A8F8BF23644540CDCEA2772AC821C0F3CCCB61F763454038DBDC989EC821C0D42B6519E2644540C78157CB9DC921C0A702EE79FE6445406D1D1CEC4DCC21C0155454FD4A65454098512CB7B4CA21C07DE71725E865454022E010AAD4CC21C0AFB321FFCC6645401EA9BEF38BCA21C0C972124A5F684540C78157CB9DC921C0D63730B95168454048FDF50A0BC621C0F1BBE9961D684540427C60C77FC121C00E1478279F6845408B70935165C021C061C1FD80076A4540026729594EC221C0FC36C478CD6945409A43520B25C321C03F74417DCB6845402EFF21FDF6C521C0AF22A30392684540C78157CB9DC921C0AB5D13D21A694540ED9925016ACA21C0EF737CB43869454005A2276552CB21C05F605628D2694540CFBEF2203DCD21C0E144F46BEB6945405C92037635D121C0420A9E42AE66454033C005D9B2D421C02882380F27664540CCEB884336D821C0F06AB93313664540FBEAAA402DDE21C0522976340E674540037B4CA434E321C0B4E6C75F5A664540289A07B0C8E721C0CB83F41439644540E8F9D34675EA21C0FFAECF9CF56345404206F2ECF2ED21C040DF162CD56345407F349C3237EF21C018946934B9644540D1798D5DA2F221C0F8FA5A971A6545405665DF15C1F721C0CE1ABCAFCA6345402672C119FC0522C05FD3838252644540DB87BCE5EA0722C04DF8A57EDE644540C9AB730CC80622C032C9C859D8654540A0185932C70A22C0B4E6C75F5A66454077BAF3C4730E22C032772D211F664540FFE89B340D1222C0335019FF3E654540D046AE9B521622C0B2D47ABFD16445407FC16ED8B62022C014AE47E17A644540475A2A6F472022C0325A4755136445404F05DCF3FC1922C06D1B4641F062454025CB49287D1922C0DE04DF347D62454040A54A94BD1D22C0E31C75745C6145407F8461C0922322C05DDDB1D826614540EF54C03DCF2722C08F8AFF3BA26045405D19541B9C2822C01213D4F02D6045403AAFB14B542722C055849B8C2A5F4540C0417BF5F12822C07862D68BA15E45407784D382172D22C076FA415DA45E4540E7C2482F6A2F22C0A30227DBC05F454052D158FB3B3322C0EACF7EA48860454057CC086F0F3A22C0D2E1218C9F604540A796ADF5453A22C0D68BA19C68614540853FC39B354022C04F3DD2E0B6624540F7031E18404022C0D1B1834A5C634540289D4830D54422C0977329AE2A6545408080B56AD74C22C01F69705B5B664540C64D0D349F4B22C06D904946CE664540B7B585E7A54222C058E6ADBA0E67454060E5D022DB3922C05682C5E1CC67454006651A4D2E3622C0810A47904A694540FA5E43705C3622C0DE72F563936A4540198F52094F3822C0448655BC916B45403ECBF3E0EE3C22C0ADC1FBAA5C6C45403F541A31B33F22C0CDE49B6D6E6C45403EB14E95EF4122C0637AC2120F6C4540A03715A9304622C06EA7AD11C16C454036CAFACDC44C22C04BB1A371A86F4540890CAB78234B22C089B5F814007145403C84F1D3B84722C0A4C343183F7145407E5182FE424722C01399B9C0E5714540A58636001B4822C028D36872317245400CC85EEFFE4822C06AF5D5558172454087A2409FC84322C0BF64E3C116734540C44142942F4022C05B79C9FFE4734540AFB5F7A92A4422C01212691B7F744540804754A86E4622C0AFD172A087744540BBEF181EFB4922C078EE3D5C72744540901150E1085222C0A05225CADE744540397B67B4555922C04D840D4FAF7845405F9A22C0E95D22C05ABC581822794540D7135D177E6022C0CF6BEC12D5794540EF0390DAC46122C052103CBEBD7945406BD8EF89756222C04968CBB914794540CAC342AD695E22C06B274A4222774540A0DCB6EF515F22C05C035B2558764540EAB303AE2B5E22C01C7920B248754540C87DAB75E26A22C082C98D226B754540594FADBEBA6A22C0C66D3480B7764540A3EA573A1F6E22C071766B990C77454069AA27F38F6E22C021938C9C85774540EACDA8F92A7122C03C4D66BCAD784540C652245F097422C0267156444D78454013B9E00CFE7622C03D997FF44D7845403DD68C0C727722C0552E54FEB5764540048D9944BD8022C07C26FBE7697645405839B4C8768622C0A3772AE09E7545407C2AA73D258722C056B8E52329754540085BECF6598522C0E466B8019F734540282A1BD6548622C0952A51F696724540102384471B8722C028D3687231724540D844662E708922C0663046240A7145405E85949F548B22C044FD2E6CCD7045407D5BB054179022C028D36872317245406C0A6476168D22C0F6436CB0707445407077D66EBB9022C0DEC66647AA754540E67805A2279522C0D11E2FA4C37545402D05A4FD0F9822C0CB83F4143976454068E7340BB49322C047C7D5C8AE784540B2D5E594809022C04FB16A10E67845402BDA1CE7369122C0B91803EB387A454005A4FD0FB08E22C0E259828C807A45406891ED7C3F8D22C0102384471B7B4540A59F70766B8922C03D27BD6F7C7B45408A56EE05668522C070EB6E9EEA7C4540A585CB2A6C8622C03AAE4676A57D4540DBA2CC06998422C0486DE2E47E7F4540CB9C2E8B898522C0581D39D219804540465C001AA58322C024D5777E51804540904E5DF92C8722C0C68844A16581454012FB04508C8C22C0209A79724D814540060E68E90A8E22C0AED4B32094814540F6ECB94C4D9222C001FC53AA44854540E99C9FE2389822C09BAE27BA2E86454046990D32C99822C02DCE18E6048745401553E9279C9522C0D8B969334E874540F321A81ABD9222C0F2EF332E1C864540BAA46ABB098E22C02C8194D8B5854540D63BDC0E0D8B22C0AF997CB3CD854540B9C32632738922C0D5264EEE77864540F7AB00DF6D8622C04CE3175E49864540450E1137A78222C0707B82C4768745406F1283C0CA8122C09692E52494884540FBCE2F4AD07F22C0D13DEB1A2D89454084D6C397898222C0B821C66B5E8B45402E71E481C88222C0FDD98F14918B45403065E080967E22C08FFB56EBC48B4540598638D6C57D22C0B821C66B5E8B45404D327216F67C22C01689096AF88A4540CE6F9868907A22C0B821C66B5E8B4540E02C25CB497822C0A7AFE76B968B454003EB387EA87422C0656F29E78B8B4540C652245F097422C0B821C66B5E8B454037C478CDAB7222C0B821C66B5E8B45402026E1421E7122C0CE6C57E8838B45400589EDEE017222C0D906EE409D8C4540732A1900AA7022C0526342CC258D4540583B8A73D47122C07BF486FBC88D45409833DB15FA7022C0BDC458A65F8E45403DD175E1076F22C04F965AEF378E4540A7CD380D516D22C09FCC3FFA268D454011397D3D5F6B22C0A08CF161F68C4540A30227DBC06522C0D40D1478278D4540B69DB646046322C0C1FEEBDCB48B4540728A8EE4F25F22C048A7AE7C968B4540C614AC71365D22C0A3B08BA2078C4540D97745F0BF5D22C0BDE5EAC7268D4540514B732B845522C0CDE7DCED7A8D45406072A3C85A5322C049D576137C8F4540070B2769FE5022C00133DFC14F9045401422E010AA5422C0FA0B3D62F49045408EAED2DD755622C0656D533C2E92454080BBECD79D5E22C06C41EF8D2190454031242713B76222C063635E471C904540397F130A116822C09F1EDB32E0904540D4484BE5ED6822C07A8B87F71C9245408C12F4177A6C22C00D350A4966934540575EF23FF96B22C0B2F336363B9445405A0EF450DB6622C08CBCAC8905944540CFDC43C2F75E22C0BC5AEECC049545402B4EB516665922C08DF161F6B2974540B875374F755022C0CA6E66F4A39745402DCDAD10564B22C09BCAA2B08B984540CE177B2FBE4022C0C7832D76FB984540685BCD3AE33B22C0452BF702B3984540CD74AF93FA3A22C043E7357689984540D8B79388F03722C030B8E68EFE974540223999B8553022C0931B45D61A9845409087BEBB952D22C0FF4124438E974540B43BA418202922C0BCCE86FC339745406F0C01C0B12722C011FFB0A5479745402D211FF46C2622C0F241CF66D5974540B5183C4CFB1E22C09AB67F65A59745400EBC5AEECC1422C0F5143944DC984540630CACE3F81122C09B92ACC3D19945401842CEFBFF1022C0B1FCF9B6609B45402B6C06B8200B22C0863B17467A9B45408675E3DD910922C045679945289C4540F94A2025760522C018B14F00C59C4540E0D91EBDE10622C01E1B81785D9D4540F27A30293E0622C01763601DC79D4540A7CB6262F30122C0A0168387699D4540A0C03BF9F40022C0C74CA25EF09B4540BF654E97C5FC21C064AF777FBC9B45405854C4E924FB21C0F0366F9C149C45405E13D21A83F621C046239F573C9D4540CB4C69FD2DF121C055FA0967B79C45400FB8AE9811EE21C0C0232A54379D45402D9622F94AE821C09468C9E3699D4540B16CE690D4E221C0AB23473A039D4540D4484BE5EDE021C04E5FCFD72C9D4540DBFB54151AE021C0750305DEC99D454018265305A3E221C0BF823463D19E45401E6CB1DB67E521C0E3512AE1099F4540FC389A232BE721C05CFFAECF9C9F4540C26C020CCBE721C0E6EB32FCA7A1454050FC1873D7EA21C0D88349F1F1A1454035272F3201EF21C000C79E3D97A1454090A339B2F2F321C01DC9E53FA4A145406A2FA2ED98FA21C0F817416326A34540616BB6F292F721C078B5DC9909A445403524EEB1F4F121C0645B069CA5A4454068AED3484BED21C0F33E8EE6C8A4454003D19332A9E921C0933A014D84A54540B7442E3883DF21C0ECC1A4F8F8A445402E8ECA4DD4DA21C007EA944737A4454043739D465ADA21C05B069CA564A54540CD936B0A64D621C00A815CE2C8A54540AA7F10C990D321C0B187F6B182A545405D19541B9CD021C0AA0A0DC4B2A54540E6762FF7C9D121C000FE2955A2A645405EDA70581AD021C08D7E349C32A74540FB5C6DC5FED221C0EF1EA0FB72A845407787140324D221C099B8551003A94540C78157CB9DC921C0C362D4B5F6A845403526C45C52C521C0207EFE7BF0A84540A4349BC761C021C0EBAD81AD12A845401C412AC58EBE21C0A1681EC022A9454093E2E313B2BB21C001DF6DDE38A94540EEB089CC5CB821C00C5BB39597A845405E0EBBEF18B621C03D80457EFDA845400684D6C397B121C024D3A1D3F3A84540BDFE243E77B221C09D47C5FF1DAB454046D1031F83AD21C084F4143944AC45409E5F94A0BFA821C0438CD7BCAAAB4540FDF50A0BEEA721C02FBE688F17AA4540B2683A3B19A421C0B6A0F7C610AA4540971B0C7558A121C03A0664AF77A945404E2A1A6B7F9F21C01536035C90A94540A7CD380D519D21C0A12C7C7DADA9454079EA9106B79D21C0ECC039234AA94540564ACFF4129B21C0DD2230D637A845405C902DCBD79521C0959BA8A5B9A745406C5F402FDC9121C097917A4FE5A64540B70DA320788C21C051DA1B7C61A64540E3FBE252958621C05FB532E197A645401EC539EAE88021C094F8DC09F6A545404BAB21718F7D21C048A7AE7C96A54540AB77B81D1A7621C048895DDBDBA5454015CAC2D7D77221C08FE4F21FD2A545402448A5D8D17021C03F726BD26DA54540FC7266BB426F21C0E97C789620A5454078B81D1A166B21C0F1D58EE21CA54540B35F77BAF35C21C0EAE74D452AA6454052B81E85EB5121C05BB1BFEC9EA64540DB6CACC43C4B21C0338AE59656A74540889FFF1EBC4621C0AA0B789961A74540D9B27C5D863F21C0BDA772DA53A8454038BEF6CC923821C07880272D5CA84540A7E67283A13621C039B69E211CA94540253CA1D79F3421C0747B4963B4A84540965D30B8E62E21C044DFDDCA12A94540BF7E880D162E21C01903EB387EA845408D0DDDEC0F2C21C0FC17080264A8454045813E91272921C03352EFA99CA84540C0779B374E2221C0D52137C30DA845403B376DC6691821C0C03E3A75E5A74540734C16F71F1121C0D68EE21C75A8454032C7F2AE7A0821C070B4E386DFA9454001857AFA080421C0EE77280AF4A945400E4DD9E907FD20C09D6516A1D8AC4540C284D1AC6CFF20C0B2D991EA3BAD454081EB8A19E1FD20C03D9B559FABAD4540384888F205FD20C07DB3CD8DE9AD4540A08B868C47F920C01AC40776FCAD454089450C3B8CF920C03D9B559FABAD4540F1F09E03CBF920C07B87DBA161AD4540C3EFA65B76F820C0A47213B534AD45408811C2A38DF320C015E63DCE34AD4540FFEC478AC8F020C03D9B559FABAD4540EA23F0879FEF20C03D9B559FABAD45409A7D1EA33CEB20C073F1B73D41AE4540890B40A374E920C0F1F274AE28AF45407EC6850321E120C006F52D73BAB04540E2E995B20CD920C04B00FE2955B0454017A06D35EBD420C0D10836AE7FAF454098A7734529D120C0A5828AAA5FAF4540F04FA91265CF20C06878B306EFAF454055A52DAEF1D120C0350BB43BA4B04540EB387EA834D220C0D15AD1E638B14540C7D5C8AEB4CC20C089EDEE01BAB145407765170CAEC920C04546072461B14540E5D2F88557CA20C093DFA293A5B04540261C7A8B87C720C0912A8A5759AF45408FFF024180CC20C06477819202AF4540535A7F4B00CE20C07880272D5CAE4540AB3FC23060C920C03D9B559FABAD4540B81D1A16A3C620C0DD42572250AD45405646239F57C420C09DD5027B4CAC4540A77686A92DC520C03E3E213B6FAB4540DCF29194F4B820C0F1BC546CCCAB45404A44F81741B320C06CB587BD50AC45406E693524EEB120C039252026E1AC454022A5D93C0EB320C03D9B559FABAD4540E71A66683CB120C0A7CF0EB8AEAE4540A5D7666325AE20C078B81D1A16AF4540DF8C9AAF92AF20C0261C7A8B87AF4540731074B4AAAD20C0CF31207BBDAF45404C89247A19AD20C001BEDBBC71B04540EB1ED95C35AF20C0F607CA6DFBB04540A6D1E4620CB420C0AC6F6072A3B0454018062CB98AB520C07270E998F3B04540B4E55C8AABB220C03813D38558B14540E9818FC18AB320C0B01EF7ADD6B145403E93FDF334B020C074CE4F711CB245403F6EBF7CB2B220C07D08AA46AFB245405798BED710AC20C0C0232A5437B345409AB0FD648CA720C0EC51B81E85B34540FE261422E0A020C086014BAE62B34540C0098508389C20C0503A9160AAB34540E3FC4D28449820C0A35C1ABFF0B24540853FC39B359820C0BFD18E1B7EB14540088F368E589320C0A9A44E4013B14540E1D39CBCC88C20C0A2B2614D65B1454041118B18768820C0537AA69718B14540B4942C27A18420C05760C8EA56AF4540172EABB0198020C0C7B8E2E2A8AE454020CF2EDFFA8020C03D9B559FABAD4540CD21A985928120C023BC3D0801AD4540094E7D20797F20C08B18761893AC454094DE37BEF67C20C000CADFBDA3AC4540DE1FEF552B7B20C0BF1072DEFFAB45403D9B559FAB7520C0A2B77878CFAB4540450E1137A77220C09E5F94A0BFAA454030D7A205686B20C0501C40BFEFA945400F99F221A86A20C012876C205DAA4540BCCFF1D1E26C20C0BE30992A18AB454061342BDB876C20C0A5BC564277AB4540F14A92E7FA6620C000AC8E1CE9AA4540AC3C81B0536C20C00EBC5AEECCAC454050560C57077020C00E12A27C41AD4540CA32C4B12E6E20C03D9B559FABAD45402E8ECA4DD46A20C0876C205D6CAE4540A3772AE09E6F20C0A5DAA7E331AF454031CF4A5AF16D20C0BAD7497D59B045403BA6EECA2E7020C05A9F724C16B14540E066F162617020C067D65240DAB14540B1169F02606C20C000AAB8718BB3454097FE25A94C6920C0C03DCF9F36B445407B6AF5D5556120C0D5592DB0C7B4454017D7F84CF65F20C0D45FAFB0E0B44540378E588B4F5920C001A60C1CD0B44540F986C267EB5820C06B662D05A4B545405DFB027AE15E20C0478E740646B6454017D7F84CF65F20C07593180456B645407B6AF5D5556120C041F4A44C6AB645402EC901BB9A6420C0ECD973999AB64540715AF0A2AF6820C0F7CABC55D7B5454029779FE3A36D20C0B2632310AFB545409FE3A3C5197320C04963B48EAAB64540E6B0FB8EE17920C026E4839ECDB64540AB59677C5F7C20C0C5E3A25A44B64540A8195245F17A20C08A558330B7B545409CFC169D2C7D20C0A33D5E4887B545403EEC8502B68320C09BAF928FDDB54540A67C08AA468F20C069E04735ECB74540F08975AA7C9720C0200DA7CCCDB745405000C5C8929920C09010E50B5AB845402BC0779B379E20C0A9BD88B663B84540BE11DDB3AEA120C0F4A62215C6B84540BA4C4D82379C20C0C05DF6EB4EB94540DF878384289F20C072F90FE9B7B9454012BEF737689F20C02D0B26FE28BA45403259DC7F649A20C09929ADBF25BA45405439ED29398F20C026E4839ECDBA45404051D9B0A68A20C0BAA0BE654EBB45405D1ABFF04A8A20C0FAEFC16B97BA4540D7187442E88820C0CBF78C4468BA4540E0A128D0278220C0320400C79EBB45403EB48F15FC7E20C0E2E995B20CBB4540FCFF3861C27820C0A6F10BAF24BB45406BF12900C67320C02829B000A6BA4540573ECBF3E06E20C003CDE7DCEDBA4540376C5B94D96820C0D9976C3CD8BA45407B6AF5D5556120C0AFEAAC16D8BB454017D7F84CF65F20C04A99D4D006BC45401AC40776FC5720C05A9F724C16BD454050A73CBA115620C01A8A3BDEE4BD45400B96EA025E5620C0029B73F04CBE4540CD751A69A95420C079E75086AABE4540B51B7DCC075420C09EF0129CFABE4540B51B7DCC075420C04F92AE997CBF4540C022BF7E885520C0649291B3B0BF4540B51B7DCC075420C0598638D6C5BF454009A7052FFA5220C0E84CDA54DDBF4540B3976DA7AD5120C08F1B7E37DDC0454068925852EE4E20C0B14D2A1A6BC145407959130B7C4D20C092E7FA3E1CC24540E8305F5E805520C0B03C484F91C145403F1BB96E4A5920C0404E98309ABF454017D7F84CF65F20C0DE8E705AF0BE45407B6AF5D5556120C0A305685BCDBE454070067FBF986520C0DAA9B9DC60BE4540AB75E272BC6220C095B88E71C5BD45406F4A79AD846620C062A06B5F40BD454056F2B1BB406920C045813E9127BD454074D0251C7A6B20C0255CC823B8BD454017B9A7AB3B6E20C0AD4ECE50DCBD4540CD902A8A577120C0344A97FE25BD45406ABDDF68C77520C09B374E0AF3BC45404CC45BE7DF7620C0861E317A6EBD45404FC939B1877E20C027BF45274BBD45404C1B0E4B037F20C04206F2ECF2BD4540CCB4FD2B2B7D20C068CD8FBFB4BE4540BAA0BE654E7F20C0A67D737FF5BE454098A432C51C8420C05D37A5BC56BE4540A2258FA7E58720C08639419B1CBC4540098CF50D4C8E20C09FE74F1BD5BB454008C90226709320C01BBAD91F28BB45402B4D4A41B79720C007280D350ABB454070B20DDC819A20C0501DAB949EBB45401F300F99F2A120C09753026212BC4540DC4944F817A920C0F646AD307DBB45402DCE18E604AD20C008E8BE9CD9BA45407A1C06F357B020C0207D93A641BB45408C6A11514CAE20C099F4F75278BC45400DDFC2BAF1A620C03D433866D9BD4540B5FE9600FCA320C069C537143EBF454054ABAFAE0AA420C07CF31B261AC045407C9A931799A820C07A54FCDF11C14540B96FB54E5CA620C0B16CE690D4C24540486E4DBA2DA120C0664CC11A67C34540C5E3A25A449C20C0D9B3E73235C34540B01D8CD8279820C03C31EBC550C44540B0E595EB6D9B20C066683C11C4C5454000A94D9CDC9F20C02F50526001C6454074ECA012D7A120C07AFD497CEEC645408ACA863595A520C0865968E734C74540605B3FFD67A520C04A42226DE3C74540ADA415DF50A020C019028063CFC8454070B4E386DF9D20C0E2016553AEC84540A8195245F19A20C0CD785BE9B5C74540BBB88D06F09620C0ECA353573EC74540357EE195248F20C044DE72F563C74540CC7D7214208A20C0E95F92CA14C7454065E256410C8420C0C713419C87C74540A0A52BD8467C20C03BC269C18BC8454040FA264D837220C08D9944BDE0C945402C9FE579706F20C056BABBCE86CA4540E1B20A9B016E20C01502B9C491CB4540946934B9186320C09C36E33444CD4540FA9B5088806320C013471E882CCE45407B6AF5D5556120C001892650C4CE4540E770ADF6B05F20C0D28E1B7E37CF45405C1C959BA85D20C0E86B96CB46CF4540207EFE7BF05A20C0F321A81ABDCE454050172994855720C09C3237DF88CE45401ADCD6169E4F20C05F7AFB73D1CE4540A585CB2A6C4620C04A6249B9FBD045407880272D5C3E20C0F5A276BF0AD245405EDBDB2DC93920C0F965304624D2454023861DC6A43720C0438F183DB7D2454000FE2955A23420C0865AD3BCE3D2454098DBBDDC272F20C05130630AD6D4454063096B63EC2C20C06808C72C7BD445403C16DBA4A22920C0768C2B2E8ED2454076FBAC32532220C0E657738060D2454019E8DA17D02320C071E481C822D345403ACAC16C021C20C0C4211B4817D34540D923D40CA91A20C0F56393FC88D3454014E81379921C20C0AED85F764FD44540BF7E880D162620C026FC523F6FD44540069E7B0F972420C0FE62B66455D64540F5F3A622152620C08BE255D636D74540211D1EC2F82120C0CCB392567CD74540A9A5B915C22220C0060E68E90AD8454094DBF63DEA1F20C02106BAF605DA454056B8E523291920C00745F30016DB45403C855CA9671120C0F46A80D250DB454087A4164A260F20C002BC051214DB45407A1A3048FA0C20C067F0F78BD9DA45404F2157EA590820C09CC24A0515DB4540198C1189420320C085285FD042DA45401BBB44F5D60020C0A7AD11C138DA45408735954561D71FC0C3F5285C8FDC4540B0AA5E7EA7C91FC052F2EA1C03DE45401D739EB12FC91FC01C23D923D4DE4540895DDBDB2DB91FC0E92CB308C5DE45401956F146E6B11FC0A759A0DD21DF45408B8C0E48C29E1FC0682096CD1CE24540034356B77A8E1FC012DA722EC5E145404302469737771FC0ACC77DAB75E245405858703FE0711FC0888043A852E14540F0880AD5CD751FC08907944DB9DE4540D7C22CB4737A1FC047382D78D1DD454074B33F506E6B1FC0DD79E2395BDC4540F9BF232A54671FC09A6038D730DB45407AFEB4519D6E1FC02F302B14E9DA4540E0D91EBDE17E1FC0CADC7C23BADB4540348639419B7C1FC0E0BDA3C684DA454038F581E49D831FC0FA7E6ABC74D9454092EC116A86841FC025ECDB4944D84540FEEF880AD58D1FC0015130630AD8454062BD512B4C8F1FC0471CB28174D745406BF46A80D2801FC02009FB7612D74540A7203F1BB97E1FC04981053065D6454070EB6E9EEA801FC0EC6CC83F33D64540B1FCF9B660891FC00EDAAB8F87D64540A165DD3F16921FC0D06394675ED64540F0332E1C08991FC0E7E44526E0D5454000E5EFDE51931FC02DCDAD1056D5454035B8AD2D3C7F1FC0C4793881E9D44540109370218F701FC01D5BCF108ED54540CC272B86AB631FC0B169A510C8D545402E02637D03631FC0371C96067ED64540EF02250516701FC0CEA5B8AAECD74540F778211D1E721FC0B79BE09BA6D945407171546EA2661FC02106BAF605DA45409DF3531C075E1FC04F401361C3D94540A98427F4FA531FC0001AA54BFFD845404FEB36A8FD461FC034F3E49A02D945402995F0845E4F1FC0F99D2633DEDA454056293DD34B4C1FC0AF5A99F04BDB45400B9755D80C401FC0E753C72AA5DB4540C0D02346CF3D1FC06765FB90B7DC4540BE50C07630321FC0EBABAB02B5DC45404FE8F527F1291FC0E9D1544FE6DD45406C3F19E3C31C1FC039454772F9DD4540B32616F88AFE1EC03F726BD26DDF454019028063CFEE1EC0276C3F19E3DF4540B1C05774EBE51EC0643A747ADEDF4540998235CEA6E31EC0CD58349D9DE04540FAEE5696E8DC1EC0239F573CF5E045409B00C3F2E7DB1EC0950F41D5E8E14540386744696FC01EC0377172BF43E34540A24621C9ACBE1EC025CD1FD3DAE4454064CA87A06AB41EC0C5FF1D51A1E44540FA415DA450A61EC03E963E7441E345401CB28174B1A91EC00C03965CC5E24540389ECF807AB31EC04B2366F679E24540F9DA334B02B41EC0BD35B05582E145404A0856D5CBBF1EC074B515FBCBE04540554FE61F7DC31EC03D49BA66F2DF454016A243E048C01EC093C7D3F203DF45401805C1E3DBCB1EC07D772B4B74DE4540DE550F9887CC1EC047E6913F18DE4540EDB60BCD75BA1EC04D13B69F8CDD45409A266C3F19B31EC0EF02250516DE4540392861A6EDAF1EC01C78B5DC99DF45405C751DAA29A91EC0B6847CD0B3DF45401FF296AB1F9B1EC01C0B0A8332DF454087527B116D971EC0705CC64D0DE0454068B27F9E068C1EC04A7B832F4CE04540E4D9E55B1F861EC0F56915FDA1DF454018B49080D1851EC029B3412619DF4540F4C0C760C5891EC043E7357689DE4540E04C4C1762851EC06B990CC7F3DD454062855B3E92821EC0F146E6913FDC45404EEE77280A741EC01A8BA6B393DB45403830B951646D1EC0C5707500C4DB4540F9A067B3EA731EC00395F1EF33DA4540A9BC1DE1B4701EC03753211E89D945402B155454FD6A1EC0C408E1D1C6D94540E99AC937DB6C1EC01F10E84CDAD845405437177FDB731EC08CD9925511D845400403081F4A741EC0C5387F130AD745403F027FF8F96F1EC066F84F3750D6454049BA66F2CD661EC071CADC7C23D6454020D4450A65611EC0A0A4C00298D6454097FE25A94C611EC066F4A3E194D7454097749483D9541EC0DF6DDE3829D845404912842BA0501EC0A27A6B60ABD84540D50451F701581EC05F7AFB73D1DA45402B685A6265541EC0D4F02DAC1BDB4540AE282504AB4A1EC08FC360FE0ADB454086E7A562633E1EC09546CCECF3DA45406EDFA3FE7A351EC0C0B33D7AC3DB4540A9BEF38B12341EC0BAF94674CFDC4540CD599F724C361EC067800BB265DD454044F7AC6BB42C1EC0D76D50FBADDD4540B77BB94F8E221EC0BB421F2C63DD4540A565A4DE53191EC029CDE67118DE454016FC36C4780D1EC0B64DF1B8A8DC4540ABED26F8A6091EC02D26361FD7DC4540802C4487C0011EC0643E20D099DC454078EFA83121F61DC07D586FD40ADD454088F546AD30ED1DC0B1C403CAA6DC45401B2FDD2406E11DC0B6476FB88FDC454081936DE00EE41DC0884B8E3BA5DB454042B28009DCEA1DC04ED4D2DC0ADB4540990E9D9E77E31DC066BE839F38DA4540CF108E59F6C41DC086AA984A3FD9454058AD4CF8A5BE1DC03DB83B6BB7D9454072361D01DCBC1DC09C18929389D945406DAB59677CBF1DC0B7973446EBD84540E2900DA48BAD1DC0B875374F75D84540EA77616BB6A21DC045B8C9A832D84540C405A051BA941DC03D9D2B4A09D7454059147651F4801DC0B98C9B1A68D64540E9297288B8791DC045D4449F8FD64540C5538F34B86D1DC0BB9866BAD7D54540914259F8FA6A1DC024ED461FF3D34540F16778B3065F1DC020459DB987D2454056D4601A865F1DC025CFF57D38D24540F2B0506B9A571DC0B8955E9B8DD14540130CE71A66581DC014D044D8F0D04540156F641EF9531DC0CBDAA6785CD045407E71A94A5B4C1DC02CF4C13236D04540626A4B1DE4451DC07CD11E2FA4CF454035D07CCEDD3E1DC0A4FE7A8505CF45404A26A77686391DC085CC9541B5CD4540109370218F301DC061E124CD1FCD45402D08E57D1C2D1DC08B19E1ED41CC45409833DB15FA301DC0E7012CF2EBCB45405FB4C70BE9201DC09F2287889BCB45406760E4654D0C1DC0226DE34F54CA4540C51EDAC70AFE1CC0890AD5CDC5C94540ABEAE5779AFC1CC046B41D5377C9454054ABAFAE0A041DC03BC269C18BC845406CE8667FA00C1DC098F738D384C745407CB4386398031DC09FAF592E1BC74540ACFD9DEDD10B1DC025B1A4DC7DC64540AD8A709351051DC0917F66101FC645403FAC376A85F91CC07A3881E9B4C645405BB4006DABF91CC0B56B425A63C8454029B4ACFBC7F21CC03BC269C18BC84540266F8099EFF01CC054C6BFCFB8C8454024624A24D1EB1CC03BC269C18BC845406FBDA60705E51CC06AC2F69331C84540A016838769CF1CC06DE4BA29E5C745404B9352D0EDB51CC02D7AA702EEC74540054EB6813BB01CC0263ACB2C42C745404E64E60297A71CC002D369DD06C7454037E15E99B77A1CC0F0332E1C08C74540AD33BE2F2E751CC02FF99FFCDDC745408FA850DD5C5C1CC07D24253D0CC745402FFA0AD28C551CC09ED2C1FA3FC745409FC728CFBC4C1CC032005471E3C64540302E55698B3B1CC0A60D87A581C74540D4282499D52B1CC093C7D3F203C74540D95F764F1E261CC05B608F8994C6454064213A048E241CC02D40DB6AD6C545400536E7E099201CC06A4FC939B1C545409AEE75525F161CC0ECF7C43A55C64540C136E2C96E161CC0A837A3E6ABC645409A05DA1D521C1CC00F46EC1340C74540CE37A27BD6151CC014CE6E2D93C7454028BA2EFCE0FC1BC0BF0D315EF3C645402942EA76F6E51BC0CC457C2766C74540A391CF2B9EDA1BC0FDBB3E73D6C745408BE255D636D51BC0410C74ED0BC8454082CAF8F719C71BC0ACE122F774C94540F94A202576BD1BC0B3CD8DE909C945403A3E5A9C31AC1BC0D734EF3845C94540D906EE409DA21BC014D1AFAD9FC845407DAEB6627F991BC0D46531B1F9C84540AC8DB1135E921BC0B20E4757E9C84540A6D0798D5D821BC0D993C0E61CC845408FE046CA16791BC03D98141F9FC845406BB8C83D5D6D1BC00F99F221A8C845402E71E481C8621BC0DA3BA3AD4AC845400C3F389F3A561BC019541B9C88C845402A711DE38A4B1BC032C85D8429C845402F89B3226A421BC0416667D13BC74540F10F5B7A34351BC0EE3F321D3AC74540EDF1423A3C241BC05743E21E4BC745406DC83F33881F1BC056293DD34BC84540A45181936D101BC07FC16ED8B6C845407E8CB96B09091BC00455A35703C845401B2D077AA8FD1AC09F77634161C84540B47405DB88F71AC0336ABE4A3EC845400DE4D9E55BEF1AC039B35DA10FC84540B648DA8D3EE61AC03FADA23F34C7454094313ECC5ED61AC0FE63213A04C845408C9FC6BDF9CD1AC04B1E4FCB0FC845406F9F55664ABB1AC0DCBC715298C745409278793A57A41AC0721AA20A7FC84540E1421EC18D941AC07AE1CE8591C845401956F146E6811AC0C8258E3C10C94540707B82C476771AC0A9A10DC006C84540D600A5A146711AC0D158FB3BDBC74540728BF9B9A1691AC0ED0E290648C84540CD565EF23F691AC00AF7CABC55C7454002F390291F621AC01C40BFEFDFC64540EC2FBB270F4B1AC00A2B155454C7454017A06D35EB3C1AC0C4D0EAE40CC74540ED45B41D53371AC0715AF0A2AFC64540D63BDC0E0D2B1AC02BBEA1F0D9C645406DACC43C2B291AC022E2E65432C64540A25D85949F241AC0A69718CBF4C54540BDC3EDD0B0181AC0CB48BDA772C64540A3EA573A1F0E1AC065FF3C0D18C645403FE5982CEEFF19C04C16F71F99C64540F31FD26F5FF719C0B5FD2B2B4DC64540E3FF8EA850ED19C03411363CBDC645400DE36E10ADE519C07061DD7877C645402BDCF29194E419C03BC269C18BC84540BFEFDFBC38E119C078616BB6F2C8454035D1E7A38CD819C0BCC96FD1C9C845404777103B53D819C03BC269C18BC845401B6327BC04B719C0BADC60A8C3C64540AC90F2936AAF19C0BC033C69E1C64540664B5645B8A919C04B2025766DC745407B336ABE4A9E19C076A73B4F3CC74540EB7420EBA99519C0FE2AC0779BC74540EAEA8EC5368919C0A20A7F8637C7454080B9162D407B19C021B1DD3D40C74540C43E0114237B19C060234910AEC64540EBC9FCA36F7219C06344A2D0B2C64540F19F6EA0C06B19C0B45A608F89C645404E7D2079E76019C0E02A4F20ECC6454021E4BCFF8F5319C02F6EA301BCC74540A4E194B9F93619C03885950A2AC84540E4A3C519C32C19C0BC202235EDC84540B2D6506A2F2219C0E4D6A4DB12C94540D522A298BC1119C0C45F9335EAC9454073840CE4D90519C08B8862F206CA454083DC4598A2FC18C0E97DE36BCFCA454078094E7D20F918C0E31A9FC9FECB454034677DCA31E918C01F2C634337CB45406B63EC8497E018C0C18EFF0241CA4540397EA83462D618C01DE38A8BA3CA454035272F3201CF18C07BA4C16D6DC945402387889B53C918C05CAE7E6C92C94540340EF5BBB0C518C00BEE073C30CA4540DFE00B93A9C218C0A88AA9F413CA4540E25AED612FC418C04A97FE25A9C845408A5759DB14BF18C071CADC7C23C8454053CE177B2FAE18C00A67B796C9C8454092E86514CB9D18C09DBD33DAAAC845402849D74CBE9918C0EFE4D3635BC84540D41055F8338C18C0EC6CC83F33C84540713C9F01F58618C0C28A53AD85C745409031772D217F18C068E7340BB4C74540D9CD8C7E347C18C0FBE769C020C745400EBDC5C37B6E18C0AA807B9E3FC7454045813E91276918C0E04BE141B3C74540DEAE97A6086018C0DDCD531D72C745406B82A8FB005418C0ED0E290648C84540E73A8DB4544E18C06D00362042C84540855D143DF04118C0EBFD463B6EC84540DD955D30B83618C05F28603B18C9454088F19A57752618C075779D0DF9C94540CA880B40A32418C01E34BBEEADCA45408D429259BD1318C0664D2CF015CB4540F06C8FDE700F18C0144031B264CA4540B0C6D974040018C0F33AE2900DCA45402711E15F04FD17C0DB4E5B2382C94540EDBAB72231F117C0FA997ADD22CA454096766A2E37D817C09C8BBFED09CA454004C8D0B183CA17C050C24CDBBFCA454090BFB4A84FC217C0601F9DBAF2CB45408658FD1186C117C0C1E61C3C13CC4540FE648C0FB3C717C0F54A598638CC4540D10836AE7FC717C0E71C3C139ACC454093A9825149BD17C030134548DDCC45402C11A8FE41B417C00470B378B1CC4540B30A9B012EA817C06938656EBECD4540F0C4AC1743A917C004711E4E60CE45403A9677D503A617C08E041A6CEACE45403E03EACDA8A917C0739CDB847BCF4540D6E253008CA717C0ACC95356D3CF4540CF85915ED49E17C0DE1D19ABCDCF4540A4FB3905F99917C0C58CF0F620D04540C1C6F5EFFA8C17C0B1355B79C9CF4540A646E867EA8517C05E49F25CDFCF4540A2EC2DE57C8117C0F67D384888D045403B8908FF227817C07381CB63CDD0454019C8B3CBB76E17C0EC67B114C9D1454030629F008A7117C0166C239EECD245402F35423F536F17C0B9C2BB5CC4D34540D252793BC26917C0A5A31CCC26D44540D4BB783F6E5F17C0A0A52BD846D44540B3B3E89D0A5817C073B9C15087D345407C9E3F6D545717C08461C092ABD24540B35DA10F965117C0A7E8482EFFD14540093543AA284E17C0CBD58F4DF2D145406D1B4641F04817C03C9F01F566D24540137F1475E63E17C0A31EA2D11DD24540CBF8F719173E17C0EC67B114C9D1454073F7393E5A3C17C0F624B03907D14540A0336953752F17C0A3957B8159D14540401878EE3D2C17C0A5164A26A7D0454098F90E7EE22017C04C8BFA2477D045401A51DA1B7C2117C044FAEDEBC0CF454099D36531B12917C016A1D80A9ACE454071A94A5B5C2317C01E87C1FC15CE45400ABB287AE01317C05F950B957FCD4540E509849D621517C0F969DC9BDFCC454003249A40110B17C03E3C4B9011CC4540F7E6374C340817C0ADA23F34F3CA4540D40FEA22850217C0085740A19ECA4540B16D516683FC16C0425BCEA5B8CA45407B30293E3EF116C0A5D93C0E83C94540A4FB3905F9D916C0DD09F65FE7C84540E5B7E864A9D516C0927538BA4AC94540B4C876BE9FCA16C05ED6C4025FC9454031CF4A5AF1CD16C0077E54C37EC7454022FB20CB82C916C09088299144C74540E8853B1746CA16C02C2D23F59EC64540D908C4EBFAC516C02E90A0F831C64540BD8C62B9A5C516C0D57ABFD18EC54540E6E61BD13DBB16C044FAEDEBC0C5454096EA025E66B816C0D540F33977C54540F19C2D20B4AE16C0F8A8BF5E61C54540641EF98381A716C0180AD80E46C64540593673486AA116C0EE5BAD1397C54540568330B77B9916C03B6EF8DD74C5454099A0866F618D16C0124C35B396C64540BE4BA94BC68116C0E12538F581C6454044A33B889D7916C0336DFFCA4AC7454057091687336F16C0DFFE5C3464C6454076374F75C85D16C0E23D079623C645407214200A664C16C04415FE0C6FC6454096EB6D33153216C04F3E3DB665C64540CD72D9E89C1F16C0A1DAE044F4C54540FEB7921D1B1116C00D1AFA27B8C64540F0332E1C080916C0B1F9B83654C64540E6913F1878FE15C0B72407EC6AC645407F30F0DC7BF815C08C48145AD6C545406D8E739B70DF15C090F8156BB8C6454082751C3F54DA15C0A5846055BDC64540B8020AF5F4C115C0344B02D4D4C6454067D7BD1589B915C0F6B704E09FC645409E44847F11A415C0707CED9925C74540573F36C98F9815C0D61F6118B0C64540ED0BE8853B9715C0DD41EC4CA1C54540E7C75F5AD48715C0BBD05CA791C44540FBCC599F727C15C0E8DA17D00BC5454047CCECF3187515C0779D0DF967C44540365A0EF4506B15C0390A100533C44540B284B531766215C0D2A755F487C44540DB3521AD315815C0DD0BCC0A45C445405C3D27BD6F4C15C06117450F7CC445402F52280B5F3F15C00E66136058C44540DB6B41EF8D3115C09C4F1DAB94C4454033FAD170CA2C15C0FE9C82FC6CC44540B267CF656A1215C02F14B01D8CC245400B5D8940F50F15C01D5723BBD2C0454046D26EF431FF14C0048F6FEF1AC045406EBF7CB262F814C0C614AC7136BF4540FA980F0874E614C063B48EAA26BE4540F2272A1BD6E414C0737FF5B86FBD4540F04DD36707DC14C042EDB776A2BC45403A02B859BCC814C07F69519FE4BC4540CB49287D21C414C0317A6EA12BBD4540327216F6B4B314C09FB0C403CABC4540299831056BAC14C0D5CDC5DFF6BC4540AF795567B5A014C0A514747B49BD454058207A52269514C01F0F7D772BBD4540F25D4A5D327E14C097E5EB32FCBD45402502D53F887414C00A2C802903BD454064CF9ECBD45414C0D829560DC2BC454029965B5A0D4914C04224438EADBB45406AD95A5F244414C0E1D05B3CBCBB45406E3480B7404214C0A165DD3F16BC4540459BE3DC263C14C07FA0DCB6EFBB45400E828E56B53414C0EF90628044BB45402920ED7F802514C0C51B9947FEBA45401092054CE01614C06A34B91803BB45407FDDE9CE130F14C01590F63FC0BA4540E63C635FB2F113C01421753BFBBA45403F3A75E5B3EC13C030F65E7CD1BA4540698CD651D5E413C0CDCB61F71DBB45409D47C5FF1DC113C081971936CABA4540FFE6C589AFB613C050E449D235BB4540C45C52B5DDB413C0A7ECF483BABA454002B859BC58A813C0DBFB54151ABA454018EDF1423A9C13C0022EC896E5B945405D363AE7A79813C0DF35E84B6FB94540F18288D4B48B13C061A6ED5F59B94540A1BAB9F8DB7E13C04162BB7B80B84540D3DA34B6D77213C013D731AEB8B84540E7E44526E06713C01F11532289B84540687A89B14C5F13C067EF8CB62AB9454010E9B7AF035713C02AAA7EA5F3B7454012F5824F735213C0C1374D9F1DB845401478279F1E4B13C0FBEB1516DCB745401F300F99F24113C0AA0F24EF1CB84540FBB2B453733913C0A016838769B7454094A0BFD0231613C0596B28B517B74540ED9DD156250113C0923EADA23FB64540990D32C9C8F912C04C37894160B54540C5573B8A73F412C033164D6727B54540BD8C62B9A5E512C0CD902A8A57B54540A47213B534D712C01B9FC9FE79B445409D7FBBECD7CD12C0912C6002B7B44540155454FD4AC712C08192020B60B4454095B88E71C5B512C04C6E14596BB44540397D3D5FB39C12C018CC5F2173B3454069E1B20A9B9112C06C770FD07DB34540A35BAFE9418112C07B82C476F7B24540E77283A10E7B12C0D7C0560916B34540677BF486FB7812C0876BB587BDB24540EE3EC7478B5312C0F8E3F6CB27B34540F0E0270EA04F12C083A279008BB24540EF1AF4A5B73F12C0B56CAD2F12B24540BB29E5B5123A12C062A1D634EFB2454062855B3E923212C02BA1BB24CEB2454091B8C7D2872E12C0DB6CACC43CB3454019AA622AFD2412C0BF0CC68844B3454017D522A2980C12C00454388254B2454034F8FBC56CF911C01A6A1492CCB24540B70C384BC9F211C0DCF4673F52B245404FB16A10E6E611C03E5E488787B245402CD7DB662AE411C0ACAB02B518B24540446FF1F09ED311C03927F6D03EB2454062BCE6559DC511C0BDAC8905BEB245406C3D433866B911C07B849A2155B24540E61E12BEF7B711C0300DC347C4B24540DA1D520C90A811C0516A2FA2EDB24540871A8524B39A11C0ACE3F8A1D2B24540D8463CD9CD8C11C06397A8DE1AB2454000C80913468311C03DB7D09508B2454055A52DAEF17911C058C51B9947B245401C9AB2D30F6A11C01366DAFE95B34540B1DEA815A65F11C0AEBCE47FF2B345402FDCB930D25B11C00CCC0A45BAB34540AAF23D23115A11C07347FFCBB5B245404CFDBCA9485511C0656D533C2EB245404F1E166A4D5311C0F8C3CF7F0FB2454075CDE49B6D4E11C0DB6AD619DFB145408F6E8445454C11C04704E3E0D2B145406A8995D1C84711C08066101FD8B14540022EC896E53B11C039ED293927B24540465ED6C4022F11C0815F234910B24540FE0A992B832A11C00E15E3FC4DB245401D03B2D7BB1F11C03A747ADE8DB1454046B41D53771511C01E1840F850B24540003ACC97171011C01406651A4DB24540E868554B3A0A11C05D5320B3B3B245408AAE0B3F38FF10C0DA740470B3B24540300E2E1D73EE10C0CB694FC939B34540147B681F2BE810C02D25CB4928B34540A4198BA6B3E310C037A79201A0B24540899AE8F351D610C05D177E703EB34540F67EA31D37CC10C09F1D705D31B34540E2E5E95C51BA10C0ADC3D155BAB34540410DDFC2BAB110C0EC8502B683B34540213D450E119710C00CE6AF90B9B4454047382D78D18710C01C7A8B87F7B44540F775E09C117510C0B91AD99596B54540C0EC9E3C2C6410C0E3C798BB96B64540247CEF6FD05E10C0A0F99CBB5DB745403BFBCA83F45410C0D2A92B9FE5B745401BD65416854D10C02EAA454431B7454039639813B43910C0992B836A83B745404DD9E907753110C0A0FD481119B84540C21550A8A72F10C030D978B0C5B84540C9224DBC032C10C053CDACA580B84540EC17EC866D2B10C067F3380CE6B745401BA034D4282410C00F9C33A2B4B745408753E6E61B2110C081EB8A19E1B745403DBA1116152110C013B534B742B84540C39D0B23BD1810C02FE065868DB84540AE49B725721110C07E3A1E3350B94540971B0C75580110C0B665C0594AB84540D34ECDE506E30FC0FCC401F4FBB8454003B5183C4CDB0FC06F2D93E178B845401ADEACC1FBCA0FC09A0986730DB945405EF415A419AB0FC0A62897C62FBA45408753E6E61B910FC026E0D74812BC4540CC29013109770FC061A417B5FBBB454092EC116A86540FC0944DB9C2BBBC45405930F14751470FC0A391CF2B9EBC4540151A886533270FC0B0AC342905BD45408B4F01309E210FC00ABFD4CF9BBC4540C0D02346CF0D0FC09CC3B5DAC3BC4540994528B682060FC032056B9C4DBD4540D61F6118B0E40EC0AF0AD462F0BC454098BF42E6CAC00EC01EDFDE35E8BD454071AE6186C6B30EC0B43A394371BD4540F4C5DE8B2F9A0EC006F52D73BABE454086730D33347E0EC05C001AA54BBF4540E98024ECDB490EC0B5DE6FB4E3BE45406CD102B4AD460EC0A375543541BE45403048FAB48A3E0EC0AF9811DE1EBE45406CD102B4AD460EC07EFE7BF0DABD4540B5FAEAAA404D0EC005A8A9656BBD45406CD102B4AD460EC0F65FE7A6CDBC45405A46EA3D95330EC00C056C0723BC45403067B62BF4210EC00E2C47C840BC454024B9FC87F41B0EC0E84CDA54DDBB45401766A19DD32C0EC04DF564FED1BB45406CD102B4AD460EC03FFED2A23EBB4540B66455849B6C0EC0B950F9D7F2BA45407E7214200A860EC05FB2F1608BB9454087C1FC1532970EC0D522A298BCB94540404CC2853CA20EC034D769A4A5B84540D3A1D3F36EAC0EC07407B13385B845403C6A4C88B9A40EC066FA25E2ADB74540F0A7C64B37A90EC097CADB114EB745403065E080968E0EC0C26856B60FB7454066C0594A96730EC0D1402C9B39B64540EFE714E467830EC02BF702B342B5454044183F8D7B930EC0B6F5D37FD6B4454010ECF82F10840EC0ACADD85F76B34540179AEB34D2720EC0D42AFA4333B545409354A69883600EC0035E66D828B5454031EC3026FD3D0EC0CC43A67C08B64540A6F0A0D9754F0EC0C00644882BB7454031410DDFC23A0EC08B4F01309EB745407FD93D7958280EC0AE0FEB8D5AB945402907B309300C0EC06EA6423C12B945402F8A1EF8180C0EC063EDEF6C8FB84540D8F50B76C3160EC040D9942BBCB745401E6FF25B74120EC0B0ABC95356B7454093399677D5030EC022DFA5D425B74540B55373B9C1F00DC029780AB952B74540E50AEF7211FF0DC024ED461FF3B74540C617EDF142FA0DC0CBA2B08BA2B9454051DD5CFC6D0F0EC07D94111780BA454019726C3D43D80DC056F31C91EFBA4540FFB27BF2B0D00DC0AF09698D41BB45409A79724D81CC0DC0C171193735BC45406A85E97B0DC10DC09DF7FF71C2BC4540DA756F4562A20DC0999A046F48BD454004560E2DB27D0DC0676490BB08BD4540D6A71C93C53D0DC0EA42ACFE08BF4540B7EC10FFB0250DC0CB2DAD86C4BF45403604C765DCF40CC046459C4EB2BF45405299620E82EE0CC03271AB2006C0454082AD122C0EE70CC095D5743DD1BF454003999D45EFD40CC0FBAD9D2809C145406ABFB51325C10CC02F51BD35B0C145404A26A77686A90CC0EDF318E599C145405F5D15A8C5A00CC0DC679599D2C045403AEB538EC9820CC07F17B6662BC14540B763EAAEEC620CC000378B170BC145402062838593540CC0859675FF58C04540058C2E6F0E570CC0AE4A22FB20BF4540E8A4F78DAF3D0CC056D636C5E3BE45403EB0E3BF40300CC0BD5301F73CBF4540075E2D7766220CC05A2A6F4738BF4540CEC7B5A1621C0CC047753A90F5BE4540FB75A73B4F1C0CC07C9DD497A5BD45400D384BC972120CC0FBCA83F414BD4540C0E95DBC1FF70BC017105A0F5FBC4540D6FECEF6E8CD0BC093E1783E03BC4540C4D155BABBAE0BC07C80EECB99BB4540381268B0A9930BC0ED7E15E0BBBB4540ACAB02B5187C0BC01477BCC96FBB4540E65AB4006D6B0BC0882B67EF8CBA4540FA7DFFE6C5690BC03A3C84F1D3B845405721E527D57E0BC03C4F3C670BB84540D34F38BBB5AC0BC011C8258E3CB84540DB183BE125B80BC0EE409DF2E8B84540747CB43863B80BC02CEFAA07CCB7454074620FED63C50BC0637C98BD6CB7454007B309302CDF0BC0F7578FFB56B74540CAE0287975EE0BC0BB63B14D2AB64540309DD66D50DB0BC0C00644882BB7454030D63730B9B10BC011E2CAD93BB7454010E7E104A6B30BC02BFC19DEACB34540E6CB0BB08FAE0BC0FB5A971AA1B345400C59DDEA39A90BC0683EE76ED7B5454069FF03AC559B0BC0DA8EA9BBB2B74540E754320054910BC092921E8656B74540CF49EF1B5F7B0BC0D0F1D1E28CB54540302B14E97E6E0BC0A7EB89AE0BB54540CEC47421565F0BC03468E89FE0B44540DEE8633E20500BC0309C6B98A1B54540EF54C03DCF3F0BC07AABAE4335B54540179B560A811C0BC07E8B4E965AB54540693BA6EECA0E0BC04A0A2C8029B545404F745DF8C1F90AC09C53C90050B5454087DC0C37E0F30AC0C5909C4CDCB44540C9E6AA798EE80AC09FC728CFBCB44540D6E5948098C40AC0BFEFDFBC38B54540A4A833F790B00AC0B0C91AF510B54540B439CE6DC29D0AC0E544BB0A29B545407D224F92AE990AC0FA0E7EE200B4454031CF4A5AF18D0AC0C9E9EBF99AB34540D7C3978922840AC048C49448A2B345407B6649809A7A0AC0CD76853E58B445409A27D714C86C0AC086E7A56263B445405E2EE23B314B0AC017467A51BBB345400A302C7FBE0D0AC0AA622AFD84B34540EE5C18E945CD09C00EDAAB8F87B2454088307E1AF7C609C060CD018239B24540E813799274CD09C00A65E1EB6BB145400ABABDA431BA09C045F5D6C056B14540FC71FBE593B509C0E5982CEE3FB04540EEB25F77BA9309C024EEB1F4A1AF45403221E692AA8D09C0CF4BC5C6BCAE454041BCAE5FB07B09C03F3A75E5B3AE4540C8957A16847209C0E99D0AB8E7AD454029E78BBD175F09C04147AB5AD2AD4540E88711C2A34D09C0603FC4060BAD454055DFF945093A09C0261DE56036AD4540A629029CDE2509C0F73B1405FAAC45406744696FF00509C0B492567C43AD454082AE7D01BDF008C0BC95253ACBAC454097A8DE1AD8EA08C0874D64E602AD4540A3CC069964E408C0C347C49448AE4540965E9B8D95D808C0999CDA19A6AE454075ADBD4F55C108C0483657CD73AE4540DAFF006BD58E08C0172D40DB6AAC4540E75086AA988A08C095826E2F69AC4540BA1281EA1F6408C029CFBC1C76AB4540EA245B5D4E4908C0AEB7CD5488AB45405FED28CE514708C0C782C2A04CAB4540E1ECD632194E08C0102384471BAB4540AF27BA2EFC4008C0E5EE737CB4AA4540E2B034F0A33A08C04B1E4FCB0FAA45407270E998F32C08C08FE4F21FD2A94540BAD8B452082408C0DEC7D11C59A94540DC80CF0F232408C0ADC266800BAA4540F01989D0081608C03F390A1005AB4540A510C8258E1C08C072BF4351A0AB45400938842A351B08C0FF04172B6AAC454057410C74ED2B08C0A1A2EA573AAD454021CB82893F2A08C0336B2920EDAD45402DCDAD10564308C075914259F8AE45404A5D328E914C08C0E5D4CE30B5AF45405D52B5DD043F08C0BB4560AC6FB04540933A014D842D08C00D5531957EB0454033A31F0DA70C08C0AE9B525E2BB14540C87DAB75E2F207C0A12B11A8FEB14540D7A546E867EA07C08F6D197096B245406EC0E78711E207C0EA094B3CA0B245409224085740E107C032E9EFA5F0B2454019575C1C95DB07C05C751DAA29B345404E27D9EA72CA07C098F6CDFDD5B345403B8F8AFF3BC207C044149337C0B445406422A5D93CAE07C0EBE40CC51DB545403B00E2AE5EA507C0DD611399B9B44540DF313CF6B39807C03E23111AC1B44540FF3EE3C2819007C0F4C308E1D1B445406E8B321B649207C0594DD7135DB54540FE0C6FD6E09D07C024809BC58BB54540FB3F87F9F2A207C0C4EA8F300CB645405B0A48FB1FA007C0FF3D78EDD2B64540C4793881E99407C0FD8348861CB7454089EDEE01BA8F07C0B6679604A8B745409A6038D7306307C0925CFE43FAB745400D1B65FD664207C037001B1021B84540D53F8864C83107C0F0C3414294B745407AFD497CEE0407C00A302C7FBEB745407EA7C98CB7F506C01EE0490B97B745403FE3C28190EC06C0DB4FC6F830B745401DAD6A4947D906C07FDDE9CE13B74540D0436D1B46C106C032056B9C4DB745402CA0504F1FA106C0F44D9A0645B7454096ED43DE729506C0527FBDC282B745409DF529C7647106C05C92037635B745403BA8C4758C4B06C0919A7631CDB84540BB0F406A134706C02DB0C7444AB945406B0E10CCD14306C0CD91955F06B9454083312251681906C0137D3ECA88B94540459F8F32E20206C09C8A54185BBA454009FEB7921DFB05C0404D2D5BEBB9454092088D60E3FA05C0C362D4B5F6B8454016A6EF3504E705C0F9A3A833F7B64540EBE3A1EF6EC505C03CA583F57FB645402BDD5D6743BE05C0361FD7868AB545406C921FF12BB605C01D21037976B545407A3881E9B4AE05C09C35785F95B54540B0389CF9D59C05C0DE1FEF552BB54540D3122BA3918F05C080B74082E2B3454047B071FDBB7E05C07D7901F6D1B345404913EF004F7A05C0C956975302B4454075779D0DF96705C0274C18CDCAB4454090696D1ADB4B05C0B16D516683B4454014B2F336363B05C0A99F3715A9B445400B0E2F88482D05C00C3CF71E2EB545400DC51D6FF21B05C022FDF675E0B445404B732B84D51805C01A16A3AEB5B345407288B839950C05C0D1B2EE1F0BB345400BB6114F76F304C05B785E2A36B2454042EDB776A2E404C0B9FB1C1F2DB245409E996038D7D004C01F86562767B2454021ACC612D6A604C0B6F3FDD478B1454062156F641E9904C021753BFBCAB14540B98B3045B99404C07F4FAC53E5B14540363FFED2A27E04C0828DEBDFF5B14540616F62484E6604C0ED0F94DBF6AF4540111B2C9CA45904C08927BB99D1AF4540BC0512143F4604C0AE9E93DE37B04540A8E0F082883404C06FF4311F10B045408446B071FD1B04C0362383DC45B045408196AE601B1104C0D7F7E12021B045407E9065C1C4FF03C0914259F8FAAE45402D9622F94A0004C0249A40118BAE4540BA1457957DF703C0B69E211CB3AE4540F0A7C64B37E903C09775FF5888AE4540B5519D0E64DD03C0FCDF1115AAAD45403F0114234BC603C014B35E0CE5AC454078465B9544B603C055F833BC59AB4540BB0CFFE9068A03C0153944DC9CAA45409D2ADF33128103C0E63FA4DFBEAA45409EF0129CFA6003C001DC2C5E2CAA454097546D37C15703C0B9A5D590B8A94540EACA67791E5C03C06EC2BD326FA9454082035ABA824D03C09A266C3F19A945404A0D6D00364003C0C5C9FD0E45A945406D3B6D8D082603C0A19DD32CD0A845407C462234820D03C0999EB0C403A84540EFE192E34E0903C0C992399677A745400CC85EEFFEF802C069739CDB84A74540809BC58B85E102C0268C6665FBA645403620425C39DB02C04E61A5828AA64540683C11C479D802C038F92D3A59A6454040DCD5ABC8C802C021054F2157A64540D8BCAAB35AC002C0C7F2AE7AC0A64540840CE4D9E59B02C08884EFFD0DA645403A3C84F1D37802C08D5E0D501AA645406A8995D1C84702C08330B77BB9A545400A80F10C1A1A02C0CEFBFF3861A64540D65757056A1102C06BF46A80D2A6454010406A1327F701C068CD8FBFB4A6454022FE614B8FE601C043C70E2A71A745406A16687748D101C0F5F411F8C3A745403A747ADE8DA501C02AADBF2500A745406D003620429C01C08A3E1F65C4A74540B84082E2C79801C00937195586A74540FDF49F353F9E01C071546EA296A645409C4D4700378B01C0C0EC9E3C2CA64540261AA4E0298401C03DB9A64066A54540CCB56801DA7601C063F030ED9BA54540F8E3F6CB276B01C01AA4E029E4A4454015E63DCE346101C0E6ADBA0ED5A44540096CCEC1334101C0246420CF2EA545407D586FD40A3301C0BBD39D279EA54540B9C32632732101C0C3F2E7DB82A545401C60E63BF80901C0F7E461A1D6A44540B89388F02FE200C0959F54FB74A64540B515FBCBEEA900C01E6CB1DB67A745409450FA42C81900C027BF45274BA94540307F85CC950100C00EA48B4D2BA945407D3ECA880B0000C09430D3F6AFA845405F5D15A8C5E0FFBFCE8C7E349CA84540629D2ADF33D2FFBF3A933655F7A84540D7DAFB5415DAFFBF334FAE2990A94540D89DEE3CF19CFFBFFA9AE5B2D1A945403AE8120EBD85FFBF60234910AEAA45400D71AC8BDB68FFBF0B7DB08C0DAB4540705E9CF86A47FFBF9487855AD3AA4540C7BAB88D0630FFBFBBD6DEA7AAAA454057EA5910CAFBFEBFA643A7E7DDAA4540AB5AD2510EE6FEBF5628D2FD9CAA4540F910548D5ECDFEBFFE0A992B83AA45406D54A70359CFFEBF72A43330F2AA45400F27309DD66DFEBFB98E71C5C5AB45407AE2395B4028FEBF14799274CDAC45401C08C90226F0FDBF75E8F4BC1BAF4540B03BDD79E2B9FDBF703FE08101B04540CA6DFB1EF597FDBF96B036C64EB04540DD0C37E0F383FDBFC845B58828B04540ED28CE514747FDBF51DEC7D11CB14540E2067C7E18E1FCBF77483140A2B14540313F373465A7FCBFFBE93F6B7EB245404EB51666A19DFCBF3D9AEAC9FCB14540732B84D558C2FCBFA439B2F2CBB045407CD11E2FA4C3FCBF5587DC0C37B0454066BB421F2CA3FCBF7D76C075C5AE454014083BC5AA81FCBF8D47A98427AE454098A7734529A1FCBF3C11C47938AD45400002D6AA5D93FCBFA777F17EDCAC454001030000000100000008000000C3482F6AF7CB0940F1BA7EC16E064540A2630795B8CE09408EAF3DB3240645403FAC376A85C9094054AC1A84B90545408577B988EFC40940B1868BDCD305454077A38FF980C00940624CFA7B2906454066BB421F2CC30940FB75A73B4F064540FBE769C020C9094022FFCC203E064540C3482F6AF7CB0940F1BA7EC16E064540010300000001000000050000005E6919A9F734094019CBF44BC4F54340274BADF71B2D0940F59D5F94A0F54340309E4143FF240940D655815A0CF643401747E5266A290940BCE82B4833F643405E6919A9F734094019CBF44BC4F5434001030000000100000005000000C80A7E1B621C08402CF180B229A7434031CD74AF931A08407077D66EBBA64340001DE6CB0B10084028F4FA93F8A64340B34291EEE71408403D7FDAA84EA74340C80A7E1B621C08402CF180B229A74340010300000001000000050000005CAD1397E3D507400E6954E06495434022E010AAD4CC07409949D40B3E954340A648BE1248C907402D7B12D89C954340DC291DACFFD307407E9065C1C49543405CAD1397E3D507400E6954E0649543400103000000010000000600000027F911BF62CD07406090F46915994340ED9C668176C70740069D103AE8984340AD6BB41CE8C10740CFF9298E0399434068EBE0606FC2074088BA0F406A994340E8DCED7A69CA0740E90DF7915B99434027F911BF62CD07406090F469159943400103000000010000004B000000BA111615719A0740C45BE7DF2E954340499D8026C2A60740137F1475E69443409DBE9EAF59AE0740E17B7F83F6944340F54718062CB9074089EAAD81AD9443403E22A64412BD0740AE7FD767CE944340EE2422FC8BC007405376FA415D944340E412471E88CC07407D21E4BCFF934340CE6C57E883C50740367689EAAD9343407E7214200AC607407A7077D66E93434003E962D34AC107407DCD72D9E8924340B96DDFA3FEBA0740293FA9F6E9924340CEE2C5C210B90740941799805F93434070253B3602B10740ECDE8AC40493434049111956F1A60740F2785A7EE09243405551BCCADAA60740207A5226359243401D7233DC80AF0740CF87670932924340094FE8F527B10740138255F5F2914340079964E42CAC07402DE92807B3914340A6B915C26AAC074014268C66659143404739984D80A107407CB5A33847914340213EB0E3BFA00740D6C743DFDD90434094331477BCA907402EAD86C43D90434035B742588DA50740C24EB16A1090434098BF42E6CAA00740F3AE7AC03C904340C11C3D7E6F930740B51B7DCC0790434056EF703B348C074082A966D6529043401C7BF65CA6860740C18EFF024190434045B75ED3838207402028B7ED7B9043407BA35698BE770740E1EB6B5D6A90434040A374E95F72074098DC28B2D6904340EBE40CC51D6F07400CACE3F8A1904340F148BC3C9D6B074005FBAF73D390434062687572866207406E6E4C4F5890434030630AD6385B0740179B560A8190434029B000A60C5C0740DAA84E07B29043405BECF6596566074077A22424D2904340DAFE959526650740BC934F8F6D914340E6E95C514A680740DBDFD91EBD914340E8DEC325C75D0740077DE9EDCF914340753BFBCA835407408CBD175FB491434072E14048165007408C6A11514C924340E2E995B20C5107400D7217618A924340D2FBC6D79E5907408B34F10EF0924340EDB94C4D825707408D261763609343406090F469155D0740C03FA54A949343402AAC54505155074026547078419443407C0DC1711957074001DBC1887D944340441669E21D60074038DC476E4D94434037C5E3A25A64074033880FECF89343409696917A4F650740904DF2237E934340E8F4BC1B0B6A0740335184D4ED92434008CC43A67C680740D80C7041B6924340904E5DF92C6F07407BDAE1AFC9924340543A58FFE7700740450F7C0C56924340EF5355682076074094BC3AC7809243405E82531F487E0740FFD0CC936B92434064575A46EA7D0740874D64E6029343405C9203763579074065DEAAEB509343402D05A4FD0F70074011397D3D5F934340232F6B62816F07407D7901F6D193434028F38FBE497307407460394206944340A3CEDC43C27707401669E21DE0934340CA181F662F7B0740D26EF4311F9443401899805F23890740CADDE7F8689343408C683BA6EE8A0740BD19355F25934340A69BC420B092074072A3C85A43934340F1BA7EC16E980740C8B7770DFA9243400F4757E9EE9A0740917BBABA63934340481630815B970740DF347D76C0934340FA97A432C59C0740B4CA4C69FD9343402AFEEF880A950740793A57941294434072C3EFA65B9607404B57B08D789443403D80457EFD9007408EE89E758D9443400DC1711937950740DD94F25A09954340BA111615719A0740C45BE7DF2E9543400103000000010000000D000000F31B261AA4C0074041BCAE5FB09743404739984D80C107402CB6494563974340D3F8855792BC0740821B295B24974340FEEDB25F77BA074029064834819643408D62B9A5D5B00740CF691668779643401A4E999B6FA407407B6AF5D555974340BD6F7CED99A50740D446753A9097434067D47C957CAC07406EDFA3FE7A9743401477BCC96FB1074033535A7F4B9843407B88467710BB0740E4BB94BA64984340F5A10BEA5BC607408FE3874A23984340DACBB6D3D6C807405E49F25CDF974340F31B261AA4C0074041BCAE5FB097434001030000000100000005000000F67EA31D371C0540F030ED9BFBC7434091B586527B110540D6E253008CC7434016889E94490D05401BA19FA9D7C743408B8BA37213150540904B1C7920C84340F67EA31D371C0540F030ED9BFBC743400103000000010000000500000098E0D40792B704405C3E92921EC443402B4D4A41B7B7044098DA520779C343406F10AD156DAE04407D5C1B2AC6C34340D6355A0EF4B00440817C09151CC4434098E0D40792B704405C3E92921EC443400103000000010000000500000067B45549649F0340266DAAEE91BF4340EC18575C1C950340B9895A9A5BBF434059198D7C5E9103409F56D11F9ABF4340C7DADFD91E9D03401686C8E9EBBF434067B45549649F0340266DAAEE91BF43400103000000010000000E000000A3E6ABE4637702409351651877C94340677C5F5CAA720240BD5301F73CC943403239B5334C6D02403EB324404DC943401EC4CE143A6F0240A1664815C5C9434061A417B5FB7502408141D2A755CA43400150C58D5B8C0240BF0CC68844CB434028B682A625960240FE0C6FD6E0CB43402C836A8313B102402E3883BF5FCC4340570740DCD5AB024041F163CC5DCB434094FB1D8A029D0240D1B2EE1F0BCB434094A2957B819902404034F3E49ACA4340AC1A84B9DD8B0240FF06EDD5C7C94340043BFE0B04810240EACC3D247CC94340A3E6ABE4637702409351651877C943400103000000010000001400000039F06AB9331300407E5704FF5B3945405E8429CAA5B1FF3FD7851F9C4F3945400F7C0C569CAAFF3FC9586DFE5F394540EF586C938A86FF3F5EBEF561BD3945409D4CDC2A8881FF3FEE0912DBDD394540CEC7B5A1625CFF3FE8F4BC1B0B3A45407D21E4BCFF4FFF3F1FB935E9B63A4540E882FA96395DFF3F629D2ADF333C4540666666666666FF3FE3A8DC442D3D4540A88C7F9F71A1FF3F8F519E79393E45403EEAAF5758B0FF3F52D7DAFB543F4540E621533E04D5FF3F191EFB592C3F45402827DA5548F9FF3FBAF59A1E143E4540B8E52329E9E1FF3FFE0C6FD6E03D4540A6608DB3E9C8FF3F1BBCAFCA853C4540CF4D9B711AE2FF3F55A18158363B45408A3E1F65C4050040268DD13AAA3A4540E6C93505321B0040B4739A05DA3945408884EFFD0D1A0040FACF9A1F7F39454039F06AB9331300407E5704FF5B39454001030000000100000007000000B537F8C2646AFA3FAC36FFAF3A844340B5E1B034F063FA3F2C634337FB8343406FD8B628B341FA3FD32D3BC43F844340062D24607439FA3F09A7052FFA844340ECDB4944F857FA3F79944A7842854340B8AD2D3C2F55FA3F919A7631CD844340B537F8C2646AFA3FAC36FFAF3A8443400103000000010000008F000000ECA694D74AA8F83F1D5723BBD28E4340CF2EDFFAB09EF83F08E57D1CCD8D434015FF774485EAF83FC9224DBC038C43402DE8BD310400F93F548EC9E2FE8B43402C465D6BEF13F93FB32616F88A8C4340D61BB5C2F47DF93FA81B28F04E8C434062F4DC4257A2F93FEB573A1F9E8B434088F19A577596F93F2F3196E9978A43408DF161F6B2ADF93F1C25AFCE318A43408D96033DD4B6F93FE92807B3098A43408DF161F6B2ADF93FBFB9BF7ADC8943401EC2F869DC9BF93F81CF0F2384894340DB4FC6F8307BF93FF5BA4560AC8943400E6B2A8BC26EF93F1EA8531EDD8843400ED8D5E4296BF93F2C9D0FCF12884340BBF2599E0777F93F8DCF64FF3C8743408DF161F6B2ADF93F0AD80E46EC8543405D4F745DF8C1F93FF7E461A1D68443404149810530E5F93FDFA7AAD040844340C5AD8218E8DAF93F4ACFF412638343408DF161F6B2ADF93F86A92D7590834340C712D6C6D889F93FE6ADBA0ED5824340290989B48D7FF93FBC7A15191D8243402FFD4B529962F93F9F211CB3EC814340D5592DB0C744F93FA01A2FDD248043408A1F63EE5A42F93F5F46B1DCD27E434053758F6CAEDAF83FD4484BE5ED7E43401C959BA8A5B9F83F3E3C4B90117E4340F8C3CF7F0F9EF83F4DBA2D910B7E43401D041DAD6A89F83FDEC66647AA7D43405AD6FD63217AF83F1616DC0F787A43403FABCC94D65FF83F69C9E369F979434091B8C7D2876EF83FB30C71AC8B794340F627F1B9136CF83FF3716DA8187943401BD82AC1E230F83FA12E52280B794340A0336953750FF83F3E95D39E92774340919DB7B1D9D1F73F8B355CE49E764340CD22145B4193F73F91990B5C1E754340BD3AC780EC75F73FD1B2EE1F0B754340D4B837BF6162F73F25AE635C7175434078B5DC990946F73FB4AF3C484F75434061342BDB873CF73F8EE89E758D744340C4995FCD0102F73F39B69E211C7543405378D0ECBAF7F63F7CF1457BBC74434066A032FE7D06F73F185B087250744340064CE0D6DDFCF63F3BC5AA4198734340556CCCEB88C3F63FA3CEDC43C273434062669FC7288FF63F7E7214200A7243408104C58F3177F63F0C3F389F3A7043401898158A747FF63FBB97FBE4286E4340E2016553AE70F63F83A279008B6C4340BC96900F7A76F63F5264ADA1D46A43401DACFF73982FF63FE60819C8B36B43402176A6D0790DF63FF52B9D0FCF6A43405BB05417F0F2F53F60747973B86A434025B20FB22CD8F53F2481069B3A6D434001344A97FEA5F53FA35698BED76E4340DD611399B980F53F16F6B4C35F6F4340D1C952EBFD46F53FC8EBC1A4F86E4340BE69FAEC802BF53F240F4416696E4340F58590F3FEFFF43FF8C610001C6F4340E509849D62D5F43F4E27D9EA726E4340BB2BBB6070CDF43F5E9ECE15A56E43408928266F80D9F43FCFBEF2203D6F43406D718DCF64BFF43F5D8940F50F70434097ADF545425BF43F0B9C6C0377704340DB8651103C3EF43F2578431A15704340BB2BBB60700DF43F2F505260016E43402634492C29F7F33F23111AC1C66D434002B7EEE6A9CEF33F4DBC033C696F4340183F8D7BF39BF33F1BBE8575E36F4340FE9AAC510F91F33FA661F88898704340A245B6F3FD94F33F75E61E12BE7143402254A9D9036DF33F3B014D840D7343403D65355D4F74F33F26AC8DB11374434000AC8E1CE98CF33F72874D64E6744340EDBB22F8DF8AF33FAA7EA5F3E175434028452BF702B3F33FCEE2C5C21077434040C05AB56BC2F33FBE2D58AA0B784340096CCEC133A1F33F804413286279434038BEF6CC9280F33F73BED87BF17943401F4AB4E4F174F33FD49AE61DA77A4340AD174339D1AEF33F99BA2BBB607C434039EE940ED6BFF33FC828CFBC1C7C434084BD892139D9F33FAC8DB1135E7C434042AF3F89CFDDF33F63EFC517ED7B43400395F1EF33EEF33F46B3B27DC87B434005DD5ED2182DF43FDF50F86C1D7C4340484E266E1544F43F03B34291EE7B4340583A1F9E2588F43FD6FCF84B8B7C43403CA3AD4A22BBF43F47C9AB730C7C4340CE893DB48FD5F43F8FC6A17E177C43403F389F3A56E9F43F747B4963B47C434096CD1C925AE8F43F4985B185207D4340A26131EA5ABBF43F0ED76A0F7B7D4340A112D731AEB8F43F0C056C07237E4340AF997CB3CD8DF43F043A9336557F434098BD6C3B6D8DF43F63D2DF4BE17F434001DBC1887DC2F43F2219726C3D8143400569C6A2E9ACF43F46ED7E15E08143409C14E63DCEB4F43FB3CF63946782434073DA53724EACF43FCBBF9657AE8343400B0C59DDEAF9F43F713AC9569785434040BE840A0E2FF53F39B35DA10F8643402A6F47382D38F53F30BC92E4B9864340C231CB9E0476F53FAD855968E78643406EDFA3FE7A85F53F054EB6813B8843401212691B7FA2F53F130CE71A66884340D9B27C5D86BFF53F541B9C887E894340035B25581CCEF53F1CEDB8E1778943408D26176360DDF53F9DB81CAF408843407349D57613FCF53F815F234910884340D8BB3FDEAB16F63F4F78094E7D8843403EE94482A926F63F96B20C71AC89434089EE59D76839F63F8E75711B0D8A43401F477364E557F63FD3DC0A61358A4340AA7F10C99063F63F8D5F7825C9894340D02A33A5F577F63F86AFAF75A9894340AA2A3410CBA6F63F58923CD7F78943403259DC7F64BAF63FAC90F2936A8B4340BA8784EFFDCDF63F5665DF15C18B434058AEB7CD5408F73F2315C616828A4340E9263108AC1CF73F83DA6FED448B4340977329AE2A3BF73FF8F9EFC16B8B434001F8A7548932F73F629E95B4E28B4340095053CBD63AF73F2788BA0F408C434004ADC090D56DF73F6C96CB46E78C4340FA27B8585183F73F99107349D58C43404ED367075C97F73FFB95CE87678D43407EC3448314BCF73F05A3923A018D4340F0FCA204FDC5F73FE6CDE15AED8D4340E7E44526E0D7F73F7619FED30D8E4340C956975302E2F73F1CB4571F0F8D43406F0D6C9560F1F73F2F88484DBB8C43409E7DE5417A0AF83F9BC937DBDC8C434001A1F5F06522F83F6A334E43548D4340904946CEC21EF83F26361FD7868E43401BD82AC1E230F83F89B14CBF448E4340CFF41263993EF83F8BA548BE128E434014B35E0CE544F83F921FF12BD68E434001C0B167CF65F83FD829560DC28E434043E38920CE83F83FE4A25A44148F4340ECA694D74AA8F83F1D5723BBD28E434001030000000100000028000000478D09319754F73F5B423EE8D95C4340E998F38C7D89F73FCF86FC33835C43405D6C5A2904B2F73FC0B33D7AC3594340B64AB0389C39F83F321D3A3DEF564340ED832C0B267EF83FED0E29064856434085D0419770E8F83F0D8AE6012C584340F12E17F19D18F93FFFE7305F5E58434026361FD7864AF93F40F9BB77D45643401BF4A5B73F57F93F61545227A05543400D384BC97252F93F5298F738D35443400BB5A679C729F93F24809BC58B53434030F488D1730BF93F9241EE224C53434084F57F0EF365F83F7731CD74AF53434036E84B6F7F2EF83F7EA99F3715554340551344DD07E0F73F29CC7B9C69564340AEB7CD548887F73FF1A0D9756F574340C138B874CC39F73FDC0DA2B5A25743404CA8E0F08208F73FE831CA332F5743401D3D7E6FD3DFF63F4AECDADE6E554340B51A12F7587AF63F813FFCFCF7524340081C0934D854F63F4356B77A4E524340E350BF0B5B33F63F2FE1D05B3C524340A6EF3504C725F63FF9C08EFF02534340C98E8D40BC2EF63FBB421F2C63554340C2D9AD65321CF63FADDF4C4C17584340E083D72E6D38F63FD3D85E0B7A594340BA6A9E23F21DF63F015130630A5C4340963FDF162C55F63FFB777DE6AC5D4340B35F77BAF384F63F38DBDC989E5C434083DDB06D51A6F63F7DCEDDAE975C434077F69507E9A9F63F3FADA23F345D43404E9D47C5FF9DF63FCD0358E4D75D43407AC5538F34B8F63FF4346090F45D4340AD6A494739D8F63FD15CA791965E434088F4DBD781F3F63F27A5A0DB4B60434067800BB265F9F63F976F7D586F6043402E008DD2A5FFF63F21E868554B6043404B1E4FCB0F1CF73FD15CA791965E434063997E89782BF73F289A07B0C85D4340478D09319754F73F5B423EE8D95C434001030000000100000007000000130CE71A66A8F73F3FC8B260E2654340A04E797423ACF73F22718FA50F6543407C0BEBC6BBA3F73F2E3C2F151B654340865AD3BCE394F73FF29716F549664340AF7C96E7C19DF73FFE4465C39A6643403CF88903E8B7F73FA4C684984B664340130CE71A66A8F73F3FC8B260E265434001030000000100000006000000419DF2E84658F73FB1FB8EE1B1734340ADDD76A1B94EF73F7F8461C092734340919BE1067C3EF73FE92807B309744340AA7CCF488446F73F4B581B63277443401366DAFE9555F73F522635B401744340419DF2E84658F73FB1FB8EE1B1734340010300000001000000060000006CB41CE8A1F6F63FA6457D923B624340F4DF83D72EEDF63F2BC0779B37624340B7EC10FFB0E5F63F62855B3E926243404225AE635CF1F63F2D431CEBE26243401E51A1BAB9F8F63F774B72C0AE6243406CB41CE8A1F6F63FA6457D923B6243400103000000010000001000000027309DD66DD0F63FFBCE2F4AD065434032E719FB92CDF63FD253E4107165434086C954C1A8E4F63F0A85083884644340594FADBEBAEAF63FA26131EA5A634340FDA204FD85DEF63F315C1D00716343401A6F2BBD36DBF63F64575A46EA6343404F7633A31FCDF63FBB63B14D2A6443408D429259BDC3F63F16359886E1634340A112D731AEB8F63F5116BEBED6634340A1664815C5ABF63F9641B5C1896443404643C6A354C2F63F6FD39FFD4865434044317903CCBCF63F18D2E1218C65434041446ADAC5B4F63FAF5A99F04B654340BBF1EEC858ADF63F61545227A065434012A1116C5CBFF63F17450F7C0C66434027309DD66DD0F63FFBCE2F4AD065434001030000000100000005000000AA66D652409AF63F29417FA1476843407E022846968CF63F560C570740684340AB949EE92586F63FB7D26BB3B1684340E8DD58501894F63F4D158C4AEA684340AA66D652409AF63F29417FA1476843400103000000010000000600000078D1579066ECF33FCC290131098D444084BD892139D9F33F59C345EEE98C4440939048DBF8D3F33F508D976E128D4440A1664815C5EBF33FA5828AAA5F8D444074CE4F711CF8F33F889D29745E8D444078D1579066ECF33FCC290131098D444001030000000100000005000000CADFBDA3C684F33FC74CA25EF07B43405AF5B9DA8A7DF33F6CEBA7FFAC7B434062F54718066CF33FD88349F1F17B43408A1D8D43FD6EF33F3750E09D7C7C4340CADFBDA3C684F33FC74CA25EF07B43400103000000010000000F0000007E3672DD9472F33F6C3EAE0D157F4340B686527B116DF33F99805F23497E4340CE6C57E88365F33FD367075C577E43405BD3BCE3145DF33F3811FDDAFA7D4340ED2B0FD25364F33F54C90050C57D43400EF8FC304278F33F99BC0166BE7D4340DBE044F46B6BF33F546EA296E67C4340A8DF85ADD94AF33F30682101A37D4340BB809719364AF33FCD203EB0E37D4340B6A2CD716E53F33F9278793A577E4340E6AC4F39264BF33F9D0E643DB57E4340841266DAFE55F33FC3D7D7BAD47E434046B41D537765F33FC537143E5B7F4340F7764B72C06EF33F3F558506627F43407E3672DD9472F33F6C3EAE0D157F4340010300000001000000050000000726378AAC75F33F71C63027686F4340DC2F9FAC186EF33F63601DC70F6F4340CFA10C553155F33F34677DCA316F43406249B9FB1C5FF33F63997E89786F43400726378AAC75F33F71C63027686F4340010300000001000000070000005FD383825234F33F295DFA97A46E4340D4F36E2C280CF33F0EF7915B936E43405A7EE02A4F20F33F562C7E53586F4340177E703E752CF33FF816D68D776F43402C8194D8B53DF33F45D8F0F44A6F43409885764EB340F33FBDC282FB016F43405FD383825234F33F295DFA97A46E43400103000000010000000500000032022A1C412AF33FE3FA777DE67A4340DDEBA4BE2C2DF33F58CB9D99607A43403BE2900DA40BF33F9700FC53AA7A43400057B2632310F33F6403E962D37A434032022A1C412AF33FE3FA777DE67A4340010300000001000000050000009FE8BAF083B3F23F4E44BFB67E7C4340DBC2F352B1B1F23F67F2CD36377C43407F15E0BBCD9BF23FEC14AB06617C43406C5CFFAECF9CF23F61E28FA2CE7C43409FE8BAF083B3F23F4E44BFB67E7C43400103000000010000002A000000C37FBA8102EFE63F973C9E961F4C44409B20EA3E00A9E63F53E9279CDD4A4440116F9D7FBB6CE63F689599D2FA4944406878B306EF2BE63F64CE33F625494440F08B4B55DAE2E53FAB93331477484440C153C8957A96E53F0B0C59DDEA474440B41EBE4C1421E53F4AB20E4757474440F0DE516342CCE43FAC74779D0D474440BA83D8994267E43F3FFF3D78ED464440DA907F66101FE43FC5AD8218E846444048F8DEDFA0BDE33F47E9D2BF24474440AF42CA4FAA7DE33F753E3C4B90474440BEA4315A4755E33F16C094810348444087FA5DD89A2DE33F016C4084B848444046EA3D95D31EE33FFC1A49827049444004ADC090D52DE33FD505BCCCB0494440EB1D6E878645E33FA243E048A049444045D8F0F44A59E33F7764AC36FF4944404F5C8E57207AE33F3CDBA337DC494440715985CD0097E33F689599D2FA4944407AAA436E869BE33FF4A3E194B9494440B0E600C11CBDE33FE7E44526E04944407F85CC9541B5E33F8F6E8445454A4440A3B08BA207BEE33FB55208E4124B4440897956D28AEFE33FAE11C138B84A444073672618CE35E43F100874266D4A4440A0DE8C9AAF92E43F5B7D7555A04A4440CAFACDC474A1E43F7506465ED64A444038A4518193EDE43FC2DD59BBED4A44404E9A0645F300E53F228D0A9C6C4B4440CE35CCD07822E53F61DF4E22C24B44409C53C9005045E53FAA0A0DC4B24B44406551D845D183E53F1F1329CDE64B4440A31EA2D11DC4E53FEFC9C342AD4B4440CCB6D3D688E0E53FFED30D14784B4440E1968FA4A407E63F3332C85D844B4440F452B131AF23E63F54E1CFF0664B4440C075C58CF076E63F3A747ADE8D4B4440A9893E1F65C4E63FF1F09E03CB4B4440F5DA6CACC43CE73F9E78CE16104E4440C8B60C384B49E73F10B22C98F84D4440C37FBA8102EFE63F973C9E961F4C44400103000000010000000600000013286211C30EE63F663046240AF3434007EFAB72A1F2E53F5C8DEC4ACBF24340361D01DC2CDEE53F39F1D58EE2F24340427BF5F1D0F7E53F647616BD53F343407D5EF1D4230DE63F691CEA7761F3434013286211C30EE63F663046240AF3434001030000000100000005000000A987687407B1CD3F588FFB56EB604340DCD6169E978ACD3F9DF2E84658604340A60D87A5811FCD3FE1EB6B5D6A60434046B247A81952CD3F931804560E614340A987687407B1CD3F588FFB56EB60434001030000000100000005000000E1B4E0455F41C0BFFA0D130D52404340C4EE3B86C77EC0BFC9737D1F0E404340B08D78B29B19C1BF5D3123BC3D404340CEFBFF3861C2C0BF58E1968FA4404340E1B4E0455F41C0BFFA0D130D5240434001030000000100000009000000D6C4025FD1ADDEBF4E4700378B1543407D1F0E12A27CDEBFDAFE959526154340790261A75835DEBFFFB0A54753154340DB3521AD31E8DDBFD8F4A0A014154340051901158E20DEBF2272FA7ABE144340D593F947DFA4DEBFAF95D05D121543404568041BD7BFDEBFBA84436FF11443403D29931ADA00DFBF59C2DA183B154340D6C4025FD1ADDEBF4E4700378B15434001030000000100000005000000A393A5D6FB8DE6BF2EAA454431DD4240A1BB24CE8AA8E6BF696FF085C9DC42409A5FCD0182B9E6BF75AE282504DD4240207A522635B4E6BFCB9C2E8B89DD4240A393A5D6FB8DE6BF2EAA454431DD42400103000000010000000D000000E54350357AB5E7BFDB17D00B77E0424061A92EE06586E7BFB49080D1E5DF424044BE4BA94B46E7BF1BD5E940D6DF4240290989B48D3FE7BFA33D5E4887DF4240726F7EC34483E7BFEE5C18E945DF4240EB909BE1067CE7BF00C45DBD8ADE42402383DC4598A2E7BFD2E28C614EDE4240FB21365838C9E7BFE814E46723DF42400D6C956071B8E7BF85251E5036DF4240C9E53FA4DFBEE7BF62BB7B80EEDF424020EBA9D557D7E7BF31B2648EE5DF4240DC0DA2B5A2CDE7BF249BABE639E04240E54350357AB5E7BFDB17D00B77E04240010300000001000000060000002B8881AE7D81E7BF45DAC69FA8D44240F3E2C4573B8AE7BF5FB69DB646D442402446CF2D74A5E7BF7DEC2E5052D4424065ABCB2901B1E7BF76FA415DA4D44240E44C13B69F8CE7BFA2D11DC4CED442402B8881AE7D81E7BF45DAC69FA8D442400103000000010000000900000020B24813EF80E8BF20459DB987D84240CC7F48BF7D9DE8BF6B813D2652D8424088821953B0C6E8BFD449B6BA9CD84240D68BA19C68D7E8BFA29C685721D942406DFFCA4A93D2E8BF221807978ED942400E6B2A8BC2AEE8BFB22E6EA301DA42405C59A2B3CCA2E8BF9AEAC9FCA3D94240BE839F38807EE8BF04AF963B33D9424020B24813EF80E8BF20459DB987D8424001030000000100000007000000753BFBCA8374E9BF7E5182FE42D94240499D8026C286E9BFCBBBEA01F3D84240E0D572672698E9BF1CEDB8E177D94240363FFED2A2BEE9BF357C0BEBC6D9424086C77E164B91E9BFC382FB010FDA42408962F2069879E9BF342BDB87BCD94240753BFBCA8374E9BF7E5182FE42D9424001030000000100000007000000D6C6D8092F41F4BFB96DDFA3FEC6424023A0C211A452F4BFB4E4F1B4FCC642409483D9041856F4BFF1A1444B1EC74240F4DC42572250F4BF4ACFF41263C7424002124DA08845F4BFBE69FAEC80C7424008CBD8D0CD3EF4BF4E7CB5A338C74240D6C6D8092F41F4BFB96DDFA3FEC6424001030000000100000005000000D9243FE257ACF8BF44F8174163B44240BE2EC37FBAC1F8BF17F4DE1802B44240C26A2C616DCCF8BF6405BF0D31B44240C9224DBC03BCF8BFE597C11891B44240D9243FE257ACF8BF44F8174163B442400103000000010000000500000008043A93365503C0081C0934D8964140B1FB8EE1B15F03C09DA04D0E9F9641409FE3A3C5196303C0EA08E066F1964140BEA1F0D93A5803C06ADC9BDF3097414008043A93365503C0081C0934D896414001030000000100000005000000C4CDA964006803C0D7A205685B97414097E65608AB7103C07E6FD39FFD964140DE04DF347D7603C0AB798EC8779741402385B2F0F57503C0028063CF9E974140C4CDA964006803C0D7A205685B97414001030000000100000006000000E82D1EDE738003C095D233BDC4964140D923D40CA98203C00806103E94964140B459F5B9DA8A03C038DBDC989E9641405C57CC086F8F03C02DB1321AF9964140C11E1329CD8603C0865968E734974140E82D1EDE738003C095D233BDC496414001030000000100000006000000CAC51858C7F103C0BCE6559DD5AE45405CAAD216D7F803C068CD8FBFB4AE45404910AE8042FD03C087C267EBE0AE454007978E39CFF803C06B44300E2EAF4540DBC2F352B1F103C0289CDD5A26AF4540CAC51858C7F103C0BCE6559DD5AE454001030000000100000006000000A86F99D3657105C08A5A9A5B21B645406B4AB20E477705C0EC32FCA71BB6454092205C01857A05C0616F62484EB6454092205C01857A05C061342BDB87B6454019E25817B77105C08A01124DA0B64540A86F99D3657105C08A5A9A5B21B6454001030000000100000006000000AD16D863226507C05B7B9FAA42A54140EBAA402D066F07C0E09EE74F1BA54140DC2C5E2C0C7107C0626534F279A5414009DE9046056E07C0D5CBEF3499A541405BEF37DA716307C008E6E8F17BA54140AD16D863226507C05B7B9FAA42A5414001030000000100000016000000BDAC8905BEC207C09B3DD00A0CA541405DC30C8D27C207C052EDD3F198A54140FE463B6EF8BD07C0681F2BF86DA64140CEC7B5A162BC07C0A45016BEBEA64140F59F353FFEB207C0A48D23D6E2A7414022179CC1DFAF07C09EEC66463FA8414058A835CD3BAE07C09D2CB5DE6FA841405E0F26C5C7A707C09F5912A0A6A84140CF2EDFFAB09E07C027A3CA30EEA841409D47C5FF1D9107C01500E31934A841401024EF1CCA9007C0AAD72D0263A74140B3CEF8BEB87407C0529CA38E8EA54140880D164ED27C07C07A19C5724BA54140E04DB7EC107F07C043CBBA7F2CA4414006F52D73BA6C07C0D044D8F0F4A24140C1525DC0CB6C07C059147651F4A24140A60A4625758207C07DCF488446A24140726E13EE959907C03C6C223317A241402D41464085A307C0253B3602F1A24140A46C91B41BBD07C043E21E4B1FA44140AE7FD767CEBA07C063EC8497E0A44140BDAC8905BEC207C09B3DD00A0CA5414001030000000100000005000000D4B837BF614208C0F8A57EDE54F84140BA6B09F9A04708C0556B6116DAF741407155D977455008C087DBA16131F8414041D5E8D5004508C0AD4CF8A57EF84140D4B837BF614208C0F8A57EDE54F84140010300000001000000060000005B7B9FAA424308C0C30DF8FC30AC45409737876BB54708C050E27327D8AB45404C6F7F2E1A5208C0E7357689EAAB45409B02999D454F08C012A5BDC117AC45409DF7FF71C24408C0CEAACFD556AC45405B7B9FAA424308C0C30DF8FC30AC4540010300000001000000070000007D40A03369D30DC0F81A82E332BC4540E083D72E6DD80DC01B49827005BC45403D47E4BB94DA0DC01D76DF313CBC4540F373435376DA0DC0E9263108ACBC45404014CC9882D50DC03C69E1B20ABD45409ED32CD0EED00DC065FD6662BABC45407D40A03369D30DC0F81A82E332BC4540010300000001000000060000002C7DE882FA160FC0D0B87020249B4140DFC14F1C401F0FC047CCECF3189B4140309E4143FF240FC0CCEEC9C3429B414097E13FDD40210FC0C3F2E7DB829B414072A8DF85AD190FC01FF7ADD6899B41402C7DE882FA160FC0D0B87020249B41400103000000010000000600000044DD0720B53913C0BFF2203D45B84540637C98BD6C3B13C0C91CCBBBEAB74540698D4127843E13C04644317903B84540A1BAB9F8DB3E13C01C7C613255B84540CD069964E43C13C04E44BFB67EB8454044DD0720B53913C0BFF2203D45B84540010300000001000000170000004B94BDA59C5F15C0876F61DD78EF414044C362D4B56615C07E384888F2EF41404B92E7FA3E6C15C0E7FBA9F1D2EF41404FE5B4A7E47C15C061A7583508F1414072874D64E68215C07E8FFAEB15F4414082CAF8F7198715C077BF0AF0DDF441403411363CBD8215C02D93E1783EF541402F6EA301BC7515C069FF03AC55F54140A7B05241456515C09ECF807A33F44140520E6613605815C0D190F12895F24140999B6F44F74C15C0768A558330F34140DAC70A7E1B4215C06C7C26FBE7F14140F1F274AE283515C0971E4DF564F241400F98874CF93015C0AC5626FC52F34140274C18CDCA2615C0B8020AF5F4F34140C5C72764E71D15C0E140481630F3414013622EA9DA1E15C0DE8FDB2F9FF24140C158DFC0E42615C0A7052FFA0AF241405B5D4E09883915C0ADA1D45E44F14140B5C6A013424715C053CA6B2574F14140EFAB72A1F24F15C052B648DA8DF041409964E42CEC5915C06666666666F041404B94BDA59C5F15C0876F61DD78EF41400103000000010000000600000005323B8BDEA915C098BF42E6CAF44140FE80070610AE15C0D49AE61DA7F441408B355CE49EAE15C02FDFFAB0DEF441401A1A4F0471AE15C0315D88D51FF541406E4DBA2D91AB15C0889D29745EF5414005323B8BDEA915C098BF42E6CAF44140010300000001000000060000002F302B14E96E16C03B38D89B180042402AAA7EA5F37116C0A393A5D6FBFF4140C6C1A563CE7316C0DD4598A25C004240B0E3BF40107016C050DF32A7CB0042408FA850DD5C6C16C0CC07043A930042402F302B14E96E16C03B38D89B180042400103000000010000000500000010C99063EBB916C0868F882991C84540A1BFD02346BF16C072E0D57267C845405AB8ACC266C016C0876BB587BDC84540DD25715644BD16C0F6B6990AF1C8454010C99063EBB916C0868F882991C84540010300000001000000050000005E0EBBEF18BE16C0C7BDF90D13C74540C217265305C316C04AD235936FC64540D311C0CDE2C516C065A6B4FE96C645408E588B4F01C016C0003620425CC745405E0EBBEF18BE16C0C7BDF90D13C7454001030000000100000005000000DFA46950341F18C0BB5F05F86ECB454091291F82AA2118C0A1D634EF38CB454085CE6BEC122518C0ED116A8654CB45401A34F44F702118C010786000E1CB4540DFA46950341F18C0BB5F05F86ECB454001030000000100000006000000E6B2D1393F1519C0153AAFB14B4442409B012EC8961519C085B4C6A0134442403D64CA87A01A19C06684B70721444240CAFB389A231B19C04B57B08D78444240E0A0BDFA781819C0A661F88898444240E6B2D1393F1519C0153AAFB14B44424001030000000100000005000000C51B9947FE4019C024456458C5434240B760A92EE04519C083893F8A3A43424048F949B54F4719C0F4DE18028043424044A67C08AA4619C0D0F0660DDE434240C51B9947FE4019C024456458C543424001030000000100000005000000B4AA251DE5E019C0632827DA555E424019ADA3AA09E219C04F401361C35D42407E384888F2E519C0DB183BE1255E42405C04C6FA06E619C07D772B4B745E4240B4AA251DE5E019C0632827DA555E4240010300000001000000060000005454FD4AE7F31DC0AF94658863DD454006651A4D2EF61DC0D600A5A146DD4540C0CE4D9B71FA1DC060AC6F6072DD454065C746205EF71DC0D49D279EB3DD4540CCB8A981E6F31DC0E5D4CE30B5DD45405454FD4AE7F31DC0AF94658863DD45400103000000010000000700000036AD1402B9841EC045BC75FEEDE0454069AB92C83E881EC0684128EFE3E04540F4FA93F8DC891EC0246420CF2EE145405F61C1FD80871EC09B594B0169E14540323D618907841EC0E4BED53A71E1454017821C9430831EC0F8E3F6CB27E1454036AD1402B9841EC045BC75FEEDE045400103000000010000000600000005A568E55E501FC01E53776517DA454033FCA71B28501FC072BF4351A0D9454067B62BF4C1521FC0F88A6EBDA6D945404C546F0D6C551FC07D04FEF0F3D94540A85489B2B7541FC0622F14B01DDA454005A568E55E501FC01E53776517DA4540010300000001000000060000009DB81CAF40541FC088D9CBB6D3DA45406EFC89CA86551FC074D3669C86DA454000C79E3D97591FC0601DC70F95DA45409225732CEF5A1FC07A724D81CCDA454044A33B889D591FC0CA5356D3F5DA45409DB81CAF40541FC088D9CBB6D3DA4540010300000001000000060000008AAF7614E76821C01DCC26C0B0344540E9D32AFA436B21C04E62105839344540745DF8C1F96C21C043723271AB3445408AAC3594DA6B21C0E77283A10E354540051555BFD26921C07B6B60AB043545408AAF7614E76821C01DCC26C0B0344540010300000001000000090000005DC2A1B7789021C021037976F94E4540E77283A10E9321C0E38DCC237F4E4540BE30992A189521C086AB0320EE4E45404E0B5EF4159421C047AE9B525E4F454091EF52EA929121C054AD8559684F45404833164D678F21C0B2632310AF4F454006651A4D2E8E21C01E8997A7734F4540B18BA2073E8E21C01BBAD91F284F45405DC2A1B7789021C021037976F94E45400103000000010000000600000069AA27F38F9621C085B4C6A0134E4540F64201DBC19821C0AC71361D014E4540A81C93C5FD9721C015C5ABAC6D4E4540B91803EB389621C052F01472A54E45408BDD3EABCC9421C0ED0E2906484E454069AA27F38F9621C085B4C6A0134E454001030000000100000005000000AA2B9FE5799821C02101A3CB9B19454073D9E89C9F9A21C01CB3EC4960194540ED65DB696B9C21C0A4AB74779D1945406E6DE179A99821C076A565A4DE194540AA2B9FE5799821C02101A3CB9B1945400103000000010000000B0000009224085740A921C03D9B559FABAD4540618E1EBFB7A921C0FFEBDCB419AD45408315A75A0BAB21C0274BADF71BAD45404030478FDFAB21C03D9B559FABAD4540CDAB3AAB05AE21C03D9B559FABAD4540B858518369B021C0807EDFBF79AD4540D26F5F07CEB121C03D9B559FABAD4540EB724A404CB221C09B3924B550AE454084471B47ACAD21C092B245D26EAE45404C18CDCAF6A921C06CAF05BD37AE45409224085740A921C03D9B559FABAD454001030000000100000006000000350C1F1153AA21C0BD8FA339B23E4540E95F92CA14AB21C03909A52F843E45405516855D14AD21C0D0622992AF3E4540656EBE11DDAB21C037FDD98F143F454020ED7F80B5AA21C0B39943520B3F4540350C1F1153AA21C0BD8FA339B23E45400103000000010000000F000000973C9E961FB021C0CE1951DA1B3E45407AA9D898D7B121C0785F950B953D4540A27A6B60ABB421C0F1BC546CCC3D45408B34F10EF0B421C069368FC3603E45408159A148F7B321C0DD26DC2BF33E4540FBB2B45373B121C03CDD79E2393F454081E84999D4B021C0DB1324B6BB3F45401D041DAD6AB121C0CEA5B8AAEC3F45409FC9FE791AB021C016DD7A4D0F4045407520EBA9D5AF21C08DF161F6B23F454006137F1475AE21C0412B3064753F4540C00644882BAF21C033FAD170CA3E45400283A44FABB021C0CEFA9463B23E4540566133C005B121C0577A6D36563E4540973C9E961FB021C0CE1951DA1B3E454001030000000100000005000000336C94F59BB121C09F39EB538E3B45400438BD8BF7B321C0A33EC91D363B4540F5F23B4D66B421C08CA03193A83B4540B9162D40DBB221C076A565A4DE3B4540336C94F59BB121C09F39EB538E3B454001030000000100000005000000B13385CE6BB421C04B917C2590124540723788D68AB621C00B7F86376B12454098C3EE3B86B721C07E01BD70E712454014D044D8F0B421C04CC45BE7DF124540B13385CE6BB421C04B917C2590124540010300000001000000050000005B79C9FFE4B721C05952EE3EC73B45407BBFD18E1BB621C0EF39B01C213B4540E753C72AA5B721C00C1F1153223B45403F389F3A56B921C0815A0C1EA63B45405B79C9FFE4B721C05952EE3EC73B454001030000000100000015000000D74CBED9E6BE21C0F19D98F562484540D4D17135B2BB21C03E93FDF334484540904FC8CEDBB821C076DD5B91984845404D2EC6C03AB621C0F19D98F562484540C2A2224E27B921C0FC1C1F2DCE4645409370218FE0B621C09FAC18AE0E4645409C18929389BB21C019A9F7544E454540D6C743DFDDBA21C08C497F2F854345407A5567B5C0BE21C048BF7D1D3843454080457EFD10C321C0AB77B81D1A444540E4A08499B6BF21C0ABB019E082444540DD239BABE6C121C02A8F6E8445454540F6083543AAC021C09FAC18AE0E464540B24CBF44BCBD21C03E78EDD286474540B4E386DF4DBF21C06CEA3C2AFE474540D0436D1B46C121C0E4DBBB067D474540FAB836548CC321C0A911FA997A474540D6E6FF5547C621C028F1B913EC47454098158A743FC721C0EFA99CF6944845402C499EEBFBC021C0164D672783494540D74CBED9E6BE21C0F19D98F562484540010300000001000000050000006E861BF0F9B921C0808120408612454013656F29E7BB21C07D772B4B741245400CAD4ECE50BC21C04F029B73F012454036CD3B4ED1B921C081221631EC1245406E861BF0F9B921C0808120408612454001030000000100000014000000249A40118BC821C0CAFB389A2319454037C2A2224EC721C0D4B7CCE9B2184540736891ED7CC721C0E7C589AF761845406B11514CDEC821C083177D0569184540C78157CB9DC921C0A7C98CB795184540BD38F1D58ECA21C0EAB12D03CE184540D4B9A29410CC21C059F78F85E81845403CF71E2E39CE21C04CA7751BD418454068757286E2CE21C0965E9B8D95184540D49AE61DA7D021C0FC8BA03193184540F0A31AF67BD221C0C8B7770DFA184540C76471FF91D121C0C233A149621945409DD9AED007D321C02EAEF199EC1945408B16A06D35D321C01406651A4D1A45405018946934D121C0054D4BAC8C1A4540CC086F0F42D021C0CC608C48141A4540525F96766ACE21C0EA9106B7B5194540672AC423F1CA21C0E23FDD4081194540C78157CB9DC921C0F015DD7A4D194540249A40118BC821C0CAFB389A231945400103000000010000001D000000B2B8FFC874D021C0FA9CBB5D2F1B4540483140A209D421C067B5C01E131B4540512E8D5F78D521C0D026874F3A1B4540B48F15FC36D421C02D5DC136E21B45402387889B53D121C094F8DC09F61B454053D0ED258DD121C0615111A7931C4540451152B7B3CF21C06C3F19E3C31C454082C64CA25ED021C0F12DAC1BEF1C45403C855CA967D121C0FDBB3E73D61D4540632827DA55D021C08C82E0F1ED1D454017D7F84CF6CF21C0B8CD5488471E4540A4FFE55AB4D021C0F8A41309A61E4540469561DC0DD221C0DAE21A9FC91E45407DB3CD8DE9D121C0102384471B1F454050711C78B5D421C02F8672A25D1F454084D89942E7D521C09EB30584D61F45407383A10E2BD421C008CDAE7B2B20454074081C0934D021C056D4601A861F4540FF428F183DCF21C03788D68A361F45406D75392520CE21C082380F27301F4540BC57AD4CF8CD21C0876BB587BD1E4540596DFE5F75CC21C0514F1F813F1E45405D177E703ECD21C0C79E3D97A91D4540E7E104A6D3CA21C00A664CC11A1D4540AF25E4839ECD21C07BF7C77BD51C4540F1BDBF417BCD21C0C7116BF1291C454034BBEEAD48CC21C07C28D192C71B454058E2016553CE21C0BD6F7CED991B4540B2B8FFC874D021C0FA9CBB5D2F1B45400103000000010000000500000054FD4AE7C3CB21C0A4A65D4C3345454028F04E3E3DCE21C0B4AA251DE54445406EC328081ECF21C09A0986730D454540AEF4DA6CACCC21C01215AA9B8B45454054FD4AE7C3CB21C0A4A65D4C33454540010300000001000000050000007235B22B2DD321C0D32EA699EE4545404696CCB1BCD321C0DB317557764545409D2D20B41ED621C00A6AF816D64545404ED2FC31ADD521C06937FA980F4645407235B22B2DD321C0D32EA699EE45454001030000000100000013000000876F61DD78D721C08C9DF0129C324540DC679599D2DA21C0ED10FFB0A53145406B9BE27151DD21C05E0EBBEF18304540341477BCC9DF21C0C0D02346CF2D45403815A930B6E021C002F566D47C2D4540402FDCB930E221C0962023A0C22D45407505DB8827E321C08F368E588B2D45400150C58D5BE421C0E57D1CCD912D4540D175E107E7E321C0C0D02346CF2D45408D26176360E521C05B441493372E4540B6D8EDB3CAE421C097917A4FE52E4540B14E95EF19E121C044FB58C16F2F45405ABA826DC4E321C02B33A5F5B730454036B05582C5E121C08A56EE05663145406EF8DD74CBDE21C04BE5ED08A731454010CB660E49DD21C0A305685BCD32454043739D465ADA21C0CCD3B9A294324540807D74EACAD721C0889E94490D334540876F61DD78D721C08C9DF0129C324540010300000001000000070000008690F3FE3FDE21C09A0645F3002C454072C45A7C0AE021C0AB2006BAF62B4540EE4108C897E021C0315F5E807D2C45401EFE9AAC51DF21C0581B6327BC2C4540B404190115DE21C05BCEA5B8AA2C4540685C381092DD21C04A9869FB572C45408690F3FE3FDE21C09A0645F3002C45400103000000010000000600000020EEEA5564EC21C0EE056685226345409CDF30D120ED21C04D2CF015DD6245403D62F4DC42EF21C08BFF3BA2426345402FC1A90F24EF21C0A167B3EA736345403695456117ED21C0FBC9181F6663454020EEEA5564EC21C0EE05668522634540010300000001000000110000005890662C9A0622C0981936CAFA3D454024D236FE440522C022C7D633843D4540730F09DFFB0322C03753211E893D4540C190D5AD9E0322C035D07CCEDD3C4540EC1681B1BE0122C0B378B130443C454024D40CA9A20022C0D8D30E7F4D3C45406CEA3C2AFEFF21C007B7B585E73B4540153AAFB14B0422C00971E5EC9D3B45402B16BF29AC0422C0EBA9D557573B4540747B4963B40622C04F07B29E5A3B4540EF552B137E0922C0AB3DEC85023C454062A1D634EF0822C077D844662E3C4540DD28B2D6500A22C08046E9D2BF3C45408692C9A99D0922C07FA31D37FC3C45403CF9F4D8960922C08DF161F6B23D4540DFC2BAF1EE0822C02234828DEB3D45405890662C9A0622C0981936CAFA3D4540010300000001000000060000003D9D2B4A090122C02B6A300DC33F45400CCD751A690122C0425F7AFB733F45409581035ABA0222C03FE08101843F45408BE1EA00880322C0C4995FCD0140454023F77475C70222C0BDFF8F13264045403D9D2B4A090122C02B6A300DC33F454001030000000100000006000000DFBF7971E20322C04DC0AF91244245403813D385580522C00D1CD0D215424540338CBB41B40622C0FDFA2136584245405C04C6FA060622C0994BAAB69B4245407F32C687D90322C07044F7AC6B424540DFBF7971E20322C04DC0AF9124424540010300000001000000060000001898158A741722C05C1D007157414540FBAD9D28091922C0394206F2EC404540376DC669881A22C0BB7D56992941454071FF91E9D01922C0310BED9C66414540E92807B3091822C04DF6CFD3804145401898158A741722C05C1D00715741454001030000000100000005000000696FF085C95C22C055C03DCF9F704540CDCD37A27B5E22C0F6436CB070704540B29B19FD686022C069520ABABD7045401B4641F0F85E22C07E6FD39FFD704540696FF085C95C22C055C03DCF9F70454001030000000100000075000000299485AFAFED2AC044317903CC203D40AD50A4FB39ED2AC05FECBDF8A21D3D406F9C14E63DE62AC0BDA94885B1193D40404E98309AE52AC0E15E99B7EA163D40B130444E5FE72AC0E5284014CC143D40B6BC72BD6DEE2AC0B1170AD80E0E3D40DC2A8881AEED2AC0357C0BEBC60B3D4044BFB67EFAEF2AC0693524EEB1083D40F37519FED3ED2AC09692E52494063D40319A95ED43EE2AC0A2629CBF09053D4008E6E8F17BF32AC0377007EA94033D404DBED9E6C6F42AC0B14E95EF19013D401CB7989F1BFA2AC07B6B60AB04FF3C404DF6CFD380F92AC00E2C47C840FE3C40C636A968ACFD2AC0FA2B64AE0CFE3C40259529E620082BC0FAD005F52DFB3C40E4DBBB067D092BC0855D143DF0F93C40E7C75F5AD40F2BC0FD4FFEEE1DF93C4054FD4AE7C3132BC04568041BD7F73C4007B29E5A7D152BC080B8AB5791F53C404DDA54DD232B2BC07B698A00A7F33C40CF13CFD902322BC0D3A0681EC0F23C4042E90B21E7352BC067EF8CB62AF13C40066344A2D03A2BC0A96BED7DAAEE3C40E4BB94BA64442BC09D64ABCB29ED3C400F29064834492BC06956B60F79EB3C403CBD529621562BC020EBA9D557EB3C40F73E5585065A2BC0388600E0D8EB3C4090662C9ACE5E2BC0527FBDC282EB3C40F7EAE3A1EF662BC0DE8E705AF0EA3C40C651B9895A7A2BC04CC2853C82E73C40C85EEFFE787F2BC00A9DD7D825E23C40111AC1C6F57F2BC03A2174D025E03C40BAF42F4965822BC0E4A25A4414DF3C404548DDCEBE8A2BC0AC90F2936ADB3C40637D03931B8D2BC0BADBF5D214D93C40BC5AEECC04932BC0E17B7F83F6D63C40680586AC6E952BC0B4CA4C69FDD93C4049BC3C9D2B9A2BC09E961FB8CADB3C406823D74D299F2BC0185E49F25CDB3C409DF7FF71C2A42BC0DD442DCDADDC3C40A73E90BC73A82BC0C405A051BADC3C40F2E9B12D03AE2BC02995F0845EDB3C4063EC8497E0B42BC01E17D522A2DC3C40AA61BF27D6B92BC0601E32E543DC3C402ECA6C9049BE2BC08D2782380FDB3C406DE179A9D8C02BC045D5AF743EDC3C408522DDCF29C02BC0CB49287D21E03C40B69DB64604C32BC054FF209221E33C407C992842EABE2BC02FDFFAB0DEE43C4097546D37C1B72BC0DFFAB0DEA8E53C403E20D099B4B12BC0EF8D210038EA3C4062DBA2CC06A92BC0CE1ABCAFCAED3C4011346612F5AA2BC0CDB1BCAB1EF43C401172DEFFC7A92BC0D2A92B9FE5F53C406133C005D9AA2BC0E1CE85915EF83C40D15B3CBCE7A82BC01EA4A7C821FA3C408CD7BCAAB3AA2BC0BF805EB873FD3C40A835CD3B4EA92BC07B6B60AB04FF3C4063B9A5D590A82BC01492CCEA1D023D408597E0D407A22BC01CCEFC6A0E083D40739CDB847B9D2BC0DB8827BB99093D40569E40D829962BC06E313F37340D3D40637D03931B8D2BC07AA86DC328103D403B53E8BCC6862BC0EE05668522113D40691CEA7761832BC03F1A4E999B133D40BAF42F4965822BC09626A5A0DB133D402313F06B24812BC08A7780272D143D4057E9EE3A1B722BC0F7730AF2B3153D40B22D03CE526A2BC056BABBCE86143D40D47C957CEC662BC0A33F34F3E4163D4001A43671725F2BC03FABCC94D6173D4090662C9ACE5E2BC0ADA415DF50183D400B43E4F4F55C2BC0BDA94885B1193D401E705D31235C2BC0672C9ACE4E1A3D4059315C1D00512BC09C4EB2D5E51C3D4083F8C08EFF522BC032C85D84291E3D40DD239BABE6512BC046EF54C03D1F3D40CB845FEAE74D2BC079EBFCDB651F3D4059C2DA183B492BC0D13B1570CF1F3D40EACC3D247C472BC0B29C84D2171E3D401500E31934442BC08BE07F2BD91D3D408ACA8635953D2BC027C11BD2A8203D406803B001113A2BC096CB46E7FC203D401E4FCB0F5C352BC027D87F9D9B223D40AA44D95BCA312BC0AA0D4E44BF223D40B64B1B0E4B2B2BC06F4562821A223D400B28D4D347202BC00C056C07231E3D40F4DF83D72E1D2BC0301004C8D01D3D4058E6ADBA0E152BC0E3C4573B8A1F3D409510ACAA970F2BC0DAC534D3BD223D401A31B3CF630C2BC028F4FA93F8243D407D923B6C220B2BC030293E3E212B3D40A7C98CB795062BC0DDEEE53E392E3D4023DA8EA9BB022BC0C66AF3FFAA333D40C971A774B0FE2AC04DBC033C69353D40815F234910FE2AC0D87DC7F0D8373D4056BB26A435F62AC0DA70581AF8393D402F88484DBBF02AC0EF3A1BF2CF3C3D40EACBD24ECDED2AC009DE9046053A3D408274B169A5E82AC012F758FAD0393D4094A3005130E32AC0925D6919A9373D40361E6CB1DBDF2AC08ACBF10A44373D403239B5334CDD2AC0BE4BA94BC6353D4045BB0A293FD92AC09D9E776341353D40A83462669FD72AC0DA0242EBE1333D404F081D7409D72AC050340F6091333D405517F032C3D62AC00B444FCAA4323D40A83462669FD72AC06F7F2E1A32323D40A83462669FD72AC02BDF3312A1313D40A83462669FD72AC076340EF5BB303D40A83462669FD72AC02882380F27303D40C976BE9F1AD72AC0EBE40CC51D2F3D40A83462669FD72AC01B9FC9FE792E3D402D24607479DB2AC0863AAC70CB273D407EE02A4F20E42AC0DFFAB0DEA8253D40299485AFAFED2AC044317903CC203D40010300000001000000320000005C3E92921EFE2AC0C7293A92CB473D40CD751A69A9FC2AC063D34A2190473D40D190F12895F82AC0033FAA61BF473D4058FFE7305FF62AC058C85C1954473D40747E8AE3C0F32AC0C32ADEC83C463D40F19E03CB11F22AC0A8E507AEF2443D407156444DF4F12AC0791EDC9DB5433D4099D53BDC0EF52AC064963D096C423D40D68F4DF223F62AC05019FF3EE3423D40B1FB8EE1B1F72AC0AD4CF8A57E423D407C7E18213CFA2AC066BCADF4DA403D409981CAF8F7F92AC096CFF23CB83F3D40541EDD088BFA2AC0E09F5225CA3E3D4046240A2DEBFE2AC05DA79196CA3B3D405E66D828EBFF2AC025CADE52CE3B3D4051C1E10511012BC07F69519FE43A3D40D2E3F736FD012BC0BB9BA73AE43A3D40D6FCF84B8B022BC0293DD34B8C393D40B2D47ABFD1062BC066DCD440F3393D40226E4E2503082BC0EB7420EBA9393D40600322C4950B2BC04BE48233F8373D4088484DBB980E2BC04F78094E7D383D406FBA6587F80F2BC0EA5BE67459383D40EFFE78AF5A112BC03A0664AF77373D401E8CD82780122BC09FE8BAF083373D403FADA23F34132BC06F9BA9108F383D406C7A50508A162BC0774CDD955D383D405BED612F14182BC034D6FECEF6383D40F92F1004C8182BC0F10D85CFD6393D407E6E68CA4E172BC0F7AE415F7A3B3D40D2C77C40A0132BC0DD96C805673C3D4012DC48D922112BC05E64027E8D3C3D40266DAAEE910D2BC0F1F5B52E353E3D40459C4EB2D50D2BC098DEFE5C34403D40795DBF60370C2BC03C873254C5403D40E4D70FB1C10A2BC020EF552B13423D403B511212690B2BC08E791D71C8423D403BA8C4758C0B2BC0077AA86DC3443D4060764F1E160A2BC0A376BF0AF0453D407381CB63CD082BC0DE73603942463D40252191B6F1072BC05C1D007157473D40F6CE68AB92082BC0B1A206D330483D406153E751F1072BC0938C9C853D493D40BD361B2B31072BC0236AA2CF47493D4095B88E71C5052BC065389ECF804A3D408E90813CBB042BC0C3F5285C8F4A3D400CEA5BE674012BC05801BEDBBC493D40ABAE433525012BC0EAEA8EC536493D4017450F7C0CFE2AC0A3CC069964483D405C3E92921EFE2AC0C7293A92CB473D40010300000001000000160000003D2AFEEF88022BC06F8445459C6A3D400971E5EC9D012BC040A54A94BD693D40406CE9D154FF2AC0D8497D59DA693D408EB27E3331FD2AC0FEB7921D1B693D40FD32182312FD2AC0D21C59F965683D40C426327381FB2AC088855AD3BC673D40677C5F5CAAFA2AC07DCA3159DC673D40C68B852172FA2AC0D74CBED9E6663D4073F22213F0FB2AC0431CEBE236663D405D514A0856FD2AC07995B54DF1643D40567E198C11012BC0DF3312A111643D4055DB4DF04D032BC0BD55D7A19A623D40A721AAF067082BC09D6516A1D8623D40921FF12BD6082BC0240F441669623D4052D66F26A60B2BC027F73B1405623D4059A48977800F2BC0C9C859D8D3623D40D44334BA83102BC0D235936FB6653D405320B3B3E80D2BC07EA8346266673D404165FCFB8C0B2BC0CE4F711C78693D40D5963AC8EB092BC0DF701FB935693D40153C855CA9072BC05D8940F50F6A3D403D2AFEEF88022BC06F8445459C6A3D400103000000010000000D000000D6E429ABE9122BC001BEDBBC714E3D40CD785BE9B5112BC03465A71FD44D3D403F027FF8F90F2BC097E4805D4D4E3D40DCB75A272E0F2BC0077DE9EDCF4D3D401EC4CE143A0F2BC01D925A28994C3D4029E8F692C6102BC0CF143AAFB14B3D406092CA1473102BC0AAB69BE09B4A3D40E3A6069ACF112BC0427A8A1C224A3D400BCF4BC5C6142BC01BD47E6B274A3D4094A3005130132BC094FAB2B4534B3D4031EBC5504E142BC020B41EBE4C4C3D40B95164ADA1142BC057B1F84D614D3D40D6E429ABE9122BC001BEDBBC714E3D400103000000010000001200000076E272BC02A12BC0912C6002B7BE3C40E5D18DB0A8A02BC0C8409E5DBEBD3C4077DA1A118CA32BC0FB928D075BBC3C408ECA4DD4D2A42BC03FE3C28190BC3C40F58079C894A72BC042AF3F89CFBD3C4088D51F6118A82BC05E4A5D328EBD3C40683EE76ED7AB2BC0B858518369C03C4096253ACB2CAA2BC09B559FABADC03C402579AEEFC3A92BC0B1FCF9B660C13C40DB519CA38EA62BC015AA9B8BBFC13C40AEF02E17F1A52BC05C8E57207AC23C40D0B8702024A32BC01D1D5723BBC23C40738236397CA22BC0D32F116F9DC33C4028486C770FA02BC0033FAA61BFC33C402B357BA015A02BC0FA7DFFE6C5C13C406823D74D299F2BC0D3A414747BC13C40FA2AF9D85DA02BC093E4B9BE0FBF3C4076E272BC02A12BC0912C6002B7BE3C400103000000010000008D000000CD7344BE4BC12BC0EDD45C6E30C03C4071546EA296BE2BC04A46CEC29EBE3C40E6E61BD13DBB2BC09294F430B4BE3C40629E95B4E2BB2BC0F52C08E57DBC3C4090BFB4A84FBA2BC03DD68C0C72BB3C408CDAFD2AC0AF2BC073840CE4D9B93C40CA17B49080A92BC040A0336953B13C40CF87670932AA2BC0075E2D7766AE3C409B046F48A3AA2BC049D8B79388AC3C404FAC53E57BA62BC0BFEFDFBC389D3C409B02999D45A72BC0C4D155BABB9A3C40F3AACE6A81A52BC0EA92718C64973C40E5284014CCA82BC018B5FB5580933C40FDDD3B6A4CA82BC08672A25D85903C4027A3CA30EEA62BC0ED612F14B08D3C40700A2B1554AC2BC08B5242B0AA8A3C4082AB3C81B0AB2BC04C33DDEBA4863C407555A01683AF2BC017821C9430833C4000E31934F4AF2BC0AE7E6C921F813C40AA2C0ABB28B22BC0CDB1BCAB1E803C406EBF7CB262B82BC0FAB31F29227F3C403DB7D09508BC2BC0286211C30E7B3C40BE4EEACBD2B62BC062821ABE85753C4063D520CCEDB62BC0FB761211FE713C40789ACC785BB92BC0CBF78C4468703C4078D4981073B92BC027C0B0FCF96E3C40193A765089B32BC0D05FE811A36B3C40D653ABAFAEB22BC00F0C207C28693C40B69E211CB3B42BC081E84999D4643C40C1E09A3BFAB72BC0C2C1DEC490643C408D5F7825C9BB2BC04293C492725F3C409833DB15FAC02BC0B265F9BA0C5B3C40EBFEB1101DC22BC085436FF1F0563C4097749483D9C42BC0A724EB7074553C40BAA46ABB09C62BC0BAF770C971533C4046787B1002CA2BC05281936DE0523C40639813B4C9C92BC0D8D2A3A99E503C40033E3F8C10CE2BC03813D385584D3C404C530438BDCB2BC01077F52A324A3C40E5D3635B06CC2BC0315F5E807D483C40952C27A1F4CD2BC0AA99B51490463C40C138B874CCD12BC00589EDEE01463C4048533D997FD42BC0A12B11A8FE413C4076C075C58CD82BC055F833BC593F3C4010406A1327DF2BC09AEFE0270E3C3C404F948444DAE62BC0CAA65CE15D3A3C404CC5C6BC8EF82BC05839B4C8763A3C40299485AFAFFD2BC03CDBA337DC373C4059DDEA39E9052CC02844C02154353C406BBB09BE690A2CC0533D997FF4353C40C8D11C59F9152CC03D433866D9333C401AF8510DFB252CC0ECFA05BB61333C40333674B33F302CC01747E5266A313C40E2395B4068352CC00053060E68313C40D4D4B2B5BE382CC0EECD6F9868303C402CBB6070CD3D2CC0A515DF50F8303C40F2B1BB4049412CC03A950C0055303C409DB98784EF4D2CC007B5DFDA892E3C400B26FE28EA542CC07381CB63CD2C3C40E8D9ACFA5C652CC055DE8E705A2C3C40E7C41EDAC76A2CC031074147AB2A3C404225AE635C712CC0C09657AEB7293C40C710001C7B762CC0A72215C616263C402481069B3A7F2CC038F4160FEF213C40F52C08E57D8C2CC0B939950C00193C40043C69E1B29A2CC07B832F4CA6123C405B087250C2A42CC066BCADF4DA0C3C40143DF03158A92CC0CE55F31C910B3C404F5DF92CCFBB2CC079B0C56E9F0D3C40567F8461C0C22CC087A3AB74770D3C40ACC612D6C6D02CC0D6E429ABE90E3C40AC90F2936AE72CC05D876A4AB2123C4028D192C7D3F22CC03EEC8502B6133C40505260014C012DC0093543AA28123C406138D73043032DC0BF27D6A9F2113C40505260014C012DC0682101A3CB133C409E996038D7002DC04E62105839143C4056116E32AAFC2CC025B37A87DB153C40116F9D7FBBFC2CC02A8C2D0439183C40CC7B9C69C2FE2CC042CC2555DB193C4005A73E90BCFB2CC019E8DA17D01B3C4056BB26A435F62CC03E0801F9121A3C40637B2DE8BDE92CC0677C5F5CAA1A3C408A8EE4F21FE22CC084F57F0EF3193C4090D78349F1D92CC0A5A2B1F6771A3C4012DA722EC5BD2CC0FC6F253B361E3C40EB1ED95C359F2CC06CEBA7FFAC253C4035D1E7A38C982CC08274B169A5283C4094BE1072DE7F2CC0C84274081C313C407B6649809A722CC0F73AA92F4B373C40FD4B5299626E2CC0DF32A7CB623A3C40D89C8367426B2CC0A7052FFA0A423C405B25581CCE6C2CC06B2C616D8C493C40D6FCF84B8B6A2CC03E5C72DC294D3C4001BEDBBC716A2CC0D3156C239E503C40F1F3DF83D7662CC04AD1CABDC0543C405D16139B8F5B2CC060066344A2583C4078B6476FB8572CC03B376DC6695C3C40CBF27519FE532CC082751C3F545E3C40E44BA8E0F0522CC06A15FDA199633C409F20B1DD3D502CC0A648BE1248653C4026C5C727644F2CC08CF7E3F6CB673C40374F75C8CD502CC0A4FD0FB056693C4052EFA99CF64C2CC0C154336B296C3C409CDF30D1204D2CC023A298BC016E3C407026A60BB14A2CC0378B170B43703C402CBB6070CD3D2CC0556B6116DA753C400A815CE2C8332CC0E17F2BD9B1793C4020B58993FB2D2CC0DD787764AC7E3C40DAE1AFC91A2D2CC0478D093197803C4047E9D2BF24252CC0E063B0E254873C40938B31B08E232CC0B43EE5982C8A3C40A3CA30EE06212CC05ABC5818228B3C40836BEEE87F212CC0BF29AC54508D3C40DEE7F868711E2CC0EFC7ED974F8E3C401F4AB4E4F11C2CC0B18A37328F903C403883BF5FCC162CC090696D1ADB933C40C899266C3F112CC09CE1067C7E983C40FFE9060ABC132CC0BFEFDFBC389D3C40E6E786A6EC042CC06BD784B4C6AC3C40E73A8DB454062CC0075E2D7766AE3C40BA490C022B072CC0E2E82ADD5DAF3C40D28F8653E6062CC0921FF12BD6B03C404277499C15092CC0162F1686C8B13C403E59315C1D082CC093C7D3F203B73C40CFBF5DF6EB062CC0D5E940D653B73C406ABDDF68C7052CC0548D5E0D50B63C40679E5C5320032CC046CF2D7425B63C40B421FFCC20FE2BC043209738F2B83C40CE1C925A28F92BC040A54A94BDB93C40EC134031B2F42BC03F541A31B3BB3C40A0A86C5853F12BC0AC5626FC52BB3C40FE60E0B9F7E82BC0CCD3B9A294BC3C404F948444DAE62BC065A9F57EA3BD3C405F7B664980E22BC0111E6D1CB1BE3C40D2510E6613E02BC0349F73B7EBBD3C40B22D03CE52DA2BC0A94F72874DC03C40790778D2C2D52BC015376E313FBF3C409DD843FB58D12BC0392A37514BBF3C40FF03AC55BBC62BC0F6EE8FF7AAC13C40CD7344BE4BC12BC0EDD45C6E30C03C400103000000010000008400000027A1F48590DB2EC0B87361A417213C40E7C589AF76D42EC0CC7C073F711C3C40978BF84ECCD22EC01F9F909DB7193C40003961C268D62EC04568041BD70F3C407C7F83F6EAD32EC0A2EC2DE57C0D3C4012876C205DD42EC075779D0DF90B3C400D384BC972CA2EC093C3279D48083C40F46C567DAEC62EC0F96871C630073C40399A232BBFC42EC0A0DFF76F5E043C40410C74ED0BC02EC0096F0F4240023C4095F3C5DE8BBF2EC0938B31B08EFF3B4083A7902BF5BC2EC056478E7406FE3B40CE1C925A28C12EC02B8716D9CEFB3B400F98874CF9C02EC0BC0512143FFA3B406B2BF697DDC32EC08B6EBDA607F93B407B1002F225C42EC0E3FE23D3A1F73B40DDB419A721C22EC073D9E89C9FF63B40116E32AA0CC32EC0145AD6FD63F53B40C76471FF91C12EC0DE054A0A2CF43B4029232E008DC22EC02AADBF2500F33B403526C45C52BD2EC09E0B23BDA8F13B405FB87361A4B72EC0E35295B6B8EE3B406C94F59B89B92EC06346787B10EE3B4084656CE866BF2EC01409A69A59EF3B4073B8567BD8C32EC02B1213D4F0ED3B40F84F3750E0C52EC05053CBD6FAE63B40EA4141295AC92EC03997E2AAB2E33B407233DC80CFC72EC07AFB73D190E13B404CDF6B088EC32EC05A4B0169FFDF3B40A6B5696CAFC52EC09869FB5756DE3B40A968ACFD9DC52EC00C923EADA2DB3B40F5A276BF0AC82EC02331410DDFDA3B409C525E2BA1CB2EC059A65F22DEDA3B402FC1A90F24CF2EC0ED9DD15625D93B40DE921CB0ABD12EC0D6355A0EF4D83B4081CD397826D42EC0FA2AF9D85DD83B40FA25E2ADF3D72EC0DB334B02D4D43B4034A0DE8C9AD72EC02B6D718DCFD03B40809C306134DB2EC09CC58B8521CE3B40FF2268CC24E22EC0F7C77BD5CACC3B40562DE92807FB2EC09A780778D2CA3B40B894F3C5DE032FC02F50526001C83B40F984ECBC8D052FC05FCE6C57E8C73B40D50627A25F0B2FC056F146E691C73B40C4CE143AAF112FC0CEFFAB8E1CC53B40740987DEE2192FC0BB97FBE428C43B40588CBAD6DE1F2FC073F6CE68ABC23B401990BDDEFD212FC0263ACB2C42C13B40DA54DD239B232FC00C3CF71E2EBD3B40A1698995D1282FC0C4EA8F300CBC3B4096E7C1DD59332FC04205871744BC3B4014D044D8F03C2FC08F19A88C7FBF3B4032B08EE387422FC0D28F8653E6BE3B4030DAE38574502FC0E9EFA5F0A0C13B40EAAEEC82C1552FC09E40D82956C13B4027A435069D582FC0E59997C3EEBF3B40B51B7DCC075C2FC0834E081D74C13B40EE77280AF4612FC03602F1BA7EC53B40533D997FF4652FC02C47C8409EC53B40E09EE74F1B6D2FC01DE90C8CBCC83B40F5BBB0355B712FC05D177E703EC93B40AAF413CE6E752FC006BD378600CC3B409E9ACB0D867A2FC043723271ABCC3B40E371512D22822FC07973B8567BD03B4047AE9B525E8B2FC018213CDA38D23B40D0807A336A8E2FC0A3586E6935D43B40527FBDC282932FC02655DB4DF0D53B405C751DAA29992FC0DE57E542E5DB3B402F89B3226AA22FC0E76ED74B53E43B40B14F00C5C8AA2FC0F51263997EE93B401424B6BB07A82FC0E0675C3810F23B408CBFED0912AB2FC08D0B0742B2F83B409B8D959867A52FC0E7374C3448FD3B40C2FA3F87F9A22FC073F56393FC003C4064213A048EA42FC00F289B7285033C40C5FEB27BF2A02FC08CD8278062043C401C7920B2489B2FC0147B681F2B043C407506465ED6942FC0D2FD9C82FC043C40DA1A118C838B2FC06286C61341083C40145E82531F882FC034A0DE8C9A0B3C40560DC2DCEE7D2FC0FD153257060D3C40E6B0FB8EE1792FC000A8E2C62D0E3C408313D1AFAD772FC0EA211ADD41103C40CDAD105663712FC0999EB0C403123C40FAB31F29226B2FC05723BBD232163C40A9A0A2EA576A2FC03F6F2A5261183C40E42F2DEA936C2FC00AA2EE03901A3C40DDE9CE13CF692FC0DB87BCE5EA1B3C40CE6E2D93E1682FC0D23AAA9A201E3C4004029D499B6A2FC006854199461F3C40C2FC153257662FC0C5758C2B2E223C407DE71725E8672FC0A4E2FF8EA8243C40BEBC00FBE8642FC08CBAD6DEA7263C40CAC51858C7692FC0251FBB0B94283C40AB75E272BC6A2FC02ECA6C90492A3C405AF0A2AF20652FC02EFF21FDF6293C4059518369185E2FC07F677BF4862B3C40F7915B936E5B2FC04301DBC188293C40E57D1CCD91552FC0EE5EEE93A3283C4047C8409E5D4E2FC04A5E9D63402A3C40433A3C84F14B2FC052499D80262A3C40BF0AF0DDE6452FC019AE0E80B82B3C4037A79201A0422FC0EE409DF2E82A3C4022E3512AE1392FC05C902DCBD7253C4038A0A52BD8362FC0628731E9EF253C40BE2F2E5569332FC0A017EE5C18253C40605B3FFD672D2FC0406B7EFCA5253C4070EF1AF4A5272FC0921FF12BD6243C40063065E0801E2FC0221807978E253C40B0AD9FFEB3162FC072A8DF85AD253C40C4CE143AAF112FC00C3D62F4DC263C40B0726891ED0C2FC03719558671273C404E603AADDB082FC0EC504D49D6253C40F984ECBC8D052FC04E29AF95D0253C40CC9BC3B5DAFB2EC0AFB5F7A92A243C40CDB1BCAB1EF82EC027D87F9D9B223C407061DD7877F42EC07A3881E9B4223C40FBC9181F66EF2EC08B36C7B94D203C4010786000E1E32EC00E85CFD6C1213C400BF148BC3CDD2EC0917BBABA63253C40D4D7F335CBDD2EC0E8C072840C283C407D224F92AEE12EC0158DB5BFB3293C4037894160E5E02EC0D0B87020242B3C407BDD2230D6D72EC0EA961DE21F2E3C40454B1E4FCBCF2EC055DCB8C5FC2C3C407D957CEC2ED02EC00E30F31DFC283C40768C2B2E8ED22EC07BA01518B2263C40336E6AA0F9D42EC022C66B5ED5253C405019FF3EE3DA2EC0E012807F4A253C402D077AA86DDB2EC0289CDD5A26233C40B2B96A9E23DA2EC099B9C0E5B1223C4027A1F48590DB2EC0B87361A417213C40010300000001000000B4000000C616821C942030C0240A2DEBFE913C4035B39602D21E30C085D1AC6C1F8E3C4083BF5FCC962030C0138255F5F28B3C400E6ABFB5132130C0357D76C075893C4059501894692030C0BAC0E5B166883C40E76D6C76A42230C0C2FBAA5CA8883C40B94F8E02442530C091EF52EA92853C40E6EB32FCA72730C09180D1E5CD853C40D5CE30B5A52A30C0F0A2AF20CD843C40EE3D5C72DC2D30C0A69BC420B0823C40A1F2AFE5952F30C0A14D0E9F74823C40971E4DF5643230C027F8A6E9B37F3C401938A0A52B3C30C04C512E8D5F7C3C4020ED7F80B53E30C0A14ACD1E68793C4006F4C29D0B3F30C0B169A510C8753C4014EAE923F03F30C02E03CE52B2743C40DEFFC709134230C0ECBE6378EC733C40BABE0F07094530C040170D198F723C40F2EA1C03B24730C05439ED29396F3C4044E048A0C14E30C0F261F6B2ED683C4055DFF945095230C032005471E3663C40EA93DC61135530C0DFE00B93A9663C40F78E1A13625630C0D7DCD1FF72653C40B742588D255C30C0DB6D179AEB603C4004E5B67D8F5E30C0B1F84D61A55A3C4080492A53CC5D30C0AD6EF59CF4563C402FFCE07CEA5C30C0E412471E88543C40680932022A5C30C01EC3633F8B513C40793E03EACD5C30C071732A19004E3C40FF2268CC246230C0E54526E0D7483C40043A9336556330C03F373465A7433C409548A297516830C0753DD175E13B3C40BC5B59A2B36830C0BF47FDF50A3B3C40CA880B40A36830C0F609A018593A3C40EDEF6C8FDE6830C0292504ABEA393C4093718C648F6C30C06F9BA9108F343C40D7D9907F666C30C0B5C5353E93313C4061FD9FC37C6D30C077D844662E303C40BD3AC780EC6D30C07E350708E62C3C40B7D100DE026D30C07A5567B5C02A3C403480B740826E30C0FB1F60ADDA293C40EF1CCA50156F30C00EF8FC3042283C402D5F97E13F6D30C06B28B517D1263C401FF818AC386D30C0AB5AD2510E263C404852D2C3D06E30C09CE1067C7E243C408AE42B81947030C016F9F5436C243C408C153598867130C0C24CDBBFB2223C40BE4EEACBD27230C0B682A62556223C4058E542E55F7330C0C45C52B5DD203C40C7F319506F7630C0F7764B72C01E3C40BA85AE44A07630C0A8E507AEF21C3C4043554CA59F7830C0179D2CB5DE1B3C404243FF04177B30C0FCE25295B6183C401DE736E15E7D30C020B8CA1308173C40A796ADF5457E30C04F04711E4E143C40570A815CE28030C00803CFBD87133C40F451465C008230C0083E062B4E113C40A7CD380D518530C009C4EBFA050F3C40991249F4328630C0790261A7580D3C4029CDE671188830C02A5778978B0C3C409BAC510FD18830C0D0D556EC2F0B3C406808C72C7B8A30C04BE82E89B30A3C4006F69848698A30C047ACC5A700083C40F4FBFECD8B8B30C089EAAD81AD063C40971DE21FB68C30C03622180797063C40137F1475E68E30C05C1B2AC6F9073C40E3344415FE9830C04C55DAE21A073C4051BEA08504A030C021CA17B490043C40D6FECEF6E8A130C0B77BB94F8E023C40FD4E93196FA330C0DFF8DA334B023C40D5EAABAB02A530C0520C906802013C401E6FF25B74A630C0B98E71C5C5013C4091BA9D7DE5A930C0CF6A813D26023C40B0045262D7AA30C00C022B8716013C406666666666AE30C081ECF5EE8FFF3B404485EAE6E2B330C01DE736E15E013C40CA8D226B0DB530C04C50C3B7B0023C40BBD6DEA7AAB430C040DB6AD619073C406211C30E63B630C04E97C5C4E60B3C40AA2B9FE579BC30C0AD889AE8F30D3C40C974E8F4BCBB30C04F029B73F0103C40D66F26A60BBD30C08E91EC116A163C40F0FCA204FDC130C012143FC6DC193C4050C763062AC330C0B3B3E89D0A1C3C407AA9D898D7C530C02D25CB49281D3C404208C89750CD30C05C55F65D11283C40325706D506CF30C01FF30181CE2C3C4019FF3EE3C2D130C0029A081B9E2E3C40A663CE33F6D530C085EB51B81E353C40CC46E7FC14D730C0F9484A7A183A3C401827BEDA51D830C0533F6F2A523D3C40C22FF5F3A6D630C05B28999CDA413C407041B62C5FD730C04E0D349F73433C40A2EC2DE57CD930C0B5FCC0559E443C405470784144DA30C0220038F6EC453C40B98D06F016DC30C0221B48179B463C40374F75C8CDDC30C054724EECA1493C40E4DC26DC2BDF30C0F8FC3042784C3C406E313F3734E130C098141F9F904D3C4015AA9B8BBFE130C0E97FB9162D503C40543A58FFE7E430C065726A6798523C40919DB7B1D9E530C060394206F2543C40388600E0D8E730C0ACE4637781563C402158552FBFEB30C0D0251C7A8B573C40BCCADAA678EC30C043C5387F135A3C40768C2B2E8EEA30C0FBE93F6B7E5C3C404EF04DD367E730C082ACA7565F5D3C4015E63DCE34E530C07BD976DA1A5D3C408D9AAF928FE130C0897D0228465E3C40B2F677B647DF30C0C43E0114235F3C409FC893A46BDE30C044334FAE29603C409CE1067C7EDC30C05376FA415D603C40397B67B455D930C053978C6324633C40681F2BF86DD430C0A3E9EC6470643C40BE1248895DCF30C04D672783A3603C402FA704C424CC30C0800C1D3BA8603C406A34B91803CB30C07022FAB5F55F3C40098B8A389DC430C0C1ADBB79AA5F3C403A1E335019C330C040C1C58A1A603C40E9D66B7A50C030C0A7255646235F3C40D9791B9B1DBD30C0E509849D62613C40F0FD0DDAABBB30C0B954A52DAE613C40060E68E90ABA30C0572250FD83603C40FA5FAE450BB830C04E25034015633C40E25AED612FB430C02975C93846623C4032C85D8429B230C0FDF7E0B54B633C404562821ABEB130C030D80DDB16653C40698B6B7C26AF30C001DC2C5E2C643C400D52F01472AD30C024F1F274AE643C400934D8D479AC30C03E75AC527A663C4061FF756EDAA830C0B073D3669C663C40D7A3703D0AA730C00F63D2DF4B653C409A0AF148BCA430C0A646E867EA653C40E738B709F7A230C051C1E10511653C40105B7A34D59F30C072FA7ABE66653C40410B09185D9A30C0FB73D190F1643C40B7B41A12F79830C05512D90759663C404489963C9E9630C0E78C28ED0D663C40ED66463F1A9230C0AF05BD3786683C40C460FE0A998F30C091D26C1E87693C408066101FD88D30C064B14D2A1A6B3C406D01A1F5F08530C042CF66D5E76A3C409032E202D08030C0F2272A1BD66C3C40618A7269FC7E30C01C9947FE60703C40795BE9B5D97C30C0AB2688BA0F703C406B2C616D8C7930C00A82C7B777713C406E50FBAD9D7830C064E60297C7723C403A24B550327930C0C2137AFD49743C409C6A2DCC427730C0E7C8CA2F83753C40695721E5277530C0E2E7BF07AF753C40BBB9F8DB9E7430C073F4F8BD4D773C4045BDE0D39C7430C03447567E19783C40ACE63922DF7130C040C23060C9793C40BF9D44847F7130C090BDDEFDF17A3C402F151BF33A6E30C0A8716F7EC37C3C409E3F6D54A76B30C0D3BEB9BF7A843C40641F6459306930C057957D5704873C403F0114234B6230C04A0856D5CB8B3C40F3E49A02995D30C0514A0856D58B3C409818CBF44B5830C091442FA3588E3C4019390B7BDA5530C062BF27D6A98E3C40410FB56D185530C08A1F63EE5A923C402810768A555330C0DE3AFF76D9933C40D88349F1F15130C05454FD4AE7933C4076FA415DA45030C0EFE4D3635B923C40B056ED9A904E30C02A1C412AC5923C40C6F99B50884C30C025B37A87DB913C4085EE92382B4A30C05E82531F48923C40D2E0B6B6F04830C065E42CEC69933C4054707841444630C0BE839F3880923C4048C5FF1D514530C0B03C484F91933C40DEFFC709134230C09A40118B18923C40093543AA283E30C05453927538923C404512BD8C623930C0F7E461A1D6903C4074620FED633130C03C122F4FE7923C40A9BEF38B122C30C0516859F78F953C4002F22554702830C0CA1AF5108D963C404354E1CFF02230C0E36E10AD15953C405E82531F482230C0923B6C2233933C40C616821C942030C0240A2DEBFE913C4001030000000100000006000000CEC7B5A1622830C091D10149D8973C40575C1C959B2830C0E71BD13DEB963C4026A77686A92930C0BA4E232D95973C4072C0AE264F2930C0787AA52C43983C40168A743FA72830C0B7F0BC546C983C40CEC7B5A1622830C091D10149D8973C40010300000001000000050000005586713788C230C0D927806264613C407B14AE47E1C230C00CCA349A5C603C40D192C7D3F2C330C03AB01C2103613C401AFB928D07C330C04C18CDCAF6613C405586713788C230C0D927806264613C40010300000001000000440000007EFD101B2C4031C09D499BAA7B343C405AD6FD63213E31C0A4198BA6B3333C40399CF9D51C3C31C0D1402C9B39343C40F9DC09F65F3B31C059DE550F98333C4093A7ACA6EB3531C0F4FBFECD8B333C40537B116DC73431C0E335AFEAAC323C4055F833BC593331C0419AB1683A333C40EA961DE21F3231C042B28009DC323C40EAE923F0872F31C050560C5707303C40946934B9182F31C01878EE3D5C2E3C40C13A8E1F2A2D31C01536035C902D3C405A65A6B4FE2A31C03ECE3461FB2D3C402C280CCA342A31C0FDA36FD2342C3C4086AE44A0FA2731C0A58636001B2C3C4077F700DD972731C081069B3A8F2A3C40CB2E185C732331C05E4C33DDEB283C4073BB97FBE42031C0AB7AF99D26273C40EDB60BCD751E31C089247A19C5263C400A6AF816D61D31C005172B6A30253C4060E97C78961C31C096CD1C925A243C40C8940F41D51C31C0991249F432223C40EF3B86C77E1A31C0E867EA758B203C406F8445459C1A31C07500C45DBD1A3C40960A2AAA7E1931C055C1A8A44E183C400038F6ECB91C31C09A40118B18163C403048FAB48A1E31C0BF2A172AFF123C4055BE6724422331C0D1950854FF103C40D576137CD32431C0C898BB96900F3C40A06EA0C03B2531C0054F2157EA0D3C4031EF71A6092731C00BB5A679C70D3C4090BDDEFDF12A31C0E6AE25E4830A3C401EFE9AAC512B31C09FCC3FFA26093C408AADA069892D31C05EBEF561BD093C40085A8121AB2F31C0855E7F129F073C4040FCFCF7E03131C0A986FD9E58073C40C7F65AD07B3331C094A0BFD023063C405A2BDA1CE73631C032005471E3063C40596C938AC63A31C0815D4D9EB2063C40EB36A8FDD63E31C02EC72B103D053C40EDD79DEE3C4131C0041F8315A7063C403F8F519E794531C01590F63FC0063C408D2958E36C4631C08DCF64FF3C093C40200C3CF71E4A31C08B1A4CC3F0093C40F4C308E1D14A31C0CDACA580B40B3C40D74FFF59F34B31C0261AA4E0290C3C409DBAF2599E4F31C0D4298F6E840D3C40A857CA32C45131C07D06D49B510F3C40DE736039425231C08195438B6C133C40DBDC989EB05431C0F0332E1C08153C405247C7D5C85631C064AE0CAA0D163C40C2A1B778785731C011E0F42EDE173C4032FFE89B345931C0390CE6AF90193C40F19BC24A055931C051F701486D1E3C40A9177C9A935731C06F9EEA909B213C40465F419AB15831C0E63C635FB2253C4045D7851F9C5731C03BE2900DA4273C40D57954FCDF5531C0D925AAB7062A3C404E9D47C5FF5531C044317903CC2C3C40EDD3F198815231C088F546AD30313C40FA415DA4505231C06E4F90D8EE323C404FB0FF3A375131C0FB75A73B4F343C40AC3B16DBA44E31C01500E31934343C40242BBF0CC64C31C063D4B5F63E353C40056B9C4D474831C0BFD53A7139363C4026C79DD2C14631C054C37E4FAC373C405E143DF0314431C0F92CCF83BB373C40691EC022BF4231C0265646239F373C407EFD101B2C4031C09D499BAA7B343C400103000000010000004B00000030F488D173E731C060ADDA3521D93C40CD1E680586E431C0B727486C77D73C403881E9B46EDB31C0D9EDB3CA4CD53C40C7DADFD91ED931C04F9143C4CDD53C40C9207711A6D431C07D2079E750D63C40CD91955F06CF31C0E78D93C2BCD73C40469561DC0DCA31C0A9674128EFD73C40132D793C2DC731C026AAB706B6D63C4056F2B1BB40C531C004392861A6D13C404ED53DB2B9C231C09EEC66463FCE3C406A4E5E6402C231C00D1D3BA8C4C93C408AAF7614E7C031C04BE9995E62C83C4055302AA913C031C08751103CBEC53C404DD7135D17BE31C03B014D840DC33C40AFB5F7A92ABC31C0FAF19716F5C13C404C6DA983BCBA31C05FD218ADA3BE3C40BF9D44847FB931C0959BA8A5B9BD3C40F60A0BEE07BC31C026E0D74812B83C40CCD3B9A294C031C01633C2DB83B43C40DA01D71533C231C0FD6838656EB23C406C97361C96C231C0CA332F87DDAF3C405471E316F3C331C0075E2D7766AE3C406ADC9BDF30C531C00FD253E410AD3C4029965B5A0DC531C0EB39E97DE3AB3C40D28BDAFD2AC431C0B58993FB1DAA3C4054AC1A84B9C131C0780C8FFD2CA63C408EB0A888D3C131C07250C24CDBA33C4091B75CFDD8C031C03CBF28417FA13C40DECB7D7214C031C0D34ECDE5069F3C400FBA84436FC131C0D190F128959C3C401958C7F143C131C05CCB64389E973C4013EE9579ABC231C07DB08C0DDD943C40F2EEC8586DC231C02BDB87BCE5923C408962F20698C531C0C7D63384638E3C40809BC58B85C931C0E124CD1FD38A3C4035F0A31AF6CB31C03BC8EBC1A4843C407BBC900E0FD131C0B16CE690D47E3C4078D4981073D531C0FF59F3E32F753C400E4A9869FBD731C07FBC57AD4C743C409DF6949C13DB31C0F33B4D66BC753C408C48145AD6DD31C0CD3B4ED191783C40ECDB4944F8DF31C063B323D5777E3C40D89FC4E74EE031C0C9E4D4CE30853C405D34643C4AE131C0A65EB7088C893C40310A82C7B7E331C01233FB3C468D3C40C364AA6054E631C000A8E2C62D923C40249C16BCE8E731C02BDB87BCE5923C40BFD2F9F02CE931C0884A2366F6953C4057EC2FBB27EB31C0EB8B84B69C973C40473B6EF8DDEC31C0F2D077B7B2983C40B13385CE6BEC31C09E3F6D54A79B3C403B527DE717ED31C0FEEF880AD59D3C40C68A1A4CC3F031C0D97BF1457BA43C40AC1C5A643BF331C071766B990CA73C4018265305A3F631C0E15E99B7EAAA3C40CC46E7FC14F731C0075E2D7766AE3C406DFDF49F35F731C0BADA8AFD65AF3C403A747ADE8DF931C0C425C79DD2B53C40EFC517EDF1FA31C09C6F44F7ACB73C404E42E90B21FB31C0D522A298BCB93C40CC9A58E02BFE31C08A90BA9D7DBD3C40FCFD62B6640132C0F88BD99255C13C40C1FEEBDCB40132C0833463D174C63C4089F02F82C60032C081ED60C43EC93C40F1B8A81611FD31C03E26529ACDCB3C40D6AA5D13D2FA31C00C74ED0BE8CD3C408FC2F5285CF731C0F12BD67091D33C4006668522DDF331C039B5334C6DD53C40AB251DE560F231C048A7AE7C96D73C403A5B40683DF031C0ACCABE2B82D73C402992AF0452EE31C08B19E1ED41D83C405793A7ACA6EB31C0C8EA56CF49DB3C40FE7BF0DAA5E931C033FE7DC685DB3C40B30A9B012EE831C053E9279CDDDA3C4030F488D173E731C060ADDA3521D93C4001030000000100000033000000A3B1F677B6E731C0C85EEFFE78D73B40BDC804FC1AE531C04A287D21E4D43B40E82D1EDE73E431C0E1F1ED5D83D23B404EB340BB43E231C0D462F030EDCF3B4077F4BF5C8BE231C0FFB0A54753CD3B4004ADC090D5E531C068791EDC9DC93B40AC39403047E731C037894160E5C83B408F183DB7D0E931C02AAC545051C53B403813D38558E931C094BE1072DEC33B40EDEF6C8FDEEC31C02577D84466BE3B401096B1A19BED31C0B14D2A1A6BBB3B404371C79BFCEE31C0B309302C7FBA3B4002F1BA7EC1F231C0853E58C686BA3B4037C30DF8FCF431C00B62A06B5FB83B4019390B7BDAF531C035CF11F92EB13B400B2593533BF731C006499F56D1AF3B40F7C77BD5CAF831C0C3BCC79926AC3B4044F7AC6BB4F831C027BD6F7CEDA53B40577A6D3656FA31C0D26EF4311FA43B40FB3E1C2444FD31C0CB2E185C73A33B40FF23D3A1D3FF31C02A0307B474A53B403F1C2444F90232C01C98DC28B2A63B400CCC0A45BA0732C064744012F6AD3B40EA76F695070D32C075ADBD4F55B13B4073F4F8BD4D1F32C085798F334DB43B409E40D829562532C0E564E25641B43B40FB0626378A2832C0234910AE80B63B4054573ECBF32832C0EB1D6E8786B93B401A355F251F2732C0D49E927362BB3B405551BCCADA2632C0D388997D1EBF3B407F8461C0922732C0E65DF58079C03B40B7B585E7A52632C0F660527C7CC23B404419AA622A2132C047FFCBB568C53B408B506C054D1F32C0882AFC19DEC43B40AE9E93DE371E32C0E10CFE7E31C33B40CBA2B08BA21B32C08FA9BBB20BC23B40BDFDB968C81432C011C64FE3DEC03B40FA0967B7961132C0DCF29194F4C03B403CDC0E0D8B0932C0A47213B534C33B40AD33BE2F2E0532C09B560A815CC63B405F44DB31750332C0E65DF58079C83B40BDC282FB01FF31C06B6281AFE8CA3B40FA9CBB5D2FFD31C0E3344415FECC3B406E8AC745B5FC31C0650113B875CF3B40D2C6116BF1FD31C06C06B8205BD23B40C11DA8531EF931C0BCCCB051D6D33B405A47551344F531C012A1116C5CD73B40919BE1067CF231C09C8713984ED73B4017299485AFEF31C08753E6E61BD93B409F20B1DD3DEC31C0DEE4B7E864D93B40A3B1F677B6E731C0C85EEFFE78D73B40	31	t	2023-12-09	\N	2
7	PT	Portufal Actualizado	Portugal Updated	POR	Portugal	Lisboa	t	f	f	0106000020E61000006C000000010300000001000000930000007DCA3159DC5F1040A1BDFA78E8074440CCB22781CD691040910BCEE0EF054440878BDCD3D56D104072A774B0FE0544402444F98216721040546EA296E60644401492CCEA1D7E1040357EE1952407444095641D8EAE8210402504ABEAE5074440A2EBC20FCE87104033FD12F1D607444079E92631087C1040AD69DE718A04444075E789E76C811040785F950B950344409BAA7B647385104054724EECA1034440A5D93C0E8389104033A48AE2550444409BABE639228F1040417FA1478C0444402CF2EB87D8901040CFD8976C3C0644407EAB75E2728C104013471E882C084440B4AD669DF18D1040A64412BD8C084440478E7406469E1040EA094B3CA0084440D0807A336AAE104036B05582C50744403FE603029DA9104060E7A6CD380744407E1D386744A91040A2258FA7E50544403604C765DCA41040CEA78E554A054440B3F0F5B52EA51040F6CE68AB920444404128EFE368AE10400C21E7FD7F044440E00ED4298FAE1040802DAF5C6F03444093C49272F7B91040BAA1293BFD0244409337C0CC77C010402A52616C210444409013268C66C51040C30DF8FC30044440D712F241CFC610406840BD1935034440040473F4F8CD1040D0EE906280024440CA3505323BCB104073D9E89C9F004440BC94BA641CD31040DACA4BFE27FF43408F19A88C7FCF10400F5F268A90004440976F7D586FD41040C8258E3C10014440ED2B0FD253E41040F1BC546CCCFF4340AA46AF0628FD104001344A97FEFF43407B14AE47E10A1140B491EBA694FF4340C554FA0967071140CE3461FBC9FE4340FC8D76DCF00B11400E2F88484DFD43409EEFA7C64B071140F225547078FB43408670CCB227111140E42F2DEA93FA4340FFAF3A72A4131140CBBF9657AEF94340C6F7C5A52A1D1140868DB27E33F94340CAC16C020C1B1140909E228788F74340BB0A293FA926114030815B77F3F443402657B1F84D311140588E90813CF3434027F73B14053A11407F130A1170F24340B6A0F7C6104011402BBEA1F0D9F0434074081C09344811400D39B69E21F04340AC71361D013C11407EA7C98CB7EF43401CEE23B7262D1140AF93FAB2B4F1434068AED3484B151140F69507E929F24340562C7E53581911407E5182FE42F14340151E34BBEE1D1140C554FA0967F1434089B14CBF442C1140D5592DB0C7F04340DF196D55123911403106D671FCEE43402AE09EE74F3B11405F0CE544BBEC4340130F289B7235114028B7ED7BD4EB434089B5F8140033114044520B2593EB4340DF8B2FDAE3351140143FC6DCB5EA43409D819197353111405BB22AC24DEA4340A4E029E44A2D114015C9570229E943403E40F7E5CC2611400E83F92B64E84340766D6FB7241711401232906797E74340D55DD90583FB1040DC4B1AA375E843403FADA23F34F3104002B859BC58E843409DBB5D2F4DE1104002F4FBFECDE9434034BE2F2E55D91040778192020BEA434081936DE00ED410403E20D099B4E943401D554D1075CF1040DBDC989EB0EA4340603E59315CCD1040849CF7FF71EA4340EAAEEC82C1C51040CF4BC5C6BCEA4340BB97FBE428A010403B6EF8DD74ED43401CCD91955F8610407CD3F4D901EF43406D1ADB6B417F1040F8C610001CEF43404C6C3EAE0D651040C68B852172F04340F163CC5D4B5810405ED6C4025FF1434025B1A4DC7D4E1040F7C77BD5CAF24340C47B0E2C4738104029EACC3D24F44340137EA99F3715104031EC3026FDF543406C5F402FDC091040A2258FA7E5F54340331B649291031040C4B5DAC35EF643403B53E8BCC6EE0F4041B96DDFA3F643401424B6BB07E80F40D7FA22A12DF7434084807C0915DC0F40744012F6EDF64340B5A4A31CCCC60F401898158A74F74340C1A8A44E40B30F40603E59315CF743400DC347C494A80F40359886E123F84340DC63E94317940F404D13B69F8CF74340B7442E38837F0F40081F4AB4E4F74340B85B920376750F402AFD84B35BF74340B345D26EF4510F4058C9C7EE02F743406DE690D442490F402594BE1072F643401B649291B3300F40C828CFBC1CF643401EC3633F8B250F40DBDC989EB0F643400AA2EE03901A0F4013B534B742F64340B6D782DE1B030F401C9AB2D30FF6434003EB387EA8D40E408A20CEC309F643406214048F6FAF0E40522B4CDF6BF6434085B53176C2AB0E406BD8EF8975F64340C231CB9E04960E401C08C90226F6434088D51F6118900E40C9772975C9F643401155F833BC990E403D601E32E5F9434047C66AF3FFAA0E409148DBF813FB4340D1CC936B0AA40E403D5FB35C36FC434072DD94F25AA90E40CE1C925A28FD4340378E588B4FA10E4018EAB0C22DFF4340FD4CBD6E11980E40809BC58B85FF43405186AA984A7F0E4020425C397BFF43407B4ACE893D740E403599F1B6D2FF4340E90B21E7FD5F0E40E28FA2CEDCFF43401897AAB4C5550E402EAD86C43D02444036E9B6442E780E404089CF9D6003444030F5F3A622750E40DDD1FF722D044440CE6F986890820E40CE6F986890044440328FFCC1C0930E40467D923B6C064440B020CD58349D0E40EF004F5AB80644406214048F6FAF0E40B2D5E59480064440D13C80457EBD0E404582A966D6064440B6D8EDB3CAEC0E40B003E78C28074440925852EE3E070F40376C5B94D9064440B01C210379160F407A7077D66E0744404162BB7B802E0F40079B3A8F8A074440166EF9484A3A0F4079B130444E0744401EFD2FD7A2450F40B3EC4960730644407BD7A02FBD5D0F40A54C6A68030644406F1283C0CA610F401E1840F8500644403048FAB48A5E0F40E831CA332F074440A391CF2B9E7A0F4056BC9179E4074440CEFC6A0E108C0F404529215855074440F94A202576AD0F40CF656A12BC074440EE9579ABAEC30F40755776C1E0064440616BB6F292DF0F40CF2EDFFAB0064440FB592C45F2F50F400BB6114F760744406902452C62081040E2ADF36F97074440DE57E542E50F10405F79909E2207444057975302621210406C94F59B89074440094FE8F52721104058A835CD3B084440809C3061342B10401EA7E8482E074440D7C397892234104097749483D9064440D9243FE2573C10401CD0D2156C07444026C79DD2C14A10406F8104C58F074440DB519CA38E4E1040C32973F38D0844406EDA8CD310551040CD74AF93FA08444030BABC395C5B10400742B280090A44404628B682A6551040377172BF430B44407097FDBAD35D1040056EDDCD530B444073F1B73D41621040FB57569A940A44407DCA3159DC5F1040A1BDFA78E807444001030000000100000007000000F20698F90E2E1140B1F9B83654E64340E0BBCD1B27251140DE9046054EE64340F357C85C19241140BF7D1D3867E64340EEB43522182711402E71E481C8E64340B3075A81212B114001A60C1CD0E64340C3D66CE5252F1140BCCADAA678E64340F20698F90E2E1140B1F9B83654E64340010300000001000000070000003480B7408222114014D044D8F0FA43408C6A11514C1E1140AE122C0E67FA434054FCDF11151A11402864E76D6CFA4340527DE71725181140608F899466FB434025E99AC9371B1140984EEB36A8FB4340D0EFFB372F1E11408CF337A110FB43403480B7408222114014D044D8F0FA434001030000000100000005000000C1E61C3C13DA104049641F6459024440C0EB33677DDA1040A4DE5339ED01444036AD1402B9D41040BE16F4DE18024440C214E5D2F8D51040DAE3857478024440C1E61C3C13DA104049641F645902444001030000000100000005000000B76114048F4F1040ABED26F8A60B4440CA4FAA7D3A4E10402E7590D7830B4440E4DBBB067D4910400A9E42AED40B4440DD088B8A384D1040EA043411360C4440B76114048F4F1040ABED26F8A60B44400103000000010000004D01000077F69507E96909404644317903FA4340B282DF86186F09404D124BCADDF9434049DA8D3EE683094006F6984869FA43407EAA0A0DC49209407B336ABE4AFA4340A48D23D6E2B3094017A06D35EBFA43408CD651D504B109402A6F47382DFA4340D61BB5C2F49D094007D15AD1E6F8434087FBC8AD49770940ABB184B531F843404C1B0E4B033F094058AEB7CD54F64340A58636001B10094040683D7C99F643406D567DAEB602094054C4E9245BF54340355EBA490CE20840BE66B96C74F44340793D98141FDF0840548F34B8ADF34340FD2FD7A205C808405646239F57F44340CB811E6ADBB008409DD5027B4CF44340C61858C7F1A3084099B7EA3A54F34340F38FBE49D3A0084041800C1D3BF24340E17F2BD9B1B10840807EDFBF79EF4340984C158C4ACA0840F7AC6BB41CEE4340ACFD9DEDD1DB0840B3EE1F0BD1ED43401A4F04711EEE08404FB2D5E594EE434050E1085229F60840A568E55E60EE4340A4897780270D09402330D63730EF43409B745B22171C09403579CA6ABAEE4340D2C3D0EAE42C0940914259F8FAEE434020D3DA34B637094072512D228AEF4340A0A9D72D02430940D6FF39CC97EF43400C5BB395977C09400F46EC1340F143407347FFCBB5880940C2F693313EF24340DD79E2395BA009402FA86F99D3F143408A93FB1D8A820940B587BD50C0F0434014ECBFCE4D7B0940C2A2224E27EF43401ADD41EC4C8109402D211FF46CEE4340B27F9E060C920940BA4C4D8237EE43409AEAC9FCA36F09406D59BE2EC3EB4340EB01F390295F0940ABE80FCD3CEB434020CF2EDFFA50094090D959F44EEB4340D3307C444C290940C40B2252D3EA4340A12DE7525C150940EE5BAD1397EB43403EE94482A90609400516C09481EB4340A6D24F38BBF50840F5F23B4D66EA43405726FC523FEF084096EA025E66E84340F99E91088D000940CA6E66F4A3E54340077AA86DC32809406A85E97B0DE34340D47FD6FCF86B0940B6D8EDB3CAE043402C4487C091A00940CA8B4CC0AFDF43408B1A4CC3F0B109401689096AF8DE4340C5AEEDED96E40940B41CE8A1B6DD434047CCECF318050A40B70A62A06BDD4340B5FE9600FC130A40ADF6B0170ADE434082C5E1CCAF260A406D3B6D8D08DE4340C93A1C5DA53B0A40B0AD9FFEB3DE4340AE2B6684B7470A40B874CC79C6DE43406155BDFC4E530A4036B1C05774DF43408718AF7955670A4059C0046EDDDF4340F2ED5D83BE740A404FAC53E57BE04340A298BC01669E0A409ED2C1FA3FE1434093C6681D55AD0A40E3A430EF71E24340390B7BDAE1AF0A40F27A30293EE44340E8BD310400C70A40FDBE7FF3E2E44340D53C47E4BBF40A401FDB32E02CE34340FEB4519D0E040B40D2A8C0C936E243400DE36E10AD150B40B1868BDCD3E1434079E75086AA380B40503A9160AAE143409697FC4FFE4E0B407786A92D75E04340BA826DC4935D0B40C72E51BD35E043403CFA5FAE456B0B4054C8957A16E043408F71C5C551790B40AD8A709351DF43400AA0185932A70B4003E962D34ADF43408849B89047B00B40F16261889CDE43401EF98381E79E0B40882F134548DD4340C959D8D30E9F0B402FF7C95180DC4340882AFC19DEAC0B405F99B7EA3ADC43404016A243E0C80B40F5673F5244DC4340F981AB3C81D00B40933A014D84DB4340274BADF71BCD0B401157CEDE19DB43400685419946B30B405C76887FD8DA43409ED2C1FA3FA70B400344C18C29DA434025917D9065A10B4019ABCDFFABD843408C497F2F85A70B40369204E10AD843400AD6389B8EA00B403F58C6866ED643405C902DCBD7A50B4074435376FAD5434064EAAEEC82A10B40261C7A8B87D543406E313F3734A50B406380441328D44340ADFA5C6DC59E0B404B598638D6D34340B24B546F0D8C0B403CA06CCA15D4434078B5DC9909860B40390B7BDAE1D34340105CE509847D0B40614F3BFC35D14340116F9D7FBB6C0B4034D6FECEF6D0434087527B116D470B40C898BB9690D14340D636C5E3A23A0B40043A933655D14340909F8D5C37250B40DAC9E02879CF434042791F4773240B406DCA15DEE5CE434043A9BD88B6230B405C035B2558CE434079245E9ECE150B4026E4839ECDCC43409702D2FE07180B4059FCA6B052CB43407C0DC17119370B4065726A6798CA4340D90A9A9658390B4066BE839F38CA4340931804560E2D0B40C7D8092FC1C94340B0928FDD050A0B406B8313D1AFC94340F03504C765FC0A40E563778192C84340478E740646FE0A407F33315D88C743403A2009FB76F20A40D9B3E73235C74340191C25AFCEF10A40643E20D099C643401FBC7669C3E10A408908FF2268C6434055151A8865B30A4097C5C4E6E3C44340F086342A70B20A40060DFD135CC4434037C2A2224EA70A40C2DA183BE1C3434093E1783E038A0A403E23111AC1C24340F2ED5D83BE740A4083C30B2252C14340D53E1D8F19680A40D5264EEE77C04340ED9C668176670A4055302AA913C04340E04DB7EC105F0A4010786000E1BF434067800BB265590A40153AAFB14BBE43400F5F268A903A0A40C878944A78BA43409EEFA7C64B370A400D8AE6012CB8434077D844662E300A40A930B610E4B64340E4874A2366360A40C2137AFD49B64340BF6378EC67310A4037C2A2224EB543405436ACA92C2A0A40F1A1444B1EB54340342E1C08C9220A40925B936E4BB64340685E0EBBEF180A405342B0AA5EB643408EEBDFF599130A40F1660DDE57B5434043209738F2200A403CFA5FAE45B54340137CD3F4D9210A403EB48F15FCB44340EDF5EE8FF70A0A40F2CEA10C55B34340B3B6291E17F50940BDE13E726BB043406B64575A46EA0940B5E0455F41B04340193DB7D095E809405FECBDF8A2AF4340EA04341136DC094007B309302CAF4340C0ED0912DBDD09400A4AD1CABDAE4340F59CF4BEF1D50940286552431BAE4340A5A0DB4B1AC30940149337C0CCAD4340740B5D8940B509408099EFE027AE43409CDD5A26C3B10940BB25396057AD4340FE0DDAAB8F870940F20A444FCAAC434070CE88D2DE8009405001309E41AB4340056C0723F6690940EAD0E97937AA434056D80C7041560940DBFCBFEAC8A94340D47FD6FCF82B094056D3F544D7A943407C7E18213C1A0940AEF4DA6CACA84340B58AFED0CCF308409AB51490F6A74340BB473657CD93084012FB04508CA24340520DFB3DB18E084031CEDF8442A2434086A92D7590770840C5C72764E7A143407B12D89C836708404B1E4FCB0FA243409DF2E846585408402DB5DE6FB4A34340944DB9C2BB3C0840637FD93D79A44340D9CD8C7E343C08408466D7BD15A543402882380F273008409A0986730DA54340978C63247B2408409AE95E27F5A54340F6D1A92B9F250840170E846401A74340E8A04B38F4160840C09657AEB7A74340FB027AE1CE050840A64412BD8CA843403BAA9A20EAFE0740B477465B95A843400D1D3BA8C4F507408FE3874A23A84340FDF84B8BFAE40740AD18AE0E80A843403483F8C08EDF07403DB9A64066A94340F241CF66D5E70740C66AF3FFAAA9434023BE13B35EEC074094FB1D8A02AB43400307B47405DB07403EEAAF5758AC434024B4E55C8AAB0740139ED0EB4FAE43406B44300E2E9D074088F2052D24AE4340A779C7293A720740C34659BF99AE4340C6E061DA3757074075E5B33C0FAE4340D07EA4880C4B0740A77686A92DAD4340DB4E5B2382110740793E03EACDAE434070404B57B0ED0640637FD93D79AE4340E485747808C306406EC493DDCCAE43408944A165DD9F064009A52F849CAD4340F46E2C280C8A06401ADB6B41EFAD4340E9D32AFA43730640B763EAAEECAE43401749BBD1C75C0640FEEDB25F77AE43408E959867254D06404A404CC285AE434088670932022A06402A1BD65416B14340F50EB743C30206409ECE15A584B24340BF99982EC4EA05403ECC5EB69DB44340AAB8718BF9F90540AF7B2B1213B843409F3D97A949F00540F04E3E3DB6B9434002F2255470D80540E3A8DC442DBB4340CA8AE1EA00C805404303B16CE6BC4340253FE257ACE105403DB7D09508BE43407C7C4276DEE605407E8CB96B09BF4340BC04A73E90FC054010786000E1BF4340A64412BD8C020640CDCD37A27BC04340CA880B40A3F4054067614F3BFCC14340F14927124CD5054030D63730B9C34340D2C2651536C305405AB8ACC266C443400F98874CF9B005405BB22AC24DC44340A699EE75527F0540A88E554ACFC64340AD31E884D0210540A69BC420B0C843405E807D74EA0A0540C90391459AC8434027DC2BF356FD04402E910BCEE0C543401B834E081DF40440486C770FD0C543403EEB1A2D07DA04408ACDC7B5A1C64340F3E505D847C70440656D533C2EC64340E8A38CB800B404401F69705B5BC443409031772D217F0440D8F15F2008C4434093AB58FCA6500440D2C3D0EAE4C243403596B036C64E04409AD2FA5B02C243405854C4E9245B04408195438B6CC143406E8AC745B5480440CC7B9C69C2C04340847EA65EB7480440B75ED38382BE4340D976DA1A112C04401DE38A8BA3BC4340A794D74AE82E044082E15CC30CBB4340E90FCD3CB92604405932C7F2AEBA43408B34F10EF0040440D68C0C7217BB43400BB77C2425FD03407C629D2ADFBB4340DCB8C5FCDCF003409AD18F8653BC43409D4B7155D9D70340C18EFF0241BC434060E4654D2CD00340F986C267EBBE4340DC2A8881AEBD0340B4E4F1B4FCBE4340930035B56CAD034082E49D4319C04340D5CBEF3499B10340D253E41071C143400B0BEE073CD00340FEEF880AD5C14340AEEFC34142D403402D228AC91BC24340C7B8E2E2A8BC0340394371C79BC24340832F4CA60AA603406EA296E656C44340198D7C5EF194034076C075C58CC44340BC900E0F617C03403929CC7B9CC343406C938AC6DA5F0340E1B54B1B0EC3434041481630815B0340A4552DE928C3434010070951BE600340B03907CF84C4434095D5743DD15503400F7BA180EDC443405B96AFCBF03F0340F0DDE68D93C44340A9C29FE1CD3A03409A25016A6AC343405323F433F51A03402272FA7ABEC2434016C3D501101703408AE3C0ABE5C24340EECEDA6D171A03403BE0BA6246C44340514A0856D50B0340CCD4247843C44340DC68006F810403405E64027E8DC44340574277499CF50240A86DC32808C4434066BFEE74E7E90240815F234910C44340D6355A0EF4F00240C269C18BBEC44340FF3EE3C281100340FC8F4C874EC54340B6696CAF051D0340728A8EE4F2C54340003CA2427513034030F2B22616C64340BF7CB262B8FA0240E8C1DD59BBC54340525F96766AEE0240D00A0C59DDC643408461C092ABD802407D5D86FF74C743408A39083A5AD502406667D13B15C8434080F10C1AFAC70240726C3D4338C84340B0E595EB6DD3024087A2409FC8C94340B8CD548847C202400264E8D841CB43406A15FDA199C70240B876A22424CC4340CC7B9C69C2D602400A68226C78CC43406C5F402FDCD902401A34F44F70CD43404D4D8237A4F102407A8A1C226ECE4340643E20D09914034035EECD6F98CE4340BC3E73D6A75C03405645B8C9A8D04340FD4D2844C061034058AA0B7899D143403CA06CCA157E03401557957D57D24340BEBF417BF5B10340A9FA95CE87D34340085A8121ABDB0340799274CDE4D54340111956F146E6034076DF313CF6D54340CA181F662FFB034028D53E1D8FD7434060234910AE2004405AF2785A7ED843405DFC6D4F903804403B1C5DA5BBD94340A724EB70745504407C293C6876D943401FD95C35CF7104406B9A779CA2D943409CC58B8521B20440137CD3F4D9DB4340946A9F8EC7CC04407B116DC7D4DD434028B517D176EC04409F1D705D31DF4340AF5DDA7058FA044047382D78D1DF4340037B4CA434FB0440172CD505BCE04340289CDD5A26030540973B33C170E043405E807D74EA0A0540AEF36F97FDE04340D6E07D552E140540BFB9BF7ADCE14340DE21C50089260540556CCCEB88E1434068041BD7BF4B05401A87FA5DD8E24340EC866D8B325B0540102219726CE54340A835CD3B4E71054044334FAE29E643406308008E3D7B0540CD3E8F519EE543403F1D8F19A88C054072C0AE264FE54340179D2CB5DE8F05409A7B48F8DEE543403B527DE71785054057AF22A303E643406CCCEB884396054031B3CF6394E743405854C4E9249B05401897AAB4C5E743409F91088D60A305402DAF5C6F9BE743407B849A2155B40540684293C492E84340919DB7B1D9D10540EF1B5F7B66E943400C21E7FD7FDC05409BC6F65AD0E9434051BB5F05F8EE0540034356B77AEA4340D93EE42D57FF05407A51BB5F05EA43407FA1478C9E1B06404EB857E6ADEA4340ED461FF3012106403CA1D79FC4EB4340640795B88E310640DFFAB0DEA8EB43401D91EF52EA320640AF5B04C6FAEC434014268C66653B064044183F8D7BED434087FD9E58A74A0640E71A66683CED4340172D40DB6A560640477364E597ED43402BA1BB24CE6A06408CBFED0912ED4340D8F15F2008700640DA0418963FED434003249A40116B06403C1570CFF3ED4340AA436E861B7006401827BEDA51EE4340AED9CA4BFE8706405C7347FFCBED4340FBE93F6B7E9C064048895DDBDBED434054FD4AE7C3B306406478EC67B1EE4340C6F99B5088C006404777103B53EE4340834C327216D606405E83BEF4F6EF4340CF2EDFFAB0FE0640D0807A336AF0434053B4722F302B0740F819170E84F24340A9177C9A933707402618CE35CCF24340410E4A98693B074077BF0AF0DDF24340D07EA4880C4B07406403E962D3F24340700A2B1554540740CDCCCCCCCCF243409A0AF148BC5C07400A48FB1F60F3434051DCF126BF650740EE3F321D3AF343408A3DB48F157C0740C6C1A563CEF343402F14B01D8C9807401ABFF04A92F54340552E54FEB5BC07402D27A1F485F44340FF76D9AF3BDD0740CF2F4AD05FF4434040A54A94BD050840518369183EF64340E8A04B38F416084078B306EFABF64340DCA16131EA3A084080B8AB5791F7434011C7BAB88D460840A92F4B3B35F7434050C58D5BCC4F08408E76DCF0BBF74340BA69334E43540840A73CBA1116F74340E3E313B2F37608406493FC885FF74340679E5C532073084018D00B772EF64340F46DC1525D8008409964E42CECF54340BB473657CD9308406F4BE48233F643405532005471A308408D2958E36CF643404DA1F31ABBC408400135B56CADF74340CF2C095053CB0840FA0967B796F74340B9196EC0E7C708401D91EF52EAF64340A7406667D1FB08407D91D09673F74340CCF10A444F0A094099BB96900FF843402C0C91D3D713094020CF2EDFFAF84340AC376A85E93B09400CE71A6668FA43400F7C0C569C6A09405A65A6B4FEFA4340A8C4758C2B6E094093196F2BBDFA434077F69507E96909404644317903FA43400103000000010000009D1100000002D6AA5D93FCBFA777F17EDCAC45400586AC6EF55CFCBFDE57E542E5AB4540988A8D791D31FCBF0DFFE9060AAC4540D2890453CD2CFCBF0B9755D80CAC45403B014D840D0FFCBFE6EB32FCA7AB45404CC631923D02FCBF3318231285AA4540B79BE09BA6CFFBBFF1F5B52E35AA454080457EFD10DBFBBF17B83CD68CA84540F54C2F3196A9FBBF49DA8D3EE6A545403B191C25AF8EFBBFC24D469561A64540FA2B64AE0C6AFBBF6808C72C7BA64540F5BC1B0B0A43FBBFEC51B81E85A74540207EFE7BF01AFBBF25B37A87DBA74540454772F90FE9FABFD369DD06B5A74540E4F38AA71EA9FABFC6FA062637A845407008556AF680FABF645DDC4603A84540BB99D18F8653FABF7A53910A63A74540594FADBEBA2AFABFCE4F711C78A74540CF8767093202FABF3A58FFE730A74540096EA46C91F4F9BF2D5BEB8B84A6454088BA0F406A13FABFA3CB9BC3B5A44540137CD3F4D901FABF82A8FB00A4A24540240F441669E2F9BF7633A31F0DA14540514F1F813FBCF9BF8CBB41B456A04540FC8EE1B19F85F9BF0F5F268A90A0454007077B134332F9BF469561DC0DA0454078431A153819F9BF9961A3ACDFA045409E4319AA62EAF8BF732D5A80B6A3454012C0CDE2C502F9BFCF108E59F6A44540F81741632691F8BFADDA3521ADA54540ADA415DF5078F8BF1F0E12A27CA54540376F9C14E63DF8BF13B70A62A0A54540E0D572672618F8BFD87E32C687A54540C2C1DEC490DCF7BF2F50526001A445405B99F04BFDBCF7BF0D8AE6012CA445407E6E68CA4E7FF7BFE2CCAFE600A34540ACC77DAB7522F7BF05DF347D76A245407C5F5CAAD2D6F6BFAF06280D35A245406CE8667FA09CF6BFC64FE3DEFCA2454070EA03C93B47F6BF384D9F1D70A145402D6002B7EE26F6BF5C7171546EA045406919A9F7540EF6BFED66463F1A9E45402AA8A8FA950EF6BFC8073D9B559D4540D34B8C65FA25F6BFDD0BCC0A459C45404DDA54DD231BF6BFB136C64E789B45404298DBBDDC27F6BFF7C77BD5CA9A45407495EEAEB321F6BFA8514832AB99454064E8D841252EF6BF0F5EBBB4E198454075029A081B1EF6BF7B2DE8BD31984540A2258FA7E547F6BFEF1AF4A5B797454045DAC69FA86CF6BF8D62B9A5D5964540029CDEC5FB71F6BFB9AAECBB22944540528028983185F6BF91BA9D7DE59345407558E1968FA4F6BFACC5A70018934540E0DBF4673F92F6BFA088450C3B924540E6046D72F8A4F6BFF913950D6B904540371C96067ED4F6BF6ABE4A3E768F4540AD8905BEA2DBF6BFE15E99B7EA8E4540DDEF5014E813F7BFDD0BCC0A458E4540B58AFED0CC13F7BF0E85CFD6C18D454083893F8A3A73F7BF9E4319AA628C45406E35EB8CEF8BF7BFFAF202ECA38B4540E9B7AF03E78CF7BFE94482A9668A4540D367075C574CF7BFE945ED7E15884540A986FD9E5827F7BF93020B60CA8645403944DC9C4A06F7BF7B2E5393E0854540041F8315A7DAF5BF9EEDD11BEE8345405001309E41C3F5BF9A417C60C7834540EB909BE106BCF5BF54AC1A84B9834540514D49D6E1A8F5BF66F4A3E194834540B98C9B1A687EF5BF02486DE2E486454019E76F422182F5BFC87C40A03389454031EBC5504E74F5BF41D7BE805E8A45408143A852B387F5BFB29DEFA7C68B4540FFB27BF2B050F5BF81B1BE81C98D45406876DD5B9118F5BFB0CBF09F6E8E4540BDE13E726B52F4BFA1681EC0228F4540A46DFC89CAC6F4BFF4346090F48B45400D535BEA20EFF4BFBAF8DB9E20894540062B4EB516E6F4BF272F3201BF8845400C91D3D7F3B5F4BFB01D8CD827884540FAD4B14AE999F4BFF8E0B54B1B8845407022FAB5F553F4BF7D073F7100874540200DA7CCCD37F4BF5C1C959BA885454093DFA293A516F4BF5000C5C892854540E8667FA0DCF6F3BF0D6FD6E07D85454042CF66D5E7AAF3BF0B7DB08C0D874540D333BDC45866F3BFA93121E69286454043C6A354C253F3BF4EB4AB90F2854540174A26A77646F3BF83FC6CE4BA854540F2785A7EE0EAF2BFD6C9198A3B8445409D465A2A6FC7F2BFB0FECF61BE8445409204E10A2854F2BFDF6A9DB81C8345404F75C8CD7043F2BF7B4E7ADFF8804540D95A5F24B425F2BF04C6FA0626814540BD00FBE8D4D5F1BF7CB60E0EF68245404C35B3960292F1BF732D5A80B6814540D8D30E7F4D56F1BFADA7565F5D8145409D7FBBECD75DF1BF815EB87361804540FDA4DAA7E331F1BF45B9347EE17F4540C2853C821B29F0BF5E4C33DDEB7E4540C51D6FF25BF4EFBF5BCD3AE3FB7C45402A55A2EC2D65EFBF9C16BCE82B7C4540DB148F8B6A11EFBFFEB7921D1B7B45402F4E7CB5A3B8EEBFCD069964E47A4540967A1684F23EEEBFADDF4C4C177A4540D23AAA9A20EAEDBF040473F4F8794540DA38622D3E85EDBF0CAD4ECE507A45408675E3DD9131EDBF87359545617B4540AD4CF8A57EDEECBF98F8A3A8337B45402C2B4D4A41B7ECBF0FD3BEB9BF7A454063D1747632B8ECBFFCC6D79E597A4540C139234A7B03ECBFDB696B44307A4540BB26A435069DEBBF7EA7C98CB7794540ACAC6D8AC7C5EABFD7C39789227A4540B33F506EDBF7E9BF4AD40B3ECD79454032B08EE3874AE9BFF7065F984C7B4540E02A4F20EC14E9BF71AFCC5B757B4540863AAC70CBC7E8BFDA03ADC0907B45408429CAA5F18BE8BFF855B950F97B45404A6249B9FB1CE8BF59A31EA2D17B45404F92AE997CB3E7BFAF7D01BD7079454082035ABA826DE7BF12859675FF78454043AA285E656DE7BF624CFA7B29784540342C465D6B6FE7BF39252026E1764540DF6A9DB81C2FE7BF8E93C2BCC7754540B136C64E7889E7BF8C118942CB74454018CDCAF6216FE7BF94A46B26DF72454082E673EE763DE7BF28D3687231724540313F37346527E7BFA359D93EE4714540F94B8BFA24F7E6BF3881E9B46E7145405610035DFB82E6BFEBC726F911714540F0F78BD99255E6BFC02500FF9470454093ACC3D155BAE5BF60ADDA3521714540AD6D8AC74535E5BF8A3F8A3A736F4540923D42CD902AE5BF967B8159A16E45409CDEC5FB71FBE4BF9F211CB3EC6D454020CF2EDFFAB0E4BF3DB9A640666D4540FD8348861C5BE4BF0D8D2782386D4540321EA5129ED0E3BF234DBC033C6B4540C2887D022846E3BFAE635C71716A4540637E6E68CA4EE3BFD462F030ED6945405FD218ADA32AE3BF0B28D4D347684540DDB5847CD033E3BFB70C384BC9664540E1D231E719FBE2BF5796E82CB3664540641EF9838167E2BFE4A1EF6E65674540F8A75489B237E2BFEB1ED95C35674540CE716E13EE15E2BFD44334BA83664540CE716E13EE15E2BFCB49287D2166454098C28366D73DE2BF75560BEC31654540C47AA356983EE2BFEE76BD3445644540BEDD921CB02BE2BF027FF8F9EF634540CE716E13EE15E2BFAC545051F56345400C04013274ECE1BF27DA5548F96345409C6C0377A0CEE1BFF6ED2422FC6345409BE271512DA2E1BF6C94F59B89634540689604A8A965E1BF02D8800871654540A5164A26A7F6E0BF7B87DBA161654540B5519D0E64BDE0BF054EB6813B664540D8D2A3A99ECCE0BF5437177FDB674540DE9387855A53E0BF2235ED629A694540761893FE5E0AE0BF897E6DFDF469454001FA7DFFE6C5DFBFCD3AE3FBE268454092088D60E3FADEBF6FF3C64961684540FF959526A5A0DEBF2AABE97AA2674540408864C8B1F5DCBF022B8716D96645408B53AD855968DCBF09707A17EF65454057EE05668522DCBFF1811DFF056645405E68AED3484BDABF9AEB34D25267454018EDF1423A3CD9BF2B4B749659664540C8073D9B559FD8BFB77BB94F8E664540A515DF50F86CD8BF1747E5266A67454028637C98BD6CD7BF2F6CCD565E684540DFC0E44691B5D6BF4643C6A3546A45406B9C4D470037D6BF39B69E211C6B4540FD87F4DBD781D5BF3E7958A8356B45404B3E76172829D5BFE7E104A6D36A4540357D76C075C5D4BFC18C2958E36A454098A59D9ACB0DD4BFFBAE08FEB76C4540A724EB707495D3BFFBE59315C36B4540ABEAE5779ACCD1BF4A6249B9FB6A45403F1D8F19A88CD1BF0D33349E086A4540C136E2C96E66D0BFB1C398F4F76845402AC93A1C5DA5CFBF2DCE18E604694540F2CEA10C5531CFBFA14ACD1E68694540919DB7B1D991CEBFBF2B82FFAD684540577A6D365662CEBF6FD921FE616745409F8F32E202D0CCBFDFE00B93A9664540FCC8AD49B725CCBFE8A1B60DA36645400EF5BBB0355BCBBFFFCBB56801664540B8E864A9F57EC9BFEAE8B81AD96545406B662D05A4FDC7BFBC95253ACB64454021ACC612D6C6C6BF8D63247B846445401C5DA5BBEB6CC4BF72F8A413096645400EDC813AE5D1C3BF88D7F50B7665454062BB7B80EECBC3BFB6BDDD921C644540D87F9D9B36E3C2BFE77283A10E634540BB63B14D2A1AC3BFCAFD0E4581624540679E5C5320B3C1BFF2D24D6210624540DC2C5E2C0C91BFBF7C444C8924604540A9143B1A87FABDBF5E64027E8D5E454018E945ED7E15BCBF51A1BAB9F85D454039D384ED2763BCBFC4961E4DF55C4540F7949C137B68BBBF2F6CCD565E5C45404182E2C798BBB6BF9E094D124B5C454019575C1C959BB4BFD690B8C7D25B45407214200A664CB1BF6A6CAF05BD5B45404F5AB8ACC266B0BFA71FD4450A5B454005A73E90BC73B0BFD00EB8AE985945408D614ED02687AFBFE71BD13DEB58454037A8FDD64E94ACBFC093162EAB584540750470B378B1A8BFC70F9546CC5845407B6649809A5AA6BFD923D40CA9584540BAF770C971A784BFA530EF71A657454029779FE3A3C5593F5B0BB3D0CE5745401DAD6A494739883F618BDD3EAB58454001BF4692205C913F315BB22AC2594540802DAF5C6F9B993F6B2BF697DD5945400B0BEE073C30A83F2E8D5F78255945406F4562821ABEAD3FC1E270E6575945401348895DDBDBB13F397F130A115A4540029F1F46088FB23F6C79E57ADB5A4540E1B20A9B012EB43F136058FE7C5B454036E9B6442E38B73F37C7B94DB85B4540A911FA997ADDBA3FE86C01A1F55A4540670DDE57E542BD3F54742497FF5A4540A016838769DFC03F6B2C616D8C5B4540E3C5C210397DC13FEC4E779E785C45404FE5B4A7E49CC43F2C7E5358A95C45401DCBBBEA01F3C43FC51A2E724F5D45401A88653387A4C63F3BE0BA62465E45402FFD4B529962CA3F172AFF5A5E5D4540D313967840D9CC3FE7012CF2EB5B4540CBD58F4DF223D03F4CFBE6FEEA5B45401A51DA1B7C61D03FF224E99AC95B454079E8BB5B59A2D03F04392861A65B45404AB890477023D13FF486FBC8AD594540D190F12895F0D03F4F3DD2E0B6584540D6390664AF77D13FBBEEAD484C5845401EA4A7C821E2D23FCFBBB1A03056454016342DB1321AD43FD6E253008C5745406490BB085394D43F4D6A6803B0574540C5025FD1ADD7D43F279F1EDB325A45407C0A80F10C1AD63FB8567BD80B5B454044C18C2958E3D63F5B5B785E2A5C4540D95E0B7A6F0CD73F075DC2A1B75C4540E1D39CBCC804D83F707B82C4765B4540C9E369F981ABD83FC2853C821B5B45408E57207A5226D93F927538BA4A5B45402C9D0FCF1264D93F2EA9DA6E825945401D21037976F9D93FE8DA17D00B594540C4245CC823B8DA3F882AFC19DE584540B212F3ACA415DB3F24438EAD6758454067D47C957CECDB3F9F71E140485845404D13B69F8CF1DC3F05FBAF73D358454051BEA085048CDD3F2A1C412AC55845400BF0DDE68D93DE3FE1455F419A594540D595CFF23CB8DF3FCA54C1A8A458454036CB65A3737EE03F57EE056685584540323ECC5EB69DE03F8CD7BCAAB3584540DBDE6E490ED8E03F3A5CAB3DEC5945402366F6798CF2E03FC91CCBBBEA594540A7936C753925E13FE01115AA9B59454051137D3ECA88E13F00529B38B9594540C32CB4739A85E23FE17B7F83F6584540ABEB504D49D6E23FE4D6A4DB1259454076172829B000E33F06483481225A45402905DD5ED218E33F27A5A0DB4B5A4540632B685A6265E33F3196E99788594540FCFD62B664D5E33FC0AF912408594540679C86A8C21FE53F8B8D791D7158454012876C205D6CE53FD74E948444584540A3409FC893A4E53FEF1EA0FB72584540E1421EC18D94E53F10AD156D8E5945404D4D8237A4D1E53F1B13622EA95A454093E52494BE90E53FC9FFE4EFDE5B454092955F0663C4E53F1AA54BFF925C45405E8429CAA571E53F1F48DE39945D454015A8C5E0615AE53F5AF2785A7E5E45402DEE3F321D3AE53F63D4B5F63E5F454070B20DDC813AE53FAB2006BAF65F45401EFE9AAC518FE43F08008E3D7B604540BBEF181EFBD9E43FAB3DEC8502624540FB5C6DC5FE32E53FB360E28FA2624540C3B986191A4FE53F4B3E761728634540386744696FF0E43FE998F38C7D634540A4880CAB78A3E43FA7AD11C138644540A12E52280BDFE43F9A44BDE0D3644540BCE9961DE21FE53F147B681F2B66454090BFB4A84F72E53F7009C03FA56645407711A6289746E53F9835B1C057684540062CB98AC56FE53F5CAFE941416945401D1EC2F8695CE53F4241295AB9694540A857CA32C431E53FE3A59BC4206A45402E58AA0B7819E53F35ED629AE96A454066868DB27E33E53FB3976DA7AD6B45403D4679E6E5B0E53F52B648DA8D6C45406493FC885FB1E53F3B6EF8DD746D4540637AC2120F28E63FCA17B490806D4540CF66D5E76AABE63FABCE6A813D6E4540AE11C138B874E73F3B342C465D6D4540D9B3E7323589E73F76FA415DA46C4540B24B546F0DECE83F05C078060D6B4540113AE8120E3DE93F2009FB76126B45401840F850A2A5E93FAED4B320946B45409EEA909BE106EA3F7C6473D53C6B4540B4E386DF4DB7EA3F732CEFAA076A45406346787B1002EB3F9FC9FE791A6A4540F4F8BD4D7F76EB3FB1FB8EE1B16945409CE1067C7E98EB3F9E4143FF046945407CB438639813EC3F1EDE73603968454003EFE4D3635BEC3FE76F42210268454081ECF5EE8FF7EC3FCA4E3FA88B664540A393A5D6FB0DED3FE62494BE10664540083E062B4EB5ED3FB1E07EC003654540938AC6DADF59EE3F965E9B8D95664540164F3DD2E0B6EE3F50AA7D3A1E674540A7406667D13BEF3FF98381E7DE654540CCB8A981E673EF3F29B4ACFBC7644540A1D79FC4E7CEEF3F4969368FC3644540B0CA85CABF16F03FEE3F321D3A654540B03DB324404DF03F116F9D7FBB644540A5DDE8633EA0F03F44F7AC6BB464454048A30227DBC0F03F3D9AEAC9FC6345401BD7BFEB3327F13F753C66A032644540E5EFDE516342F13F488C9E5BE8644540A8565F5D1568F13FCD3E8F519E634540B0AF75A911BAF13F1B649291B36245401D3A3DEFC6C2F13F3B1BF2CF0C6245402272FA7ABEE6F13F3BFF76D9AF614540965D30B8E60EF23FA795422097604540C85C19541B1CF23F679B1BD313604540A438471D1D17F23FE36F7B82C45E45403E75AC527A26F23FDE736039425E45400F9A5DF75624F23F66A4DE53395D454050C58D5BCC8FF23F6EA5D766635B4540EC34D25279BBF23F76FA415DA45A4540B60E0EF62606F33FED4ACB48BD5B4540F833BC598377F33F4CC631923D5C4540D575A8A624ABF33F0BEBC6BB235D4540226DE34F54F6F33FA0FCDD3B6A5C4540F3203D450E11F43FCFA0A17F825B4540A8C821E2E654F43F07B7B585E75B45407633A31F0D67F43FE6B0FB8EE15B45406E3315E29178F43F92E9D0E9795B4540F91400E319B4F43F537765170C5C45404D81CCCEA2F7F43F4CC79C67EC5B454098F8A3A83337F53FE75608ABB15C4540F4FC69A33A5DF53F7D3CF4DDAD5C4540DB6CACC43C6BF53F8B54185B085C454004AE2B6684B7F53FEF022505165C45409F93DE37BEB6F53F711DE38A8B5B4540E7A8A3E36AA4F53FAA81E673EE5A4540A3957B8159A1F53F6B2BF697DD594540514B732B84D5F53F2F36AD140259454024809BC58B05F63FC87DAB75E2584540E62494BE1032F63FA04E797423584540DD239BABE639F63F282CF180B2574540B8C83D5DDD31F63FE1455F419A55454019CBF44BC45BF63F452FA3586E554540787DE6AC4F79F63F9D9B36E334544540D9B5BDDD929CF63FE55FCB2BD753454065389ECF80BAF63F0DFFE9060A504540910BCEE0EFD7F63F567DAEB6624F45406326512FF8F4F63FD55DD905834D454003250516C014F73F24D236FE444D4540C382FB010F0CF73FD7F7E120214C45401D739EB12FD9F63F8940F50F224B454098FBE42840D4F63F1286014BAE4A454064B14D2A1AEBF63FB07614E7A8494540D238D4EFC216F73FF4C29D0B23494540F818AC38D51AF73F93DFA293A5484540B4226AA2CFC7F63F15E63DCE34474540247CEF6FD09EF63F39268BFB8F444540836C59BE2E03F73FCC7F48BF7D45454070EEAF1EF72DF73F473A03232F454540FF91E9D0E979F73F115663096B414540A662635E471CF73FCDE7DCED7A3F4540B1A4DC7D8ECFF63F4C38F4160F3F45400B613596B0B6F63F06BD3786003E4540B3B27DC85BEEF63F66DD3F16A23D4540BF47FDF50A0BF73FFB22A12DE73C454006BB61DBA20CF73FBB48A12C7C3B45400A2FC1A90F24F73F670DDE57E53A45409F7763416110F73FE0F25833323A45400438BD8BF723F73F1478279F1E394540EC67B114C917F73FF8FBC56CC9384540C5FEB27BF230F73FBC7A15191D384540384A5E9D63C0F73F6F2A52616C37454059A65F22DEFAF73FCF328B506C3745401BD82AC1E230F83F2E5393E00D37454092955F066344F83FEDD808C4EB364540558A1D8D437DF83F99B7EA3A543745405E81E84999D4F83F8CF84ECC7A374540B80375CAA3DBF83F698CD651D53845407E3672DD94F2F83FF8FF71C28439454033A6608DB3E9F83F06651A4D2E3A4540F73AA92F4BFBF83FDFE00B93A93A4540F46F97FDBA13F93FEA5A7B9FAA3A4540F46C567DAE36F93F1A33897AC13945409CC1DF2F664BF93FB8E68EFE97394540444DF4F92863F93F9B711AA20A3B45407D21E4BCFF8FF93F689604A8A93B45408DF161F6B2ADF93F4BC8073D9B3B45404563EDEF6C0FFA3F287E8CB96B3B4540060DFD135C2CFA3FEDB8E177D33B454052EDD3F19881FA3F4D4C1762F53B4540D3DC0A613596FA3F8E3F51D9B03C454092E68F696D9AFA3F53CBD6FA223F45402CB7B41A12B7FA3FA0FCDD3B6A404540897E6DFDF4DFFA3FBB253960573F4540D578E9263108FB3F37DF88EE593F4540228D0A9C6C43FB3FBB44F5D6C03E4540EECF4543C663FB3FB3B6291E173F45402D776682E19CFB3FBC04A73E904045409642209738B2FB3F44C2F7FE063F4540807EDFBF79F1FB3FDBC35E28603F4540A702EE79FE34FC3FDECA129D653E4540FA0CA837A3A6FC3F2BA391CF2B3E454072FE261422E0FC3F842D76FBAC3E4540193735D07C0EFD3F09707A17EF3D4540D4450A65E12BFD3F2FC4EA8F303E45409A43520B2553FD3F051555BFD23D4540BF0F0709517EFD3F9DF6949C133D454076FA415DA490FD3F4206F2ECF23B454002D9EBDD1FAFFD3F9E29745E633B45403A7AFCDEA6BFFD3F295B24ED463B454010B056ED9AD0FD3F61545227A03B4540B16F2711E1DFFD3F8B321B64923B4540F86D88F19A17FE3FD525E318C93A4540B18861873129FE3F06A1BC8FA33945400CCA349A5C4CFE3F99B7EA3A54394540FE5F75E44867FE3F48A7AE7C96394540132C0E677E75FE3FD09A1F7F69394540AA0EB9196E80FE3FE09D7C7A6C394540D40B3ECDC98BFE3FF8510DFB3D39454015191D9084BDFE3FE197FA7953394540F4531C075EEDFE3FC45E28603B3A4540EEB3CA4C69FDFE3F0DFFE9060A3A4540FB592C45F215FF3F5019FF3EE338454024253D0CAD0EFF3F46B58828263745404E9CDCEF5054FF3F89601C5C3A364540A7ECF483BA48FF3F774B72C0AE344540D3F544D7855FFF3F5589B2B7943345402C47C8409E5DFF3F1F69705B5B32454082AE7D01BD70FF3F166C239EEC304540698D4127848EFF3F4AF1F109D92F4540B5E21B0A9FADFF3FECFA05BB612F45402ECA6C9049C6FF3F73F7393E5A2E45401407D0EFFB1700404CA60A46252D4540842BA0504F1F0040D09D60FF752C4540AA436E861B300040E9818FC18A2D4540F41ABB44F5760040F70489EDEE2D4540F4E0EEACDD9600402997C62FBC2E454038BC202235AD0040E2E5E95C512E4540DE0033DFC1AF004079CA6ABA9E2E45401BF4A5B73FB700408978EBFCDB2F4540BD73284355EC004010E9B7AF03314540FE2C9622F9EA0040F390291F82324540CA6DFB1EF5F7004091D442C9E4324540744694F606FF0040DB8651103C344540992EC4EA8F100140D4D347E00F35454009E066F1624101403A3E5A9C31364540FD12F1D6F957014093C3279D48364540C616821C947001409831056B9C354540348639419B9C01403ACC971760354540BBB7223141CD01400951BEA085364540F9F36DC152DD0140572250FD83364540B3EDB43522F8014045D95BCAF9364540DB519CA38E0E0240CF6A813D2638454061E124CD1F530240950ED6FF39364540605AD427B9630240D15D1267453645409CBF0985087802402B6D718DCF364540C70F9546CC8C0240CB2BD7DB66364540037D224F928E0240B345D26EF435454088BB7A15199D02403ACC971760354540FE7DC68503C102404487C09140354540FDBE7FF3E2C40240FC17080264344540EA42ACFE08E30240B5C5353E933345407F4B00FE291503403080F0A144334540BF27D6A9F23D0340BEDBBC715232454014AE47E17A7403402E043928613245407026A60BB17A03403DD52137C331454011E15F048D790340C72E51BD35304540FA7ABE66B98C0340498446B0712F45402EABB019E0A20340A65F22DE3A2F45400936AE7FD7A7034092205C01852E4540456458C51BB9034040DEAB56262E4540E52A16BF29CC034039268BFB8F2C454000E1438996DC0340C898BB96902B454086AA984A3F01044069C36169E02B45402F51BD35B035044090DB2F9FAC2A4540DE9046054E56044040BFEFDFBC2A4540242BBF0CC66804403E5A9C31CC2B4540F5BA4560AC6F0440E561A1D6342D45405D6A847EA67E04406D7022FAB52D454011514CDE00B30440603DEE5BAD2D4540CD3E8F519EB904404F1E166A4D2D4540155454FD4AE70440745FCE6C572C45407F33315D8835054076FC1708022C45402BDEC83CF247054097C9703C9F2B4540658EE55DF5600540D07CCEDDAE2B4540438EAD67086705402DE8BD31042C4540D1EB4FE27367054044A4A65D4C2D4540B4AA251DE5600540902E36AD142E45402592E865144B0540B325AB22DC2E4540950ED6FF394C0540A1832EE1D02F454067B8019F1F460540F9872D3D9A304540138255F5F23B0540CADDE7F868314540E10CFE7E315B05407AE40F069E3145401BDA006C40640540E542E55FCB3345403D7C9928428A0540E1CFF0660D344540909E228788BB0540F392FFC9DF3545400F7C0C569CCA0540A3EA573A1F364540520ABABDA4D10540749A05DA1D36454026C808A870040640EF6FD05E7D3645409F1EDB32E00C0640338D261763364540F6B4C35F931506405E4A5D328E354540C91D3691992B06409E5F94A0BF344540FCE25295B638064040F9BB77D43445407C6473D53C47064002D880087135454019FED30D14580640EC51B81E853545400917F2086E6406404F0647C9AB3545403F8EE6C8CA6F0640963FDF162C374540A988D349B67A0640BABDA4315A3745401ADEACC1FB8A064020B41EBE4C384540E1F1ED5D839E0640E73A8DB4543845408044132862B10640978C63247B3A454013EF004F5AB8064090F8156BB83A4540F8A8BF5E61C10640C767B27F9E3A45409833DB15FAE00640024A438D423A4540D7BD158909EA06402C82FFAD643B4540213D450E11F70640317898F6CD3B4540D042024697170740C6151747E53A45407ADE8D05852107403AEAE8B81A3B45402E03CE52B23C07402FE065868D3A4540D07EA4880C4B074026361FD7863A4540454948A46D5C07401EC022BF7E3A4540E7E26F7B826407400612143FC63A4540B6D9588979760740D3A0681EC03C4540C6C1A563CE930740D76D50FBAD3D4540299831056BBC07400169FF03AC3B45405A9BC6F65AD00740624D6551D83B454080828B1535D8074000A94D9CDC3B454049111956F1E607403673486AA13C45402060ADDA350108403750E09D7C3C4540E8A04B38F4160840F12A6B9BE23B4540265305A3921A0840AB7823F3C83B4540A6D3BA0D6A3F08406344A2D0B23C4540BDA772DA53520840D449B6BA9C3C454082E673EE765D084016C3D501103B45404D4A41B7977408403D450E113739454053211E8997870840D5CE30B5A5384540734BAB21718F08404CDE0033DF374540BB473657CD930840DF516342CC374540E6779ACC789B084055F7C8E6AA374540A5DAA7E331A3084089981249F43645405073F22213B008400C21E7FD7F364540F086342A70D2084059F8FA5A9736454079EBFCDB65DF0840433BA759A03745402025766D6FF70840F9484A7A18384540BDC799266CFF0840E8F527F1B93745405C21ACC6121609409D11A5BDC1374540D333BDC45826094063997E89783745400CAEB9A3FF6509407D3F355EBA374540A4A7C821E2660940D1B01875AD3745408BFED0CC934B09405F7AFB73D1364540321F10E84C5A0940126A865451364540D15790662C5A0940F5F411F8C3354540C39FE1CD1A5C0940D2C26515363545403ECDC98B4C40094027F73B140534454042B456B4394E0940A530EF71A6334540CC99ED0A7D500940AF264F594D33454015A8C5E0613A0940A1F65B3B51324540B08EE3874A4309405F9A22C0E93145404DBED9E6C6540940A4703D0AD7314540359BC761303F094019541B9C88304540E7DF2EFB75470940CD5B751DAA2F45405F251FBB0B5409403ED00A0C592F4540E99C9FE238500940AA2C0ABB282E45403387A4164A660940E2395B40682D4540A45181936D800940B35F77BAF32C45406CD097DEFE7C0940C652245F092C4540FB743C66A092094028F4FA93F82A4540ACCABE2B829F0940CF842689252B4540D2C8E7154F9D0940D5963AC8EB2B45409CA8A5B915A209400150C58D5B2C454075CDE49B6DAE094060EAE74D452C454001857AFA08BC0940A988D349B62C4540F8A75489B2D70940C075C58CF02C454033FB3C4679E60940A5164A26A72C4540B49080D1E5ED094085CE6BEC122B45404D2F3196E9F7094045D95BCAF92A45400282397AFCFE094001A1F5F0652A4540D38558FD11060A4016325706D52A4540FCC3961E4D150A40DA56B3CEF82A45408F537424971F0A40431EC18D942B454013D4F02DAC3B0A40E4857478082B454006499F56D13F0A40D7DF12807F2A4540CCEB884336700A406F63B323D5294540F2ED5D83BE740A40AC38D55A98294540881057CEDE790A402387889B53294540A1F2AFE5958B0A40B8CA13083B2945408274B169A5900A4008CBD8D0CD284540F2ED5D83BE740A40452E3883BF274540FA27B85851630A401E6D1CB116274540D9EE1EA0FB520A401CD13DEB1A2745402D5E2C0C91530A40DFDDCA129D25454026C45C52B55D0A400A2B1554542545406D8C9DF0125C0A40800D881057244540D591239D81510A40362383DC452445400C5872158B3F0A4050DF32A7CB244540861DC6A4BF370A40221B48179B2445401764CBF275390A4067EDB60BCD234540F73FC05AB54B0A40349E08E23C22454008910C39B63E0A40B4942C27A1204540DEAF027CB7190A40D731AEB83820454006103E9468090A40FA7B293C68204540BEF8A23D5E080A40CB2E185C731F45404B033FAA611F0A40DAFE9595261F4540EE056685221D0A406EF9484A7A1E4540F225547078010A4026FBE769C01E45407EC51A2E72EF0940A0C37C790120454082C8224DBCE309402579AEEFC31F45404F779E78CED60940AE47E17A14204540C190D5AD9ED30940DC4AAFCDC61E4540433866D993C00940E99D0AB8E71D45409F008A91259309408AADA069891F4540732D5A80B67509402463B5F97F1F4540C2120F289B7209401BF5108DEE204540A72215C616620940BAF605F4C22145402D944C4EED4C09405DA79196CA2145403D65355D4F3409409FE3A3C519214540DD94F25A091D0940A8A78FC01F204540BAF3C473B600094074D4D171351E454021E7FD7F9CF00840488787307E1C4540CAA5F10BAFE4084041295AB9171A4540077DE9EDCFE508402CBAF59A1E164540390B7BDAE1EF0840E78A5242B0124540FCC401F4FBFE08409D2CB5DE6F104540043A93365517094060764F1E16104540E4BB94BA641C0940AB7B6473D50E4540009013268C260940EF1D3526C40E454081B2295778370940EDF483BA480F4540D5EDEC2B0F52094048C153C8950E45404E9D47C5FF5D0940DCF3FC69A30E4540357A3540696809407DE6AC4F390E45401FDB32E02C6509409BE3DC26DC0D454003B5183C4C5B0940079ACFB9DB0D4540EF39B01C21630940643C4A253C0D4540F8E12021CA7709403CF4DDAD2C0D4540BFEFDFBC38910940FEB8FDF2C90A45401764CBF27599094060AFB0E07E0A4540EC89AE0B3F9809409C51F355F20945401C42959A3DB00940904946CEC20845406682E15CC3AC0940952BBCCB45084540471CB28174B109400D36751E15074540BB6070CD1D9D0940E107E753C70645401FF818AC38950940CC26C0B0FC054540236937FA988F09402B306475AB03454077499C1551930940B686527B110145405531957EC29909404A9BAA7B64FF4440B37E33315DA809409AEAC9FCA3FD4440BA4A77D7D9B0094010B056ED9AFC44409A97C3EE3BC60940B7B585E7A5FC44400BD28C45D3D90940B4226AA2CFFB4440D2C43BC093D6094003B5183C4CFB44408F6E844545DC0940AAB9DC60A8F9444082A966D652C0094000ADF9F197F8444000E48409A3B9094094DBF63DEAF744408D5DA27A6BC009407B87DBA161F744400E1478279FBE0940E90FCD3CB9F64440F4A3E194B9B909407D9752978CF54440E7FEEA71DFAA0940C782C2A04CF544406CEA3C2AFEAF0940B42094F771F44440F486FBC8ADA9094074B7EBA529F44440F38DE89E75AD0940827170E998F34440D8D47954FC9F0940124DA08845F244407808E3A7718F09409414580053F24440FC170802648809409450FA42C8F1444080D4264EEE770940377007EA94F144405299620E826E09405EA0A4C002F044403677F4BF5C6B0940FB96395D16EF4440C84274081C490940892650C422EE44409DD497A59D3A0940FF9600FC53EE44409737876BB527094068041BD7BFED444053094FE8F5270940E25817B7D1EC4440BCC96FD1C91209401D1EC2F869EC44404CC79C67EC0B09409163EB19C2EB4440EC681CEA770109406C06B8205BEC44408675E3DD91F1084014B4C9E193EC444056F146E691DF0840CC7C073F71EC4440444E5FCFD7CC084011FDDAFAE9EB4440FBB0DEA815A608406C94F59B89E94440BB473657CD9308404701A260C6E8444076A8A624EB90084039605793A7E84440751E15FF77840840E370E65773E64440287FF78E1A730840CC988235CEE44440098CF50D4C6E0840132D793C2DE54440A7255646235F084003999D45EFE444406FD8B628B36108407E1AF7E637E444408BC22E8A1E58084050A8A78FC0E34440C362D4B5F63E08401FBC7669C3E344407C6308008E3D08401092054CE0E244409E60FF756E1A0840950C0055DCE24440E8A04B38F4160840C4D155BABBE24440F37684D382F70740377007EA94E144408D9AAF928FDD074021020EA14AE144405A9BC6F65AD007400B26FE28EAE04440C3A04CA3C9C507404819710168E0444025EA059FE6A4074078B471C45ADE444000529B38B99F07408DF161F6B2DD4440CB2DAD86C47D0740855CA96741DC4440ADF6B0170A78074014EB54F99EDB4440D07EA4880C4B074026AAB706B6DA44403C2F151BF33A0740A05225CADEDA4440EF3A1BF2CF2C0740C45E28603BDA44400AA2EE03901A0740B33F506EDBD94440F94A2025760D074006DA1D520CDA4440CBD6FA22A1ED06405111A7936CD94440B37C5D86FFD406402A711DE38AD94440E146CA1649BB0640E4D70FB1C1D844404F7974232CAA06400A67B796C9D84440295C8FC2F5880640EE0912DBDDD74440D3BF249529860640C84109336DD74440B3CD8DE9096B0640D595CFF23CD6444045D95BCAF9620640732B84D558D644404B02D4D4B25506402106BAF605D6444037161406653A06403B35971B0CD34440B83D4162BBFB054023A12DE752D2444023145B41D3D20540983270404BD14440B5DD04DF34BD054008008E3D7BD04440AB7823F3C89F0540FFAECF9CF5CF4440D9B11188D79505403A7AFCDEA6CF4440D270CADC7C830540145AD6FD63CF4440D99942E7357605407D7555A016CF44407FBDC282FB61054022C32ADEC8CE4440A933F790F05D054058FE7C5BB0CE444081CEA44DD51D05407C0C569C6ACD4440DE76A1B94EC30440CB85CABF96CB444060B1868BDC930440F6083543AACA444036EA211ADD410440295C8FC2F5C84440BA4DB857E62D044068EBE0606FC84440BEF90D130D120440FA60191BBAC744400B96EA025EE6034000C45DBD8AC6444059C4B0C398B403400533A6608DC544401327F73B146503401E6FF25B74C24440BC04A73E905C034041800C1D3BC24440D9942BBCCB450340965CC5E237C14440DFA5D425E33803401024EF1CCAC044403B8F8AFF3B02034056F2B1BB40BF4440454AB3791CC60240DF3312A111BE4440D447E00F3F5F02402A1DACFF73BC4440B680D07AF8520240BE33DAAA24BC444088F37002D329024097FF907EFBBA4440B1524145D50F0240DDE9CE13CFB94440AEB7CD5488070240CDCAF6216FB944406DC7D45DD9E50140E1F1ED5D83B64440EDD79DEE3CD1014042959A3DD0B4444065726A67989A01408D5F7825C9B144406B0C3A21749001408509A359D9B04440EC1681B1BE810140191D90847DAF4440931D1B81787D01401E6CB1DB67AF444024D40CA9A27801402C9E7AA4C1AF44404084B872F66E0140B2BB404981AF44401E8CD82780620140E59997C3EEAD4440C075C58CF0360140220038F6ECAB44402C7DE882FA36014079B130444EAB4440D671FC5069440140D253E41071AB4440020D36751E350140B8AD2D3C2FA94440E5982CEE3F320140FC8A355CE4A84440F8A6E9B3032E01405628D2FD9CA84440185C7347FF2B01403108AC1C5AA8444089B2B794F32501408C9FC6BDF9A74440D7338463961D01407E5182FE42A74440460BD0B69A150140B0045262D7A644401C261AA4E00901407B849A2155A6444039D6C56D34000140F0A5F0A0D9A544407AE063B0E2F40040F1B73D4162A5444090D8EE1EA0DB0040CC5EB69DB6A444401D3EE94482C900409B560A815CA44440873254C554BA0040132A38BC20A44440810A47904AB10040D9EBDD1FEFA34440A5F8F884EC9C004070067FBF98A3444007978E39CF98004049A12C7C7DA344401AFD6838658E004059198D7C5EA34440F3AB394030870040909F8D5C37A34440FCA9F1D24D820040992CEE3F32A34440247CEF6FD05E0040F3E7DB82A5A24440EDF483BA4841004083C0CAA145A24440AA27F38FBE290040369204E10AA244402158552FBF130040B77D8FFAEBA1444089EC832C0B0600403FC8B260E2A14440A83AE466B8C1FF3F1EA5129ED0A14440382EE3A6065AFF3F77D9AF3BDDA1444001A777F17E1CFF3F36E49F19C4A144401973D712F2C1FE3F645930F147A144406308008E3D7BFE3FFB0626378AA04440C136E2C96E66FE3F0B630B410EA04440A6457D923BECFD3FA0C6BDF90D9F4440D3C08F6AD8AFFD3FC83F33880F9E4440B0C91AF5100DFD3F247EC51A2E9E44402783A3E4D5B9FC3F96D05D12679D44408E5C37A5BC96FC3FCC41D0D1AA9C44405245F12A6B1BFC3FBAF59A1E149C4440F816D68D7707FC3F3ECE3461FB9B444072FA7ABE6679FB3F0762D9CC219B44404B5AF10D854FFB3F5307793D989A4440FED30D147827FB3FEC884336909A444051A3906456EFFA3FF9669B1BD3994440AD50A4FB39C5FA3FAB3FC23060994440B62E35423F53FA3F96B4E21B0A9944401AFB928D071BFA3FBBB9F8DB9E984440FC8A355CE4DEF93FF48AA71E699844408DF161F6B2ADF93F969350FA42984440DD7BB8E4B813F93F98A59D9ACB974440D3D85E0B7A6FF83F1631EC30269744401BD82AC1E230F83F1E34BBEEAD9644402B86AB0320EEF73FEF3CF19C2D96444016C09481035AF73F3BAA9A20EA94444092EA3BBF2841F73FB8921D1B819444401844A4A65D0CF73F9947FE60E09344409700FC53AA84F63F68E6C935059244400E2C47C8405EF63FDD7D8E8F169144406BF294D5743DF63F5C01857AFA9044400B0C59DDEAF9F53F663046240A9144403BC8EBC1A478F53F960854FF20904440B75ED3838212F53FA1D80A9A96904440E3FDB8FDF2C9F43F6058FE7C5B904440FB5C6DC5FE72F43FD5CC5A0A488F44400536E7E09950F43FD122DBF97E8E444040A6B5696C2FF43F6876DD5B918E4440D0B7054B7501F43F506D7022FA8D4440D1B01875AD7DF33F103FFF3D788D444054FCDF11152AF33F2638F581E48B44404759BF9998EEF23F2C9E7AA4C189444006BD378600E0F23F232C2AE274884440999A046F48E3F23FDAAA24B20F884440E1B4E0455FC1F23F289CDD5A268744401DC9E53FA49FF23F91990B5C1E87444050C58D5BCC8FF23FEC1681B1BE8744401E15FF774485F23F50E1085229884440906802452C62F23FD671FC506988444016A6EF350447F23F38D906EE40894440E141B3EBDE0AF23F1EE0490B97894440F0A31AF67BE2F13F834E081D74894440A6B73F170D59F13F81EA1F443288444064E76D6C7624F13F9D2CB5DE6F88444060B01BB62DCAF03FEE08A7052F884440172EABB01960F03F800C1D3BA8864440CF9F36AAD341F03F23F8DF4A76864440919DB7B1D911F03F4E64E60297854440BC3E73D6A79CEF3FD717096D39854440179CC1DF2FE6EE3F14B1886187834440AB77B81D1A16EE3F1C98DC28B2804440A6D590B8C7D2ED3F35ED629AE97E4440AE635C717154ED3F04711E4E607E444089B14CBF44BCEC3F93E52494BE7C4440580394861A05EC3F278925E5EE794440F0C16B97369CEB3FA8C7B60C3879444044300E2E1D73EB3F30682101A37744403123BC3D0881EA3FBDA772DA5374444070ED44494824EA3FAAB706B64A7244402828452BF782E93FF1BBE9961D704440BABF7ADCB75AE93F21205F42056F4440A08CF161F6B2E83F02F4FBFECD6D444028999CDA19A6E83FAF5FB01BB66D44406C7BBB253960E83F2FF7C951806C4440223999B85510E83F1AC39CA04D6C44405133A48AE2D5E73F5AF624B0396B44400F5F268A90BAE73FC9CC052E8F694440F1D8CF622992E73F512E8D5F786944409696917A4F65E73F651A4D2EC6684440BC3FDEAB56A6E63F7C0BEBC6BB674440E3C3EC65DB69E63F03931B45D66644406DE34F5436ACE63FCCD24ECDE564444017B83CD68C0CE73F2DCC423BA763444093DFA293A556E73F0C8FFD2C96624440D4D17135B2ABE73F9279E40F06624440ED2B0FD25364E83F490F43AB936144409355116E32AAE83F4AEB6F09C0614440D0B9DBF5D214E93FC6F99B5088624440C251F2EA1C03E93FDEE522BE136344406E6AA0F99CBBE83FD2E4620CAC6344407EFCA5457D92E73FAEF36F97FD6444409E9ACB0D86BAE73F8718AF79556544408F8AFF3BA242E83F22C7D63384654440D8614CFA7BA9E83FA92F4B3B3565444071AB2006BAF6E83F9A0B5C1E6B6444409FE579707756EA3FA43330F2B25E4440B4E386DF4DB7EA3F6CCEC133A15D44407D23BA675DA3EB3FB4E6C75F5A5C44409DA1B8E34DFEEB3F527E52EDD35D4440319A95ED435EEC3F33FCA71B285C4440D7DF12807F4AEC3F037AE1CE855B4440A6D24F38BB35EC3FE8154F3DD25A4440B39943520B25EC3F7973B8567B5A4440B64C86E3F90CEC3FAD1402B9C45944408B54185B08F2EB3FBEA4315A47594440081C0934D8D4EB3FF54883DBDA584440BA9F53909F8DEB3F06F1811DFF574440749A05DA1D52EB3FFD14C78157574440FB1EF5D72B2CEB3F910E0F61FC564440B4E386DF4DB7EA3F7923F3C81F56444035F0A31AF67BE93FED82C1357754444023DDCF29C84FE93F2FC37FBA815444408E06F0164850E93F363AE7A738544440187B2FBE688FE83F4DF8A57EDE5244402635B401D800E83FF2B1BB4049514440999EB0C403CAE73F5BCEA5B8AA5044403C3080F0A1C4E73FEDD808C4EB5044406728EE7893DFE73F15AB06616E514440C68503215940E73F1805C1E3DB5144407689EAAD81ADE63FF0DAA50D875144405C1E6B460639E63F73A25D8594514440221807978E39E53F6F7F2E1A32504440774A07EBFF1CE43FF2B0506B9A4F444066F6798CF24CE33FB77EFACF9A4F4440DF37BEF6CC92E23F8C84B69C4B4D44407EC34483143CE13F029A081B9E484440BB0CFFE9060AE13FA643A7E7DD46444074ED0BE885BBE03FD40CA9A27845444079E57ADB4C85E03F77F86BB246434440B6F5D37FD67CE03FAF3E1EFAEE424440DFC5FB71FB65E03F06D49B51F341444026C808A87004DF3F390EBC5AEE3C44407D586FD40AD3DD3F29B4ACFBC73A444051BEA085048CDD3F410C74ED0B3A4440F67F0EF3E505DD3FF73C7FDAA8384440362383DC4598DC3F8E1EBFB7E9374440B188618731E9DB3FADF886C2673544405708ABB184B5DA3FBD19355F25334440E4310395F1EFD93F984F560C572F4440651D8EAED2DDD93F5342B0AA5E2E4440603DEE5BAD13DA3F4F9143C4CD2D44405C1B2AC6F99BD93F78B6476FB82D44403562669FC728D93F397CD289042D44404084B872F6CED83F56BC9179E42B44405A12A0A696ADD83F5DA8FC6B792B444082AD122C0E67D83F51C1E105112B4440772FF7C95180D73F29B16B7BBB29444079944A7842AFD63FD3FA5B02F0274440F9484A7A185AD63FC44142942F264440F48C7DC9C683D53F30BABC395C254440EDBAB7223141D53F7F1475E61E2444400ED76A0F7BA1D43F5C5837DE1D234440D49B51F355F2D33F64ADA1D45E224440598638D6C56DD33F38F6ECB94C21444011DF89592F86D23F1FD7868A71204440B9A7AB3B16DBD13FF8174163261F444040321D3A3DEFD03FC5FEB27BF21A44409DF3531C075ED03F4510E7E1041A4440EC18575C1C95CD3F8448861C5B19444053793BC269C1C93FA1681EC022174440CC5D4BC8073DC73FA52E19C748144440C1E61C3C139AC43F00A94D9CDC0F444028EE7893DFA2C33F76711B0DE00D444093382BA226FAC23FB03907CF840C4440EFAA07CC43A6C23FD5777E51820A44409015FC36C478C13FF5A10BEA5B0A44402C2E8ECA4DD4C03F1361C3D32B09444088D7F50B76C3BE3FEB909BE106084440BE1589096AF8BA3FA94C310741074440C408E1D1C611B73F1899805F23074440A661F8889812B53F12DC48D9220744401E15FF774485AA3FBDFDB968C804444098FBE4284014A43F69FD2D01F8014440E34F5436ACA99C3F4EF04DD367FF4340BF4692205C01953F3352EFA99CFC434087FE092E56D4903F6ADE718A8EFC43401D91EF52EA92813F723447567EFB4340D1ADD7F4A0A0643FE8BE9CD9AEF843404832AB77B81D5A3F4704E3E0D2F74340000000000000000076E107E753F74340B020CD58349D6DBF629D2ADF33F6434060730E9E094D72BFF46F97FDBAF54340B2632310AFEB77BFC310397D3DF54340AAEE91CD55F37CBF9B20EA3E00F54340D17AF832518484BF5628D2FD9CF44340279F1EDB32E09CBF2618CE35CCF243407B6649809A5AA6BF685DA3E540F143409C4F1DAB949EB1BF3411363CBDEE43405C59A2B3CC22B4BF978DCEF929EE43406C0723F609A0B8BFA27DACE0B7EB4340D0D1AA967494BFBFBA313D6189E74340726E13EE9579C3BF49F59D5F94E243407A56D28A6F28C4BF4CA4349BC7E14340EA0775914259C4BFE7ABE46377E1434014D044D8F0F4C4BFC24CDBBFB2E04340102043C70E2AC5BF8672A25D85E04340B6D8EDB3CA4CC5BFC634D3BD4EE043402FE1D05B3CBCC5BF1348895DDBDF434079CDAB3AAB05C6BF136058FE7CDF43407BF5F1D077B7C6BFFCFF3861C2DE43400EA14ACD1E68C7BFB3D1393FC5DD43409A07B0C8AF1FC8BFB29B19FD68DC4340F052EA92718CC8BFD2E5CDE15ADB4340CC24EA059FE6C8BF520DFB3DB1DA4340018A9125732CC9BFE61E12BEF7D9434041834D9D47C5C9BF8330B77BB9D743404E469561DC0DCABFDE91B1DAFCD54340FC19DEACC1FBCABFFBB1497EC4D343406F4562821ABECBBF340EF5BBB0D34340817687140324CCBF30BC92E4B9D24340B6BA9C121093CEBFC5C9FD0E45D1434088F71C588E90D0BF971DE21FB6CE4340B5A4A31CCC26D1BF4FE61F7D93CC4340E753C72AA567D1BFEEAF1EF7ADCA4340156F641EF983D1BF9D4A06802ACA4340037976F9D687D1BFA52F849CF7C943407AFB73D190F1D1BF69705B5B78C84340632992AF0452D2BFC07971E2ABC743400EA48B4D2B85D2BFA38FF98040C74340035E66D828EBD2BFECF7C43A55C64340878C47A98427D3BFA723809BC5C54340C784984BAAB6D3BF342F87DD77C4434073D9E89C9FE2D3BF3D2CD49AE6C3434096438B6CE7FBD3BF7AC7293A92C34340A3ACDF4C4C17D4BF8D7E349C32C34340AFE94141295AD4BFE700C11C3DC24340E82E89B3226AD4BF1FF64201DBC1434043AD69DE718AD4BF9850C1E105C14340A986FD9E58A7D4BF5FECBDF8A2BF4340CB694FC939B1D4BFC1C8CB9A58BE4340BBD39D279EB3D4BF1AE1ED4108BE43405B9544F64196D4BFA2EE0390DABA43400875914259F8D4BFA87004A914BB434099D87C5C1B2AD5BF8350DEC7D1BA43403A083A5AD592D4BFC87BD5CA84B94340CA1649BBD1C7D4BF9A42E73576B943402BC24D469561D5BF69AB92C83EB84340A38FF9804067D5BFF52D73BA2CB6434070D234289A07D4BF2FDE8FDB2FAD43407427D87F9D9BD2BF5F96766A2EA7434049F3C7B4368DD1BF4ACE893DB4A343406919A9F7544ECFBFF54883DBDA9C4340FF3EE3C28190CCBF21904B1C7998434012BF620D17B9CBBFC4EBFA05BB974340CC7F48BF7D1DCCBFDFA46950349743400135B56CAD2FCEBF59A65F22DE964340813E912749D7CEBF7C2AA73D25954340BEF90D130D52CEBF5B3FFD67CD914340465F419AB168CCBF72512D228A8D4340892650C42286C9BFD270CADC7C874340D34CF73AA92FC7BFFC8D76DCF0834340ABEAE5779ACCC2BF1669E21DE07D4340A5BF97C28366C1BF8DD2A57F497C4340FAEE5696E82CC1BFF778211D1E7C4340228D0A9C6C03C1BF755AB741ED7B4340EFC7ED974F56C0BFB9FE5D9F397B4340490ED8D5E429BFBF40DD4081777A4340E222F77475C7BEBF4C3448C1537A4340BBF1EEC8586DBEBFFD69A33A1D7A434047AB5AD2510EBEBF06F1811DFF794340A779C7293A92BBBF5AA0DD21C57843401ADF1797AAB4B1BFEF1EA0FB727443407B6649809A5AA6BF3DB7D0950872434012D89C836742A3BFE7DF2EFB75714340D847A7AE7C9697BF2D0B26FE28704340DF516342CC2585BF4EF04DD3676F4340E0F2583332C88D3FC2120F289B6E4340E2B034F0A31A963FCF11F92EA56E43408E5BCCCF0D4DA13FCDB1BCAB1E6E4340F6083543AA28A63FF1BBE9961D6E4340473B6EF8DD74AB3F020F0C207C6E43407380608E1EBFB73F5C3AE63C636D4340605B3FFD67CDBB3FC93EC8B2606C43407286E28E37F9BD3F74EE76BD346B4340E89FE062450DC03FF6083543AA6A43408FC2F5285C8FC03FD9B5BDDD926A4340B1C05774EB35C13F7BDAE1AFC96A4340EFAA07CC43A6C23F7BDB4C85786A434028EE7893DFA2C33F47382D78D1694340C495B377465BC53F718E3A3AAE6843406B9E23F25D4AC93FD272A087DA6643405055A1815836C93F6E162F1686664340EB538EC9E2FEC73FFA0D130D52664340ACE3F8A1D288C73F1B2C9CA4F9654340E1EEACDD76A1C73F84B9DDCB7D6443401BDA006C4084C83F325706D5066343400553CDACA580CA3FA62A6D718D614340BF45274BADF7CB3F2861A6ED5F614340D2A92B9FE579CC3F840D4FAF94614340771211FE45D0CC3F994869368F5F4340E7E104A6D3BACD3FC8B60C384B5F43400BF148BC3C9DCD3FD15CA791965E4340CE1951DA1B7CCD3F3E5A9C31CC5D4340CC4065FCFB8CCB3FC19140834D5D43404833164D6727CB3FEF1AF4A5B75D4340B4E89D0AB8E7C93FD597A59D9A5D434022C495B37746C93F9487855AD35C434028D368723106C83F52B648DA8D5C4340A3CEDC43C2F7C63F39807EDFBF5B4340AF97A608707AC53FA52C431CEB5A4340634337FB03E5C43FC9E88024EC594340B519A721AAF0C33FEA758BC0585943404C88B9A46ABBC33FAC1A84B9DD57434028EE7893DFA2C33F1CB28174B15743409B3924B55032C33F18B0E42A16574340EFAA07CC43A6C23F2DB4739A05584340FA43334FAE29C03F4966F50EB7574340006F8104C58FBD3FD4B837BF61564340FA08FCE1E7BFBB3FC4E9245B5D564340B7990AF148BCB83F5FCE6C57E85543407E569929ADBFB53F1CEA77616B5443403691990B5C1EB33FC136E2C96E52434044FB58C16F43B43F19AA622AFD504340B79BE09BA6CFB23F5C5837DE1D5143406F0ED76A0F7BB13FD4282499D55143405EF23FF9BB77AC3F68EC4B361E524340B22C98F8A3A8A33FD3122BA39151434045BA9F53909F9D3F8E3A3AAE465043400C5872158BDF843F1E335019FF504340EB1C03B2D7BB8FBFC1711937355043404F75C8CD70039EBFF8C610001C4F43407B6649809A5AA6BF121615713A4D43403AAE4676A565ACBF594C6C3EAE4B434058FFE7305F5EB0BF00A94D9CDC494340FC7266BB421FB0BF18CDCAF6214943407BC1A7397991A9BF397F130A1148434077103B53E8BCAEBFCEC4742156474340FA7B293C6876B1BFD064FF3C0D464340CC2A6C06B820B3BFFFCEF6E80D454340327381CB63CDB8BF5A0D897B2C434340BE4C1421753BBBBFD3A414747B4343401A53B0C6D974BCBF478E74064644434055682096CD1CC2BF0E315EF3AA4443404A7EC4AF58C3C3BFF163CC5D4B4443407A51BB5F05F8C4BF0282397AFC424340691D554D1075C5BFA67D737FF54243408A1F63EE5A42C6BF51DB8651104243400B410E4A9869C9BF99D9E731CA414340CD936B0A6476CCBF310C5872154143405C3CBCE7C072CEBF45D61A4AED3F43405358A9A0A2EAD0BF2657B1F84D3F434011FE45D09849D3BF3BFF76D9AF3D434035B39602D2FED5BF03CFBD874B3A43408D9C853DEDF0D7BFB5FCC0559E384340526518778368D8BFF4A96395D23743405532005471E3D8BF2F88484DBB3643407E39B35DA10FD9BF0113B87537354340CC441152B7B3D9BF054D4BAC8C344340F6B2EDB43522DABFE3FA777DE6304340444E5FCFD72CDABFAAD55757052E434077BE9F1A2FDDD9BF5B41D3122B2D4340E8DA17D00B77DABFA4FE7A85052D4340AC38D55A9885DBBF1EE1B4E0452D43400BD3F71A82E3DBBF779E78CE162E434040F7E5CC7685DCBFC1C8CB9A582E43407EE36BCF2C09DFBF060FD3BEB92B4340C5E74EB0FF3ADFBFA439B2F2CB2A43406005F86EF3C6DFBF2A1BD654162B43409CFA40F2CE21E0BF5A83F755B92A4340377172BF4351E0BF4DF564FED12943400056478E7486E0BF25ADF886C2274340FD4D2844C0A1E0BF0CAEB9A3FF254340B343FCC3969EE0BF064B75012F2343404A24D1CB2896E0BF8099EFE027224340C712D6C6D889E0BFE10CFE7E31214340E96168757286E0BF522AE109BD204340EDD808C4EB7AE0BFA9A5B915C21E4340F2272A1BD654E0BFECDFF599B31C4340705D3123BC3DE0BF014EEFE2FD1A4340DB334B02D454E0BF28B7ED7BD41943409D103AE8128EE0BF6DE7FBA9F118434030BABC395C2BE1BF6118B0E42A1843400C04013274ECE1BF1A31B3CF63184340CE716E13EE15E2BFAF97A608701843405F5CAAD216D7E2BF8C81751C3F1843405FB4C70BE9F0E2BF7B2DE8BD31184340EBFF1CE6CB0BE3BFADC266800B18434066F4A3E19439E3BF4FE960FD9F174340AA436E861B70E3BF24F0879FFF1643400070ECD97399E3BFE82D1EDE7316434034F6251B0FB6E3BF6AA67B9DD41543404E0E9F7422C1E3BFDD7C23BA67154340B9FC87F4DBD7E3BF7D93A641D1144340C2BD326FD5F5E3BFC03DCF9F36144340F88A6EBDA607E4BFE8120EBDC513434064E8D841252EE4BFE030D12005134340F226BF45274BE4BF3B8F8AFF3B124340BF805EB87361E4BFBADA8AFD65114340F81A82E3326EE4BF2DEDD45C6E10434038A1100187D0E4BF0E30F31DFC0643402E3883BF5FCCE4BFF4C0C760C5034340F86EF3C649E1E4BF4AED45B41D0343408C6A11514CDEE4BF5D8B16A06D014340823B50A73CBAE4BFFB2477D844004340297AE063B0E2E4BF2639605793FF4240D6FCF84B8BFAE4BFB4722F302BFE4240280B5F5FEB52E5BF1B6327BC04FD42402D5BEB8B84B6E5BF280CCA349AFC424003CDE7DCEDFAE5BF9BC937DBDCFC4240AF230ED9403AE6BF5646239F57FC4240E04DB7EC107FE6BF7BBE66B96CFA42400A6AF816D68DE6BF6B0C3A2174F842407BF65CA626C1E6BFCDE49B6D6EF842402D7AA702EEF9E6BFE8F527F1B9F7424069519FE40E1BE7BF280EA0DFF7F542409B1DA9BEF30BE7BF7D3CF4DDADF44240AD8905BEA25BE7BF3EAE0D15E3F44240AB92C83EC8B2E7BF19726C3D43F442405DC30C8D2702E8BF446B459BE3F242401633C2DB8310E8BF577C43E1B3F142401D007157AF22E8BFC366800BB2EF4240E1CFF0660D5EE8BF1E520C9068EE4240FA6184F06863E8BFA6B915C26AEC42403694DA8B683BE8BF3ACD02ED0EE94240D1E638B709F7E7BFB2D991EA3BE54240410FB56D1805E8BF63B323D577E44240CA3159DC7FE4E7BF0FEECEDA6DE342404DD6A88768F4E7BF3737A6272CE342402BC24D469561E8BF3E20D099B4E54240AEBA0ED59464E8BF81AFE8D66BE64240F9DA334B02D4E8BF2448A5D8D1E84240594C6C3EAE0DE9BF67F0F78BD9E842401C295B24ED46E9BF11DF89592FE84240B95510035D7BE9BFB6847CD0B3E742402522FC8BA0B1E9BFC5C6BC8E38E642404B00FE2955A2E9BF4D86E3F90CE44240CB13083BC52AEABF083C3080F0E1424069C9E369F981EABFDF313CF6B3E042404969368FC3E0EABF9B3924B550E04240B894F3C5DE0BEBBF2579AEEFC3DF4240950D6B2A8B42EBBF55A0168387DD4240A8E507AEF284EBBF0E66136058DC4240A0A9D72D0263EBBFAE4A22FB20DB42406BB933130CE7EABF9D9E776341D942403108AC1C5A64EABFFA7B293C68D64240EEB25F77BAF3E9BF55A2EC2DE5D44240FBB0DEA81526E9BF5FD0420246D3424019ABCDFFAB0EE8BFAE64C74620D242402AC423F1F2F4E7BFA0F99CBB5DD14240CF11F92EA5AEE7BF2524D236FED0424033FCA71B2870E7BFAE10566309D14240624CFA7B293CE7BFC53D963E74D14240D9CC21A98512E7BF4CA60A4625D34240F4FE3F4E9830E7BFCBDAA6785CD44240D769A4A5F276E7BF2F6AF7AB00D54240E947C3297373E7BF95F3C5DE8BD5424031D28BDAFDAAE7BF373465A71FD84240B306EFAB72A1E7BFACC77DAB75D84240178046E9D23FE7BFA69883A0A3D54240EDF318E59997E6BF3D9B559FABD142406E179AEB3452E6BF1DE8A1B60DD1424071AE6186C613E6BF9DF529C764D1424097CADB114E0BE6BFD2C2651536D14240DFFDF15EB532E6BF6495D233BDD042407E1EA33CF372E6BF0ABFD4CF9BD042401F662FDB4EDBE6BF2524D236FECE4240DD5CFC6D4F10E7BF9561DC0DA2CD4240C32B499EEB7BE7BF68AF3E1EFACC424084D382177D05E9BFDC63E94317CC424020D1048A5844E9BF236AA2CF47CB42408F72309B00C3E9BFE0F60489EDCA4240D80DDB166536EABFE4A08499B6C94240FB7953910AE3EABF0E2DB29DEFC9424000917EFB3AF0EABFD503E62153CA424009A4C4AEEDEDEABF2FFCE07CEACA4240134548DDCE3EEBBFCF84268925CB4240772B4B749659EBBF03098A1F63CA4240E65B1FD61BB5EBBFEB387EA834CA4240D5B14AE999DEEBBFDBDFD91EBDC94240685DA3E5400FECBF2D40DB6AD6C94240FFAF3A72A433ECBFCC0C1B65FDC842403ECBF3E0EEACECBF742497FF90C842404D69FD2D0178EDBFABE80FCD3CC74240FE62B6645504EEBF3659A31EA2C74240E2ADF36F977DEEBF6458C51B99C74240FE7F9C3061B4EEBF2638F581E4C7424077BF0AF0DD66EEBF5E4C33DDEBC84240463F1A4E999BEEBF3A57941282C9424098BD6C3B6D0DEFBF45D7851F9CC942408944A165DD3FEFBFBC5CC47762CA4240E02C25CB4928EFBF096F0F4240CC4240C5AA4198DBBDEFBFBDFDB968C8CC4240D5963AC8EBC1EFBF30BDFDB968CC42406EA46C91B49BEFBF6C257497C4CB4240675F79909EA2EFBFA41CCC26C0CA4240CCB73EAC37EAEFBF452A8C2D04CB4240DA3A38D89B18F0BFC6151747E5CA4240F94CF6CFD340F0BFA4C2D84290C94240EBC4E5780562F0BF938B31B08EC942406286C613419CF0BF982F2FC03ECA42409E978A8D79DDF0BF58569A9482CA4240172CD505BC0CF1BFD316D7F84CCA42403E3F8C101E2DF1BF18096D3997CA4240314278B47184F1BF8FE046CA16C9424005C1E3DBBBC6F1BFB6300BED9CC84240B24B546F0DECF1BF1BA19FA9D7C742406CCD565EF2FFF1BF207F69519FC64240DD9733DB15FAF1BFE945ED7E15C642402CB81FF0C0C0F1BFCB4752D2C3C44240F1D8CF6229D2F1BFFA980F0874C442408A5759DB140FF2BFFD6662BA10C542409F91088D60A3F2BF705E9CF86AC542403E0455A357C3F2BFCD76853E58C64240B3D2A41474BBF2BF640795B88EC74240A165DD3F16E2F2BF4145D5AF74C84240BE6BD097DE3EF3BFA9A3E36A64C94240D9E89C9FE278F3BFCEA623809BC9424060CAC0012D9DF3BF145AD6FD63C9424012DC48D922A9F3BF2C9E7AA4C1C942407CB60E0EF6E6F3BFAB9509BFD4C9424093DFA293A516F4BF29CB10C7BAC842404D11E0F42E1EF4BF768C2B2E8EC84240B3791C06F317F4BF69739CDB84C74240486DE2E47E47F4BFFCC8AD49B7C742401AFCFD62B664F4BFA88C7F9F71C74240C7BC8E386483F4BF952710768AC74240022CF2EB8798F4BF377172BF43C74240111956F146A6F4BF7B698A00A7C74240F8510DFB3DF1F4BF65C5707500C84240AC55BB26A435F5BFD9EBDD1FEFC7424036902E36AD54F5BF7E5182FE42C742402E3C2F151B73F5BF9A94826E2FC742401492CCEA1DAEF5BFFFB3E6C75FC64240FDFA213658F8F5BF12C2A38D23C442402E55698B6B3CF6BF9D64ABCB29C342402C7DE882FA56F6BFE00F3FFF3DC2424090BFB4A84F72F6BF62BEBC00FBC04240CF656A12BCE1F6BF9B3924B550C04240D40AD3F71A42F7BFA3224E27D9BE4240BF9A03047374F7BF0C01C0B167BD4240C959D8D30E7FF7BF8F8AFF3BA2BC42406EF9484A7A98F7BFD00EB8AE98BB42407E74EACA67B9F7BFC158DFC0E4B84240705D3123BCBDF7BFC6A4BF97C2B742407670B03731A4F7BFA70705A568B742405F0839EFFFA3F7BF7CF0DAA50DB74240E4C0ABE5CECCF7BF1171732A19B6424055A1815836F3F7BFB2B96A9E23B64240C91D3691990BF8BF4A27124C35B742409D2E8B89CD47F8BF73D712F241B7424087DD770C8F7DF8BFB29C84D217B642401E6E8786C5A8F8BF9F05A1BC8FB542404208C89750C1F8BF12C0CDE2C5B442405073F22213F0F8BF55DD239BABB44240A06EA0C03BF9F8BF6D59BE2EC3B3424044E048A0C126F9BF11AB3FC230B442408446B071FD3BF9BFF9BD4D7FF6B3424038143E5B0747F9BFDC0E0D8B51B34240F4A78DEA7460F9BFCE893DB48FB342401F2C6343377BF9BFB534B74258B3424045F295404AACF9BFC39E76F86BB24240ECDADE6E49CEF9BF8D9B1A683EB1424023658BA4DDE8F9BFF05014E813B142408C69A67B9D14FABFF1811DFF05B04240D107CBD8D04DFABF3A747ADE8DAF4240CB2C42B11574FABFAFCE31207BAD4240D2E4620CACA3FABF31444E5FCFAD42405BE9B5D958C9FABFBB2BBB6070AD42401F2E39EE940EFBBF643DB5FAEAAA4240D8BB3FDEAB56FBBF55850662D9A64240E1968FA4A487FBBF079ACFB9DBA54240718DCF64FFFCFBBFE2E5E95C51A24240689604A8A925FCBF529CA38E8EA14240840D4FAF9465FCBF3BC8EBC1A49E42404301DBC188BDFCBFB398D87C5C9D42408C683BA6EECAFCBF611C5C3AE69C4240BF60376C5BD4FCBFC26A2C616D9C42408928266F80D9FCBF87E123624A9C4240AEF199EC9FE7FCBF4A9BAA7B649B42403D9CC0745AF7FCBF0F0F61FC349A4240CEFA9463B2F8FCBF8B4E965AEF994240FC8D76DCF0FBFCBFCB10C7BAB8994240B96E4A79AD04FDBFD0D03FC1C59842401669E21DE009FDBF8A93FB1D8A984240533D997FF40DFDBF8A5A9A5B2198424076DD5B919820FDBF1E4FCB0F5C97424033C51C041D2DFDBF92AE997CB395424034F5BA45602CFDBF9679ABAE43934240A164726A6758FDBF9FCC3FFA268F42408ECEF9298E83FDBF3E5A9C31CC8D42405182FE428F98FDBF8751103CBE8B42401EFF05820099FDBF200A664CC18842403C670B08ADC7FDBF1C06F357C88642407E5182FE42CFFDBF6AA67B9DD4854240205D6C5A2904FEBFE3AAB2EF8A8442405B9544F64116FEBF485167EE21834240FD4B5299620EFEBF317898F6CD814240705CC64D0D34FEBF5DDE1CAED58042405A8121AB5B3DFEBF5DF92CCF837F42405A10CAFB385AFEBFF1D58EE21C7F424066DAFE959566FEBFD00B772E8C7E4240AA0A0DC4B259FEBF85CD00176479424067B62BF4C172FEBF8E5C37A5BC784240DCF3FC69A37AFEBF562AA8A8FA7742401343723271ABFEBFF9BEB854A5774240F30181CEA4CDFEBF1B66683C11784240CC7B9C69C2F6FEBF6B9F8EC70C784240AAD4EC815620FFBFE7543200547742409DF6949C137BFFBF7E00529B387342400E492D944C8EFFBFDB15FA60197342401B9B1DA9BEB3FFBF793C2D3F70734240EB56CF49EFDBFFBFBF49D3A068724240CF11F92EA5EEFFBFA81E69705B7142400DC68844A10500C07B32FFE89B7042407E350708E60800C0768D96033D6E42408B6CE7FBA9F1FFBF1D740987DE6C4240ADF71BEDB80100C0E9818FC18A6B4240992EC4EA8F1000C0206118B0E46A42408F554ACFF43200C004AA7F10C96A4240A7E7DD58505800C05298F738D3684240EED11BEE237700C0F20703CFBD674240AB7823F3C87F00C0C1AA7AF99D664240AA454431798300C039984D8061634240BDC282FB01AF00C064575A46EA614240164F3DD2E0D600C0B610E4A084614240A930B610E4E000C0E126A3CA30604240AC1BEF8E8CF500C0952710768A5F424045A165DD3FF600C0E6E786A6EC5E4240FD3383F8C0EE00C09B90D618745E4240753C66A032FE00C033E02C25CB5D4240630E828E561501C0DC48D922695D424066683C11C43901C092E9D0E9795D4240978E39CFD85701C0C4E8B985AE5C42400070ECD9737901C06C06B8205B5C424073A087DA368C01C05F7B6649805C4240CA4FAA7D3A9E01C0FACF9A1F7F5D424026FDBD141E1402C01AF9BCE2A9654240EF01BA2F675602C0D9D138D4EF684240492A53CC419002C0904946CEC26A42406649809A5AD602C0952D9276A36B42403620425C39DB02C0FE7BF0DAA56B42400ADB4FC6F8F002C05227A089B06B42402C47C8409E3D03C04BB1A371A86942407E8E8F16676C03C05F43705CC6674240BF49D3A0689E03C08DB62A89EC694240F6083543AAC803C0A2B3CC22146B42409A266C3F19E303C0B81D1A16A36A42409E7AA4C16DED03C01CCEFC6A0E6A42402A55A2EC2D0504C0AD6C1FF2966942409FE8BAF0833304C0AE8383BD89694240FC8EE1B19F4504C02635B401D8684240FE9DEDD11B6E04C076FA415DA4684240295B24ED467F04C012F5824F73684240D80FB1C1C28904C0DBA4A2B1F667424062156F641E9904C0CB4DD4D2DC664240DD7A4D0F0ACA04C0D2E5CDE15A634240444FCAA486D604C06F0C01C0B1614240DA006C4084D804C0C68B8521726042408E3A3AAE46F604C0D1B2EE1F0B5D4240747E8AE3C02B05C062BB7B80EE59424041649126DE4105C0AEF204C24E594240BEBD6BD0975E05C0F437A110015942404913EF004F7A05C09818CBF44B584240B6696CAF059D05C00CCD751A69574240C93846B247C805C06B8313D1AF5742402DB308C5561006C0D388997D1E5742402CB64945632D06C0B03DB324405742404E452A8C2D6406C026C45C52B559424041481630817B06C0BEA1F0D93A5A4240D047197101A806C0749A05DA1D5A424023A298BC01C606C0BBF2599E075942400B43E4F4F5DC06C0F96706F1815942402DEA93DC611307C0EF91CD55F35C424008C89750C14107C02D08E57D1C5F4240207A5226355407C05437177FDB5F424023F3C81F0C5C07C0D655815A0C6042400A815CE2C86307C0CAFE791A30604240DBF813950D6B07C01230BABC396042402C465D6BEF7307C028999CDA19604240AE2990D9599407C0EC8497E0D45F424088BD50C076D007C04583143C855E424019575C1C95DB07C026C79DD2C15E42402F35423F53EF07C024986A662D5F42405C9198A0860F08C0A96A82A8FB5E4240696E85B01A2B08C01FF7ADD6895F42407FA0DCB6EF3108C0770FD07D395F42400394861A854408C023BA675DA35F424047904AB1A39108C0A320787C7B5F4240F850A2258F0709C0BC7A15191D6042401D041DAD6A2909C030D7A205685F4240286211C30E4309C09C525E2BA15F4240FCFD62B6645509C04C378941605F4240EB538EC9E27E09C043572250FD5F424061342BDB879C09C06CEA3C2AFE5F4240CF30B5A50EB209C078D49810735F42407EFCA5457DD209C0172EABB019604240207BBDFBE3DD09C093E1783E0360424013B9E00CFEFE09C090A1630795604240427A8A1C222E0AC0F645425BCE5F4240D7D9907F66700AC0664F029B735E42407D5EF1D4238D0AC0A5F8F884EC5E42402541B8020AB50AC01633C2DB835E42406B6116DA39CD0AC08E5A61FA5E5D4240745C8DEC4AEB0AC049D576137C5B42409869FB57561A0BC00E30F31DFC5A4240ADBEBA2A502B0BC063450DA6615A42406954E0641B380BC03563D174765A4240F6D4EAABAB420BC0922232ACE259424099D87C5C1B4A0BC07FBDC282FB594240C76647AAEF5C0BC09529E620E85842405DC47762D68B0BC011346612F5584240A8380EBC5AAE0BC0B87361A417594240EA9788B7CEBF0BC060AE450BD0584240D7DD3CD521D70BC03620425C3959424091B6F1272A1B0CC074081C09345C42400281CEA44D350CC0ADC090D5AD5C424042CC2555DB4D0CC0A704C4245C5C4240DB87BCE5EA670CC00BD3F71A825B424072DD94F25A890CC00742B280095C42403F19E3C3ECA50CC0494C50C3B75C4240E9D66B7A50D00CC01AA37554355F424052D4997B48F80CC046240A2DEB5E4240FA0E7EE2001A0DC086E5CFB7055F4240207C28D192470DC082E673EE765F42402D42B115346D0DC05B0C1EA67D5D42402AE27492AD8E0DC0EBA9D557575D4240ADA580B4FFA10DC049BDA772DA5D42409279E40F06BE0DC08A7269FCC25D424086048C2E6FCE0DC083A62556465D4240871A8524B3DA0DC0FD69A33A1D5C424061FE0A992BE30DC0452C62D8615C4240A67B9DD497E50DC02F35423F535D4240F0FB372F4EFC0DC0CF126404545E42401A3048FAB40A0EC0CC7C073F715E4240B7B585E7A5220EC0984F560C575D4240C45E28603B380EC01E6FF25B745E4240CF81E50819480EC0C6BE64E3C15E4240E8667FA0DC560EC098DA5207795F42403AE97DE36BAF0EC06BD8EF8975604240CF85915ED4CE0EC03DD4B6611460424056478E7406E60EC076A4FACE2F6042409FCC3FFA260D0FC0910E0F61FC5E4240B14E95EF19490FC065DF15C1FF5E4240B9FB1C1F2D4E0FC06C21C841095F424015747B4963540FC0BD378600E05E424008CBD8D0CD5E0FC01CD2A8C0C95E4240B7D4415E0F660FC097C62FBC925E4240A60EF27A30690FC0ED48F59D5F5E42405778978BF86E0FC07D03931B455E424089981249F4720FC09F20B1DD3D5E424090A1630795780FC0BAA46ABB095E42404C55DAE21A7F0FC03AADDBA0F65D424093FDF33460900FC09772BED87B5D4240FFCEF6E80D970FC081785DBF605D424094FB1D8A029D0FC04CE0D6DD3C5D4240070C923EADA20FC0F3035779025D42404CA8E0F082A80FC055BFD2F9F05C42404241295AB9B70FC0E333D93F4F5D42404C1B0E4B03BF0FC04DBC033C695D424048C2BE9D44C40FC0861E317A6E5D4240F168E388B5D80FC0E085ADD9CA5D42406D567DAEB6E20FC0551344DD075E4240CB845FEAE7ED0FC089EB18575C5E4240BDA8DDAF02FC0FC0423EE8D9AC5E424054573ECBF30010C0BD8FA339B25E4240B3B6291E170510C095D8B5BDDD5E4240D5264EEE770810C04E4354E1CF5E424036ACA92C0A0B10C0207EFE7BF05E424013B9E00CFE0E10C06FF1F09E035F4240B401D880081110C03FA7203F1B5F4240B2497EC4AF1810C0DFC14F1C405F424006BB61DBA21C10C0164ED2FC315F42403160C9552C1E10C07497C459115F4240EBC4E578052210C05D52B5DD045F4240C05DF6EB4E2710C09C4D4700375F4240A988D349B62A10C097E13FDD405F424044DFDDCA123D10C0AB3E575BB15F424009371955865110C031B3CF63945F42403CBEBD6BD06710C06729594E425D4240C5387F130A7110C0D8463CD9CD5C4240300F99F2218810C08A7615527E5C4240494BE5ED08A710C00893E2E3135C424082E7DEC325B710C0BCCD1B27855B4240FEB5BC72BDED10C07C7BD7A02F5B424010768A55830011C035ED629AE95A4240EF1CCA50152311C09E29745E635B42409BFF571D394211C08DCF64FF3C5B42402EFEB627485C11C046EF54C03D5B424053EC681CEA6711C05395B6B8C65B4240C6BFCFB8709011C015C5ABAC6D5C4240B3EC4960739E11C0F2D24D62105C4240BA6B09F9A0A711C07E5704FF5B5B424029AE2AFBAEA811C0C576F700DD5B4240B3CD8DE909AB11C05F605628D25B4240E789E76C01B111C038328FFCC15A4240E6B1666490BB11C09B92ACC3D1594240C74CA25EF0C911C0C66D3480B7564240B3B45373B9D111C09CA5643909554240A8E2C62DE6E711C07288B8399552424099F04BFDBC0912C037E15E99B74C4240F7AE415F7A0B12C0255B5D4E094C4240191F662FDB0E12C0705B5B785E4C4240F5D89601672912C063804413284A424045D5AF743E3C12C0BD395CAB3D4A42407349D576135C12C0247B849A2149424003D19332A97112C0D6355A0EF44642409D499BAA7B8412C001BEDBBC714242409697FC4FFE8E12C090A0F831E64042405280289831A512C00C207C28D1404240B438639813B412C015C5ABAC6D404240B587BD50C0C612C0CDE9B298D83E42403D7E6FD39FED12C054707841443E4240FC3905F9D90813C001F9122A383E424001DC2C5E2C6C13C01A53B0C6D9404240CBF27519FEA313C013D731AEB8404240228D0A9C6CB313C00E677E350740424004FF5BC98EBD13C01686C8E9EB3F42408F34B8AD2DCC13C0315F5E807D3E4240D9D0CDFE40E913C01E5036E50A3D424012BD8C62B90514C0A0353FFED23A4240FFB27BF2B02014C072DEFFC7093B4240724EECA17D3C14C0280F0BB5A6394240B61490F63F5014C00473F4F8BD39424099D36531B16914C0BAA46ABB093842407901F6D1A97B14C0A1A3552DE9364240CA1AF5108D8E14C02383DC4598364240DAA84E07B29E14C03737A6272C354240C4793881E9A414C0A228D027F23442400454388254AA14C03A419B1C3E354240486B0C3A21B414C0FBCA83F41435424044300E2E1DD314C0E92ADD5D673142406E8B321B64E214C07233DC80CF2F4240CEDF844204FC14C06CCCEB88432842403563D174760215C0FD87F4DBD72742404298DBBDDC0715C01553E9279C274240D2E4620CAC1315C0DB3521AD312642402AFEEF880A1515C03080F0A144254240ACC5A700181F15C035B742588D234240A8ACA6EB892E15C0280F0BB5A61F42403563D174763215C06C956071381F4240EE5A423EE83915C096B4E21B0A1F4240BBB4E1B0344015C05587DC0C371E424022718FA50F4D15C0AD86C43D961A42403370404B575015C0D270CADC7C194240B988EFC4AC5715C016BEBED6A516424041F163CC5D5B15C0766C04E275134240E3FC4D28446015C02BA5677A891342404D4C1762F56715C014B1886187134240C32D1F49496F15C0B8AE9811DE144240139A2496947B15C0DFFAB0DEA8154240EA2285B2F08515C09E280989B4154240C34483143C8515C079909E228716424004029D499B8A15C0130A1170081742403DF19C2D209415C08483BD89211742407007EA94479715C0C826F911BF164240A48B4D2B85A015C01A868F8829174240978E39CFD8A715C0D7A3703D0A1742402C67EF8CB6AA15C0D3F885579216424079793A5794B215C0CD3B4ED1911642400C022B8716B915C0369204E10A16424027A3CA30EEC615C0027FF8F9EF1342402387889B53C915C0CC26C0B0FC1142406C4084B872C615C0DACA4BFE27114240A8E3310395C115C00EF5BBB035114240F435CB65A3C315C0888384285F104240F12BD67091BB15C0C3F01131251042405B24ED461FC315C07CB5A338470F42402B4F20EC14BB15C0EFE6A90EB90D4240F5824F73F2C215C069C6A2E9EC0C424085CE6BEC12C515C01B683EE76E0B42403866D993C0B615C03065E080960A424046459C4EB2B515C05227A089B0094240C4CE143AAFD115C04A6249B9FB0642407C293C6876DD15C088DA368C82064240425A63D009F115C0446B459BE306424031B5A50EF2FA15C0C26A2C616D064240AD1402B9C41116C0302AA913D0044240CE548847E22516C05C72DC291D044240977329AE2A4B16C0D5D006600302424073A087DA365C16C011902FA182014240FC5069C4CC6E16C09014916115014240334E4354E17F16C0D107CBD8D003424098309A95ED9316C06F2EFEB627064240957F2DAF5CBF16C0D40FEA228508424076F9D687F5C616C0081D7409870842403FAA61BF27D616C0F81C588E90074240E31B0A9FADE316C035423F53AF074240F20BAF2479EE16C08A7615527E084240A038807EDFFF16C01B9DF3531C09424029064834811217C0DF37BEF6CC0A42409F758D96031D17C02D5F97E13F0B4240A7052FFA0A2217C03D2828452B0B4240A4A99ECC3F2A17C07974232C2A0A4240D26EF4311F3017C0ADDF4C4C170A4240A5D93C0E833917C069FF03AC550B42404AEB6F09C03F17C0E947C329730B424098C11891284417C094C2BCC7990C4240711E4E603A4D17C00CB08F4E5D0D42407BA2EBC20F5E17C0B8B06EBC3B1042408C3045B9347E17C01288D7F50B1442404BE7C3B304A917C013B70A62A01742407EA99F3715B917C0CE37A27BD617424035F0A31AF6BB17C09CC1DF2F661742408940F50F22C917C0F7ADD689CB174240EA76F69507E917C02121CA17B4164240E5266A696E1518C03B56293DD317424092770E65A81A18C01BB80375CA174240C9737D1F0E2218C0CFBEF2203D174240BFD364C6DB2A18C0AD174339D1184240CAE1934E243818C021054F21571A42408753E6E61B5118C078094E7D201F4240B9162D40DB5A18C0041BD7BFEB214240B58D3F51D96018C0098A1F63EE224240787DE6AC4F6918C090DC9A745B244240E4874A23667618C05051F52B9D254240C9737D1F0E9218C0F1643733FA2542403BFF76D9AF9B18C0BE4C1421752742406D3B6D8D08A618C05D3123BC3D2A42404E7CB5A338A718C0EA03C93B872A42409225732CEFAA18C0419E5DBEF52B424050711C78B5AC18C01A4E999B6F2C42405A2BDA1CE7B618C0109370218F2E4240E2B034F0A3BA18C08F1A13622E2F4240C171193735C018C0E1D05B3CBC2F42407157AF22A3C318C07C9C69C2F62F42402E3BC43F6CC918C0C0EC9E3C2C30424065E3C116BBCD18C0B1506B9A77304240518369183ED218C0994A3FE1EC304240E63E390A10D518C0FF93BF7B4731424008AF5DDA70D818C070067FBF9831424014CFD90242DB18C0501C40BFEF31424033C2DB8310E018C07AE2395B40324240B16A10E676DF18C0386BF0BE2A334240D2FF722D5AE018C03929CC7B9C33424064ADA1D45EE418C07E18213CDA3442406553AEF02EE718C083A5BA8097354240289D4830D5EC18C07F129F3BC1364240BE310400C7EE18C0A2EC2DE57C374240E945ED7E15F018C079758E01D93742403480B74082F218C0F3AE7AC03C3842408BAA5FE97CF818C096236420CF3842406CCD565EF2FF18C01004C8D0B13942402CF3565D870A19C031242713B73C42406F1118EB1B2819C03A596ABDDF424240E6913F18782E19C0CFA0A17F824342401903EB387E3819C0384C3448C143424043908312663A19C050E1085229444240C90391459A3819C0CA1AF5108D444240C537143E5B2719C023D923D40C454240FB3E1C24442919C0FC6F253B364442406AA510C8251E19C02849D74CBE434240B9E2E2A8DC1419C063997E897841424068CF656A120C19C078280AF489404240DCF3FC69A30A19C0425E0F26C53F4240F06C8FDE700F19C05F24B4E55C3E424064CF9ECBD40419C0A3073E062B3C424072874D64E6F218C026A8E15B583B42401805C1E3DBEB18C0BC5983F7553B424063D1747632E818C096CFF23CB83B424020EC14AB06E118C06AA0F99CBB3B4240AFB48CD47BDA18C022C50089263C4240D8F2CAF5B6D918C01F0E12A27C3D42408E5A61FA5ED318C011E15F048D3D4240CB9D996038C718C01E1840F8503E4240FE62B66455C418C012F758FAD03F42408A3BDEE4B7B818C0CD91955F064142407C65DEAAEBB018C05DE2C803914142409CA8A5B915B218C017D522A29842424011C4793881C918C0AF946588634342401E882CD2C4CB18C045BDE0D39C4242406891ED7C3FD518C08A39083A5A4142402713B70A62E018C03A58FFE730414240452C62D861EC18C087E0B88C9B4042408A8EE4F21FF218C00C957F2DAF404240C619C39CA0FD18C05A46EA3D954142400A9FAD8383FD18C09B3924B55042424048A5D8D1380419C024D40CA9A24242401D59F965300619C0931E865627434240D732198EE70319C032384A5E9D434240EB1B98DC28F218C0EA92718C644342406EC328081EEF18C0AF5FB01BB64342408A5B0531D0E518C0E542E55FCB4742404434BA83D8E918C09ED0EB4FE2494240BFB5132521F118C0E5B512BA4B4A42408C101E6D1CF118C057D0B4C4CA4A4240A7EA1ED95CF518C00DC2DCEEE54A42401C7A8B87F7FC18C0BE310400C74A4240BBED42739D0619C0DFE2E13D074A4240771211FE451019C0FFE7305F5E4A4240FD1186014B1E19C035B22B2D234D42409BFF571D393219C047E350BF0B4F4240D65757056A4119C038328FFCC14E4240D65757056A4119C06A4B1DE4F54E4240D65757056A4119C0DEB06D51664F4240BE6BD097DE4E19C09964E42CEC4F4240D238D4EFC25619C0304B3B35974F4240E4A1EF6E655919C009C1AA7AF94F4240F450DB86516019C0A6EECA2E18504240A20A7F86376B19C077F700DD974F424051BB5F05F86E19C01FF30181CE4E4240F9DB9E20B18D19C0068195438B5042404391EEE7149419C0A38FF98040514240676490BB089319C0E674594C6C52424057B3CEF8BE9819C0DBA337DC47544240511212691B9F19C0C5AD8218E85442402B4D4A41B7A719C0C66D3480B7564240DFFB1BB457AF19C059164CFC51584240B262B83A00C219C0E0A128D0275C4240420A9E42AEC419C005DF347D765E4240902DCBD765B819C04D9EB29AAE5F42407E3B8908FFB219C0209A79724D5F424042CC2555DBAD19C0624ED026875F4240959EE925C6A219C0F5BBB0355B614240E9EDCF45439619C0E1455F419A61424065FD6662BA6019C01D7233DC806542409C1727BEDA6119C0E00F3FFF3D664240AF42CA4FAA7D19C004ADC090D5654240EBE2361AC08B19C01D1EC2F869664240B37C5D86FF9419C0B6114F76336742401BBCAFCA85CA19C0D2A92B9FE57342403716140665DA19C017105A0F5F764240B119E0826C091AC0B9FC87F4DB7B42402E1D739EB15F1AC0B806B64AB082424041D47D0052EB1AC0A471A8DF858B42401CEE23B726ED1AC0FCABC77DAB8B42404F1E166A4DF31AC0B0928FDD058C4240DC7F643A740A1BC0136058FE7C8D4240988A8D791D111BC0BFB9BF7ADC8D4240EE98BA2BBB301BC0168733BF9A8F42401C98DC28B2761BC05C02F04FA99242407FF78E1A13921BC00B0A83328D944240B62DCA6C90991BC0D1402C9B3994424025B03907CFA41BC00AF65FE7A69342403DD2E0B6B6B01BC0A053909F8D9442409F008A9125C31BC0EB6F09C03F95424030D5CC5A0AC81BC01344DD0720954240419E5DBEF5D11BC048E00F3FFF954240A391CF2B9EDA1BC0E7C589AF7696424034F5BA45601C1CC0B22E6EA3019A4240F4160FEF39301CC0A9143B1A879A4240423F53AF5B341CC0E1CFF0660D9A4240774B72C0AE361CC01A1A4F04719A4240D52478431A351CC0FB5DD89AAD9A4240070B2769FE381CC0103CBEBD6B9A4240512FF834273F1CC0A22424D2369A4240B0C56E9F55461CC0622EA9DA6E9A424059FAD005F59D1CC0CA4E3FA88B9A4240C8ED974F56EC1CC037E33444159A424016A4198BA6231DC0240B98C0AD994240950B957F2D3F1DC0C13BF9F4D8984240FC5580EF364F1DC09F76F86BB2984240EC4D0CC9C9541DC0E294B9F946984240D97C5C1B2A561DC01DE6CB0BB097424058E20165535E1DC03EEDF0D7649742400C5C1E6B46761DC07E552E54FE954240B134F0A31A861DC095490D6D009642406C787AA52C931DC0938E72309B964240E0F42EDE8F9B1DC099BA2BBB60964240E8BE9CD9AEA01DC038F6ECB94C97424074B2D47ABFA11DC027DBC01DA89742406CEC12D55BA31DC0EA42ACFE0899424083177D0569A61DC0B9347EE1959A424076E107E753A71DC02C2CB81FF09A4240CC63CDC820A71DC063B9A5D5909C424094F6065F98AC1DC087C43D963E9E42400E4C6E1459BB1DC023DDCF29C89F4240B515FBCBEEB91DC0096CCEC133A1424010B056ED9AB01DC0679E5C5320A342408A5A9A5B21BC1DC0D1E638B709A5424058E1968FA4C41DC0D367075C57A8424002D6AA5D13C21DC061FC34EECDA94240984F560C57C71DC085285FD042AC4240C26C020CCBBF1DC06CCD565EF2AD4240ABECBB22F8BF1DC067800BB265AF4240FF04172B6AC01DC04D9EB29AAEAF4240C6504EB4ABC01DC0AA7D3A1E33B04240ED6305BF0DC11DC0D4B837BF61B042405853591476C11DC04FE61F7D93B04240984D8061F9C31DC07F4E417E36B2424032E719FB92CD1DC02FC03E3A75B342403F389F3A56D91DC0552FBFD364B4424076FEEDB25FD71DC007D15AD1E6B44240C3482F6AF7CB1DC018EAB0C22DB542403410CB660EC91DC000016BD5AEB54240B34291EEE7D41DC0975643E21EB74240B5C4CA68E4D31DC02CBB6070CDB9424059FAD005F5DD1DC043705CC64DBB42405F5D15A8C5E01DC003603C8386BC424055F65D11FCDF1DC07D23BA675DBD4240B3EF8AE07FDB1DC0749A05DA1DBE42402D08E57D1CDD1DC02AFF5A5EB9BE4240E884D04197F01DC0529B38B9DFBF42405B5B785E2AF61DC0CFF9298E03C14240C3D7D7BAD4F81DC0274C18CDCAC24240DC82A5BA80071EC00B43E4F4F5C242406CD097DEFE0C1EC071A94A5B5CC3424021020EA14A0D1EC053E9279CDDC442403CBF28417F111EC0211E8997A7C54240D671FC5069141EC039B35DA10FC6424042B0AA5E7E171EC021787C7BD7C6424072F8A41309161EC0D236FE4465C742403CBF28417F111EC0F705F4C29DC74240B491EBA694071EC0569A94826EC742409702D2FE07081EC068CEFA9463C84240E17D552E540E1EC08DB454DE8EC84240404F0306490F1EC0BA84436FF1C842401A6EC0E787011EC0BF61A2410ACA4240F1BBE9961D021EC07769C36169CA42408061F9F36D011EC03D9E961FB8CA4240499C155113FD1DC039454772F9CB4240394206F2EC021EC0957F2DAF5CCD4240DE205A2BDAFC1DC0CBB9145795CD4240910E0F61FCF41DC0DC2BF3565DCD42407D3CF4DDADEC1DC08940F50F22CF4240E3344415FEEC1DC04721C9ACDECF4240452BF702B3E21DC0B83CD68C0CD0424080D591239DE11DC0E6CFB7054BD1424024D1CB2896DB1DC0427A8A1C22D2424070B4E386DFDD1DC0566133C005D34240153AAFB14BD41DC08E5C37A5BCD242404E2B85402ED11DC06B7F677BF4D242409B1F7F6951CF1DC073A087DA36D44240ABE97AA2EBD21DC06CEEE87FB9D4424058E36C3A02C81DC0D40D147827D54240E6913F1878CE1DC029B4ACFBC7D64240CCEF3499F1C61DC036AFEAAC16D84240D8614CFA7BC91DC04563EDEF6CD94240D55C6E30D4C11DC033C34659BFD942400588821953C01DC0F59ECA694FDB4240FCE07CEA58B51DC033E02C25CBDD4240282A1BD654B61DC05F97E13FDDDE424098FC4FFEEEAD1DC068E89FE062DF4240D06394675EAE1DC022A5D93C0EE14240A9D903ADC0A01DC0D95F764F1EE24240F22213F06B941DC0E5417A8A1CE24240226DE34F54761DC023A46E675FE54240C2189128B44C1DC053B0C6D974E8424058C6866EF6471DC0802DAF5C6FE942404E2844C021441DC0779FE3A3C5E942406E4C4F58E2411DC0271422E010EA4240B77EFACF9A3F1DC0E2CD1ABCAFEA424077DB85E63A3D1DC01327F73B14EB4240635FB2F1603B1DC02481069B3AEB4240A7ECF483BA381DC0EFCA2E185CEB424000CADFBDA3361DC0ED9C668176EB4240E82FF488D1331DC0CCB8A981E6EB4240A0FB7266BB321DC02FA699EE75EC42404F95EF1989301DC0658C0FB397ED4240960A2AAA7E251DC0C843DFDDCAEE4240CFF9298E031F1DC09F71E14048F04240D7A4DB12B9201DC00072C284D1F242402387889B53191DC0695721E527F34240ACFD9DEDD10B1DC0397F130A11F642403AE8120EBD051DC0DA3BA3AD4AF642406F29E78BBD071DC08869DFDC5FF742404089CF9D60FF1CC0D2C5A69542FA4240F9A3A833F7001DC04C7155D977FB424020F12BD670011DC0922232ACE2FB4240A54FABE80F0D1DC0BF0CC68844FD424083A7902BF5FC1CC0145CACA8C1FE42403E97A949F0F61CC0F41ABB44F5FE424049F4328AE5E61CC0F6EB4E779EFE4240C6A52A6D71DD1CC0118AADA069FF424019AA622AFDD41CC0E4326E6AA0FF424056B77A4E7ACF1CC0F5A10BEA5B0043401D8F19A88CBF1CC08CD8278062004340CF143AAFB1BB1CC0A01518B2BAFF4240580394861AB51CC0FDF675E09CFF42404D6551D845B11CC00B2593533BFF424033880FECF89F1CC01ADD41EC4CFF4240499D8026C2961CC021CB82893F0043406FD921FE618B1CC02385B2F0F5FF42401553E9279C7D1CC06CB41CE8A10043403E26529ACD831CC07100FDBE7F01434062BCE6559D851CC0596C938AC6024340F8DD74CB0E811CC0389F3A56290343402997C62FBC821CC0B726DD96C803434086747808E3771CC05BED612F14044340AE2AFBAE086E1CC0F7CC9200350543405DDDB1D826651CC0909E2287880543404B5AF10D855F1CC05B5EB9DE360543403D618907944D1CC027BC04A73E044340832F4CA60A461CC0D74E948444044340CC423BA759401CC0A0C552245F03434015C440D7BE401CC0812381069B0243403D27BD6F7C3D1CC03F52448655024340D61F6118B0341CC0DA756F4562024340BA6587F8872D1CC07847C66AF301434078B7B24467191CC0F38E53742403434020D3DA34B6071CC06631B1F9B8024340FB7953910A031CC027DD96C805034340D943FB58C1FF1BC061E3FA777D04434059C2DA183B011CC08B54185B080643409483D90418F61BC0BF0CC6884407434071917BBABAF31BC0857B65DEAA094340F6EE8FF7AAF51BC0328FFCC1C00B4340475854C4E9F41BC054C8957A160C434084F068E388F51BC0B0C56E9F550C4340478D093197F41BC052B648DA8D0C43409A43520B25F31BC0EA245B5D4E0D434037C2A2224EE71BC0E40F069E7B0D434006D7DCD1FFE21BC0B03A72A4330E434065FB90B75CDD1BC000C974E8F4104340A391CF2B9EDA1BC0F792C6681D114340E9EDCF4543D61BC0A167B3EA731143405BCF108E59D61BC0B7D26BB3B11243404DD9E90775D11BC0463F1A4E99134340A391CF2B9EDA1BC0630CACE3F813434039B4C876BEDF1BC0BEA085048C14434011A62897C6DF1BC0386BF0BE2A154340A391CF2B9EDA1BC0946C753925164340653909A52FD41BC0BE1248895D1743401AFD683865BE1BC02EE3A6069A19434005C3B98619BA1BC05B9A5B21AC1A4340AB048BC399BF1BC008AEF204C21A4340D1CFD4EB16C11BC076711B0DE01B43402E3BC43F6CC91BC0E9F010C64F1B434078EE3D5C72CC1BC0B7D5AC33BE1B4340AE8383BD89D11BC089EDEE01BA1B4340A391CF2B9EDA1BC0E0D91EBDE11A4340A0FB7266BBE21BC0C0CFB870201A434010919A7631ED1BC0A05225CADE1A43402367614F3BFC1BC0A5D76663251A4340CEFFAB8E1C091CC0EF535568201A4340CFA0A17F820B1CC028F38FBE491943409D64ABCB29111CC01B6327BC041943404A5E9D6340161CC0AD889AE8F317434001A777F17E1C1CC0B87878CF811743409BABE639222F1CC0BCE9961DE21743401212691B7F321CC0F243A51133174340C5C551B9893A1CC0E44BA8E0F016434025E99AC9373B1CC04CA4349BC717434011C5E40D30431CC046D09849D41743408ACA863595451CC097917A4FE5164340575F5D15A8551CC0022EC896E515434024456458C55B1CC0AF795567B5164340DC114E0B5E641CC0FB96395D16174340897AC1A739691CC0C5591135D1174340B32616F88A6E1CC06D58535914184340959D7E5017791CC0C6A52A6D711B4340651C23D923841CC0D717096D391D434036EA211ADD911CC0E21E4B1FBA1E4340DD0720B589931CC0ACCABE2B822143408A58C4B0C3981CC0A9893E1F65224340BC04A73E909C1CC01A1A4F0471224340022EC896E59B1CC086764EB34023434012FA997ADDA21CC0E2218C9FC6234340E99AC937DBAC1CC0E52B8194D82343401D1EC2F869AC1CC0581CCEFC6A2443402C616D8C9DB01CC0085740A19E244340580394861AB51CC01EA7E8482E25434031D3F6AFACC41CC090A4A487A1274340B79BE09BA6CF1CC04AF086342A2A434095607138F3FB1CC036954561172F4340F5BC1B0B0A131DC0F4C5DE8B2F32434011E0F42EDE1F1DC0632AFD84B33543400A82C7B7772D1DC0D80C7041B6364340D47E6B274A321DC0558671378836434023F94A2025361DC0D82E6D382C3743403C3080F0A1441DC083A3E4D5393843404A7A185A9D4C1DC07155D977453843408CDAFD2AC0571DC0931CB0ABC9374340D940BAD8B4521DC08D45D3D9C9384340EFAD484C50431DC094BF7B478D394340753E3C4B90411DC0E8323509DE3A434068B3EA73B5351DC0F0C34142943B43406571FF91E9301DC0C34659BF993C4340D464C6DB4A2F1DC0CEC47421563D434066D828EB37331DC05B28999CDA3D43403198BF42E63A1DC0E466B8019F3D434085EE92382B421DC0B308C556D03C434033FD12F1D6491DC0C2DCEEE53E3D4340F73C7FDAA83E1DC04982700514424340E7559DD5023B1DC0AD2F12DA72424340B2DAFCBFEA381DC0889FFF1EBC424340D1C952EBFD361DC01327F73B14434340B28174B169351DC08BC404357C434340F701486DE2341DC06D75392520444340EF8D210038361DC09B38B9DFA144434061527C7C42361DC0BB9BA73AE4444340321D3A3DEF361DC0406CE9D154454340828C800A47301DC0833463D1744643402F4E7CB5A3281DC0A9FA95CE8747434064CA87A06A241DC0CF328B506C494340C98FF8156B181DC0D32EA699EE494340B24B546F0D0C1DC00F0F61FC344C4340FEF2C98AE10A1DC09A5C8C81754C434015562AA8A80A1DC010E84CDA544D4340E36C3A02B8091DC0EFACDD76A14D43401BBCAFCA85FA1CC0ECF82F1004504340B1C1C2499AFF1CC0EC4E779E785043401EDC9DB5DB0E1DC066A032FE7D50434027327381CB131DC0D5CBEF3499514340BE66B96C740E1DC0EBFEB1101D5A434060B1868BDC031DC038BA4A77D75B434041834D9D47051DC0E124CD1FD35C43406A6D1ADB6B011DC0CF2C0950535D4340C806D2C5A6F51CC0556AF6402B5E434093AAED26F8E61CC0EBFD463B6E5E4340035FD1ADD7E41CC0D15CA791965E43401CB1169F02D01CC0B9DE3653216043408C868C47A9C41CC0F88898124962434006D671FC50A91CC0E179A9D898634340AD6BB41CE8A11CC0622EA9DA6E644340FE0C6FD6E09D1CC0BC581822A7654340700A2B1554841CC0C7F484251E6843400455A35703741CC02A745E63976843404912842BA0601CC032AA0CE36E68434069C878944A581CC08448861C5B6943409A27D714C84C1CC08B36C7B94D6C434079B0C56E9F451CC0B804E09F526D43406CCEC133A1291CC04EECA17DAC6E4340BD8FA339B2221CC013EF004F5A70434075E4486760241CC09C887E6DFD7043402F14B01D8C281CC0263ACB2C427143402E9276A38F291CC0A703594FAD72434098FBE42840341CC003D0285DFA73434079060DFD131C1CC033A48AE255764340C7D9740470131CC01C412AC58E7843404969368FC3F01BC08E3D7B2E537D4340A391CF2B9EDA1BC0AC55BB26A4814340BD0166BE83CF1BC0CC0C1B65FD824340A391CF2B9EDA1BC0AA4885B185844340A950DD5CFCDD1BC0B4E4F1B4FC84434033C005D9B2DC1BC044FB58C16F8543408F8B6A1151DC1BC0E8120EBDC5854340A391CF2B9EDA1BC0965F0663448643405473B9C150D71BC0B20DDC813A874340A391CF2B9EDA1BC0CE37A27BD687434016FC36C478ED1BC0728C648F508B43408AAC3594DAFB1BC07D08AA46AF8C4340FDBD141E341B1CC07A3881E9B48E43403E78EDD286231CC069519FE40E8F4340D1AFAD9FFE331CC07F2E1A321E8F43404912842BA0601CC004392861A68D43400B613596B0661CC096ED43DE728D434085D0419770681CC0E012807F4A8D434017618A72696C1CC072DF6A9DB88C4340AAEE91CD55931CC00DE2033BFE8D43403C4A253CA1971CC07B30293E3E8F434091D6187442981CC089EDEE01BA8F434001A260C6148C1CC08E91EC116A9243402A3927F6D08E1CC014ECBFCE4D934340D313967840891CC03B545392759443407F87A2409F881CC04E5E64027E954340F566D47C958C1CC04C35B39602964340B8019F1F46981CC0E7C6F48425964340FB3E1C2444A91CC067D2A6EA1E974340687A89B14CAF1CC008CA6DFB1E9743406B8313D1AFBD1CC0776682E15C974340FF5D9F39EBC31CC0E355D636C5974340187D0569C6D21CC0B6494563ED9743408B89CDC7B5E11CC01152B7B3AF98434018D00B772EEC1CC02F336C94F599434048BF7D1D38F71CC06EBE11DDB39A4340C2DF2F664BF61CC0B4AD669DF19B43401AC1C6F5EFFA1CC084B70721209D4340D02A33A5F5F71CC09D6516A1D89E43409E978A8D79FD1CC024438EAD67A04340C689AF7614F71CC04298DBBDDCA14340B6696CAF05ED1CC0A69883A0A3A3434054C6BFCFB8101DC046EBA86A82A64340DBBFB2D2A4141DC0FE47A643A7A74340F3CAF5B6991A1DC0A704C4245CA84340AEF36F97FD2A1DC0B262B83A00AA434056EF703B343C1DC0CB9D996038AB4340609335EA213A1DC0221807978EAD43405760C8EA563F1DC06CB2463D44AF43401A87FA5DD84A1DC0F0DC7BB8E4B04340888384285F401DC043C879FF1FB34340AD156D8E733B1DC0CD5CE0F258B343400264E8D841351DC0B58CD47B2AB543409AEE75525F361DC0EF02250516B6434079CC4065FC3B1DC0A14B38F416B7434018B14F00C5381DC0F9A3A833F7B843403082C64CA22E1DC01E3526C45CBA4340772CB64945331DC06C5B94D920BB4340A7785C548B381DC08CF2CCCB61BB43402106BAF605441DC0295FD04202BC43407B6B60AB044B1DC058552FBFD3BC434088F2052D24601DC0467A51BB5FBD43408198840B79641DC0F62686E464BE4340A0DE8C9AAF721DC0B743C362D4BD434090A4A487A1751DC0B8EA3A5453BE43404606B98B30851DC039B69E211CBF4340F3CB608C48841DC0DD41EC4CA1BF434043CA4FAA7D8A1DC069C36169E0BF4340D5B14AE9998E1DC0D53DB2B96AC043408C48145AD68D1DC090DB2F9FACC24340C0594A9693901DC0B1524145D5C3434094DC611399991DC08F6E844545C4434065FED13769AA1DC0A72215C616C4434092AF045262B71DC0BF49D3A068C44340F3E505D847C71DC032AB77B81DC64340FF092E56D4D01DC01BD47E6B27C84340F4C29D0B23DD1DC086C613419CC94340486FB88FDCEA1DC0821E6ADB30CA434087191A4F04F11DC07F129F3BC1CA43402AA8A8FA95FE1DC0B43A394371CB434070B20DDC810A1EC088BB7A1519CF4340F7E978CC40151EC0551344DD07D043405798BED7101C1EC00E9E094D12D14340ED478AC8B01A1EC01D0247020DD24340DF6A9DB81C1F1EC045F30016F9D34340ECDE8AC404251EC05932C7F2AED443402F336C94F52B1EC02D26361FD7D44340B43EE5982C2E1EC0321D3A3DEFD44340570740DCD52B1EC0B8AD2D3C2FD54340639CBF0985281EC059198D7C5ED543409C31CC09DA241EC0876F61DD78D543402DE8BD3104201EC0C6C210397DD54340C022BF7E881D1EC040DAFF006BD543404BAB21718F151EC0200890A163D543408849B89047101EC039471D1D57D54340FF092E56D4D01DC077103B53E8D443408159A148F7B31DC01FBDE13E72D34340F25B74B2D49A1DC0357F4C6BD3D2434091B8C7D2878E1DC09411178046D3434021CA17B490801DC0CF49EF1B5FD34340628731E9EF551DC079573D601ED24340DE5A26C3F14C1DC007B5DFDA89D2434089096AF816461DC0F92EA52E19D3434015A8C5E0612A1DC01BBD1AA034D4434073124A5F08291DC072FDBB3E73D4434034BC5983F7251DC013EE9579ABD4434065506D70221A1DC0E44BA8E0F0D44340CCB56801DA161DC0DE8E705AF0D443407DAF21382E131DC0917C259012D54340B343FCC3960E1DC08121AB5B3DD543405456D3F544071DC0D9D0CDFE40D54340419AB1683AFB1CC0A0F99CBB5DD543406479573D60DE1CC0BA68C87894D44340D8D47954FCCF1CC09A27D714C8D4434003B68311FBC41CC0D881734694D443409C69C2F693C11CC0A9143B1A87D443406C76A4FACEBF1CC0522B4CDF6BD4434072193735D0BC1CC0A9893E1F65D443402634492C29B71CC02F3201BF46D443407AA69718CBB41CC05B785E2A36D443408446B071FDAB1CC0E02D90A0F8D34340FCFD62B664A51CC06F9D7FBBECD34340CEC7B5A1629C1CC0CC0A45BA9FD343402C280CCA349A1CC05A46EA3D95D34340FB07910C39961CC089963C9E96D34340AF22A30392801CC087FC3383F8D443404912842BA0601CC0E9D495CFF2D443401E3526C45C421CC0A2F0D93A38D44340899B53C900101CC0C79DD2C1FAD543402BC0779B370E1CC0F5F75278D0D64340357A354069081CC0268A90BA9DD74340AC39403047FF1BC0FE7C5BB054DB4340BB0D6ABFB5F31BC0B9A7AB3B16DD4340F2EF332E1CF81BC0DB19A6B6D4DD4340EDD45C6E30F41BC0425C397B67E04340D591239D81F11BC0B35C363AE7E1434062F3716DA8E81BC02CB7B41A12E34340346612F582EF1BC04C55DAE21AE5434042791F4773F41BC0128942CBBAE5434054FD4AE7C3F31BC01E1840F850E643400DE198654FF21BC081ECF5EE8FE74340ED7E15E0BBED1BC004594FADBEE84340C24F1C40BFDF1BC02DB5DE6FB4E94340A391CF2B9EDA1BC0F435CB65A3E94340249D819197D51BC07F8461C092E94340FB03E5B67DCF1BC097715303CDE94340A25F5B3FFDC71BC07500C45DBDEA43400C8FFD2C96C21BC0CE8B135FEDEA4340A8C4758C2BBE1BC0145AD6FD63EB43402499D53BDCBE1BC07BFA08FCE1EB4340D942908312B61BC0C6DFF60489ED4340761893FE5EAA1BC03FC8B260E2ED4340CBB91457959D1BC06F1283C0CAEF43403FE08101849F1BC0C6A354C213F24340594FADBEBA9A1BC073D712F241F34340925A28999C9A1BC078978BF84EF4434016A75A0BB3A01BC088F37002D3F543402AE09EE74F9B1BC07E6FD39FFDF643406268757286921BC0A226FA7C94F743404165FCFB8C8B1BC026361FD786F84340EE96E4805D8D1BC029ED0DBE30FB4340AC0320EEEA851BC08A027D224FFC4340D74E9484448A1BC0EE04FBAF73FD4340292158552F7F1BC0289B728577FF4340D9EC48F59D7F1BC0C573B680D000444015713AC956771BC04DDA54DD230144409488F02F82761BC0FE9E58A7CA014440D68C0C7217811BC09F3D97A949024440BB9C121093801BC0C5387F130A0344409F76F86BB2861BC007F01648500444405A828C800A871BC0B9382A3751054440132C0E677E951BC0BDA60705A50644404BCB48BDA7921BC0B4AED172A00744402176A6D0799D1BC02CF52C08E5074440F3E32F2DEAA31BC0CB14731074084440A48CB80034AA1BC0A872DA5372084440CA1AF5108DAE1BC027DE019EB40A4440E63DCE3461BB1BC0A12FBDFDB90C4440A9DC442DCDBD1BC0F08AE07F2B0D44405111A7936CC51BC0C4EC65DB690D4440FCC3961E4DC51BC03C9F01F5660E444083C13577F4CF1BC0F1F44A59860E44404298DBBDDCD71BC0BF9B6ED9210E4440A391CF2B9EDA1BC059A7CAF78C0E4440C102983270F01BC025AFCE31200F444019AC38D55AF81BC0B81D1A16A30E4440793BC269C1FB1BC0B796C9703C0F444038BA4A77D7091CC001F9122A38104440D4B837BF61121CC06DAE9AE788124440B4E73235090E1CC0728BF9B9A113444028D6A9F23D131CC04014CC9882154440FEF15EB532111CC0C4E8B985AE1644400150C58D5B1C1CC080D4264EEE1744400B2AAA7EA5131CC0581F0F7D77194440BBEF181EFB091CC0A9C1340C1F1D444093C6681D55FD1BC03143E389201E4440F2EEC8586DEE1BC04BCB48BDA71E4440F7B182DF86E81BC0425BCEA5B81E4440971B0C7558E11BC0C7D63384631E4440A391CF2B9EDA1BC04BAE62F19B1E444037001B1021CE1BC0363E93FDF3204440F25F200890B11BC044C2F7FE062144408E3EE60302AD1BC0EE06D15AD12044408A3BDEE4B7A81BC0B55373B9C120444053245F09A4A41BC0A5F9635A9B2044403C33C170AEA11BC0CA880B40A3204440268FA7E5079E1BC042959A3DD020444043E21E4B1F9A1BC0EFA83121E62044409E279EB305941BC024D236FE442144402FDE8FDB2F8F1BC06D0377A04E2144400A117008558A1BC06249B9FB1C2144406EA5D76663851BC0C2BF081A332144400AD6389B8E801BC00A48FB1F6021444089B663EAAE7C1BC05725917D90214440BDE0D39CBC781BC0083C3080F0214440EDB94C4D82771BC07C2766BD182244408F52094FE8751BC0999CDA19A6224440C8B7770DFA721BC0DF8C9AAF9223444055DB4DF04D731BC0B2683A3B192444407B4ACE893D741BC0C91D3691992544406938656EBE711BC0B24AE9995E264440DFA7AAD0405C1BC0C2F693313E284440FE9E58A7CA471BC096ED43DE72294440C156091687431BC02C8194D8B5294440F2ED5D83BE341BC0C687D9CBB629444054C4E9245B2D1BC0919C4CDC2A2A4440D7A02FBDFD291BC07CF1457BBC2A4440E4BB94BA642C1BC0F67AF7C77B2D4440CC0D863AAC201BC04565C39ACA2E444032384A5E9D231BC0CAA31B61512F4440D7A205685B2D1BC0C38366D7BD2F4440C6C1A563CE331BC05E13D21A83304440E564E256413C1BC07286E28E37314440CF68AB92C83E1BC0304AD05FE83144402B4F20EC144B1BC03E5DDDB1D832444037FC6EBA65571BC0C6A2E9EC6434444075ADBD4F55611BC061191BBAD9374440070951BEA0651BC0EBE2361AC039444064E76D6C76641BC027A5A0DB4B3A444046B41D5377551BC0FCE1E7BF073D4440645930F147511BC06C3D4338663D4440956247E3504F1BC03A234A7B833D444087A6ECF4834A1BC027BD6F7CED3D444061FD9FC37C491BC05D3123BC3D3E44406475ABE7A4471BC0A2D288997D3E4440D5AE09698D411BC0C05AB56B42404440DA39CD02ED2E1BC074ED0BE885414440323B8BDEA9301BC0BD546CCCEB424440069D103AE8321BC077F86BB246434440B1A888D349361BC0259694BBCF4344402AC6F99B50381BC0E4F38AA71E454440C5CBD3B9A2341BC042EE224C51464440239F573CF5381BC0F6B6990AF146444059F78F85E8601BC06555849B8C4844407250C24CDB5F1BC047E350BF0B49444065A9F57EA35D1BC05725917D90494440C15774EB355D1BC069554B3ACA49444010C99063EB591BC0FC6F253B364A4440732F302B14591BC0FCA886FD9E4A4440DACBB6D3D6581BC0813FFCFCF74A4440E3A6069ACF591BC02C9FE579704B44405DDF878384581BC0AD6A4947394C44402F19C748F6481BC02174D0251C4E4440276A696E85401BC01AF9BCE2A94F4440BE310400C73E1BC0D7A6B1BD16504440087250C24C3B1BC06C97361C96504440789ACC785B391BC0D237691A14514440591822A7AF371BC0577C43E1B35144403A03232F6B321BC06BF12900C6534440CC4065FCFB2C1BC0B0AD9FFEB3544440BA2C26361F371BC0F8F9EFC16B5544401F477364E5371BC0A01A2FDD2456444072FDBB3E73361BC0F183F3A9635744405A7EE02A4F401BC080B56AD7845A44403A7AFCDEA63F1BC0F7729F1C055C4440A114ADDC0B4C1BC0A5BC5642775D44404739984D80511BC0F3ACA415DF5E444012C0CDE2C5521BC01CCD91955F6044407DB262B83A501BC0EAEA8EC53661444043705CC64D4D1BC0B2101D024764444031B3CF6394471BC0577C43E1B3654440E04C4C1762451BC0EC4B361E6C674440FE277FF78E4A1BC0A05225CADE684440BC41B456B4491BC09335EA211A6B4440594C6C3EAE4D1BC0F84F3750E06B4440E50D30F31D4C1BC0384BC972126C4440F08975AA7C3F1BC0EE3D5C72DC6B44407C2766BD183A1BC093C3279D486C44409BAA7B6473351BC0EF3CF19C2D6C44403012DA722E351BC0022D5DC1366E444081B4FF01D63A1BC0B48F15FC367044401BF33AE2903D1BC07DCD72D9E8704440A4552DE928471BC0B75D68AED37044403D9E961FB85A1BC05454FD4AE771444017450F7C0C661BC07A185A9D9C73444073BED87BF1651BC05D88D51F61764440ED2C7AA7026E1BC025085740A1784440E622BE13B36E1BC0ADDD76A1B978444086E464E256711BC01A6EC0E78779444090BE49D3A0781BC0ED9FA701837A4440F705F4C29D7B1BC09581035ABA7A4440DA8EA9BBB28B1BC075C7629B547C44403067B62BF4911BC06745D4449F7D4440289D4830D59C1BC0A5F9635A9B7E4440352905DD5EA21BC01B84B9DDCB7F4440FC8F4C874EAF1BC0FF21FDF675804440B7EEE6A90EB91BC0205D6C5A2982444025CFF57D38B81BC0062CB98AC58344404C512E8D5FA81BC08B34F10EF0844440DE718A8EE4821BC0309C6B98A1834440E4F8A1D288691BC0B29E5A7D75834440BEBC00FBE8541BC089EDEE01BA834440A01B9AB2D34F1BC03811FDDAFA834440CC9A58E02B4A1BC043C5387F138444407F315BB22A421BC09F02603C83844440664AEB6F09401BC094F6065F98844440B29DEFA7C63B1BC013BA4BE2AC8444404CC2853C823B1BC0E04BE141B38544407C7E18213C2A1BC0F0A7C64B37874440EFFE78AF5A191BC0B29E5A7D7589444089B7CEBF5D161BC077D66EBBD08A4440C170AE6186061BC06901DA56B38C44404DD6A88768041BC020B75F3E598D4440A3923A014D141BC0FAD4B14AE98F4440A1F65B3B51121BC030D80DDB16914440C3F352B131FF1AC03944DC9C4A924440B47405DB88F71AC0740B5D8940934440978BF84ECCEA1AC0E411DC48D9944440FFB1101D02D71AC0F7C95180289644400EC0064488CB1AC09EB4705985974440179E978A8DC91AC01230BABC3998444031D28BDAFDCA1AC0041F8315A798444069A9BC1DE1C41AC06571FF91E9984440901150E108C21AC029CFBC1C7699444062F4DC4257C21AC030664B56459A4440EFAD484C50C31AC093E52494BE9A44401EA33CF372B81AC022516859F79B444006F1811DFFA51AC0F06B2409C29D44408350DEC7D19C1AC06E179AEB349E4440C571E0D572971AC04628B682A69F4440799109F835921AC04966F50EB79F4440E04735ECF7841AC0806264C91C9F444094675E0EBB6F1AC0A646E867EA9F4440E012807F4A651AC0C537143E5B9F444082E15CC30C5D1AC0B4942C27A1A044402FFCE07CEA581AC0730E9E094DA044401ADCD6169E571AC07C7BD7A02F9F44404A61DEE34C531AC0B64DF1B8A89E4440AEBB79AA434E1AC02C4487C0919E444056444DF4F9481AC08257CB9D999E444002D369DD06451AC03F56F0DB109F44404B1FBAA0BE351AC01747E5266A9F4440A1A2EA573A2F1AC0BABE0F0709A144401C446B459B131AC03BA92F4B3BA34440130EBDC5C30B1AC0840CE4D9E5A1444059880E8123011AC0C74CA25EF0A144402575029A08EB19C05DA9674128A3444024B4E55C8AEB19C0F0A65B7688A34440C632FD12F1F619C0B8CCE9B298A44440F4FBFECD8BF319C0D996016729A544403CDD79E239EB19C0594C6C3EAEA544409EF0129CFAE019C05114E81379A64440C24CDBBFB2D219C05723BBD232A644403C69E1B20ACB19C044A7E7DD58A64440DB19A6B6D4C119C05340DAFF00A7444014B1886187C119C0BEBF417BF5A74440F9156BB8C8BD19C0E7A7380EBCA8444097E4805D4DAE19C0FBB1497EC4A94440FDA19927D7B419C09757AEB7CDAA4440FE80070610AE19C0730F09DFFBAB44405F61C1FD80A719C0029A081B9EAC444006685BCD3A9319C0B9162D40DBAC4440838593347F8C19C0B9FE5D9F39AD444007EFAB72A18219C08EE9094B3CAE444030D80DDB168519C0FB0626378AAE4440611C5C3AE68C19C01BF67B629DAE444024F25D4A5D9219C0D00F238447AF44406B11514CDE9019C01478279F1EB14440F6CE68AB927819C07863416150B24440EBC9FCA36F7219C07633A31F0DB144401D0247020D6619C00D384BC972B044406F4A79AD844E19C087C0914083B14440011764CBF24519C057CEDE196DB1444098309A95ED4319C02BDEC83CF2B14440D2A755F4874619C08CA2073E06B34440E92ADD5D675319C06F8099EFE0B3444052BAF42F495519C0D4D51D8B6DB444404A99D4D0065019C0D575A8A624B544401EA67D737F4519C0FE0E45813EB54440BA9F53909F3D19C0FCDF1115AAB54440452E3883BF2F19C005F9D9C875B74440F433F5BA453019C02907B30930B844408F71C5C5513919C0A7EA1ED95CB944407DE71725E82F19C07651F4C0C7BA44407AABAE43352519C06500A8E2C6BB4440D6FD63213A2419C00C3CF71E2EBD4440CDAE7B2B121319C052D4997B48BE444083F92B64AE0C19C042D13C8045BE4440E0D6DD3CD51119C08753E6E61BBF44400F63D2DF4B1119C0F7CB272B86BF4440BDE13E726B0219C076711B0DE0BF44403BE3FBE2520519C035423F53AFC14440A3E8818FC1FA18C00D1CD0D215C244403E75AC527AF618C07F87A2409FC24440D234289A07E018C045F5D6C056C54440C72C7B12D8DC18C0B874CC79C6C644403387A4164AD618C0560DC2DCEEC7444091BA9D7DE5C118C00AD9791B9BC9444035B8AD2D3CCF18C0799109F835CC44405794128255D518C06614CB2DADCC4440334FAE2990E918C05CE333D93FCD4440CCB6D3D688F018C0158DB5BFB3CD4440EC6AF294D50419C0821B295B24D144404FEB36A8FD2619C065C5707500D44440CD1FD3DA343619C0FC3905F9D9D44440CD57C9C7EE4219C0D7FA22A12DD54440268BFB8F4C4719C0E8D9ACFA5CD54440051A6CEA3C4A19C0467A51BB5FD544407B832F4CA66A19C0501A6A1492D64440EBC9FCA36F7219C059F8FA5A97D64440A5315A47558319C075C7629B54D644408F8D40BCAE9F19C030293E3E21D7444054C554FA09A719C030478FDFDBD6444032E6AE25E4B319C038F7578FFBD64440FBC9181F66BF19C09C6A2DCC42D7444002840F255AC219C02BF697DD93D744407E52EDD3F1C819C032E719FB92D744403CDA38622DCE19C0FE0E45813ED744404640852348D519C00CCD751A69D544402C2CB81FF0E019C0B03DB32440D544401AF7E6374CF419C018D00B772ED444404FCAA48636001AC0AA2C0ABB28D4444061DD7877640C1AC0350BB43BA4D44440EA92718C640F1AC0454772F90FD5444023A0C211A4121AC020B75F3E59D54440F418E59997131AC03929CC7B9CD54440707841446A1A1AC0A60BB1FA23D644406D3A02B8591C1AC0C53A55BE67D644401CEDB8E177231AC05307793D98D64440BDE3141DC9251AC026FBE769C0D64440204432E4D82A1AC01D39D21918D74440AE2CD15966311AC08A7269FCC2D74440E36F7B82C4361AC054E3A59BC4D844402D78D15790361AC0C51F459DB9D94440ABB4C5353E331AC05F605628D2D94440D6726726182E1AC0EDB94C4D82D944406EFB1EF5D72B1AC0C02154A9D9D94440E2CB441152371AC00AF4893C49DC44402D5E2C0C91331AC050DF32A7CBDC444090F8156BB8381AC087DF4DB7ECDC4440A9C29FE1CD3A1AC04E0D349F73DD4440D200DE02093A1AC0B56B425A63DE44402E39EE940E461AC0728C648F50DF44401DAED51EF6421AC02A01310917E04440CD565EF23F391AC00F0D8B51D7E0444074081C0934381AC038BF61A241E24440C85BAE7E6C321AC044DE72F563E34440F8544E7B4A2E1AC09561DC0DA2E34440AC5626FC522F1AC0910C39B69EE544409468C9E369291AC0D3156C239EE644408CF4A276BF2A1AC06798DA5207E744409E98F56228271AC016C26A2C61E74440444FCAA486261AC0EC1516DC0FE84440618A7269FC221AC0AEEFC34142E844405C3CBCE7C0221AC01FF30181CEE844406552431B801D1AC054E23AC615E9444060014C1938201AC0AF3E1EFAEEEA4440E09D7C7A6C1B1AC0A774B0FECFEB44402FA704C4241C1AC0C22FF5F3A6EC44402B137EA99F171AC0029EB47059ED444001FC53AA44191AC0C5A9D6C22CEE44404E0E9F7422111AC0355F251FBBEF4440D17AF83251141AC011548D5E0DF04440BCB376DB85261AC09BFF571D39F04440D9E89C9FE2481AC07BD976DA1AF1444071AE6186C6431AC0CEAACFD556F244403160C9552C3E1AC0B325AB22DCF2444026DF6C73633A1AC0D3669C86A8F44440F6419605132F1AC0FBE769C020F744407F86376BF02E1AC0850662D9CCF74440FCA9F1D24D321AC02BDB87BCE5F844406DC7D45DD9351AC091990B5C1EF9444005DB8827BB391AC0C11C3D7E6FF94440ADDD76A1B93E1AC0FC8D76DCF0F94440E0F42EDE8F4B1AC00A0F9A5DF7FA4440C284D1AC6C4F1AC09A266C3F19FB44407AABAE4335551AC0448655BC91FB4440C5E23785955A1AC0E1270EA0DFFB4440580394861A651AC033FE7DC685F944409A5B21ACC6721AC0AFEC82C135F9444009F9A067B37A1AC0CEFBFF3861F8444039ECBE63788C1AC0A5DC7D8E8FF84440CF81E50819C81AC069A7E67283F74440ABB4C5353ED31AC0A86E2EFEB6F74440E97FB9162DE01AC072158BDF14F84440EACDA8F92AE91AC0632992AF04F84440B47405DB88F71AC0543541D47DF844403F1F65C405001BC0ADFA5C6DC5F8444032755776C1101BC0828B153598FC4440062E8F3523131BC0492BBEA1F0FD44407E6E68CA4E1F1BC088BD50C076FE444023827170E9381BC07506465ED6FE444090BDDEFDF13E1BC012A27C410BFF444010B3976DA73D1BC053CE177B2FFC4440DA56B3CEF83E1BC07C45B75ED3FB44401E17D522A2481BC0E57E87A240F944400C772E8CF4521BC050C8CEDBD8F84440D331E719FB621BC07DEBC37AA3F84440369204E10A781BC00247020D36F94440D86322A5D97C1BC033F9669B1BF944408C9DF0129C8A1BC099BA2BBB60F84440EDBC8DCD8E941BC02E1B9DF353F8444062122EE411BC1BC0FC1BB4571FF9444028F04E3E3DC61BC0840F255AF2F844403A57941282D51BC047C9AB730CFC4440A391CF2B9EDA1BC0AA7D3A1E33FC4440456458C51BE91BC04FCFBBB1A0FC44405396218E75F11BC00E66136058FC4440139CFA40F2FE1BC0D3F6AFAC34FB44402FFCE07CEA081CC0DA20938C9CF94440651C23D923241CC0FC19DEACC1F94440508E0244C12C1CC080B6D5AC33FA444004745FCE6C371CC078F17EDC7EF94440B0E600C11C4D1CC0F4C0C760C5F94440C651B9895A5A1CC00A100533A6FC4440EF53556820761CC0A089B0E1E9FD4440FC19DEACC17B1CC05F07CE1951FE4440CB694FC939911CC0AE62F19BC2FE44409E9ACB0D869A1CC06C98A1F144FE44403CA2427573A11CC01A18795913FD4440D04543C6A3B41CC0B83EAC376AFD444033E202D028BD1CC057D11F9A79FC4440DA56B3CEF8BE1CC01AA54BFF92FA4440FE0A992B83BA1CC00C74ED0BE8F9444080643A747ABE1CC020EBA9D557F944407429AE2AFBBE1CC0FF3EE3C281F84440E411DC48D9B21CC0DEC66647AAF544404390831266BA1CC073BB97FBE4F44440C5E74EB0FFBA1CC02E20B41EBEF44440C53BC09316BE1CC0651A4D2EC6F244406EBF7CB262C81CC0A20BEA5BE6F04440F419506F46CD1CC027D87F9D9BF0444032E884D041D71CC060E97C7896F044407C6308008EED1CC071C79BFC16EF44406616A1D80AFA1CC0D2C2651536EF4440AE8383BD89011DC089B5F81400EF4440B3B112F3AC241DC0EC18575C1CED44403FADA23F34331DC0E621533E04ED4440C47762D68B411DC06170CD1DFDEB4440626A4B1DE4451DC02DE8BD3104EC44402CD8463CD94D1DC0D976DA1A11EC4440C138B874CC591DC0BFB854A52DEC44403672DD94F26A1DC0A83462669FEB4440533D997FF46D1DC01763601DC7EB4440C59107228B741DC0289CDD5A26ED44405704FF5BC98E1DC02A1900AAB8EB44401366DAFE95951DC0DA3C0E83F9E94440D462F030EDAB1DC0B2D7BB3FDEE74440F0DAA50D87B51DC0BF4692205CE7444099107349D5B61DC0A680B4FF01E844404A61DEE34CB31DC0E0DA899290E84440AE65321CCFB71DC0F88BD99255E944405ABA826DC4B31DC0129F3BC1FEE94440F17EDC7EF9B41DC0C767B27F9EEA44409128B4ACFBC71DC0A1496249B9EB444014268C6665CB1DC02DB1321AF9EC4440293FA9F6E9C81DC0E90C8CBCACED44402E008DD2A5CF1DC0F8DEDFA0BDEE44405D8B16A06DD51DC091D5AD9E93EE444050C3B7B06EDC1DC0B2A19BFD81EE44409B8E006E16DF1DC08AE42B8194EE44409B3BFA5FAEE51DC062855B3E92EE44400A100533A6F01DC08C81751C3FEE4440BC22F8DF4AF61DC0927538BA4AEF4440BB44F5D6C0F61DC0DDD3D51D8BEF4440F419506F46FD1DC0DDCD531D72EF44404981053065001EC0A7EA1ED95CEF44400D8AE6012C021EC083F755B950EF4440DD09F65FE7061EC0A0C03BF9F4EE44407A19C5724B0B1EC06116DA39CDEE4440384D9F1D700D1EC02426A8E15BEE4440BFB67EFACF0A1EC0B3D1393FC5ED4440AF601BF164071EC01D7233DC80ED44406CB41CE8A1061EC002D369DD06ED4440514B732B84051EC09BC937DBDCEC4440C74CA25EF0091EC0DCD6169E97EC44405D50DF32A70B1EC06A6AD95A5FEC4440F65E7CD11E0F1EC09BFF571D39EC4440685C381092151EC0AD1402B9C4EB44408192020B602A1EC0B16B7BBB25EB4440E146CA16494B1EC086ADD9CA4BEA44402CD7DB662A641EC0A25D85949FEA444018CFA0A17F721EC0C0EC9E3C2CEA44409B012EC896751EC002B7EEE6A9EA4440E44BA8E0F0721EC0782975C938EC4440B41CE8A1B66D1EC0AB75E272BCEC4440FE7C5BB054671EC0363AE7A738EE44407BA35698BE671EC058ACE122F7EE4440DD5B9198A0561EC02063EE5A42F04440731074B4AA551EC00664AF777FF04440ADA415DF50581EC0193C4CFBE6F04440F33E8EE6C85A1EC07E703E75ACF044408EB27E33316D1EC0E884D04197F04440C32E8A1EF8781EC00D8D278238F14440E57B462234821EC0B519A721AAF044406FD6E07D558E1EC04BCB48BDA7F04440912C6002B79E1EC0475854C4E9F04440F46BEBA7FFAC1EC01406651A4DF244405A9F724C16B71EC045662E7079F244402AC76471FFC11EC017BB7D5699F34440BA11161571CA1EC0F5108DEE20F4444020CF2EDFFAD01EC0D9CD8C7E34F444404D4D8237A4D11EC0780C8FFD2CF44440753A90F5D4DA1EC07E9065C1C4F34440B5334C6DA9E31EC079E57ADB4CF344408735954561E71EC0DA73999A04F34440558847E2E5F91EC09161156F64F244402A1BD65416051FC0D07EA4880CF344400BCF4BC5C60C1FC07784D38217F344400B5EF415A4191FC0FE2955A2ECF144405F96766A2E271FC09D81919735F14440CE37A27BD6351FC0ED0C535BEAF044408881AE7D013D1FC026529ACDE3F04440BBB4E1B034401FC0E6CAA0DAE0F044407DB262B83A601FC0D0D03FC1C5F04440B857E6ADBA5E1FC06A334E4354EF4440CAA8328CBB611FC0C093162EABEE444005BF0D315E731FC03A3E5A9C31EE4440CD72D9E89C7F1FC04303B16CE6EC44408D62B9A5D5901FC09B1DA9BEF3ED444000C79E3D97891FC0B2A03028D3F044403F524486558C1FC07764AC36FFF344407E1D386744891FC08750A5660FF64440C0D02346CF8D1FC09AD024B1A4F644400C3B8C497F9F1FC0A4FFE55AB4F64440E4F4F57CCDA21FC0C79DD2C1FAF544403D433866D9A31FC02655DB4DF0F34440AA7D3A1E33B01FC097C62FBC92F044408449F1F109C91FC015E5D2F885EF44408F6FEF1AF4D51FC0242713B70AF0444044A4A65D4CE31FC023BF7E880DF04440297B4B395FEC1FC0029D499BAAEF4440278925E5EEF31FC096B4E21B0AEF44407505DB8827FB1FC05F28603B18ED444083FB010F0C0020C09D6516A1D8EC44404CE3175E490220C0B42094F771EC4440C6151747E50620C026378AAC35EA444087A4164A260F20C05740A19E3EEA4440D940BAD8B41220C061527C7C42EA44408A3A730F091720C0A320787C7BE9444070CFF3A78D1A20C0E3512AE109E9444004392861A61D20C00B2769FE98E84440AA4885B1853020C0562B137EA9E7444023861DC6A43720C02098A3C7EFE744400893E2E3134220C0ECA2E8818FE74440E109BDFE244E20C05FD218ADA3E844403FC6DCB5845420C02E20B41EBEE84440E141B3EBDE5220C08E3BA583F5ED4440F10F5B7A345520C06555849B8CEE4440992D5915E15620C060EAE74D45F044404DF564FED15720C02DEDD45C6EF0444026E1421EC15D20C0DC12B9E00CF0444017D7F84CF65F20C0719010E50BF044407B6AF5D5556120C0CBDB114E0BF04440A5F8F884EC6420C0BAA46ABB09F04440D6E6FF55476620C0FEB4519D0EF044409E0B23BDA86520C0DD955D30B8F044404EB7EC10FF6820C0B344679945F244402CB64945636D20C0F9D7F2CAF5F244401E6CB1DB676D20C00551F70148F34440E8667FA0DC6E20C09BC937DBDCF44440E8BB5B59A26B20C076C1E09A3BF644408CDB68006F6920C0BA68C87894F64440863DEDF0D76420C04BE9995E62F844407B6AF5D5556120C0A0A9D72D02F9444017D7F84CF65F20C0266E15C440F94440DDEEE53E395A20C0B8019F1F46FA4440E0B9F770C95920C0B1F7E28BF6FA4440E8F7FD9B175720C01CB3EC4960FB4440BAF59A1E145420C04FCFBBB1A0FC4440F209D9791B5320C07BF486FBC8FD4440C4D2C08F6A4820C0A1BB24CE8AFE444046B6F3FDD44020C0DD442DCDAD004540F3AD0FEB8D3A20C0FDF9B660A900454023861DC6A43720C032E9EFA5F0004540630B410E4A3020C0520ABABDA4014540AF5E4546072C20C025B20FB22C024540F8C1F9D4B12A20C0F3C7B4368D034540E12538F5812C20C081E84999D406454050C6F8307B3120C072FBE593150945402920ED7F803520C08E0244C18C0945404A97FE25A93C20C0ED9FA701830A45400936AE7FD73F20C014E81379920A4540655419C6DD4020C06B0C3A21740A4540F2EEC8586D4620C060C8EA56CF09454057B1F84D614D20C0CB49287D210A4540AB798EC8775920C0F69A1E149408454075AF93FAB25C20C0670E492D940845408099EFE0275E20C0A4A7C821E20845407B6AF5D5556120C07651F4C0C70E45407B6AF5D5556120C05A2BDA1CE70E45409A5B21ACC66220C02A58E36C3A1045407B6AF5D5556120C008556AF640114540DFDFA0BDFA6020C058703FE0811145407B6AF5D5556120C0F0FD0DDAAB114540D9CEF753E36520C0C5707500C413454040683D7C996820C063D009A183124540AE105663097320C0BDAB1E300F114540988922A46E7720C032AEB8382A1145408F1CE90C8C7C20C0BA13ECBFCE11454044C18C29588320C025CCB4FD2B114540EE9579ABAE8320C0E86C01A1F5104540BCB1A030288320C07B336ABE4A104540138255F5F28320C08751103CBE0F4540441669E21D8820C011902FA1820F4540A837A3E6AB8C20C014596B28B50F4540670E492D949420C0A1478C9E5B0E4540BAD7497D599A20C0807EDFBF790D454083A10E2BDCA220C08E209562470D4540791F477364A520C09C1A683EE70C4540C72DE6E786A620C048C2BE9D440C454046EA3D95D3A620C06AF816D68D0B4540BAF8DB9E20A920C093AAED26F80A45400D8CBCAC89AD20C09A44BDE0D30A45405FCFD72C97B520C0FF4124438E0B45405111A7936CBD20C07FDC7EF9640B4540BA675DA3E5C020C06B0C3A21740A45402C103D2993C220C07D21E4BCFF094540AFB2B6291EC720C0A7069ACFB9094540022CF2EB87C820C0E1B20A9B010A4540AA0F24EF1CCA20C02EFEB627480A45403BDF4F8D97CE20C09BE8F351460A45404DF564FED1D720C099B7EA3A5409454053CDACA580DC20C0C9586DFE5F0945404D309C6B98E120C018CFA0A17F0A454078D1579066E420C0895FB1868B0A45404F3E3DB665E820C021E7FD7F9C0A45404EB7EC10FFF020C06B0C3A21740A4540BFD53A7139FE20C04A0D6D00360A454001857AFA080421C07A1D71C8060A45402655DB4DF00D21C066A208A9DB09454056D3F544D70D21C0E371512D22084540DEAE97A6081821C027C0B0FCF90645406473D53C471C21C00612143FC6064540030AF5F4112821C0E21E4B1FBA064540B01C2103792E21C09293895B05074540B54E5C8E573021C093E4B9BE0F074540A29C6857213521C00ABE69FAEC064540397EA834623621C0F54883DBDA0645405C72DC291D4421C06F9C14E63D064540AE9AE7887C4721C096ECD808C40545403B72A433304A21C0C573B680D0044540C72E51BD355021C0C8EE022505044540185FB4C70B5121C05704FF5BC9024540971C774A075321C06B0C3A2174004540E38BF678215D21C03A02B859BCFE444093C83EC8B26021C014D1AFAD9FFE444050C422861D6621C0BA8102EFE4FD44402448A5D8D17021C0FE7DC68503FD44408481E7DEC37521C0A5F9635A9BFC44409143C4CDA97C21C0C9E9EBF99AFB4440DAE21A9FC97E21C02EABB019E0FA44406DE4BA29E57D21C04F57772CB6F94440573ECBF3E07E21C0245F09A4C4F844401EC539EAE88021C000A8E2C62DF84440CEFBFF38618221C0F19F6EA0C0F7444049490F43AB8321C0136058FE7CF74440245E9ECE158521C0155454FD4AF744408B87F71C588621C0541C075E2DF744402F19C748F68821C0685E0EBBEFF6444043572250FD8B21C092205C0185F64440C1C760C5A98E21C0F5A276BF0AF6444068075C57CC9021C0D7BE805EB8F544402B155454FD9221C0BF805EB873F54440516B9A779C9A21C07500C45DBDF4444008E753C72A9D21C0F7B182DF86F444402592E86514A321C04F22C2BF08F44440103B53E8BCA621C0884B8E3BA5F34440D009A1832EA921C09E23F25D4AF344409EEFA7C64BAF21C08AAE0B3F38F1444068E7340BB4B321C03C31EBC550F04440E9BAF083F3B921C00DFAD2DB9FEF44409A6038D730BB21C04298DBBDDCEF444051853FC39BBD21C07AE40F069EEF44403674B33F50BE21C08E942D9276EF44408524B37A87C321C0C2DD59BBEDF0444087C3D2C08FC221C0471FF30181F2444094895B0531C021C0EE224C512EF34440F660527C7CC221C02522FC8BA0F34440A20914B188C121C0EEEA556474F44440C7B8E2E2A8C421C009C21550A8F544409831056B9CC521C074D3669C86F84440605628D2FDC421C047E350BF0BFB44406C4084B872C621C0618BDD3EABFC4440849ECDAACFC521C0A4C684984BFE444014E8137992C421C0F9DC09F65FFF4440EF7211DF89C121C07B1684F23E004540CBF3E0EEACC521C0BB7B80EECB014540CBD58F4DF2C321C0DAAD65321C054540BC0512143FC621C053B3075A81054540952710768AC521C004711E4E60064540C78157CB9DC921C0A0A52BD84608454038DC476E4DCA21C088484DBB9808454013BBB6B75BCA21C02BA4FCA4DA094540C78157CB9DC921C0533C2EAA450A454009A69A594BC921C06B0C3A21740A45402618CE35CCC821C0C4D155BABB0A4540C78157CB9DC921C01B84B9DDCB0B45404ED026874FCA21C0815D4D9EB20C45407383A10E2BCC21C04910AE80420D45402F6D382C0DCC21C0062B4EB5160E4540C02500FF94CA21C0ED48F59D5F0E4540C78157CB9DC921C030A017EE5C0E4540645A9BC6F6C221C0166EF9484A0E45403674B33F50BE21C0D8D825AAB70E4540DCF29194F4B821C00820B589930F4540C2DEC4909CB421C0E770ADF6B00F4540662FDB4E5BB321C0AE0CAA0D4E10454058703FE081B121C01FBB0B941410454014EB54F99EB121C0855FEAE74D0F4540D6C743DFDDAA21C097A949F0860E454084D9041896A721C01135D1E7A30E4540832F4CA60AA621C040321D3A3D0F45403DD175E107A721C084471B47AC0F454005BF0D315EA321C06EA7AD11C1104540EE60C43E01A421C08DF0F620041245409E7C7A6CCBA821C0206118B0E412454097C9703C9FB121C0959D7E501713454061C43E0114B321C075C93846B213454083C2A04CA3B121C074CE4F711C144540E813799274AD21C0A2D3F36E2C144540632992AF04AA21C06D1FF296AB134540055262D7F6A621C0E2218C9FC61345401557957D57A421C01364045438144540F08B4B55DAA221C098DBBDDC2715454041F4A44C6AA021C0C0AF912408174540EE98BA2BBBA021C06F2EFEB6271845404E2A1A6B7F9F21C0516C054D4B18454025CFF57D389021C0E04A766C041A4540299831056B8C21C0552FBFD3641C454073DA53724E8421C0581B6327BC1C45401EC539EAE88021C07E3A1E33501D4540DCB75A272E7F21C003CDE7DCED1C4540ABCC94D6DF7A21C09B8E006E161D4540E94482A9667621C0BFB67EFACF1E45406AD95A5F247421C0029F1F46081F45402448A5D8D17021C00A0F9A5DF71E45405F950B957F6D21C0137F1475E61E4540371B2B31CF6A21C0C37E4FAC531F4540EA5DBC1FB76721C03A58FFE730214540CA518028986121C0E86C01A1F5204540BAA29410AC5A21C098F6CDFDD5214540C3D50110775521C0747E8AE3C0234540A306D3307C4C21C0D5B0DF13EB244540B071FDBB3E4321C0EE4108C897244540FFCC203EB03B21C0A930B610E4244540DE3D40F7E53C21C0AABA473657254540198C1189423B21C02C9CA4F9632645409566F3380C3E21C06E8786C5A8274540CF30B5A50E3A21C0D1CDFE40B929454078D0ECBAB73A21C0A2F0D93A382A454003E962D34A3921C076C1E09A3B2C45405F420587173C21C0971DE21FB62C45406971C630274021C073DA53724E2C4540029CDEC5FB4121C00ED940BAD82C454031B1F9B8364421C0399A232BBF2C454091D26C1E874921C096E7C1DD592B454050FEEE1D354621C0CFA3E2FF8E2A454012143FC6DC4521C0C91CCBBBEA2945403B35971B0C4D21C0BAA1293BFD284540BD1E4C8A8F4F21C0FA28232E00294540B9718BF9B95121C0E1B721C66B284540FC00A436715221C09A07B0C8AF274540033E3F8C104E21C000A8E2C62D264540506F46CD575121C073F4F8BD4D254540C9AD49B7255A21C08EB27E3331254540D1E7A38CB86021C02368CC24EA234540D2FE0758AB6621C0B7088CF50D244540BEC0AC50A46B21C00E863AAC70234540B11875ADBD6F21C032005471E32445402448A5D8D17021C0B0CA85CABF2445405436ACA92C7221C0EA20AF0793244540BE66B96C747621C04051D9B0A62445402B89EC832C7B21C03B53E8BCC62245401EC539EAE88021C003ED0E2906224540BCADF4DA6C8421C063D34A21902145404D2F3196E98721C08E03AF963B214540022CF2EB879021C05F9B8D95982145406D01A1F5F09521C06C76A4FACE1F4540936E4BE4829B21C0CA32C4B12E2045404E2A1A6B7F9F21C08AE3C0ABE5204540A5129ED0EBA721C0E6E95C514A20454079B0C56E9FAD21C07E6FD39FFD20454064ADA1D45EB421C0560F98874C2145407BD80B056CB721C08F72309B002145401B48179B56BA21C028D4D347E01F4540011764CBF2BD21C00AA359D93E204540EDF0D7648DBA21C09D67EC4B3622454076C1E09A3BBA21C0E1D05B3CBC2345408BFB8F4C87B621C026C632FD12274540CEAACFD556B421C0A05225CADE264540679DF17D71B121C048C49448A22545409696917A4FAD21C0CAA4863600254540116DC7D45DA921C0399D64ABCB234540CA15DEE522A621C0D11F9A79722345404C530438BDA321C00EA2B5A2CD2345404A4563EDEFA421C07FBDC282FB254540520B259353A321C040BFEFDFBC264540E38A8BA372A321C065FF3C0D182845405A0EF450DBA621C0FFEBDCB41929454034D593F947A721C00394861A852A4540868E1D54E2AA21C07E18213CDA2A454050E09D7C7AAC21C073F4F8BD4D2B4540C0046EDDCDAB21C09F73B7EBA52B454065FCFB8C0BA721C0506EDBF7A82B4540CC0A45BA9FA321C07C98BD6C3B2B45404E2A1A6B7F9F21C08DEC4ACB482B4540B0928FDD059A21C0DE9387855A2B4540B2A03028D39821C06BBB09BE692A454070B378B1309421C09C340D8AE6294540FF58880E818B21C0EE073C30802A4540DB317557768121C023A298BC012C45401EC539EAE88021C0CF2F4AD05F2C454039F1D58EE27C21C0944C4EED0C2F45402448A5D8D17021C039D219187931454009C4EBFA056B21C06EDBF7A8BF3245408E3EE603026521C0103CBEBD6B324540423EE8D9AC6221C04834812216334540C1E5B166646021C0A33D5E48873345407825C9737D5F21C0A9A27895B5334540AA6395D2335521C095B88E71C535454044F98216125021C0139ED0EB4F36454071766B990C4F21C05322895E46374540A3CA30EE065121C0EB54F99E913645404C70EA03C95B21C0AD889AE8F33545405038BBB54C5E21C0E2C8039145364540A1478C9E5B6021C048C32973F337454021CB82893F6221C0B45549641F384540F58590F3FE6721C089EE59D7683745407AFD497CEE6C21C0BE672442233645402448A5D8D17021C06170CD1DFD354540B493C151F27A21C0CCD24ECDE534454064CC5D4BC87F21C0A9A27895B5334540D4D688601C8421C09FAEEE586C334540431EC18D948521C0CB4752D2C332454043C70E2A718D21C0A7406667D1314540EC1681B1BE9121C055DD239BAB324540D591239D819921C01C3F541A313345404E2A1A6B7F9F21C03620425C39334540C79BFC169DA421C001BD70E7C232454000917EFB3AA821C00A1346B3B23145402942EA76F6AD21C0F1F109D979314540812381069BB221C0615111A7933245404641F0F8F6B621C072DEFFC709334540C64D0D349FBB21C0F9D85DA0A434454081AFE8D66BC221C07AC8940F41354540D238D4EFC2BE21C0147B681F2B38454013471E882CC221C036936FB6B939454086ADD9CA4BC621C0B48EAA26883A4540C78157CB9DC921C0BEF73768AF3A4540D862B7CF2AD321C0679E5C53203B4540915F3FC406DB21C0289A07B0C83945409C4F1DAB94DE21C0E962D34A213A4540AF5DDA7058E221C009C38025573B454095D6DF1280DF21C0C896E5EB323C45409015FC36C4E021C0904FC8CEDB3C45401DE6CB0BB0DF21C018EAB0C22D3D45405F5D15A8C5D021C06B7F677BF43C454050C24CDBBFCA21C00533A6608D3D4540C78157CB9DC921C0BEA25BAFE93D454046990D32C9C821C09BE271512D3E45401C97715303C521C041D7BE805E3E45401C97715303C521C0E5EE737CB43E4540B37E33315DC821C03BE466B8013F4540B1A4DC7D8EC721C0BDAAB35A603F454017105A0F5FBE21C0016E162F16404540ECA012D731BE21C0B1C1C2499A3F454093E2E313B2BB21C0586FD40AD33F4540A3ACDF4C4CB721C04D49D6E1E83E4540CFF57D3848B821C025E7C41EDA3D45406B459BE3DCB621C03733FAD1703C454093E2E313B2BB21C044696FF0853B4540630E828E56BD21C061FD9FC37C3B45405A65A6B4FEBE21C0BB9BA73AE43A4540718E3A3AAEBE21C096422097383A4540D5B0DF13EBBC21C032569BFF5739454093E2E313B2BB21C0A6B6D4415E39454082AD122C0EB721C02C0C91D3D739454021B0726891B521C0103CBEBD6B3A4540363D282845B321C01A31B3CF633A454051DA1B7C61B221C0ABCC94D6DF3A4540B83F170D19AF21C0E606431D563A45402750C42286AD21C0FFB27BF2B03A454079758E01D9AB21C0C68B8521723A4540DC8310902FA921C09AD024B1A43A4540DFC0E44691A521C01990BDDEFD394540D49CBCC804A421C0AAB8718BF939454008944DB9C2A321C0E90FCD3CB93A45407497C45911A521C09C1727BEDA3B45403A419B1C3EA921C050E10852293C4540B1A4DC7D8EA721C09F1EDB32E03C4540EF38454772A921C07DD0B359F53D4540C158DFC0E4A621C04E0E9F74223F4540643DB5FAEAA221C0A96A82A8FB3E45404E2A1A6B7F9F21C05F622CD32F3F45402864E76D6C9E21C080B9162D403F4540211E8997A79B21C029931ADA0040454022C32ADEC89C21C07F4E417E364045404E2A1A6B7F9F21C0AD307DAF2140454055DFF94509A221C02B685A6265404540DCA16131EAA221C04CFE277FF74045400762D9CC21A121C0B1C398F4F742454042CD902A8AA721C0E36F7B82C4424540D6A8876874A721C0F59CF4BEF143454073A25D8594A721C0179F02603C4545405F5E807D74AA21C09FAC18AE0E464540E9F17B9BFEAC21C08E791D71C8464540A81DFE9AACA921C057410C74ED4745403C2EAA4544A921C07B12D89C83494540DFA815A6EFA521C07B8505F7034A45404E2A1A6B7F9F21C048895DDBDB494540DC9E20B1DD9D21C0FA9AE5B2D14945408AC8B08A379A21C001F8A754894A4540D26EF4311F9821C0A6D6FB8D764A4540BA15C26A2C9121C0E17EC003034C4540F321A81ABD8A21C0E294B9F9464C45405FB4C70BE98821C0B779E3A4304D454090BC7328438D21C0DC7F643A744E4540139B8F6B438D21C086C8E9EBF94E4540FE0C6FD6E08521C0541C075E2D5145401EC539EAE88021C03C32569BFF5145405D876A4AB27E21C083FA96395D5245409B00C3F2E77B21C0BB438A0112534540394206F2EC7A21C0AA9A20EA3E54454018B49080D17521C0B41D5377655545400BF0DDE68D7321C0344B02D4D4564540E0F42EDE8F7321C0F7729F1C0558454029CDE671187421C03B38D89B1858454064CBF275197621C07AE40F069E574540EB1D6E87867521C0D26D895C7056454005FA449E247D21C013F4177AC45445406F9C14E63D7E21C0AA9A20EA3E544540E00F3FFF3D8021C05C001AA54B5345402C29779FE38321C0336E6AA0F9524540B515FBCBEE8921C0651877836853454072BF4351A08F21C06AD95A5F2452454068CC24EA059721C0B80375CAA3514540D40B3ECDC99B21C0D76D50FBAD5145404E2A1A6B7F9F21C096EA025E66524540267156444DA421C0AAF06778B35245409CDD5A26C3A121C0AA9A20EA3E5445400745F30016A121C051888043A85445402461DF4E22A221C007793D98145545408A3E1F65C4A521C0AB22DC64545545401898158A74A721C0AB22DC6454554540A73E90BC73A821C0AB22DC64545545405517F032C3AE21C05437177FDB57454064CC5D4BC8AF21C0496760E465574540BDC282FB01AF21C05778978BF85445402F1686C8E9B321C003B68311FB5445406891ED7C3FB521C0AA9A20EA3E5445403F1F65C405B821C0075DC2A1B752454076374F75C8B521C0D1CC936B0A524540A795422097B021C0E4A08499B6514540F06B2409C2AD21C0836DC493DD504540ED9C668176AF21C09EEBFB70905045407BBFD18E1BB621C03716140665504540A7B228ECA2B821C0431A1538D94E454084D9041896B721C0AF997CB3CD4D4540CB48BDA772BA21C0F04E3E3DB64D4540DE57E542E5BF21C0240F4416694E454087C5A86BEDC521C00CE6AF90B94E4540012F336C94C521C038F581E49D4F4540CDB1BCAB1EC021C024D40CA9A25045402FBE688F17C221C09D6340F67A514540B1A4DC7D8EC721C058923CD7F7514540C78157CB9DC921C09AB51490F651454037C5E3A25ACC21C077137CD3F4514540CAFE791A30D021C01EA8531EDD50454050C58D5BCCDF21C0DECCE847C34D4540FCE07CEA58DD21C022FE614B8F4C4540C8EF6DFAB3D721C03A2174D0254C4540043A933655D721C0B5DD04DF344B45406E4C4F58E2E121C09DD497A59D4A4540C40B2252D3E621C0C007AF5DDA4A45406EF9484A7AE821C0C573B680D04A4540304AD05FE8E921C0AAB69BE09B4A4540AE10566309EB21C0F8A6E9B3034A4540C1745AB741ED21C0BB7EC16ED84845401F4B1FBAA0F621C0184339D1AE4845404487C09140FB21C0C40776FC174845406FD921FE61FB21C0FE5F75E44847454044A7E7DD58F821C09FAC18AE0E46454042EA76F695F721C039807EDFBF454540FA0967B796F921C0696FF085C944454059A48977800722C0C72C7B12D8424540C1CAA145B60B22C0C74B378941424540CFD8976C3C1022C0C9207711A64245405DDDB1D8261522C0D0B4C4CA68424540780C8FFD2C1622C05B7D7555A0424540508A56EE051622C0C72C7B12D8424540EF3A1BF2CF1422C00EF7915B93444540880FECF82F1022C01FDAC70A7E454540C80C54C6BF0F22C09FAC18AE0E464540ACCABE2B820F22C07D09151C5E46454063D2DF4BE11122C0BF28417FA14745401B4B581B631722C0BEBC00FBE848454004ADC090D51D22C011E0F42EDE494540F5F3A622152622C007B309302C4945405512D907592622C000E14389964845407AC37DE4D62C22C069519FE40E4945407D5A457F682E22C0CE6C57E883494540E19A3BFA5F2E22C055A52DAEF1494540D28C45D3D92922C0F2237EC51A4A454061A5828AAA2722C047E4BB94BA4A4540F3E505D8472722C0E20511A9694B4540B745990D322922C04C18CDCAF64B4540BF7FF3E2C42722C01BBCAFCA854C4540645930F1472122C018B14F00C54C4540D1949D7E501F22C06E4DBA2D914D4540529E7939EC1E22C0A6D425E3184F45401B4B581B631722C03A3DEFC6825045407DCC07043A1322C0C6E1CCAFE652454035B742588D1522C07EE19524CF534540F9F36DC1521522C0AA9A20EA3E5445403CDEE4B7E81422C09CA564390955454000AC8E1CE91422C0CF488446B05545405B79C9FFE40F22C06614CB2DAD564540ADFA5C6DC50E22C0AAF3A8F8BF594540E8D84125AE0B22C0CD751A69A95A45401EF98381E70622C01A53B0C6D95A45400B9A9658190522C00C3CF71E2E5B454056D28A6F280422C0F56569A7E65C4540CE37A27BD6FD21C08C67D0D03F5D454097E65608ABF921C05FEE93A3005F454084BA48A12CF421C022FC8BA0315F45401E17D522A2F021C0B612BA4BE25E4540AE10566309EB21C07C293C68765F4540C00303081FEA21C0C30FCEA78E5F4540232F6B6281E721C06FB9FAB1496045409B1F7F6951E721C0620FED6305614540B6813B50A7E421C0EA58A5F44C6145407A6F0C01C0E121C060E4654D2C624540CB4C69FD2DE121C0A583F57F0E63454026512FF834DF21C01F2BF86D88634540EE27637C98DD21C0CC7F48BF7D634540D3BD4EEACBDA21C0062AE3DF6764454004763579CAD221C0F98557923C654540C78157CB9DC921C0F4A8F8BF23644540CDCEA2772AC821C0F3CCCB61F763454038DBDC989EC821C0D42B6519E2644540C78157CB9DC921C0A702EE79FE6445406D1D1CEC4DCC21C0155454FD4A65454098512CB7B4CA21C07DE71725E865454022E010AAD4CC21C0AFB321FFCC6645401EA9BEF38BCA21C0C972124A5F684540C78157CB9DC921C0D63730B95168454048FDF50A0BC621C0F1BBE9961D684540427C60C77FC121C00E1478279F6845408B70935165C021C061C1FD80076A4540026729594EC221C0FC36C478CD6945409A43520B25C321C03F74417DCB6845402EFF21FDF6C521C0AF22A30392684540C78157CB9DC921C0AB5D13D21A694540ED9925016ACA21C0EF737CB43869454005A2276552CB21C05F605628D2694540CFBEF2203DCD21C0E144F46BEB6945405C92037635D121C0420A9E42AE66454033C005D9B2D421C02882380F27664540CCEB884336D821C0F06AB93313664540FBEAAA402DDE21C0522976340E674540037B4CA434E321C0B4E6C75F5A664540289A07B0C8E721C0CB83F41439644540E8F9D34675EA21C0FFAECF9CF56345404206F2ECF2ED21C040DF162CD56345407F349C3237EF21C018946934B9644540D1798D5DA2F221C0F8FA5A971A6545405665DF15C1F721C0CE1ABCAFCA6345402672C119FC0522C05FD3838252644540DB87BCE5EA0722C04DF8A57EDE644540C9AB730CC80622C032C9C859D8654540A0185932C70A22C0B4E6C75F5A66454077BAF3C4730E22C032772D211F664540FFE89B340D1222C0335019FF3E654540D046AE9B521622C0B2D47ABFD16445407FC16ED8B62022C014AE47E17A644540475A2A6F472022C0325A4755136445404F05DCF3FC1922C06D1B4641F062454025CB49287D1922C0DE04DF347D62454040A54A94BD1D22C0E31C75745C6145407F8461C0922322C05DDDB1D826614540EF54C03DCF2722C08F8AFF3BA26045405D19541B9C2822C01213D4F02D6045403AAFB14B542722C055849B8C2A5F4540C0417BF5F12822C07862D68BA15E45407784D382172D22C076FA415DA45E4540E7C2482F6A2F22C0A30227DBC05F454052D158FB3B3322C0EACF7EA48860454057CC086F0F3A22C0D2E1218C9F604540A796ADF5453A22C0D68BA19C68614540853FC39B354022C04F3DD2E0B6624540F7031E18404022C0D1B1834A5C634540289D4830D54422C0977329AE2A6545408080B56AD74C22C01F69705B5B664540C64D0D349F4B22C06D904946CE664540B7B585E7A54222C058E6ADBA0E67454060E5D022DB3922C05682C5E1CC67454006651A4D2E3622C0810A47904A694540FA5E43705C3622C0DE72F563936A4540198F52094F3822C0448655BC916B45403ECBF3E0EE3C22C0ADC1FBAA5C6C45403F541A31B33F22C0CDE49B6D6E6C45403EB14E95EF4122C0637AC2120F6C4540A03715A9304622C06EA7AD11C16C454036CAFACDC44C22C04BB1A371A86F4540890CAB78234B22C089B5F814007145403C84F1D3B84722C0A4C343183F7145407E5182FE424722C01399B9C0E5714540A58636001B4822C028D36872317245400CC85EEFFE4822C06AF5D5558172454087A2409FC84322C0BF64E3C116734540C44142942F4022C05B79C9FFE4734540AFB5F7A92A4422C01212691B7F744540804754A86E4622C0AFD172A087744540BBEF181EFB4922C078EE3D5C72744540901150E1085222C0A05225CADE744540397B67B4555922C04D840D4FAF7845405F9A22C0E95D22C05ABC581822794540D7135D177E6022C0CF6BEC12D5794540EF0390DAC46122C052103CBEBD7945406BD8EF89756222C04968CBB914794540CAC342AD695E22C06B274A4222774540A0DCB6EF515F22C05C035B2558764540EAB303AE2B5E22C01C7920B248754540C87DAB75E26A22C082C98D226B754540594FADBEBA6A22C0C66D3480B7764540A3EA573A1F6E22C071766B990C77454069AA27F38F6E22C021938C9C85774540EACDA8F92A7122C03C4D66BCAD784540C652245F097422C0267156444D78454013B9E00CFE7622C03D997FF44D7845403DD68C0C727722C0552E54FEB5764540048D9944BD8022C07C26FBE7697645405839B4C8768622C0A3772AE09E7545407C2AA73D258722C056B8E52329754540085BECF6598522C0E466B8019F734540282A1BD6548622C0952A51F696724540102384471B8722C028D3687231724540D844662E708922C0663046240A7145405E85949F548B22C044FD2E6CCD7045407D5BB054179022C028D36872317245406C0A6476168D22C0F6436CB0707445407077D66EBB9022C0DEC66647AA754540E67805A2279522C0D11E2FA4C37545402D05A4FD0F9822C0CB83F4143976454068E7340BB49322C047C7D5C8AE784540B2D5E594809022C04FB16A10E67845402BDA1CE7369122C0B91803EB387A454005A4FD0FB08E22C0E259828C807A45406891ED7C3F8D22C0102384471B7B4540A59F70766B8922C03D27BD6F7C7B45408A56EE05668522C070EB6E9EEA7C4540A585CB2A6C8622C03AAE4676A57D4540DBA2CC06998422C0486DE2E47E7F4540CB9C2E8B898522C0581D39D219804540465C001AA58322C024D5777E51804540904E5DF92C8722C0C68844A16581454012FB04508C8C22C0209A79724D814540060E68E90A8E22C0AED4B32094814540F6ECB94C4D9222C001FC53AA44854540E99C9FE2389822C09BAE27BA2E86454046990D32C99822C02DCE18E6048745401553E9279C9522C0D8B969334E874540F321A81ABD9222C0F2EF332E1C864540BAA46ABB098E22C02C8194D8B5854540D63BDC0E0D8B22C0AF997CB3CD854540B9C32632738922C0D5264EEE77864540F7AB00DF6D8622C04CE3175E49864540450E1137A78222C0707B82C4768745406F1283C0CA8122C09692E52494884540FBCE2F4AD07F22C0D13DEB1A2D89454084D6C397898222C0B821C66B5E8B45402E71E481C88222C0FDD98F14918B45403065E080967E22C08FFB56EBC48B4540598638D6C57D22C0B821C66B5E8B45404D327216F67C22C01689096AF88A4540CE6F9868907A22C0B821C66B5E8B4540E02C25CB497822C0A7AFE76B968B454003EB387EA87422C0656F29E78B8B4540C652245F097422C0B821C66B5E8B454037C478CDAB7222C0B821C66B5E8B45402026E1421E7122C0CE6C57E8838B45400589EDEE017222C0D906EE409D8C4540732A1900AA7022C0526342CC258D4540583B8A73D47122C07BF486FBC88D45409833DB15FA7022C0BDC458A65F8E45403DD175E1076F22C04F965AEF378E4540A7CD380D516D22C09FCC3FFA268D454011397D3D5F6B22C0A08CF161F68C4540A30227DBC06522C0D40D1478278D4540B69DB646046322C0C1FEEBDCB48B4540728A8EE4F25F22C048A7AE7C968B4540C614AC71365D22C0A3B08BA2078C4540D97745F0BF5D22C0BDE5EAC7268D4540514B732B845522C0CDE7DCED7A8D45406072A3C85A5322C049D576137C8F4540070B2769FE5022C00133DFC14F9045401422E010AA5422C0FA0B3D62F49045408EAED2DD755622C0656D533C2E92454080BBECD79D5E22C06C41EF8D2190454031242713B76222C063635E471C904540397F130A116822C09F1EDB32E0904540D4484BE5ED6822C07A8B87F71C9245408C12F4177A6C22C00D350A4966934540575EF23FF96B22C0B2F336363B9445405A0EF450DB6622C08CBCAC8905944540CFDC43C2F75E22C0BC5AEECC049545402B4EB516665922C08DF161F6B2974540B875374F755022C0CA6E66F4A39745402DCDAD10564B22C09BCAA2B08B984540CE177B2FBE4022C0C7832D76FB984540685BCD3AE33B22C0452BF702B3984540CD74AF93FA3A22C043E7357689984540D8B79388F03722C030B8E68EFE974540223999B8553022C0931B45D61A9845409087BEBB952D22C0FF4124438E974540B43BA418202922C0BCCE86FC339745406F0C01C0B12722C011FFB0A5479745402D211FF46C2622C0F241CF66D5974540B5183C4CFB1E22C09AB67F65A59745400EBC5AEECC1422C0F5143944DC984540630CACE3F81122C09B92ACC3D19945401842CEFBFF1022C0B1FCF9B6609B45402B6C06B8200B22C0863B17467A9B45408675E3DD910922C045679945289C4540F94A2025760522C018B14F00C59C4540E0D91EBDE10622C01E1B81785D9D4540F27A30293E0622C01763601DC79D4540A7CB6262F30122C0A0168387699D4540A0C03BF9F40022C0C74CA25EF09B4540BF654E97C5FC21C064AF777FBC9B45405854C4E924FB21C0F0366F9C149C45405E13D21A83F621C046239F573C9D4540CB4C69FD2DF121C055FA0967B79C45400FB8AE9811EE21C0C0232A54379D45402D9622F94AE821C09468C9E3699D4540B16CE690D4E221C0AB23473A039D4540D4484BE5EDE021C04E5FCFD72C9D4540DBFB54151AE021C0750305DEC99D454018265305A3E221C0BF823463D19E45401E6CB1DB67E521C0E3512AE1099F4540FC389A232BE721C05CFFAECF9C9F4540C26C020CCBE721C0E6EB32FCA7A1454050FC1873D7EA21C0D88349F1F1A1454035272F3201EF21C000C79E3D97A1454090A339B2F2F321C01DC9E53FA4A145406A2FA2ED98FA21C0F817416326A34540616BB6F292F721C078B5DC9909A445403524EEB1F4F121C0645B069CA5A4454068AED3484BED21C0F33E8EE6C8A4454003D19332A9E921C0933A014D84A54540B7442E3883DF21C0ECC1A4F8F8A445402E8ECA4DD4DA21C007EA944737A4454043739D465ADA21C05B069CA564A54540CD936B0A64D621C00A815CE2C8A54540AA7F10C990D321C0B187F6B182A545405D19541B9CD021C0AA0A0DC4B2A54540E6762FF7C9D121C000FE2955A2A645405EDA70581AD021C08D7E349C32A74540FB5C6DC5FED221C0EF1EA0FB72A845407787140324D221C099B8551003A94540C78157CB9DC921C0C362D4B5F6A845403526C45C52C521C0207EFE7BF0A84540A4349BC761C021C0EBAD81AD12A845401C412AC58EBE21C0A1681EC022A9454093E2E313B2BB21C001DF6DDE38A94540EEB089CC5CB821C00C5BB39597A845405E0EBBEF18B621C03D80457EFDA845400684D6C397B121C024D3A1D3F3A84540BDFE243E77B221C09D47C5FF1DAB454046D1031F83AD21C084F4143944AC45409E5F94A0BFA821C0438CD7BCAAAB4540FDF50A0BEEA721C02FBE688F17AA4540B2683A3B19A421C0B6A0F7C610AA4540971B0C7558A121C03A0664AF77A945404E2A1A6B7F9F21C01536035C90A94540A7CD380D519D21C0A12C7C7DADA9454079EA9106B79D21C0ECC039234AA94540564ACFF4129B21C0DD2230D637A845405C902DCBD79521C0959BA8A5B9A745406C5F402FDC9121C097917A4FE5A64540B70DA320788C21C051DA1B7C61A64540E3FBE252958621C05FB532E197A645401EC539EAE88021C094F8DC09F6A545404BAB21718F7D21C048A7AE7C96A54540AB77B81D1A7621C048895DDBDBA5454015CAC2D7D77221C08FE4F21FD2A545402448A5D8D17021C03F726BD26DA54540FC7266BB426F21C0E97C789620A5454078B81D1A166B21C0F1D58EE21CA54540B35F77BAF35C21C0EAE74D452AA6454052B81E85EB5121C05BB1BFEC9EA64540DB6CACC43C4B21C0338AE59656A74540889FFF1EBC4621C0AA0B789961A74540D9B27C5D863F21C0BDA772DA53A8454038BEF6CC923821C07880272D5CA84540A7E67283A13621C039B69E211CA94540253CA1D79F3421C0747B4963B4A84540965D30B8E62E21C044DFDDCA12A94540BF7E880D162E21C01903EB387EA845408D0DDDEC0F2C21C0FC17080264A8454045813E91272921C03352EFA99CA84540C0779B374E2221C0D52137C30DA845403B376DC6691821C0C03E3A75E5A74540734C16F71F1121C0D68EE21C75A8454032C7F2AE7A0821C070B4E386DFA9454001857AFA080421C0EE77280AF4A945400E4DD9E907FD20C09D6516A1D8AC4540C284D1AC6CFF20C0B2D991EA3BAD454081EB8A19E1FD20C03D9B559FABAD4540384888F205FD20C07DB3CD8DE9AD4540A08B868C47F920C01AC40776FCAD454089450C3B8CF920C03D9B559FABAD4540F1F09E03CBF920C07B87DBA161AD4540C3EFA65B76F820C0A47213B534AD45408811C2A38DF320C015E63DCE34AD4540FFEC478AC8F020C03D9B559FABAD4540EA23F0879FEF20C03D9B559FABAD45409A7D1EA33CEB20C073F1B73D41AE4540890B40A374E920C0F1F274AE28AF45407EC6850321E120C006F52D73BAB04540E2E995B20CD920C04B00FE2955B0454017A06D35EBD420C0D10836AE7FAF454098A7734529D120C0A5828AAA5FAF4540F04FA91265CF20C06878B306EFAF454055A52DAEF1D120C0350BB43BA4B04540EB387EA834D220C0D15AD1E638B14540C7D5C8AEB4CC20C089EDEE01BAB145407765170CAEC920C04546072461B14540E5D2F88557CA20C093DFA293A5B04540261C7A8B87C720C0912A8A5759AF45408FFF024180CC20C06477819202AF4540535A7F4B00CE20C07880272D5CAE4540AB3FC23060C920C03D9B559FABAD4540B81D1A16A3C620C0DD42572250AD45405646239F57C420C09DD5027B4CAC4540A77686A92DC520C03E3E213B6FAB4540DCF29194F4B820C0F1BC546CCCAB45404A44F81741B320C06CB587BD50AC45406E693524EEB120C039252026E1AC454022A5D93C0EB320C03D9B559FABAD4540E71A66683CB120C0A7CF0EB8AEAE4540A5D7666325AE20C078B81D1A16AF4540DF8C9AAF92AF20C0261C7A8B87AF4540731074B4AAAD20C0CF31207BBDAF45404C89247A19AD20C001BEDBBC71B04540EB1ED95C35AF20C0F607CA6DFBB04540A6D1E4620CB420C0AC6F6072A3B0454018062CB98AB520C07270E998F3B04540B4E55C8AABB220C03813D38558B14540E9818FC18AB320C0B01EF7ADD6B145403E93FDF334B020C074CE4F711CB245403F6EBF7CB2B220C07D08AA46AFB245405798BED710AC20C0C0232A5437B345409AB0FD648CA720C0EC51B81E85B34540FE261422E0A020C086014BAE62B34540C0098508389C20C0503A9160AAB34540E3FC4D28449820C0A35C1ABFF0B24540853FC39B359820C0BFD18E1B7EB14540088F368E589320C0A9A44E4013B14540E1D39CBCC88C20C0A2B2614D65B1454041118B18768820C0537AA69718B14540B4942C27A18420C05760C8EA56AF4540172EABB0198020C0C7B8E2E2A8AE454020CF2EDFFA8020C03D9B559FABAD4540CD21A985928120C023BC3D0801AD4540094E7D20797F20C08B18761893AC454094DE37BEF67C20C000CADFBDA3AC4540DE1FEF552B7B20C0BF1072DEFFAB45403D9B559FAB7520C0A2B77878CFAB4540450E1137A77220C09E5F94A0BFAA454030D7A205686B20C0501C40BFEFA945400F99F221A86A20C012876C205DAA4540BCCFF1D1E26C20C0BE30992A18AB454061342BDB876C20C0A5BC564277AB4540F14A92E7FA6620C000AC8E1CE9AA4540AC3C81B0536C20C00EBC5AEECCAC454050560C57077020C00E12A27C41AD4540CA32C4B12E6E20C03D9B559FABAD45402E8ECA4DD46A20C0876C205D6CAE4540A3772AE09E6F20C0A5DAA7E331AF454031CF4A5AF16D20C0BAD7497D59B045403BA6EECA2E7020C05A9F724C16B14540E066F162617020C067D65240DAB14540B1169F02606C20C000AAB8718BB3454097FE25A94C6920C0C03DCF9F36B445407B6AF5D5556120C0D5592DB0C7B4454017D7F84CF65F20C0D45FAFB0E0B44540378E588B4F5920C001A60C1CD0B44540F986C267EB5820C06B662D05A4B545405DFB027AE15E20C0478E740646B6454017D7F84CF65F20C07593180456B645407B6AF5D5556120C041F4A44C6AB645402EC901BB9A6420C0ECD973999AB64540715AF0A2AF6820C0F7CABC55D7B5454029779FE3A36D20C0B2632310AFB545409FE3A3C5197320C04963B48EAAB64540E6B0FB8EE17920C026E4839ECDB64540AB59677C5F7C20C0C5E3A25A44B64540A8195245F17A20C08A558330B7B545409CFC169D2C7D20C0A33D5E4887B545403EEC8502B68320C09BAF928FDDB54540A67C08AA468F20C069E04735ECB74540F08975AA7C9720C0200DA7CCCDB745405000C5C8929920C09010E50B5AB845402BC0779B379E20C0A9BD88B663B84540BE11DDB3AEA120C0F4A62215C6B84540BA4C4D82379C20C0C05DF6EB4EB94540DF878384289F20C072F90FE9B7B9454012BEF737689F20C02D0B26FE28BA45403259DC7F649A20C09929ADBF25BA45405439ED29398F20C026E4839ECDBA45404051D9B0A68A20C0BAA0BE654EBB45405D1ABFF04A8A20C0FAEFC16B97BA4540D7187442E88820C0CBF78C4468BA4540E0A128D0278220C0320400C79EBB45403EB48F15FC7E20C0E2E995B20CBB4540FCFF3861C27820C0A6F10BAF24BB45406BF12900C67320C02829B000A6BA4540573ECBF3E06E20C003CDE7DCEDBA4540376C5B94D96820C0D9976C3CD8BA45407B6AF5D5556120C0AFEAAC16D8BB454017D7F84CF65F20C04A99D4D006BC45401AC40776FC5720C05A9F724C16BD454050A73CBA115620C01A8A3BDEE4BD45400B96EA025E5620C0029B73F04CBE4540CD751A69A95420C079E75086AABE4540B51B7DCC075420C09EF0129CFABE4540B51B7DCC075420C04F92AE997CBF4540C022BF7E885520C0649291B3B0BF4540B51B7DCC075420C0598638D6C5BF454009A7052FFA5220C0E84CDA54DDBF4540B3976DA7AD5120C08F1B7E37DDC0454068925852EE4E20C0B14D2A1A6BC145407959130B7C4D20C092E7FA3E1CC24540E8305F5E805520C0B03C484F91C145403F1BB96E4A5920C0404E98309ABF454017D7F84CF65F20C0DE8E705AF0BE45407B6AF5D5556120C0A305685BCDBE454070067FBF986520C0DAA9B9DC60BE4540AB75E272BC6220C095B88E71C5BD45406F4A79AD846620C062A06B5F40BD454056F2B1BB406920C045813E9127BD454074D0251C7A6B20C0255CC823B8BD454017B9A7AB3B6E20C0AD4ECE50DCBD4540CD902A8A577120C0344A97FE25BD45406ABDDF68C77520C09B374E0AF3BC45404CC45BE7DF7620C0861E317A6EBD45404FC939B1877E20C027BF45274BBD45404C1B0E4B037F20C04206F2ECF2BD4540CCB4FD2B2B7D20C068CD8FBFB4BE4540BAA0BE654E7F20C0A67D737FF5BE454098A432C51C8420C05D37A5BC56BE4540A2258FA7E58720C08639419B1CBC4540098CF50D4C8E20C09FE74F1BD5BB454008C90226709320C01BBAD91F28BB45402B4D4A41B79720C007280D350ABB454070B20DDC819A20C0501DAB949EBB45401F300F99F2A120C09753026212BC4540DC4944F817A920C0F646AD307DBB45402DCE18E604AD20C008E8BE9CD9BA45407A1C06F357B020C0207D93A641BB45408C6A11514CAE20C099F4F75278BC45400DDFC2BAF1A620C03D433866D9BD4540B5FE9600FCA320C069C537143EBF454054ABAFAE0AA420C07CF31B261AC045407C9A931799A820C07A54FCDF11C14540B96FB54E5CA620C0B16CE690D4C24540486E4DBA2DA120C0664CC11A67C34540C5E3A25A449C20C0D9B3E73235C34540B01D8CD8279820C03C31EBC550C44540B0E595EB6D9B20C066683C11C4C5454000A94D9CDC9F20C02F50526001C6454074ECA012D7A120C07AFD497CEEC645408ACA863595A520C0865968E734C74540605B3FFD67A520C04A42226DE3C74540ADA415DF50A020C019028063CFC8454070B4E386DF9D20C0E2016553AEC84540A8195245F19A20C0CD785BE9B5C74540BBB88D06F09620C0ECA353573EC74540357EE195248F20C044DE72F563C74540CC7D7214208A20C0E95F92CA14C7454065E256410C8420C0C713419C87C74540A0A52BD8467C20C03BC269C18BC8454040FA264D837220C08D9944BDE0C945402C9FE579706F20C056BABBCE86CA4540E1B20A9B016E20C01502B9C491CB4540946934B9186320C09C36E33444CD4540FA9B5088806320C013471E882CCE45407B6AF5D5556120C001892650C4CE4540E770ADF6B05F20C0D28E1B7E37CF45405C1C959BA85D20C0E86B96CB46CF4540207EFE7BF05A20C0F321A81ABDCE454050172994855720C09C3237DF88CE45401ADCD6169E4F20C05F7AFB73D1CE4540A585CB2A6C4620C04A6249B9FBD045407880272D5C3E20C0F5A276BF0AD245405EDBDB2DC93920C0F965304624D2454023861DC6A43720C0438F183DB7D2454000FE2955A23420C0865AD3BCE3D2454098DBBDDC272F20C05130630AD6D4454063096B63EC2C20C06808C72C7BD445403C16DBA4A22920C0768C2B2E8ED2454076FBAC32532220C0E657738060D2454019E8DA17D02320C071E481C822D345403ACAC16C021C20C0C4211B4817D34540D923D40CA91A20C0F56393FC88D3454014E81379921C20C0AED85F764FD44540BF7E880D162620C026FC523F6FD44540069E7B0F972420C0FE62B66455D64540F5F3A622152620C08BE255D636D74540211D1EC2F82120C0CCB392567CD74540A9A5B915C22220C0060E68E90AD8454094DBF63DEA1F20C02106BAF605DA454056B8E523291920C00745F30016DB45403C855CA9671120C0F46A80D250DB454087A4164A260F20C002BC051214DB45407A1A3048FA0C20C067F0F78BD9DA45404F2157EA590820C09CC24A0515DB4540198C1189420320C085285FD042DA45401BBB44F5D60020C0A7AD11C138DA45408735954561D71FC0C3F5285C8FDC4540B0AA5E7EA7C91FC052F2EA1C03DE45401D739EB12FC91FC01C23D923D4DE4540895DDBDB2DB91FC0E92CB308C5DE45401956F146E6B11FC0A759A0DD21DF45408B8C0E48C29E1FC0682096CD1CE24540034356B77A8E1FC012DA722EC5E145404302469737771FC0ACC77DAB75E245405858703FE0711FC0888043A852E14540F0880AD5CD751FC08907944DB9DE4540D7C22CB4737A1FC047382D78D1DD454074B33F506E6B1FC0DD79E2395BDC4540F9BF232A54671FC09A6038D730DB45407AFEB4519D6E1FC02F302B14E9DA4540E0D91EBDE17E1FC0CADC7C23BADB4540348639419B7C1FC0E0BDA3C684DA454038F581E49D831FC0FA7E6ABC74D9454092EC116A86841FC025ECDB4944D84540FEEF880AD58D1FC0015130630AD8454062BD512B4C8F1FC0471CB28174D745406BF46A80D2801FC02009FB7612D74540A7203F1BB97E1FC04981053065D6454070EB6E9EEA801FC0EC6CC83F33D64540B1FCF9B660891FC00EDAAB8F87D64540A165DD3F16921FC0D06394675ED64540F0332E1C08991FC0E7E44526E0D5454000E5EFDE51931FC02DCDAD1056D5454035B8AD2D3C7F1FC0C4793881E9D44540109370218F701FC01D5BCF108ED54540CC272B86AB631FC0B169A510C8D545402E02637D03631FC0371C96067ED64540EF02250516701FC0CEA5B8AAECD74540F778211D1E721FC0B79BE09BA6D945407171546EA2661FC02106BAF605DA45409DF3531C075E1FC04F401361C3D94540A98427F4FA531FC0001AA54BFFD845404FEB36A8FD461FC034F3E49A02D945402995F0845E4F1FC0F99D2633DEDA454056293DD34B4C1FC0AF5A99F04BDB45400B9755D80C401FC0E753C72AA5DB4540C0D02346CF3D1FC06765FB90B7DC4540BE50C07630321FC0EBABAB02B5DC45404FE8F527F1291FC0E9D1544FE6DD45406C3F19E3C31C1FC039454772F9DD4540B32616F88AFE1EC03F726BD26DDF454019028063CFEE1EC0276C3F19E3DF4540B1C05774EBE51EC0643A747ADEDF4540998235CEA6E31EC0CD58349D9DE04540FAEE5696E8DC1EC0239F573CF5E045409B00C3F2E7DB1EC0950F41D5E8E14540386744696FC01EC0377172BF43E34540A24621C9ACBE1EC025CD1FD3DAE4454064CA87A06AB41EC0C5FF1D51A1E44540FA415DA450A61EC03E963E7441E345401CB28174B1A91EC00C03965CC5E24540389ECF807AB31EC04B2366F679E24540F9DA334B02B41EC0BD35B05582E145404A0856D5CBBF1EC074B515FBCBE04540554FE61F7DC31EC03D49BA66F2DF454016A243E048C01EC093C7D3F203DF45401805C1E3DBCB1EC07D772B4B74DE4540DE550F9887CC1EC047E6913F18DE4540EDB60BCD75BA1EC04D13B69F8CDD45409A266C3F19B31EC0EF02250516DE4540392861A6EDAF1EC01C78B5DC99DF45405C751DAA29A91EC0B6847CD0B3DF45401FF296AB1F9B1EC01C0B0A8332DF454087527B116D971EC0705CC64D0DE0454068B27F9E068C1EC04A7B832F4CE04540E4D9E55B1F861EC0F56915FDA1DF454018B49080D1851EC029B3412619DF4540F4C0C760C5891EC043E7357689DE4540E04C4C1762851EC06B990CC7F3DD454062855B3E92821EC0F146E6913FDC45404EEE77280A741EC01A8BA6B393DB45403830B951646D1EC0C5707500C4DB4540F9A067B3EA731EC00395F1EF33DA4540A9BC1DE1B4701EC03753211E89D945402B155454FD6A1EC0C408E1D1C6D94540E99AC937DB6C1EC01F10E84CDAD845405437177FDB731EC08CD9925511D845400403081F4A741EC0C5387F130AD745403F027FF8F96F1EC066F84F3750D6454049BA66F2CD661EC071CADC7C23D6454020D4450A65611EC0A0A4C00298D6454097FE25A94C611EC066F4A3E194D7454097749483D9541EC0DF6DDE3829D845404912842BA0501EC0A27A6B60ABD84540D50451F701581EC05F7AFB73D1DA45402B685A6265541EC0D4F02DAC1BDB4540AE282504AB4A1EC08FC360FE0ADB454086E7A562633E1EC09546CCECF3DA45406EDFA3FE7A351EC0C0B33D7AC3DB4540A9BEF38B12341EC0BAF94674CFDC4540CD599F724C361EC067800BB265DD454044F7AC6BB42C1EC0D76D50FBADDD4540B77BB94F8E221EC0BB421F2C63DD4540A565A4DE53191EC029CDE67118DE454016FC36C4780D1EC0B64DF1B8A8DC4540ABED26F8A6091EC02D26361FD7DC4540802C4487C0011EC0643E20D099DC454078EFA83121F61DC07D586FD40ADD454088F546AD30ED1DC0B1C403CAA6DC45401B2FDD2406E11DC0B6476FB88FDC454081936DE00EE41DC0884B8E3BA5DB454042B28009DCEA1DC04ED4D2DC0ADB4540990E9D9E77E31DC066BE839F38DA4540CF108E59F6C41DC086AA984A3FD9454058AD4CF8A5BE1DC03DB83B6BB7D9454072361D01DCBC1DC09C18929389D945406DAB59677CBF1DC0B7973446EBD84540E2900DA48BAD1DC0B875374F75D84540EA77616BB6A21DC045B8C9A832D84540C405A051BA941DC03D9D2B4A09D7454059147651F4801DC0B98C9B1A68D64540E9297288B8791DC045D4449F8FD64540C5538F34B86D1DC0BB9866BAD7D54540914259F8FA6A1DC024ED461FF3D34540F16778B3065F1DC020459DB987D2454056D4601A865F1DC025CFF57D38D24540F2B0506B9A571DC0B8955E9B8DD14540130CE71A66581DC014D044D8F0D04540156F641EF9531DC0CBDAA6785CD045407E71A94A5B4C1DC02CF4C13236D04540626A4B1DE4451DC07CD11E2FA4CF454035D07CCEDD3E1DC0A4FE7A8505CF45404A26A77686391DC085CC9541B5CD4540109370218F301DC061E124CD1FCD45402D08E57D1C2D1DC08B19E1ED41CC45409833DB15FA301DC0E7012CF2EBCB45405FB4C70BE9201DC09F2287889BCB45406760E4654D0C1DC0226DE34F54CA4540C51EDAC70AFE1CC0890AD5CDC5C94540ABEAE5779AFC1CC046B41D5377C9454054ABAFAE0A041DC03BC269C18BC845406CE8667FA00C1DC098F738D384C745407CB4386398031DC09FAF592E1BC74540ACFD9DEDD10B1DC025B1A4DC7DC64540AD8A709351051DC0917F66101FC645403FAC376A85F91CC07A3881E9B4C645405BB4006DABF91CC0B56B425A63C8454029B4ACFBC7F21CC03BC269C18BC84540266F8099EFF01CC054C6BFCFB8C8454024624A24D1EB1CC03BC269C18BC845406FBDA60705E51CC06AC2F69331C84540A016838769CF1CC06DE4BA29E5C745404B9352D0EDB51CC02D7AA702EEC74540054EB6813BB01CC0263ACB2C42C745404E64E60297A71CC002D369DD06C7454037E15E99B77A1CC0F0332E1C08C74540AD33BE2F2E751CC02FF99FFCDDC745408FA850DD5C5C1CC07D24253D0CC745402FFA0AD28C551CC09ED2C1FA3FC745409FC728CFBC4C1CC032005471E3C64540302E55698B3B1CC0A60D87A581C74540D4282499D52B1CC093C7D3F203C74540D95F764F1E261CC05B608F8994C6454064213A048E241CC02D40DB6AD6C545400536E7E099201CC06A4FC939B1C545409AEE75525F161CC0ECF7C43A55C64540C136E2C96E161CC0A837A3E6ABC645409A05DA1D521C1CC00F46EC1340C74540CE37A27BD6151CC014CE6E2D93C7454028BA2EFCE0FC1BC0BF0D315EF3C645402942EA76F6E51BC0CC457C2766C74540A391CF2B9EDA1BC0FDBB3E73D6C745408BE255D636D51BC0410C74ED0BC8454082CAF8F719C71BC0ACE122F774C94540F94A202576BD1BC0B3CD8DE909C945403A3E5A9C31AC1BC0D734EF3845C94540D906EE409DA21BC014D1AFAD9FC845407DAEB6627F991BC0D46531B1F9C84540AC8DB1135E921BC0B20E4757E9C84540A6D0798D5D821BC0D993C0E61CC845408FE046CA16791BC03D98141F9FC845406BB8C83D5D6D1BC00F99F221A8C845402E71E481C8621BC0DA3BA3AD4AC845400C3F389F3A561BC019541B9C88C845402A711DE38A4B1BC032C85D8429C845402F89B3226A421BC0416667D13BC74540F10F5B7A34351BC0EE3F321D3AC74540EDF1423A3C241BC05743E21E4BC745406DC83F33881F1BC056293DD34BC84540A45181936D101BC07FC16ED8B6C845407E8CB96B09091BC00455A35703C845401B2D077AA8FD1AC09F77634161C84540B47405DB88F71AC0336ABE4A3EC845400DE4D9E55BEF1AC039B35DA10FC84540B648DA8D3EE61AC03FADA23F34C7454094313ECC5ED61AC0FE63213A04C845408C9FC6BDF9CD1AC04B1E4FCB0FC845406F9F55664ABB1AC0DCBC715298C745409278793A57A41AC0721AA20A7FC84540E1421EC18D941AC07AE1CE8591C845401956F146E6811AC0C8258E3C10C94540707B82C476771AC0A9A10DC006C84540D600A5A146711AC0D158FB3BDBC74540728BF9B9A1691AC0ED0E290648C84540CD565EF23F691AC00AF7CABC55C7454002F390291F621AC01C40BFEFDFC64540EC2FBB270F4B1AC00A2B155454C7454017A06D35EB3C1AC0C4D0EAE40CC74540ED45B41D53371AC0715AF0A2AFC64540D63BDC0E0D2B1AC02BBEA1F0D9C645406DACC43C2B291AC022E2E65432C64540A25D85949F241AC0A69718CBF4C54540BDC3EDD0B0181AC0CB48BDA772C64540A3EA573A1F0E1AC065FF3C0D18C645403FE5982CEEFF19C04C16F71F99C64540F31FD26F5FF719C0B5FD2B2B4DC64540E3FF8EA850ED19C03411363CBDC645400DE36E10ADE519C07061DD7877C645402BDCF29194E419C03BC269C18BC84540BFEFDFBC38E119C078616BB6F2C8454035D1E7A38CD819C0BCC96FD1C9C845404777103B53D819C03BC269C18BC845401B6327BC04B719C0BADC60A8C3C64540AC90F2936AAF19C0BC033C69E1C64540664B5645B8A919C04B2025766DC745407B336ABE4A9E19C076A73B4F3CC74540EB7420EBA99519C0FE2AC0779BC74540EAEA8EC5368919C0A20A7F8637C7454080B9162D407B19C021B1DD3D40C74540C43E0114237B19C060234910AEC64540EBC9FCA36F7219C06344A2D0B2C64540F19F6EA0C06B19C0B45A608F89C645404E7D2079E76019C0E02A4F20ECC6454021E4BCFF8F5319C02F6EA301BCC74540A4E194B9F93619C03885950A2AC84540E4A3C519C32C19C0BC202235EDC84540B2D6506A2F2219C0E4D6A4DB12C94540D522A298BC1119C0C45F9335EAC9454073840CE4D90519C08B8862F206CA454083DC4598A2FC18C0E97DE36BCFCA454078094E7D20F918C0E31A9FC9FECB454034677DCA31E918C01F2C634337CB45406B63EC8497E018C0C18EFF0241CA4540397EA83462D618C01DE38A8BA3CA454035272F3201CF18C07BA4C16D6DC945402387889B53C918C05CAE7E6C92C94540340EF5BBB0C518C00BEE073C30CA4540DFE00B93A9C218C0A88AA9F413CA4540E25AED612FC418C04A97FE25A9C845408A5759DB14BF18C071CADC7C23C8454053CE177B2FAE18C00A67B796C9C8454092E86514CB9D18C09DBD33DAAAC845402849D74CBE9918C0EFE4D3635BC84540D41055F8338C18C0EC6CC83F33C84540713C9F01F58618C0C28A53AD85C745409031772D217F18C068E7340BB4C74540D9CD8C7E347C18C0FBE769C020C745400EBDC5C37B6E18C0AA807B9E3FC7454045813E91276918C0E04BE141B3C74540DEAE97A6086018C0DDCD531D72C745406B82A8FB005418C0ED0E290648C84540E73A8DB4544E18C06D00362042C84540855D143DF04118C0EBFD463B6EC84540DD955D30B83618C05F28603B18C9454088F19A57752618C075779D0DF9C94540CA880B40A32418C01E34BBEEADCA45408D429259BD1318C0664D2CF015CB4540F06C8FDE700F18C0144031B264CA4540B0C6D974040018C0F33AE2900DCA45402711E15F04FD17C0DB4E5B2382C94540EDBAB72231F117C0FA997ADD22CA454096766A2E37D817C09C8BBFED09CA454004C8D0B183CA17C050C24CDBBFCA454090BFB4A84FC217C0601F9DBAF2CB45408658FD1186C117C0C1E61C3C13CC4540FE648C0FB3C717C0F54A598638CC4540D10836AE7FC717C0E71C3C139ACC454093A9825149BD17C030134548DDCC45402C11A8FE41B417C00470B378B1CC4540B30A9B012EA817C06938656EBECD4540F0C4AC1743A917C004711E4E60CE45403A9677D503A617C08E041A6CEACE45403E03EACDA8A917C0739CDB847BCF4540D6E253008CA717C0ACC95356D3CF4540CF85915ED49E17C0DE1D19ABCDCF4540A4FB3905F99917C0C58CF0F620D04540C1C6F5EFFA8C17C0B1355B79C9CF4540A646E867EA8517C05E49F25CDFCF4540A2EC2DE57C8117C0F67D384888D045403B8908FF227817C07381CB63CDD0454019C8B3CBB76E17C0EC67B114C9D1454030629F008A7117C0166C239EECD245402F35423F536F17C0B9C2BB5CC4D34540D252793BC26917C0A5A31CCC26D44540D4BB783F6E5F17C0A0A52BD846D44540B3B3E89D0A5817C073B9C15087D345407C9E3F6D545717C08461C092ABD24540B35DA10F965117C0A7E8482EFFD14540093543AA284E17C0CBD58F4DF2D145406D1B4641F04817C03C9F01F566D24540137F1475E63E17C0A31EA2D11DD24540CBF8F719173E17C0EC67B114C9D1454073F7393E5A3C17C0F624B03907D14540A0336953752F17C0A3957B8159D14540401878EE3D2C17C0A5164A26A7D0454098F90E7EE22017C04C8BFA2477D045401A51DA1B7C2117C044FAEDEBC0CF454099D36531B12917C016A1D80A9ACE454071A94A5B5C2317C01E87C1FC15CE45400ABB287AE01317C05F950B957FCD4540E509849D621517C0F969DC9BDFCC454003249A40110B17C03E3C4B9011CC4540F7E6374C340817C0ADA23F34F3CA4540D40FEA22850217C0085740A19ECA4540B16D516683FC16C0425BCEA5B8CA45407B30293E3EF116C0A5D93C0E83C94540A4FB3905F9D916C0DD09F65FE7C84540E5B7E864A9D516C0927538BA4AC94540B4C876BE9FCA16C05ED6C4025FC9454031CF4A5AF1CD16C0077E54C37EC7454022FB20CB82C916C09088299144C74540E8853B1746CA16C02C2D23F59EC64540D908C4EBFAC516C02E90A0F831C64540BD8C62B9A5C516C0D57ABFD18EC54540E6E61BD13DBB16C044FAEDEBC0C5454096EA025E66B816C0D540F33977C54540F19C2D20B4AE16C0F8A8BF5E61C54540641EF98381A716C0180AD80E46C64540593673486AA116C0EE5BAD1397C54540568330B77B9916C03B6EF8DD74C5454099A0866F618D16C0124C35B396C64540BE4BA94BC68116C0E12538F581C6454044A33B889D7916C0336DFFCA4AC7454057091687336F16C0DFFE5C3464C6454076374F75C85D16C0E23D079623C645407214200A664C16C04415FE0C6FC6454096EB6D33153216C04F3E3DB665C64540CD72D9E89C1F16C0A1DAE044F4C54540FEB7921D1B1116C00D1AFA27B8C64540F0332E1C080916C0B1F9B83654C64540E6913F1878FE15C0B72407EC6AC645407F30F0DC7BF815C08C48145AD6C545406D8E739B70DF15C090F8156BB8C6454082751C3F54DA15C0A5846055BDC64540B8020AF5F4C115C0344B02D4D4C6454067D7BD1589B915C0F6B704E09FC645409E44847F11A415C0707CED9925C74540573F36C98F9815C0D61F6118B0C64540ED0BE8853B9715C0DD41EC4CA1C54540E7C75F5AD48715C0BBD05CA791C44540FBCC599F727C15C0E8DA17D00BC5454047CCECF3187515C0779D0DF967C44540365A0EF4506B15C0390A100533C44540B284B531766215C0D2A755F487C44540DB3521AD315815C0DD0BCC0A45C445405C3D27BD6F4C15C06117450F7CC445402F52280B5F3F15C00E66136058C44540DB6B41EF8D3115C09C4F1DAB94C4454033FAD170CA2C15C0FE9C82FC6CC44540B267CF656A1215C02F14B01D8CC245400B5D8940F50F15C01D5723BBD2C0454046D26EF431FF14C0048F6FEF1AC045406EBF7CB262F814C0C614AC7136BF4540FA980F0874E614C063B48EAA26BE4540F2272A1BD6E414C0737FF5B86FBD4540F04DD36707DC14C042EDB776A2BC45403A02B859BCC814C07F69519FE4BC4540CB49287D21C414C0317A6EA12BBD4540327216F6B4B314C09FB0C403CABC4540299831056BAC14C0D5CDC5DFF6BC4540AF795567B5A014C0A514747B49BD454058207A52269514C01F0F7D772BBD4540F25D4A5D327E14C097E5EB32FCBD45402502D53F887414C00A2C802903BD454064CF9ECBD45414C0D829560DC2BC454029965B5A0D4914C04224438EADBB45406AD95A5F244414C0E1D05B3CBCBB45406E3480B7404214C0A165DD3F16BC4540459BE3DC263C14C07FA0DCB6EFBB45400E828E56B53414C0EF90628044BB45402920ED7F802514C0C51B9947FEBA45401092054CE01614C06A34B91803BB45407FDDE9CE130F14C01590F63FC0BA4540E63C635FB2F113C01421753BFBBA45403F3A75E5B3EC13C030F65E7CD1BA4540698CD651D5E413C0CDCB61F71DBB45409D47C5FF1DC113C081971936CABA4540FFE6C589AFB613C050E449D235BB4540C45C52B5DDB413C0A7ECF483BABA454002B859BC58A813C0DBFB54151ABA454018EDF1423A9C13C0022EC896E5B945405D363AE7A79813C0DF35E84B6FB94540F18288D4B48B13C061A6ED5F59B94540A1BAB9F8DB7E13C04162BB7B80B84540D3DA34B6D77213C013D731AEB8B84540E7E44526E06713C01F11532289B84540687A89B14C5F13C067EF8CB62AB9454010E9B7AF035713C02AAA7EA5F3B7454012F5824F735213C0C1374D9F1DB845401478279F1E4B13C0FBEB1516DCB745401F300F99F24113C0AA0F24EF1CB84540FBB2B453733913C0A016838769B7454094A0BFD0231613C0596B28B517B74540ED9DD156250113C0923EADA23FB64540990D32C9C8F912C04C37894160B54540C5573B8A73F412C033164D6727B54540BD8C62B9A5E512C0CD902A8A57B54540A47213B534D712C01B9FC9FE79B445409D7FBBECD7CD12C0912C6002B7B44540155454FD4AC712C08192020B60B4454095B88E71C5B512C04C6E14596BB44540397D3D5FB39C12C018CC5F2173B3454069E1B20A9B9112C06C770FD07DB34540A35BAFE9418112C07B82C476F7B24540E77283A10E7B12C0D7C0560916B34540677BF486FB7812C0876BB587BDB24540EE3EC7478B5312C0F8E3F6CB27B34540F0E0270EA04F12C083A279008BB24540EF1AF4A5B73F12C0B56CAD2F12B24540BB29E5B5123A12C062A1D634EFB2454062855B3E923212C02BA1BB24CEB2454091B8C7D2872E12C0DB6CACC43CB3454019AA622AFD2412C0BF0CC68844B3454017D522A2980C12C00454388254B2454034F8FBC56CF911C01A6A1492CCB24540B70C384BC9F211C0DCF4673F52B245404FB16A10E6E611C03E5E488787B245402CD7DB662AE411C0ACAB02B518B24540446FF1F09ED311C03927F6D03EB2454062BCE6559DC511C0BDAC8905BEB245406C3D433866B911C07B849A2155B24540E61E12BEF7B711C0300DC347C4B24540DA1D520C90A811C0516A2FA2EDB24540871A8524B39A11C0ACE3F8A1D2B24540D8463CD9CD8C11C06397A8DE1AB2454000C80913468311C03DB7D09508B2454055A52DAEF17911C058C51B9947B245401C9AB2D30F6A11C01366DAFE95B34540B1DEA815A65F11C0AEBCE47FF2B345402FDCB930D25B11C00CCC0A45BAB34540AAF23D23115A11C07347FFCBB5B245404CFDBCA9485511C0656D533C2EB245404F1E166A4D5311C0F8C3CF7F0FB2454075CDE49B6D4E11C0DB6AD619DFB145408F6E8445454C11C04704E3E0D2B145406A8995D1C84711C08066101FD8B14540022EC896E53B11C039ED293927B24540465ED6C4022F11C0815F234910B24540FE0A992B832A11C00E15E3FC4DB245401D03B2D7BB1F11C03A747ADE8DB1454046B41D53771511C01E1840F850B24540003ACC97171011C01406651A4DB24540E868554B3A0A11C05D5320B3B3B245408AAE0B3F38FF10C0DA740470B3B24540300E2E1D73EE10C0CB694FC939B34540147B681F2BE810C02D25CB4928B34540A4198BA6B3E310C037A79201A0B24540899AE8F351D610C05D177E703EB34540F67EA31D37CC10C09F1D705D31B34540E2E5E95C51BA10C0ADC3D155BAB34540410DDFC2BAB110C0EC8502B683B34540213D450E119710C00CE6AF90B9B4454047382D78D18710C01C7A8B87F7B44540F775E09C117510C0B91AD99596B54540C0EC9E3C2C6410C0E3C798BB96B64540247CEF6FD05E10C0A0F99CBB5DB745403BFBCA83F45410C0D2A92B9FE5B745401BD65416854D10C02EAA454431B7454039639813B43910C0992B836A83B745404DD9E907753110C0A0FD481119B84540C21550A8A72F10C030D978B0C5B84540C9224DBC032C10C053CDACA580B84540EC17EC866D2B10C067F3380CE6B745401BA034D4282410C00F9C33A2B4B745408753E6E61B2110C081EB8A19E1B745403DBA1116152110C013B534B742B84540C39D0B23BD1810C02FE065868DB84540AE49B725721110C07E3A1E3350B94540971B0C75580110C0B665C0594AB84540D34ECDE506E30FC0FCC401F4FBB8454003B5183C4CDB0FC06F2D93E178B845401ADEACC1FBCA0FC09A0986730DB945405EF415A419AB0FC0A62897C62FBA45408753E6E61B910FC026E0D74812BC4540CC29013109770FC061A417B5FBBB454092EC116A86540FC0944DB9C2BBBC45405930F14751470FC0A391CF2B9EBC4540151A886533270FC0B0AC342905BD45408B4F01309E210FC00ABFD4CF9BBC4540C0D02346CF0D0FC09CC3B5DAC3BC4540994528B682060FC032056B9C4DBD4540D61F6118B0E40EC0AF0AD462F0BC454098BF42E6CAC00EC01EDFDE35E8BD454071AE6186C6B30EC0B43A394371BD4540F4C5DE8B2F9A0EC006F52D73BABE454086730D33347E0EC05C001AA54BBF4540E98024ECDB490EC0B5DE6FB4E3BE45406CD102B4AD460EC0A375543541BE45403048FAB48A3E0EC0AF9811DE1EBE45406CD102B4AD460EC07EFE7BF0DABD4540B5FAEAAA404D0EC005A8A9656BBD45406CD102B4AD460EC0F65FE7A6CDBC45405A46EA3D95330EC00C056C0723BC45403067B62BF4210EC00E2C47C840BC454024B9FC87F41B0EC0E84CDA54DDBB45401766A19DD32C0EC04DF564FED1BB45406CD102B4AD460EC03FFED2A23EBB4540B66455849B6C0EC0B950F9D7F2BA45407E7214200A860EC05FB2F1608BB9454087C1FC1532970EC0D522A298BCB94540404CC2853CA20EC034D769A4A5B84540D3A1D3F36EAC0EC07407B13385B845403C6A4C88B9A40EC066FA25E2ADB74540F0A7C64B37A90EC097CADB114EB745403065E080968E0EC0C26856B60FB7454066C0594A96730EC0D1402C9B39B64540EFE714E467830EC02BF702B342B5454044183F8D7B930EC0B6F5D37FD6B4454010ECF82F10840EC0ACADD85F76B34540179AEB34D2720EC0D42AFA4333B545409354A69883600EC0035E66D828B5454031EC3026FD3D0EC0CC43A67C08B64540A6F0A0D9754F0EC0C00644882BB7454031410DDFC23A0EC08B4F01309EB745407FD93D7958280EC0AE0FEB8D5AB945402907B309300C0EC06EA6423C12B945402F8A1EF8180C0EC063EDEF6C8FB84540D8F50B76C3160EC040D9942BBCB745401E6FF25B74120EC0B0ABC95356B7454093399677D5030EC022DFA5D425B74540B55373B9C1F00DC029780AB952B74540E50AEF7211FF0DC024ED461FF3B74540C617EDF142FA0DC0CBA2B08BA2B9454051DD5CFC6D0F0EC07D94111780BA454019726C3D43D80DC056F31C91EFBA4540FFB27BF2B0D00DC0AF09698D41BB45409A79724D81CC0DC0C171193735BC45406A85E97B0DC10DC09DF7FF71C2BC4540DA756F4562A20DC0999A046F48BD454004560E2DB27D0DC0676490BB08BD4540D6A71C93C53D0DC0EA42ACFE08BF4540B7EC10FFB0250DC0CB2DAD86C4BF45403604C765DCF40CC046459C4EB2BF45405299620E82EE0CC03271AB2006C0454082AD122C0EE70CC095D5743DD1BF454003999D45EFD40CC0FBAD9D2809C145406ABFB51325C10CC02F51BD35B0C145404A26A77686A90CC0EDF318E599C145405F5D15A8C5A00CC0DC679599D2C045403AEB538EC9820CC07F17B6662BC14540B763EAAEEC620CC000378B170BC145402062838593540CC0859675FF58C04540058C2E6F0E570CC0AE4A22FB20BF4540E8A4F78DAF3D0CC056D636C5E3BE45403EB0E3BF40300CC0BD5301F73CBF4540075E2D7766220CC05A2A6F4738BF4540CEC7B5A1621C0CC047753A90F5BE4540FB75A73B4F1C0CC07C9DD497A5BD45400D384BC972120CC0FBCA83F414BD4540C0E95DBC1FF70BC017105A0F5FBC4540D6FECEF6E8CD0BC093E1783E03BC4540C4D155BABBAE0BC07C80EECB99BB4540381268B0A9930BC0ED7E15E0BBBB4540ACAB02B5187C0BC01477BCC96FBB4540E65AB4006D6B0BC0882B67EF8CBA4540FA7DFFE6C5690BC03A3C84F1D3B845405721E527D57E0BC03C4F3C670BB84540D34F38BBB5AC0BC011C8258E3CB84540DB183BE125B80BC0EE409DF2E8B84540747CB43863B80BC02CEFAA07CCB7454074620FED63C50BC0637C98BD6CB7454007B309302CDF0BC0F7578FFB56B74540CAE0287975EE0BC0BB63B14D2AB64540309DD66D50DB0BC0C00644882BB7454030D63730B9B10BC011E2CAD93BB7454010E7E104A6B30BC02BFC19DEACB34540E6CB0BB08FAE0BC0FB5A971AA1B345400C59DDEA39A90BC0683EE76ED7B5454069FF03AC559B0BC0DA8EA9BBB2B74540E754320054910BC092921E8656B74540CF49EF1B5F7B0BC0D0F1D1E28CB54540302B14E97E6E0BC0A7EB89AE0BB54540CEC47421565F0BC03468E89FE0B44540DEE8633E20500BC0309C6B98A1B54540EF54C03DCF3F0BC07AABAE4335B54540179B560A811C0BC07E8B4E965AB54540693BA6EECA0E0BC04A0A2C8029B545404F745DF8C1F90AC09C53C90050B5454087DC0C37E0F30AC0C5909C4CDCB44540C9E6AA798EE80AC09FC728CFBCB44540D6E5948098C40AC0BFEFDFBC38B54540A4A833F790B00AC0B0C91AF510B54540B439CE6DC29D0AC0E544BB0A29B545407D224F92AE990AC0FA0E7EE200B4454031CF4A5AF18D0AC0C9E9EBF99AB34540D7C3978922840AC048C49448A2B345407B6649809A7A0AC0CD76853E58B445409A27D714C86C0AC086E7A56263B445405E2EE23B314B0AC017467A51BBB345400A302C7FBE0D0AC0AA622AFD84B34540EE5C18E945CD09C00EDAAB8F87B2454088307E1AF7C609C060CD018239B24540E813799274CD09C00A65E1EB6BB145400ABABDA431BA09C045F5D6C056B14540FC71FBE593B509C0E5982CEE3FB04540EEB25F77BA9309C024EEB1F4A1AF45403221E692AA8D09C0CF4BC5C6BCAE454041BCAE5FB07B09C03F3A75E5B3AE4540C8957A16847209C0E99D0AB8E7AD454029E78BBD175F09C04147AB5AD2AD4540E88711C2A34D09C0603FC4060BAD454055DFF945093A09C0261DE56036AD4540A629029CDE2509C0F73B1405FAAC45406744696FF00509C0B492567C43AD454082AE7D01BDF008C0BC95253ACBAC454097A8DE1AD8EA08C0874D64E602AD4540A3CC069964E408C0C347C49448AE4540965E9B8D95D808C0999CDA19A6AE454075ADBD4F55C108C0483657CD73AE4540DAFF006BD58E08C0172D40DB6AAC4540E75086AA988A08C095826E2F69AC4540BA1281EA1F6408C029CFBC1C76AB4540EA245B5D4E4908C0AEB7CD5488AB45405FED28CE514708C0C782C2A04CAB4540E1ECD632194E08C0102384471BAB4540AF27BA2EFC4008C0E5EE737CB4AA4540E2B034F0A33A08C04B1E4FCB0FAA45407270E998F32C08C08FE4F21FD2A94540BAD8B452082408C0DEC7D11C59A94540DC80CF0F232408C0ADC266800BAA4540F01989D0081608C03F390A1005AB4540A510C8258E1C08C072BF4351A0AB45400938842A351B08C0FF04172B6AAC454057410C74ED2B08C0A1A2EA573AAD454021CB82893F2A08C0336B2920EDAD45402DCDAD10564308C075914259F8AE45404A5D328E914C08C0E5D4CE30B5AF45405D52B5DD043F08C0BB4560AC6FB04540933A014D842D08C00D5531957EB0454033A31F0DA70C08C0AE9B525E2BB14540C87DAB75E2F207C0A12B11A8FEB14540D7A546E867EA07C08F6D197096B245406EC0E78711E207C0EA094B3CA0B245409224085740E107C032E9EFA5F0B2454019575C1C95DB07C05C751DAA29B345404E27D9EA72CA07C098F6CDFDD5B345403B8F8AFF3BC207C044149337C0B445406422A5D93CAE07C0EBE40CC51DB545403B00E2AE5EA507C0DD611399B9B44540DF313CF6B39807C03E23111AC1B44540FF3EE3C2819007C0F4C308E1D1B445406E8B321B649207C0594DD7135DB54540FE0C6FD6E09D07C024809BC58BB54540FB3F87F9F2A207C0C4EA8F300CB645405B0A48FB1FA007C0FF3D78EDD2B64540C4793881E99407C0FD8348861CB7454089EDEE01BA8F07C0B6679604A8B745409A6038D7306307C0925CFE43FAB745400D1B65FD664207C037001B1021B84540D53F8864C83107C0F0C3414294B745407AFD497CEE0407C00A302C7FBEB745407EA7C98CB7F506C01EE0490B97B745403FE3C28190EC06C0DB4FC6F830B745401DAD6A4947D906C07FDDE9CE13B74540D0436D1B46C106C032056B9C4DB745402CA0504F1FA106C0F44D9A0645B7454096ED43DE729506C0527FBDC282B745409DF529C7647106C05C92037635B745403BA8C4758C4B06C0919A7631CDB84540BB0F406A134706C02DB0C7444AB945406B0E10CCD14306C0CD91955F06B9454083312251681906C0137D3ECA88B94540459F8F32E20206C09C8A54185BBA454009FEB7921DFB05C0404D2D5BEBB9454092088D60E3FA05C0C362D4B5F6B8454016A6EF3504E705C0F9A3A833F7B64540EBE3A1EF6EC505C03CA583F57FB645402BDD5D6743BE05C0361FD7868AB545406C921FF12BB605C01D21037976B545407A3881E9B4AE05C09C35785F95B54540B0389CF9D59C05C0DE1FEF552BB54540D3122BA3918F05C080B74082E2B3454047B071FDBB7E05C07D7901F6D1B345404913EF004F7A05C0C956975302B4454075779D0DF96705C0274C18CDCAB4454090696D1ADB4B05C0B16D516683B4454014B2F336363B05C0A99F3715A9B445400B0E2F88482D05C00C3CF71E2EB545400DC51D6FF21B05C022FDF675E0B445404B732B84D51805C01A16A3AEB5B345407288B839950C05C0D1B2EE1F0BB345400BB6114F76F304C05B785E2A36B2454042EDB776A2E404C0B9FB1C1F2DB245409E996038D7D004C01F86562767B2454021ACC612D6A604C0B6F3FDD478B1454062156F641E9904C021753BFBCAB14540B98B3045B99404C07F4FAC53E5B14540363FFED2A27E04C0828DEBDFF5B14540616F62484E6604C0ED0F94DBF6AF4540111B2C9CA45904C08927BB99D1AF4540BC0512143F4604C0AE9E93DE37B04540A8E0F082883404C06FF4311F10B045408446B071FD1B04C0362383DC45B045408196AE601B1104C0D7F7E12021B045407E9065C1C4FF03C0914259F8FAAE45402D9622F94A0004C0249A40118BAE4540BA1457957DF703C0B69E211CB3AE4540F0A7C64B37E903C09775FF5888AE4540B5519D0E64DD03C0FCDF1115AAAD45403F0114234BC603C014B35E0CE5AC454078465B9544B603C055F833BC59AB4540BB0CFFE9068A03C0153944DC9CAA45409D2ADF33128103C0E63FA4DFBEAA45409EF0129CFA6003C001DC2C5E2CAA454097546D37C15703C0B9A5D590B8A94540EACA67791E5C03C06EC2BD326FA9454082035ABA824D03C09A266C3F19A945404A0D6D00364003C0C5C9FD0E45A945406D3B6D8D082603C0A19DD32CD0A845407C462234820D03C0999EB0C403A84540EFE192E34E0903C0C992399677A745400CC85EEFFEF802C069739CDB84A74540809BC58B85E102C0268C6665FBA645403620425C39DB02C04E61A5828AA64540683C11C479D802C038F92D3A59A6454040DCD5ABC8C802C021054F2157A64540D8BCAAB35AC002C0C7F2AE7AC0A64540840CE4D9E59B02C08884EFFD0DA645403A3C84F1D37802C08D5E0D501AA645406A8995D1C84702C08330B77BB9A545400A80F10C1A1A02C0CEFBFF3861A64540D65757056A1102C06BF46A80D2A6454010406A1327F701C068CD8FBFB4A6454022FE614B8FE601C043C70E2A71A745406A16687748D101C0F5F411F8C3A745403A747ADE8DA501C02AADBF2500A745406D003620429C01C08A3E1F65C4A74540B84082E2C79801C00937195586A74540FDF49F353F9E01C071546EA296A645409C4D4700378B01C0C0EC9E3C2CA64540261AA4E0298401C03DB9A64066A54540CCB56801DA7601C063F030ED9BA54540F8E3F6CB276B01C01AA4E029E4A4454015E63DCE346101C0E6ADBA0ED5A44540096CCEC1334101C0246420CF2EA545407D586FD40A3301C0BBD39D279EA54540B9C32632732101C0C3F2E7DB82A545401C60E63BF80901C0F7E461A1D6A44540B89388F02FE200C0959F54FB74A64540B515FBCBEEA900C01E6CB1DB67A745409450FA42C81900C027BF45274BA94540307F85CC950100C00EA48B4D2BA945407D3ECA880B0000C09430D3F6AFA845405F5D15A8C5E0FFBFCE8C7E349CA84540629D2ADF33D2FFBF3A933655F7A84540D7DAFB5415DAFFBF334FAE2990A94540D89DEE3CF19CFFBFFA9AE5B2D1A945403AE8120EBD85FFBF60234910AEAA45400D71AC8BDB68FFBF0B7DB08C0DAB4540705E9CF86A47FFBF9487855AD3AA4540C7BAB88D0630FFBFBBD6DEA7AAAA454057EA5910CAFBFEBFA643A7E7DDAA4540AB5AD2510EE6FEBF5628D2FD9CAA4540F910548D5ECDFEBFFE0A992B83AA45406D54A70359CFFEBF72A43330F2AA45400F27309DD66DFEBFB98E71C5C5AB45407AE2395B4028FEBF14799274CDAC45401C08C90226F0FDBF75E8F4BC1BAF4540B03BDD79E2B9FDBF703FE08101B04540CA6DFB1EF597FDBF96B036C64EB04540DD0C37E0F383FDBFC845B58828B04540ED28CE514747FDBF51DEC7D11CB14540E2067C7E18E1FCBF77483140A2B14540313F373465A7FCBFFBE93F6B7EB245404EB51666A19DFCBF3D9AEAC9FCB14540732B84D558C2FCBFA439B2F2CBB045407CD11E2FA4C3FCBF5587DC0C37B0454066BB421F2CA3FCBF7D76C075C5AE454014083BC5AA81FCBF8D47A98427AE454098A7734529A1FCBF3C11C47938AD45400002D6AA5D93FCBFA777F17EDCAC454001030000000100000008000000C3482F6AF7CB0940F1BA7EC16E064540A2630795B8CE09408EAF3DB3240645403FAC376A85C9094054AC1A84B90545408577B988EFC40940B1868BDCD305454077A38FF980C00940624CFA7B2906454066BB421F2CC30940FB75A73B4F064540FBE769C020C9094022FFCC203E064540C3482F6AF7CB0940F1BA7EC16E064540010300000001000000050000005E6919A9F734094019CBF44BC4F54340274BADF71B2D0940F59D5F94A0F54340309E4143FF240940D655815A0CF643401747E5266A290940BCE82B4833F643405E6919A9F734094019CBF44BC4F5434001030000000100000005000000C80A7E1B621C08402CF180B229A7434031CD74AF931A08407077D66EBBA64340001DE6CB0B10084028F4FA93F8A64340B34291EEE71408403D7FDAA84EA74340C80A7E1B621C08402CF180B229A74340010300000001000000050000005CAD1397E3D507400E6954E06495434022E010AAD4CC07409949D40B3E954340A648BE1248C907402D7B12D89C954340DC291DACFFD307407E9065C1C49543405CAD1397E3D507400E6954E0649543400103000000010000000600000027F911BF62CD07406090F46915994340ED9C668176C70740069D103AE8984340AD6BB41CE8C10740CFF9298E0399434068EBE0606FC2074088BA0F406A994340E8DCED7A69CA0740E90DF7915B99434027F911BF62CD07406090F469159943400103000000010000004B000000BA111615719A0740C45BE7DF2E954340499D8026C2A60740137F1475E69443409DBE9EAF59AE0740E17B7F83F6944340F54718062CB9074089EAAD81AD9443403E22A64412BD0740AE7FD767CE944340EE2422FC8BC007405376FA415D944340E412471E88CC07407D21E4BCFF934340CE6C57E883C50740367689EAAD9343407E7214200AC607407A7077D66E93434003E962D34AC107407DCD72D9E8924340B96DDFA3FEBA0740293FA9F6E9924340CEE2C5C210B90740941799805F93434070253B3602B10740ECDE8AC40493434049111956F1A60740F2785A7EE09243405551BCCADAA60740207A5226359243401D7233DC80AF0740CF87670932924340094FE8F527B10740138255F5F2914340079964E42CAC07402DE92807B3914340A6B915C26AAC074014268C66659143404739984D80A107407CB5A33847914340213EB0E3BFA00740D6C743DFDD90434094331477BCA907402EAD86C43D90434035B742588DA50740C24EB16A1090434098BF42E6CAA00740F3AE7AC03C904340C11C3D7E6F930740B51B7DCC0790434056EF703B348C074082A966D6529043401C7BF65CA6860740C18EFF024190434045B75ED3838207402028B7ED7B9043407BA35698BE770740E1EB6B5D6A90434040A374E95F72074098DC28B2D6904340EBE40CC51D6F07400CACE3F8A1904340F148BC3C9D6B074005FBAF73D390434062687572866207406E6E4C4F5890434030630AD6385B0740179B560A8190434029B000A60C5C0740DAA84E07B29043405BECF6596566074077A22424D2904340DAFE959526650740BC934F8F6D914340E6E95C514A680740DBDFD91EBD914340E8DEC325C75D0740077DE9EDCF914340753BFBCA835407408CBD175FB491434072E14048165007408C6A11514C924340E2E995B20C5107400D7217618A924340D2FBC6D79E5907408B34F10EF0924340EDB94C4D825707408D261763609343406090F469155D0740C03FA54A949343402AAC54505155074026547078419443407C0DC1711957074001DBC1887D944340441669E21D60074038DC476E4D94434037C5E3A25A64074033880FECF89343409696917A4F650740904DF2237E934340E8F4BC1B0B6A0740335184D4ED92434008CC43A67C680740D80C7041B6924340904E5DF92C6F07407BDAE1AFC9924340543A58FFE7700740450F7C0C56924340EF5355682076074094BC3AC7809243405E82531F487E0740FFD0CC936B92434064575A46EA7D0740874D64E6029343405C9203763579074065DEAAEB509343402D05A4FD0F70074011397D3D5F934340232F6B62816F07407D7901F6D193434028F38FBE497307407460394206944340A3CEDC43C27707401669E21DE0934340CA181F662F7B0740D26EF4311F9443401899805F23890740CADDE7F8689343408C683BA6EE8A0740BD19355F25934340A69BC420B092074072A3C85A43934340F1BA7EC16E980740C8B7770DFA9243400F4757E9EE9A0740917BBABA63934340481630815B970740DF347D76C0934340FA97A432C59C0740B4CA4C69FD9343402AFEEF880A950740793A57941294434072C3EFA65B9607404B57B08D789443403D80457EFD9007408EE89E758D9443400DC1711937950740DD94F25A09954340BA111615719A0740C45BE7DF2E9543400103000000010000000D000000F31B261AA4C0074041BCAE5FB09743404739984D80C107402CB6494563974340D3F8855792BC0740821B295B24974340FEEDB25F77BA074029064834819643408D62B9A5D5B00740CF691668779643401A4E999B6FA407407B6AF5D555974340BD6F7CED99A50740D446753A9097434067D47C957CAC07406EDFA3FE7A9743401477BCC96FB1074033535A7F4B9843407B88467710BB0740E4BB94BA64984340F5A10BEA5BC607408FE3874A23984340DACBB6D3D6C807405E49F25CDF974340F31B261AA4C0074041BCAE5FB097434001030000000100000005000000F67EA31D371C0540F030ED9BFBC7434091B586527B110540D6E253008CC7434016889E94490D05401BA19FA9D7C743408B8BA37213150540904B1C7920C84340F67EA31D371C0540F030ED9BFBC743400103000000010000000500000098E0D40792B704405C3E92921EC443402B4D4A41B7B7044098DA520779C343406F10AD156DAE04407D5C1B2AC6C34340D6355A0EF4B00440817C09151CC4434098E0D40792B704405C3E92921EC443400103000000010000000500000067B45549649F0340266DAAEE91BF4340EC18575C1C950340B9895A9A5BBF434059198D7C5E9103409F56D11F9ABF4340C7DADFD91E9D03401686C8E9EBBF434067B45549649F0340266DAAEE91BF43400103000000010000000E000000A3E6ABE4637702409351651877C94340677C5F5CAA720240BD5301F73CC943403239B5334C6D02403EB324404DC943401EC4CE143A6F0240A1664815C5C9434061A417B5FB7502408141D2A755CA43400150C58D5B8C0240BF0CC68844CB434028B682A625960240FE0C6FD6E0CB43402C836A8313B102402E3883BF5FCC4340570740DCD5AB024041F163CC5DCB434094FB1D8A029D0240D1B2EE1F0BCB434094A2957B819902404034F3E49ACA4340AC1A84B9DD8B0240FF06EDD5C7C94340043BFE0B04810240EACC3D247CC94340A3E6ABE4637702409351651877C943400103000000010000001400000039F06AB9331300407E5704FF5B3945405E8429CAA5B1FF3FD7851F9C4F3945400F7C0C569CAAFF3FC9586DFE5F394540EF586C938A86FF3F5EBEF561BD3945409D4CDC2A8881FF3FEE0912DBDD394540CEC7B5A1625CFF3FE8F4BC1B0B3A45407D21E4BCFF4FFF3F1FB935E9B63A4540E882FA96395DFF3F629D2ADF333C4540666666666666FF3FE3A8DC442D3D4540A88C7F9F71A1FF3F8F519E79393E45403EEAAF5758B0FF3F52D7DAFB543F4540E621533E04D5FF3F191EFB592C3F45402827DA5548F9FF3FBAF59A1E143E4540B8E52329E9E1FF3FFE0C6FD6E03D4540A6608DB3E9C8FF3F1BBCAFCA853C4540CF4D9B711AE2FF3F55A18158363B45408A3E1F65C4050040268DD13AAA3A4540E6C93505321B0040B4739A05DA3945408884EFFD0D1A0040FACF9A1F7F39454039F06AB9331300407E5704FF5B39454001030000000100000007000000B537F8C2646AFA3FAC36FFAF3A844340B5E1B034F063FA3F2C634337FB8343406FD8B628B341FA3FD32D3BC43F844340062D24607439FA3F09A7052FFA844340ECDB4944F857FA3F79944A7842854340B8AD2D3C2F55FA3F919A7631CD844340B537F8C2646AFA3FAC36FFAF3A8443400103000000010000008F000000ECA694D74AA8F83F1D5723BBD28E4340CF2EDFFAB09EF83F08E57D1CCD8D434015FF774485EAF83FC9224DBC038C43402DE8BD310400F93F548EC9E2FE8B43402C465D6BEF13F93FB32616F88A8C4340D61BB5C2F47DF93FA81B28F04E8C434062F4DC4257A2F93FEB573A1F9E8B434088F19A577596F93F2F3196E9978A43408DF161F6B2ADF93F1C25AFCE318A43408D96033DD4B6F93FE92807B3098A43408DF161F6B2ADF93FBFB9BF7ADC8943401EC2F869DC9BF93F81CF0F2384894340DB4FC6F8307BF93FF5BA4560AC8943400E6B2A8BC26EF93F1EA8531EDD8843400ED8D5E4296BF93F2C9D0FCF12884340BBF2599E0777F93F8DCF64FF3C8743408DF161F6B2ADF93F0AD80E46EC8543405D4F745DF8C1F93FF7E461A1D68443404149810530E5F93FDFA7AAD040844340C5AD8218E8DAF93F4ACFF412638343408DF161F6B2ADF93F86A92D7590834340C712D6C6D889F93FE6ADBA0ED5824340290989B48D7FF93FBC7A15191D8243402FFD4B529962F93F9F211CB3EC814340D5592DB0C744F93FA01A2FDD248043408A1F63EE5A42F93F5F46B1DCD27E434053758F6CAEDAF83FD4484BE5ED7E43401C959BA8A5B9F83F3E3C4B90117E4340F8C3CF7F0F9EF83F4DBA2D910B7E43401D041DAD6A89F83FDEC66647AA7D43405AD6FD63217AF83F1616DC0F787A43403FABCC94D65FF83F69C9E369F979434091B8C7D2876EF83FB30C71AC8B794340F627F1B9136CF83FF3716DA8187943401BD82AC1E230F83FA12E52280B794340A0336953750FF83F3E95D39E92774340919DB7B1D9D1F73F8B355CE49E764340CD22145B4193F73F91990B5C1E754340BD3AC780EC75F73FD1B2EE1F0B754340D4B837BF6162F73F25AE635C7175434078B5DC990946F73FB4AF3C484F75434061342BDB873CF73F8EE89E758D744340C4995FCD0102F73F39B69E211C7543405378D0ECBAF7F63F7CF1457BBC74434066A032FE7D06F73F185B087250744340064CE0D6DDFCF63F3BC5AA4198734340556CCCEB88C3F63FA3CEDC43C273434062669FC7288FF63F7E7214200A7243408104C58F3177F63F0C3F389F3A7043401898158A747FF63FBB97FBE4286E4340E2016553AE70F63F83A279008B6C4340BC96900F7A76F63F5264ADA1D46A43401DACFF73982FF63FE60819C8B36B43402176A6D0790DF63FF52B9D0FCF6A43405BB05417F0F2F53F60747973B86A434025B20FB22CD8F53F2481069B3A6D434001344A97FEA5F53FA35698BED76E4340DD611399B980F53F16F6B4C35F6F4340D1C952EBFD46F53FC8EBC1A4F86E4340BE69FAEC802BF53F240F4416696E4340F58590F3FEFFF43FF8C610001C6F4340E509849D62D5F43F4E27D9EA726E4340BB2BBB6070CDF43F5E9ECE15A56E43408928266F80D9F43FCFBEF2203D6F43406D718DCF64BFF43F5D8940F50F70434097ADF545425BF43F0B9C6C0377704340DB8651103C3EF43F2578431A15704340BB2BBB60700DF43F2F505260016E43402634492C29F7F33F23111AC1C66D434002B7EEE6A9CEF33F4DBC033C696F4340183F8D7BF39BF33F1BBE8575E36F4340FE9AAC510F91F33FA661F88898704340A245B6F3FD94F33F75E61E12BE7143402254A9D9036DF33F3B014D840D7343403D65355D4F74F33F26AC8DB11374434000AC8E1CE98CF33F72874D64E6744340EDBB22F8DF8AF33FAA7EA5F3E175434028452BF702B3F33FCEE2C5C21077434040C05AB56BC2F33FBE2D58AA0B784340096CCEC133A1F33F804413286279434038BEF6CC9280F33F73BED87BF17943401F4AB4E4F174F33FD49AE61DA77A4340AD174339D1AEF33F99BA2BBB607C434039EE940ED6BFF33FC828CFBC1C7C434084BD892139D9F33FAC8DB1135E7C434042AF3F89CFDDF33F63EFC517ED7B43400395F1EF33EEF33F46B3B27DC87B434005DD5ED2182DF43FDF50F86C1D7C4340484E266E1544F43F03B34291EE7B4340583A1F9E2588F43FD6FCF84B8B7C43403CA3AD4A22BBF43F47C9AB730C7C4340CE893DB48FD5F43F8FC6A17E177C43403F389F3A56E9F43F747B4963B47C434096CD1C925AE8F43F4985B185207D4340A26131EA5ABBF43F0ED76A0F7B7D4340A112D731AEB8F43F0C056C07237E4340AF997CB3CD8DF43F043A9336557F434098BD6C3B6D8DF43F63D2DF4BE17F434001DBC1887DC2F43F2219726C3D8143400569C6A2E9ACF43F46ED7E15E08143409C14E63DCEB4F43FB3CF63946782434073DA53724EACF43FCBBF9657AE8343400B0C59DDEAF9F43F713AC9569785434040BE840A0E2FF53F39B35DA10F8643402A6F47382D38F53F30BC92E4B9864340C231CB9E0476F53FAD855968E78643406EDFA3FE7A85F53F054EB6813B8843401212691B7FA2F53F130CE71A66884340D9B27C5D86BFF53F541B9C887E894340035B25581CCEF53F1CEDB8E1778943408D26176360DDF53F9DB81CAF408843407349D57613FCF53F815F234910884340D8BB3FDEAB16F63F4F78094E7D8843403EE94482A926F63F96B20C71AC89434089EE59D76839F63F8E75711B0D8A43401F477364E557F63FD3DC0A61358A4340AA7F10C99063F63F8D5F7825C9894340D02A33A5F577F63F86AFAF75A9894340AA2A3410CBA6F63F58923CD7F78943403259DC7F64BAF63FAC90F2936A8B4340BA8784EFFDCDF63F5665DF15C18B434058AEB7CD5408F73F2315C616828A4340E9263108AC1CF73F83DA6FED448B4340977329AE2A3BF73FF8F9EFC16B8B434001F8A7548932F73F629E95B4E28B4340095053CBD63AF73F2788BA0F408C434004ADC090D56DF73F6C96CB46E78C4340FA27B8585183F73F99107349D58C43404ED367075C97F73FFB95CE87678D43407EC3448314BCF73F05A3923A018D4340F0FCA204FDC5F73FE6CDE15AED8D4340E7E44526E0D7F73F7619FED30D8E4340C956975302E2F73F1CB4571F0F8D43406F0D6C9560F1F73F2F88484DBB8C43409E7DE5417A0AF83F9BC937DBDC8C434001A1F5F06522F83F6A334E43548D4340904946CEC21EF83F26361FD7868E43401BD82AC1E230F83F89B14CBF448E4340CFF41263993EF83F8BA548BE128E434014B35E0CE544F83F921FF12BD68E434001C0B167CF65F83FD829560DC28E434043E38920CE83F83FE4A25A44148F4340ECA694D74AA8F83F1D5723BBD28E434001030000000100000028000000478D09319754F73F5B423EE8D95C4340E998F38C7D89F73FCF86FC33835C43405D6C5A2904B2F73FC0B33D7AC3594340B64AB0389C39F83F321D3A3DEF564340ED832C0B267EF83FED0E29064856434085D0419770E8F83F0D8AE6012C584340F12E17F19D18F93FFFE7305F5E58434026361FD7864AF93F40F9BB77D45643401BF4A5B73F57F93F61545227A05543400D384BC97252F93F5298F738D35443400BB5A679C729F93F24809BC58B53434030F488D1730BF93F9241EE224C53434084F57F0EF365F83F7731CD74AF53434036E84B6F7F2EF83F7EA99F3715554340551344DD07E0F73F29CC7B9C69564340AEB7CD548887F73FF1A0D9756F574340C138B874CC39F73FDC0DA2B5A25743404CA8E0F08208F73FE831CA332F5743401D3D7E6FD3DFF63F4AECDADE6E554340B51A12F7587AF63F813FFCFCF7524340081C0934D854F63F4356B77A4E524340E350BF0B5B33F63F2FE1D05B3C524340A6EF3504C725F63FF9C08EFF02534340C98E8D40BC2EF63FBB421F2C63554340C2D9AD65321CF63FADDF4C4C17584340E083D72E6D38F63FD3D85E0B7A594340BA6A9E23F21DF63F015130630A5C4340963FDF162C55F63FFB777DE6AC5D4340B35F77BAF384F63F38DBDC989E5C434083DDB06D51A6F63F7DCEDDAE975C434077F69507E9A9F63F3FADA23F345D43404E9D47C5FF9DF63FCD0358E4D75D43407AC5538F34B8F63FF4346090F45D4340AD6A494739D8F63FD15CA791965E434088F4DBD781F3F63F27A5A0DB4B60434067800BB265F9F63F976F7D586F6043402E008DD2A5FFF63F21E868554B6043404B1E4FCB0F1CF73FD15CA791965E434063997E89782BF73F289A07B0C85D4340478D09319754F73F5B423EE8D95C434001030000000100000007000000130CE71A66A8F73F3FC8B260E2654340A04E797423ACF73F22718FA50F6543407C0BEBC6BBA3F73F2E3C2F151B654340865AD3BCE394F73FF29716F549664340AF7C96E7C19DF73FFE4465C39A6643403CF88903E8B7F73FA4C684984B664340130CE71A66A8F73F3FC8B260E265434001030000000100000006000000419DF2E84658F73FB1FB8EE1B1734340ADDD76A1B94EF73F7F8461C092734340919BE1067C3EF73FE92807B309744340AA7CCF488446F73F4B581B63277443401366DAFE9555F73F522635B401744340419DF2E84658F73FB1FB8EE1B1734340010300000001000000060000006CB41CE8A1F6F63FA6457D923B624340F4DF83D72EEDF63F2BC0779B37624340B7EC10FFB0E5F63F62855B3E926243404225AE635CF1F63F2D431CEBE26243401E51A1BAB9F8F63F774B72C0AE6243406CB41CE8A1F6F63FA6457D923B6243400103000000010000001000000027309DD66DD0F63FFBCE2F4AD065434032E719FB92CDF63FD253E4107165434086C954C1A8E4F63F0A85083884644340594FADBEBAEAF63FA26131EA5A634340FDA204FD85DEF63F315C1D00716343401A6F2BBD36DBF63F64575A46EA6343404F7633A31FCDF63FBB63B14D2A6443408D429259BDC3F63F16359886E1634340A112D731AEB8F63F5116BEBED6634340A1664815C5ABF63F9641B5C1896443404643C6A354C2F63F6FD39FFD4865434044317903CCBCF63F18D2E1218C65434041446ADAC5B4F63FAF5A99F04B654340BBF1EEC858ADF63F61545227A065434012A1116C5CBFF63F17450F7C0C66434027309DD66DD0F63FFBCE2F4AD065434001030000000100000005000000AA66D652409AF63F29417FA1476843407E022846968CF63F560C570740684340AB949EE92586F63FB7D26BB3B1684340E8DD58501894F63F4D158C4AEA684340AA66D652409AF63F29417FA1476843400103000000010000000600000078D1579066ECF33FCC290131098D444084BD892139D9F33F59C345EEE98C4440939048DBF8D3F33F508D976E128D4440A1664815C5EBF33FA5828AAA5F8D444074CE4F711CF8F33F889D29745E8D444078D1579066ECF33FCC290131098D444001030000000100000005000000CADFBDA3C684F33FC74CA25EF07B43405AF5B9DA8A7DF33F6CEBA7FFAC7B434062F54718066CF33FD88349F1F17B43408A1D8D43FD6EF33F3750E09D7C7C4340CADFBDA3C684F33FC74CA25EF07B43400103000000010000000F0000007E3672DD9472F33F6C3EAE0D157F4340B686527B116DF33F99805F23497E4340CE6C57E88365F33FD367075C577E43405BD3BCE3145DF33F3811FDDAFA7D4340ED2B0FD25364F33F54C90050C57D43400EF8FC304278F33F99BC0166BE7D4340DBE044F46B6BF33F546EA296E67C4340A8DF85ADD94AF33F30682101A37D4340BB809719364AF33FCD203EB0E37D4340B6A2CD716E53F33F9278793A577E4340E6AC4F39264BF33F9D0E643DB57E4340841266DAFE55F33FC3D7D7BAD47E434046B41D537765F33FC537143E5B7F4340F7764B72C06EF33F3F558506627F43407E3672DD9472F33F6C3EAE0D157F4340010300000001000000050000000726378AAC75F33F71C63027686F4340DC2F9FAC186EF33F63601DC70F6F4340CFA10C553155F33F34677DCA316F43406249B9FB1C5FF33F63997E89786F43400726378AAC75F33F71C63027686F4340010300000001000000070000005FD383825234F33F295DFA97A46E4340D4F36E2C280CF33F0EF7915B936E43405A7EE02A4F20F33F562C7E53586F4340177E703E752CF33FF816D68D776F43402C8194D8B53DF33F45D8F0F44A6F43409885764EB340F33FBDC282FB016F43405FD383825234F33F295DFA97A46E43400103000000010000000500000032022A1C412AF33FE3FA777DE67A4340DDEBA4BE2C2DF33F58CB9D99607A43403BE2900DA40BF33F9700FC53AA7A43400057B2632310F33F6403E962D37A434032022A1C412AF33FE3FA777DE67A4340010300000001000000050000009FE8BAF083B3F23F4E44BFB67E7C4340DBC2F352B1B1F23F67F2CD36377C43407F15E0BBCD9BF23FEC14AB06617C43406C5CFFAECF9CF23F61E28FA2CE7C43409FE8BAF083B3F23F4E44BFB67E7C43400103000000010000002A000000C37FBA8102EFE63F973C9E961F4C44409B20EA3E00A9E63F53E9279CDD4A4440116F9D7FBB6CE63F689599D2FA4944406878B306EF2BE63F64CE33F625494440F08B4B55DAE2E53FAB93331477484440C153C8957A96E53F0B0C59DDEA474440B41EBE4C1421E53F4AB20E4757474440F0DE516342CCE43FAC74779D0D474440BA83D8994267E43F3FFF3D78ED464440DA907F66101FE43FC5AD8218E846444048F8DEDFA0BDE33F47E9D2BF24474440AF42CA4FAA7DE33F753E3C4B90474440BEA4315A4755E33F16C094810348444087FA5DD89A2DE33F016C4084B848444046EA3D95D31EE33FFC1A49827049444004ADC090D52DE33FD505BCCCB0494440EB1D6E878645E33FA243E048A049444045D8F0F44A59E33F7764AC36FF4944404F5C8E57207AE33F3CDBA337DC494440715985CD0097E33F689599D2FA4944407AAA436E869BE33FF4A3E194B9494440B0E600C11CBDE33FE7E44526E04944407F85CC9541B5E33F8F6E8445454A4440A3B08BA207BEE33FB55208E4124B4440897956D28AEFE33FAE11C138B84A444073672618CE35E43F100874266D4A4440A0DE8C9AAF92E43F5B7D7555A04A4440CAFACDC474A1E43F7506465ED64A444038A4518193EDE43FC2DD59BBED4A44404E9A0645F300E53F228D0A9C6C4B4440CE35CCD07822E53F61DF4E22C24B44409C53C9005045E53FAA0A0DC4B24B44406551D845D183E53F1F1329CDE64B4440A31EA2D11DC4E53FEFC9C342AD4B4440CCB6D3D688E0E53FFED30D14784B4440E1968FA4A407E63F3332C85D844B4440F452B131AF23E63F54E1CFF0664B4440C075C58CF076E63F3A747ADE8D4B4440A9893E1F65C4E63FF1F09E03CB4B4440F5DA6CACC43CE73F9E78CE16104E4440C8B60C384B49E73F10B22C98F84D4440C37FBA8102EFE63F973C9E961F4C44400103000000010000000600000013286211C30EE63F663046240AF3434007EFAB72A1F2E53F5C8DEC4ACBF24340361D01DC2CDEE53F39F1D58EE2F24340427BF5F1D0F7E53F647616BD53F343407D5EF1D4230DE63F691CEA7761F3434013286211C30EE63F663046240AF3434001030000000100000005000000A987687407B1CD3F588FFB56EB604340DCD6169E978ACD3F9DF2E84658604340A60D87A5811FCD3FE1EB6B5D6A60434046B247A81952CD3F931804560E614340A987687407B1CD3F588FFB56EB60434001030000000100000005000000E1B4E0455F41C0BFFA0D130D52404340C4EE3B86C77EC0BFC9737D1F0E404340B08D78B29B19C1BF5D3123BC3D404340CEFBFF3861C2C0BF58E1968FA4404340E1B4E0455F41C0BFFA0D130D5240434001030000000100000009000000D6C4025FD1ADDEBF4E4700378B1543407D1F0E12A27CDEBFDAFE959526154340790261A75835DEBFFFB0A54753154340DB3521AD31E8DDBFD8F4A0A014154340051901158E20DEBF2272FA7ABE144340D593F947DFA4DEBFAF95D05D121543404568041BD7BFDEBFBA84436FF11443403D29931ADA00DFBF59C2DA183B154340D6C4025FD1ADDEBF4E4700378B15434001030000000100000005000000A393A5D6FB8DE6BF2EAA454431DD4240A1BB24CE8AA8E6BF696FF085C9DC42409A5FCD0182B9E6BF75AE282504DD4240207A522635B4E6BFCB9C2E8B89DD4240A393A5D6FB8DE6BF2EAA454431DD42400103000000010000000D000000E54350357AB5E7BFDB17D00B77E0424061A92EE06586E7BFB49080D1E5DF424044BE4BA94B46E7BF1BD5E940D6DF4240290989B48D3FE7BFA33D5E4887DF4240726F7EC34483E7BFEE5C18E945DF4240EB909BE1067CE7BF00C45DBD8ADE42402383DC4598A2E7BFD2E28C614EDE4240FB21365838C9E7BFE814E46723DF42400D6C956071B8E7BF85251E5036DF4240C9E53FA4DFBEE7BF62BB7B80EEDF424020EBA9D557D7E7BF31B2648EE5DF4240DC0DA2B5A2CDE7BF249BABE639E04240E54350357AB5E7BFDB17D00B77E04240010300000001000000060000002B8881AE7D81E7BF45DAC69FA8D44240F3E2C4573B8AE7BF5FB69DB646D442402446CF2D74A5E7BF7DEC2E5052D4424065ABCB2901B1E7BF76FA415DA4D44240E44C13B69F8CE7BFA2D11DC4CED442402B8881AE7D81E7BF45DAC69FA8D442400103000000010000000900000020B24813EF80E8BF20459DB987D84240CC7F48BF7D9DE8BF6B813D2652D8424088821953B0C6E8BFD449B6BA9CD84240D68BA19C68D7E8BFA29C685721D942406DFFCA4A93D2E8BF221807978ED942400E6B2A8BC2AEE8BFB22E6EA301DA42405C59A2B3CCA2E8BF9AEAC9FCA3D94240BE839F38807EE8BF04AF963B33D9424020B24813EF80E8BF20459DB987D8424001030000000100000007000000753BFBCA8374E9BF7E5182FE42D94240499D8026C286E9BFCBBBEA01F3D84240E0D572672698E9BF1CEDB8E177D94240363FFED2A2BEE9BF357C0BEBC6D9424086C77E164B91E9BFC382FB010FDA42408962F2069879E9BF342BDB87BCD94240753BFBCA8374E9BF7E5182FE42D9424001030000000100000007000000D6C6D8092F41F4BFB96DDFA3FEC6424023A0C211A452F4BFB4E4F1B4FCC642409483D9041856F4BFF1A1444B1EC74240F4DC42572250F4BF4ACFF41263C7424002124DA08845F4BFBE69FAEC80C7424008CBD8D0CD3EF4BF4E7CB5A338C74240D6C6D8092F41F4BFB96DDFA3FEC6424001030000000100000005000000D9243FE257ACF8BF44F8174163B44240BE2EC37FBAC1F8BF17F4DE1802B44240C26A2C616DCCF8BF6405BF0D31B44240C9224DBC03BCF8BFE597C11891B44240D9243FE257ACF8BF44F8174163B442400103000000010000000500000008043A93365503C0081C0934D8964140B1FB8EE1B15F03C09DA04D0E9F9641409FE3A3C5196303C0EA08E066F1964140BEA1F0D93A5803C06ADC9BDF3097414008043A93365503C0081C0934D896414001030000000100000005000000C4CDA964006803C0D7A205685B97414097E65608AB7103C07E6FD39FFD964140DE04DF347D7603C0AB798EC8779741402385B2F0F57503C0028063CF9E974140C4CDA964006803C0D7A205685B97414001030000000100000006000000E82D1EDE738003C095D233BDC4964140D923D40CA98203C00806103E94964140B459F5B9DA8A03C038DBDC989E9641405C57CC086F8F03C02DB1321AF9964140C11E1329CD8603C0865968E734974140E82D1EDE738003C095D233BDC496414001030000000100000006000000CAC51858C7F103C0BCE6559DD5AE45405CAAD216D7F803C068CD8FBFB4AE45404910AE8042FD03C087C267EBE0AE454007978E39CFF803C06B44300E2EAF4540DBC2F352B1F103C0289CDD5A26AF4540CAC51858C7F103C0BCE6559DD5AE454001030000000100000006000000A86F99D3657105C08A5A9A5B21B645406B4AB20E477705C0EC32FCA71BB6454092205C01857A05C0616F62484EB6454092205C01857A05C061342BDB87B6454019E25817B77105C08A01124DA0B64540A86F99D3657105C08A5A9A5B21B6454001030000000100000006000000AD16D863226507C05B7B9FAA42A54140EBAA402D066F07C0E09EE74F1BA54140DC2C5E2C0C7107C0626534F279A5414009DE9046056E07C0D5CBEF3499A541405BEF37DA716307C008E6E8F17BA54140AD16D863226507C05B7B9FAA42A5414001030000000100000016000000BDAC8905BEC207C09B3DD00A0CA541405DC30C8D27C207C052EDD3F198A54140FE463B6EF8BD07C0681F2BF86DA64140CEC7B5A162BC07C0A45016BEBEA64140F59F353FFEB207C0A48D23D6E2A7414022179CC1DFAF07C09EEC66463FA8414058A835CD3BAE07C09D2CB5DE6FA841405E0F26C5C7A707C09F5912A0A6A84140CF2EDFFAB09E07C027A3CA30EEA841409D47C5FF1D9107C01500E31934A841401024EF1CCA9007C0AAD72D0263A74140B3CEF8BEB87407C0529CA38E8EA54140880D164ED27C07C07A19C5724BA54140E04DB7EC107F07C043CBBA7F2CA4414006F52D73BA6C07C0D044D8F0F4A24140C1525DC0CB6C07C059147651F4A24140A60A4625758207C07DCF488446A24140726E13EE959907C03C6C223317A241402D41464085A307C0253B3602F1A24140A46C91B41BBD07C043E21E4B1FA44140AE7FD767CEBA07C063EC8497E0A44140BDAC8905BEC207C09B3DD00A0CA5414001030000000100000005000000D4B837BF614208C0F8A57EDE54F84140BA6B09F9A04708C0556B6116DAF741407155D977455008C087DBA16131F8414041D5E8D5004508C0AD4CF8A57EF84140D4B837BF614208C0F8A57EDE54F84140010300000001000000060000005B7B9FAA424308C0C30DF8FC30AC45409737876BB54708C050E27327D8AB45404C6F7F2E1A5208C0E7357689EAAB45409B02999D454F08C012A5BDC117AC45409DF7FF71C24408C0CEAACFD556AC45405B7B9FAA424308C0C30DF8FC30AC4540010300000001000000070000007D40A03369D30DC0F81A82E332BC4540E083D72E6DD80DC01B49827005BC45403D47E4BB94DA0DC01D76DF313CBC4540F373435376DA0DC0E9263108ACBC45404014CC9882D50DC03C69E1B20ABD45409ED32CD0EED00DC065FD6662BABC45407D40A03369D30DC0F81A82E332BC4540010300000001000000060000002C7DE882FA160FC0D0B87020249B4140DFC14F1C401F0FC047CCECF3189B4140309E4143FF240FC0CCEEC9C3429B414097E13FDD40210FC0C3F2E7DB829B414072A8DF85AD190FC01FF7ADD6899B41402C7DE882FA160FC0D0B87020249B41400103000000010000000600000044DD0720B53913C0BFF2203D45B84540637C98BD6C3B13C0C91CCBBBEAB74540698D4127843E13C04644317903B84540A1BAB9F8DB3E13C01C7C613255B84540CD069964E43C13C04E44BFB67EB8454044DD0720B53913C0BFF2203D45B84540010300000001000000170000004B94BDA59C5F15C0876F61DD78EF414044C362D4B56615C07E384888F2EF41404B92E7FA3E6C15C0E7FBA9F1D2EF41404FE5B4A7E47C15C061A7583508F1414072874D64E68215C07E8FFAEB15F4414082CAF8F7198715C077BF0AF0DDF441403411363CBD8215C02D93E1783EF541402F6EA301BC7515C069FF03AC55F54140A7B05241456515C09ECF807A33F44140520E6613605815C0D190F12895F24140999B6F44F74C15C0768A558330F34140DAC70A7E1B4215C06C7C26FBE7F14140F1F274AE283515C0971E4DF564F241400F98874CF93015C0AC5626FC52F34140274C18CDCA2615C0B8020AF5F4F34140C5C72764E71D15C0E140481630F3414013622EA9DA1E15C0DE8FDB2F9FF24140C158DFC0E42615C0A7052FFA0AF241405B5D4E09883915C0ADA1D45E44F14140B5C6A013424715C053CA6B2574F14140EFAB72A1F24F15C052B648DA8DF041409964E42CEC5915C06666666666F041404B94BDA59C5F15C0876F61DD78EF41400103000000010000000600000005323B8BDEA915C098BF42E6CAF44140FE80070610AE15C0D49AE61DA7F441408B355CE49EAE15C02FDFFAB0DEF441401A1A4F0471AE15C0315D88D51FF541406E4DBA2D91AB15C0889D29745EF5414005323B8BDEA915C098BF42E6CAF44140010300000001000000060000002F302B14E96E16C03B38D89B180042402AAA7EA5F37116C0A393A5D6FBFF4140C6C1A563CE7316C0DD4598A25C004240B0E3BF40107016C050DF32A7CB0042408FA850DD5C6C16C0CC07043A930042402F302B14E96E16C03B38D89B180042400103000000010000000500000010C99063EBB916C0868F882991C84540A1BFD02346BF16C072E0D57267C845405AB8ACC266C016C0876BB587BDC84540DD25715644BD16C0F6B6990AF1C8454010C99063EBB916C0868F882991C84540010300000001000000050000005E0EBBEF18BE16C0C7BDF90D13C74540C217265305C316C04AD235936FC64540D311C0CDE2C516C065A6B4FE96C645408E588B4F01C016C0003620425CC745405E0EBBEF18BE16C0C7BDF90D13C7454001030000000100000005000000DFA46950341F18C0BB5F05F86ECB454091291F82AA2118C0A1D634EF38CB454085CE6BEC122518C0ED116A8654CB45401A34F44F702118C010786000E1CB4540DFA46950341F18C0BB5F05F86ECB454001030000000100000006000000E6B2D1393F1519C0153AAFB14B4442409B012EC8961519C085B4C6A0134442403D64CA87A01A19C06684B70721444240CAFB389A231B19C04B57B08D78444240E0A0BDFA781819C0A661F88898444240E6B2D1393F1519C0153AAFB14B44424001030000000100000005000000C51B9947FE4019C024456458C5434240B760A92EE04519C083893F8A3A43424048F949B54F4719C0F4DE18028043424044A67C08AA4619C0D0F0660DDE434240C51B9947FE4019C024456458C543424001030000000100000005000000B4AA251DE5E019C0632827DA555E424019ADA3AA09E219C04F401361C35D42407E384888F2E519C0DB183BE1255E42405C04C6FA06E619C07D772B4B745E4240B4AA251DE5E019C0632827DA555E4240010300000001000000060000005454FD4AE7F31DC0AF94658863DD454006651A4D2EF61DC0D600A5A146DD4540C0CE4D9B71FA1DC060AC6F6072DD454065C746205EF71DC0D49D279EB3DD4540CCB8A981E6F31DC0E5D4CE30B5DD45405454FD4AE7F31DC0AF94658863DD45400103000000010000000700000036AD1402B9841EC045BC75FEEDE0454069AB92C83E881EC0684128EFE3E04540F4FA93F8DC891EC0246420CF2EE145405F61C1FD80871EC09B594B0169E14540323D618907841EC0E4BED53A71E1454017821C9430831EC0F8E3F6CB27E1454036AD1402B9841EC045BC75FEEDE045400103000000010000000600000005A568E55E501FC01E53776517DA454033FCA71B28501FC072BF4351A0D9454067B62BF4C1521FC0F88A6EBDA6D945404C546F0D6C551FC07D04FEF0F3D94540A85489B2B7541FC0622F14B01DDA454005A568E55E501FC01E53776517DA4540010300000001000000060000009DB81CAF40541FC088D9CBB6D3DA45406EFC89CA86551FC074D3669C86DA454000C79E3D97591FC0601DC70F95DA45409225732CEF5A1FC07A724D81CCDA454044A33B889D591FC0CA5356D3F5DA45409DB81CAF40541FC088D9CBB6D3DA4540010300000001000000060000008AAF7614E76821C01DCC26C0B0344540E9D32AFA436B21C04E62105839344540745DF8C1F96C21C043723271AB3445408AAC3594DA6B21C0E77283A10E354540051555BFD26921C07B6B60AB043545408AAF7614E76821C01DCC26C0B0344540010300000001000000090000005DC2A1B7789021C021037976F94E4540E77283A10E9321C0E38DCC237F4E4540BE30992A189521C086AB0320EE4E45404E0B5EF4159421C047AE9B525E4F454091EF52EA929121C054AD8559684F45404833164D678F21C0B2632310AF4F454006651A4D2E8E21C01E8997A7734F4540B18BA2073E8E21C01BBAD91F284F45405DC2A1B7789021C021037976F94E45400103000000010000000600000069AA27F38F9621C085B4C6A0134E4540F64201DBC19821C0AC71361D014E4540A81C93C5FD9721C015C5ABAC6D4E4540B91803EB389621C052F01472A54E45408BDD3EABCC9421C0ED0E2906484E454069AA27F38F9621C085B4C6A0134E454001030000000100000005000000AA2B9FE5799821C02101A3CB9B19454073D9E89C9F9A21C01CB3EC4960194540ED65DB696B9C21C0A4AB74779D1945406E6DE179A99821C076A565A4DE194540AA2B9FE5799821C02101A3CB9B1945400103000000010000000B0000009224085740A921C03D9B559FABAD4540618E1EBFB7A921C0FFEBDCB419AD45408315A75A0BAB21C0274BADF71BAD45404030478FDFAB21C03D9B559FABAD4540CDAB3AAB05AE21C03D9B559FABAD4540B858518369B021C0807EDFBF79AD4540D26F5F07CEB121C03D9B559FABAD4540EB724A404CB221C09B3924B550AE454084471B47ACAD21C092B245D26EAE45404C18CDCAF6A921C06CAF05BD37AE45409224085740A921C03D9B559FABAD454001030000000100000006000000350C1F1153AA21C0BD8FA339B23E4540E95F92CA14AB21C03909A52F843E45405516855D14AD21C0D0622992AF3E4540656EBE11DDAB21C037FDD98F143F454020ED7F80B5AA21C0B39943520B3F4540350C1F1153AA21C0BD8FA339B23E45400103000000010000000F000000973C9E961FB021C0CE1951DA1B3E45407AA9D898D7B121C0785F950B953D4540A27A6B60ABB421C0F1BC546CCC3D45408B34F10EF0B421C069368FC3603E45408159A148F7B321C0DD26DC2BF33E4540FBB2B45373B121C03CDD79E2393F454081E84999D4B021C0DB1324B6BB3F45401D041DAD6AB121C0CEA5B8AAEC3F45409FC9FE791AB021C016DD7A4D0F4045407520EBA9D5AF21C08DF161F6B23F454006137F1475AE21C0412B3064753F4540C00644882BAF21C033FAD170CA3E45400283A44FABB021C0CEFA9463B23E4540566133C005B121C0577A6D36563E4540973C9E961FB021C0CE1951DA1B3E454001030000000100000005000000336C94F59BB121C09F39EB538E3B45400438BD8BF7B321C0A33EC91D363B4540F5F23B4D66B421C08CA03193A83B4540B9162D40DBB221C076A565A4DE3B4540336C94F59BB121C09F39EB538E3B454001030000000100000005000000B13385CE6BB421C04B917C2590124540723788D68AB621C00B7F86376B12454098C3EE3B86B721C07E01BD70E712454014D044D8F0B421C04CC45BE7DF124540B13385CE6BB421C04B917C2590124540010300000001000000050000005B79C9FFE4B721C05952EE3EC73B45407BBFD18E1BB621C0EF39B01C213B4540E753C72AA5B721C00C1F1153223B45403F389F3A56B921C0815A0C1EA63B45405B79C9FFE4B721C05952EE3EC73B454001030000000100000015000000D74CBED9E6BE21C0F19D98F562484540D4D17135B2BB21C03E93FDF334484540904FC8CEDBB821C076DD5B91984845404D2EC6C03AB621C0F19D98F562484540C2A2224E27B921C0FC1C1F2DCE4645409370218FE0B621C09FAC18AE0E4645409C18929389BB21C019A9F7544E454540D6C743DFDDBA21C08C497F2F854345407A5567B5C0BE21C048BF7D1D3843454080457EFD10C321C0AB77B81D1A444540E4A08499B6BF21C0ABB019E082444540DD239BABE6C121C02A8F6E8445454540F6083543AAC021C09FAC18AE0E464540B24CBF44BCBD21C03E78EDD286474540B4E386DF4DBF21C06CEA3C2AFE474540D0436D1B46C121C0E4DBBB067D474540FAB836548CC321C0A911FA997A474540D6E6FF5547C621C028F1B913EC47454098158A743FC721C0EFA99CF6944845402C499EEBFBC021C0164D672783494540D74CBED9E6BE21C0F19D98F562484540010300000001000000050000006E861BF0F9B921C0808120408612454013656F29E7BB21C07D772B4B741245400CAD4ECE50BC21C04F029B73F012454036CD3B4ED1B921C081221631EC1245406E861BF0F9B921C0808120408612454001030000000100000014000000249A40118BC821C0CAFB389A2319454037C2A2224EC721C0D4B7CCE9B2184540736891ED7CC721C0E7C589AF761845406B11514CDEC821C083177D0569184540C78157CB9DC921C0A7C98CB795184540BD38F1D58ECA21C0EAB12D03CE184540D4B9A29410CC21C059F78F85E81845403CF71E2E39CE21C04CA7751BD418454068757286E2CE21C0965E9B8D95184540D49AE61DA7D021C0FC8BA03193184540F0A31AF67BD221C0C8B7770DFA184540C76471FF91D121C0C233A149621945409DD9AED007D321C02EAEF199EC1945408B16A06D35D321C01406651A4D1A45405018946934D121C0054D4BAC8C1A4540CC086F0F42D021C0CC608C48141A4540525F96766ACE21C0EA9106B7B5194540672AC423F1CA21C0E23FDD4081194540C78157CB9DC921C0F015DD7A4D194540249A40118BC821C0CAFB389A231945400103000000010000001D000000B2B8FFC874D021C0FA9CBB5D2F1B4540483140A209D421C067B5C01E131B4540512E8D5F78D521C0D026874F3A1B4540B48F15FC36D421C02D5DC136E21B45402387889B53D121C094F8DC09F61B454053D0ED258DD121C0615111A7931C4540451152B7B3CF21C06C3F19E3C31C454082C64CA25ED021C0F12DAC1BEF1C45403C855CA967D121C0FDBB3E73D61D4540632827DA55D021C08C82E0F1ED1D454017D7F84CF6CF21C0B8CD5488471E4540A4FFE55AB4D021C0F8A41309A61E4540469561DC0DD221C0DAE21A9FC91E45407DB3CD8DE9D121C0102384471B1F454050711C78B5D421C02F8672A25D1F454084D89942E7D521C09EB30584D61F45407383A10E2BD421C008CDAE7B2B20454074081C0934D021C056D4601A861F4540FF428F183DCF21C03788D68A361F45406D75392520CE21C082380F27301F4540BC57AD4CF8CD21C0876BB587BD1E4540596DFE5F75CC21C0514F1F813F1E45405D177E703ECD21C0C79E3D97A91D4540E7E104A6D3CA21C00A664CC11A1D4540AF25E4839ECD21C07BF7C77BD51C4540F1BDBF417BCD21C0C7116BF1291C454034BBEEAD48CC21C07C28D192C71B454058E2016553CE21C0BD6F7CED991B4540B2B8FFC874D021C0FA9CBB5D2F1B45400103000000010000000500000054FD4AE7C3CB21C0A4A65D4C3345454028F04E3E3DCE21C0B4AA251DE54445406EC328081ECF21C09A0986730D454540AEF4DA6CACCC21C01215AA9B8B45454054FD4AE7C3CB21C0A4A65D4C33454540010300000001000000050000007235B22B2DD321C0D32EA699EE4545404696CCB1BCD321C0DB317557764545409D2D20B41ED621C00A6AF816D64545404ED2FC31ADD521C06937FA980F4645407235B22B2DD321C0D32EA699EE45454001030000000100000013000000876F61DD78D721C08C9DF0129C324540DC679599D2DA21C0ED10FFB0A53145406B9BE27151DD21C05E0EBBEF18304540341477BCC9DF21C0C0D02346CF2D45403815A930B6E021C002F566D47C2D4540402FDCB930E221C0962023A0C22D45407505DB8827E321C08F368E588B2D45400150C58D5BE421C0E57D1CCD912D4540D175E107E7E321C0C0D02346CF2D45408D26176360E521C05B441493372E4540B6D8EDB3CAE421C097917A4FE52E4540B14E95EF19E121C044FB58C16F2F45405ABA826DC4E321C02B33A5F5B730454036B05582C5E121C08A56EE05663145406EF8DD74CBDE21C04BE5ED08A731454010CB660E49DD21C0A305685BCD32454043739D465ADA21C0CCD3B9A294324540807D74EACAD721C0889E94490D334540876F61DD78D721C08C9DF0129C324540010300000001000000070000008690F3FE3FDE21C09A0645F3002C454072C45A7C0AE021C0AB2006BAF62B4540EE4108C897E021C0315F5E807D2C45401EFE9AAC51DF21C0581B6327BC2C4540B404190115DE21C05BCEA5B8AA2C4540685C381092DD21C04A9869FB572C45408690F3FE3FDE21C09A0645F3002C45400103000000010000000600000020EEEA5564EC21C0EE056685226345409CDF30D120ED21C04D2CF015DD6245403D62F4DC42EF21C08BFF3BA2426345402FC1A90F24EF21C0A167B3EA736345403695456117ED21C0FBC9181F6663454020EEEA5564EC21C0EE05668522634540010300000001000000110000005890662C9A0622C0981936CAFA3D454024D236FE440522C022C7D633843D4540730F09DFFB0322C03753211E893D4540C190D5AD9E0322C035D07CCEDD3C4540EC1681B1BE0122C0B378B130443C454024D40CA9A20022C0D8D30E7F4D3C45406CEA3C2AFEFF21C007B7B585E73B4540153AAFB14B0422C00971E5EC9D3B45402B16BF29AC0422C0EBA9D557573B4540747B4963B40622C04F07B29E5A3B4540EF552B137E0922C0AB3DEC85023C454062A1D634EF0822C077D844662E3C4540DD28B2D6500A22C08046E9D2BF3C45408692C9A99D0922C07FA31D37FC3C45403CF9F4D8960922C08DF161F6B23D4540DFC2BAF1EE0822C02234828DEB3D45405890662C9A0622C0981936CAFA3D4540010300000001000000060000003D9D2B4A090122C02B6A300DC33F45400CCD751A690122C0425F7AFB733F45409581035ABA0222C03FE08101843F45408BE1EA00880322C0C4995FCD0140454023F77475C70222C0BDFF8F13264045403D9D2B4A090122C02B6A300DC33F454001030000000100000006000000DFBF7971E20322C04DC0AF91244245403813D385580522C00D1CD0D215424540338CBB41B40622C0FDFA2136584245405C04C6FA060622C0994BAAB69B4245407F32C687D90322C07044F7AC6B424540DFBF7971E20322C04DC0AF9124424540010300000001000000060000001898158A741722C05C1D007157414540FBAD9D28091922C0394206F2EC404540376DC669881A22C0BB7D56992941454071FF91E9D01922C0310BED9C66414540E92807B3091822C04DF6CFD3804145401898158A741722C05C1D00715741454001030000000100000005000000696FF085C95C22C055C03DCF9F704540CDCD37A27B5E22C0F6436CB070704540B29B19FD686022C069520ABABD7045401B4641F0F85E22C07E6FD39FFD704540696FF085C95C22C055C03DCF9F70454001030000000100000075000000299485AFAFED2AC044317903CC203D40AD50A4FB39ED2AC05FECBDF8A21D3D406F9C14E63DE62AC0BDA94885B1193D40404E98309AE52AC0E15E99B7EA163D40B130444E5FE72AC0E5284014CC143D40B6BC72BD6DEE2AC0B1170AD80E0E3D40DC2A8881AEED2AC0357C0BEBC60B3D4044BFB67EFAEF2AC0693524EEB1083D40F37519FED3ED2AC09692E52494063D40319A95ED43EE2AC0A2629CBF09053D4008E6E8F17BF32AC0377007EA94033D404DBED9E6C6F42AC0B14E95EF19013D401CB7989F1BFA2AC07B6B60AB04FF3C404DF6CFD380F92AC00E2C47C840FE3C40C636A968ACFD2AC0FA2B64AE0CFE3C40259529E620082BC0FAD005F52DFB3C40E4DBBB067D092BC0855D143DF0F93C40E7C75F5AD40F2BC0FD4FFEEE1DF93C4054FD4AE7C3132BC04568041BD7F73C4007B29E5A7D152BC080B8AB5791F53C404DDA54DD232B2BC07B698A00A7F33C40CF13CFD902322BC0D3A0681EC0F23C4042E90B21E7352BC067EF8CB62AF13C40066344A2D03A2BC0A96BED7DAAEE3C40E4BB94BA64442BC09D64ABCB29ED3C400F29064834492BC06956B60F79EB3C403CBD529621562BC020EBA9D557EB3C40F73E5585065A2BC0388600E0D8EB3C4090662C9ACE5E2BC0527FBDC282EB3C40F7EAE3A1EF662BC0DE8E705AF0EA3C40C651B9895A7A2BC04CC2853C82E73C40C85EEFFE787F2BC00A9DD7D825E23C40111AC1C6F57F2BC03A2174D025E03C40BAF42F4965822BC0E4A25A4414DF3C404548DDCEBE8A2BC0AC90F2936ADB3C40637D03931B8D2BC0BADBF5D214D93C40BC5AEECC04932BC0E17B7F83F6D63C40680586AC6E952BC0B4CA4C69FDD93C4049BC3C9D2B9A2BC09E961FB8CADB3C406823D74D299F2BC0185E49F25CDB3C409DF7FF71C2A42BC0DD442DCDADDC3C40A73E90BC73A82BC0C405A051BADC3C40F2E9B12D03AE2BC02995F0845EDB3C4063EC8497E0B42BC01E17D522A2DC3C40AA61BF27D6B92BC0601E32E543DC3C402ECA6C9049BE2BC08D2782380FDB3C406DE179A9D8C02BC045D5AF743EDC3C408522DDCF29C02BC0CB49287D21E03C40B69DB64604C32BC054FF209221E33C407C992842EABE2BC02FDFFAB0DEE43C4097546D37C1B72BC0DFFAB0DEA8E53C403E20D099B4B12BC0EF8D210038EA3C4062DBA2CC06A92BC0CE1ABCAFCAED3C4011346612F5AA2BC0CDB1BCAB1EF43C401172DEFFC7A92BC0D2A92B9FE5F53C406133C005D9AA2BC0E1CE85915EF83C40D15B3CBCE7A82BC01EA4A7C821FA3C408CD7BCAAB3AA2BC0BF805EB873FD3C40A835CD3B4EA92BC07B6B60AB04FF3C4063B9A5D590A82BC01492CCEA1D023D408597E0D407A22BC01CCEFC6A0E083D40739CDB847B9D2BC0DB8827BB99093D40569E40D829962BC06E313F37340D3D40637D03931B8D2BC07AA86DC328103D403B53E8BCC6862BC0EE05668522113D40691CEA7761832BC03F1A4E999B133D40BAF42F4965822BC09626A5A0DB133D402313F06B24812BC08A7780272D143D4057E9EE3A1B722BC0F7730AF2B3153D40B22D03CE526A2BC056BABBCE86143D40D47C957CEC662BC0A33F34F3E4163D4001A43671725F2BC03FABCC94D6173D4090662C9ACE5E2BC0ADA415DF50183D400B43E4F4F55C2BC0BDA94885B1193D401E705D31235C2BC0672C9ACE4E1A3D4059315C1D00512BC09C4EB2D5E51C3D4083F8C08EFF522BC032C85D84291E3D40DD239BABE6512BC046EF54C03D1F3D40CB845FEAE74D2BC079EBFCDB651F3D4059C2DA183B492BC0D13B1570CF1F3D40EACC3D247C472BC0B29C84D2171E3D401500E31934442BC08BE07F2BD91D3D408ACA8635953D2BC027C11BD2A8203D406803B001113A2BC096CB46E7FC203D401E4FCB0F5C352BC027D87F9D9B223D40AA44D95BCA312BC0AA0D4E44BF223D40B64B1B0E4B2B2BC06F4562821A223D400B28D4D347202BC00C056C07231E3D40F4DF83D72E1D2BC0301004C8D01D3D4058E6ADBA0E152BC0E3C4573B8A1F3D409510ACAA970F2BC0DAC534D3BD223D401A31B3CF630C2BC028F4FA93F8243D407D923B6C220B2BC030293E3E212B3D40A7C98CB795062BC0DDEEE53E392E3D4023DA8EA9BB022BC0C66AF3FFAA333D40C971A774B0FE2AC04DBC033C69353D40815F234910FE2AC0D87DC7F0D8373D4056BB26A435F62AC0DA70581AF8393D402F88484DBBF02AC0EF3A1BF2CF3C3D40EACBD24ECDED2AC009DE9046053A3D408274B169A5E82AC012F758FAD0393D4094A3005130E32AC0925D6919A9373D40361E6CB1DBDF2AC08ACBF10A44373D403239B5334CDD2AC0BE4BA94BC6353D4045BB0A293FD92AC09D9E776341353D40A83462669FD72AC0DA0242EBE1333D404F081D7409D72AC050340F6091333D405517F032C3D62AC00B444FCAA4323D40A83462669FD72AC06F7F2E1A32323D40A83462669FD72AC02BDF3312A1313D40A83462669FD72AC076340EF5BB303D40A83462669FD72AC02882380F27303D40C976BE9F1AD72AC0EBE40CC51D2F3D40A83462669FD72AC01B9FC9FE792E3D402D24607479DB2AC0863AAC70CB273D407EE02A4F20E42AC0DFFAB0DEA8253D40299485AFAFED2AC044317903CC203D40010300000001000000320000005C3E92921EFE2AC0C7293A92CB473D40CD751A69A9FC2AC063D34A2190473D40D190F12895F82AC0033FAA61BF473D4058FFE7305FF62AC058C85C1954473D40747E8AE3C0F32AC0C32ADEC83C463D40F19E03CB11F22AC0A8E507AEF2443D407156444DF4F12AC0791EDC9DB5433D4099D53BDC0EF52AC064963D096C423D40D68F4DF223F62AC05019FF3EE3423D40B1FB8EE1B1F72AC0AD4CF8A57E423D407C7E18213CFA2AC066BCADF4DA403D409981CAF8F7F92AC096CFF23CB83F3D40541EDD088BFA2AC0E09F5225CA3E3D4046240A2DEBFE2AC05DA79196CA3B3D405E66D828EBFF2AC025CADE52CE3B3D4051C1E10511012BC07F69519FE43A3D40D2E3F736FD012BC0BB9BA73AE43A3D40D6FCF84B8B022BC0293DD34B8C393D40B2D47ABFD1062BC066DCD440F3393D40226E4E2503082BC0EB7420EBA9393D40600322C4950B2BC04BE48233F8373D4088484DBB980E2BC04F78094E7D383D406FBA6587F80F2BC0EA5BE67459383D40EFFE78AF5A112BC03A0664AF77373D401E8CD82780122BC09FE8BAF083373D403FADA23F34132BC06F9BA9108F383D406C7A50508A162BC0774CDD955D383D405BED612F14182BC034D6FECEF6383D40F92F1004C8182BC0F10D85CFD6393D407E6E68CA4E172BC0F7AE415F7A3B3D40D2C77C40A0132BC0DD96C805673C3D4012DC48D922112BC05E64027E8D3C3D40266DAAEE910D2BC0F1F5B52E353E3D40459C4EB2D50D2BC098DEFE5C34403D40795DBF60370C2BC03C873254C5403D40E4D70FB1C10A2BC020EF552B13423D403B511212690B2BC08E791D71C8423D403BA8C4758C0B2BC0077AA86DC3443D4060764F1E160A2BC0A376BF0AF0453D407381CB63CD082BC0DE73603942463D40252191B6F1072BC05C1D007157473D40F6CE68AB92082BC0B1A206D330483D406153E751F1072BC0938C9C853D493D40BD361B2B31072BC0236AA2CF47493D4095B88E71C5052BC065389ECF804A3D408E90813CBB042BC0C3F5285C8F4A3D400CEA5BE674012BC05801BEDBBC493D40ABAE433525012BC0EAEA8EC536493D4017450F7C0CFE2AC0A3CC069964483D405C3E92921EFE2AC0C7293A92CB473D40010300000001000000160000003D2AFEEF88022BC06F8445459C6A3D400971E5EC9D012BC040A54A94BD693D40406CE9D154FF2AC0D8497D59DA693D408EB27E3331FD2AC0FEB7921D1B693D40FD32182312FD2AC0D21C59F965683D40C426327381FB2AC088855AD3BC673D40677C5F5CAAFA2AC07DCA3159DC673D40C68B852172FA2AC0D74CBED9E6663D4073F22213F0FB2AC0431CEBE236663D405D514A0856FD2AC07995B54DF1643D40567E198C11012BC0DF3312A111643D4055DB4DF04D032BC0BD55D7A19A623D40A721AAF067082BC09D6516A1D8623D40921FF12BD6082BC0240F441669623D4052D66F26A60B2BC027F73B1405623D4059A48977800F2BC0C9C859D8D3623D40D44334BA83102BC0D235936FB6653D405320B3B3E80D2BC07EA8346266673D404165FCFB8C0B2BC0CE4F711C78693D40D5963AC8EB092BC0DF701FB935693D40153C855CA9072BC05D8940F50F6A3D403D2AFEEF88022BC06F8445459C6A3D400103000000010000000D000000D6E429ABE9122BC001BEDBBC714E3D40CD785BE9B5112BC03465A71FD44D3D403F027FF8F90F2BC097E4805D4D4E3D40DCB75A272E0F2BC0077DE9EDCF4D3D401EC4CE143A0F2BC01D925A28994C3D4029E8F692C6102BC0CF143AAFB14B3D406092CA1473102BC0AAB69BE09B4A3D40E3A6069ACF112BC0427A8A1C224A3D400BCF4BC5C6142BC01BD47E6B274A3D4094A3005130132BC094FAB2B4534B3D4031EBC5504E142BC020B41EBE4C4C3D40B95164ADA1142BC057B1F84D614D3D40D6E429ABE9122BC001BEDBBC714E3D400103000000010000001200000076E272BC02A12BC0912C6002B7BE3C40E5D18DB0A8A02BC0C8409E5DBEBD3C4077DA1A118CA32BC0FB928D075BBC3C408ECA4DD4D2A42BC03FE3C28190BC3C40F58079C894A72BC042AF3F89CFBD3C4088D51F6118A82BC05E4A5D328EBD3C40683EE76ED7AB2BC0B858518369C03C4096253ACB2CAA2BC09B559FABADC03C402579AEEFC3A92BC0B1FCF9B660C13C40DB519CA38EA62BC015AA9B8BBFC13C40AEF02E17F1A52BC05C8E57207AC23C40D0B8702024A32BC01D1D5723BBC23C40738236397CA22BC0D32F116F9DC33C4028486C770FA02BC0033FAA61BFC33C402B357BA015A02BC0FA7DFFE6C5C13C406823D74D299F2BC0D3A414747BC13C40FA2AF9D85DA02BC093E4B9BE0FBF3C4076E272BC02A12BC0912C6002B7BE3C400103000000010000008D000000CD7344BE4BC12BC0EDD45C6E30C03C4071546EA296BE2BC04A46CEC29EBE3C40E6E61BD13DBB2BC09294F430B4BE3C40629E95B4E2BB2BC0F52C08E57DBC3C4090BFB4A84FBA2BC03DD68C0C72BB3C408CDAFD2AC0AF2BC073840CE4D9B93C40CA17B49080A92BC040A0336953B13C40CF87670932AA2BC0075E2D7766AE3C409B046F48A3AA2BC049D8B79388AC3C404FAC53E57BA62BC0BFEFDFBC389D3C409B02999D45A72BC0C4D155BABB9A3C40F3AACE6A81A52BC0EA92718C64973C40E5284014CCA82BC018B5FB5580933C40FDDD3B6A4CA82BC08672A25D85903C4027A3CA30EEA62BC0ED612F14B08D3C40700A2B1554AC2BC08B5242B0AA8A3C4082AB3C81B0AB2BC04C33DDEBA4863C407555A01683AF2BC017821C9430833C4000E31934F4AF2BC0AE7E6C921F813C40AA2C0ABB28B22BC0CDB1BCAB1E803C406EBF7CB262B82BC0FAB31F29227F3C403DB7D09508BC2BC0286211C30E7B3C40BE4EEACBD2B62BC062821ABE85753C4063D520CCEDB62BC0FB761211FE713C40789ACC785BB92BC0CBF78C4468703C4078D4981073B92BC027C0B0FCF96E3C40193A765089B32BC0D05FE811A36B3C40D653ABAFAEB22BC00F0C207C28693C40B69E211CB3B42BC081E84999D4643C40C1E09A3BFAB72BC0C2C1DEC490643C408D5F7825C9BB2BC04293C492725F3C409833DB15FAC02BC0B265F9BA0C5B3C40EBFEB1101DC22BC085436FF1F0563C4097749483D9C42BC0A724EB7074553C40BAA46ABB09C62BC0BAF770C971533C4046787B1002CA2BC05281936DE0523C40639813B4C9C92BC0D8D2A3A99E503C40033E3F8C10CE2BC03813D385584D3C404C530438BDCB2BC01077F52A324A3C40E5D3635B06CC2BC0315F5E807D483C40952C27A1F4CD2BC0AA99B51490463C40C138B874CCD12BC00589EDEE01463C4048533D997FD42BC0A12B11A8FE413C4076C075C58CD82BC055F833BC593F3C4010406A1327DF2BC09AEFE0270E3C3C404F948444DAE62BC0CAA65CE15D3A3C404CC5C6BC8EF82BC05839B4C8763A3C40299485AFAFFD2BC03CDBA337DC373C4059DDEA39E9052CC02844C02154353C406BBB09BE690A2CC0533D997FF4353C40C8D11C59F9152CC03D433866D9333C401AF8510DFB252CC0ECFA05BB61333C40333674B33F302CC01747E5266A313C40E2395B4068352CC00053060E68313C40D4D4B2B5BE382CC0EECD6F9868303C402CBB6070CD3D2CC0A515DF50F8303C40F2B1BB4049412CC03A950C0055303C409DB98784EF4D2CC007B5DFDA892E3C400B26FE28EA542CC07381CB63CD2C3C40E8D9ACFA5C652CC055DE8E705A2C3C40E7C41EDAC76A2CC031074147AB2A3C404225AE635C712CC0C09657AEB7293C40C710001C7B762CC0A72215C616263C402481069B3A7F2CC038F4160FEF213C40F52C08E57D8C2CC0B939950C00193C40043C69E1B29A2CC07B832F4CA6123C405B087250C2A42CC066BCADF4DA0C3C40143DF03158A92CC0CE55F31C910B3C404F5DF92CCFBB2CC079B0C56E9F0D3C40567F8461C0C22CC087A3AB74770D3C40ACC612D6C6D02CC0D6E429ABE90E3C40AC90F2936AE72CC05D876A4AB2123C4028D192C7D3F22CC03EEC8502B6133C40505260014C012DC0093543AA28123C406138D73043032DC0BF27D6A9F2113C40505260014C012DC0682101A3CB133C409E996038D7002DC04E62105839143C4056116E32AAFC2CC025B37A87DB153C40116F9D7FBBFC2CC02A8C2D0439183C40CC7B9C69C2FE2CC042CC2555DB193C4005A73E90BCFB2CC019E8DA17D01B3C4056BB26A435F62CC03E0801F9121A3C40637B2DE8BDE92CC0677C5F5CAA1A3C408A8EE4F21FE22CC084F57F0EF3193C4090D78349F1D92CC0A5A2B1F6771A3C4012DA722EC5BD2CC0FC6F253B361E3C40EB1ED95C359F2CC06CEBA7FFAC253C4035D1E7A38C982CC08274B169A5283C4094BE1072DE7F2CC0C84274081C313C407B6649809A722CC0F73AA92F4B373C40FD4B5299626E2CC0DF32A7CB623A3C40D89C8367426B2CC0A7052FFA0A423C405B25581CCE6C2CC06B2C616D8C493C40D6FCF84B8B6A2CC03E5C72DC294D3C4001BEDBBC716A2CC0D3156C239E503C40F1F3DF83D7662CC04AD1CABDC0543C405D16139B8F5B2CC060066344A2583C4078B6476FB8572CC03B376DC6695C3C40CBF27519FE532CC082751C3F545E3C40E44BA8E0F0522CC06A15FDA199633C409F20B1DD3D502CC0A648BE1248653C4026C5C727644F2CC08CF7E3F6CB673C40374F75C8CD502CC0A4FD0FB056693C4052EFA99CF64C2CC0C154336B296C3C409CDF30D1204D2CC023A298BC016E3C407026A60BB14A2CC0378B170B43703C402CBB6070CD3D2CC0556B6116DA753C400A815CE2C8332CC0E17F2BD9B1793C4020B58993FB2D2CC0DD787764AC7E3C40DAE1AFC91A2D2CC0478D093197803C4047E9D2BF24252CC0E063B0E254873C40938B31B08E232CC0B43EE5982C8A3C40A3CA30EE06212CC05ABC5818228B3C40836BEEE87F212CC0BF29AC54508D3C40DEE7F868711E2CC0EFC7ED974F8E3C401F4AB4E4F11C2CC0B18A37328F903C403883BF5FCC162CC090696D1ADB933C40C899266C3F112CC09CE1067C7E983C40FFE9060ABC132CC0BFEFDFBC389D3C40E6E786A6EC042CC06BD784B4C6AC3C40E73A8DB454062CC0075E2D7766AE3C40BA490C022B072CC0E2E82ADD5DAF3C40D28F8653E6062CC0921FF12BD6B03C404277499C15092CC0162F1686C8B13C403E59315C1D082CC093C7D3F203B73C40CFBF5DF6EB062CC0D5E940D653B73C406ABDDF68C7052CC0548D5E0D50B63C40679E5C5320032CC046CF2D7425B63C40B421FFCC20FE2BC043209738F2B83C40CE1C925A28F92BC040A54A94BDB93C40EC134031B2F42BC03F541A31B3BB3C40A0A86C5853F12BC0AC5626FC52BB3C40FE60E0B9F7E82BC0CCD3B9A294BC3C404F948444DAE62BC065A9F57EA3BD3C405F7B664980E22BC0111E6D1CB1BE3C40D2510E6613E02BC0349F73B7EBBD3C40B22D03CE52DA2BC0A94F72874DC03C40790778D2C2D52BC015376E313FBF3C409DD843FB58D12BC0392A37514BBF3C40FF03AC55BBC62BC0F6EE8FF7AAC13C40CD7344BE4BC12BC0EDD45C6E30C03C400103000000010000008400000027A1F48590DB2EC0B87361A417213C40E7C589AF76D42EC0CC7C073F711C3C40978BF84ECCD22EC01F9F909DB7193C40003961C268D62EC04568041BD70F3C407C7F83F6EAD32EC0A2EC2DE57C0D3C4012876C205DD42EC075779D0DF90B3C400D384BC972CA2EC093C3279D48083C40F46C567DAEC62EC0F96871C630073C40399A232BBFC42EC0A0DFF76F5E043C40410C74ED0BC02EC0096F0F4240023C4095F3C5DE8BBF2EC0938B31B08EFF3B4083A7902BF5BC2EC056478E7406FE3B40CE1C925A28C12EC02B8716D9CEFB3B400F98874CF9C02EC0BC0512143FFA3B406B2BF697DDC32EC08B6EBDA607F93B407B1002F225C42EC0E3FE23D3A1F73B40DDB419A721C22EC073D9E89C9FF63B40116E32AA0CC32EC0145AD6FD63F53B40C76471FF91C12EC0DE054A0A2CF43B4029232E008DC22EC02AADBF2500F33B403526C45C52BD2EC09E0B23BDA8F13B405FB87361A4B72EC0E35295B6B8EE3B406C94F59B89B92EC06346787B10EE3B4084656CE866BF2EC01409A69A59EF3B4073B8567BD8C32EC02B1213D4F0ED3B40F84F3750E0C52EC05053CBD6FAE63B40EA4141295AC92EC03997E2AAB2E33B407233DC80CFC72EC07AFB73D190E13B404CDF6B088EC32EC05A4B0169FFDF3B40A6B5696CAFC52EC09869FB5756DE3B40A968ACFD9DC52EC00C923EADA2DB3B40F5A276BF0AC82EC02331410DDFDA3B409C525E2BA1CB2EC059A65F22DEDA3B402FC1A90F24CF2EC0ED9DD15625D93B40DE921CB0ABD12EC0D6355A0EF4D83B4081CD397826D42EC0FA2AF9D85DD83B40FA25E2ADF3D72EC0DB334B02D4D43B4034A0DE8C9AD72EC02B6D718DCFD03B40809C306134DB2EC09CC58B8521CE3B40FF2268CC24E22EC0F7C77BD5CACC3B40562DE92807FB2EC09A780778D2CA3B40B894F3C5DE032FC02F50526001C83B40F984ECBC8D052FC05FCE6C57E8C73B40D50627A25F0B2FC056F146E691C73B40C4CE143AAF112FC0CEFFAB8E1CC53B40740987DEE2192FC0BB97FBE428C43B40588CBAD6DE1F2FC073F6CE68ABC23B401990BDDEFD212FC0263ACB2C42C13B40DA54DD239B232FC00C3CF71E2EBD3B40A1698995D1282FC0C4EA8F300CBC3B4096E7C1DD59332FC04205871744BC3B4014D044D8F03C2FC08F19A88C7FBF3B4032B08EE387422FC0D28F8653E6BE3B4030DAE38574502FC0E9EFA5F0A0C13B40EAAEEC82C1552FC09E40D82956C13B4027A435069D582FC0E59997C3EEBF3B40B51B7DCC075C2FC0834E081D74C13B40EE77280AF4612FC03602F1BA7EC53B40533D997FF4652FC02C47C8409EC53B40E09EE74F1B6D2FC01DE90C8CBCC83B40F5BBB0355B712FC05D177E703EC93B40AAF413CE6E752FC006BD378600CC3B409E9ACB0D867A2FC043723271ABCC3B40E371512D22822FC07973B8567BD03B4047AE9B525E8B2FC018213CDA38D23B40D0807A336A8E2FC0A3586E6935D43B40527FBDC282932FC02655DB4DF0D53B405C751DAA29992FC0DE57E542E5DB3B402F89B3226AA22FC0E76ED74B53E43B40B14F00C5C8AA2FC0F51263997EE93B401424B6BB07A82FC0E0675C3810F23B408CBFED0912AB2FC08D0B0742B2F83B409B8D959867A52FC0E7374C3448FD3B40C2FA3F87F9A22FC073F56393FC003C4064213A048EA42FC00F289B7285033C40C5FEB27BF2A02FC08CD8278062043C401C7920B2489B2FC0147B681F2B043C407506465ED6942FC0D2FD9C82FC043C40DA1A118C838B2FC06286C61341083C40145E82531F882FC034A0DE8C9A0B3C40560DC2DCEE7D2FC0FD153257060D3C40E6B0FB8EE1792FC000A8E2C62D0E3C408313D1AFAD772FC0EA211ADD41103C40CDAD105663712FC0999EB0C403123C40FAB31F29226B2FC05723BBD232163C40A9A0A2EA576A2FC03F6F2A5261183C40E42F2DEA936C2FC00AA2EE03901A3C40DDE9CE13CF692FC0DB87BCE5EA1B3C40CE6E2D93E1682FC0D23AAA9A201E3C4004029D499B6A2FC006854199461F3C40C2FC153257662FC0C5758C2B2E223C407DE71725E8672FC0A4E2FF8EA8243C40BEBC00FBE8642FC08CBAD6DEA7263C40CAC51858C7692FC0251FBB0B94283C40AB75E272BC6A2FC02ECA6C90492A3C405AF0A2AF20652FC02EFF21FDF6293C4059518369185E2FC07F677BF4862B3C40F7915B936E5B2FC04301DBC188293C40E57D1CCD91552FC0EE5EEE93A3283C4047C8409E5D4E2FC04A5E9D63402A3C40433A3C84F14B2FC052499D80262A3C40BF0AF0DDE6452FC019AE0E80B82B3C4037A79201A0422FC0EE409DF2E82A3C4022E3512AE1392FC05C902DCBD7253C4038A0A52BD8362FC0628731E9EF253C40BE2F2E5569332FC0A017EE5C18253C40605B3FFD672D2FC0406B7EFCA5253C4070EF1AF4A5272FC0921FF12BD6243C40063065E0801E2FC0221807978E253C40B0AD9FFEB3162FC072A8DF85AD253C40C4CE143AAF112FC00C3D62F4DC263C40B0726891ED0C2FC03719558671273C404E603AADDB082FC0EC504D49D6253C40F984ECBC8D052FC04E29AF95D0253C40CC9BC3B5DAFB2EC0AFB5F7A92A243C40CDB1BCAB1EF82EC027D87F9D9B223C407061DD7877F42EC07A3881E9B4223C40FBC9181F66EF2EC08B36C7B94D203C4010786000E1E32EC00E85CFD6C1213C400BF148BC3CDD2EC0917BBABA63253C40D4D7F335CBDD2EC0E8C072840C283C407D224F92AEE12EC0158DB5BFB3293C4037894160E5E02EC0D0B87020242B3C407BDD2230D6D72EC0EA961DE21F2E3C40454B1E4FCBCF2EC055DCB8C5FC2C3C407D957CEC2ED02EC00E30F31DFC283C40768C2B2E8ED22EC07BA01518B2263C40336E6AA0F9D42EC022C66B5ED5253C405019FF3EE3DA2EC0E012807F4A253C402D077AA86DDB2EC0289CDD5A26233C40B2B96A9E23DA2EC099B9C0E5B1223C4027A1F48590DB2EC0B87361A417213C40010300000001000000B4000000C616821C942030C0240A2DEBFE913C4035B39602D21E30C085D1AC6C1F8E3C4083BF5FCC962030C0138255F5F28B3C400E6ABFB5132130C0357D76C075893C4059501894692030C0BAC0E5B166883C40E76D6C76A42230C0C2FBAA5CA8883C40B94F8E02442530C091EF52EA92853C40E6EB32FCA72730C09180D1E5CD853C40D5CE30B5A52A30C0F0A2AF20CD843C40EE3D5C72DC2D30C0A69BC420B0823C40A1F2AFE5952F30C0A14D0E9F74823C40971E4DF5643230C027F8A6E9B37F3C401938A0A52B3C30C04C512E8D5F7C3C4020ED7F80B53E30C0A14ACD1E68793C4006F4C29D0B3F30C0B169A510C8753C4014EAE923F03F30C02E03CE52B2743C40DEFFC709134230C0ECBE6378EC733C40BABE0F07094530C040170D198F723C40F2EA1C03B24730C05439ED29396F3C4044E048A0C14E30C0F261F6B2ED683C4055DFF945095230C032005471E3663C40EA93DC61135530C0DFE00B93A9663C40F78E1A13625630C0D7DCD1FF72653C40B742588D255C30C0DB6D179AEB603C4004E5B67D8F5E30C0B1F84D61A55A3C4080492A53CC5D30C0AD6EF59CF4563C402FFCE07CEA5C30C0E412471E88543C40680932022A5C30C01EC3633F8B513C40793E03EACD5C30C071732A19004E3C40FF2268CC246230C0E54526E0D7483C40043A9336556330C03F373465A7433C409548A297516830C0753DD175E13B3C40BC5B59A2B36830C0BF47FDF50A3B3C40CA880B40A36830C0F609A018593A3C40EDEF6C8FDE6830C0292504ABEA393C4093718C648F6C30C06F9BA9108F343C40D7D9907F666C30C0B5C5353E93313C4061FD9FC37C6D30C077D844662E303C40BD3AC780EC6D30C07E350708E62C3C40B7D100DE026D30C07A5567B5C02A3C403480B740826E30C0FB1F60ADDA293C40EF1CCA50156F30C00EF8FC3042283C402D5F97E13F6D30C06B28B517D1263C401FF818AC386D30C0AB5AD2510E263C404852D2C3D06E30C09CE1067C7E243C408AE42B81947030C016F9F5436C243C408C153598867130C0C24CDBBFB2223C40BE4EEACBD27230C0B682A62556223C4058E542E55F7330C0C45C52B5DD203C40C7F319506F7630C0F7764B72C01E3C40BA85AE44A07630C0A8E507AEF21C3C4043554CA59F7830C0179D2CB5DE1B3C404243FF04177B30C0FCE25295B6183C401DE736E15E7D30C020B8CA1308173C40A796ADF5457E30C04F04711E4E143C40570A815CE28030C00803CFBD87133C40F451465C008230C0083E062B4E113C40A7CD380D518530C009C4EBFA050F3C40991249F4328630C0790261A7580D3C4029CDE671188830C02A5778978B0C3C409BAC510FD18830C0D0D556EC2F0B3C406808C72C7B8A30C04BE82E89B30A3C4006F69848698A30C047ACC5A700083C40F4FBFECD8B8B30C089EAAD81AD063C40971DE21FB68C30C03622180797063C40137F1475E68E30C05C1B2AC6F9073C40E3344415FE9830C04C55DAE21A073C4051BEA08504A030C021CA17B490043C40D6FECEF6E8A130C0B77BB94F8E023C40FD4E93196FA330C0DFF8DA334B023C40D5EAABAB02A530C0520C906802013C401E6FF25B74A630C0B98E71C5C5013C4091BA9D7DE5A930C0CF6A813D26023C40B0045262D7AA30C00C022B8716013C406666666666AE30C081ECF5EE8FFF3B404485EAE6E2B330C01DE736E15E013C40CA8D226B0DB530C04C50C3B7B0023C40BBD6DEA7AAB430C040DB6AD619073C406211C30E63B630C04E97C5C4E60B3C40AA2B9FE579BC30C0AD889AE8F30D3C40C974E8F4BCBB30C04F029B73F0103C40D66F26A60BBD30C08E91EC116A163C40F0FCA204FDC130C012143FC6DC193C4050C763062AC330C0B3B3E89D0A1C3C407AA9D898D7C530C02D25CB49281D3C404208C89750CD30C05C55F65D11283C40325706D506CF30C01FF30181CE2C3C4019FF3EE3C2D130C0029A081B9E2E3C40A663CE33F6D530C085EB51B81E353C40CC46E7FC14D730C0F9484A7A183A3C401827BEDA51D830C0533F6F2A523D3C40C22FF5F3A6D630C05B28999CDA413C407041B62C5FD730C04E0D349F73433C40A2EC2DE57CD930C0B5FCC0559E443C405470784144DA30C0220038F6EC453C40B98D06F016DC30C0221B48179B463C40374F75C8CDDC30C054724EECA1493C40E4DC26DC2BDF30C0F8FC3042784C3C406E313F3734E130C098141F9F904D3C4015AA9B8BBFE130C0E97FB9162D503C40543A58FFE7E430C065726A6798523C40919DB7B1D9E530C060394206F2543C40388600E0D8E730C0ACE4637781563C402158552FBFEB30C0D0251C7A8B573C40BCCADAA678EC30C043C5387F135A3C40768C2B2E8EEA30C0FBE93F6B7E5C3C404EF04DD367E730C082ACA7565F5D3C4015E63DCE34E530C07BD976DA1A5D3C408D9AAF928FE130C0897D0228465E3C40B2F677B647DF30C0C43E0114235F3C409FC893A46BDE30C044334FAE29603C409CE1067C7EDC30C05376FA415D603C40397B67B455D930C053978C6324633C40681F2BF86DD430C0A3E9EC6470643C40BE1248895DCF30C04D672783A3603C402FA704C424CC30C0800C1D3BA8603C406A34B91803CB30C07022FAB5F55F3C40098B8A389DC430C0C1ADBB79AA5F3C403A1E335019C330C040C1C58A1A603C40E9D66B7A50C030C0A7255646235F3C40D9791B9B1DBD30C0E509849D62613C40F0FD0DDAABBB30C0B954A52DAE613C40060E68E90ABA30C0572250FD83603C40FA5FAE450BB830C04E25034015633C40E25AED612FB430C02975C93846623C4032C85D8429B230C0FDF7E0B54B633C404562821ABEB130C030D80DDB16653C40698B6B7C26AF30C001DC2C5E2C643C400D52F01472AD30C024F1F274AE643C400934D8D479AC30C03E75AC527A663C4061FF756EDAA830C0B073D3669C663C40D7A3703D0AA730C00F63D2DF4B653C409A0AF148BCA430C0A646E867EA653C40E738B709F7A230C051C1E10511653C40105B7A34D59F30C072FA7ABE66653C40410B09185D9A30C0FB73D190F1643C40B7B41A12F79830C05512D90759663C404489963C9E9630C0E78C28ED0D663C40ED66463F1A9230C0AF05BD3786683C40C460FE0A998F30C091D26C1E87693C408066101FD88D30C064B14D2A1A6B3C406D01A1F5F08530C042CF66D5E76A3C409032E202D08030C0F2272A1BD66C3C40618A7269FC7E30C01C9947FE60703C40795BE9B5D97C30C0AB2688BA0F703C406B2C616D8C7930C00A82C7B777713C406E50FBAD9D7830C064E60297C7723C403A24B550327930C0C2137AFD49743C409C6A2DCC427730C0E7C8CA2F83753C40695721E5277530C0E2E7BF07AF753C40BBB9F8DB9E7430C073F4F8BD4D773C4045BDE0D39C7430C03447567E19783C40ACE63922DF7130C040C23060C9793C40BF9D44847F7130C090BDDEFDF17A3C402F151BF33A6E30C0A8716F7EC37C3C409E3F6D54A76B30C0D3BEB9BF7A843C40641F6459306930C057957D5704873C403F0114234B6230C04A0856D5CB8B3C40F3E49A02995D30C0514A0856D58B3C409818CBF44B5830C091442FA3588E3C4019390B7BDA5530C062BF27D6A98E3C40410FB56D185530C08A1F63EE5A923C402810768A555330C0DE3AFF76D9933C40D88349F1F15130C05454FD4AE7933C4076FA415DA45030C0EFE4D3635B923C40B056ED9A904E30C02A1C412AC5923C40C6F99B50884C30C025B37A87DB913C4085EE92382B4A30C05E82531F48923C40D2E0B6B6F04830C065E42CEC69933C4054707841444630C0BE839F3880923C4048C5FF1D514530C0B03C484F91933C40DEFFC709134230C09A40118B18923C40093543AA283E30C05453927538923C404512BD8C623930C0F7E461A1D6903C4074620FED633130C03C122F4FE7923C40A9BEF38B122C30C0516859F78F953C4002F22554702830C0CA1AF5108D963C404354E1CFF02230C0E36E10AD15953C405E82531F482230C0923B6C2233933C40C616821C942030C0240A2DEBFE913C4001030000000100000006000000CEC7B5A1622830C091D10149D8973C40575C1C959B2830C0E71BD13DEB963C4026A77686A92930C0BA4E232D95973C4072C0AE264F2930C0787AA52C43983C40168A743FA72830C0B7F0BC546C983C40CEC7B5A1622830C091D10149D8973C40010300000001000000050000005586713788C230C0D927806264613C407B14AE47E1C230C00CCA349A5C603C40D192C7D3F2C330C03AB01C2103613C401AFB928D07C330C04C18CDCAF6613C405586713788C230C0D927806264613C40010300000001000000440000007EFD101B2C4031C09D499BAA7B343C405AD6FD63213E31C0A4198BA6B3333C40399CF9D51C3C31C0D1402C9B39343C40F9DC09F65F3B31C059DE550F98333C4093A7ACA6EB3531C0F4FBFECD8B333C40537B116DC73431C0E335AFEAAC323C4055F833BC593331C0419AB1683A333C40EA961DE21F3231C042B28009DC323C40EAE923F0872F31C050560C5707303C40946934B9182F31C01878EE3D5C2E3C40C13A8E1F2A2D31C01536035C902D3C405A65A6B4FE2A31C03ECE3461FB2D3C402C280CCA342A31C0FDA36FD2342C3C4086AE44A0FA2731C0A58636001B2C3C4077F700DD972731C081069B3A8F2A3C40CB2E185C732331C05E4C33DDEB283C4073BB97FBE42031C0AB7AF99D26273C40EDB60BCD751E31C089247A19C5263C400A6AF816D61D31C005172B6A30253C4060E97C78961C31C096CD1C925A243C40C8940F41D51C31C0991249F432223C40EF3B86C77E1A31C0E867EA758B203C406F8445459C1A31C07500C45DBD1A3C40960A2AAA7E1931C055C1A8A44E183C400038F6ECB91C31C09A40118B18163C403048FAB48A1E31C0BF2A172AFF123C4055BE6724422331C0D1950854FF103C40D576137CD32431C0C898BB96900F3C40A06EA0C03B2531C0054F2157EA0D3C4031EF71A6092731C00BB5A679C70D3C4090BDDEFDF12A31C0E6AE25E4830A3C401EFE9AAC512B31C09FCC3FFA26093C408AADA069892D31C05EBEF561BD093C40085A8121AB2F31C0855E7F129F073C4040FCFCF7E03131C0A986FD9E58073C40C7F65AD07B3331C094A0BFD023063C405A2BDA1CE73631C032005471E3063C40596C938AC63A31C0815D4D9EB2063C40EB36A8FDD63E31C02EC72B103D053C40EDD79DEE3C4131C0041F8315A7063C403F8F519E794531C01590F63FC0063C408D2958E36C4631C08DCF64FF3C093C40200C3CF71E4A31C08B1A4CC3F0093C40F4C308E1D14A31C0CDACA580B40B3C40D74FFF59F34B31C0261AA4E0290C3C409DBAF2599E4F31C0D4298F6E840D3C40A857CA32C45131C07D06D49B510F3C40DE736039425231C08195438B6C133C40DBDC989EB05431C0F0332E1C08153C405247C7D5C85631C064AE0CAA0D163C40C2A1B778785731C011E0F42EDE173C4032FFE89B345931C0390CE6AF90193C40F19BC24A055931C051F701486D1E3C40A9177C9A935731C06F9EEA909B213C40465F419AB15831C0E63C635FB2253C4045D7851F9C5731C03BE2900DA4273C40D57954FCDF5531C0D925AAB7062A3C404E9D47C5FF5531C044317903CC2C3C40EDD3F198815231C088F546AD30313C40FA415DA4505231C06E4F90D8EE323C404FB0FF3A375131C0FB75A73B4F343C40AC3B16DBA44E31C01500E31934343C40242BBF0CC64C31C063D4B5F63E353C40056B9C4D474831C0BFD53A7139363C4026C79DD2C14631C054C37E4FAC373C405E143DF0314431C0F92CCF83BB373C40691EC022BF4231C0265646239F373C407EFD101B2C4031C09D499BAA7B343C400103000000010000004B00000030F488D173E731C060ADDA3521D93C40CD1E680586E431C0B727486C77D73C403881E9B46EDB31C0D9EDB3CA4CD53C40C7DADFD91ED931C04F9143C4CDD53C40C9207711A6D431C07D2079E750D63C40CD91955F06CF31C0E78D93C2BCD73C40469561DC0DCA31C0A9674128EFD73C40132D793C2DC731C026AAB706B6D63C4056F2B1BB40C531C004392861A6D13C404ED53DB2B9C231C09EEC66463FCE3C406A4E5E6402C231C00D1D3BA8C4C93C408AAF7614E7C031C04BE9995E62C83C4055302AA913C031C08751103CBEC53C404DD7135D17BE31C03B014D840DC33C40AFB5F7A92ABC31C0FAF19716F5C13C404C6DA983BCBA31C05FD218ADA3BE3C40BF9D44847FB931C0959BA8A5B9BD3C40F60A0BEE07BC31C026E0D74812B83C40CCD3B9A294C031C01633C2DB83B43C40DA01D71533C231C0FD6838656EB23C406C97361C96C231C0CA332F87DDAF3C405471E316F3C331C0075E2D7766AE3C406ADC9BDF30C531C00FD253E410AD3C4029965B5A0DC531C0EB39E97DE3AB3C40D28BDAFD2AC431C0B58993FB1DAA3C4054AC1A84B9C131C0780C8FFD2CA63C408EB0A888D3C131C07250C24CDBA33C4091B75CFDD8C031C03CBF28417FA13C40DECB7D7214C031C0D34ECDE5069F3C400FBA84436FC131C0D190F128959C3C401958C7F143C131C05CCB64389E973C4013EE9579ABC231C07DB08C0DDD943C40F2EEC8586DC231C02BDB87BCE5923C408962F20698C531C0C7D63384638E3C40809BC58B85C931C0E124CD1FD38A3C4035F0A31AF6CB31C03BC8EBC1A4843C407BBC900E0FD131C0B16CE690D47E3C4078D4981073D531C0FF59F3E32F753C400E4A9869FBD731C07FBC57AD4C743C409DF6949C13DB31C0F33B4D66BC753C408C48145AD6DD31C0CD3B4ED191783C40ECDB4944F8DF31C063B323D5777E3C40D89FC4E74EE031C0C9E4D4CE30853C405D34643C4AE131C0A65EB7088C893C40310A82C7B7E331C01233FB3C468D3C40C364AA6054E631C000A8E2C62D923C40249C16BCE8E731C02BDB87BCE5923C40BFD2F9F02CE931C0884A2366F6953C4057EC2FBB27EB31C0EB8B84B69C973C40473B6EF8DDEC31C0F2D077B7B2983C40B13385CE6BEC31C09E3F6D54A79B3C403B527DE717ED31C0FEEF880AD59D3C40C68A1A4CC3F031C0D97BF1457BA43C40AC1C5A643BF331C071766B990CA73C4018265305A3F631C0E15E99B7EAAA3C40CC46E7FC14F731C0075E2D7766AE3C406DFDF49F35F731C0BADA8AFD65AF3C403A747ADE8DF931C0C425C79DD2B53C40EFC517EDF1FA31C09C6F44F7ACB73C404E42E90B21FB31C0D522A298BCB93C40CC9A58E02BFE31C08A90BA9D7DBD3C40FCFD62B6640132C0F88BD99255C13C40C1FEEBDCB40132C0833463D174C63C4089F02F82C60032C081ED60C43EC93C40F1B8A81611FD31C03E26529ACDCB3C40D6AA5D13D2FA31C00C74ED0BE8CD3C408FC2F5285CF731C0F12BD67091D33C4006668522DDF331C039B5334C6DD53C40AB251DE560F231C048A7AE7C96D73C403A5B40683DF031C0ACCABE2B82D73C402992AF0452EE31C08B19E1ED41D83C405793A7ACA6EB31C0C8EA56CF49DB3C40FE7BF0DAA5E931C033FE7DC685DB3C40B30A9B012EE831C053E9279CDDDA3C4030F488D173E731C060ADDA3521D93C4001030000000100000033000000A3B1F677B6E731C0C85EEFFE78D73B40BDC804FC1AE531C04A287D21E4D43B40E82D1EDE73E431C0E1F1ED5D83D23B404EB340BB43E231C0D462F030EDCF3B4077F4BF5C8BE231C0FFB0A54753CD3B4004ADC090D5E531C068791EDC9DC93B40AC39403047E731C037894160E5C83B408F183DB7D0E931C02AAC545051C53B403813D38558E931C094BE1072DEC33B40EDEF6C8FDEEC31C02577D84466BE3B401096B1A19BED31C0B14D2A1A6BBB3B404371C79BFCEE31C0B309302C7FBA3B4002F1BA7EC1F231C0853E58C686BA3B4037C30DF8FCF431C00B62A06B5FB83B4019390B7BDAF531C035CF11F92EB13B400B2593533BF731C006499F56D1AF3B40F7C77BD5CAF831C0C3BCC79926AC3B4044F7AC6BB4F831C027BD6F7CEDA53B40577A6D3656FA31C0D26EF4311FA43B40FB3E1C2444FD31C0CB2E185C73A33B40FF23D3A1D3FF31C02A0307B474A53B403F1C2444F90232C01C98DC28B2A63B400CCC0A45BA0732C064744012F6AD3B40EA76F695070D32C075ADBD4F55B13B4073F4F8BD4D1F32C085798F334DB43B409E40D829562532C0E564E25641B43B40FB0626378A2832C0234910AE80B63B4054573ECBF32832C0EB1D6E8786B93B401A355F251F2732C0D49E927362BB3B405551BCCADA2632C0D388997D1EBF3B407F8461C0922732C0E65DF58079C03B40B7B585E7A52632C0F660527C7CC23B404419AA622A2132C047FFCBB568C53B408B506C054D1F32C0882AFC19DEC43B40AE9E93DE371E32C0E10CFE7E31C33B40CBA2B08BA21B32C08FA9BBB20BC23B40BDFDB968C81432C011C64FE3DEC03B40FA0967B7961132C0DCF29194F4C03B403CDC0E0D8B0932C0A47213B534C33B40AD33BE2F2E0532C09B560A815CC63B405F44DB31750332C0E65DF58079C83B40BDC282FB01FF31C06B6281AFE8CA3B40FA9CBB5D2FFD31C0E3344415FECC3B406E8AC745B5FC31C0650113B875CF3B40D2C6116BF1FD31C06C06B8205BD23B40C11DA8531EF931C0BCCCB051D6D33B405A47551344F531C012A1116C5CD73B40919BE1067CF231C09C8713984ED73B4017299485AFEF31C08753E6E61BD93B409F20B1DD3DEC31C0DEE4B7E864D93B40A3B1F677B6E731C0C85EEFFE78D73B40	31	t	2023-12-09	\N	2
\.


--
-- Data for Name: parcela; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.parcela (gid, cod_parcela, cod_parcela_ayto, desc_parcela, id_manzana, geom, ref_plano_catas, ref_parcela_catas, ind_parcela_inte, tipo_parcela, superficie_parc, superficie_bajo_ras, superficie_sobre_ras, superficie_cubierta, cobertura, ref_catastral, clase_inmueble, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: provincia; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.provincia (gid, cod_provincia, desc_provincia, id_comunidad_autonoma, geom, ind_muni_codif, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_vial_municipio; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.rel_vial_municipio (gid, id_vial, id_municipio, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_vial_tramo; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.rel_vial_tramo (gid, id_vial, id_tramo, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_zona_manzana; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.rel_zona_manzana (gid, id_zona, id_manzana, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_zona_parcela; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.rel_zona_parcela (gid, id_zona, id_parcela, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_zona_tramo; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.rel_zona_tramo (gid, id_zona, id_tramo, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: toponimo; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.toponimo (gid, cod_toponimo, desc_toponimo, id_municipio, geom, tipo_toponimo, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: tramo; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.tramo (gid, cod_tramo, desc_tramo, desc_tramo_corto, siglas_acronimo, tipo_tramo, tipo_acceso, codigo_fonetico, geom, cod_acceso_inicial, cod_acceso_final, sentido, num_tramo, manzana_catastral, tipo_calzada, tipo_clase, tipo_estado_fisico, valor_firme, longitud, num_carriles, fuente_datos, orden, tipo_situacion, tipo_vehiculo, tipo_titular, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: vial; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.vial (gid, cod_vial, desc_vial, desc_vial_corto, siglas_acronimo, tipo_vial, codigo_fonetico, geom, ind_denom_hist, ind_sinonimo, fecha_aprob, nombre_ofic_aprob, observaciones, num_inic_par, dup_num_inic_par, num_fin_par, dup_num_fin_par, num_inic_impar, dup_num_inic_impar, num_fin_impar, dup_num_fin_impar, vial_entrada, vial_salida, sentido, longitud, fecha_rotulacion, fuente_datos, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: zona; Type: TABLE DATA; Schema: bd_territorios; Owner: postgres
--

COPY bd_territorios.zona (gid, id_div_territorial, cod_zona_ter, desc_zona_ter, id_zona_padre, superficie, superficie_comp, fecha_alta_zona_pad, fecha_inser_zona_hij, fecha_inser_tram_rel, cod_postal_zona, copiado_desde, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: cat_valor_estado; Type: TABLE DATA; Schema: cat_global; Owner: postgres
--

COPY cat_global.cat_valor_estado (gid, codigo, desc_estado, alta_db, baja_db, ind_vigente) FROM stdin;
\.


--
-- Data for Name: cat_valor_fuente; Type: TABLE DATA; Schema: cat_global; Owner: postgres
--

COPY cat_global.cat_valor_fuente (gid, desc_fuente, alta_db, baja_db, codigo, estado, ind_vigente) FROM stdin;
3	Instituto geográfico nacional	2023-11-06	\N	1	2	t
4	Dirección general de catastro	2023-11-06	\N	2	2	t
5	Inventario de la red de carreteras de fomento	2023-11-06	\N	3	2	t
6	Instituto nacional de estadística	2023-11-06	\N	4	2	t
7	Correos	2023-11-06	\N	5	2	t
8	Aragón	2023-11-06	\N	6	2	t
9	Andalucía	2023-11-06	\N	7	2	t
10	Canarias	2023-11-06	\N	8	2	t
11	Castilla la Mancha	2023-11-06	\N	9	2	t
12	Castilla y León	2023-11-06	\N	10	2	t
13	Cataluña	2023-11-06	\N	11	2	t
14	Ciudad de Ceuta	2023-11-06	\N	12	2	t
15	Comunidad floral de nav	2023-11-06	\N	13	2	t
16	Comunidad de Madrid	2023-11-06	\N	14	2	t
17	Comunidad Valenciana	2023-11-06	\N	15	2	t
18	Extremadura	2023-11-06	\N	16	2	t
19	Galicia	2023-11-06	\N	17	2	t
20	Islas Baleares	2023-11-06	\N	18	2	t
21	La Rioja	2023-11-06	\N	19	2	t
22	Ciudad de Melilla	2023-11-06	\N	20	2	t
23	Principado de Asturias	2023-11-06	\N	21	2	t
24	Región de Murcia	2023-11-06	\N	22	2	t
25	País Vasco	2023-11-06	\N	23	2	t
26	UNECE	2023-11-06	\N	24	2	t
27	DGT	2023-11-06	\N	25	2	t
28	ADIF	2023-11-06	\N	26	2	t
29	Puertos del Estado	2023-11-06	\N	27	2	t
30	ENAIRE	2023-11-06	\N	28	2	t
31	Eurostat	2023-12-04	\N	31	2	t
32	Agencia Tributaria	2023-12-13	\N	30	2	t
\.


--
-- Data for Name: cat_idioma; Type: TABLE DATA; Schema: cat_terceros; Owner: postgres
--

COPY cat_terceros.cat_idioma (gid, codigo, descripcion, cod_pais, idioma_part_bdc, ind_vigente, alta_db, baja_db, estado) FROM stdin;
17	af	Afrikáans	\N	\N	t	2023-12-18	\N	2
18	sq	Albanés	\N	\N	t	2023-12-18	\N	2
19	am	Amárico	\N	\N	t	2023-12-18	\N	2
20	ar	Árabe	\N	\N	t	2023-12-18	\N	2
21	hy	Armenio	\N	\N	t	2023-12-18	\N	2
22	az	Azerí	\N	\N	t	2023-12-18	\N	2
23	eu	Vasco	\N	\N	t	2023-12-18	\N	2
24	be	Bielorruso	\N	\N	t	2023-12-18	\N	2
25	bn	Bengalí	\N	\N	t	2023-12-18	\N	2
26	bs	Bosnio	\N	\N	t	2023-12-18	\N	2
27	bg	Búlgaro	\N	\N	t	2023-12-18	\N	2
28	ca	Catalán	\N	\N	t	2023-12-18	\N	2
29	ce	,Cebuano	\N	\N	t	2023-12-18	\N	2
30	zh	Chino	\N	\N	t	2023-12-18	\N	2
31	zh	CN,Chino (simplificado)	\N	\N	t	2023-12-18	\N	2
32	zh	TW,Chino (tradicional)	\N	\N	t	2023-12-18	\N	2
33	co	Corso	\N	\N	t	2023-12-18	\N	2
34	hr	Croata	\N	\N	t	2023-12-18	\N	2
35	cs	Checo	\N	\N	t	2023-12-18	\N	2
36	da	Danés	\N	\N	t	2023-12-18	\N	2
37	nl	Holandés	\N	\N	t	2023-12-18	\N	2
38	en	Inglés	\N	\N	t	2023-12-18	\N	2
39	eo	Esperanto	\N	\N	t	2023-12-18	\N	2
40	et	Estonio	\N	\N	t	2023-12-18	\N	2
41	fi	Finlandés	\N	\N	t	2023-12-18	\N	2
42	fr	Francés	\N	\N	t	2023-12-18	\N	2
43	fy	Frisón	\N	\N	t	2023-12-18	\N	2
44	gl	Gallego	\N	\N	t	2023-12-18	\N	2
45	ka	Georgiano	\N	\N	t	2023-12-18	\N	2
46	de	Alemán	\N	\N	t	2023-12-18	\N	2
47	el	Griego	\N	\N	t	2023-12-18	\N	2
48	gu	Guyaratí	\N	\N	t	2023-12-18	\N	2
49	ht	Criollo haitiano	\N	\N	t	2023-12-18	\N	2
50	ha	Hausa	\N	\N	t	2023-12-18	\N	2
51	ha	,Hawaiano	\N	\N	t	2023-12-18	\N	2
52	he	Hebreo	\N	\N	t	2023-12-18	\N	2
53	iw	Hebreo	\N	\N	t	2023-12-18	\N	2
54	hi	Hindi	\N	\N	t	2023-12-18	\N	2
55	hm	,Hmong	\N	\N	t	2023-12-18	\N	2
56	hu	Húngaro	\N	\N	t	2023-12-18	\N	2
57	is	Islandés	\N	\N	t	2023-12-18	\N	2
58	ig	Igbo	\N	\N	t	2023-12-18	\N	2
59	id	Indonesio	\N	\N	t	2023-12-18	\N	2
60	ga	Irlandés	\N	\N	t	2023-12-18	\N	2
61	it	Italiano	\N	\N	t	2023-12-18	\N	2
62	ja	Japonés	\N	\N	t	2023-12-18	\N	2
63	jv	Javanés	\N	\N	t	2023-12-18	\N	2
64	kn	Canarés	\N	\N	t	2023-12-18	\N	2
65	kk	Kazajo	\N	\N	t	2023-12-18	\N	2
66	km	Jemer	\N	\N	t	2023-12-18	\N	2
67	rw	Kiñaruanda	\N	\N	t	2023-12-18	\N	2
68	ko	Coreano	\N	\N	t	2023-12-18	\N	2
69	ku	Kurdo	\N	\N	t	2023-12-18	\N	2
70	ky	Kirguís	\N	\N	t	2023-12-18	\N	2
71	lo	Laosiano	\N	\N	t	2023-12-18	\N	2
72	la	Latín	\N	\N	t	2023-12-18	\N	2
73	lv	Letón	\N	\N	t	2023-12-18	\N	2
74	lt	Lituano	\N	\N	t	2023-12-18	\N	2
75	lb	Luxemburgués	\N	\N	t	2023-12-18	\N	2
76	mk	Macedonio	\N	\N	t	2023-12-18	\N	2
77	mg	Malgache	\N	\N	t	2023-12-18	\N	2
78	ms	Malayo	\N	\N	t	2023-12-18	\N	2
79	ml	Malabar	\N	\N	t	2023-12-18	\N	2
80	mt	Maltés	\N	\N	t	2023-12-18	\N	2
81	mi	Maorí	\N	\N	t	2023-12-18	\N	2
82	mr	Maratí	\N	\N	t	2023-12-18	\N	2
83	mn	Mongol	\N	\N	t	2023-12-18	\N	2
84	my	Birmano	\N	\N	t	2023-12-18	\N	2
85	ne	Nepalí	\N	\N	t	2023-12-18	\N	2
86	no	Noruego	\N	\N	t	2023-12-18	\N	2
87	ny	Nyanja (chichewa)	\N	\N	t	2023-12-18	\N	2
88	or	Odia (oriya)	\N	\N	t	2023-12-18	\N	2
89	ps	Pastún	\N	\N	t	2023-12-18	\N	2
90	fa	Persa	\N	\N	t	2023-12-18	\N	2
91	pl	Polaco	\N	\N	t	2023-12-18	\N	2
92	pt	Portugués (Portugal y Brasil)	\N	\N	t	2023-12-18	\N	2
93	pa	Panyabí	\N	\N	t	2023-12-18	\N	2
94	ro	Rumano	\N	\N	t	2023-12-18	\N	2
95	ru	Ruso	\N	\N	t	2023-12-18	\N	2
96	sm	Samoano	\N	\N	t	2023-12-18	\N	2
97	gd	Gaélico escocés	\N	\N	t	2023-12-18	\N	2
98	sr	Serbio	\N	\N	t	2023-12-18	\N	2
99	st	Sesoto	\N	\N	t	2023-12-18	\N	2
100	sn	Shona	\N	\N	t	2023-12-18	\N	2
101	sd	Sindhi	\N	\N	t	2023-12-18	\N	2
102	si	Cingalés	\N	\N	t	2023-12-18	\N	2
103	sk	Eslovaco	\N	\N	t	2023-12-18	\N	2
104	sl	Esloveno	\N	\N	t	2023-12-18	\N	2
105	so	Somalí	\N	\N	t	2023-12-18	\N	2
106	es	Español	\N	\N	t	2023-12-18	\N	2
107	su	Sundanés	\N	\N	t	2023-12-18	\N	2
108	sw	Suajili	\N	\N	t	2023-12-18	\N	2
109	sv	Sueco	\N	\N	t	2023-12-18	\N	2
110	tl	Tagalo (filipino)	\N	\N	t	2023-12-18	\N	2
111	tg	Tayiko	\N	\N	t	2023-12-18	\N	2
112	ta	Tamil	\N	\N	t	2023-12-18	\N	2
113	tt	Tártaro	\N	\N	t	2023-12-18	\N	2
114	te	Telugú	\N	\N	t	2023-12-18	\N	2
115	th	Tailandés	\N	\N	t	2023-12-18	\N	2
116	tr	Turco	\N	\N	t	2023-12-18	\N	2
117	tk	Turcomano	\N	\N	t	2023-12-18	\N	2
118	uk	Ucraniano	\N	\N	t	2023-12-18	\N	2
119	ur	Urdu	\N	\N	t	2023-12-18	\N	2
120	ug	Uigur	\N	\N	t	2023-12-18	\N	2
121	uz	Uzbeko	\N	\N	t	2023-12-18	\N	2
122	vi	Vietnamita	\N	\N	t	2023-12-18	\N	2
123	cy	Galés	\N	\N	t	2023-12-18	\N	2
124	xh	Xhosa	\N	\N	t	2023-12-18	\N	2
125	yi	Yiddish	\N	\N	t	2023-12-18	\N	2
126	yo	Yoruba	\N	\N	t	2023-12-18	\N	2
127	zu	Zulú	\N	\N	t	2023-12-18	\N	2
\.


--
-- Data for Name: cat_profesion; Type: TABLE DATA; Schema: cat_terceros; Owner: postgres
--

COPY cat_terceros.cat_profesion (gid, codigo, descripcion, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Médico	t	2023-12-18	\N	2
2	2	Abogado	t	2023-12-18	\N	2
3	3	Ingeniero	t	2023-12-18	\N	2
4	4	Profesor	t	2023-12-18	\N	2
5	5	Arquitecto	t	2023-12-18	\N	2
6	6	Diseñador gráfico	t	2023-12-18	\N	2
7	7	Cocinero/Chef	t	2023-12-18	\N	2
8	8	Científico	t	2023-12-18	\N	2
9	9	Artista	t	2023-12-18	\N	2
10	10	Programador informático	t	2023-12-18	\N	2
11	11	Contador	t	2023-12-18	\N	2
12	12	Periodista	t	2023-12-18	\N	2
13	13	Agricultor	t	2023-12-18	\N	2
14	14	Veterinario	t	2023-12-18	\N	2
15	15	Psicólogo	t	2023-12-18	\N	2
\.


--
-- Data for Name: cat_status; Type: TABLE DATA; Schema: cat_terceros; Owner: postgres
--

COPY cat_terceros.cat_status (gid, codigo, descripcion, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	ACT	Activo	t	2023-12-18	\N	2
2	INA	Inactivo	t	2023-12-18	\N	2
3	ESP	En espera	t	2023-12-18	\N	2
4	BLO	Bloqueado	t	2023-12-18	\N	2
5	VER	Verificado	t	2023-12-18	\N	2
6	NVE	No verificado	t	2023-12-18	\N	2
7	CAN	Cancelado	t	2023-12-18	\N	2
8	PEN	Pendiente	t	2023-12-18	\N	2
\.


--
-- Data for Name: cat_tipo_canal_not; Type: TABLE DATA; Schema: cat_terceros; Owner: postgres
--

COPY cat_terceros.cat_tipo_canal_not (gid, codigo, descripcion, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	EMAIL	Correo Electrónico	t	2023-12-18	\N	2
2	TELFIJO	Teléfono Fijo	t	2023-12-18	\N	2
3	TELMOVIL	Teléfono Móvil/Celular	t	2023-12-18	\N	2
4	FAX	Fax	t	2023-12-18	\N	2
5	CHAT	Chat en Línea	t	2023-12-18	\N	2
6	REDES	Redes Sociales	t	2023-12-18	\N	2
7	SMS	SMS/Mensajería de Texto	t	2023-12-18	\N	2
8	CORREOPOSTAL	Correo Postal	t	2023-12-18	\N	2
9	APP_MENSAJERIA	Aplicaciones de Mensajería	t	2023-12-18	\N	2
10	VOIP	Comunicación por Voz sobre IP (VoIP)	t	2023-12-18	\N	2
11	NOTIFICACION_PUSH	Notificaciones Push	t	2023-12-18	\N	2
12	CANAL_INTERNO	Canal de Comunicación Interno	t	2023-12-18	\N	2
13	FORMULARIO_WEB	Formularios en Sitio Web	t	2023-12-18	\N	2
\.


--
-- Data for Name: cat_tipo_direccion; Type: TABLE DATA; Schema: cat_terceros; Owner: postgres
--

COPY cat_terceros.cat_tipo_direccion (gid, codigo, descripcion, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	RES	Residencial	t	2023-12-18	\N	2
2	LAB	Laboral	t	2023-12-18	\N	2
3	POS	Postal	t	2023-12-18	\N	2
4	TEM	Temporal	t	2023-12-18	\N	2
5	FAC	Facturación	t	2023-12-18	\N	2
6	ENT	Entrega	t	2023-12-18	\N	2
7	PRI	Principal	t	2023-12-18	\N	2
8	SEC	Secundaria	t	2023-12-18	\N	2
\.


--
-- Data for Name: cat_tipo_genero; Type: TABLE DATA; Schema: cat_terceros; Owner: postgres
--

COPY cat_terceros.cat_tipo_genero (gid, codigo, descripcion, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	M	Masculino	t	2023-12-18	\N	2
2	F	Femenino	t	2023-12-18	\N	2
3	NB	No binario	t	2023-12-18	\N	2
4	O	Otro	t	2023-12-18	\N	2
\.


--
-- Data for Name: cat_tipo_nif; Type: TABLE DATA; Schema: cat_terceros; Owner: postgres
--

COPY cat_terceros.cat_tipo_nif (gid, codigo, descripcion, ind_vigente, alta_db, baja_db, estado) FROM stdin;
16	NIE	Número de identificación Extranjera	t	2023-12-21	\N	2
17	DNI	Numero Nacional de Identidad	t	2023-12-21	\N	2
18	CIF	Código de Identificación Fiscal	t	2023-12-21	\N	2
19	PAS	Pasaporte	t	2023-12-21	\N	2
20	OTR	Otro	t	2023-12-21	\N	2
\.


--
-- Data for Name: cat_tipo_reg_matrimonial; Type: TABLE DATA; Schema: cat_terceros; Owner: postgres
--

COPY cat_terceros.cat_tipo_reg_matrimonial (gid, codigo, descripcion, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	GAN	Sociedad de gananciales	t	2023-12-18	\N	2
2	SEP	Separación de bienes	t	2023-12-18	\N	2
3	COM	Comunidad de bienes	t	2023-12-18	\N	2
\.


--
-- Data for Name: cat_tipo_relacion; Type: TABLE DATA; Schema: cat_terceros; Owner: postgres
--

COPY cat_terceros.cat_tipo_relacion (gid, codigo, descripcion, ind_grupo, ind_representante, ind_conyugal, cod_regimen_matrimonial, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: cat_tipo_tercero; Type: TABLE DATA; Schema: cat_terceros; Owner: postgres
--

COPY cat_terceros.cat_tipo_tercero (gid, codigo, descripcion, ind_vigente, alta_db, baja_db, estado) FROM stdin;
3	NAT	Persona Natural	t	2023-12-21	\N	2
4	JUD	Persona Jurídica	t	2023-12-21	\N	2
5	EMP	Empresa	t	2023-12-21	\N	2
6	ORG	Organización	t	2023-12-21	\N	2
7	IND	Individuo	t	2023-12-21	\N	2
8	ENT	Entidad Legal	t	2023-12-21	\N	2
\.


--
-- Data for Name: cat_tipo_calzada; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_tipo_calzada (gid, codigo, desc_codigo, fuente, alta_db, baja_db, ind_vigente, estado) FROM stdin;
1	1	Única	\N	2023-11-06	\N	t	2
2	2	Duplicada	\N	2023-11-06	\N	t	2
6	6	string 6	0	2023-11-13	2023-11-13	t	2
\.


--
-- Data for Name: cat_tipo_colectivo; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_tipo_colectivo (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	12	Institución Religiosa	\N	t	2023-11-06	\N	2
2	11	Otra institución	\N	t	2023-11-06	\N	2
3	10	Albergue	\N	t	2023-11-06	\N	2
4	9	institución discapacitados\n	\N	t	2023-11-06	\N	2
5	8	Asilo	\N	t	2023-11-06	\N	2
6	7	Hospital Larga Distancia\n	\N	t	2023-11-06	\N	2
7	6	Hospital Psiquiátrico	\N	t	2023-11-06	\N	2
8	5	Hospital General	\N	t	2023-11-06	\N	2
9	4	Internado	\N	t	2023-11-06	\N	2
10	3	Residencia Trabajadores	\N	t	2023-11-06	\N	2
11	2	Colegio Mayor	\N	t	2023-11-06	\N	2
12	1	Hotel	\N	t	2023-11-06	\N	2
13	13	Militar	\N	t	2023-11-06	\N	2
14	14	Penitenciaria	\N	t	2023-11-06	\N	2
15	15	Residencial	\N	t	2023-11-06	\N	2
16	16	Otro	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_tipo_div_territorial; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_tipo_div_territorial (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: cat_tipo_indicador_amb; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_tipo_indicador_amb (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Calidad del aire	\N	t	2023-06-11	\N	2
2	2	Calidad del agua	\N	t	2023-06-11	\N	2
3	3	Biodiversidad	\N	t	2023-06-11	\N	2
4	4	Emisiones de gases de efecto invernadero (GEI)	\N	t	2023-06-11	\N	2
5	5	Eficiencia energética	\N	t	2023-06-11	\N	2
6	6	Gestión de residuos	\N	t	2023-06-11	\N	2
7	7	Uso de suelo y cambio de cobertura vegetal	\N	t	2023-06-11	\N	2
8	8	Uso de suelo y cambio de cobertura vegetalConsumo de recursos naturales	\N	t	2023-06-11	\N	2
\.


--
-- Data for Name: cat_tipo_inmueble; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_tipo_inmueble (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Vivienda familiar	\N	t	2023-11-06	\N	2
2	2	Vivienda colectiva	\N	t	2023-11-06	\N	2
3	3	Alojamiento	\N	t	2023-11-06	\N	2
4	4	Local	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_tipo_portal; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_tipo_portal (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Puerta Principal	\N	t	2023-11-06	\N	2
2	2	Puerta de Servicio	\N	t	2023-11-06	\N	2
3	3	Entrada de garaje	\N	t	2023-11-06	\N	2
4	4	Entrada trasera	\N	t	2023-11-06	\N	2
5	5	Entrada lateral	\N	t	2023-11-06	\N	2
6	6	Otros	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_tipo_portal_pk; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_tipo_portal_pk (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	5	Otro	\N	t	2023-11-06	\N	2
2	4	Pasillo	\N	t	2023-11-06	\N	2
3	3	Rampa	\N	t	2023-11-06	\N	2
4	2	Ascensor	\N	t	2023-11-06	\N	2
5	1	Escalera	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_acceso; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_acceso (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Libre	\N	t	2023-11-06	\N	2
2	2	Peaje	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_acceso_pk; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_acceso_pk (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
3	1	Escalera	\N	t	2023-11-06	\N	2
4	2	Ascensor	\N	t	2023-11-06	\N	2
5	3	Rampa	\N	t	2023-11-06	\N	2
6	4	Pasillo	\N	t	2023-11-06	\N	2
7	5	Otro	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_clase; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_clase (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1001	Autopista	\N	t	2023-11-06	\N	2
2	1002	Autovia	\N	t	2023-11-06	\N	2
3	1003	Carretera Convencional	\N	t	2023-11-06	\N	2
4	1004	Carril Bici	\N	t	2023-11-06	\N	2
5	2000	Urbano	\N	t	2023-11-06	\N	2
6	3001	Camino	\N	t	2023-11-06	\N	2
7	3002	Senda	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_estado; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_estado (gid, codigo, desc_estado, ind_vigente, alta_db, baja_db) FROM stdin;
1	3	Provisional	t	2023-11-06	\N
2	2	Vigente	t	2023-11-06	\N
3	1	Histórico	t	2023-11-06	\N
\.


--
-- Data for Name: cat_valor_estado_fisico; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_estado_fisico (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	En uso	\N	t	2023-11-06	\N	2
2	2	En construcción	\N	t	2023-11-06	\N	2
3	3	Fuera de Servicio	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_firme; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_firme (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Pavimentado	\N	t	2023-11-06	\N	2
2	2	Tratamiento Superficial	\N	t	2023-11-06	\N	2
3	3	Sin tratamiento superficial	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_fuente; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_fuente (gid, desc_fuente, ind_vigente, alta_db, baja_db, codigo, estado) FROM stdin;
3	Instituto geográfico nacional	t	2023-11-06	\N	1	2
4	Dirección general de catastro	t	2023-11-06	\N	2	2
5	Inventario de la red de carreteras de fomento	t	2023-11-06	\N	3	2
6	Instituto nacional de estadística	t	2023-11-06	\N	4	2
7	Correos	t	2023-11-06	\N	5	2
8	Aragón	t	2023-11-06	\N	6	2
9	Andalucía	t	2023-11-06	\N	7	2
10	Canarias	t	2023-11-06	\N	8	2
11	Castilla la Mancha	t	2023-11-06	\N	9	2
12	Castilla y León	t	2023-11-06	\N	10	2
13	Cataluña	t	2023-11-06	\N	11	2
14	Ciudad de Ceuta	t	2023-11-06	\N	12	2
15	Comunidad floral de nav	t	2023-11-06	\N	13	2
16	Comunidad de Madrid	t	2023-11-06	\N	14	2
17	Comunidad Valenciana	t	2023-11-06	\N	15	2
18	Extremadura	t	2023-11-06	\N	16	2
19	Galicia	t	2023-11-06	\N	17	2
20	Islas Baleares	t	2023-11-06	\N	18	2
21	La Rioja	t	2023-11-06	\N	19	2
22	Ciudad de Melilla	t	2023-11-06	\N	20	2
23	Principado de Asturias	t	2023-11-06	\N	21	2
24	Región de Murcia	t	2023-11-06	\N	22	2
25	País Vasco	t	2023-11-06	\N	23	2
26	UNECE	t	2023-11-06	\N	24	2
27	DGT	t	2023-11-06	\N	25	2
28	ADIF	t	2023-11-06	\N	26	2
29	Puertos del Estado	t	2023-11-06	\N	27	2
30	ENAIRE	t	2023-11-06	\N	28	2
31	Eurostat	t	2023-12-09	\N	31	2
\.


--
-- Data for Name: cat_valor_orden; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_orden (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	0	Principal	\N	t	2023-11-06	\N	2
2	1	Primer Orden	\N	t	2023-11-06	\N	2
3	2	Segundo Orden	\N	t	2023-11-06	\N	2
4	3	Tercer Orden	\N	t	2023-11-06	\N	2
5	-1	No Catalogada	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_sentido; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_sentido (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Único	\N	t	2023-11-06	\N	2
2	2	Doble	\N	t	2023-11-06	\N	2
3	3	Reversible	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_sentido_pk; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_sentido_pk (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	2	Decreciente	\N	t	2023-11-06	\N	2
2	1	Cresciente	\N	t	2023-11-06	\N	2
3	3	Ambos sentidos	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_situacion; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_situacion (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	En superficie	\N	t	2023-11-06	\N	2
2	2	Subterráneo	\N	t	2023-11-06	\N	2
3	3	Elevado	\N	t	2023-11-06	\N	2
4	4	En vado	\N	t	2023-11-06	\N	2
5	5	En transbordador	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_tipo_linea_aux; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_tipo_linea_aux (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Carreteras	\N	t	2023-06-11	\N	2
2	2	Caminos	\N	t	2023-06-11	\N	2
3	3	Rios y Arroyos	\N	t	2023-06-11	\N	2
4	4	Vias de Tren	\N	t	2023-06-11	\N	2
5	5	Límites Administrativos	\N	t	2023-06-11	\N	2
6	6	Límites de Parcelas o Propiedades	\N	t	2023-06-11	\N	2
7	7	Límites de zonas urbanas o rurales	\N	t	2023-06-11	\N	2
8	8	Otras características geográficas	\N	t	2023-06-11	\N	2
\.


--
-- Data for Name: cat_valor_tipo_toponimo; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_tipo_toponimo (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
50	2	Plaza	\N	t	2023-11-06	\N	2
51	3	Avenida	\N	t	2023-11-06	\N	2
52	4	Camino	\N	t	2023-11-06	\N	2
53	5	Paseo	\N	t	2023-11-06	\N	2
54	6	Parque	\N	t	2023-11-06	\N	2
55	7	Montaña	\N	t	2023-11-06	\N	2
56	8	Río	\N	t	2023-11-06	\N	2
57	9	Lago	\N	t	2023-11-06	\N	2
58	10	Playa	\N	t	2023-11-06	\N	2
59	11	Bosque	\N	t	2023-11-06	\N	2
60	12	Edificio	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_tipo_tramo; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_tipo_tramo (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Troncal	\N	t	2023-11-06	\N	2
2	2	Enlace	\N	t	2023-11-06	\N	2
3	3	Via de servicio	\N	t	2023-11-06	\N	2
4	4	Rotonda	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_tipo_vehic; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_tipo_vehic (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Solo vehiculo	\N	t	2023-11-06	\N	2
2	10	Solo bicicleta	\N	t	2023-11-06	\N	2
3	100	Solo peaton	\N	t	2023-11-06	\N	2
4	110	Peaton y bicicleta	\N	t	2023-11-06	\N	2
5	111	Peatón, bicicleta y vehículo	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: cat_valor_tipo_vial; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_tipo_vial (gid, codigo, desc_codigo, fuente, alta_db, baja_db, estado, ind_vigente) FROM stdin;
4	1001	Carretera	\N	2023-06-11	\N	2	t
5	1004	Vial Bici	\N	2023-06-11	\N	2	t
6	3000	Vial Camino	\N	2023-06-11	\N	2	t
7	4001	Gran recorrido	\N	2023-06-11	\N	2	t
8	4002	Pequeño recorrido	\N	2023-06-11	\N	2	t
9	4003	Camino de Santiago	\N	2023-06-11	\N	2	t
10	4004	Red Ten T Basica	\N	2023-06-11	\N	2	t
11	4005	Red Ten T Global	\N	2023-06-11	\N	2	t
12	4006	Itinerario Europeo	\N	2023-06-11	\N	2	t
\.


--
-- Data for Name: cat_valor_titular; Type: TABLE DATA; Schema: cat_territorios; Owner: postgres
--

COPY cat_territorios.cat_valor_titular (gid, codigo, desc_codigo, fuente, ind_vigente, alta_db, baja_db, estado) FROM stdin;
1	1	Administración general del estado	\N	t	2023-11-06	\N	2
2	2	Comunidad Autónoma	\N	t	2023-11-06	\N	2
3	3	Diputación Provincial	\N	t	2023-11-06	\N	2
4	4	Cabildo o Consell Insular	\N	t	2023-11-06	\N	2
5	5	Ayuntamiento	\N	t	2023-11-06	\N	2
6	6	Confederación hidrográfica	\N	t	2023-11-06	\N	2
7	7	Autoridad portuaria	\N	t	2023-11-06	\N	2
8	8	Militar	\N	t	2023-11-06	\N	2
9	9	Empresa minera	\N	t	2023-11-06	\N	2
10	99	Otros	\N	t	2023-11-06	\N	2
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: us_gaz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: us_lex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: us_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_rules (id, rule, is_custom) FROM stdin;
\.


--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.empresa (gid, cod_empresa, nombre_empresa, siglas_empresa, direccion, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: grupo; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.grupo (gid, cod_grupo, nombre_grupo, siglas_grupo, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: nivel_organizacion; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.nivel_organizacion (gid, cod_organizacion, id_organi_padre, nombre_organizacion, siglas_organizacion, observaciones, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: permiso; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.permiso (gid, cod_permiso, nombre_permiso, descripcion, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: puesto; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.puesto (gid, cod_puesto, nombre_puesto, siglas_puesto, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_empre_grupo; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.rel_empre_grupo (gid, id_empresa, id_grupo, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_grupo_rol; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.rel_grupo_rol (gid, id_grupo, id_rol, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_orga_grupo; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.rel_orga_grupo (gid, id_organizacion, id_grupo, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_rol_permiso; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.rel_rol_permiso (gid, id_rol, id_permiso, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_usuario_grupo; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.rel_usuario_grupo (gid, id_usuario, id_grupo, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rel_usuario_rol; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.rel_usuario_rol (gid, id_usuario, id_rol, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.rol (gid, cod_rol, nombre_rol, descripcion, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Data for Name: usuario_empleado; Type: TABLE DATA; Schema: topology_earth; Owner: postgres
--

COPY topology_earth.usuario_empleado (gid, cod_usuario_empleado, nombre_usuario_empleado, descripcion, id_puesto, id_nivel_organizacion, id_ext_tercero, id_ext_direccion, ind_vigente, fuente_datos, alta_db, baja_db, estado) FROM stdin;
\.


--
-- Name: empresa_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.empresa_gid_seq', 13, true);


--
-- Name: grupo_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.grupo_gid_seq', 1, false);


--
-- Name: organizacion_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.organizacion_gid_seq', 1, false);


--
-- Name: permiso_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.permiso_gid_seq', 1, false);


--
-- Name: puesto_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.puesto_gid_seq', 1, false);


--
-- Name: rel_empre_grupo_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.rel_empre_grupo_gid_seq', 1, false);


--
-- Name: rel_grupo_rol_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.rel_grupo_rol_gid_seq', 1, false);


--
-- Name: rel_rol_permiso_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.rel_rol_permiso_gid_seq', 1, false);


--
-- Name: rel_usuario_grupo_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.rel_usuario_grupo_gid_seq', 1, false);


--
-- Name: rel_usuario_rol_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.rel_usuario_rol_gid_seq', 1, false);


--
-- Name: rol_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.rol_gid_seq', 1, false);


--
-- Name: usuario_empleado_gid_seq; Type: SEQUENCE SET; Schema: bd_empleados; Owner: postgres
--

SELECT pg_catalog.setval('bd_empleados.usuario_empleado_gid_seq', 1, false);


--
-- Name: area_interes_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.area_interes_gid_seq', 10, true);


--
-- Name: banco_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.banco_gid_seq', 14, true);


--
-- Name: canal_notif_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.canal_notif_gid_seq', 1, false);


--
-- Name: cuenta_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.cuenta_gid_seq', 2, true);


--
-- Name: grupo_area_interes_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.grupo_area_interes_gid_seq', 11, true);


--
-- Name: idioma_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.idioma_gid_seq', 1, false);


--
-- Name: oficina_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.oficina_gid_seq', 2, true);


--
-- Name: pais_nacimiento_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.pais_nacimiento_gid_seq', 1, false);


--
-- Name: pais_tercero_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.pais_tercero_gid_seq', 1, false);


--
-- Name: profesion_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.profesion_gid_seq', 1, false);


--
-- Name: rel_cuenta_banco_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.rel_cuenta_banco_gid_seq', 1, false);


--
-- Name: rel_cuenta_oficina_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.rel_cuenta_oficina_gid_seq', 1, false);


--
-- Name: rel_oficina_banco_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.rel_oficina_banco_gid_seq', 1, false);


--
-- Name: rel_tercero_area_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.rel_tercero_area_gid_seq', 1, false);


--
-- Name: rel_tercero_cuenta_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.rel_tercero_cuenta_gid_seq', 1, false);


--
-- Name: rel_tercero_direccion_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.rel_tercero_direccion_gid_seq', 1, false);


--
-- Name: rel_tercero_tercero_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.rel_tercero_tercero_gid_seq', 1, false);


--
-- Name: status_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.status_gid_seq', 1, false);


--
-- Name: tercero_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.tercero_gid_seq', 4, true);


--
-- Name: tipo_canal_notif_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.tipo_canal_notif_gid_seq', 1, false);


--
-- Name: tipo_direccion_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.tipo_direccion_gid_seq', 1, false);


--
-- Name: tipo_genero_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.tipo_genero_gid_seq', 1, false);


--
-- Name: tipo_nif_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.tipo_nif_gid_seq', 1, false);


--
-- Name: tipo_reg_matrimonial_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.tipo_reg_matrimonial_gid_seq', 1, false);


--
-- Name: tipo_relacion_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.tipo_relacion_gid_seq', 1, false);


--
-- Name: tipo_tercero_gid_seq; Type: SEQUENCE SET; Schema: bd_terceros; Owner: postgres
--

SELECT pg_catalog.setval('bd_terceros.tipo_tercero_gid_seq', 1, false);


--
-- Name: acceso_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.acceso_gid_seq', 1, false);


--
-- Name: codigo_postal_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.codigo_postal_gid_seq', 1, false);


--
-- Name: comunidad_autonoma_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.comunidad_autonoma_gid_seq', 1, false);


--
-- Name: construccion_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.construccion_gid_seq', 1, false);


--
-- Name: direccion_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.direccion_gid_seq', 1, true);


--
-- Name: div_territorial_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.div_territorial_gid_seq', 1, false);


--
-- Name: entidad_colectiva_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.entidad_colectiva_gid_seq', 1, false);


--
-- Name: entidad_singular_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.entidad_singular_gid_seq', 1, false);


--
-- Name: indicador_ambiental_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.indicador_ambiental_gid_seq', 1, false);


--
-- Name: linea_auxiliar_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.linea_auxiliar_gid_seq', 1, false);


--
-- Name: manzana_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.manzana_gid_seq', 1, false);


--
-- Name: municipio_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.municipio_gid_seq', 1, false);


--
-- Name: nucleo_diseminado_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.nucleo_diseminado_gid_seq', 1, false);


--
-- Name: pais_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.pais_gid_seq', 12, true);


--
-- Name: parcela_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.parcela_gid_seq', 1, false);


--
-- Name: provincia_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.provincia_gid_seq', 1, false);


--
-- Name: rel_vial_municipio_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.rel_vial_municipio_gid_seq', 1, false);


--
-- Name: rel_vial_tramo_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.rel_vial_tramo_gid_seq', 1, false);


--
-- Name: rel_zona_manzana_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.rel_zona_manzana_gid_seq', 1, false);


--
-- Name: rel_zona_parcela_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.rel_zona_parcela_gid_seq', 1, false);


--
-- Name: rel_zona_tramo_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.rel_zona_tramo_gid_seq', 1, false);


--
-- Name: toponimo_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.toponimo_gid_seq', 1, false);


--
-- Name: tramo_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.tramo_gid_seq', 1, false);


--
-- Name: vial_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.vial_gid_seq', 1, false);


--
-- Name: zona_gid_seq; Type: SEQUENCE SET; Schema: bd_territorios; Owner: postgres
--

SELECT pg_catalog.setval('bd_territorios.zona_gid_seq', 1, false);


--
-- Name: estado_gid_seq; Type: SEQUENCE SET; Schema: cat_global; Owner: postgres
--

SELECT pg_catalog.setval('cat_global.estado_gid_seq', 1, false);


--
-- Name: fuente_gid_seq; Type: SEQUENCE SET; Schema: cat_global; Owner: postgres
--

SELECT pg_catalog.setval('cat_global.fuente_gid_seq', 1, false);


--
-- Name: idioma_gid_seq; Type: SEQUENCE SET; Schema: cat_terceros; Owner: postgres
--

SELECT pg_catalog.setval('cat_terceros.idioma_gid_seq', 127, true);


--
-- Name: profesion_gid_seq; Type: SEQUENCE SET; Schema: cat_terceros; Owner: postgres
--

SELECT pg_catalog.setval('cat_terceros.profesion_gid_seq', 15, true);


--
-- Name: status_gid_seq; Type: SEQUENCE SET; Schema: cat_terceros; Owner: postgres
--

SELECT pg_catalog.setval('cat_terceros.status_gid_seq', 8, true);


--
-- Name: tipo_canal_notif_gid_seq; Type: SEQUENCE SET; Schema: cat_terceros; Owner: postgres
--

SELECT pg_catalog.setval('cat_terceros.tipo_canal_notif_gid_seq', 13, true);


--
-- Name: tipo_direccion_gid_seq; Type: SEQUENCE SET; Schema: cat_terceros; Owner: postgres
--

SELECT pg_catalog.setval('cat_terceros.tipo_direccion_gid_seq', 9, true);


--
-- Name: tipo_genero_gid_seq; Type: SEQUENCE SET; Schema: cat_terceros; Owner: postgres
--

SELECT pg_catalog.setval('cat_terceros.tipo_genero_gid_seq', 5, true);


--
-- Name: tipo_nif_gid_seq; Type: SEQUENCE SET; Schema: cat_terceros; Owner: postgres
--

SELECT pg_catalog.setval('cat_terceros.tipo_nif_gid_seq', 26, true);


--
-- Name: tipo_reg_matrimonial_gid_seq; Type: SEQUENCE SET; Schema: cat_terceros; Owner: postgres
--

SELECT pg_catalog.setval('cat_terceros.tipo_reg_matrimonial_gid_seq', 4, true);


--
-- Name: tipo_relacion_gid_seq; Type: SEQUENCE SET; Schema: cat_terceros; Owner: postgres
--

SELECT pg_catalog.setval('cat_terceros.tipo_relacion_gid_seq', 1, false);


--
-- Name: tipo_tercero_gid_seq; Type: SEQUENCE SET; Schema: cat_terceros; Owner: postgres
--

SELECT pg_catalog.setval('cat_terceros.tipo_tercero_gid_seq', 11, true);


--
-- Name: estado_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.estado_gid_seq', 3, true);


--
-- Name: fuente_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.fuente_gid_seq', 30, true);


--
-- Name: indicador_ambiental_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.indicador_ambiental_gid_seq', 8, true);


--
-- Name: tipo_colectivo_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.tipo_colectivo_gid_seq', 16, true);


--
-- Name: tipo_div_ter_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.tipo_div_ter_seq', 1, false);


--
-- Name: tipo_inmueble_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.tipo_inmueble_gid_seq', 4, true);


--
-- Name: tipocalzada_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.tipocalzada_gid_seq', 4, true);


--
-- Name: tipoportal_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.tipoportal_gid_seq', 6, true);


--
-- Name: tipoportal_pk_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.tipoportal_pk_gid_seq', 5, true);


--
-- Name: valor_firme_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valor_firme_gid_seq', 3, true);


--
-- Name: valoracceso_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valoracceso_gid_seq', 7, true);


--
-- Name: valoracceso_pk_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valoracceso_pk_gid_seq', 1, false);


--
-- Name: valorclase_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valorclase_gid_seq', 7, true);


--
-- Name: valorestadofisico_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valorestadofisico_gid_seq', 3, true);


--
-- Name: valorlineaaux_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valorlineaaux_gid_seq', 8, true);


--
-- Name: valororden_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valororden_gid_seq', 5, true);


--
-- Name: valorsentido_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valorsentido_gid_seq', 3, true);


--
-- Name: valorsentidopk_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valorsentidopk_gid_seq', 3, true);


--
-- Name: valorsituacion_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valorsituacion_gid_seq', 5, true);


--
-- Name: valortipotramo_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valortipotramo_gid_seq', 4, true);


--
-- Name: valortipovehic_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valortipovehic_gid_seq', 5, true);


--
-- Name: valortipovial_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valortipovial_gid_seq', 61, true);


--
-- Name: valortitular_gid_seq; Type: SEQUENCE SET; Schema: cat_territorios; Owner: postgres
--

SELECT pg_catalog.setval('cat_territorios.valortitular_gid_seq', 10, true);


--
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: postgres
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- Name: empresa_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.empresa_gid_seq', 1, false);


--
-- Name: grupo_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.grupo_gid_seq', 1, false);


--
-- Name: organizacion_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.organizacion_gid_seq', 1, false);


--
-- Name: permiso_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.permiso_gid_seq', 1, false);


--
-- Name: puesto_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.puesto_gid_seq', 1, false);


--
-- Name: rel_empre_grupo_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.rel_empre_grupo_gid_seq', 1, false);


--
-- Name: rel_grupo_rol_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.rel_grupo_rol_gid_seq', 1, false);


--
-- Name: rel_rol_permiso_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.rel_rol_permiso_gid_seq', 1, false);


--
-- Name: rel_usuario_grupo_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.rel_usuario_grupo_gid_seq', 1, false);


--
-- Name: rel_usuario_rol_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.rel_usuario_rol_gid_seq', 1, false);


--
-- Name: rol_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.rol_gid_seq', 1, false);


--
-- Name: usuario_empleado_gid_seq; Type: SEQUENCE SET; Schema: topology_earth; Owner: postgres
--

SELECT pg_catalog.setval('topology_earth.usuario_empleado_gid_seq', 1, false);


--
-- Name: grupo fk_cod_grupo_unico; Type: CONSTRAINT; Schema: bd_empleados; Owner: postgres
--

ALTER TABLE ONLY bd_empleados.grupo
    ADD CONSTRAINT fk_cod_grupo_unico UNIQUE (cod_grupo);


--
-- Name: nivel_organizacion fk_cod_organizacion_unico; Type: CONSTRAINT; Schema: bd_empleados; Owner: postgres
--

ALTER TABLE ONLY bd_empleados.nivel_organizacion
    ADD CONSTRAINT fk_cod_organizacion_unico UNIQUE (cod_organizacion);


--
-- Name: permiso fk_cod_permiso_unico; Type: CONSTRAINT; Schema: bd_empleados; Owner: postgres
--

ALTER TABLE ONLY bd_empleados.permiso
    ADD CONSTRAINT fk_cod_permiso_unico UNIQUE (cod_permiso);


--
-- Name: puesto fk_cod_puesto_unico; Type: CONSTRAINT; Schema: bd_empleados; Owner: postgres
--

ALTER TABLE ONLY bd_empleados.puesto
    ADD CONSTRAINT fk_cod_puesto_unico UNIQUE (cod_puesto);


--
-- Name: rol fk_cod_rol_unico; Type: CONSTRAINT; Schema: bd_empleados; Owner: postgres
--

ALTER TABLE ONLY bd_empleados.rol
    ADD CONSTRAINT fk_cod_rol_unico UNIQUE (cod_rol);


--
-- Name: usuario_empleado fk_cod_usuario_unico; Type: CONSTRAINT; Schema: bd_empleados; Owner: postgres
--

ALTER TABLE ONLY bd_empleados.usuario_empleado
    ADD CONSTRAINT fk_cod_usuario_unico UNIQUE (cod_usuario_empleado);


--
-- Name: empresa fk_codigo_empresa_unico; Type: CONSTRAINT; Schema: bd_empleados; Owner: postgres
--

ALTER TABLE ONLY bd_empleados.empresa
    ADD CONSTRAINT fk_codigo_empresa_unico UNIQUE (cod_empresa);


--
-- Name: rel_grupo_rol pk_rel_grupo_rol; Type: CONSTRAINT; Schema: bd_empleados; Owner: postgres
--

ALTER TABLE ONLY bd_empleados.rel_grupo_rol
    ADD CONSTRAINT pk_rel_grupo_rol PRIMARY KEY (id_grupo, id_rol);


--
-- Name: tercero acceso_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.tercero
    ADD CONSTRAINT acceso_pkey PRIMARY KEY (gid);


--
-- Name: area_interes area_interes_tercero_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.area_interes
    ADD CONSTRAINT area_interes_tercero_pkey PRIMARY KEY (gid);


--
-- Name: banco banco_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (gid);


--
-- Name: canal_notificacion canal_notif_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.canal_notificacion
    ADD CONSTRAINT canal_notif_pkey PRIMARY KEY (gid);


--
-- Name: cuenta cuenta_pkey1; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.cuenta
    ADD CONSTRAINT cuenta_pkey1 PRIMARY KEY (gid);


--
-- Name: direcc_tercero_no_geo direccion_geo_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT direccion_geo_pkey PRIMARY KEY (gid);


--
-- Name: area_interes fk_area_interes_codigo; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.area_interes
    ADD CONSTRAINT fk_area_interes_codigo UNIQUE (codigo);


--
-- Name: area_interes fk_area_interes_descripcion; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.area_interes
    ADD CONSTRAINT fk_area_interes_descripcion UNIQUE (descripcion);


--
-- Name: banco fk_banco_descripcion; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.banco
    ADD CONSTRAINT fk_banco_descripcion UNIQUE (nombre_banco);


--
-- Name: banco fk_codigo_unico_banco; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.banco
    ADD CONSTRAINT fk_codigo_unico_banco UNIQUE (codigo);


--
-- Name: grupo_area_interes fk_codigo_unico_grupo_are_interes; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.grupo_area_interes
    ADD CONSTRAINT fk_codigo_unico_grupo_are_interes UNIQUE (codigo);


--
-- Name: grupo_area_interes grupo_area_interes_tercer_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.grupo_area_interes
    ADD CONSTRAINT grupo_area_interes_tercer_pkey PRIMARY KEY (gid);


--
-- Name: oficina oficinas_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.oficina
    ADD CONSTRAINT oficinas_pkey PRIMARY KEY (gid);


--
-- Name: pais_tercero pais_tercero_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.pais_tercero
    ADD CONSTRAINT pais_tercero_pkey PRIMARY KEY (gid);


--
-- Name: rel_tercero_area rel_tercero_area_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_area
    ADD CONSTRAINT rel_tercero_area_pkey PRIMARY KEY (gid);


--
-- Name: rel_tercero_cuenta rel_tercero_cuenta_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_cuenta
    ADD CONSTRAINT rel_tercero_cuenta_pkey PRIMARY KEY (gid);


--
-- Name: rel_tercero_direccion rel_tercero_direccion_pkey; Type: CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_direccion
    ADD CONSTRAINT rel_tercero_direccion_pkey PRIMARY KEY (gid);


--
-- Name: acceso acceso_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT acceso_pkey PRIMARY KEY (gid);


--
-- Name: codigo_postal codigo_postal_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.codigo_postal
    ADD CONSTRAINT codigo_postal_pkey PRIMARY KEY (gid);


--
-- Name: comunidad_autonoma comunidad_autonoma_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.comunidad_autonoma
    ADD CONSTRAINT comunidad_autonoma_pkey PRIMARY KEY (gid);


--
-- Name: construccion construccion_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.construccion
    ADD CONSTRAINT construccion_pkey PRIMARY KEY (gid);


--
-- Name: direccion direccion_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (gid);


--
-- Name: entidad_colectiva entidad_colectiva_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.entidad_colectiva
    ADD CONSTRAINT entidad_colectiva_pkey PRIMARY KEY (gid);


--
-- Name: entidad_singular entidad_singular_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.entidad_singular
    ADD CONSTRAINT entidad_singular_pkey PRIMARY KEY (gid);


--
-- Name: pais fk_pais_codigo_unico1; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.pais
    ADD CONSTRAINT fk_pais_codigo_unico1 UNIQUE (cod_pais);


--
-- Name: zona fk_zona_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.zona
    ADD CONSTRAINT fk_zona_pkey PRIMARY KEY (gid);


--
-- Name: indicador_ambiental indicador_ambiental_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.indicador_ambiental
    ADD CONSTRAINT indicador_ambiental_pkey PRIMARY KEY (gid);


--
-- Name: linea_auxiliar linea_auxiliar_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.linea_auxiliar
    ADD CONSTRAINT linea_auxiliar_pkey PRIMARY KEY (gid);


--
-- Name: manzana manzana_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.manzana
    ADD CONSTRAINT manzana_pkey PRIMARY KEY (gid);


--
-- Name: municipio municipio_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (gid);


--
-- Name: nucleo_diseminado nucleo_diseminado_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.nucleo_diseminado
    ADD CONSTRAINT nucleo_diseminado_pkey PRIMARY KEY (gid);


--
-- Name: pais pais_pkey1; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.pais
    ADD CONSTRAINT pais_pkey1 PRIMARY KEY (gid);


--
-- Name: parcela parcela_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.parcela
    ADD CONSTRAINT parcela_pkey PRIMARY KEY (gid);


--
-- Name: provincia provincia_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (gid);


--
-- Name: rel_vial_municipio rel_vial_municipio_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_municipio
    ADD CONSTRAINT rel_vial_municipio_pkey PRIMARY KEY (gid);


--
-- Name: rel_vial_tramo rel_vial_tramo_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_tramo
    ADD CONSTRAINT rel_vial_tramo_pkey PRIMARY KEY (gid);


--
-- Name: rel_zona_manzana rel_zona_manzana_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_manzana
    ADD CONSTRAINT rel_zona_manzana_pkey PRIMARY KEY (gid);


--
-- Name: rel_zona_parcela rel_zona_parcela_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_parcela
    ADD CONSTRAINT rel_zona_parcela_pkey PRIMARY KEY (gid);


--
-- Name: rel_zona_tramo rel_zona_tramo_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_tramo
    ADD CONSTRAINT rel_zona_tramo_pkey PRIMARY KEY (gid);


--
-- Name: toponimo toponimo_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.toponimo
    ADD CONSTRAINT toponimo_pkey PRIMARY KEY (gid);


--
-- Name: tramo tramo_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT tramo_pkey PRIMARY KEY (gid);


--
-- Name: vial vial_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.vial
    ADD CONSTRAINT vial_pkey PRIMARY KEY (gid);


--
-- Name: division_territorial zona_pkey; Type: CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.division_territorial
    ADD CONSTRAINT zona_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_fuente codigo_unico_pk; Type: CONSTRAINT; Schema: cat_global; Owner: postgres
--

ALTER TABLE ONLY cat_global.cat_valor_fuente
    ADD CONSTRAINT codigo_unico_pk UNIQUE (codigo);


--
-- Name: cat_valor_estado codigo_unique; Type: CONSTRAINT; Schema: cat_global; Owner: postgres
--

ALTER TABLE ONLY cat_global.cat_valor_estado
    ADD CONSTRAINT codigo_unique UNIQUE (codigo);


--
-- Name: cat_valor_fuente valorFuente_pkey; Type: CONSTRAINT; Schema: cat_global; Owner: postgres
--

ALTER TABLE ONLY cat_global.cat_valor_fuente
    ADD CONSTRAINT "valorFuente_pkey" PRIMARY KEY (gid);


--
-- Name: cat_valor_estado valorestado_pkey; Type: CONSTRAINT; Schema: cat_global; Owner: postgres
--

ALTER TABLE ONLY cat_global.cat_valor_estado
    ADD CONSTRAINT valorestado_pkey PRIMARY KEY (gid);


--
-- Name: cat_profesion cat_profesion_pkey; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_profesion
    ADD CONSTRAINT cat_profesion_pkey PRIMARY KEY (gid);


--
-- Name: cat_tipo_canal_not cat_tipo_canal_not_pkey; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_canal_not
    ADD CONSTRAINT cat_tipo_canal_not_pkey PRIMARY KEY (gid);


--
-- Name: cat_profesion cod_profesion ; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_profesion
    ADD CONSTRAINT "cod_profesion " UNIQUE (codigo);


--
-- Name: cat_profesion descripcion; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_profesion
    ADD CONSTRAINT descripcion UNIQUE (descripcion);


--
-- Name: cat_idioma fk_cat_idioma; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_idioma
    ADD CONSTRAINT fk_cat_idioma PRIMARY KEY (gid);


--
-- Name: cat_status fk_cat_status; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_status
    ADD CONSTRAINT fk_cat_status PRIMARY KEY (gid);


--
-- Name: cat_tipo_direccion fk_cat_tipo_direccion_pkey; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_direccion
    ADD CONSTRAINT fk_cat_tipo_direccion_pkey PRIMARY KEY (gid);


--
-- Name: cat_tipo_genero fk_cat_tipo_genero_pkey; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_genero
    ADD CONSTRAINT fk_cat_tipo_genero_pkey PRIMARY KEY (gid);


--
-- Name: cat_tipo_nif fk_cat_tipo_nif_pkey; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_nif
    ADD CONSTRAINT fk_cat_tipo_nif_pkey PRIMARY KEY (gid);


--
-- Name: cat_tipo_reg_matrimonial fk_cat_tipo_reg_matrimonial; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_reg_matrimonial
    ADD CONSTRAINT fk_cat_tipo_reg_matrimonial PRIMARY KEY (gid);


--
-- Name: cat_tipo_relacion fk_cat_tipo_relacion; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_relacion
    ADD CONSTRAINT fk_cat_tipo_relacion PRIMARY KEY (gid);


--
-- Name: cat_tipo_tercero fk_cat_tipo_tercero; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_tercero
    ADD CONSTRAINT fk_cat_tipo_tercero PRIMARY KEY (gid);


--
-- Name: cat_tipo_direccion fk_codigo_unico; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_direccion
    ADD CONSTRAINT fk_codigo_unico UNIQUE (codigo);


--
-- Name: cat_tipo_canal_not fk_codigo_unico_canal_not; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_canal_not
    ADD CONSTRAINT fk_codigo_unico_canal_not UNIQUE (codigo);


--
-- Name: cat_tipo_genero fk_codigo_unico_genero; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_genero
    ADD CONSTRAINT fk_codigo_unico_genero UNIQUE (codigo);


--
-- Name: cat_tipo_nif fk_codigo_unico_tipo_nif; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_nif
    ADD CONSTRAINT fk_codigo_unico_tipo_nif UNIQUE (codigo);


--
-- Name: cat_tipo_direccion fk_desc_unico; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_direccion
    ADD CONSTRAINT fk_desc_unico UNIQUE (descripcion);


--
-- Name: cat_tipo_genero fk_desc_unico_genero; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_genero
    ADD CONSTRAINT fk_desc_unico_genero UNIQUE (descripcion);


--
-- Name: cat_tipo_canal_not fk_descr_unico_canal_not; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_canal_not
    ADD CONSTRAINT fk_descr_unico_canal_not UNIQUE (descripcion);


--
-- Name: cat_profesion fk_descripcion_unique; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_profesion
    ADD CONSTRAINT fk_descripcion_unique UNIQUE (descripcion);


--
-- Name: cat_status fk_unique_cat_status; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_status
    ADD CONSTRAINT fk_unique_cat_status UNIQUE (codigo);


--
-- Name: cat_tipo_reg_matrimonial fk_unique_cat_tipo_reg_matrimonial; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_reg_matrimonial
    ADD CONSTRAINT fk_unique_cat_tipo_reg_matrimonial UNIQUE (codigo);


--
-- Name: cat_tipo_relacion fk_unique_cat_tipo_relacion; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_relacion
    ADD CONSTRAINT fk_unique_cat_tipo_relacion UNIQUE (codigo);


--
-- Name: cat_tipo_tercero fk_unique_cat_tipo_tercero; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_tercero
    ADD CONSTRAINT fk_unique_cat_tipo_tercero UNIQUE (codigo);


--
-- Name: cat_tipo_reg_matrimonial fk_unique_desc_cat_tipo_reg_matrimonial; Type: CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_reg_matrimonial
    ADD CONSTRAINT fk_unique_desc_cat_tipo_reg_matrimonial UNIQUE (descripcion);


--
-- Name: cat_valor_tipo_toponimo codigo; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_toponimo
    ADD CONSTRAINT codigo UNIQUE (codigo);


--
-- Name: CONSTRAINT codigo ON cat_valor_tipo_toponimo; Type: COMMENT; Schema: cat_territorios; Owner: postgres
--

COMMENT ON CONSTRAINT codigo ON cat_territorios.cat_valor_tipo_toponimo IS 'codigo debe ser unívoco';


--
-- Name: cat_valor_acceso_pk codigo_acceso_pk; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_acceso_pk
    ADD CONSTRAINT codigo_acceso_pk UNIQUE (codigo);


--
-- Name: CONSTRAINT codigo_acceso_pk ON cat_valor_acceso_pk; Type: COMMENT; Schema: cat_territorios; Owner: postgres
--

COMMENT ON CONSTRAINT codigo_acceso_pk ON cat_territorios.cat_valor_acceso_pk IS 'código debe ser univoco';


--
-- Name: cat_valor_fuente codigo_unico_pk; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_fuente
    ADD CONSTRAINT codigo_unico_pk UNIQUE (codigo);


--
-- Name: cat_valor_acceso codigo_unico_valor; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_acceso
    ADD CONSTRAINT codigo_unico_valor UNIQUE (codigo);


--
-- Name: CONSTRAINT codigo_unico_valor ON cat_valor_acceso; Type: COMMENT; Schema: cat_territorios; Owner: postgres
--

COMMENT ON CONSTRAINT codigo_unico_valor ON cat_territorios.cat_valor_acceso IS 'código debe ser univoco';


--
-- Name: cat_valor_estado codigo_unique; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_estado
    ADD CONSTRAINT codigo_unique UNIQUE (codigo);


--
-- Name: CONSTRAINT codigo_unique ON cat_valor_estado; Type: COMMENT; Schema: cat_territorios; Owner: postgres
--

COMMENT ON CONSTRAINT codigo_unique ON cat_territorios.cat_valor_estado IS 'codigo unico';


--
-- Name: cat_valor_clase codigo_valor_clase; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_clase
    ADD CONSTRAINT codigo_valor_clase UNIQUE (codigo);


--
-- Name: CONSTRAINT codigo_valor_clase ON cat_valor_clase; Type: COMMENT; Schema: cat_territorios; Owner: postgres
--

COMMENT ON CONSTRAINT codigo_valor_clase ON cat_territorios.cat_valor_clase IS 'código debe ser univoco';


--
-- Name: cat_tipo_div_territorial fk_cat_tipo_div_ter; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_div_territorial
    ADD CONSTRAINT fk_cat_tipo_div_ter PRIMARY KEY (gid);


--
-- Name: cat_tipo_div_territorial fk_cat_tipo_div_ter_unique; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_div_territorial
    ADD CONSTRAINT fk_cat_tipo_div_ter_unique UNIQUE (codigo);


--
-- Name: cat_valor_sentido_pk fk_codigo_sentido_pk; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_sentido_pk
    ADD CONSTRAINT fk_codigo_sentido_pk UNIQUE (codigo);


--
-- Name: cat_tipo_colectivo fk_codigo_tipo_colectivo; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_colectivo
    ADD CONSTRAINT fk_codigo_tipo_colectivo UNIQUE (codigo);


--
-- Name: cat_tipo_inmueble fk_codigo_tipo_inmueble; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_inmueble
    ADD CONSTRAINT fk_codigo_tipo_inmueble UNIQUE (codigo);


--
-- Name: cat_tipo_portal fk_codigo_tipo_portal; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_portal
    ADD CONSTRAINT fk_codigo_tipo_portal UNIQUE (codigo);


--
-- Name: cat_tipo_portal_pk fk_codigo_tipo_portal_pk; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_portal_pk
    ADD CONSTRAINT fk_codigo_tipo_portal_pk UNIQUE (codigo);


--
-- Name: cat_tipo_calzada fk_codigo_unico; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_calzada
    ADD CONSTRAINT fk_codigo_unico UNIQUE (codigo);


--
-- Name: cat_valor_estado_fisico fk_codigo_unico_estado_f; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_estado_fisico
    ADD CONSTRAINT fk_codigo_unico_estado_f UNIQUE (codigo);


--
-- Name: cat_valor_tipo_vehic fk_codigo_unico_tipo_vehic; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_vehic
    ADD CONSTRAINT fk_codigo_unico_tipo_vehic UNIQUE (codigo);


--
-- Name: CONSTRAINT fk_codigo_unico_tipo_vehic ON cat_valor_tipo_vehic; Type: COMMENT; Schema: cat_territorios; Owner: postgres
--

COMMENT ON CONSTRAINT fk_codigo_unico_tipo_vehic ON cat_territorios.cat_valor_tipo_vehic IS 'código debe ser univoco';


--
-- Name: cat_valor_firme fk_codigo_valor_firme; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_firme
    ADD CONSTRAINT fk_codigo_valor_firme UNIQUE (codigo);


--
-- Name: cat_valor_orden fk_codigo_valor_orden; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_orden
    ADD CONSTRAINT fk_codigo_valor_orden UNIQUE (codigo);


--
-- Name: cat_valor_sentido fk_codigo_valor_sentido; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_sentido
    ADD CONSTRAINT fk_codigo_valor_sentido UNIQUE (codigo);


--
-- Name: cat_valor_situacion fk_codigo_valor_situacion; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_situacion
    ADD CONSTRAINT fk_codigo_valor_situacion UNIQUE (codigo);


--
-- Name: cat_valor_titular fk_codigo_valor_titular; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_titular
    ADD CONSTRAINT fk_codigo_valor_titular UNIQUE (codigo);


--
-- Name: cat_valor_tipo_tramo fk_tipo_tramo; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_tramo
    ADD CONSTRAINT fk_tipo_tramo UNIQUE (codigo);


--
-- Name: cat_tipo_indicador_amb indicador_ambiental_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_indicador_amb
    ADD CONSTRAINT indicador_ambiental_pkey PRIMARY KEY (gid);


--
-- Name: cat_tipo_indicador_amb pk_unique_codigo; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_indicador_amb
    ADD CONSTRAINT pk_unique_codigo UNIQUE (codigo);


--
-- Name: cat_tipo_colectivo tipo_colectivo_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_colectivo
    ADD CONSTRAINT tipo_colectivo_pkey PRIMARY KEY (gid);


--
-- Name: cat_tipo_inmueble tipoinmueble_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_inmueble
    ADD CONSTRAINT tipoinmueble_pkey PRIMARY KEY (gid);


--
-- Name: cat_tipo_portal tipoportal_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_portal
    ADD CONSTRAINT tipoportal_pkey PRIMARY KEY (gid);


--
-- Name: cat_tipo_portal_pk tipoportalpk_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_portal_pk
    ADD CONSTRAINT tipoportalpk_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_fuente valorFuente_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_fuente
    ADD CONSTRAINT "valorFuente_pkey" PRIMARY KEY (gid);


--
-- Name: cat_valor_acceso valoracceso_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_acceso
    ADD CONSTRAINT valoracceso_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_acceso_pk valoraccesopk_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_acceso_pk
    ADD CONSTRAINT valoraccesopk_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_clase valorclase_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_clase
    ADD CONSTRAINT valorclase_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_estado valorestado_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_estado
    ADD CONSTRAINT valorestado_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_estado_fisico valorestadofisico_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_estado_fisico
    ADD CONSTRAINT valorestadofisico_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_firme valorfirme_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_firme
    ADD CONSTRAINT valorfirme_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_orden valororden_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_orden
    ADD CONSTRAINT valororden_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_sentido valorsentido_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_sentido
    ADD CONSTRAINT valorsentido_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_sentido_pk valorsentidopk_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_sentido_pk
    ADD CONSTRAINT valorsentidopk_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_situacion valorsituacion_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_situacion
    ADD CONSTRAINT valorsituacion_pkey PRIMARY KEY (gid);


--
-- Name: cat_tipo_calzada valortipocalzada_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_tipo_calzada
    ADD CONSTRAINT valortipocalzada_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_tipo_linea_aux valortipolineaaux_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_linea_aux
    ADD CONSTRAINT valortipolineaaux_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_tipo_toponimo valortipotoponimo_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_toponimo
    ADD CONSTRAINT valortipotoponimo_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_tipo_tramo valortipotramo_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_tramo
    ADD CONSTRAINT valortipotramo_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_tipo_vehic valortipovehic_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_vehic
    ADD CONSTRAINT valortipovehic_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_tipo_vial valortipovial_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_tipo_vial
    ADD CONSTRAINT valortipovial_pkey PRIMARY KEY (gid);


--
-- Name: cat_valor_titular valortitular_pkey; Type: CONSTRAINT; Schema: cat_territorios; Owner: postgres
--

ALTER TABLE ONLY cat_territorios.cat_valor_titular
    ADD CONSTRAINT valortitular_pkey PRIMARY KEY (gid);


--
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (gid);


--
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (gid);


--
-- Name: nivel_organizacion organizacion_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.nivel_organizacion
    ADD CONSTRAINT organizacion_pkey PRIMARY KEY (gid);


--
-- Name: permiso permiso_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (gid);


--
-- Name: puesto puesto_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.puesto
    ADD CONSTRAINT puesto_pkey PRIMARY KEY (gid);


--
-- Name: rel_empre_grupo rel_empre_grupo_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_empre_grupo
    ADD CONSTRAINT rel_empre_grupo_pkey PRIMARY KEY (gid);


--
-- Name: rel_grupo_rol rel_grupo_rol_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_grupo_rol
    ADD CONSTRAINT rel_grupo_rol_pkey PRIMARY KEY (gid);


--
-- Name: rel_orga_grupo rel_orga_grupo_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_orga_grupo
    ADD CONSTRAINT rel_orga_grupo_pkey PRIMARY KEY (gid);


--
-- Name: rel_rol_permiso rel_rol_permiso_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_rol_permiso
    ADD CONSTRAINT rel_rol_permiso_pkey PRIMARY KEY (gid);


--
-- Name: rel_usuario_grupo rel_usuario_grupo_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_usuario_grupo
    ADD CONSTRAINT rel_usuario_grupo_pkey PRIMARY KEY (gid);


--
-- Name: rel_usuario_rol rel_usuario_rol_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_usuario_rol
    ADD CONSTRAINT rel_usuario_rol_pkey PRIMARY KEY (gid);


--
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (gid);


--
-- Name: usuario_empleado usuario_empleado_pkey; Type: CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.usuario_empleado
    ADD CONSTRAINT usuario_empleado_pkey PRIMARY KEY (gid);


--
-- Name: cuenta fk_cuenta_oficina1; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.cuenta
    ADD CONSTRAINT fk_cuenta_oficina1 FOREIGN KEY (id_oficina) REFERENCES bd_terceros.oficina(gid);


--
-- Name: direcc_tercero_no_geo fk_dir_direc_sentido; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_dir_direc_sentido FOREIGN KEY (id_valor_sentido) REFERENCES cat_territorios.cat_valor_sentido(gid);


--
-- Name: direcc_tercero_no_geo fk_dir_direc_sentido_pk; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_dir_direc_sentido_pk FOREIGN KEY (id_valor_sentido_pk) REFERENCES cat_territorios.cat_valor_sentido_pk(gid);


--
-- Name: direcc_tercero_no_geo fk_dir_id_nucleo_di; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_dir_id_nucleo_di FOREIGN KEY (id_nucleo_diseminado) REFERENCES bd_territorios.nucleo_diseminado(gid);


--
-- Name: direcc_tercero_no_geo fk_dir_tipo_colec; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_dir_tipo_colec FOREIGN KEY (id_tipo_colectivo) REFERENCES cat_territorios.cat_tipo_colectivo(gid);


--
-- Name: direcc_tercero_no_geo fk_dir_tipo_inmueble; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_dir_tipo_inmueble FOREIGN KEY (id_tipo_inmueble) REFERENCES cat_territorios.cat_tipo_inmueble(gid);


--
-- Name: direcc_tercero_no_geo fk_dir_tipo_portal; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_dir_tipo_portal FOREIGN KEY (id_tipo_portal) REFERENCES cat_territorios.cat_tipo_portal(gid);


--
-- Name: direcc_tercero_no_geo fk_dir_tipo_vial; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_dir_tipo_vial FOREIGN KEY (id_tipo_vial) REFERENCES cat_territorios.cat_valor_tipo_vial(gid);


--
-- Name: direcc_tercero_no_geo fk_dir_tramo; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_dir_tramo FOREIGN KEY (id_tramo) REFERENCES cat_territorios.cat_valor_tipo_tramo(gid);


--
-- Name: direcc_tercero_no_geo fk_direc_acceso; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_direc_acceso FOREIGN KEY (id_tipo_acceso) REFERENCES cat_territorios.cat_valor_acceso(gid);


--
-- Name: area_interes fk_grupo_area_interes; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.area_interes
    ADD CONSTRAINT fk_grupo_area_interes FOREIGN KEY (id_grupo_area_interes) REFERENCES bd_terceros.grupo_area_interes(gid) NOT VALID;


--
-- Name: oficina fk_oficinas_banco_id; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.oficina
    ADD CONSTRAINT fk_oficinas_banco_id FOREIGN KEY (id_banco) REFERENCES bd_terceros.banco(gid);


--
-- Name: tercero fk_pais_nac_tercero; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.tercero
    ADD CONSTRAINT fk_pais_nac_tercero FOREIGN KEY (cod_pais_nac_tercero) REFERENCES bd_territorios.pais(gid);


--
-- Name: tercero fk_pais_tercero; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.tercero
    ADD CONSTRAINT fk_pais_tercero FOREIGN KEY (cod_pais_tercero) REFERENCES bd_territorios.pais(gid);


--
-- Name: rel_tercero_cuenta fk_rel_tercero_cuenta_cuenta; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_cuenta
    ADD CONSTRAINT fk_rel_tercero_cuenta_cuenta FOREIGN KEY (id_cuenta) REFERENCES bd_terceros.cuenta(gid);


--
-- Name: rel_tercero_cuenta fk_rel_tercero_cuenta_tercero; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_cuenta
    ADD CONSTRAINT fk_rel_tercero_cuenta_tercero FOREIGN KEY (id_tercero) REFERENCES bd_terceros.tercero(gid);


--
-- Name: rel_tercero_direccion fk_rel_tercero_direccion_tipo; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_direccion
    ADD CONSTRAINT fk_rel_tercero_direccion_tipo FOREIGN KEY (cod_tipo_direccion) REFERENCES cat_terceros.cat_tipo_direccion(gid);


--
-- Name: rel_tercero_area fk_tercero_area; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_area
    ADD CONSTRAINT fk_tercero_area FOREIGN KEY (id_tercero) REFERENCES bd_terceros.tercero(gid) NOT VALID;


--
-- Name: rel_tercero_area fk_tercero_area_area; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_area
    ADD CONSTRAINT fk_tercero_area_area FOREIGN KEY (id_area_interes) REFERENCES bd_terceros.area_interes(gid) NOT VALID;


--
-- Name: rel_tercero_direccion fk_tercero_dir_geo; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_direccion
    ADD CONSTRAINT fk_tercero_dir_geo FOREIGN KEY (id_direcc_geo) REFERENCES bd_terceros.direcc_tercero_no_geo(gid);


--
-- Name: rel_tercero_direccion fk_tercero_dir_no_geo; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_direccion
    ADD CONSTRAINT fk_tercero_dir_no_geo FOREIGN KEY (id_direcc_no_geo) REFERENCES bd_territorios.direccion(gid);


--
-- Name: rel_tercero_direccion fk_tercero_dir_ter; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.rel_tercero_direccion
    ADD CONSTRAINT fk_tercero_dir_ter FOREIGN KEY (id_tercero) REFERENCES bd_terceros.tercero(gid);


--
-- Name: direcc_tercero_no_geo fk_tercero_dir_tramo; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_tercero_dir_tramo FOREIGN KEY (id_tramo) REFERENCES bd_territorios.tramo(gid) NOT VALID;


--
-- Name: direcc_tercero_no_geo fk_tercero_direccion; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.direcc_tercero_no_geo
    ADD CONSTRAINT fk_tercero_direccion FOREIGN KEY (id_tercero) REFERENCES bd_terceros.tercero(gid);


--
-- Name: tercero fk_tercero_tipo_canal_notif; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.tercero
    ADD CONSTRAINT fk_tercero_tipo_canal_notif FOREIGN KEY (cod_tipo_canal_notif) REFERENCES cat_terceros.cat_tipo_canal_not(gid);


--
-- Name: tercero fk_tercero_tipo_nif; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.tercero
    ADD CONSTRAINT fk_tercero_tipo_nif FOREIGN KEY (cod_tipo_nif) REFERENCES cat_terceros.cat_tipo_nif(gid);


--
-- Name: tercero fk_terceros_genero; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.tercero
    ADD CONSTRAINT fk_terceros_genero FOREIGN KEY (cod_tipo_genero) REFERENCES cat_terceros.cat_tipo_genero(gid);


--
-- Name: tercero fk_terceros_idioma; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.tercero
    ADD CONSTRAINT fk_terceros_idioma FOREIGN KEY (cod_idioma_tercero) REFERENCES cat_terceros.cat_idioma(gid);


--
-- Name: tercero fk_terceros_profesion; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.tercero
    ADD CONSTRAINT fk_terceros_profesion FOREIGN KEY (cod_profesion) REFERENCES cat_terceros.cat_profesion(codigo) NOT VALID;


--
-- Name: tercero fk_terceros_status; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.tercero
    ADD CONSTRAINT fk_terceros_status FOREIGN KEY (cod_status_tercero) REFERENCES cat_terceros.cat_status(gid);


--
-- Name: canal_notificacion fk_tipo_canal_notif; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.canal_notificacion
    ADD CONSTRAINT fk_tipo_canal_notif FOREIGN KEY (cod_tipo_canal_notif) REFERENCES cat_terceros.cat_tipo_canal_not(gid);


--
-- Name: tercero fk_tipo_tercero; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.tercero
    ADD CONSTRAINT fk_tipo_tercero FOREIGN KEY (cod_tipo_tercero) REFERENCES cat_terceros.cat_tipo_tercero(gid);


--
-- Name: canal_notificacion tercero_canal_notif; Type: FK CONSTRAINT; Schema: bd_terceros; Owner: postgres
--

ALTER TABLE ONLY bd_terceros.canal_notificacion
    ADD CONSTRAINT tercero_canal_notif FOREIGN KEY (id_tercero) REFERENCES bd_terceros.tercero(gid);


--
-- Name: acceso fk_acceso_codigo_postal; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_acceso_codigo_postal FOREIGN KEY (id_codigo_postal) REFERENCES bd_territorios.codigo_postal(gid);


--
-- Name: acceso fk_acceso_colectivo; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_acceso_colectivo FOREIGN KEY (tipo_colectivo) REFERENCES cat_territorios.cat_tipo_colectivo(codigo);


--
-- Name: acceso fk_acceso_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_acceso_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: acceso fk_acceso_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_acceso_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: acceso fk_acceso_inmueble; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_acceso_inmueble FOREIGN KEY (tipo_inmueble) REFERENCES cat_territorios.cat_tipo_inmueble(codigo);


--
-- Name: acceso fk_acceso_nucleo_diseminado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_acceso_nucleo_diseminado FOREIGN KEY (id_nucleo_diseminado) REFERENCES bd_territorios.nucleo_diseminado(gid);


--
-- Name: acceso fk_acceso_parcela; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_acceso_parcela FOREIGN KEY (id_parcela) REFERENCES bd_territorios.parcela(gid);


--
-- Name: acceso fk_acceso_sentido_pk; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_acceso_sentido_pk FOREIGN KEY (valor_sentido_pk) REFERENCES cat_territorios.cat_valor_sentido_pk(codigo);


--
-- Name: acceso fk_acceso_tramo; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_acceso_tramo FOREIGN KEY (id_tramo) REFERENCES bd_territorios.tramo(gid);


--
-- Name: codigo_postal fk_codigo_postal_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.codigo_postal
    ADD CONSTRAINT fk_codigo_postal_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: comunidad_autonoma fk_comunidad_autonoma_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.comunidad_autonoma
    ADD CONSTRAINT fk_comunidad_autonoma_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: comunidad_autonoma fk_comunidad_autonoma_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.comunidad_autonoma
    ADD CONSTRAINT fk_comunidad_autonoma_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: comunidad_autonoma fk_comunidad_autonoma_pais; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.comunidad_autonoma
    ADD CONSTRAINT fk_comunidad_autonoma_pais FOREIGN KEY (id_pais) REFERENCES bd_territorios.pais(gid);


--
-- Name: construccion fk_construccion_direccion; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.construccion
    ADD CONSTRAINT fk_construccion_direccion FOREIGN KEY (id_direccion) REFERENCES bd_territorios.direccion(gid);


--
-- Name: construccion fk_construccion_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.construccion
    ADD CONSTRAINT fk_construccion_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: construccion fk_construccion_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.construccion
    ADD CONSTRAINT fk_construccion_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: construccion fk_construccion_parcela; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.construccion
    ADD CONSTRAINT fk_construccion_parcela FOREIGN KEY (id_parcela) REFERENCES bd_territorios.parcela(gid);


--
-- Name: direccion fk_direccion_acceso; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.direccion
    ADD CONSTRAINT fk_direccion_acceso FOREIGN KEY (id_acceso) REFERENCES bd_territorios.acceso(gid);


--
-- Name: direccion fk_direccion_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.direccion
    ADD CONSTRAINT fk_direccion_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: direccion fk_direccion_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.direccion
    ADD CONSTRAINT fk_direccion_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: division_territorial fk_div_ter_padre; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.division_territorial
    ADD CONSTRAINT fk_div_ter_padre FOREIGN KEY (id_div_terr_padre) REFERENCES bd_territorios.division_territorial(gid);


--
-- Name: division_territorial fk_div_ter_tipo; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.division_territorial
    ADD CONSTRAINT fk_div_ter_tipo FOREIGN KEY (cod_tipo_div_terr) REFERENCES cat_territorios.cat_tipo_div_territorial(gid) NOT VALID;


--
-- Name: entidad_colectiva fk_entidad_colectiva_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.entidad_colectiva
    ADD CONSTRAINT fk_entidad_colectiva_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: entidad_colectiva fk_entidad_colectiva_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.entidad_colectiva
    ADD CONSTRAINT fk_entidad_colectiva_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: entidad_colectiva fk_entidad_colectiva_municipio; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.entidad_colectiva
    ADD CONSTRAINT fk_entidad_colectiva_municipio FOREIGN KEY (id_municipio) REFERENCES bd_territorios.municipio(gid);


--
-- Name: entidad_singular fk_entidad_singular_entidad_c; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.entidad_singular
    ADD CONSTRAINT fk_entidad_singular_entidad_c FOREIGN KEY (id_entidad_colectiva) REFERENCES bd_territorios.entidad_colectiva(gid);


--
-- Name: entidad_singular fk_entidad_singular_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.entidad_singular
    ADD CONSTRAINT fk_entidad_singular_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: entidad_singular fk_entidad_singular_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.entidad_singular
    ADD CONSTRAINT fk_entidad_singular_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: indicador_ambiental fk_indicador_ambiental_construccion; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.indicador_ambiental
    ADD CONSTRAINT fk_indicador_ambiental_construccion FOREIGN KEY (id_construccion) REFERENCES bd_territorios.construccion(gid);


--
-- Name: indicador_ambiental fk_indicador_ambiental_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.indicador_ambiental
    ADD CONSTRAINT fk_indicador_ambiental_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: indicador_ambiental fk_indicador_ambiental_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.indicador_ambiental
    ADD CONSTRAINT fk_indicador_ambiental_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: linea_auxiliar fk_linea_auxiliar_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.linea_auxiliar
    ADD CONSTRAINT fk_linea_auxiliar_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: linea_auxiliar fk_linea_auxiliar_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.linea_auxiliar
    ADD CONSTRAINT fk_linea_auxiliar_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: linea_auxiliar fk_linea_auxiliar_municipio; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.linea_auxiliar
    ADD CONSTRAINT fk_linea_auxiliar_municipio FOREIGN KEY (id_municipio) REFERENCES bd_territorios.municipio(gid);


--
-- Name: manzana fk_manzana_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.manzana
    ADD CONSTRAINT fk_manzana_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: manzana fk_manzana_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.manzana
    ADD CONSTRAINT fk_manzana_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: manzana fk_manzana_municipio; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.manzana
    ADD CONSTRAINT fk_manzana_municipio FOREIGN KEY (id_municipio) REFERENCES bd_territorios.municipio(gid);


--
-- Name: municipio fk_municipio_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.municipio
    ADD CONSTRAINT fk_municipio_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: municipio fk_municipio_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.municipio
    ADD CONSTRAINT fk_municipio_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: municipio fk_municipio_provincia; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.municipio
    ADD CONSTRAINT fk_municipio_provincia FOREIGN KEY (id_provincia) REFERENCES bd_territorios.provincia(gid);


--
-- Name: nucleo_diseminado fk_nucleo_diseminado_entidad_s; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.nucleo_diseminado
    ADD CONSTRAINT fk_nucleo_diseminado_entidad_s FOREIGN KEY (id_entidad_singular) REFERENCES bd_territorios.entidad_singular(gid);


--
-- Name: nucleo_diseminado fk_nucleo_diseminado_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.nucleo_diseminado
    ADD CONSTRAINT fk_nucleo_diseminado_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: nucleo_diseminado fk_nucleo_diseminado_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.nucleo_diseminado
    ADD CONSTRAINT fk_nucleo_diseminado_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: pais fk_pais_estad1o; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.pais
    ADD CONSTRAINT fk_pais_estad1o FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: pais fk_pais_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.pais
    ADD CONSTRAINT fk_pais_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: parcela fk_parcela_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.parcela
    ADD CONSTRAINT fk_parcela_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: parcela fk_parcela_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.parcela
    ADD CONSTRAINT fk_parcela_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: parcela fk_parcela_manzana; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.parcela
    ADD CONSTRAINT fk_parcela_manzana FOREIGN KEY (id_manzana) REFERENCES bd_territorios.manzana(gid);


--
-- Name: provincia fk_provincia_com_autonom; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.provincia
    ADD CONSTRAINT fk_provincia_com_autonom FOREIGN KEY (id_comunidad_autonoma) REFERENCES bd_territorios.comunidad_autonoma(gid);


--
-- Name: provincia fk_provincia_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.provincia
    ADD CONSTRAINT fk_provincia_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: provincia fk_provincia_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.provincia
    ADD CONSTRAINT fk_provincia_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: division_territorial fk_rel_div_ter_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.division_territorial
    ADD CONSTRAINT fk_rel_div_ter_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: division_territorial fk_rel_div_ter_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.division_territorial
    ADD CONSTRAINT fk_rel_div_ter_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: rel_vial_municipio fk_rel_vial_municipio_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_municipio
    ADD CONSTRAINT fk_rel_vial_municipio_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: rel_vial_municipio fk_rel_vial_municipio_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_municipio
    ADD CONSTRAINT fk_rel_vial_municipio_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: rel_vial_tramo fk_rel_vial_tramo_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_tramo
    ADD CONSTRAINT fk_rel_vial_tramo_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: rel_vial_tramo fk_rel_vial_tramo_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_tramo
    ADD CONSTRAINT fk_rel_vial_tramo_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: zona fk_rel_zona_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.zona
    ADD CONSTRAINT fk_rel_zona_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: zona fk_rel_zona_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.zona
    ADD CONSTRAINT fk_rel_zona_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: rel_zona_manzana fk_rel_zona_manzana_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_manzana
    ADD CONSTRAINT fk_rel_zona_manzana_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: rel_zona_manzana fk_rel_zona_manzanao_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_manzana
    ADD CONSTRAINT fk_rel_zona_manzanao_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: rel_zona_parcela fk_rel_zona_parcela_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_parcela
    ADD CONSTRAINT fk_rel_zona_parcela_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: rel_zona_parcela fk_rel_zona_parcelao_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_parcela
    ADD CONSTRAINT fk_rel_zona_parcelao_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: rel_zona_tramo fk_rel_zona_tramo_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_tramo
    ADD CONSTRAINT fk_rel_zona_tramo_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: rel_zona_tramo fk_rel_zona_tramo_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_tramo
    ADD CONSTRAINT fk_rel_zona_tramo_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: indicador_ambiental fk_tipo_indicador; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.indicador_ambiental
    ADD CONSTRAINT fk_tipo_indicador FOREIGN KEY (tipo_indicador) REFERENCES cat_territorios.cat_tipo_indicador_amb(codigo);


--
-- Name: toponimo fk_toponimo_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.toponimo
    ADD CONSTRAINT fk_toponimo_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: toponimo fk_toponimo_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.toponimo
    ADD CONSTRAINT fk_toponimo_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: toponimo fk_toponimo_municipio; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.toponimo
    ADD CONSTRAINT fk_toponimo_municipio FOREIGN KEY (id_municipio) REFERENCES bd_territorios.municipio(gid);


--
-- Name: toponimo fk_toponimo_tipo; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.toponimo
    ADD CONSTRAINT fk_toponimo_tipo FOREIGN KEY (tipo_toponimo) REFERENCES cat_territorios.cat_valor_tipo_toponimo(codigo);


--
-- Name: tramo fk_tramo_acceso; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_acceso FOREIGN KEY (tipo_acceso) REFERENCES cat_territorios.cat_valor_acceso(codigo);


--
-- Name: acceso fk_tramo_acceso_tipo_portal; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_tramo_acceso_tipo_portal FOREIGN KEY (tipo_portal) REFERENCES cat_territorios.cat_tipo_portal(codigo);


--
-- Name: acceso fk_tramo_acceso_tipo_portal_pk; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_tramo_acceso_tipo_portal_pk FOREIGN KEY (tipo_portal) REFERENCES cat_territorios.cat_tipo_portal_pk(codigo);


--
-- Name: acceso fk_tramo_acceso_valor_pk; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.acceso
    ADD CONSTRAINT fk_tramo_acceso_valor_pk FOREIGN KEY (tipo_acceso) REFERENCES cat_territorios.cat_valor_acceso_pk(codigo);


--
-- Name: tramo fk_tramo_calzada; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_calzada FOREIGN KEY (tipo_calzada) REFERENCES cat_territorios.cat_tipo_calzada(codigo);


--
-- Name: tramo fk_tramo_clase; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_clase FOREIGN KEY (tipo_clase) REFERENCES cat_territorios.cat_valor_clase(codigo);


--
-- Name: tramo fk_tramo_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: tramo fk_tramo_estado_fisico; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_estado_fisico FOREIGN KEY (tipo_estado_fisico) REFERENCES cat_territorios.cat_valor_estado_fisico(codigo);


--
-- Name: tramo fk_tramo_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: tramo fk_tramo_orden; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_orden FOREIGN KEY (orden) REFERENCES cat_territorios.cat_valor_orden(codigo);


--
-- Name: tramo fk_tramo_sentido; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_sentido FOREIGN KEY (sentido) REFERENCES cat_territorios.cat_valor_sentido(codigo);


--
-- Name: tramo fk_tramo_situacion; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_situacion FOREIGN KEY (tipo_situacion) REFERENCES cat_territorios.cat_valor_situacion(codigo);


--
-- Name: tramo fk_tramo_tipo_tramo; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_tipo_tramo FOREIGN KEY (tipo_tramo) REFERENCES cat_territorios.cat_valor_tipo_tramo(codigo);


--
-- Name: tramo fk_tramo_tipo_vehiculo; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_tipo_vehiculo FOREIGN KEY (tipo_vehiculo) REFERENCES cat_territorios.cat_valor_tipo_vehic(codigo);


--
-- Name: tramo fk_tramo_valor_firme; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_valor_firme FOREIGN KEY (valor_firme) REFERENCES cat_territorios.cat_valor_firme(codigo);


--
-- Name: tramo fk_tramo_valor_titular; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.tramo
    ADD CONSTRAINT fk_tramo_valor_titular FOREIGN KEY (tipo_titular) REFERENCES cat_territorios.cat_valor_titular(codigo);


--
-- Name: vial fk_vial_estado; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.vial
    ADD CONSTRAINT fk_vial_estado FOREIGN KEY (estado) REFERENCES cat_territorios.cat_valor_estado(codigo);


--
-- Name: vial fk_vial_fuente; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.vial
    ADD CONSTRAINT fk_vial_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_territorios.cat_valor_fuente(codigo);


--
-- Name: zona fk_zona_div_terr; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.zona
    ADD CONSTRAINT fk_zona_div_terr FOREIGN KEY (id_div_territorial) REFERENCES bd_territorios.division_territorial(gid);


--
-- Name: division_territorial fk_zona_municipios; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.division_territorial
    ADD CONSTRAINT fk_zona_municipios FOREIGN KEY (id_municipio) REFERENCES bd_territorios.municipio(gid);


--
-- Name: zona fk_zona_padre; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.zona
    ADD CONSTRAINT fk_zona_padre FOREIGN KEY (id_zona_padre) REFERENCES bd_territorios.zona(gid);


--
-- Name: rel_zona_manzana rel_manzana_zona_id_zona_fkey; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_manzana
    ADD CONSTRAINT rel_manzana_zona_id_zona_fkey FOREIGN KEY (id_zona) REFERENCES bd_territorios.zona(gid);


--
-- Name: rel_zona_parcela rel_parcela_zona_id_zona_fkey; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_parcela
    ADD CONSTRAINT rel_parcela_zona_id_zona_fkey FOREIGN KEY (id_zona) REFERENCES bd_territorios.zona(gid);


--
-- Name: rel_vial_municipio rel_vial_municipio_id_municipio_fkey; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_municipio
    ADD CONSTRAINT rel_vial_municipio_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES bd_territorios.municipio(gid);


--
-- Name: rel_vial_municipio rel_vial_municipio_id_vial_fkey; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_municipio
    ADD CONSTRAINT rel_vial_municipio_id_vial_fkey FOREIGN KEY (id_vial) REFERENCES bd_territorios.vial(gid);


--
-- Name: rel_vial_tramo rel_vial_tramo_id_tramo_fkey; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_tramo
    ADD CONSTRAINT rel_vial_tramo_id_tramo_fkey FOREIGN KEY (id_tramo) REFERENCES bd_territorios.tramo(gid);


--
-- Name: rel_vial_tramo rel_vial_tramo_id_vial_fkey; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_vial_tramo
    ADD CONSTRAINT rel_vial_tramo_id_vial_fkey FOREIGN KEY (id_vial) REFERENCES bd_territorios.vial(gid);


--
-- Name: rel_zona_tramo rel_vial_zona_id_zona_fkey; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_tramo
    ADD CONSTRAINT rel_vial_zona_id_zona_fkey FOREIGN KEY (id_zona) REFERENCES bd_territorios.zona(gid);


--
-- Name: rel_zona_manzana rel_zona_manzana_id_tramo_fkey; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_manzana
    ADD CONSTRAINT rel_zona_manzana_id_tramo_fkey FOREIGN KEY (id_manzana) REFERENCES bd_territorios.manzana(gid);


--
-- Name: rel_zona_parcela rel_zona_parcela_id_tramo_fkey; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_parcela
    ADD CONSTRAINT rel_zona_parcela_id_tramo_fkey FOREIGN KEY (id_parcela) REFERENCES bd_territorios.parcela(gid);


--
-- Name: rel_zona_tramo rel_zona_tramo_id_tramo_fkey; Type: FK CONSTRAINT; Schema: bd_territorios; Owner: postgres
--

ALTER TABLE ONLY bd_territorios.rel_zona_tramo
    ADD CONSTRAINT rel_zona_tramo_id_tramo_fkey FOREIGN KEY (id_tramo) REFERENCES bd_territorios.tramo(gid);


--
-- Name: cat_tipo_relacion fk_tipo_relacion_regimen; Type: FK CONSTRAINT; Schema: cat_terceros; Owner: postgres
--

ALTER TABLE ONLY cat_terceros.cat_tipo_relacion
    ADD CONSTRAINT fk_tipo_relacion_regimen FOREIGN KEY (cod_regimen_matrimonial) REFERENCES cat_terceros.cat_tipo_genero(gid);


--
-- Name: empresa fk_empresa_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.empresa
    ADD CONSTRAINT fk_empresa_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: empresa fk_empresa_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.empresa
    ADD CONSTRAINT fk_empresa_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: grupo fk_grupo_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.grupo
    ADD CONSTRAINT fk_grupo_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: grupo fk_grupo_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.grupo
    ADD CONSTRAINT fk_grupo_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: nivel_organizacion fk_organizacion_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.nivel_organizacion
    ADD CONSTRAINT fk_organizacion_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: nivel_organizacion fk_organizacion_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.nivel_organizacion
    ADD CONSTRAINT fk_organizacion_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: nivel_organizacion fk_organizacion_organiz_padre; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.nivel_organizacion
    ADD CONSTRAINT fk_organizacion_organiz_padre FOREIGN KEY (id_organi_padre) REFERENCES topology_earth.nivel_organizacion(gid);


--
-- Name: permiso fk_permiso_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.permiso
    ADD CONSTRAINT fk_permiso_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: permiso fk_permiso_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.permiso
    ADD CONSTRAINT fk_permiso_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: puesto fk_puesto_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.puesto
    ADD CONSTRAINT fk_puesto_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: puesto fk_puesto_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.puesto
    ADD CONSTRAINT fk_puesto_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: rel_empre_grupo fk_rel_empre_grupo_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_empre_grupo
    ADD CONSTRAINT fk_rel_empre_grupo_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: rel_empre_grupo fk_rel_empre_grupo_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_empre_grupo
    ADD CONSTRAINT fk_rel_empre_grupo_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: rel_grupo_rol fk_rel_grupo_rol_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_grupo_rol
    ADD CONSTRAINT fk_rel_grupo_rol_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: rel_grupo_rol fk_rel_grupo_rol_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_grupo_rol
    ADD CONSTRAINT fk_rel_grupo_rol_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: rel_grupo_rol fk_rel_grupo_rol_rol; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_grupo_rol
    ADD CONSTRAINT fk_rel_grupo_rol_rol FOREIGN KEY (id_rol) REFERENCES topology_earth.rol(gid);


--
-- Name: rel_empre_grupo fk_rel_orga_grup_id_empresa; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_empre_grupo
    ADD CONSTRAINT fk_rel_orga_grup_id_empresa FOREIGN KEY (id_empresa) REFERENCES topology_earth.empresa(gid);


--
-- Name: rel_orga_grupo fk_rel_orga_grup_id_grupo; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_orga_grupo
    ADD CONSTRAINT fk_rel_orga_grup_id_grupo FOREIGN KEY (id_grupo) REFERENCES topology_earth.grupo(gid);


--
-- Name: rel_empre_grupo fk_rel_orga_grup_id_grupo; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_empre_grupo
    ADD CONSTRAINT fk_rel_orga_grup_id_grupo FOREIGN KEY (id_grupo) REFERENCES topology_earth.grupo(gid);


--
-- Name: rel_orga_grupo fk_rel_orga_grupo_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_orga_grupo
    ADD CONSTRAINT fk_rel_orga_grupo_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: rel_orga_grupo fk_rel_orga_grupo_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_orga_grupo
    ADD CONSTRAINT fk_rel_orga_grupo_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: rel_rol_permiso fk_rel_rol_permiso_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_rol_permiso
    ADD CONSTRAINT fk_rel_rol_permiso_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: rel_rol_permiso fk_rel_rol_permiso_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_rol_permiso
    ADD CONSTRAINT fk_rel_rol_permiso_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: rel_rol_permiso fk_rel_rol_permiso_id_permiso; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_rol_permiso
    ADD CONSTRAINT fk_rel_rol_permiso_id_permiso FOREIGN KEY (id_permiso) REFERENCES topology_earth.permiso(gid);


--
-- Name: rel_rol_permiso fk_rel_rol_permiso_id_rol; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_rol_permiso
    ADD CONSTRAINT fk_rel_rol_permiso_id_rol FOREIGN KEY (id_rol) REFERENCES topology_earth.rol(gid);


--
-- Name: rel_usuario_grupo fk_rel_usuario_grupo_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_usuario_grupo
    ADD CONSTRAINT fk_rel_usuario_grupo_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: rel_usuario_grupo fk_rel_usuario_grupo_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_usuario_grupo
    ADD CONSTRAINT fk_rel_usuario_grupo_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: rel_usuario_grupo fk_rel_usuario_grupo_id_grupo; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_usuario_grupo
    ADD CONSTRAINT fk_rel_usuario_grupo_id_grupo FOREIGN KEY (id_grupo) REFERENCES topology_earth.grupo(gid);


--
-- Name: rel_usuario_grupo fk_rel_usuario_grupo_id_usuario; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_usuario_grupo
    ADD CONSTRAINT fk_rel_usuario_grupo_id_usuario FOREIGN KEY (id_usuario) REFERENCES topology_earth.usuario_empleado(gid);


--
-- Name: rel_usuario_rol fk_rel_usuario_rol_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_usuario_rol
    ADD CONSTRAINT fk_rel_usuario_rol_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: rel_usuario_rol fk_rel_usuario_rol_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_usuario_rol
    ADD CONSTRAINT fk_rel_usuario_rol_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: rel_usuario_rol fk_rel_usuario_rol_id_rol; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_usuario_rol
    ADD CONSTRAINT fk_rel_usuario_rol_id_rol FOREIGN KEY (id_rol) REFERENCES topology_earth.rol(gid);


--
-- Name: rel_usuario_rol fk_rel_usuario_rol_id_usuario; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rel_usuario_rol
    ADD CONSTRAINT fk_rel_usuario_rol_id_usuario FOREIGN KEY (id_usuario) REFERENCES topology_earth.usuario_empleado(gid);


--
-- Name: rol fk_rol_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rol
    ADD CONSTRAINT fk_rol_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: rol fk_rol_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.rol
    ADD CONSTRAINT fk_rol_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: usuario_empleado fk_usuario_empleado_direccion; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.usuario_empleado
    ADD CONSTRAINT fk_usuario_empleado_direccion FOREIGN KEY (id_ext_direccion) REFERENCES bd_territorios.direccion(gid);


--
-- Name: usuario_empleado fk_usuario_empleado_estado; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.usuario_empleado
    ADD CONSTRAINT fk_usuario_empleado_estado FOREIGN KEY (estado) REFERENCES cat_global.cat_valor_estado(codigo);


--
-- Name: usuario_empleado fk_usuario_empleado_fuente; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.usuario_empleado
    ADD CONSTRAINT fk_usuario_empleado_fuente FOREIGN KEY (fuente_datos) REFERENCES cat_global.cat_valor_fuente(codigo);


--
-- Name: usuario_empleado fk_usuario_empleado_nivel_orga; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.usuario_empleado
    ADD CONSTRAINT fk_usuario_empleado_nivel_orga FOREIGN KEY (id_nivel_organizacion) REFERENCES topology_earth.nivel_organizacion(gid);


--
-- Name: usuario_empleado fk_usuario_empleado_puesto; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.usuario_empleado
    ADD CONSTRAINT fk_usuario_empleado_puesto FOREIGN KEY (id_puesto) REFERENCES topology_earth.puesto(gid);


--
-- Name: usuario_empleado fk_usuario_empleado_tercero; Type: FK CONSTRAINT; Schema: topology_earth; Owner: postgres
--

ALTER TABLE ONLY topology_earth.usuario_empleado
    ADD CONSTRAINT fk_usuario_empleado_tercero FOREIGN KEY (id_ext_tercero) REFERENCES bd_terceros.tercero(gid);


--
-- Name: SCHEMA bd_empleados; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA bd_empleados TO group_ayuntamiento_user;
GRANT USAGE ON SCHEMA bd_empleados TO group_padron_user;
GRANT USAGE ON SCHEMA bd_empleados TO group_spai_user;
GRANT USAGE ON SCHEMA bd_empleados TO group_ayuntamiento_admin;
GRANT USAGE ON SCHEMA bd_empleados TO group_padron_admin;
GRANT USAGE ON SCHEMA bd_empleados TO group_spai_admin;
GRANT USAGE ON SCHEMA bd_empleados TO web_anon;
GRANT USAGE ON SCHEMA bd_empleados TO foo;
GRANT USAGE ON SCHEMA bd_empleados TO ayto_admin;


--
-- Name: SCHEMA bd_terceros; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA bd_terceros TO group_ayuntamiento_user;
GRANT USAGE ON SCHEMA bd_terceros TO group_padron_user;
GRANT USAGE ON SCHEMA bd_terceros TO group_spai_user;
GRANT USAGE ON SCHEMA bd_terceros TO group_ayuntamiento_admin;
GRANT USAGE ON SCHEMA bd_terceros TO group_padron_admin;
GRANT USAGE ON SCHEMA bd_terceros TO group_spai_admin;
GRANT USAGE ON SCHEMA bd_terceros TO web_anon;


--
-- Name: SCHEMA bd_territorios; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA bd_territorios TO group_ayuntamiento_user;
GRANT USAGE ON SCHEMA bd_territorios TO group_padron_user;
GRANT USAGE ON SCHEMA bd_territorios TO group_spai_user;
GRANT USAGE ON SCHEMA bd_territorios TO group_ayuntamiento_admin;
GRANT USAGE ON SCHEMA bd_territorios TO group_padron_admin;
GRANT USAGE ON SCHEMA bd_territorios TO group_spai_admin;
GRANT USAGE ON SCHEMA bd_territorios TO web_anon;
GRANT USAGE ON SCHEMA bd_territorios TO foo;
GRANT USAGE ON SCHEMA bd_territorios TO ayto_admin;


--
-- Name: SCHEMA cat_empleados; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA cat_empleados TO group_ayuntamiento_user;
GRANT USAGE ON SCHEMA cat_empleados TO group_padron_user;
GRANT USAGE ON SCHEMA cat_empleados TO group_spai_user;
GRANT USAGE ON SCHEMA cat_empleados TO group_ayuntamiento_admin;
GRANT USAGE ON SCHEMA cat_empleados TO group_padron_admin;
GRANT USAGE ON SCHEMA cat_empleados TO group_spai_admin;
GRANT USAGE ON SCHEMA cat_empleados TO web_anon;


--
-- Name: SCHEMA cat_global; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA cat_global TO group_ayuntamiento_user;
GRANT USAGE ON SCHEMA cat_global TO group_padron_user;
GRANT USAGE ON SCHEMA cat_global TO group_spai_user;
GRANT USAGE ON SCHEMA cat_global TO group_ayuntamiento_admin;
GRANT USAGE ON SCHEMA cat_global TO group_padron_admin;
GRANT USAGE ON SCHEMA cat_global TO group_spai_admin;
GRANT USAGE ON SCHEMA cat_global TO web_anon;


--
-- Name: SCHEMA cat_terceros; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA cat_terceros TO group_ayuntamiento_user;
GRANT USAGE ON SCHEMA cat_terceros TO group_padron_user;
GRANT USAGE ON SCHEMA cat_terceros TO group_spai_user;
GRANT USAGE ON SCHEMA cat_terceros TO group_ayuntamiento_admin;
GRANT USAGE ON SCHEMA cat_terceros TO group_padron_admin;
GRANT USAGE ON SCHEMA cat_terceros TO group_spai_admin;
GRANT USAGE ON SCHEMA cat_terceros TO web_anon;


--
-- Name: SCHEMA cat_territorios; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA cat_territorios TO group_ayuntamiento_user;
GRANT USAGE ON SCHEMA cat_territorios TO group_padron_user;
GRANT USAGE ON SCHEMA cat_territorios TO group_spai_user;
GRANT USAGE ON SCHEMA cat_territorios TO group_ayuntamiento_admin;
GRANT USAGE ON SCHEMA cat_territorios TO group_padron_admin;
GRANT USAGE ON SCHEMA cat_territorios TO group_spai_admin;
GRANT USAGE ON SCHEMA cat_territorios TO web_anon;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO web_anon;


--
-- Name: SCHEMA topology_earth; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA topology_earth TO group_ayuntamiento_user;
GRANT USAGE ON SCHEMA topology_earth TO group_padron_user;
GRANT USAGE ON SCHEMA topology_earth TO group_spai_user;
GRANT USAGE ON SCHEMA topology_earth TO group_ayuntamiento_admin;
GRANT USAGE ON SCHEMA topology_earth TO group_padron_admin;
GRANT USAGE ON SCHEMA topology_earth TO group_spai_admin;
GRANT USAGE ON SCHEMA topology_earth TO web_anon;


--
-- Name: SEQUENCE empresa_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.empresa_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.empresa_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.empresa_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.empresa_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.empresa_gid_seq TO ayto_admin;


--
-- Name: TABLE empresa; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.empresa TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.empresa TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.empresa TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.empresa TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.empresa TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.empresa TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.empresa TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.empresa TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.empresa TO ayto_admin;
GRANT ALL ON TABLE bd_empleados.empresa TO foo;


--
-- Name: SEQUENCE grupo_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.grupo_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.grupo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.grupo_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.grupo_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.grupo_gid_seq TO ayto_admin;


--
-- Name: TABLE grupo; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.grupo TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.grupo TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.grupo TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.grupo TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.grupo TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.grupo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.grupo TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.grupo TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.grupo TO ayto_admin;


--
-- Name: SEQUENCE organizacion_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.organizacion_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.organizacion_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.organizacion_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.organizacion_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.organizacion_gid_seq TO ayto_admin;


--
-- Name: TABLE nivel_organizacion; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.nivel_organizacion TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.nivel_organizacion TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.nivel_organizacion TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.nivel_organizacion TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.nivel_organizacion TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.nivel_organizacion TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.nivel_organizacion TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.nivel_organizacion TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.nivel_organizacion TO ayto_admin;


--
-- Name: SEQUENCE permiso_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.permiso_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.permiso_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.permiso_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.permiso_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.permiso_gid_seq TO ayto_admin;


--
-- Name: TABLE permiso; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.permiso TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.permiso TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.permiso TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.permiso TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.permiso TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.permiso TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.permiso TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.permiso TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.permiso TO ayto_admin;


--
-- Name: SEQUENCE puesto_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.puesto_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.puesto_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.puesto_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.puesto_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.puesto_gid_seq TO ayto_admin;


--
-- Name: TABLE puesto; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.puesto TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.puesto TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.puesto TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.puesto TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.puesto TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.puesto TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.puesto TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.puesto TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.puesto TO ayto_admin;


--
-- Name: SEQUENCE rel_empre_grupo_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.rel_empre_grupo_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rel_empre_grupo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.rel_empre_grupo_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rel_empre_grupo_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.rel_empre_grupo_gid_seq TO ayto_admin;


--
-- Name: SEQUENCE rel_grupo_rol_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.rel_grupo_rol_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rel_grupo_rol_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.rel_grupo_rol_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rel_grupo_rol_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.rel_grupo_rol_gid_seq TO ayto_admin;


--
-- Name: TABLE rel_grupo_rol; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_grupo_rol TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.rel_grupo_rol TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_grupo_rol TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.rel_grupo_rol TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_grupo_rol TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.rel_grupo_rol TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.rel_grupo_rol TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.rel_grupo_rol TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.rel_grupo_rol TO ayto_admin;


--
-- Name: TABLE rel_orga_grupo; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_orga_grupo TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.rel_orga_grupo TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_orga_grupo TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.rel_orga_grupo TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_orga_grupo TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.rel_orga_grupo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.rel_orga_grupo TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.rel_orga_grupo TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.rel_orga_grupo TO ayto_admin;


--
-- Name: SEQUENCE rel_rol_permiso_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.rel_rol_permiso_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rel_rol_permiso_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.rel_rol_permiso_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rel_rol_permiso_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.rel_rol_permiso_gid_seq TO ayto_admin;


--
-- Name: TABLE rel_rol_permiso; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_rol_permiso TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.rel_rol_permiso TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_rol_permiso TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.rel_rol_permiso TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_rol_permiso TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.rel_rol_permiso TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.rel_rol_permiso TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.rel_rol_permiso TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.rel_rol_permiso TO ayto_admin;


--
-- Name: SEQUENCE rel_usuario_grupo_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.rel_usuario_grupo_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rel_usuario_grupo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.rel_usuario_grupo_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rel_usuario_grupo_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.rel_usuario_grupo_gid_seq TO ayto_admin;


--
-- Name: TABLE rel_usuario_grupo; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_usuario_grupo TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.rel_usuario_grupo TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_usuario_grupo TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.rel_usuario_grupo TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_usuario_grupo TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.rel_usuario_grupo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.rel_usuario_grupo TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.rel_usuario_grupo TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.rel_usuario_grupo TO ayto_admin;


--
-- Name: SEQUENCE rel_usuario_rol_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.rel_usuario_rol_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rel_usuario_rol_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.rel_usuario_rol_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rel_usuario_rol_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.rel_usuario_rol_gid_seq TO ayto_admin;


--
-- Name: TABLE rel_usuario_rol; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_usuario_rol TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.rel_usuario_rol TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_usuario_rol TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.rel_usuario_rol TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rel_usuario_rol TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.rel_usuario_rol TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.rel_usuario_rol TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.rel_usuario_rol TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.rel_usuario_rol TO ayto_admin;


--
-- Name: SEQUENCE rol_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.rol_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rol_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.rol_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.rol_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.rol_gid_seq TO ayto_admin;


--
-- Name: TABLE rol; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rol TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.rol TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rol TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.rol TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.rol TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.rol TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.rol TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.rol TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.rol TO ayto_admin;


--
-- Name: SEQUENCE usuario_empleado_gid_seq; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_empleados.usuario_empleado_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.usuario_empleado_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_empleados.usuario_empleado_gid_seq TO group_ayto_admin;
GRANT SELECT,USAGE ON SEQUENCE bd_empleados.usuario_empleado_gid_seq TO group_ayto_user;
GRANT SELECT ON SEQUENCE bd_empleados.usuario_empleado_gid_seq TO ayto_admin;


--
-- Name: TABLE usuario_empleado; Type: ACL; Schema: bd_empleados; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.usuario_empleado TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_empleados.usuario_empleado TO group_ayuntamiento_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.usuario_empleado TO group_padron_admin;
GRANT SELECT ON TABLE bd_empleados.usuario_empleado TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_empleados.usuario_empleado TO group_spai_admin;
GRANT SELECT ON TABLE bd_empleados.usuario_empleado TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_empleados.usuario_empleado TO group_ayto_admin;
GRANT SELECT ON TABLE bd_empleados.usuario_empleado TO group_ayto_user;
GRANT SELECT ON TABLE bd_empleados.usuario_empleado TO ayto_admin;


--
-- Name: SEQUENCE area_interes_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.area_interes_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.area_interes_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.area_interes_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.area_interes_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.area_interes_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.area_interes_gid_seq TO group_spai_user;


--
-- Name: TABLE area_interes; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT ON TABLE bd_terceros.area_interes TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_terceros.area_interes TO group_padron_user;
GRANT SELECT ON TABLE bd_terceros.area_interes TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.area_interes TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.area_interes TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.area_interes TO group_spai_admin;


--
-- Name: SEQUENCE banco_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.banco_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.banco_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.banco_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.banco_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.banco_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.banco_gid_seq TO group_spai_user;


--
-- Name: TABLE banco; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT ON TABLE bd_terceros.banco TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_terceros.banco TO group_padron_user;
GRANT SELECT ON TABLE bd_terceros.banco TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.banco TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.banco TO group_spai_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_terceros.banco TO group_ayuntamiento_admin;


--
-- Name: SEQUENCE canal_notif_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.canal_notif_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.canal_notif_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.canal_notif_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.canal_notif_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.canal_notif_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.canal_notif_gid_seq TO group_spai_user;


--
-- Name: TABLE canal_notificacion; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT ON TABLE bd_terceros.canal_notificacion TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_terceros.canal_notificacion TO group_padron_user;
GRANT SELECT ON TABLE bd_terceros.canal_notificacion TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.canal_notificacion TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.canal_notificacion TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.canal_notificacion TO group_spai_admin;


--
-- Name: SEQUENCE cuenta_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.cuenta_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.cuenta_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.cuenta_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.cuenta_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.cuenta_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.cuenta_gid_seq TO group_spai_user;


--
-- Name: TABLE cuenta; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_terceros.cuenta TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_terceros.cuenta TO group_ayuntamiento_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.cuenta TO group_padron_admin;
GRANT SELECT ON TABLE bd_terceros.cuenta TO group_padron_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.cuenta TO group_spai_admin;
GRANT SELECT ON TABLE bd_terceros.cuenta TO group_spai_user;


--
-- Name: TABLE direcc_tercero_no_geo; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT ON TABLE bd_terceros.direcc_tercero_no_geo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_terceros.direcc_tercero_no_geo TO group_padron_user;
GRANT SELECT ON TABLE bd_terceros.direcc_tercero_no_geo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.direcc_tercero_no_geo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.direcc_tercero_no_geo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.direcc_tercero_no_geo TO group_spai_admin;


--
-- Name: TABLE direcccion; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT ON TABLE bd_terceros.direcccion TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_terceros.direcccion TO group_padron_user;
GRANT SELECT ON TABLE bd_terceros.direcccion TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.direcccion TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.direcccion TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.direcccion TO group_spai_admin;


--
-- Name: SEQUENCE grupo_area_interes_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.grupo_area_interes_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.grupo_area_interes_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.grupo_area_interes_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.grupo_area_interes_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.grupo_area_interes_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.grupo_area_interes_gid_seq TO group_spai_user;


--
-- Name: TABLE grupo_area_interes; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_terceros.grupo_area_interes TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_terceros.grupo_area_interes TO group_ayuntamiento_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.grupo_area_interes TO group_padron_admin;
GRANT SELECT ON TABLE bd_terceros.grupo_area_interes TO group_padron_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.grupo_area_interes TO group_spai_admin;
GRANT SELECT ON TABLE bd_terceros.grupo_area_interes TO group_spai_user;


--
-- Name: SEQUENCE idioma_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.idioma_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.idioma_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.idioma_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.idioma_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.idioma_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.idioma_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE oficina_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.oficina_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.oficina_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.oficina_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.oficina_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.oficina_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.oficina_gid_seq TO group_spai_user;


--
-- Name: TABLE oficina; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_terceros.oficina TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_terceros.oficina TO group_ayuntamiento_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.oficina TO group_padron_admin;
GRANT SELECT ON TABLE bd_terceros.oficina TO group_padron_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.oficina TO group_spai_admin;
GRANT SELECT ON TABLE bd_terceros.oficina TO group_spai_user;


--
-- Name: SEQUENCE pais_nacimiento_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.pais_nacimiento_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.pais_nacimiento_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.pais_nacimiento_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.pais_nacimiento_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.pais_nacimiento_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.pais_nacimiento_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE pais_tercero_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.pais_tercero_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.pais_tercero_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.pais_tercero_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.pais_tercero_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.pais_tercero_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.pais_tercero_gid_seq TO group_spai_user;


--
-- Name: TABLE pais_tercero; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT ON TABLE bd_terceros.pais_tercero TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_terceros.pais_tercero TO group_padron_user;
GRANT SELECT ON TABLE bd_terceros.pais_tercero TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.pais_tercero TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.pais_tercero TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.pais_tercero TO group_spai_admin;


--
-- Name: SEQUENCE profesion_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.profesion_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.profesion_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.profesion_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.profesion_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.profesion_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.profesion_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE rel_cuenta_banco_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.rel_cuenta_banco_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_cuenta_banco_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_cuenta_banco_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_cuenta_banco_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_cuenta_banco_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_cuenta_banco_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE rel_cuenta_oficina_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.rel_cuenta_oficina_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_cuenta_oficina_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_cuenta_oficina_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_cuenta_oficina_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_cuenta_oficina_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_cuenta_oficina_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE rel_oficina_banco_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.rel_oficina_banco_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_oficina_banco_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_oficina_banco_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_oficina_banco_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_oficina_banco_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_oficina_banco_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE rel_tercero_area_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_area_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_area_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_area_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_area_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_area_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_area_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_tercero_area; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT ON TABLE bd_terceros.rel_tercero_area TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_terceros.rel_tercero_area TO group_padron_user;
GRANT SELECT ON TABLE bd_terceros.rel_tercero_area TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.rel_tercero_area TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.rel_tercero_area TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.rel_tercero_area TO group_spai_admin;


--
-- Name: SEQUENCE rel_tercero_cuenta_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_cuenta_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_cuenta_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_cuenta_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_cuenta_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_cuenta_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_cuenta_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_tercero_cuenta; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT ON TABLE bd_terceros.rel_tercero_cuenta TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_terceros.rel_tercero_cuenta TO group_padron_user;
GRANT SELECT ON TABLE bd_terceros.rel_tercero_cuenta TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.rel_tercero_cuenta TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.rel_tercero_cuenta TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.rel_tercero_cuenta TO group_spai_admin;


--
-- Name: SEQUENCE rel_tercero_direccion_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_direccion_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_direccion_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_direccion_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_direccion_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_direccion_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_direccion_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_tercero_direccion; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.rel_tercero_direccion TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_terceros.rel_tercero_direccion TO group_ayuntamiento_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.rel_tercero_direccion TO group_padron_admin;
GRANT SELECT ON TABLE bd_terceros.rel_tercero_direccion TO group_padron_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.rel_tercero_direccion TO group_spai_admin;
GRANT SELECT ON TABLE bd_terceros.rel_tercero_direccion TO group_spai_user;


--
-- Name: SEQUENCE rel_tercero_tercero_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_tercero_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_tercero_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_tercero_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_tercero_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.rel_tercero_tercero_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.rel_tercero_tercero_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE status_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.status_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.status_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.status_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.status_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.status_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.status_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tercero_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.tercero_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tercero_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.tercero_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tercero_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.tercero_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tercero_gid_seq TO group_spai_user;


--
-- Name: TABLE tercero; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT SELECT ON TABLE bd_terceros.tercero TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_terceros.tercero TO group_padron_user;
GRANT SELECT ON TABLE bd_terceros.tercero TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.tercero TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.tercero TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_terceros.tercero TO group_spai_admin;


--
-- Name: SEQUENCE tipo_canal_notif_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.tipo_canal_notif_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_canal_notif_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_canal_notif_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_canal_notif_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_canal_notif_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_canal_notif_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipo_direccion_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.tipo_direccion_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_direccion_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_direccion_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_direccion_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_direccion_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_direccion_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipo_genero_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.tipo_genero_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_genero_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_genero_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_genero_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_genero_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_genero_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipo_nif_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.tipo_nif_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_nif_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_nif_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_nif_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_nif_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_nif_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipo_reg_matrimonial_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.tipo_reg_matrimonial_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_reg_matrimonial_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_reg_matrimonial_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_reg_matrimonial_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_reg_matrimonial_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_reg_matrimonial_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipo_relacion_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.tipo_relacion_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_relacion_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_relacion_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_relacion_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_relacion_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_relacion_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipo_tercero_gid_seq; Type: ACL; Schema: bd_terceros; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_terceros.tipo_tercero_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_tercero_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_tercero_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_tercero_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_terceros.tipo_tercero_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_terceros.tipo_tercero_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE acceso_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.acceso_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.acceso_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.acceso_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.acceso_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.acceso_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.acceso_gid_seq TO group_spai_user;


--
-- Name: TABLE acceso; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.acceso TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.acceso TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.acceso TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.acceso TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.acceso TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.acceso TO group_spai_admin;


--
-- Name: SEQUENCE codigo_postal_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.codigo_postal_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.codigo_postal_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.codigo_postal_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.codigo_postal_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.codigo_postal_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.codigo_postal_gid_seq TO group_spai_user;


--
-- Name: TABLE codigo_postal; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.codigo_postal TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.codigo_postal TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.codigo_postal TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.codigo_postal TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.codigo_postal TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.codigo_postal TO group_spai_admin;


--
-- Name: SEQUENCE comunidad_autonoma_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.comunidad_autonoma_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.comunidad_autonoma_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.comunidad_autonoma_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.comunidad_autonoma_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.comunidad_autonoma_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.comunidad_autonoma_gid_seq TO group_spai_user;


--
-- Name: TABLE comunidad_autonoma; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.comunidad_autonoma TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.comunidad_autonoma TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.comunidad_autonoma TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.comunidad_autonoma TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.comunidad_autonoma TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.comunidad_autonoma TO group_spai_admin;


--
-- Name: SEQUENCE construccion_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.construccion_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.construccion_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.construccion_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.construccion_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.construccion_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.construccion_gid_seq TO group_spai_user;


--
-- Name: TABLE construccion; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.construccion TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.construccion TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.construccion TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.construccion TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.construccion TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.construccion TO group_spai_admin;


--
-- Name: SEQUENCE direccion_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.direccion_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.direccion_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.direccion_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.direccion_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.direccion_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.direccion_gid_seq TO group_spai_user;


--
-- Name: TABLE direccion; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.direccion TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.direccion TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.direccion TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.direccion TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.direccion TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.direccion TO group_spai_admin;


--
-- Name: SEQUENCE div_territorial_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.div_territorial_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.div_territorial_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.div_territorial_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.div_territorial_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.div_territorial_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.div_territorial_gid_seq TO group_spai_user;


--
-- Name: TABLE division_territorial; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.division_territorial TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.division_territorial TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.division_territorial TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.division_territorial TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.division_territorial TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.division_territorial TO group_spai_admin;


--
-- Name: SEQUENCE entidad_colectiva_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.entidad_colectiva_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.entidad_colectiva_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.entidad_colectiva_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.entidad_colectiva_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.entidad_colectiva_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.entidad_colectiva_gid_seq TO group_spai_user;


--
-- Name: TABLE entidad_colectiva; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.entidad_colectiva TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.entidad_colectiva TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.entidad_colectiva TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.entidad_colectiva TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.entidad_colectiva TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.entidad_colectiva TO group_spai_admin;


--
-- Name: SEQUENCE entidad_singular_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.entidad_singular_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.entidad_singular_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.entidad_singular_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.entidad_singular_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.entidad_singular_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.entidad_singular_gid_seq TO group_spai_user;


--
-- Name: TABLE entidad_singular; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.entidad_singular TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.entidad_singular TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.entidad_singular TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.entidad_singular TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.entidad_singular TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.entidad_singular TO group_spai_admin;


--
-- Name: TABLE indicador_ambiental; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.indicador_ambiental TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.indicador_ambiental TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.indicador_ambiental TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.indicador_ambiental TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.indicador_ambiental TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.indicador_ambiental TO group_spai_admin;


--
-- Name: SEQUENCE indicador_ambiental_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.indicador_ambiental_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.indicador_ambiental_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.indicador_ambiental_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.indicador_ambiental_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.indicador_ambiental_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.indicador_ambiental_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE linea_auxiliar_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.linea_auxiliar_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.linea_auxiliar_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.linea_auxiliar_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.linea_auxiliar_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.linea_auxiliar_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.linea_auxiliar_gid_seq TO group_spai_user;


--
-- Name: TABLE linea_auxiliar; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.linea_auxiliar TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.linea_auxiliar TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.linea_auxiliar TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.linea_auxiliar TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.linea_auxiliar TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.linea_auxiliar TO group_spai_admin;


--
-- Name: SEQUENCE manzana_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.manzana_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.manzana_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.manzana_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.manzana_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.manzana_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.manzana_gid_seq TO group_spai_user;


--
-- Name: TABLE manzana; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.manzana TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.manzana TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.manzana TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.manzana TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.manzana TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.manzana TO group_spai_admin;


--
-- Name: SEQUENCE municipio_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.municipio_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.municipio_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.municipio_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.municipio_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.municipio_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.municipio_gid_seq TO group_spai_user;


--
-- Name: TABLE municipio; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.municipio TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.municipio TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.municipio TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.municipio TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.municipio TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.municipio TO group_spai_admin;


--
-- Name: SEQUENCE nucleo_diseminado_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.nucleo_diseminado_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.nucleo_diseminado_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.nucleo_diseminado_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.nucleo_diseminado_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.nucleo_diseminado_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.nucleo_diseminado_gid_seq TO group_spai_user;


--
-- Name: TABLE nucleo_diseminado; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.nucleo_diseminado TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.nucleo_diseminado TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.nucleo_diseminado TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.nucleo_diseminado TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.nucleo_diseminado TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.nucleo_diseminado TO group_spai_admin;


--
-- Name: SEQUENCE pais_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.pais_gid_seq TO foo;
GRANT ALL ON SEQUENCE bd_territorios.pais_gid_seq TO group_ayuntamiento_admin;
GRANT ALL ON SEQUENCE bd_territorios.pais_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.pais_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.pais_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.pais_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.pais_gid_seq TO group_spai_user;


--
-- Name: TABLE pais; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.pais TO group_spai_user;
GRANT SELECT ON TABLE bd_territorios.pais TO group_padron_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_territorios.pais TO group_spai_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_territorios.pais TO group_padron_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_territorios.pais TO foo;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_territorios.pais TO ayto_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE bd_territorios.pais TO group_ayuntamiento_admin;
GRANT SELECT ON TABLE bd_territorios.pais TO group_ayuntamiento_user;


--
-- Name: SEQUENCE parcela_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.parcela_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.parcela_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.parcela_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.parcela_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.parcela_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.parcela_gid_seq TO group_spai_user;


--
-- Name: TABLE parcela; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.parcela TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.parcela TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.parcela TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.parcela TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.parcela TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.parcela TO group_spai_admin;


--
-- Name: SEQUENCE provincia_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.provincia_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.provincia_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.provincia_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.provincia_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.provincia_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.provincia_gid_seq TO group_spai_user;


--
-- Name: TABLE provincia; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.provincia TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.provincia TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.provincia TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.provincia TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.provincia TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.provincia TO group_spai_admin;


--
-- Name: TABLE rel_vial_municipio; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.rel_vial_municipio TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.rel_vial_municipio TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.rel_vial_municipio TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_vial_municipio TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_vial_municipio TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_vial_municipio TO group_spai_admin;


--
-- Name: SEQUENCE rel_vial_municipio_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.rel_vial_municipio_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_vial_municipio_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.rel_vial_municipio_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_vial_municipio_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.rel_vial_municipio_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_vial_municipio_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_vial_tramo; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.rel_vial_tramo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.rel_vial_tramo TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.rel_vial_tramo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_vial_tramo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_vial_tramo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_vial_tramo TO group_spai_admin;


--
-- Name: SEQUENCE rel_vial_tramo_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.rel_vial_tramo_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_vial_tramo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.rel_vial_tramo_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_vial_tramo_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.rel_vial_tramo_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_vial_tramo_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE rel_zona_manzana_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.rel_zona_manzana_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_zona_manzana_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.rel_zona_manzana_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_zona_manzana_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.rel_zona_manzana_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_zona_manzana_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_zona_manzana; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.rel_zona_manzana TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.rel_zona_manzana TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.rel_zona_manzana TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_zona_manzana TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_zona_manzana TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_zona_manzana TO group_spai_admin;


--
-- Name: SEQUENCE rel_zona_parcela_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.rel_zona_parcela_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_zona_parcela_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.rel_zona_parcela_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_zona_parcela_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.rel_zona_parcela_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_zona_parcela_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_zona_parcela; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.rel_zona_parcela TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.rel_zona_parcela TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.rel_zona_parcela TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_zona_parcela TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_zona_parcela TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_zona_parcela TO group_spai_admin;


--
-- Name: SEQUENCE rel_zona_tramo_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.rel_zona_tramo_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_zona_tramo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.rel_zona_tramo_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_zona_tramo_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.rel_zona_tramo_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.rel_zona_tramo_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_zona_tramo; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.rel_zona_tramo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.rel_zona_tramo TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.rel_zona_tramo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_zona_tramo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_zona_tramo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.rel_zona_tramo TO group_spai_admin;


--
-- Name: SEQUENCE toponimo_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.toponimo_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.toponimo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.toponimo_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.toponimo_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.toponimo_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.toponimo_gid_seq TO group_spai_user;


--
-- Name: TABLE toponimo; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.toponimo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.toponimo TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.toponimo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.toponimo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.toponimo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.toponimo TO group_spai_admin;


--
-- Name: SEQUENCE tramo_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.tramo_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.tramo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.tramo_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.tramo_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.tramo_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.tramo_gid_seq TO group_spai_user;


--
-- Name: TABLE tramo; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.tramo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.tramo TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.tramo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.tramo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.tramo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.tramo TO group_spai_admin;


--
-- Name: SEQUENCE vial_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.vial_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.vial_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.vial_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.vial_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.vial_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.vial_gid_seq TO group_spai_user;


--
-- Name: TABLE vial; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.vial TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.vial TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.vial TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.vial TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.vial TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.vial TO group_spai_admin;


--
-- Name: SEQUENCE zona_gid_seq; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE bd_territorios.zona_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE bd_territorios.zona_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE bd_territorios.zona_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE bd_territorios.zona_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE bd_territorios.zona_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE bd_territorios.zona_gid_seq TO group_spai_user;


--
-- Name: TABLE zona; Type: ACL; Schema: bd_territorios; Owner: postgres
--

GRANT SELECT ON TABLE bd_territorios.zona TO group_ayuntamiento_user;
GRANT SELECT ON TABLE bd_territorios.zona TO group_padron_user;
GRANT SELECT ON TABLE bd_territorios.zona TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.zona TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.zona TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE bd_territorios.zona TO group_spai_admin;


--
-- Name: SEQUENCE estado_gid_seq; Type: ACL; Schema: cat_global; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_global.estado_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_global.estado_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_global.estado_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_global.estado_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_global.estado_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_global.estado_gid_seq TO group_spai_user;


--
-- Name: TABLE cat_valor_estado; Type: ACL; Schema: cat_global; Owner: postgres
--

REVOKE ALL ON TABLE cat_global.cat_valor_estado FROM postgres;
GRANT ALL ON TABLE cat_global.cat_valor_estado TO postgres WITH GRANT OPTION;
GRANT SELECT ON TABLE cat_global.cat_valor_estado TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_global.cat_valor_estado TO group_padron_user;
GRANT SELECT ON TABLE cat_global.cat_valor_estado TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_global.cat_valor_estado TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_global.cat_valor_estado TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_global.cat_valor_estado TO group_spai_admin;


--
-- Name: SEQUENCE fuente_gid_seq; Type: ACL; Schema: cat_global; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_global.fuente_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_global.fuente_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_global.fuente_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_global.fuente_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_global.fuente_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_global.fuente_gid_seq TO group_spai_user;


--
-- Name: TABLE cat_valor_fuente; Type: ACL; Schema: cat_global; Owner: postgres
--

GRANT SELECT ON TABLE cat_global.cat_valor_fuente TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_global.cat_valor_fuente TO group_padron_user;
GRANT SELECT ON TABLE cat_global.cat_valor_fuente TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_global.cat_valor_fuente TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_global.cat_valor_fuente TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_global.cat_valor_fuente TO group_spai_admin;


--
-- Name: TABLE cat_idioma; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT ON TABLE cat_terceros.cat_idioma TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_terceros.cat_idioma TO group_padron_user;
GRANT SELECT ON TABLE cat_terceros.cat_idioma TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_idioma TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_idioma TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_idioma TO group_spai_admin;


--
-- Name: TABLE cat_profesion; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT ON TABLE cat_terceros.cat_profesion TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_terceros.cat_profesion TO group_padron_user;
GRANT SELECT ON TABLE cat_terceros.cat_profesion TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_profesion TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_profesion TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_profesion TO group_spai_admin;


--
-- Name: TABLE cat_status; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT ON TABLE cat_terceros.cat_status TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_terceros.cat_status TO group_padron_user;
GRANT SELECT ON TABLE cat_terceros.cat_status TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_status TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_status TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_status TO group_spai_admin;


--
-- Name: TABLE cat_tipo_canal_not; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT ON TABLE cat_terceros.cat_tipo_canal_not TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_canal_not TO group_padron_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_canal_not TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_canal_not TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_canal_not TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_canal_not TO group_spai_admin;


--
-- Name: TABLE cat_tipo_direccion; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT ON TABLE cat_terceros.cat_tipo_direccion TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_direccion TO group_padron_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_direccion TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_direccion TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_direccion TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_direccion TO group_spai_admin;


--
-- Name: TABLE cat_tipo_genero; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT ON TABLE cat_terceros.cat_tipo_genero TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_genero TO group_padron_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_genero TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_genero TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_genero TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_genero TO group_spai_admin;


--
-- Name: TABLE cat_tipo_nif; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT ON TABLE cat_terceros.cat_tipo_nif TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_nif TO group_padron_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_nif TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_nif TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_nif TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_nif TO group_spai_admin;


--
-- Name: TABLE cat_tipo_reg_matrimonial; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT ON TABLE cat_terceros.cat_tipo_reg_matrimonial TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_reg_matrimonial TO group_padron_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_reg_matrimonial TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_reg_matrimonial TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_reg_matrimonial TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_reg_matrimonial TO group_spai_admin;


--
-- Name: TABLE cat_tipo_relacion; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT ON TABLE cat_terceros.cat_tipo_relacion TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_relacion TO group_padron_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_relacion TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_relacion TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_relacion TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_relacion TO group_spai_admin;


--
-- Name: SEQUENCE tipo_tercero_gid_seq; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT,UPDATE ON SEQUENCE cat_terceros.tipo_tercero_gid_seq TO group_ayuntamiento_admin;
GRANT SELECT ON SEQUENCE cat_terceros.tipo_tercero_gid_seq TO group_ayuntamiento_user;
GRANT SELECT,UPDATE ON SEQUENCE cat_terceros.tipo_tercero_gid_seq TO group_padron_admin;
GRANT SELECT ON SEQUENCE cat_terceros.tipo_tercero_gid_seq TO group_padron_user;
GRANT SELECT,UPDATE ON SEQUENCE cat_terceros.tipo_tercero_gid_seq TO group_spai_admin;
GRANT SELECT ON SEQUENCE cat_terceros.tipo_tercero_gid_seq TO group_spai_user;


--
-- Name: TABLE cat_tipo_tercero; Type: ACL; Schema: cat_terceros; Owner: postgres
--

GRANT SELECT ON TABLE cat_terceros.cat_tipo_tercero TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_tercero TO group_padron_user;
GRANT SELECT ON TABLE cat_terceros.cat_tipo_tercero TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_tercero TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_tercero TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_terceros.cat_tipo_tercero TO group_spai_admin;


--
-- Name: TABLE cat_tipo_calzada; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_tipo_calzada TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_calzada TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_calzada TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_calzada TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_calzada TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_calzada TO group_spai_admin;


--
-- Name: TABLE cat_tipo_colectivo; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_tipo_colectivo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_colectivo TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_colectivo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_colectivo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_colectivo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_colectivo TO group_spai_admin;


--
-- Name: SEQUENCE tipo_div_ter_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.tipo_div_ter_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipo_div_ter_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.tipo_div_ter_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipo_div_ter_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.tipo_div_ter_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipo_div_ter_seq TO group_spai_user;


--
-- Name: TABLE cat_tipo_div_territorial; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_tipo_div_territorial TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_div_territorial TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_div_territorial TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_div_territorial TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_div_territorial TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_div_territorial TO group_spai_admin;


--
-- Name: TABLE cat_tipo_indicador_amb; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_tipo_indicador_amb TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_indicador_amb TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_indicador_amb TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_indicador_amb TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_indicador_amb TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_indicador_amb TO group_spai_admin;


--
-- Name: TABLE cat_tipo_inmueble; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_tipo_inmueble TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_inmueble TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_inmueble TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_inmueble TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_inmueble TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_inmueble TO group_spai_admin;


--
-- Name: TABLE cat_tipo_portal; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_tipo_portal TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_portal TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_portal TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_portal TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_portal TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_portal TO group_spai_admin;


--
-- Name: TABLE cat_tipo_portal_pk; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_tipo_portal_pk TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_portal_pk TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_tipo_portal_pk TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_portal_pk TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_portal_pk TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_tipo_portal_pk TO group_spai_admin;


--
-- Name: TABLE cat_valor_acceso; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_acceso TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_acceso TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_acceso TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_acceso TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_acceso TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_acceso TO group_spai_admin;


--
-- Name: SEQUENCE valoracceso_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valoracceso_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valoracceso_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valoracceso_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valoracceso_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valoracceso_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valoracceso_gid_seq TO group_spai_user;


--
-- Name: TABLE cat_valor_acceso_pk; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_acceso_pk TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_acceso_pk TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_acceso_pk TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_acceso_pk TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_acceso_pk TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_acceso_pk TO group_spai_admin;


--
-- Name: TABLE cat_valor_clase; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_clase TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_clase TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_clase TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_clase TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_clase TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_clase TO group_spai_admin;


--
-- Name: TABLE cat_valor_estado; Type: ACL; Schema: cat_territorios; Owner: postgres
--

REVOKE ALL ON TABLE cat_territorios.cat_valor_estado FROM postgres;
GRANT ALL ON TABLE cat_territorios.cat_valor_estado TO postgres WITH GRANT OPTION;
GRANT SELECT ON TABLE cat_territorios.cat_valor_estado TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_estado TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_estado TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_estado TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_estado TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_estado TO group_spai_admin;


--
-- Name: TABLE cat_valor_estado_fisico; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_estado_fisico TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_estado_fisico TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_estado_fisico TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_estado_fisico TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_estado_fisico TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_estado_fisico TO group_spai_admin;


--
-- Name: TABLE cat_valor_firme; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_firme TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_firme TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_firme TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_firme TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_firme TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_firme TO group_spai_admin;


--
-- Name: TABLE cat_valor_fuente; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_fuente TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_fuente TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_fuente TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_fuente TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_fuente TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_fuente TO group_spai_admin;


--
-- Name: TABLE cat_valor_orden; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_orden TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_orden TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_orden TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_orden TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_orden TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_orden TO group_spai_admin;


--
-- Name: TABLE cat_valor_sentido; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_sentido TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_sentido TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_sentido TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_sentido TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_sentido TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_sentido TO group_spai_admin;


--
-- Name: TABLE cat_valor_sentido_pk; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_sentido_pk TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_sentido_pk TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_sentido_pk TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_sentido_pk TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_sentido_pk TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_sentido_pk TO group_spai_admin;


--
-- Name: TABLE cat_valor_situacion; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_situacion TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_situacion TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_situacion TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_situacion TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_situacion TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_situacion TO group_spai_admin;


--
-- Name: TABLE cat_valor_tipo_linea_aux; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_linea_aux TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_linea_aux TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_linea_aux TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_linea_aux TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_linea_aux TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_linea_aux TO group_spai_admin;


--
-- Name: TABLE cat_valor_tipo_vial; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_vial TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_vial TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_vial TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_vial TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_vial TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_vial TO group_spai_admin;


--
-- Name: SEQUENCE valortipovial_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valortipovial_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortipovial_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valortipovial_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortipovial_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valortipovial_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortipovial_gid_seq TO group_spai_user;


--
-- Name: TABLE cat_valor_tipo_toponimo; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_toponimo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_toponimo TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_toponimo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_toponimo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_toponimo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_toponimo TO group_spai_admin;


--
-- Name: TABLE cat_valor_tipo_tramo; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_tramo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_tramo TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_tramo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_tramo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_tramo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_tramo TO group_spai_admin;


--
-- Name: TABLE cat_valor_tipo_vehic; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_vehic TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_vehic TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_tipo_vehic TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_vehic TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_vehic TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_tipo_vehic TO group_spai_admin;


--
-- Name: TABLE cat_valor_titular; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT SELECT ON TABLE cat_territorios.cat_valor_titular TO group_ayuntamiento_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_titular TO group_padron_user;
GRANT SELECT ON TABLE cat_territorios.cat_valor_titular TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_titular TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_titular TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE cat_territorios.cat_valor_titular TO group_spai_admin;


--
-- Name: SEQUENCE estado_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.estado_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.estado_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.estado_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.estado_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.estado_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.estado_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE fuente_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.fuente_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.fuente_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.fuente_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.fuente_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.fuente_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.fuente_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE indicador_ambiental_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.indicador_ambiental_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.indicador_ambiental_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.indicador_ambiental_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.indicador_ambiental_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.indicador_ambiental_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.indicador_ambiental_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipo_colectivo_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.tipo_colectivo_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipo_colectivo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.tipo_colectivo_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipo_colectivo_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.tipo_colectivo_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipo_colectivo_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipo_inmueble_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.tipo_inmueble_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipo_inmueble_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.tipo_inmueble_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipo_inmueble_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.tipo_inmueble_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipo_inmueble_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipocalzada_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.tipocalzada_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipocalzada_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.tipocalzada_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipocalzada_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.tipocalzada_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipocalzada_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipoportal_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.tipoportal_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipoportal_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.tipoportal_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipoportal_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.tipoportal_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipoportal_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE tipoportal_pk_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.tipoportal_pk_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipoportal_pk_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.tipoportal_pk_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipoportal_pk_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.tipoportal_pk_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.tipoportal_pk_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valor_firme_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valor_firme_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valor_firme_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valor_firme_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valor_firme_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valor_firme_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valor_firme_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valoracceso_pk_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valoracceso_pk_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valoracceso_pk_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valoracceso_pk_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valoracceso_pk_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valoracceso_pk_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valoracceso_pk_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valorclase_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valorclase_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorclase_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valorclase_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorclase_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valorclase_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorclase_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valorestadofisico_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valorestadofisico_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorestadofisico_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valorestadofisico_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorestadofisico_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valorestadofisico_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorestadofisico_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valorlineaaux_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valorlineaaux_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorlineaaux_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valorlineaaux_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorlineaaux_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valorlineaaux_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorlineaaux_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valororden_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valororden_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valororden_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valororden_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valororden_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valororden_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valororden_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valorsentido_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valorsentido_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorsentido_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valorsentido_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorsentido_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valorsentido_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorsentido_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valorsentidopk_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valorsentidopk_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorsentidopk_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valorsentidopk_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorsentidopk_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valorsentidopk_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorsentidopk_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valorsituacion_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valorsituacion_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorsituacion_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valorsituacion_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorsituacion_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valorsituacion_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valorsituacion_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valortipotramo_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valortipotramo_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortipotramo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valortipotramo_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortipotramo_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valortipotramo_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortipotramo_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valortipovehic_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valortipovehic_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortipovehic_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valortipovehic_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortipovehic_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valortipovehic_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortipovehic_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE valortitular_gid_seq; Type: ACL; Schema: cat_territorios; Owner: postgres
--

GRANT ALL ON SEQUENCE cat_territorios.valortitular_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortitular_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE cat_territorios.valortitular_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortitular_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE cat_territorios.valortitular_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE cat_territorios.valortitular_gid_seq TO group_spai_user;


--
-- Name: SEQUENCE empresa_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.empresa_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.empresa_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.empresa_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.empresa_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.empresa_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.empresa_gid_seq TO group_spai_user;


--
-- Name: TABLE empresa; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.empresa TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.empresa TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.empresa TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.empresa TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.empresa TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.empresa TO group_spai_admin;


--
-- Name: SEQUENCE grupo_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.grupo_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.grupo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.grupo_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.grupo_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.grupo_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.grupo_gid_seq TO group_spai_user;


--
-- Name: TABLE grupo; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.grupo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.grupo TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.grupo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.grupo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.grupo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.grupo TO group_spai_admin;


--
-- Name: SEQUENCE organizacion_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.organizacion_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.organizacion_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.organizacion_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.organizacion_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.organizacion_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.organizacion_gid_seq TO group_spai_user;


--
-- Name: TABLE nivel_organizacion; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.nivel_organizacion TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.nivel_organizacion TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.nivel_organizacion TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.nivel_organizacion TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.nivel_organizacion TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.nivel_organizacion TO group_spai_admin;


--
-- Name: SEQUENCE permiso_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.permiso_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.permiso_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.permiso_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.permiso_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.permiso_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.permiso_gid_seq TO group_spai_user;


--
-- Name: TABLE permiso; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.permiso TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.permiso TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.permiso TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.permiso TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.permiso TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.permiso TO group_spai_admin;


--
-- Name: SEQUENCE puesto_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.puesto_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.puesto_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.puesto_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.puesto_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.puesto_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.puesto_gid_seq TO group_spai_user;


--
-- Name: TABLE puesto; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.puesto TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.puesto TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.puesto TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.puesto TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.puesto TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.puesto TO group_spai_admin;


--
-- Name: SEQUENCE rel_empre_grupo_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.rel_empre_grupo_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_empre_grupo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.rel_empre_grupo_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_empre_grupo_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.rel_empre_grupo_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_empre_grupo_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_empre_grupo; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.rel_empre_grupo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.rel_empre_grupo TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.rel_empre_grupo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_empre_grupo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_empre_grupo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_empre_grupo TO group_spai_admin;


--
-- Name: SEQUENCE rel_grupo_rol_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.rel_grupo_rol_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_grupo_rol_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.rel_grupo_rol_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_grupo_rol_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.rel_grupo_rol_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_grupo_rol_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_grupo_rol; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.rel_grupo_rol TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.rel_grupo_rol TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.rel_grupo_rol TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_grupo_rol TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_grupo_rol TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_grupo_rol TO group_spai_admin;


--
-- Name: TABLE rel_orga_grupo; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.rel_orga_grupo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.rel_orga_grupo TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.rel_orga_grupo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_orga_grupo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_orga_grupo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_orga_grupo TO group_spai_admin;


--
-- Name: SEQUENCE rel_rol_permiso_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.rel_rol_permiso_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_rol_permiso_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.rel_rol_permiso_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_rol_permiso_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.rel_rol_permiso_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_rol_permiso_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_rol_permiso; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.rel_rol_permiso TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.rel_rol_permiso TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.rel_rol_permiso TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_rol_permiso TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_rol_permiso TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_rol_permiso TO group_spai_admin;


--
-- Name: SEQUENCE rel_usuario_grupo_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.rel_usuario_grupo_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_usuario_grupo_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.rel_usuario_grupo_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_usuario_grupo_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.rel_usuario_grupo_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_usuario_grupo_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_usuario_grupo; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.rel_usuario_grupo TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.rel_usuario_grupo TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.rel_usuario_grupo TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_usuario_grupo TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_usuario_grupo TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_usuario_grupo TO group_spai_admin;


--
-- Name: SEQUENCE rel_usuario_rol_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.rel_usuario_rol_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_usuario_rol_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.rel_usuario_rol_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_usuario_rol_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.rel_usuario_rol_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.rel_usuario_rol_gid_seq TO group_spai_user;


--
-- Name: TABLE rel_usuario_rol; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.rel_usuario_rol TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.rel_usuario_rol TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.rel_usuario_rol TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_usuario_rol TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_usuario_rol TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rel_usuario_rol TO group_spai_admin;


--
-- Name: SEQUENCE rol_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.rol_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.rol_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.rol_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.rol_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.rol_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.rol_gid_seq TO group_spai_user;


--
-- Name: TABLE rol; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.rol TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.rol TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.rol TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rol TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rol TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.rol TO group_spai_admin;


--
-- Name: SEQUENCE usuario_empleado_gid_seq; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT ALL ON SEQUENCE topology_earth.usuario_empleado_gid_seq TO group_ayuntamiento_admin;
GRANT USAGE ON SEQUENCE topology_earth.usuario_empleado_gid_seq TO group_ayuntamiento_user;
GRANT ALL ON SEQUENCE topology_earth.usuario_empleado_gid_seq TO group_padron_admin;
GRANT USAGE ON SEQUENCE topology_earth.usuario_empleado_gid_seq TO group_padron_user;
GRANT ALL ON SEQUENCE topology_earth.usuario_empleado_gid_seq TO group_spai_admin;
GRANT USAGE ON SEQUENCE topology_earth.usuario_empleado_gid_seq TO group_spai_user;


--
-- Name: TABLE usuario_empleado; Type: ACL; Schema: topology_earth; Owner: postgres
--

GRANT SELECT ON TABLE topology_earth.usuario_empleado TO group_ayuntamiento_user;
GRANT SELECT ON TABLE topology_earth.usuario_empleado TO group_padron_user;
GRANT SELECT ON TABLE topology_earth.usuario_empleado TO group_spai_user;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.usuario_empleado TO group_ayuntamiento_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.usuario_empleado TO group_padron_admin;
GRANT SELECT,INSERT,UPDATE ON TABLE topology_earth.usuario_empleado TO group_spai_admin;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: bd_empleados; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_empleados GRANT ALL ON TABLES TO ayto_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_empleados GRANT SELECT ON TABLES TO group_ayuntamiento_user;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_empleados GRANT SELECT ON TABLES TO group_spai_user;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_empleados GRANT SELECT ON TABLES TO group_padron_user;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_empleados GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO group_ayuntamiento_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_empleados GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO group_spai_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_empleados GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO group_padron_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_empleados GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO foo;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_empleados GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO group_ayto_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_empleados GRANT SELECT ON TABLES TO group_ayto_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: bd_territorios; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_territorios GRANT SELECT ON TABLES TO ayto_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_territorios GRANT SELECT ON TABLES TO group_spai_user;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_territorios GRANT SELECT ON TABLES TO group_padron_user;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_territorios GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO group_spai_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_territorios GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO group_padron_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_territorios GRANT SELECT ON TABLES TO foo;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_territorios GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO group_ayto_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA bd_territorios GRANT SELECT ON TABLES TO group_ayto_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: cat_territorios; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cat_territorios GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO group_spai_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cat_territorios GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO group_padron_admin;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cat_territorios GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO foo;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA cat_territorios GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO group_ayto_admin;


--
-- PostgreSQL database dump complete
--

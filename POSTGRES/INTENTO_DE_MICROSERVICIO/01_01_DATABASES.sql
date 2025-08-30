/*
 PROBLEMAS CON LA CODIFICACIÓN DE CARACTERES DE ESTE IDE
 Ir a la opción "Ventanas" / "Preferencias"
 En el cuadro seleccionar la opción "General" / "Espacio de trabajo"
 En el panel, en la parte inferior, en "Códificación de archivos de texto" seleccionar "Otros" "UTF-8"
*/

-- Ejecutar este script en terminal psql, cualquiera de estas dos formas 
-- Cargar archivo 			-> postgres=#  \i /data/iGEST/POSTGRES/01_01_DATABASES.sql
-- Copiar/Pegar en Terminal ->

-- CREAR LAS BASES DE DATOS EN PGADMIN, PSQL TOOL, y CON USUARIO POSTGRES
CREATE DATABASE db_igest_gen;
COMMENT ON DATABASE db_igest_gen IS 'Base de datos para el sistema principal (usuarios, accesos, maestros).';
CREATE DATABASE db_igest_com;
COMMENT ON DATABASE db_igest_com IS 'Base de datos para el sistema comercial.';
CREATE DATABASE db_igest_lgt;
COMMENT ON DATABASE db_igest_lgt IS 'Base de datos para el sistema logístico.';
CREATE DATABASE db_igest_per;
COMMENT ON DATABASE db_igest_per IS 'Base de datos para el sistema laboral.';
CREATE DATABASE db_igest_fin;
COMMENT ON DATABASE db_igest_fin IS 'Base de datos para el sistema financiero.';
CREATE DATABASE db_igest_col;
COMMENT ON DATABASE db_igest_col IS 'Base de datos para el sistema escolar.';
CREATE DATABASE db_igest_aca;
COMMENT ON DATABASE db_igest_aca IS 'Base de datos para el sistema preuniversitario.';
CREATE DATABASE db_igest_med;
COMMENT ON DATABASE db_igest_med IS 'Base de datos para el sistema médico.';
CREATE DATABASE db_igest_ger;
COMMENT ON DATABASE db_igest_ger IS 'Base de datos para el sistema gerencial.';

-- CREAR ADM para fgestiosn en lugar de ger
-- CREAR CNT para contabilidad en lugar de ger

-- CREAR EXTENSION UNACCENT
-- RUTA DEL ARCHIVO: C:\Program Files\PostgreSQL\10\share\tsearch_data\unaccent.rules
\c db_igest_gen
CREATE EXTENSION unaccent;
CREATE OR REPLACE FUNCTION fn_unaccent(text) 
RETURNS text
LANGUAGE sql IMMUTABLE STRICT AS
	'SELECT unaccent($1)';

\c db_igest_com
CREATE EXTENSION unaccent;
CREATE OR REPLACE FUNCTION fn_unaccent(text) 
RETURNS text
LANGUAGE sql IMMUTABLE STRICT AS
	'SELECT unaccent($1)';

\c db_igest_lgt
CREATE EXTENSION unaccent;
CREATE OR REPLACE FUNCTION fn_unaccent(text) 
RETURNS text
LANGUAGE sql IMMUTABLE STRICT AS
	'SELECT unaccent($1)';

\c db_igest_per
CREATE EXTENSION unaccent;
CREATE OR REPLACE FUNCTION fn_unaccent(text) 
RETURNS text
LANGUAGE sql IMMUTABLE STRICT AS
	'SELECT unaccent($1)';

\c db_igest_fin
CREATE EXTENSION unaccent;
CREATE OR REPLACE FUNCTION fn_unaccent(text) 
RETURNS text
LANGUAGE sql IMMUTABLE STRICT AS
	'SELECT unaccent($1)';

\c db_igest_col
CREATE EXTENSION unaccent;
CREATE OR REPLACE FUNCTION fn_unaccent(text) 
RETURNS text
LANGUAGE sql IMMUTABLE STRICT AS
	'SELECT unaccent($1)';

\c db_igest_aca
CREATE EXTENSION unaccent;
CREATE OR REPLACE FUNCTION fn_unaccent(text) 
RETURNS text
LANGUAGE sql IMMUTABLE STRICT AS
	'SELECT unaccent($1)';

\c db_igest_med
CREATE EXTENSION unaccent;
CREATE OR REPLACE FUNCTION fn_unaccent(text) 
RETURNS text
LANGUAGE sql IMMUTABLE STRICT AS
	'SELECT unaccent($1)';
	
\c db_igest_ger
CREATE EXTENSION unaccent;
CREATE OR REPLACE FUNCTION fn_unaccent(text) 
RETURNS text
LANGUAGE sql IMMUTABLE STRICT AS
	'SELECT unaccent($1)';



-- TABLAS DE AUDITORIA PARA CADA BASE DE DATOS PARTICIONADOS POR AÑO
\c db_igest_gen
DROP TABLE IF EXISTS auditoria;
CREATE TABLE auditoria (
    id_auditoria 	bigserial,
    anio 			int,
    nom_entidad 	varchar(50),
    id_entidad 		int,
    operacion 		varchar(10),
    id_usuario 		bigint,
    nom_usuario 	varchar(50),
    ip 				varchar(25),
    host 			varchar(100),
    dispositivo		varchar(100),
    fe_oper 		date,
    fh_oper 		timestamp,
    valores 		jsonb,
    PRIMARY KEY (id_auditoria, anio)
) PARTITION BY LIST (anio);
CREATE INDEX auditoria_idx ON auditoria (nom_entidad, id_entidad, nom_usuario);
CREATE TABLE auditoria_2025 PARTITION OF auditoria FOR VALUES IN (2025);
CREATE TABLE auditoria_2026 PARTITION OF auditoria FOR VALUES IN (2026);

\c db_igest_com
DROP TABLE IF EXISTS auditoria;
CREATE TABLE auditoria (
    id_auditoria 	bigserial,
    anio 			int,
    nom_entidad 	varchar(50),
    id_entidad 		int,
    operacion 		varchar(10),
    id_usuario 		bigint,
    nom_usuario 	varchar(50),
    ip 				varchar(25),
    host 			varchar(100),
    dispositivo		varchar(100),
    fe_oper 		date,
    fh_oper 		timestamp,
    valores 		jsonb,
    PRIMARY KEY (id_auditoria, anio)
) PARTITION BY LIST (anio);
CREATE INDEX auditoria_idx ON auditoria (nom_entidad, id_entidad, nom_usuario);
CREATE TABLE auditoria_2025 PARTITION OF auditoria FOR VALUES IN (2025);
CREATE TABLE auditoria_2026 PARTITION OF auditoria FOR VALUES IN (2026);

\c db_igest_lgt
DROP TABLE IF EXISTS auditoria;
CREATE TABLE auditoria (
    id_auditoria 	bigserial,
    anio 			int,
    nom_entidad 	varchar(50),
    id_entidad 		int,
    operacion 		varchar(10),
    id_usuario 		bigint,
    nom_usuario 	varchar(50),
    ip 				varchar(25),
    host 			varchar(100),
    dispositivo		varchar(100),
    fe_oper 		date,
    fh_oper 		timestamp,
    valores 		jsonb,
    PRIMARY KEY (id_auditoria, anio)
) PARTITION BY LIST (anio);
CREATE INDEX auditoria_idx ON auditoria (nom_entidad, id_entidad, nom_usuario);
CREATE TABLE auditoria_2025 PARTITION OF auditoria FOR VALUES IN (2025);
CREATE TABLE auditoria_2026 PARTITION OF auditoria FOR VALUES IN (2026);

\c db_igest_per
DROP TABLE IF EXISTS auditoria;
CREATE TABLE auditoria (
    id_auditoria 	bigserial,
    anio 			int,
    nom_entidad 	varchar(50),
    id_entidad 		int,
    operacion 		varchar(10),
    id_usuario 		bigint,
    nom_usuario 	varchar(50),
    ip 				varchar(25),
    host 			varchar(100),
    dispositivo		varchar(100),
    fe_oper 		date,
    fh_oper 		timestamp,
    valores 		jsonb,
    PRIMARY KEY (id_auditoria, anio)
) PARTITION BY LIST (anio);
CREATE INDEX auditoria_idx ON auditoria (nom_entidad, id_entidad, nom_usuario);
CREATE TABLE auditoria_2025 PARTITION OF auditoria FOR VALUES IN (2025);
CREATE TABLE auditoria_2026 PARTITION OF auditoria FOR VALUES IN (2026);

\c db_igest_fin
DROP TABLE IF EXISTS auditoria;
CREATE TABLE auditoria (
    id_auditoria 	bigserial,
    anio 			int,
    nom_entidad 	varchar(50),
    id_entidad 		int,
    operacion 		varchar(10),
    id_usuario 		bigint,
    nom_usuario 	varchar(50),
    ip 				varchar(25),
    host 			varchar(100),
    dispositivo		varchar(100),
    fe_oper 		date,
    fh_oper 		timestamp,
    valores 		jsonb,
    PRIMARY KEY (id_auditoria, anio)
) PARTITION BY LIST (anio);
CREATE INDEX auditoria_idx ON auditoria (nom_entidad, id_entidad, nom_usuario);
CREATE TABLE auditoria_2025 PARTITION OF auditoria FOR VALUES IN (2025);
CREATE TABLE auditoria_2026 PARTITION OF auditoria FOR VALUES IN (2026);

\c db_igest_col
DROP TABLE IF EXISTS auditoria;
CREATE TABLE auditoria (
    id_auditoria 	bigserial,
    anio 			int,
    nom_entidad 	varchar(50),
    id_entidad 		int,
    operacion 		varchar(10),
    id_usuario 		bigint,
    nom_usuario 	varchar(50),
    ip 				varchar(25),
    host 			varchar(100),
    dispositivo		varchar(100),
    fe_oper 		date,
    fh_oper 		timestamp,
    valores 		jsonb,
    PRIMARY KEY (id_auditoria, anio)
) PARTITION BY LIST (anio);
CREATE INDEX auditoria_idx ON auditoria (nom_entidad, id_entidad, nom_usuario);
CREATE TABLE auditoria_2025 PARTITION OF auditoria FOR VALUES IN (2025);
CREATE TABLE auditoria_2026 PARTITION OF auditoria FOR VALUES IN (2026);

\c db_igest_aca
DROP TABLE IF EXISTS auditoria;
CREATE TABLE auditoria (
    id_auditoria 	bigserial,
    anio 			int,
    nom_entidad 	varchar(50),
    id_entidad 		int,
    operacion 		varchar(10),
    id_usuario 		bigint,
    nom_usuario 	varchar(50),
    ip 				varchar(25),
    host 			varchar(100),
    dispositivo		varchar(100),
    fe_oper 		date,
    fh_oper 		timestamp,
    valores 		jsonb,
    PRIMARY KEY (id_auditoria, anio)
) PARTITION BY LIST (anio);
CREATE INDEX auditoria_idx ON auditoria (nom_entidad, id_entidad, nom_usuario);
CREATE TABLE auditoria_2025 PARTITION OF auditoria FOR VALUES IN (2025);
CREATE TABLE auditoria_2026 PARTITION OF auditoria FOR VALUES IN (2026);

\c db_igest_med
DROP TABLE IF EXISTS auditoria;
CREATE TABLE auditoria (
    id_auditoria 	bigserial,
    anio 			int,
    nom_entidad 	varchar(50),
    id_entidad 		int,
    operacion 		varchar(10),
    id_usuario 		bigint,
    nom_usuario 	varchar(50),
    ip 				varchar(25),
    host 			varchar(100),
    dispositivo		varchar(100),
    fe_oper 		date,
    fh_oper 		timestamp,
    valores 		jsonb,
    PRIMARY KEY (id_auditoria, anio)
) PARTITION BY LIST (anio);
CREATE INDEX auditoria_idx ON auditoria (nom_entidad, id_entidad, nom_usuario);
CREATE TABLE auditoria_2025 PARTITION OF auditoria FOR VALUES IN (2025);
CREATE TABLE auditoria_2026 PARTITION OF auditoria FOR VALUES IN (2026);

\c db_igest_ger
DROP TABLE IF EXISTS auditoria;
CREATE TABLE auditoria (
    id_auditoria 	bigserial,
    anio 			int,
    nom_entidad 	varchar(50),
    id_entidad 		int,
    operacion 		varchar(10),
    id_usuario 		bigint,
    nom_usuario 	varchar(50),
    ip 				varchar(25),
    host 			varchar(100),
    dispositivo		varchar(100),
    fe_oper 		date,
    fh_oper 		timestamp,
    valores 		jsonb,
    PRIMARY KEY (id_auditoria, anio)
) PARTITION BY LIST (anio);
CREATE INDEX auditoria_idx ON auditoria (nom_entidad, id_entidad, nom_usuario);
CREATE TABLE auditoria_2025 PARTITION OF auditoria FOR VALUES IN (2025);
CREATE TABLE auditoria_2026 PARTITION OF auditoria FOR VALUES IN (2026);


-- COMENTANDO TABLA AUDITORIA (Sólo de "db_igest_gen" para muestra)
\c db_igest_gen
COMMENT ON TABLE auditoria IS 'Tabla de auditoria.'; 
COMMENT ON COLUMN auditoria.id_auditoria IS 'Identificador de entidad.';
COMMENT ON COLUMN auditoria.anio IS 'Año de operación.';
COMMENT ON COLUMN auditoria.nom_entidad IS 'Nombre de la tabla.';
COMMENT ON COLUMN auditoria.id_entidad IS 'Valor del identificador de la tabla.';
COMMENT ON COLUMN auditoria.operacion IS 'Operación en la BD: INSERT, UPDATE, DELETE.';
COMMENT ON COLUMN auditoria.id_usuario IS 'Identificador del usuario que opera.';
COMMENT ON COLUMN auditoria.nom_usuario IS 'Nombre del usuario que opera.';
COMMENT ON COLUMN auditoria.ip IS 'IP del dispositivo.';
COMMENT ON COLUMN auditoria.host IS 'Nombre del dispositivo.';
COMMENT ON COLUMN auditoria.dispositivo IS 'Tipo de dispositivo / Sistema Operativo y/o versión.';
COMMENT ON COLUMN auditoria.fe_oper IS 'Fecha de operación.';
COMMENT ON COLUMN auditoria.fh_oper IS 'Fecha y hora de operación.';
COMMENT ON COLUMN auditoria.valores IS 'Todos los valores (columnas) del registro.';



-- CREAR USUARIOS Y CONTRASEÑA
\c postgres
DROP USER IF EXISTS usr_gen;
DROP USER IF EXISTS usr_com;
DROP USER IF EXISTS usr_lgt;
DROP USER IF EXISTS usr_per;
DROP USER IF EXISTS usr_fin;
DROP USER IF EXISTS usr_col;
DROP USER IF EXISTS usr_aca;
DROP USER IF EXISTS usr_med;
DROP USER IF EXISTS usr_ger;
CREATE USER usr_gen WITH PASSWORD 'rG9*s4NF2t7BqY3$a6MF1p8OZ#eC7&IVA';
CREATE USER usr_com WITH PASSWORD 'vA1u5B4In6G%xS07L2dfdRTk9H@yT6*OL';
CREATE USER usr_lgt WITH PASSWORD 'hF5%d1K8mA6V@rG9*s4N2t7BqY3$a6M1F';
CREATE USER usr_per WITH PASSWORD 'rG9*s4N2t7NBqY3$a6M1p8Z#eC7&2J5SS';
CREATE USER usr_fin WITH PASSWORD 'eC7&2J5l9H*wAD4+i8K3m7F$vA1u5B4CF';
CREATE USER usr_col WITH PASSWORD 'wD4+i8K3m7F$vBA1u5RB4Zn6GO%xSLA7L';
CREATE USER usr_aca WITH PASSWORD 'vA1uQ5B4n6G%xS07L2k9H@yT6*i4M3KJ8';
CREATE USER usr_med WITH PASSWORD 'xS07L2k9HO@yT6L*i4MV3p8ZA#eREC7&S';
CREATE USER usr_ger WITH PASSWORD 'fSs,jhf437@yT6L*92384ofwe978"#$&6';
\du



-- ASIGNAR PERMISO DE ACCESOS
GRANT CONNECT ON DATABASE db_igest_gen TO usr_gen;
GRANT CONNECT ON DATABASE db_igest_com TO usr_com;
GRANT CONNECT ON DATABASE db_igest_lgt TO usr_lgt;
GRANT CONNECT ON DATABASE db_igest_per TO usr_per;
GRANT CONNECT ON DATABASE db_igest_fin TO usr_fin;
GRANT CONNECT ON DATABASE db_igest_col TO usr_col;
GRANT CONNECT ON DATABASE db_igest_aca TO usr_aca;
GRANT CONNECT ON DATABASE db_igest_med TO usr_med;
GRANT CONNECT ON DATABASE db_igest_ger TO usr_ger;
\l



-- ASIGNAR PERMISOS (NO DELETE) VOLVER A EJECUTAR CADA VEZ QUE SE CREAN OBJETOS EN LAS BASES DE DATOS
\c db_igest_gen
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usr_gen;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usr_gen;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO usr_gen;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA public TO usr_gen;

\c db_igest_com
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usr_com;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usr_com;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO usr_com;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA public TO usr_com;

\c db_igest_lgt
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usr_lgt;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usr_lgt;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO usr_lgt;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA public TO usr_lgt;

\c db_igest_per
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usr_per;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usr_per;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO usr_per;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA public TO usr_per;

\c db_igest_fin
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usr_fin;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usr_fin;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO usr_fin;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA public TO usr_fin;

\c db_igest_col
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usr_col;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usr_col;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO usr_col;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA public TO usr_col;

\c db_igest_aca
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usr_aca;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usr_aca;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO usr_aca;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA public TO usr_aca;

\c db_igest_med
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usr_med;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usr_med;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO usr_med;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA public TO usr_med;

\c db_igest_ger
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usr_ger;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usr_ger;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO usr_ger;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA public TO usr_ger;






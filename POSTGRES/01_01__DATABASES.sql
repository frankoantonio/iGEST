/*
 En la terminal de PostgreSQL, ejecutar una de las dos formas:
 - copiar y pegar directamente 
 - cargar el archivo con este comando -> postgres=# \i /RUTA_DESDE_RAIZ/01_01_DATABASES.sql
*/

-- =============================================
-- BASE DE DATOS ÚNICA
-- =============================================
\c postgres

DROP DATABASE IF EXISTS db_igest;

CREATE DATABASE db_igest 
    WITH ENCODING = 'UTF8'
         LC_COLLATE = 'es_PE.utf8'
         LC_CTYPE = 'es_PE.utf8'
         TEMPLATE = template0;

COMMENT ON DATABASE db_igest IS 'Base de datos unificada para todos los sistemas iGEST';



-- =============================================
-- EXTENSIONES NECESARIAS
-- =============================================
\c db_igest

CREATE EXTENSION IF NOT EXISTS unaccent;      -- Eliminación de acentos y tildes
CREATE EXTENSION IF NOT EXISTS pgcrypto;      -- gen_random_uuid(), cifrado y funciones criptográficas
CREATE EXTENSION IF NOT EXISTS pg_trgm;       -- Índices y búsquedas de texto por similitud (trigramas)
CREATE EXTENSION IF NOT EXISTS btree_gin;     -- Compatibilidad para usar GIN en tipos comunes (índices compuestos)

-- Función personalizada fn_unaccent
CREATE OR REPLACE FUNCTION public.fn_unaccent(text)
RETURNS text
LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE AS
$$
    SELECT unaccent($1);
$$;

COMMENT ON FUNCTION public.fn_unaccent(text) IS 'Normaliza texto eliminando tildes y acentos, envoltorio de la extensión unaccent.';



-- =============================================
-- ESQUEMAS POR SISTEMA
-- =============================================
CREATE SCHEMA IF NOT EXISTS gen;
COMMENT ON SCHEMA gen IS 'Sistema de control y acceso. Datos genéricos.';

CREATE SCHEMA IF NOT EXISTS com;
COMMENT ON SCHEMA com IS 'Sistema comercial. Ventas, suscripciones, facturación electrónica, cobranza.';

CREATE SCHEMA IF NOT EXISTS lgt;
COMMENT ON SCHEMA lgt IS 'Sistema logístico. Requerimientos, cotización, órdenes de compra/servicio, compras, facturación, almacén.';

CREATE SCHEMA IF NOT EXISTS per;
COMMENT ON SCHEMA per IS 'Sistema de talento humano. Escalafón, asistencia, vacaciones, remuneraciones.';

CREATE SCHEMA IF NOT EXISTS fin;
COMMENT ON SCHEMA fin IS 'Sistema financiero. Tesorería, pagaduría, fondo fijo, pendientes, conciliaciones, proyecciones.';

CREATE SCHEMA IF NOT EXISTS cnt;
COMMENT ON SCHEMA cnt IS 'Sistema contable. Asientos, registros de compras/ventas, estados financieros.';

CREATE SCHEMA IF NOT EXISTS adm;
COMMENT ON SCHEMA adm IS 'Sistema de gestión. Mesa de partes, solicitudes, autorizaciones, reportes gerenciales, unidades orgánicas, cuadro de asignación de personal.';

CREATE SCHEMA IF NOT EXISTS col;
COMMENT ON SCHEMA col IS 'Sistema académico escolar. Asistencia, conducta, evaluaciones, comunicados, psicología, enfermería.';

CREATE SCHEMA IF NOT EXISTS aca;
COMMENT ON SCHEMA aca IS 'Sistema académico preuniversitario. Asistencia, evaluaciones, simulacros, comunicados.';

CREATE SCHEMA IF NOT EXISTS med;
COMMENT ON SCHEMA med IS 'Sistema médico. Turnos, citas, triaje, laboratorio, historia, farmacia, hospitalización, nutrición.';

CREATE SCHEMA IF NOT EXISTS bka;
COMMENT ON SCHEMA bka IS 'Sistema bancario. Préstamos, operaciones, refinanciamientos, seguros.';



-- =============================================
-- USUARIO PARA APLICACIÓN
-- =============================================
DROP USER IF EXISTS usr_igest;

CREATE USER usr_igest WITH 
    PASSWORD 'rR7X4j0L2(s@8$69N*~vbtyd$k+d0$1CzukA*8hXKP'
    CONNECTION LIMIT 100
    VALID UNTIL 'infinity';

-- Permisos de conexión
GRANT CONNECT ON DATABASE db_igest TO usr_igest;

-- Permisos de uso de esquemas
GRANT USAGE ON SCHEMA public, gen, com, lgt, per, fin, cnt, adm, col, aca, med, bka TO usr_igest;

-- Permisos por defecto para tablas
ALTER DEFAULT PRIVILEGES IN SCHEMA gen, com, lgt, per, fin, cnt, adm, col, aca, med, bka
GRANT SELECT, INSERT, UPDATE ON TABLES TO usr_igest;

-- Permisos por defecto para secuencias
ALTER DEFAULT PRIVILEGES IN SCHEMA gen, com, lgt, per, fin, cnt, adm, col, aca, med, bka
GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO usr_igest;

-- Permisos por defecto para funciones
ALTER DEFAULT PRIVILEGES IN SCHEMA public, gen, com, lgt, per, fin, cnt, adm, col, aca, med, bka
GRANT EXECUTE ON ROUTINES TO usr_igest;



-- =============================================
-- TABLA DE AUDITORÍA UNIFICADA (POR ESQUEMA)
-- =============================================

-- Función para crear tabla de auditoría en cada esquema
CREATE OR REPLACE FUNCTION crear_auditoria_esquema(nombre_esquema TEXT)
RETURNS void AS $$
DECLARE
    sql_query TEXT;
BEGIN
    sql_query := format('
        DROP TABLE IF EXISTS %1$I.auditoria;

        CREATE TABLE %1$I.auditoria (
            id_auditoria    BIGSERIAL,
            anio            INT NOT NULL,
            nom_entidad     VARCHAR(50) NOT NULL,
            id_entidad      BIGINT,
            operacion       VARCHAR(10) NOT NULL CHECK (operacion IN (''UPDATE'', ''DELETE'')),
            id_usuario      BIGINT,
            nom_usuario     VARCHAR(50),
            ip              INET,
            host            VARCHAR(100),
            dispositivo     VARCHAR(100),
            fe_oper         DATE DEFAULT CURRENT_DATE,
            fh_oper         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            valores         JSONB NOT NULL,
            PRIMARY KEY (id_auditoria, anio)
        ) PARTITION BY LIST (anio);
        
        CREATE INDEX IF NOT EXISTS %1$s_auditoria_idx 
        ON %1$I.auditoria (nom_entidad, id_entidad, nom_usuario, fe_oper);
               
        COMMENT ON TABLE %1$I.auditoria IS ''Tabla de auditoría para el esquema %1$s.'';
        COMMENT ON COLUMN %1$I.auditoria.id_auditoria IS ''Identificador de entidad.'';
        COMMENT ON COLUMN %1$I.auditoria.anio IS ''Año de operación.'';
        COMMENT ON COLUMN %1$I.auditoria.nom_entidad IS ''Nombre de la tabla.'';
        COMMENT ON COLUMN %1$I.auditoria.id_entidad IS ''Valor del identificador de la tabla.'';
        COMMENT ON COLUMN %1$I.auditoria.operacion IS ''Operación en la BD: UPDATE, DELETE.'';
        COMMENT ON COLUMN %1$I.auditoria.id_usuario IS ''Identificador del usuario que opera.'';
        COMMENT ON COLUMN %1$I.auditoria.nom_usuario IS ''Nombre del usuario que opera.'';
        COMMENT ON COLUMN %1$I.auditoria.ip IS ''IP del dispositivo.'';
        COMMENT ON COLUMN %1$I.auditoria.host IS ''Nombre del dispositivo.'';
        COMMENT ON COLUMN %1$I.auditoria.dispositivo IS ''Tipo de dispositivo / Sistema Operativo y/o versión.'';
        COMMENT ON COLUMN %1$I.auditoria.fe_oper IS ''Fecha de operación.'';
        COMMENT ON COLUMN %1$I.auditoria.fh_oper IS ''Fecha y hora de operación.'';
        COMMENT ON COLUMN %1$I.auditoria.valores IS ''Todos los valores (columnas) del registro.'';
    ', nombre_esquema);
    
    EXECUTE sql_query;
END;
$$ LANGUAGE plpgsql;

-- Crear tablas de auditoría en cada esquema
SELECT crear_auditoria_esquema('gen');
SELECT crear_auditoria_esquema('com');
SELECT crear_auditoria_esquema('lgt');
SELECT crear_auditoria_esquema('per');
SELECT crear_auditoria_esquema('fin');
SELECT crear_auditoria_esquema('cnt');
SELECT crear_auditoria_esquema('adm');
SELECT crear_auditoria_esquema('col');
SELECT crear_auditoria_esquema('aca');
SELECT crear_auditoria_esquema('med');
SELECT crear_auditoria_esquema('bka');



-- =============================================
-- CREACIÓN DE PARTICIONES DE AUDITORÍA
-- =============================================

-- Función para crear particiones en cada esquema
CREATE OR REPLACE FUNCTION crear_particiones_auditoria(
    nombre_esquema TEXT,
    anio_inicio INT,
    anio_fin INT
)
RETURNS void AS $$
DECLARE
    anio INT;
BEGIN
    FOR anio IN anio_inicio..anio_fin LOOP
        EXECUTE format('
            CREATE TABLE IF NOT EXISTS %1$I.auditoria_%2$s
            PARTITION OF %1$I.auditoria
            FOR VALUES IN (%2$s);',
            nombre_esquema, anio
        );
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Crear particiones en cada esquema (2025-2030)
SELECT crear_particiones_auditoria('gen', 2025, 2030);
SELECT crear_particiones_auditoria('com', 2025, 2030);
SELECT crear_particiones_auditoria('lgt', 2025, 2030);
SELECT crear_particiones_auditoria('per', 2025, 2030);
SELECT crear_particiones_auditoria('fin', 2025, 2030);
SELECT crear_particiones_auditoria('cnt', 2025, 2030);
SELECT crear_particiones_auditoria('adm', 2025, 2030);
SELECT crear_particiones_auditoria('col', 2025, 2030);
SELECT crear_particiones_auditoria('aca', 2025, 2030);
SELECT crear_particiones_auditoria('med', 2025, 2030);
SELECT crear_particiones_auditoria('bka', 2025, 2030);



-- =============================================
-- CONFIGURACIÓN FINAL
-- =============================================
ALTER DATABASE db_igest SET timezone TO 'America/Lima';			-- Zona horaria de la base de datos
ALTER DATABASE db_igest SET log_min_duration_statement = 1000;	-- Registrar consultas que duren más de 1 segundo (1000 ms)



-- Habilitar y configurar en producción pg_stat_statements
-- Habilitar y configurar en producción pg_stat_statements
-- Habilitar y configurar en producción pg_stat_statements



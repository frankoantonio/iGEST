-- ============================================================================
-- TABLA: gen.empresa_sistema
-- ============================================================================
DROP TABLE IF EXISTS gen.empresa_sistema CASCADE;
CREATE TABLE gen.empresa_sistema (
	id_emp_sis			SERIAL			NOT NULL PRIMARY KEY,
	id_empresa			INT				NOT NULL,
	id_sistema			CHAR(3)			NOT NULL,
	activo				BOOLEAN			NOT NULL,
	solo_lectura		BOOLEAN			NOT NULL,
	id_tipo_edition		INT				NOT NULL,
	us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
	UNIQUE (id_empresa, id_sistema),
	CONSTRAINT empresa_sistema_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES gen.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT empresa_sistema_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES gen.sistema(id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.empresa_sistema IS 'Sistemas por cada empresa.';
COMMENT ON COLUMN gen.empresa_sistema.id_emp_sis IS 'Identificador de entidad.';
COMMENT ON COLUMN gen.empresa_sistema.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.empresa_sistema.id_sistema IS 'Identificador de sistema [GEN.SISTEMA].';
COMMENT ON COLUMN gen.empresa_sistema.activo IS 'Indica sí  el sistema está activo para la empresa.';
COMMENT ON COLUMN gen.empresa_sistema.solo_lectura IS 'Indica sí el sistema está en modo solo lectura para la empresa.';
COMMENT ON COLUMN gen.empresa_sistema.id_tipo_edition IS 'Identificador del tipo de edición [GEN.TIPO/TI_EDITION].';
COMMENT ON COLUMN gen.empresa_sistema.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.empresa_sistema.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.empresa_sistema.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.empresa_sistema (id_empresa, id_sistema, activo, solo_lectura, id_tipo_edition, us_registra, ip_registra)
VALUES
(1001, 'GEN', true ,  false, 10052 , 'dba' , 'localhost'), -- YSST
(1001, 'COM', true ,  false, 10052 , 'dba' , 'localhost'),
(1001, 'LGT', true ,  false, 10052 , 'dba' , 'localhost'),
(1001, 'PER', true ,  false, 10052 , 'dba' , 'localhost'),
(1001, 'FIN', true ,  false, 10052 , 'dba' , 'localhost'),
(1001, 'CNT', true ,  false, 10052 , 'dba' , 'localhost'),
(1001, 'ADM', true ,  false, 10052 , 'dba' , 'localhost'),
				   
(1002, 'GEN', true ,  false, 10052 , 'dba' , 'localhost'), -- BAZAR
(1002, 'COM', true ,  false, 10052 , 'dba' , 'localhost'),
(1002, 'LGT', true ,  false, 10052 , 'dba' , 'localhost'),
(1002, 'PER', true ,  false, 10050 , 'dba' , 'localhost'),
(1002, 'FIN', true ,  false, 10050 , 'dba' , 'localhost'),
				   
(1003, 'GEN', true ,  false, 10052 , 'dba' , 'localhost'), -- EDITORIAL
(1003, 'COM', true ,  false, 10052 , 'dba' , 'localhost'),
(1003, 'LGT', true ,  false, 10052 , 'dba' , 'localhost'),
(1003, 'PER', true ,  false, 10050 , 'dba' , 'localhost'),
(1003, 'FIN', true ,  false, 10050 , 'dba' , 'localhost'),
				   
(1004, 'GEN', true ,  false, 10052 , 'dba' , 'localhost'), -- COLE
(1004, 'COM', true ,  false, 10052 , 'dba' , 'localhost'),
(1004, 'LGT', true ,  false, 10052 , 'dba' , 'localhost'),
(1004, 'PER', true ,  false, 10052 , 'dba' , 'localhost'),
(1004, 'FIN', true ,  false, 10052 , 'dba' , 'localhost'),
(1004, 'CNT', true ,  false, 10052 , 'dba' , 'localhost'),
(1004, 'ADM', true ,  false, 10052 , 'dba' , 'localhost'),
(1004, 'COL', true ,  false, 10052 , 'dba' , 'localhost'),
(1004, 'ACA', true ,  false, 10052 , 'dba' , 'localhost'),
				   
(1005, 'GEN', true ,  false, 10052 , 'dba' , 'localhost'), -- SABAL
(1005, 'COM', true ,  false, 10052 , 'dba' , 'localhost'),
(1005, 'LGT', true ,  false, 10052 , 'dba' , 'localhost'),
(1005, 'PER', true ,  false, 10052 , 'dba' , 'localhost'),
(1005, 'FIN', false,  false, 10052 , 'dba' , 'localhost'),
(1005, 'CNT', false,  false, 10052 , 'dba' , 'localhost'),
(1005, 'ADM', false,  false, 10052 , 'dba' , 'localhost'),
(1005, 'MED', true ,  false, 10052 , 'dba' , 'localhost'),

(1006, 'GEN', true ,  false, 10052 , 'dba' , 'localhost'), -- CLA
(1006, 'COM', true ,  false, 10052 , 'dba' , 'localhost'),
(1006, 'LGT', true ,  false, 10052 , 'dba' , 'localhost'),
(1006, 'PER', true ,  false, 10052 , 'dba' , 'localhost'),
(1006, 'FIN', true ,  false, 10052 , 'dba' , 'localhost'),
(1006, 'CNT', true ,  false, 10052 , 'dba' , 'localhost'),
(1006, 'ADM', true ,  false, 10052 , 'dba' , 'localhost'),
(1006, 'BKA', true ,  false, 10052 , 'dba' , 'localhost');



-- ============================================================================
-- TABLA: gen.sede
-- ============================================================================
DROP TABLE IF EXISTS gen.sede CASCADE;
CREATE TABLE gen.sede (
	id_sede				SERIAL			NOT NULL PRIMARY KEY,
	id_padre			INT				NOT NULL,
	id_empresa			INT				NOT NULL,
	nivel				INT				NOT NULL,
	id_tipo_sede		INT				NOT NULL,
	nom_sede			VARCHAR(50)		NOT NULL,
	dir_sede			VARCHAR(100)	NOT NULL,
	id_distrito			CHAR(6)			NOT NULL,
	activo				BOOLEAN			NOT NULL,
	sunat_oficial		BOOLEAN			NOT NULL,
	sunat_cod			VARCHAR(10)		NOT NULL,
	fac_ele_ruta		VARCHAR(250)	NOT NULL,
	fac_ele_token		VARCHAR(250)	NOT NULL,
	latitud				VARCHAR(25)		NOT NULL,
	longitud			VARCHAR(25)		NOT NULL,
	orden				INT				NOT NULL,
	contacto			VARCHAR(100)	NOT NULL,
	us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,	
	CONSTRAINT sede_id_distrito_fkey FOREIGN KEY (id_distrito) REFERENCES gen.distrito(id_distrito) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT sede_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES gen.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
ALTER SEQUENCE gen.sede_id_sede_seq RESTART WITH 31;
--
COMMENT ON TABLE gen.sede IS 'Lugares geográficos donde funciona la empresa.';
COMMENT ON COLUMN gen.sede.id_sede IS 'Identificador de la sede.';
COMMENT ON COLUMN gen.sede.id_padre IS 'Identificador de la sede padre. Valor -1 para indicar ninguno [GEN.SEDE].';
COMMENT ON COLUMN gen.sede.id_empresa IS 'Identificador de la empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.sede.nivel IS 'Nivel dentro de cada empresa, empieza en uno.';
COMMENT ON COLUMN gen.sede.id_tipo_sede IS 'Identificador del tipo de sede [GEN.TIPO/TI_SEDE].';
COMMENT ON COLUMN gen.sede.nom_sede IS 'Código o nombre del local o sede.';
COMMENT ON COLUMN gen.sede.dir_sede IS 'Dirección, si queda en blanco, se muestra dirección de empresa.';
COMMENT ON COLUMN gen.sede.id_distrito IS 'Identificador del distrito [GEN.DISTRITO].';
COMMENT ON COLUMN gen.sede.activo IS 'Indica si la sede está activa o vigente.';
COMMENT ON COLUMN gen.sede.sunat_oficial IS 'Si la sede está registrada en la SUNAT.';
COMMENT ON COLUMN gen.sede.sunat_cod IS 'Código que asigna la SUNAT a las sedes.';
COMMENT ON COLUMN gen.sede.fac_ele_ruta IS 'Ruta para comprobantes electrónicos.';
COMMENT ON COLUMN gen.sede.fac_ele_token IS 'Token para comprobantes electrónicos.';
COMMENT ON COLUMN gen.sede.latitud IS 'Coordenada latitud en formato WGS84.';
COMMENT ON COLUMN gen.sede.longitud IS 'Coordenada longitud en formato WGS84.';
COMMENT ON COLUMN gen.sede.orden IS 'Orden en que se muestran.';
COMMENT ON COLUMN gen.sede.contacto IS 'Algún dato de contacto de la sede: teléfono, celular, correo.';
COMMENT ON COLUMN gen.sede.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.sede.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.sede.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.sede (id_sede, id_padre, id_empresa, nivel, id_tipo_sede, nom_sede, dir_sede, id_distrito, activo, sunat_oficial, sunat_cod, fac_ele_ruta, fac_ele_token, latitud, longitud, orden, contacto, us_registra, ip_registra)
VALUES 	
( 1,   -1,  1001,   1,  10064,  'LOCAL HUANCAYO'						, ''													, '110113' , true , true  , ''	    , '', '' , '' , '' ,   1 , '' , 'dba' , 'localhost'),	--YSST
( 2,   -1,  1002,   1,  10064,  'LOCAL HUANCAYO' 						, ''													, '110101' , true , true  , ''	    , '', '' , '' , '' ,   1 , '' , 'dba' , 'localhost'),	--BAZAR
( 3,   -1,  1003,   1,  10064,  'LOCAL HUANCAYO'						, ''													, '110101' , true , true  , ''	    , '', '' , '' , '' ,   1 , '' , 'dba' , 'localhost'),	--EDITORIAL
( 4,   -1,  1004,   1,  10064,  'LOCAL CUZCO 779'						, ''													, '110101' , true , true  , ''	    , '', '' , '' , '' ,   1 , '' , 'dba' , 'localhost'),	--COLEGIO
( 5,   -1,  1004,   1,  10064,  'LOCAL CUZCO 879'						, 'JR. CUZCO NRO. 879 - HUANCAYO'						, '110101' , true , true  , ''	    , '', '' , '' , '' ,   2 , '' , 'dba' , 'localhost'),
( 6,   -1,  1004,   1,  10064,  'LOCAL JUNÍN 111'						, 'JR. JUNÍN NRO. 111 - HUANCAYO'						, '110101' , true , true  , ''	    , '', '' , '' , '' ,   3 , '' , 'dba' , 'localhost'),
( 7,   -1,  1004,   1,  10064,  'LOCAL JUNÍN 215'						, 'JR. JUNÍN NRO. 215 - HUANCAYO'						, '110101' , true , true  , '0003'  , '', '' , '' , '' ,   4 , '' , 'dba' , 'localhost'),
( 8,   -1,  1004,   1,  10064,  'LOCAL LIBERTAD 205'					, 'JR. LIBERTAD NRO. 205 - HUANCAYO'					, '110101' , true , true  , '0001'  , '', '' , '' , '' ,   5 , '' , 'dba' , 'localhost'),
( 9,   -1,  1004,   1,  10064,  'LOCAL PUNO 555'						, 'JR. PUNO NRO. 555 - HUANCAYO'						, '110101' , true , true  , '0002'  , '', '' , '' , '' ,   6 , '' , 'dba' , 'localhost'),
(10,   -1,  1004,   1,  10064,  'LOCAL PAMPAS, NTRA. SEÑORA LOURDES'	, 'AV. PROGRESO NRO. 252 - PAMPAS, TAYACAJA'			, '080501' , true , false , ''      , '', '' , '' , '' ,   3 , '' , 'dba' , 'localhost'),
(11,   -1,  1004,   1,  10064,  'LOCAL JAUJA, VIRGEN CARMEN'			, 'JR. LA MAR NRO. 790 - JAUJA'							, '110301' , true , true  , '0010'  , '', '' , '' , '' ,   4 , '' , 'dba' , 'localhost'),
(12,   -1,  1005,   1,  10064,  'LOCAL HUANCAYO PRINCIPAL'				, ''													, '110101' , true , true  , ''  	, '', '' , '' , '' ,   1 , '' , 'dba' , 'localhost'),	--SABAL
(13,   -1,  1005,   1,  10064,  'LOCAL HUANCAYO SUCURSAL'				, 'JR. FRANCISCO SOLANO NRO. 142 INT. 203 - HUANCAYO'	, '110101' , true , true  , ''  	, '', '' , '' , '' ,   1 , '' , 'dba' , 'localhost'),	--SABAL
(14,   -1,  1006,   1,  10060,  'PERÚ'									, 'JR. JUNIN NRO. 129 - PUNO'							, '080501' , true , true  , '0011'  , '', '' , '' , '' ,   1 , '' , 'dba' , 'localhost'),	--CLA
(15,   19,  1006,   2,  10061,  'ZONA NORTE'							, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 100 , '' , 'dba' , 'localhost'),
(16,   19,  1006,   2,  10061,  'ZONA CENTRO'							, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 200 , '' , 'dba' , 'localhost'),
(17,   19,  1006,   2,  10061,  'ZONA SUR'								, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 300 , '' , 'dba' , 'localhost'),
(18,   19,  1006,   2,  10061,  'ZONA ORIENTE'							, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 400 , '' , 'dba' , 'localhost'),
(19,   21,  1006,   3,  10062,  'SEDE LIMA'								, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 210 , '' , 'dba' , 'localhost'),
(20,   21,  1006,   3,  10062,  'SEDE HUANCAYO'							, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 220 , '' , 'dba' , 'localhost'),
(21,   21,  1006,   3,  10062,  'SEDE TARMA'							, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 230 , '' , 'dba' , 'localhost'),
(22,   25,  1006,   4,  10063,  'AGENCIA MERCADO'						, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 221 , '' , 'dba' , 'localhost'),
(23,   25,  1006,   4,  10063,  'AGENCIA SAN CARLOS'					, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 222 , '' , 'dba' , 'localhost'),
(24,   25,  1006,   4,  10063,  'AGENCIA CERCADO HYO'					, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 223 , '' , 'dba' , 'localhost'),
(25,   29,  1006,   5,  10065,  'AGENCIA PARIAHUANCA'					, ''													, '080501' , true , true  , '0011'  , '', '' , '' , '' , 224 , '' , 'dba' , 'localhost');



-- ============================================================================
-- TABLA: gen.und_negocio
-- ============================================================================
DROP TABLE IF EXISTS gen.und_negocio CASCADE;
CREATE TABLE gen.und_negocio (
	id_und_neg			SERIAL			NOT NULL PRIMARY KEY,
	uuid_und_neg		UUID			NOT NULL UNIQUE DEFAULT gen_random_uuid(),
	id_empresa			INT				NOT NULL,
	nom_comercial		VARCHAR(100)	NOT NULL,
	activo				BOOLEAN			NOT NULL,
	id_tipo_negocio		INT				NOT NULL,
	dominio				VARCHAR(50)		NOT NULL,
	dominio_mail		VARCHAR(50)		NOT NULL,		
	code_name			VARCHAR(25)		NOT NULL UNIQUE,
	CONSTRAINT und_negocio_empresa_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES gen.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT und_negocio_tipo_id_tipo_negocio_fkey FOREIGN KEY (id_tipo_negocio) REFERENCES gen.tipo(id_tipo) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
ALTER SEQUENCE gen.und_negocio_id_und_neg_seq RESTART WITH 1009;
--
COMMENT ON TABLE gen.und_negocio IS 'Unidades de negocio asociadas a cada empresa.';
COMMENT ON COLUMN gen.und_negocio.id_und_neg IS 'Identificador de unidad de negocio.';
COMMENT ON COLUMN gen.und_negocio.uuid_und_neg IS 'Identificador UUID público.';
COMMENT ON COLUMN gen.und_negocio.id_empresa IS 'Identificador de empresa.';
COMMENT ON COLUMN gen.und_negocio.nom_comercial IS 'Nombre comercial o alias de la unidad de negocio.';
COMMENT ON COLUMN gen.und_negocio.activo IS 'Indica si la unidad está activa.';
COMMENT ON COLUMN gen.und_negocio.id_tipo_negocio IS 'Identificador del tipo de negocio [GEN.TIPO/TI_NEGOCIO].';
COMMENT ON COLUMN gen.und_negocio.dominio IS 'Dominio de internet.';
COMMENT ON COLUMN gen.und_negocio.dominio_mail IS 'Dominio del correo.';
COMMENT ON COLUMN gen.und_negocio.code_name IS 'Nombre único de la unidad de negocio.';
--
INSERT INTO gen.und_negocio (id_empresa, nom_comercial, activo, id_tipo_negocio, dominio, dominio_mail, code_name) VALUES 
(1001, 'iGEST'                                      , true , 10000, 'igest.pe' 				, '@igest.pe'			 	, 'yupana'			),
(1002, 'BAZAR LIBRERÍA GERALDINE'                   , true , 10000, '' 					 	, '' 					 	, 'geraldine'		),
(1003, 'MI MUNDO DE LOS LIBROS'                     , true , 10000, '' 					 	, '' 					 	, 'mundodeloslibros'),
(1004, 'COLEGIO PARTICULAR SAN JUAN BOSCO'          , true , 10001, 'sanjuanbosco.edu.pe'	, '@sanjuanbosco.edu.pe'	, 'sanjuanbosco'	),
(1004, 'ACADEMIA PREUNIVERSITARIA SAN FERNANDO'     , true , 10002, 'sanfernando.edu.pe' 	, '@sanjuanbosco.edu.pe'	, 'sanfernando'		),
(1004, 'POLIDEPORTIVO SAN JUAN BOSCO'               , true , 10000, ''                   	, '@sanjuanbosco.edu.pe'	, 'polideportivosjb'),
(1005, 'CENTRO MÉDICO CASA DEL NIÑO Y LA MADRE'     , true , 10003, 'casadelninoylamadre.pe', '@casadelninoylamadre.pe'	, 'casadelniño'		),
(1006, 'CAJA LOS ANDES'                             , false, 10004, '' 					 	, '' 					 	, 'losandes'		);



-- ============================================================================
-- TABLA: gen.und_negocio_sede
-- ============================================================================
DROP TABLE IF EXISTS gen.und_negocio_sede CASCADE;
CREATE TABLE gen.und_negocio_sede (
    id_und_neg_sede		SERIAL 	NOT NULL PRIMARY KEY,
    id_empresa 			INTEGER NOT NULL,
    id_und_neg 			INTEGER NOT NULL REFERENCES gen.und_negocio(id_und_neg),
    id_sede 			INTEGER NOT NULL,
    activo 				BOOLEAN NOT NULL,
	us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,	    
    UNIQUE(id_und_neg, id_sede)
);
--
COMMENT ON COLUMN gen.sede.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.sede.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.sede.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--


-- ============================================================================
-- TABLA: gen.und_negocio_sistema
-- ============================================================================
DROP TABLE IF EXISTS gen.und_negocio_sistema CASCADE;
CREATE TABLE gen.und_negocio_sistema (
    id_und_neg_sis		SERIAL  NOT NULL PRIMARY KEY,
    id_und_neg 			INTEGER NOT NULL REFERENCES gen.und_negocio(id_und_neg),
    id_sistema 			CHAR(3) NOT NULL, --REFERENCES gen.sistema(id_sistema),
    activo 				BOOLEAN NOT NULL,
    UNIQUE(id_und_neg, id_sistema)
);



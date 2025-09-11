-- ============================================================================
-- TABLA: gen.direccion
-- ============================================================================
DROP TABLE IF EXISTS gen.direccion CASCADE;
CREATE TABLE gen.direccion (
	id_direccion		BIGSERIAL		NOT NULL PRIMARY KEY,
	corrido				BOOLEAN			NOT NULL,
	id_tipo_via			INT				NOT NULL,
	nom_tipo_via		VARCHAR(25)		NOT NULL,
	nom_via				VARCHAR(150)	NOT NULL,
	id_tipo_zona		INT				NOT NULL,
	nom_tipo_zona		VARCHAR(25)		NOT NULL,
	nom_zona			VARCHAR(50)		NOT NULL,
	referencia			VARCHAR(150)	NOT NULL,
	id_pais				INT				NOT NULL,
	id_distrito			CHAR(6)			NOT NULL,
	latitud				VARCHAR(25)		NOT NULL,
	longitud			VARCHAR(25)		NOT	NULL,
	id_empresa			INT				NOT NULL,
	us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
	CONSTRAINT direccion_id_distrito_fkey FOREIGN KEY (id_distrito) REFERENCES gen.distrito(id_distrito) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
CREATE UNIQUE INDEX ON gen.direccion (id_empresa, id_distrito, id_tipo_zona, id_tipo_via, fn_unaccent(nom_via));
CREATE INDEX ON gen.direccion(id_pais);
--
COMMENT ON TABLE gen.direccion IS 'Tabla de direcciones.';
COMMENT ON COLUMN gen.direccion.id_direccion IS 'Identificador de dirección.';
COMMENT ON COLUMN gen.direccion.corrido IS 'Indica si toda la dirección irá en la columna "nom_via".';
COMMENT ON COLUMN gen.direccion.id_tipo_via IS 'Identificador del tipo de vía [GEN.TIPO/TI_VIA].';
COMMENT ON COLUMN gen.direccion.nom_tipo_via IS 'Abreviatura del tipo de vía.';
COMMENT ON COLUMN gen.direccion.nom_via IS 'Nombre de la vía o dirección.';
COMMENT ON COLUMN gen.direccion.id_tipo_zona IS 'Identificador del tipo de zona [GEN.TIPO/TI_ZONA].';
COMMENT ON COLUMN gen.direccion.nom_tipo_zona IS 'Abreviatura del tipo de zona.';
COMMENT ON COLUMN gen.direccion.nom_zona IS 'Nombre de la zona.';
COMMENT ON COLUMN gen.direccion.referencia IS 'Referencia de la dirección.';
COMMENT ON COLUMN gen.direccion.id_pais IS 'Identificador del país [GEN.PAIS].';
COMMENT ON COLUMN gen.direccion.id_distrito IS 'Identificador del distrito [GEN.DISTRITO].';
COMMENT ON COLUMN gen.direccion.latitud IS 'Coordenada latitud en formato WGS84.';
COMMENT ON COLUMN gen.direccion.longitud IS 'Coordenada longitud en formato WGS84.';
COMMENT ON COLUMN gen.direccion.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.direccion.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.direccion.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.direccion.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.direccion (corrido, id_tipo_via, nom_tipo_via, nom_via, id_tipo_zona, nom_tipo_zona, nom_zona, referencia, id_pais, id_distrito, latitud, longitud, id_empresa, us_registra, ip_registra) VALUES
(false, 95071, 'JR.', 'SANTA ISABEL NRO. 2065', 95100, 'URB.', 'MIRAFLORES', 'ENTRE SANTA ISABEL Y SUMAR', 9589, '110113', '-12.0487659256089', '-75.2205508947372', 1004, 'dba', 'localhost');



-- ============================================================================
-- TABLA: gen.persona
-- ============================================================================
DROP TABLE IF EXISTS gen.persona CASCADE;
CREATE TABLE gen.persona (
	id_persona 			BIGSERIAL 		NOT NULL PRIMARY KEY,
	uuid_persona		UUID			NOT NULL UNIQUE DEFAULT gen_random_uuid(),
	id_empresa		 	INT				NOT NULL,
	id_tipo_persona 	INT				NOT NULL,	
	id_tipo_doc_ident 	INT		 		NOT NULL,	
	num_doc_ident		VARCHAR(20) 	NOT NULL,	
	paterno 			VARCHAR(30) 	NOT NULL,
	materno 			VARCHAR(30) 	NOT NULL,
	nombres 			VARCHAR(125) 	NOT NULL,		
	num_ruc_per_nat		VARCHAR(11)		NOT NULL,
	sigla 				VARCHAR(125) 	NOT NULL,	
	validado 			BOOLEAN 		NOT NULL,	
	us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
	UNIQUE (id_empresa, id_tipo_doc_ident, num_doc_ident)	
);
--
CREATE UNIQUE INDEX ON gen.persona (id_empresa, fn_unaccent(paterno), fn_unaccent(materno), fn_unaccent(nombres));
ALTER SEQUENCE gen.persona_id_persona_seq RESTART WITH 18;
--
COMMENT ON TABLE gen.persona IS 'Tabla de personas, empresas, y grupos diversos.'; 
COMMENT ON COLUMN gen.persona.id_persona IS 'Identificador de persona o empresa.';
COMMENT ON COLUMN gen.persona.uuid_persona IS 'UUID único de la persona.';
COMMENT ON COLUMN gen.persona.id_empresa IS 'Identificador de empresa del sistema [GEN.SISTEMA].';
COMMENT ON COLUMN gen.persona.id_tipo_persona IS 'Identificador del tipo de persona [GEN.TIPO/TI_PERSONA].';
COMMENT ON COLUMN gen.persona.id_tipo_doc_ident IS 'Identificador del tipo de documento de identidad [GEN.TIPO/TI_DOC_IDENT].';
COMMENT ON COLUMN gen.persona.num_doc_ident IS 'Número del documento de identidad.';
COMMENT ON COLUMN gen.persona.paterno IS 'Apellido paterno o en blanco si es empresa.';
COMMENT ON COLUMN gen.persona.materno IS 'Apellido materno o en blanco si es empresa.';
COMMENT ON COLUMN gen.persona.nombres IS 'Nombres de la persona o razón social de la empresa.';
COMMENT ON COLUMN gen.persona.num_ruc_per_nat IS 'Si es del tipo persona, registra RUC si lo tiene.';
COMMENT ON COLUMN gen.persona.sigla IS 'Nombre comercial de empresa o persona con RUC.';
COMMENT ON COLUMN gen.persona.validado IS 'Si es true, ya no se puede modificar ciertos datos.';
COMMENT ON COLUMN gen.persona.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.persona.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.persona.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.persona (id_persona, id_empresa, id_tipo_persona, id_tipo_doc_ident, num_doc_ident, paterno, materno, nombres, num_ruc_per_nat, sigla, validado, us_registra, ip_registra) VALUES 
(   0 ,    -1 , 95019,   95049 ,     '-'           ,   ''          , ''            , 'CLIENTES VARIOS'                         ,  ''               , ''                           , true  , 'dba', 'localhost'),

(   1 ,  1001 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'dba' , 'localhost'),
(   2 ,  1001 , 95011,   95032 ,   '20600695771'   ,   ''          , ''            , 'NUBEFACT S.A.'                           ,  ''               , ''                           , true  , 'dba' , 'localhost'),
(   3 ,  1001 , 95011,   95032 ,   '20133746278'   ,   ''          , ''            , 'C.E. SAN JUAN BOSCO S.A.C.'              ,  ''               , ''                           , true  , 'dba' , 'localhost'),
(   4 ,  1001 , 95010,   95030 ,   '07823084'      ,   'YHA'       , 'GIBU'        , 'TAMMY GERALDINE'                         ,  '10078230849'    , 'LIBRERÍA BAZAR GERALDINE'   , true  , 'dba' , 'localhost'),
(   5 ,  1001 , 95010,   95030 ,   '07826812'      ,   'SALAZAR'   , 'LOAYZA'      , 'MIGUEL ANGEL'                            ,  '10078268129'    , 'MUNDO DE LOS LIBROS'        , true  , 'dba' , 'localhost'),
(   6 ,  1001 , 95011,   95032 ,   '20605817123'   ,   ''          , ''            , 'GRUPO SABAL S.A.C.'                      ,  ''               , 'CASA DEL NIÑO Y LA MADRE'   , true  , 'dba' , 'localhost'),

(   7 ,  1002 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'dba' , 'localhost'),
(   8 ,  1003 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'dba' , 'localhost'),

(   9 ,  1004 , 95010,   95030 ,   '20121955'      ,   'SALAZAR'   , 'SAAVEDRA'    , 'SARA SAIDA'                              ,  ''               , ''                           , true  , 'dba' , 'localhost'),
(  10 ,  1004 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'dba' , 'localhost'),
(  11 ,  1004 , 95010,   95030 ,   '41330439'      ,   'SINCHE'    , 'BARRA'       , 'YENNY GIOVANNA'                          ,  ''               , ''                           , true  , 'dba' , 'localhost'),
(  12 ,  1004 , 95010,   95030 ,   '71326982'      ,   'ARROYO'    , 'QUINTANA'    , 'SHIRLEY ELIZABETH'                       ,  ''               , ''                           , true  , 'dba' , 'localhost'),
(  13 ,  1004 , 95010,   95030 ,   '44681435'      ,   'SOLANO'    , 'SULCA'       , 'MARISA DIANA'                            ,  ''               , ''                           , true  , 'dba' , 'localhost'),
(  14 ,  1004 , 95011,   95032 ,   '20603133111'   ,   ''          , ''            , 'YUPANA STUDIO E.I.R.L'                   ,  ''               , ''                           , true  , 'dba' , 'localhost'),

(  15 ,  1005 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'dba' , 'localhost'),
(  16 ,  1007 , 95010,   95030 ,   '20121955'      ,   'SALAZAR'   , 'LOAYZA'      , 'FELIPE ARTURO'                           ,  ''               , ''                           , true  , 'dba' , 'localhost'),

(  17 ,  1006 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'dba' , 'localhost');



-- ============================================================================
-- TABLA: gen.lugar_nacimiento
-- ============================================================================
DROP TABLE IF EXISTS gen.lugar_nacimiento CASCADE;
CREATE TABLE gen.lugar_nacimiento (
    id_persona          BIGINT          NOT NULL PRIMARY KEY,
    id_empresa		 	INT				NOT NULL,
    id_pais             INT             NOT NULL,
    id_distrito         CHAR(6)         NOT NULL,
    nom_lugar           VARCHAR(50)     NOT NULL,
    fe_nacimiento       DATE            NOT NULL,
    us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
    CONSTRAINT lugar_nacimiento_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
CREATE INDEX ON gen.lugar_nacimiento (id_pais);
CREATE INDEX ON gen.lugar_nacimiento (id_distrito);
--
COMMENT ON TABLE gen.lugar_nacimiento IS 'Lugar y fecha de nacimiento.';
COMMENT ON COLUMN gen.lugar_nacimiento.id_persona IS 'Identificador de persona [GEN.PERSONA].';
COMMENT ON COLUMN gen.lugar_nacimiento.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.lugar_nacimiento.id_pais IS 'Identificador de país [GEN.PAIS].';
COMMENT ON COLUMN gen.lugar_nacimiento.id_distrito IS 'Identificador de distrito [GEN.DISTRITO].';
COMMENT ON COLUMN gen.lugar_nacimiento.nom_lugar IS 'Nombre del centro poblado u otra observación específica.';
COMMENT ON COLUMN gen.lugar_nacimiento.fe_nacimiento IS 'Fecha de nacimiento.';
COMMENT ON COLUMN gen.lugar_nacimiento.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.lugar_nacimiento.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.lugar_nacimiento.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.lugar_nacimiento (id_persona, id_empresa, id_pais, id_distrito, nom_lugar, fe_nacimiento, us_registra, ip_registra) VALUES
( 9, 1004, 9589, '140133', 'Fecha Real Nac. 21 JUL 1978'        , '1978-09-08', 'dba', 'localhost'),
(10, 1004, 9589, '110501', ''                                   , '1978-10-20', 'dba', 'localhost');



-- ============================================================================
-- TABLA: gen.contacto
-- ============================================================================
DROP TABLE IF EXISTS gen.contacto CASCADE;
CREATE TABLE gen.contacto (
	id_contacto			BIGSERIAL		NOT NULL PRIMARY KEY,
	id_empresa		 	INT				NOT NULL,
	id_tipo_grp_per		INT				NOT NULL,
	id_entidad			BIGINT			NOT NULL,
	id_direccion		BIGINT			NULL,
	correo_pri			VARCHAR(100)	NOT NULL,
	correo_aux			VARCHAR(100)	NOT NULL,
	celular_pri			VARCHAR(25)		NOT NULL,
	celular_aux			VARCHAR(25)		NOT NULL,
	telefono_fijo		VARCHAR(25)		NOT NULL,
	us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
	CONSTRAINT contacto_id_entidad_fkey FOREIGN KEY (id_entidad) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT contacto_id_direccion_fkey FOREIGN KEY (id_direccion) REFERENCES gen.direccion(id_direccion) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	UNIQUE (id_tipo_grp_per, id_entidad)
);
--
COMMENT ON TABLE gen.contacto IS 'Datos de contacto centralizados.';
COMMENT ON COLUMN gen.contacto.id_contacto IS 'Identificador de contacto.';
COMMENT ON COLUMN gen.contacto.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.contacto.id_tipo_grp_per IS 'Identificador del tipo de grupo de persona [GEN.TIPO/TI_GRP_PER].';
COMMENT ON COLUMN gen.contacto.id_entidad IS 'Identificador de la entidad (persona, trabajador, estudiante, etc.) [GEN.PERSONA].';
COMMENT ON COLUMN gen.contacto.id_direccion IS 'Identificador de dirección [GEN.DIRECCION].';
COMMENT ON COLUMN gen.contacto.correo_pri IS 'Correo electrónico principal.';
COMMENT ON COLUMN gen.contacto.correo_aux IS 'Correo electrónico auxiliar.';
COMMENT ON COLUMN gen.contacto.celular_pri IS 'Número de celular principal.';
COMMENT ON COLUMN gen.contacto.celular_aux IS 'Número de celular auxiliar.';
COMMENT ON COLUMN gen.contacto.telefono_fijo IS 'Número de teléfono fijo.';
COMMENT ON COLUMN gen.contacto.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.contacto.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.contacto.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
INSERT INTO gen.contacto (id_empresa, id_tipo_grp_per, id_entidad, id_direccion, correo_pri, correo_aux, celular_pri, celular_aux, telefono_fijo, us_registra, ip_registra) VALUES
(1004, 95120,  9, NULL , 'majachus@gmail.com'       , 'ssalazar@sanjuanbosco.edu.pe'   	, '966308555' , ''             , ''   			, 'dba', 'localhost'),
(1004, 95120, 10,    1 , 'frankoantonio@gmail.com'  , 'fbarzola@sanjuanbosco.edu.pe'   	, '987779695' , '987654321'    , '064-231234'   , 'dba', 'localhost'),
(1004, 95120, 11, NULL , ''          				, 'ysinche@sanjuanbosco.edu.pe'    	, '977111222' , '954321876'    , '064-239876'   , 'dba', 'localhost'),
(1004, 95120, 12, NULL , ''                         , 'sarroyo@sanjuanbosco.edu.pe'    	, '999888777' , '954321876'    , ''             , 'dba', 'localhost'),
(1004, 95120, 13, NULL , ''                         , 'msolano@sanjuanbosco.edu.pe'    	, '988776655' , '943210987'    , ''             , 'dba', 'localhost'),
(1004, 95122, 14, NULL , 'yupanastudio@gmail.com'   , ''         						, '987123789' , '965456123'    , '064-235678'  	, 'dba', 'localhost');



-- ============================================================================
-- TABLA: gen.inst_estudio
-- ============================================================================
DROP TABLE IF EXISTS gen.inst_estudio CASCADE;
CREATE TABLE gen.inst_estudio (
	id_inst_est			SERIAL			NOT NULL PRIMARY KEY,
	id_empresa			INT				NOT NULL,
	id_tipo_inst		INT				NOT NULL,
	sigla				VARCHAR(25)		NOT NULL,
	nombre				VARCHAR(75)		NOT NULL,
	ciudad				VARCHAR(50)		NOT NULL,
	sector				VARCHAR(10)		NOT NULL CHECK (sector IN ('PÚBLICO', 'PRIVADO')),
	us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL
);
--
CREATE UNIQUE INDEX ON gen.inst_estudio (id_empresa, fn_unaccent(nombre), fn_unaccent(ciudad));
ALTER SEQUENCE gen.inst_estudio_id_inst_est_seq RESTART WITH 8;
--
COMMENT ON TABLE gen.inst_estudio IS 'Instituciones de estudio.';
COMMENT ON COLUMN gen.inst_estudio.id_inst_est IS 'Identificador de institución de estudio.';
COMMENT ON COLUMN gen.inst_estudio.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.inst_estudio.id_tipo_inst IS 'Identificador del tipo de institución [GEN.TIPO/TI_INST_EST].';
COMMENT ON COLUMN gen.inst_estudio.sigla IS 'Sigla o abreviatura.';
COMMENT ON COLUMN gen.inst_estudio.nombre IS 'Nombre completo de la institución.';
COMMENT ON COLUMN gen.inst_estudio.ciudad IS 'Ciudad donde se ubica la institución.';
COMMENT ON COLUMN gen.inst_estudio.sector IS 'Sector al que pertenece: PÚBLICO o PRIVADO.';
COMMENT ON COLUMN gen.inst_estudio.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.inst_estudio.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.inst_estudio.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.inst_estudio (id_inst_est, id_empresa, id_tipo_inst, sigla, nombre, ciudad, sector, us_registra, ip_registra) VALUES
( 1, 1004, 95226, 'UPLA'    , 'UNIVERSIDAD PERUANA LOS ANDES'           , 'HUANCAYO'    , 'PRIVADO' , 'dba', 'localhost'),
( 2, 1004, 95226, 'UNCP'    , 'UNIVERSIDAD DEL CENTRO DEL PERÚ'         , 'HUANCAYO'    , 'PÚBLICO' , 'dba', 'localhost'),
( 3, 1004, 95226, 'UTP'     , 'UNIVERSIDAD TECNOLÓGICA DEL PERÚ'        , ''        	, 'PRIVADO' , 'dba', 'localhost'),
( 4, 1004, 95220, ''        , 'COLEGIO SANTA ISABEL'                    , 'HUANCAYO'    , 'PRIVADO' , 'dba', 'localhost'),
( 5, 1004, 95220, ''        , 'COLEGIO SAN JUAN BOSCO'                  , 'HUANCAYO'    , 'PRIVADO' , 'dba', 'localhost'),
( 6, 1004, 95220, ''        , 'COLEGIO NUESTRA SEÑORA DEL ROSARIO'      , 'HUANCAYO'    , 'PRIVADO' , 'dba', 'localhost'),
( 7, 1004, 95220, ''        , 'COLEGIO SAGRADA FAMILIA'                 , 'TARMA'       , 'PRIVADO' , 'dba', 'localhost');



-- ============================================================================
-- TABLA: gen.trabajador
-- ============================================================================
DROP TABLE IF EXISTS gen.trabajador CASCADE;
CREATE TABLE gen.trabajador (
	id_trabajador 			BIGINT 			NOT NULL PRIMARY KEY,
	id_empresa				INT  			NOT NULL,	
	id_tipo_sexo			INT  			NOT NULL,
	id_tipo_est_civil		INT  			NOT NULL,
	id_tipo_vivienda		INT  			NOT NULL,
	id_tipo_viv_material	INT  			NOT NULL,
	id_tipo_viv_condicion	INT  			NOT NULL,
	id_tipo_movilidad		INT  			NOT NULL,
	id_tipo_sit_edu			INT  			NOT NULL,	
	id_inst_egreso			INT  			NULL,
	id_tipo_titulo			INT  			NOT NULL,
	profesion				VARCHAR(50) 	NOT NULL,
	ocupacion				VARCHAR(50) 	NOT NULL,	
	grp_sanguineo			VARCHAR(25) 	NOT NULL CHECK (grp_sanguineo IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
	condicion_medica		VARCHAR(50) 	NOT NULL,		
	contacto_full			VARCHAR(100) 	NOT NULL,
	activo					BOOLEAN			NOT NULL,
	us_registra             VARCHAR(25)     NOT NULL,
    fh_registra             TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra             VARCHAR(25)     NOT NULL,
	CONSTRAINT trabajador_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT trabajador_id_inst_egreso_fkey FOREIGN KEY (id_inst_egreso) REFERENCES gen.inst_estudio(id_inst_est) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
CREATE INDEX ON gen.trabajador (id_tipo_sexo);
CREATE INDEX ON gen.trabajador (id_tipo_est_civil);
CREATE INDEX ON gen.trabajador (id_tipo_vivienda);
CREATE INDEX ON gen.trabajador (id_tipo_viv_material);
CREATE INDEX ON gen.trabajador (id_tipo_viv_condicion);
CREATE INDEX ON gen.trabajador (id_tipo_movilidad);
CREATE INDEX ON gen.trabajador (id_tipo_sit_edu);
CREATE INDEX ON gen.trabajador (id_tipo_titulo);
--
COMMENT ON TABLE gen.trabajador IS 'Trabajadores por empresa.'; 
COMMENT ON COLUMN gen.trabajador.id_trabajador IS 'Identificador de trabajador.';
COMMENT ON COLUMN gen.trabajador.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.trabajador.id_tipo_sexo IS 'Identificador del tipo de sexo [GEN.TIPO/TI_SEXO].';
COMMENT ON COLUMN gen.trabajador.id_tipo_est_civil IS 'Identificador del tipo de estado civil [GEN.TIPO/TI_EST_CIV].';
COMMENT ON COLUMN gen.trabajador.id_tipo_vivienda IS 'Identificador del tipo de vivienda [GEN.TIPO/TI_VIVIENDA].';
COMMENT ON COLUMN gen.trabajador.id_tipo_viv_material IS 'Identificador del tipo de material de la vivienda [GEN.TIPO/TI_VIV_MATERIAL].';
COMMENT ON COLUMN gen.trabajador.id_tipo_viv_condicion IS 'Identificador del tipo de condición de la vivienda [GEN.TIPO/TI_VIV_CONDICION].';
COMMENT ON COLUMN gen.trabajador.id_tipo_movilidad IS 'Identificador del tipo de movilidad con que se desplaza al trabajo [GEN.TIPO/TI_MOVILIDAD].';
COMMENT ON COLUMN gen.trabajador.id_tipo_sit_edu IS 'Identificador del tipo de situación educativa [GEN.TIPO/TI_SIT_EDUC].';
COMMENT ON COLUMN gen.trabajador.id_inst_egreso IS 'Identificador de la institución de egreso [GEN.INSTITUCION].';
COMMENT ON COLUMN gen.trabajador.id_tipo_titulo IS 'Identificador del tipo de título [GEN.TIPO/TI_TITULO].';
COMMENT ON COLUMN gen.trabajador.profesion IS 'Nombre de la profesión que tiene.';
COMMENT ON COLUMN gen.trabajador.ocupacion IS 'Nombre de la actividad a la que se dedica.';
COMMENT ON COLUMN gen.trabajador.grp_sanguineo IS 'Grupo sanguíneo del trabajador (con restricción de valores válidos).';
COMMENT ON COLUMN gen.trabajador.condicion_medica IS 'Condición médica relevante del trabajador.';
COMMENT ON COLUMN gen.trabajador.contacto_full IS 'Información completa de contacto de emergencia (nombres, celular, parentesco).';
COMMENT ON COLUMN gen.trabajador.activo IS 'Indica sí el trabajador es un personal activo/vigente.';
COMMENT ON COLUMN gen.trabajador.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.trabajador.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.trabajador.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.trabajador (id_trabajador, id_empresa, id_tipo_sexo, id_tipo_est_civil, id_tipo_vivienda, id_tipo_viv_material, id_tipo_viv_condicion, id_tipo_movilidad, 
	id_tipo_sit_edu, id_inst_egreso, id_tipo_titulo, profesion, ocupacion, grp_sanguineo, condicion_medica, contacto_full, activo, us_registra, ip_registra) VALUES 
( 9, 1004, 95021, 95141, 95151, 95160, 95170, 95183, 95203, NULL, 95232, 'ADMINISTRACIÓN Y MARKETING'    , 'EMPLEADA' , 'O+' , '' 						, ''											, true, 'dba', 'localhost'),	--sara
(10, 1004, 95020, 95141, 95151, 95160, 95171, 95183, 95203,    1, 95236, 'INGENIERÍA DE SISTEMAS'        , 'EMPLEADO' , 'AB+', 'SORDERA OIDO IZQUIERDO' , 'Lily Barzola Olivares | 910568458 | HERMANA'	, true, 'dba', 'localhost'),	--franklin
(11, 1004, 95021, 95140, 95151, 95160, 95171, 95184, 95200, NULL, 95232, 'ADMINISTRACIÓN Y MARKETING'    , 'EMPLEADA' , 'O+' , '' 						, ''											, true, 'dba', 'localhost'),	--yenny
(12, 1004, 95021, 95141, 95150, 95160, 95170, 95183, 95204, NULL, 95232, 'ADMINISTRACIÓN'                , 'EMPLEADA' , 'O+' , '' 						, ''											, true, 'dba', 'localhost');	--shirley



-- ============================================================================
-- TABLA: gen.socio_comercial
-- ============================================================================
DROP TABLE IF EXISTS gen.socio_comercial CASCADE;
CREATE TABLE gen.socio_comercial (
	id_socio					BIGINT			NOT NULL PRIMARY KEY,
	id_empresa					INT  			NOT NULL,
	id_tipo_estado_contrib		INT				NOT NULL,
	id_tipo_condicion_contrib	INT				NOT NULL,
	activo						BOOLEAN			NOT NULL,
	obs							VARCHAR(100)	NOT NULL,
	us_registra					VARCHAR(25)		NOT NULL,
	fh_registra					TIMESTAMP		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ip_registra					VARCHAR(25)		NOT NULL,
	CONSTRAINT socio_comercial_id_socio_fkey FOREIGN KEY (id_socio) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
CREATE INDEX ON gen.socio_comercial (id_empresa);
CREATE INDEX ON gen.socio_comercial (id_tipo_estado_contrib);
CREATE INDEX ON gen.socio_comercial (id_tipo_condicion_contrib);
--
COMMENT ON TABLE gen.socio_comercial IS 'Socios comerciales: clientes y/o proveedores.';
COMMENT ON COLUMN gen.socio_comercial.id_socio IS 'Identificador de socio comercial [GEN.PERSONA].';
COMMENT ON COLUMN gen.socio_comercial.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.socio_comercial.id_tipo_estado_contrib IS 'Identificador del tipo de estado del contribuyente [GEN.TIPO/TI_ESTADO_CONTRIB].';
COMMENT ON COLUMN gen.socio_comercial.id_tipo_condicion_contrib IS 'Identificador del tipo de condición del contribuyente [GEN.TIPO/TI_CONDICION_CONTRIB].';
COMMENT ON COLUMN gen.socio_comercial.activo IS 'Indica si el socio comercial está activo.';
COMMENT ON COLUMN gen.socio_comercial.obs IS 'Alguna observación sobre el socio comercial.';
COMMENT ON COLUMN gen.socio_comercial.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.socio_comercial.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.socio_comercial.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.socio_comercial (id_socio, id_empresa, id_tipo_estado_contrib, id_tipo_condicion_contrib, activo, obs, us_registra, ip_registra) VALUES 
( 14, 1004, 95280, 95290, true, 'FACTURACIÓN ELECTRÓNICA & CLOUD', 'dba', 'localhost');



-- ============================================================================
-- TABLA: gen.estudiante_cole
-- ============================================================================
DROP TABLE IF EXISTS gen.estudiante_cole CASCADE;
CREATE TABLE gen.estudiante_cole (
	id_est_cole             BIGINT          NOT NULL PRIMARY KEY,
	id_empresa              INT             NOT NULL,
	cod_estudiante          VARCHAR(14)     NOT NULL,
	id_tipo_lengua1         INT             NOT NULL,
	id_tipo_lengua2         INT             NOT NULL,
	id_tipo_religion        INT             NOT NULL,
	hnos_lugar              INT             NOT NULL,
	hnos_total              INT             NOT NULL,
	id_tipo_sexo            INT             NOT NULL,
	id_tipo_vivienda        INT             NOT NULL,
	id_tipo_viv_material    INT             NOT NULL,
	id_tipo_viv_condicion   INT             NOT NULL,
	id_tipo_fam_ing         INT             NOT NULL,
	id_tipo_fam_seg         INT             NOT NULL,
	id_tipo_movilidad       INT             NOT NULL,
	activo                  BOOLEAN         NOT NULL,
	grp_sanguineo           VARCHAR(25)     NOT NULL CHECK (grp_sanguineo IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
	condicion_medica        VARCHAR(50)     NOT NULL,
	us_registra             VARCHAR(25)     NOT NULL,
	fh_registra             TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ip_registra             VARCHAR(25)     NOT NULL,
	CONSTRAINT estudiante_cole_id_est_cole_fkey FOREIGN KEY (id_est_cole) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.estudiante_cole IS 'Estudiantes de colegio.';
COMMENT ON COLUMN gen.estudiante_cole.id_est_cole IS 'Identificador de estudiante.';
COMMENT ON COLUMN gen.estudiante_cole.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.estudiante_cole.cod_estudiante IS 'Código que asigna la UGEL al estudiante.';
COMMENT ON COLUMN gen.estudiante_cole.id_tipo_lengua1 IS 'Identificador del idioma materno [GEN.TIPO/TI_LENGUA].';
COMMENT ON COLUMN gen.estudiante_cole.id_tipo_lengua2 IS 'Identificador de un segundo idioma [GEN.TIPO/TI_LENGUA].';
COMMENT ON COLUMN gen.estudiante_cole.id_tipo_religion IS 'Identificador de la religión que profesa [GEN.TIPO/TI_RELIGION].';
COMMENT ON COLUMN gen.estudiante_cole.hnos_lugar IS 'Lugar que ocupa en el total de hermanos.';
COMMENT ON COLUMN gen.estudiante_cole.hnos_total IS 'Total de hermanos.';
COMMENT ON COLUMN gen.estudiante_cole.id_tipo_sexo IS 'Identificador del tipo de sexo [GEN.TIPO/TI_SEXO].';
COMMENT ON COLUMN gen.estudiante_cole.id_tipo_vivienda IS 'Identificador del tipo de vivienda [GEN.TIPO/TI_VIVIENDA].';
COMMENT ON COLUMN gen.estudiante_cole.id_tipo_viv_material IS 'Identificador del material de vivienda [GEN.TIPO/TI_VIV_MATERIAL].';
COMMENT ON COLUMN gen.estudiante_cole.id_tipo_viv_condicion IS 'Identificador de la condición de vivienda [GEN.TIPO/TI_VIV_CONDICION].';
COMMENT ON COLUMN gen.estudiante_cole.id_tipo_fam_ing IS 'Identificador del tipo de ingreso mensual familiar [GEN.TIPO/TI_FAM_INGRESOS].';
COMMENT ON COLUMN gen.estudiante_cole.id_tipo_fam_seg IS 'Identificador del tipo de seguro de salud [GEN.TIPO/TI_FAM_SEGURO].';
COMMENT ON COLUMN gen.estudiante_cole.id_tipo_movilidad IS 'Identificador del tipo de vehículo o movilidad [GEN.TIPO/TI_MOVILIDAD].';
COMMENT ON COLUMN gen.estudiante_cole.activo IS 'Cuando está inactivo no se debe modificar sus datos.';
COMMENT ON COLUMN gen.estudiante_cole.grp_sanguineo IS 'Grupo sanguíneo del estudiante.';
COMMENT ON COLUMN gen.estudiante_cole.condicion_medica IS 'Condición médica relevante.';
COMMENT ON COLUMN gen.estudiante_cole.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.estudiante_cole.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.estudiante_cole.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.estudiante_cole (id_est_cole, id_empresa, cod_estudiante, id_tipo_lengua1, id_tipo_lengua2, id_tipo_religion, hnos_lugar, hnos_total, id_tipo_sexo, id_tipo_vivienda, id_tipo_viv_material, 
	id_tipo_viv_condicion, id_tipo_fam_ing, id_tipo_fam_seg, id_tipo_movilidad, activo, grp_sanguineo, condicion_medica, us_registra, ip_registra) VALUES 
( 9, 1004, '20121955', 95300, 95329, 95330, 2, 5, 95021, 95150, 95160, 95170, 95347, 95361, 95180, true, 'O+', '' , 'dba', 'localhost'),
(10, 1004, '40110805', 95300, 95329, 95330, 2, 5, 95020, 95151, 95160, 95171, 95343, 95361, 95185, true, 'O+', '' , 'dba', 'localhost');



-- ============================================================================
-- TABLA: gen.estudiante_acad
-- ============================================================================
DROP TABLE IF EXISTS gen.estudiante_acad CASCADE;
CREATE TABLE gen.estudiante_acad (
    id_est_acad             BIGINT          NOT NULL PRIMARY KEY,
    id_empresa              INT             NOT NULL,
    cod_estudiante          VARCHAR(20)     NOT NULL,
    id_tipo_sexo            INT             NOT NULL,
    id_tipo_fam_ing         INT             NOT NULL,
    id_tipo_fam_seg         INT             NOT NULL,
    activo                  BOOLEAN         NOT NULL,
    grp_sanguineo           VARCHAR(25)     NOT NULL CHECK (grp_sanguineo IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    condicion_medica        VARCHAR(50)     NOT NULL,
    us_registra             VARCHAR(25)     NOT NULL,
    fh_registra             TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra             VARCHAR(25)     NOT NULL,
    CONSTRAINT estudiante_acad_id_est_acad_fkey FOREIGN KEY (id_est_acad) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.estudiante_acad IS 'Estudiantes de la academia.';
COMMENT ON COLUMN gen.estudiante_acad.id_est_acad IS 'Identificador de estudiante o persona [GEN.PERSONA].';
COMMENT ON COLUMN gen.estudiante_acad.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.estudiante_acad.cod_estudiante IS 'Código que se asigna al estudiante para fichas de exámenes de admisión.';
COMMENT ON COLUMN gen.estudiante_acad.id_tipo_sexo IS 'Identificador del tipo de sexo [GEN.TIPO/TI_SEXO].';
COMMENT ON COLUMN gen.estudiante_acad.id_tipo_fam_ing IS 'Identificador del tipo de ingreso mensual familiar [GEN.TIPO/TI_FAM_INGRESOS].';
COMMENT ON COLUMN gen.estudiante_acad.id_tipo_fam_seg IS 'Identificador del tipo de seguro de salud familiar [GEN.TIPO/TI_FAM_SEGURO].';
COMMENT ON COLUMN gen.estudiante_acad.activo IS 'Cuando está inactivo no se debe modificar sus datos.';
COMMENT ON COLUMN gen.estudiante_acad.grp_sanguineo IS 'Grupo sanguíneo del estudiante.';
COMMENT ON COLUMN gen.estudiante_acad.condicion_medica IS 'Condición médica relevante del estudiante.';
COMMENT ON COLUMN gen.estudiante_acad.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.estudiante_acad.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.estudiante_acad.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.estudiante_acad (id_est_acad, id_empresa, cod_estudiante, id_tipo_sexo, id_tipo_fam_ing, id_tipo_fam_seg, activo, grp_sanguineo, condicion_medica, us_registra, ip_registra) VALUES
( 9, 1004, 'ACD2025001', 95021, 95347, 95361, true, 'A+', '', 'dba', 'localhost'),
(10, 1004, 'ACD2025002', 95020, 95343, 95360, true, 'O-', '', 'dba', 'localhost');



-- ============================================================================
-- TABLA: gen.familiar
-- ============================================================================
DROP TABLE IF EXISTS gen.familiar CASCADE;
CREATE TABLE gen.familiar (
    id_familiar             BIGINT          NOT NULL PRIMARY KEY,
    id_empresa              INT             NOT NULL,
    id_tipo_sexo            INT             NOT NULL,
    id_tipo_est_civil       INT             NOT NULL,
    fallecido               BOOLEAN         NOT NULL,
    id_tipo_sit_edu         INT             NOT NULL,
    id_inst_egreso          INT             NULL,
    activo                  BOOLEAN         NOT NULL,
    ocupacion               VARCHAR(50)     NOT NULL,
    centro_laboral          VARCHAR(50)     NOT NULL,
    centro_laboral_det 		VARCHAR(100)    NOT NULL,
    us_registra             VARCHAR(25)     NOT NULL,
    fh_registra             TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra             VARCHAR(25)     NOT NULL,
    CONSTRAINT familiar_id_familiar_fkey FOREIGN KEY (id_familiar) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.familiar IS 'Familiares que se vincularan a estudiantes.';
COMMENT ON COLUMN gen.familiar.id_familiar IS 'Identificador del familiar [GEN.PERSONA].';
COMMENT ON COLUMN gen.familiar.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.familiar.id_tipo_sexo IS 'Identificador del tipo de sexo [GEN.TIPO/TI_SEXO].';
COMMENT ON COLUMN gen.familiar.id_tipo_est_civil IS 'Identificador del estado civil [GEN.TIPO/TI_EST_CIVIL].';
COMMENT ON COLUMN gen.familiar.fallecido IS 'Indica si el familiar ha fallecido.';
COMMENT ON COLUMN gen.familiar.id_tipo_sit_edu IS 'Identificador de la situación educativa [GEN.TIPO/TI_SIT_EDU].';
COMMENT ON COLUMN gen.familiar.id_inst_egreso IS 'Identificador de la institución educativa de egreso [GEN.INST_ESTUDIO].';
COMMENT ON COLUMN gen.familiar.activo IS 'Cuando está inactivo no se debe modificar sus datos.';
COMMENT ON COLUMN gen.familiar.ocupacion IS 'Ocupación principal del familiar.';
COMMENT ON COLUMN gen.familiar.centro_laboral IS 'Centro de trabajo del familiar.';
COMMENT ON COLUMN gen.familiar.centro_laboral_det IS 'Datos de contacto del centro laboral (teléfono, dirección).';
COMMENT ON COLUMN gen.familiar.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.familiar.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.familiar.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.familiar (id_familiar, id_empresa, id_tipo_sexo, id_tipo_est_civil, fallecido, id_tipo_sit_edu, id_inst_egreso, activo, ocupacion, centro_laboral, centro_laboral_det, us_registra, ip_registra) VALUES
(10, 1004, 95020, 95141, false, 95203, 1, true, 'EMPLEADO', 'SAN JUAN BOSCO', '064 233789', 'dba', 'localhost');



-- ============================================================================
-- TABLA: gen.estudiante_familiar
-- ============================================================================
DROP TABLE IF EXISTS gen.estudiante_familiar CASCADE;
CREATE TABLE gen.estudiante_familiar (
	id_est_fam           	BIGSERIAL       NOT NULL PRIMARY KEY,
	id_empresa              INT             NOT NULL,
    id_estudiante           BIGINT          NOT NULL,
    id_familiar             BIGINT          NOT NULL,
    id_tipo_parentesco      INT             NOT NULL,
    apoderado               BOOLEAN         NOT NULL,
    viven_juntos            BOOLEAN         NOT NULL,
    us_registra             VARCHAR(25)     NOT NULL,
    fh_registra             TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra             VARCHAR(25)     NOT NULL,
    UNIQUE (id_empresa, id_estudiante, id_familiar),
    CONSTRAINT estudiante_familiar_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT estudiante_familiar_id_familiar_fkey FOREIGN KEY (id_familiar) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.estudiante_familiar IS 'Relación entre estudiantes y sus familiares.';
COMMENT ON COLUMN gen.estudiante_familiar.id_est_fam IS 'Identificador de entidad.';
COMMENT ON COLUMN gen.estudiante_familiar.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.estudiante_familiar.id_estudiante IS 'Identificador del estudiante [GEN.PERSONA].';
COMMENT ON COLUMN gen.estudiante_familiar.id_familiar IS 'Identificador del familiar [GEN.PERSONA].';
COMMENT ON COLUMN gen.estudiante_familiar.id_tipo_parentesco IS 'Tipo de parentesco del familiar con el estudiante [GEN.TIPO/TI_PARENTESCO].';
COMMENT ON COLUMN gen.estudiante_familiar.apoderado IS 'Indica si el familiar es apoderado del estudiante.';
COMMENT ON COLUMN gen.estudiante_familiar.viven_juntos IS 'Indica si el estudiante y el familiar viven juntos.';
COMMENT ON COLUMN gen.estudiante_familiar.us_registra IS 'Usuario que registra la relación.';
COMMENT ON COLUMN gen.estudiante_familiar.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.estudiante_familiar.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.estudiante_familiar (id_empresa, id_estudiante, id_familiar, id_tipo_parentesco, apoderado, viven_juntos, us_registra, ip_registra) VALUES
(1004, 10, 9, 95381, true, true, 'dba', 'localhost');




--GRUPO FAMILIAR
/*
--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--adm_grupo_fams--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists adm_grupo_fams; 
CREATE TABLE adm_grupo_fams (
	id_grp_fam		bigserial		NOT NULL PRIMARY KEY,
	nom_grp_fam		varchar(30)		NOT NULL, 
	procedencia		varchar(30)		NOT NULL,
	codigo			varchar(8)		NOT NULL,
	id_empresa		int				not null,
	cerrado			boolean			not null
);
--
CREATE UNIQUE INDEX adm_grupo_fams_noms_ukey ON adm_grupo_fams ( id_empresa , fn_unaccent(nom_grp_fam) , fn_unaccent(procedencia) );
--
COMMENT ON TABLE adm_grupo_fams IS 'Grupos familiares.'; 
COMMENT ON COLUMN adm_grupo_fams.id_grp_fam IS 'Identificador del grupo.';
COMMENT ON COLUMN adm_grupo_fams.nom_grp_fam IS 'Nombre del grupo.';
COMMENT ON COLUMN adm_grupo_fams.procedencia IS 'Lugar de procedencia. Ej: El Tambo, Huancayo.';
COMMENT ON COLUMN adm_grupo_fams.codigo IS 'Código que crea el sistema. Ej: BAROLI01.';
COMMENT ON COLUMN adm_grupo_fams.id_empresa IS 'Identificador de empresa.';
COMMENT ON COLUMN adm_grupo_fams.cerrado IS 'Si true, ya no se podrá modificar.';
--
INSERT INTO adm_grupo_fams (nom_grp_fam, procedencia, codigo, id_empresa, cerrado)
VALUES  
('BARZOLA OLIVARES'		, 'EL TAMBO, HUANCAYO'		,'BAROLI01'	 , 1005 , true ),
('SORIANO SINCHE'		, 'HUANCAYO'				,'SORSIN01'	 , 1005 , false),
('HERRERA SOLANO'		, 'HUANCAYO'				,'HERSOL01'	 , 1005 , false);
*/




/*


-- =============================================
-- BÚSQUEDA FLEXIBLE DE NOMBRES CON PG_TRGM
-- Migración mejorada desde SQL Server
-- =============================================

-- =============================================
-- 1. FUNCIÓN BÁSICA COMO LA DE SQL SERVER
-- =============================================
CREATE OR REPLACE FUNCTION buscar_por_partes(
    texto_completo TEXT,
    patron_busqueda TEXT
) RETURNS BOOLEAN AS $$
DECLARE
    palabras_patron TEXT[];
    palabra TEXT;
    texto_limpio TEXT;
BEGIN
    -- Limpiar texto (sin tildes, minúsculas, espacios extras)
    texto_limpio := lower(trim(regexp_replace(fn_unaccent(texto_completo), '\s+', ' ', 'g')));
    
    -- Dividir el patrón en palabras (separadas por espacios)
    palabras_patron := string_to_array(lower(trim(regexp_replace(fn_unaccent(patron_busqueda), '\s+', ' ', 'g'))), ' ');
    
    -- Verificar que cada palabra del patrón exista en el texto
    FOREACH palabra IN ARRAY palabras_patron
    LOOP
        IF palabra != '' AND position(palabra IN texto_limpio) = 0 THEN
            RETURN FALSE;
        END IF;
    END LOOP;
    
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- =============================================
-- 2. FUNCIÓN AVANZADA CON TRIGRAM Y SCORING
-- =============================================
CREATE OR REPLACE FUNCTION buscar_nombres_inteligente(
    nombres TEXT,
    apellidos TEXT,
    patron_busqueda TEXT
) RETURNS TABLE(
    coincide BOOLEAN,
    score_similitud REAL,
    partes_encontradas INT
) AS $$
DECLARE
    texto_completo TEXT;
    palabras_patron TEXT[];
    palabra TEXT;
    partes_encontradas_count INT := 0;
    total_palabras INT;
    score_final REAL;
    coincide_resultado BOOLEAN := FALSE;
BEGIN
    -- Construir texto completo
    texto_completo := lower(fn_unaccent(nombres || ' ' || apellidos));
    
    -- Limpiar patrón y dividir en palabras
    palabras_patron := string_to_array(
        lower(trim(regexp_replace(fn_unaccent(patron_busqueda), '\s+', ' ', 'g'))), 
        ' '
    );
    
    -- Remover palabras vacías
    palabras_patron := array_remove(palabras_patron, '');
    total_palabras := array_length(palabras_patron, 1);
    
    -- Contar partes encontradas
    FOREACH palabra IN ARRAY palabras_patron
    LOOP
        -- Buscar con similitud trigram (tolera errores de tipeo)
        IF texto_completo % palabra OR position(palabra IN texto_completo) > 0 THEN
            partes_encontradas_count := partes_encontradas_count + 1;
        END IF;
    END LOOP;
    
    -- Calcular score y decidir coincidencia
    IF total_palabras > 0 THEN
        score_final := partes_encontradas_count::REAL / total_palabras::REAL;
        coincide_resultado := score_final >= 0.6; -- 60% de coincidencia mínima
    ELSE
        score_final := 0;
        coincide_resultado := FALSE;
    END IF;
    
    -- Bonus por similitud trigram del texto completo
    score_final := score_final + (similarity(texto_completo, lower(fn_unaccent(patron_busqueda))) * 0.3);
    
    RETURN QUERY SELECT coincide_resultado, score_final, partes_encontradas_count;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- =============================================
-- 3. EJEMPLOS DE USO CON TUS DATOS
-- =============================================

-- Crear tabla de ejemplo (estudiantes)
CREATE TABLE IF NOT EXISTS colegio.estudiantes_ejemplo (
    id SERIAL PRIMARY KEY,
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    documento VARCHAR(8)
);

-- Datos de prueba
INSERT INTO colegio.estudiantes_ejemplo (nombres, apellidos, documento) VALUES
('Juan Carlos', 'Pérez González', '12345678'),
('María José', 'García Rodríguez', '87654321'),
('José Antonio', 'Martínez López', '11223344'),
('Ana Lucía', 'Fernández Silva', '55667788'),
('Carlos Eduardo', 'López Vargas', '99887766'),
('Bartolomé Oliver', 'Franco Mendoza', '44556677'),
('Oliver Bartolomé', 'Mendoza Franco', '77889900'),
('Barbara Olivia', 'Francia Montenegro', '22334455');

-- =============================================
-- 4. CREAR ÍNDICES PARA PERFORMANCE
-- =============================================

-- Índice trigram para búsquedas rápidas
CREATE INDEX IF NOT EXISTS idx_estudiantes_nombres_trigram 
ON colegio.estudiantes_ejemplo 
USING gin((fn_unaccent(lower(nombres || ' ' || apellidos))) gin_trgm_ops);

-- Índice tradicional para búsquedas exactas
CREATE INDEX IF NOT EXISTS idx_estudiantes_nombres_texto 
ON colegio.estudiantes_ejemplo 
USING btree(lower(fn_unaccent(nombres || ' ' || apellidos)));

-- =============================================
-- 5. CONSULTAS DE EJEMPLO (COMO TU "Bar O l i Fra")
-- =============================================

-- Ejemplo 1: Búsqueda básica por partes
SELECT nombres, apellidos,
       buscar_por_partes(nombres || ' ' || apellidos, 'Bar O l i Fra') as coincide
FROM colegio.estudiantes_ejemplo
WHERE buscar_por_partes(nombres || ' ' || apellidos, 'Bar O l i Fra');

-- Ejemplo 2: Búsqueda inteligente con scoring
SELECT 
    nombres, 
    apellidos,
    busqueda.*
FROM colegio.estudiantes_ejemplo e
CROSS JOIN LATERAL buscar_nombres_inteligente(e.nombres, e.apellidos, 'Bar O l i Fra') as busqueda
WHERE busqueda.coincide
ORDER BY busqueda.score_similitud DESC;

-- Ejemplo 3: Búsqueda con errores de tipeo
SELECT 
    nombres, 
    apellidos,
    similarity(fn_unaccent(lower(nombres || ' ' || apellidos)), fn_unaccent(lower('juan peres'))) as score
FROM colegio.estudiantes_ejemplo
WHERE fn_unaccent(lower(nombres || ' ' || apellidos)) % fn_unaccent(lower('juan peres'))
ORDER BY score DESC;

-- Ejemplo 4: Autocompletado (para frontend)
SELECT DISTINCT
    nombres || ' ' || apellidos as nombre_completo,
    similarity(fn_unaccent(lower(nombres || ' ' || apellidos)), fn_unaccent(lower($1))) as score
FROM colegio.estudiantes_ejemplo
WHERE fn_unaccent(lower(nombres || ' ' || apellidos)) % fn_unaccent(lower($1))
ORDER BY score DESC
LIMIT 10;

-- =============================================
-- 6. FUNCIÓN PARA SPRING BOOT (MÁS SIMPLE)
-- =============================================
CREATE OR REPLACE FUNCTION buscar_estudiantes_flexible(
    patron_busqueda TEXT,
    limite INT DEFAULT 50
) RETURNS TABLE(
    id INT,
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    documento VARCHAR(8),
    score REAL
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        e.id,
        e.nombres,
        e.apellidos,
        e.documento,
        GREATEST(
            similarity(fn_unaccent(lower(e.nombres || ' ' || e.apellidos)), fn_unaccent(lower(patron_busqueda))),
            CASE 
                WHEN buscar_por_partes(e.nombres || ' ' || e.apellidos, patron_busqueda) THEN 0.8 
                ELSE 0 
            END
        ) as score
    FROM colegio.estudiantes_ejemplo e
    WHERE 
        fn_unaccent(lower(e.nombres || ' ' || e.apellidos)) % fn_unaccent(lower(patron_busqueda))
        OR buscar_por_partes(e.nombres || ' ' || e.apellidos, patron_busqueda)
    ORDER BY score DESC
    LIMIT limite;
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- 7. PRUEBAS CON DIFERENTES PATRONES
-- =============================================

-- Prueba 1: "Bar O l i Fra" (tu ejemplo)
SELECT * FROM buscar_estudiantes_flexible('Bar O l i Fra');

-- Prueba 2: Con errores de tipeo
SELECT * FROM buscar_estudiantes_flexible('juan peres');

-- Prueba 3: Solo apellidos
SELECT * FROM buscar_estudiantes_flexible('garcia rodriguez');

-- Prueba 4: Parcial desordenado
SELECT * FROM buscar_estudiantes_flexible('carlos martinez');

-- Prueba 5: Con números de documento
SELECT * FROM buscar_estudiantes_flexible('123456');

-- =============================================
-- 8. VIEW PARA USAR EN SPRING BOOT
-- =============================================
CREATE OR REPLACE VIEW v_estudiantes_busqueda AS
SELECT 
    id,
    nombres,
    apellidos,
    documento,
    fn_unaccent(lower(nombres || ' ' || apellidos)) as texto_busqueda,
    nombres || ' ' || apellidos as nombre_completo
FROM colegio.estudiantes_ejemplo;

-- =============================================
-- 9. COMENTARIOS Y DOCUMENTACIÓN
-- =============================================
COMMENT ON FUNCTION buscar_por_partes IS 'Función básica para buscar por partes separadas (equivalente a SQL Server)';
COMMENT ON FUNCTION buscar_nombres_inteligente IS 'Función avanzada con scoring y tolerancia a errores';
COMMENT ON FUNCTION buscar_estudiantes_flexible IS 'Función optimizada para usar desde Spring Boot';

-- =============================================
-- 10. ESTADÍSTICAS DE PERFORMANCE
-- =============================================

-- Ver el plan de ejecución
EXPLAIN ANALYZE 
SELECT * FROM buscar_estudiantes_flexible('Bar O l i Fra');

-- Verificar que usa el índice trigram
EXPLAIN (ANALYZE, BUFFERS) 
SELECT * FROM colegio.estudiantes_ejemplo
WHERE fn_unaccent(lower(nombres || ' ' || apellidos)) % 'bartolome';

*/
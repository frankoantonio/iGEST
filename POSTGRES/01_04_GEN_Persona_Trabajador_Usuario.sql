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
(false, 95071, 'JR.', 'SANTA ISABEL NRO. 2065', 95100, 'URB.', 'MIRAFLORES', 'ENTRE SANTA ISABEL Y SUMAR', 9589, '110113', '-12.0487659256089', '-75.2205508947372', 1004, 'developer', '127.0.0.1');



-- ============================================================================
-- TABLA: gen.persona
-- ============================================================================
DROP TABLE IF EXISTS gen.persona CASCADE;
CREATE TABLE gen.persona (
	id_persona 			BIGSERIAL 		NOT NULL PRIMARY KEY,
	uuid_persona		UUID			NOT NULL UNIQUE DEFAULT gen_random_uuid(),
	id_empresa		 	INT			NOT NULL,
	id_tipo_persona 	INT			NOT NULL,	
	id_tipo_doc_ident 	INT		 	NOT NULL,	
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
ALTER SEQUENCE persona_id_persona_seq RESTART WITH 35;
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
(   0 ,    -1 , 95019,   95049 ,     '-'           ,   ''          , ''            , 'CLIENTES VARIOS'                         ,  ''               , ''                           , true  , 'system', '127.0.0.1'),
                                                                                                                                                                                                                    
(   1 ,  1001 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'admin' , '127.0.0.1'),
(   2 ,  1001 , 95011,   95032 ,   '20600695771'   ,   ''          , ''            , 'NUBEFACT S.A.'                           ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(   3 ,  1001 , 95011,   95032 ,   '20133746278'   ,   ''          , ''            , 'C.E. SAN JUAN BOSCO S.A.C.'              ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(   4 ,  1001 , 95010,   95030 ,   '07823084'      ,   'YHA'       , 'GIBU'        , 'TAMMY GERALDINE'                         ,  '10078230849'    , 'LIBRERÍA BAZAR GERALDINE'   , true  , 'admin' , '127.0.0.1'),
(   5 ,  1001 , 95010,   95030 ,   '07826812'      ,   'SALAZAR'   , 'LOAYZA'      , 'MIGUEL ANGEL'                            ,  '10078268129'    , 'MUNDO DE LOS LIBROS'        , true  , 'admin' , '127.0.0.1'),
(   6 ,  1001 , 95011,   95032 ,   '20605817123'   ,   ''          , ''            , 'GRUPO SABAL S.A.C.'                      ,  ''               , 'CASA DEL NIÑO Y LA MADRE'   , true  , 'admin' , '127.0.0.1'),
                                                                                                                                                                                                                    
(   7 ,  1002 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'admin' , '127.0.0.1'),
(   8 ,  1003 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'admin' , '127.0.0.1'),
(   9 ,  1004 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'admin' , '127.0.0.1'),
(  10,   1005 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'admin' , '127.0.0.1'),
(  11 ,  1006 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'admin' , '127.0.0.1'),
(  12 ,  1007 , 95010,   95030 ,   '40110805'      ,   'BARZOLA'   , 'OLIVARES'    , 'FRANKLIN ANTONIO'                        ,  '10401108055'    , ''                           , true  , 'admin' , '127.0.0.1'),
                                                                                                                                                                                                                    
(  13 ,  1004 , 95010,   95030 ,   '20121955'      ,   'SALAZAR'   , 'SAAVEDRA'    , 'SARA SAIDA'                              ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  14 ,  1004 , 95010,   95030 ,   '41330439'      ,   'SINCHE'    , 'BARRA'       , 'YENNY GIOVANNA'                          ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  15 ,  1004 , 95010,   95030 ,   '71326982'      ,   'ARROYO'    , 'QUINTANA'    , 'SHIRLEY ELIZABETH'                       ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  16 ,  1004 , 95010,   95030 ,   '44681435'      ,   'SOLANO'    , 'SULCA'       , 'MARISA DIANA'                            ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  17 ,  1004 , 95010,   95030 ,   '41798320'      ,   'SUASNABAR' , 'ROJAS'       , 'YESENIA YULIA'                           ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  18 ,  1004 , 95010,   95030 ,   '07826812'      ,   'SALAZAR'   , 'LOAYZA'      , 'MIGUEL ANGEL'                            ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  19 ,  1004 , 95010,   95030 ,   '19917113'      ,   'BELTRAN'   , 'GALLARDO'    , 'ALBERTO DOMINGO'                         ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  20 ,  1004 , 95010,   95030 ,   '0496341'       ,   'MELENDEZ'  , 'HERRERA'     , 'JOSE MARIA IGNACIO'                      ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  21 ,  1004 , 95010,   95030 ,   '20029016'      ,   'REYES'     , 'ARTICA'      , 'LUZ NERIDA'                              ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  22 ,  1004 , 95010,   95030 ,   '70019247'      ,   'CARDOZO'   , 'VILLAGARAY'  , 'FANNY ROSARIO'                           ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  23 ,  1004 , 95010,   95030 ,   '42444816'      ,   'SERRANO'   , 'ALCANTARA'   , 'KARINA BERTHA'                           ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  24 ,  1004 , 95010,   95030 ,   '71696400'      ,   'PAZ'       , 'MORALES'     , 'FIORELLA GERALDINE'                      ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  25 ,  1004 , 95010,   95030 ,   '42844755'      ,   'GONZALEZ'  , 'FLORES'      , 'CINTHIA'                                 ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  26 ,  1004 , 95010,   95030 ,   '20440709'      ,   'PEREZ'     , 'MEZA'        , 'BLANCA JESUS'                            ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  27 ,  1004 , 95010,   95030 ,   '20074916'      ,   'VERGARA'   , 'IZAGUIRRE'   , 'GABRIELA'                                ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  28 ,  1004 , 95011,   95032 ,   '20603133111'   ,   ''          , ''            , 'YUPANA STUDIO E.I.R.L'                   ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
                                                                                                                                                                                                                    
(  29 ,  1006 , 95010,   95030 ,   '20121955'      ,   'SALAZAR'   , 'SAAVEDRA'    , 'SARA SAIDA'                              ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  30 ,  1006 , 95010,   95030 ,   '41330439'      ,   'SINCHE'    , 'BARRA'       , 'YENNY GIOVANNA'                          ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  31 ,  1006 , 95010,   95030 ,   '71326982'      ,   'ARROYO'    , 'QUINTANA'    , 'SHIRLEY ELIZABETH'                       ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  32 ,  1006 , 95010,   95030 ,   '44681435'      ,   'SOLANO'    , 'SULCA'       , 'MARISA DIANA'                            ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),

(  33 ,  1007 , 95010,   95030 ,   '20121955'      ,   'SALAZAR'   , 'LOAYZA'      , 'FELIPE ARTURO'                           ,  ''               , ''                           , true  , 'admin' , '127.0.0.1'),
(  34 ,  1007 , 95010,   95030 ,   '41330439'      ,   'BALDEÓN'   , 'PORRAS'      , 'MARIA'                                   ,  ''               , ''                           , true  , 'admin' , '127.0.0.1');



-- ============================================================================
-- TABLA: gen.contacto
-- ============================================================================
DROP TABLE IF EXISTS gen.contacto CASCADE;
CREATE TABLE gen.contacto (
	id_contacto			BIGSERIAL		NOT NULL PRIMARY KEY,
	id_tipo_grp_per		INT				NOT NULL,
	id_entidad			BIGINT			NOT NULL,
	id_direccion		BIGINT			NULL,
	correo_pri			VARCHAR(100)	NOT NULL,
	correo_aux			VARCHAR(100)	NOT NULL,
	celular_pri			VARCHAR(25)		NOT NULL,
	celular_aux			VARCHAR(25)		NOT NULL,
	telefono_fijo		VARCHAR(25)		NOT NULL,
	alguna_obs			VARCHAR(255)	NOT NULL,
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
COMMENT ON COLUMN gen.contacto.id_tipo_grp_per IS 'Identificador del tipo de grupo de persona [GEN.TIPO/TI_GRP_PER].';
COMMENT ON COLUMN gen.contacto.id_entidad IS 'Identificador de la entidad (persona, trabajador, estudiante, etc.) [GEN.PERSONA].';
COMMENT ON COLUMN gen.contacto.id_direccion IS 'Identificador de dirección [GEN.DIRECCION].';
COMMENT ON COLUMN gen.contacto.correo_pri IS 'Correo electrónico principal.';
COMMENT ON COLUMN gen.contacto.correo_aux IS 'Correo electrónico auxiliar.';
COMMENT ON COLUMN gen.contacto.celular_pri IS 'Número de celular principal.';
COMMENT ON COLUMN gen.contacto.celular_aux IS 'Número de celular auxiliar.';
COMMENT ON COLUMN gen.contacto.telefono_fijo IS 'Número de teléfono fijo.';
COMMENT ON COLUMN gen.contacto.alguna_obs IS 'Observaciones adicionales.';
COMMENT ON COLUMN gen.contacto.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.contacto.fe_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.contacto.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
COMMENT ON COLUMN gen.contacto.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.contacto.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.contacto.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
--
INSERT INTO gen.contacto (id_tipo_grp_per, id_entidad, id_direccion, correo_pri, correo_aux, celular_pri, celular_aux, telefono_fijo, alguna_obs, us_registra, ip_registra) VALUES
(95120,  9,    1, 'fbarzola@sanjuanbosco.edu.pe'   , 'frankoantonio@gmail.com'   , '987654321', '987779695'    , '064-231234'   , 'Administrador del sistema', 'admin', '192.168.1.100'),  	--franklin
(95120, 13, NULL, 'ssalazar@sanjuanbosco.edu.pe'   , 'majachus@gmail.com'       , '966308555', ''             , '064-235678'   , 'Secretaria administrativa', 'admin', '192.168.1.101'),    --sara
(95120, 14, NULL, 'ysinche@sanjuanbosco.edu.pe'    , 'yenny@gmail.com'          , '977111222', ''             , '064-239876'   , 'Contadora principal'      , 'admin', '192.168.1.102'),    --yenny
(95120, 15, NULL, 'sarroyo@sanjuanbosco.edu.pe'    , ''                         , '999888777', '954321876'    , ''             , 'Asistente administrativa' , 'admin', '192.168.1.103'),    --shirley
(95120, 16, NULL, 'msolano@sanjuanbosco.edu.pe'    , ''                         , '988776655', '943210987'    , ''             , 'Recursos humanos'         , 'admin', '192.168.1.104'),    --marisa
(95120, 17, NULL, 'ysuasnabar@sanjuanbosco.edu.pe' , ''                         , '977665544', '932109876'    , ''             , 'Ejecutiva de ventas'      , 'admin', '192.168.1.105'),    --yesenia
(95120, 18, NULL, 'msalazar@sanjuanbosco.edu.pe'   , ''                         , '966554433', '921098765'    , ''             , 'Jefe de logística'        , 'admin', '192.168.1.106'),    --miguel
(95122, 28, NULL, 'yupanastudio@gmail.com'         , ''                         , '987123789', '965456123'    , ''             , ''                         , 'admin', '192.168.1.107');   --yupana



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
	sector				VARCHAR(10)		NOT NULL CHECK (sector IN ('PÚBLICO', 'PRIVADO'))
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
( 1, 1004, 95226, 'UPLA'    , 'UNIVERSIDAD PERUANA LOS ANDES'           , 'HUANCAYO'    , 'PRIVADO' , 'admin', '127.0.0.1'),
( 2, 1004, 95226, 'UNCP'    , 'UNIVERSIDAD DEL CENTRO DEL PERÚ'         , 'HUANCAYO'    , 'PÚBLICO' , 'admin', '127.0.0.1'),
( 3, 1004, 95226, 'UTP'     , 'UNIVERSIDAD TECNOLÓGICA DEL PERÚ'        , 'LIMA'        , 'PRIVADO' , 'admin', '127.0.0.1'),
( 4, 1004, 95220, ''        , 'COLEGIO SANTA ISABEL'                    , 'HUANCAYO'    , 'PRIVADO' , 'admin', '127.0.0.1'),
( 5, 1004, 95220, ''        , 'COLEGIO SAN JUAN BOSCO'                  , 'HUANCAYO'    , 'PRIVADO' , 'admin', '127.0.0.1'),
( 6, 1004, 95220, ''        , 'COLEGIO NUESTRA SEÑORA DEL ROSARIO'      , 'HUANCAYO'    , 'PRIVADO' , 'admin', '127.0.0.1'),
( 7, 1004, 95220, ''        , 'COLEGIO SAGRADA FAMILIA'                 , 'TARMA'       , 'PRIVADO' , 'admin', '127.0.0.1');



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
	obs						VARCHAR(100) 	NOT NULL,
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
CREATE INDEX ON gen.trabajador (id_inst_egreso);
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
COMMENT ON COLUMN gen.trabajador.obs IS 'Algún dato no contemplado.';
COMMENT ON COLUMN gen.trabajador.activo IS 'Indica sí el trabajador es un personal activo/vigente.';
COMMENT ON COLUMN gen.trabajador.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.trabajador.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.trabajador.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.trabajador (id_trabajador, id_empresa, id_tipo_sexo, id_tipo_est_civil, id_tipo_vivienda, id_tipo_viv_material, id_tipo_viv_condicion, id_tipo_movilidad, id_tipo_sit_edu, id_inst_egreso, id_tipo_titulo, profesion, ocupacion, obs, activo, us_registra, ip_registra) VALUES  
( 9, 1004, 95020, 95141, 95151, 95160, 95171, 95183, 95203,    1, 95236, 'INGENIERÍA DE SISTEMAS'        , 'EMPLEADO' , '', true, 'admin', '127.0.0.1'),    --franklin
(13, 1004, 95021, 95141, 95151, 95160, 95170, 95183, 95203, NULL, 95232, 'ADMINISTRACIÓN Y MARKETING'    , 'EMPLEADA' , '', true, 'admin', '127.0.0.1'),    --sara
(15, 1004, 95021, 95140, 95151, 95160, 95171, 95184, 95200, NULL, 95232, 'ADMINISTRACIÓN Y MARKETING'    , 'EMPLEADA' , '', true, 'admin', '127.0.0.1'),    --shirley
(17, 1004, 95021, 95141, 95150, 95160, 95170, 95183, 95204, NULL, 95232, 'ADMINISTRACIÓN'                , 'EMPLEADA' , '', true, 'admin', '127.0.0.1');   --yesenia



-- ============================================================================
-- TABLA: gen.lugar_nacimiento
-- ============================================================================
DROP TABLE IF EXISTS gen.lugar_nacimiento CASCADE;
CREATE TABLE gen.lugar_nacimiento (
    id_persona          BIGINT          NOT NULL PRIMARY KEY,
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
COMMENT ON COLUMN gen.lugar_nacimiento.id_pais IS 'Identificador de país [GEN.PAIS].';
COMMENT ON COLUMN gen.lugar_nacimiento.id_distrito IS 'Identificador de distrito [GEN.DISTRITO].';
COMMENT ON COLUMN gen.lugar_nacimiento.nom_lugar IS 'Nombre del centro poblado u otra observación específica.';
COMMENT ON COLUMN gen.lugar_nacimiento.fe_nacimiento IS 'Fecha de nacimiento.';
COMMENT ON COLUMN gen.lugar_nacimiento.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.lugar_nacimiento.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.lugar_nacimiento.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.lugar_nacimiento (id_persona, id_pais, id_distrito, nom_lugar, fe_nacimiento, us_registra, ip_registra) VALUES
( 9, 9589, '110501', ''                                   , '1978-10-20', 'admin', '127.0.0.1'),
(13, 9589, '140133', 'Fecha Real Nac. 21 JUL 1978'        , '1978-09-08', 'admin', '127.0.0.1');



-- ============================================================================
-- TABLA: gen.usuario
-- ============================================================================
DROP TABLE IF EXISTS gen.usuario CASCADE;
CREATE TABLE gen.usuario (
    id_usuario          BIGINT          NOT NULL PRIMARY KEY,
    nom_usu             VARCHAR(50)     NOT NULL UNIQUE,
    pwd_usu             VARCHAR(250)    NOT NULL,
    activo              BOOLEAN         NOT NULL,
    cambio_pwd          BOOLEAN         NOT NULL,
    fh_cambio           DATE            NULL,
    us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
    CONSTRAINT usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.usuario IS 'Usuarios del sistema con control de acceso y seguridad.';
COMMENT ON COLUMN gen.usuario.id_usuario IS 'Identificador de usuario [GEN.PERSONA].';
COMMENT ON COLUMN gen.usuario.nom_usu IS 'Nombre de usuario.';
COMMENT ON COLUMN gen.usuario.pwd_usu IS 'Contraseña encriptada.';
COMMENT ON COLUMN gen.usuario.activo IS 'Indica si el usuario está activo y puede acceder.';
COMMENT ON COLUMN gen.usuario.cambio_pwd IS 'Si cambió la contraseña asignada inicialmente.';
COMMENT ON COLUMN gen.usuario.fh_cambio IS 'Fecha y hora del cambio de contraseña.';
COMMENT ON COLUMN gen.usuario.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.usuario.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.usuario.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.usuario (id_usuario, nom_usu, pwd_usu, activo, cambio_pwd, us_registra, ip_registra) VALUES
( 1, '1001.fbarzola',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
( 9, '1004.fbarzola',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(10, '1005.fbarzola',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(11, '1006.fbarzola',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(12, '1007.fbarzola',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(15, '1004.sarroyo',      '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(16, '1004.msolano',      '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(17, '1004.ysuasnabar',   '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(18, '1004.msalazar',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(19, '1004.abeltran',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(20, '1004.jmelendez',    '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(21, '1004.lreyes',       '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(22, '1004.fcardozo',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(23, '1004.kserrano',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(24, '1004.fpaz',         '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(25, '1004.cgonzalez',    '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(26, '1004.bperez',       '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1'),
(27, '1004.gvergara',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, false, 'admin', '127.0.0.1');																											 		    



-- ============================================================================
-- TABLA: gen.usuario_tipo
-- ============================================================================
DROP TABLE IF EXISTS gen.usuario_tipo CASCADE;
CREATE TABLE gen.usuario_tipo (
    id_usu_tipo         BIGSERIAL       NOT NULL PRIMARY KEY,    
    id_usuario          BIGINT          NOT NULL,    
    id_tipo_usuario     INT             NOT NULL,
    activo              BOOLEAN         NOT NULL,
    us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
    CONSTRAINT usuario_tipo_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT usuario_tipo_id_tipo_usuario_fkey FOREIGN KEY (id_tipo_usuario) REFERENCES gen.tipo(id_tipo) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT usuario_tipo_usuario_tipo_ukey UNIQUE (id_usuario, id_tipo_usuario)
);
--
CREATE INDEX ON gen.usuario_tipo(id_usuario);
CREATE INDEX ON gen.usuario_tipo(id_tipo_usuario, activo);
--
COMMENT ON TABLE gen.usuario_tipo IS 'Tipos de usuario asignados a cada usuario.'; 
COMMENT ON COLUMN gen.usuario_tipo.id_usu_tipo IS 'Identificador de entidad.';
COMMENT ON COLUMN gen.usuario_tipo.id_usuario IS 'Identificador de usuario [GEN.USUARIO].';
COMMENT ON COLUMN gen.usuario_tipo.id_tipo_usuario IS 'Identificador de tipo de usuario [GEN.TIPO].';
COMMENT ON COLUMN gen.usuario_tipo.activo IS 'Indica si el tipo de usuario está activo.';
COMMENT ON COLUMN gen.usuario_tipo.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.usuario_tipo.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.usuario_tipo.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.usuario_tipo (id_usuario, id_tipo_usuario, activo, us_registra, ip_registra)
VALUES
-- SJB-fbarzola
( 9, 95060, true, 'admin', '127.0.0.1'),    
( 9, 95061, true, 'admin', '127.0.0.1'),    
( 9, 95062, true, 'admin', '127.0.0.1'),    
-- SANFER-fbarzola
(10, 95060, true, 'admin', '127.0.0.1'),    
(10, 95063, true, 'admin', '127.0.0.1'),    
-- POLID-fbarzola
(11, 95060, true, 'admin', '127.0.0.1'),    
-- SABAL-fbarzola
( 1007, 12, 18, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1007, 12, 18, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1007, 12, 18, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1007, 12, 18, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1007, 12, 18, true, 'FIN', true, 'admin', '127.0.0.1'),    
( 1007, 12, 18, true, 'MED', true, 'admin', '127.0.0.1');



-- ============================================================================
-- TABLA: gen.usuario_sede_sistema
-- ============================================================================
DROP TABLE IF EXISTS gen.usuario_sede_sistema CASCADE;
CREATE TABLE gen.usuario_sede_sistema (
    id_usu_sed_sis      SERIAL          NOT NULL PRIMARY KEY,
    id_empresa          INT             NOT NULL,
    id_usuario          BIGINT          NOT NULL,
    id_sede             INT             NOT NULL,
    activo_sede         BOOLEAN         NOT NULL,
    id_sistema          CHAR(3)         NOT NULL,
    activo_sistema      BOOLEAN         NOT NULL,
    us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
    CONSTRAINT usuario_sede_sistema_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT usuario_sede_sistema_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES gen.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT usuario_sede_sistema_id_sede_fkey FOREIGN KEY (id_sede) REFERENCES gen.sede(id_sede) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT usuario_sede_sistema_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES gen.sistema(id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT usuario_sede_sistema_ukey UNIQUE (id_usuario, id_sede, id_sistema)
);
--
CREATE INDEX ON gen.usuario_sede_sistema(id_empresa);
CREATE INDEX ON gen.usuario_sede_sistema(id_usuario);
CREATE INDEX ON gen.usuario_sede_sistema(id_sede, activo_sede);
CREATE INDEX ON gen.usuario_sede_sistema(id_sistema, activo_sistema);
--
COMMENT ON TABLE gen.usuario_sede_sistema IS 'Sedes y sistemas habilitados por usuario.'; 
COMMENT ON COLUMN gen.usuario_sede_sistema.id_usu_sed_sis IS 'Identificador de entidad.';
COMMENT ON COLUMN gen.usuario_sede_sistema.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.usuario_sede_sistema.id_usuario IS 'Identificador de usuario [GEN.USUARIO].';
COMMENT ON COLUMN gen.usuario_sede_sistema.id_sede IS 'Identificador de sede [GEN.SEDE].';
COMMENT ON COLUMN gen.usuario_sede_sistema.activo_sede IS 'Indica si la sede está activa para el usuario.';
COMMENT ON COLUMN gen.usuario_sede_sistema.id_sistema IS 'Identificador de sistema [GEN.SISTEMA].';
COMMENT ON COLUMN gen.usuario_sede_sistema.activo_sistema IS 'Indica si el sistema está activo para el usuario.';
COMMENT ON COLUMN gen.usuario_sede_sistema.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.usuario_sede_sistema.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.usuario_sede_sistema.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.usuario_sede_sistema (id_empresa, id_usuario, id_sede, activo_sede, id_sistema, activo_sistema, us_registra, ip_registra) 
VALUES
-- YSST-fbarzola
( 1001,  1,  1, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1001,  1,  1, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1001,  1,  1, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1001,  1,  1, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1001,  1,  1, true, 'FIN', true, 'admin', '127.0.0.1'),    
-- SJB-fbarzola
( 1004,  9,  4, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1004,  9,  4, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1004,  9,  4, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1004,  9,  4, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1004,  9,  4, true, 'FIN', true, 'admin', '127.0.0.1'),    
( 1004,  9,  4, true, 'COL', true, 'admin', '127.0.0.1'),    
-- SJB-sarroyo
( 1004, 15,  4, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1004, 15,  4, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1004, 15,  4, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1004, 15,  4, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1004, 15,  4, true, 'FIN', true, 'admin', '127.0.0.1'),    
( 1004, 15,  4, true, 'COL', true, 'admin', '127.0.0.1'),    
-- SANFER-fbarzola
( 1005, 10, 10, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1005, 10, 10, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1005, 10, 10, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1005, 10, 10, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1005, 10, 10, true, 'FIN', true, 'admin', '127.0.0.1'),    
( 1005, 10, 10, true, 'ACA', true, 'admin', '127.0.0.1'),    
-- POLID-fbarzola
( 1006, 11, 14, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1006, 11, 14, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1006, 11, 14, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1006, 11, 14, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1006, 11, 14, true, 'FIN', true, 'admin', '127.0.0.1'),    
( 1006, 11, 14, true, 'ACA', true, 'admin', '127.0.0.1');
-- SABAL-fbarzola



-- ============================================================================
-- TABLA: gen.acceso
-- ============================================================================
DROP TABLE IF EXISTS gen.acceso CASCADE;
CREATE TABLE gen.acceso (
    id_acceso           BIGSERIAL       NOT NULL PRIMARY KEY,
    id_empresa          INT             NOT NULL,
    id_usuario          BIGINT          NOT NULL,
    id_tipo_usu         INT             NOT NULL,
    fe_login            DATE            NOT NULL,
    fh_login            TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fh_logout           TIMESTAMP       NULL,
    info_cliente        JSONB           NOT NULL DEFAULT '{}'::jsonb,
    CONSTRAINT acceso_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES gen.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT acceso_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT acceso_id_tipo_usu_fkey FOREIGN KEY (id_tipo_usu) REFERENCES gen.tipo(id_tipo) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
CREATE INDEX idx_acceso_empresa ON gen.acceso(id_empresa);
CREATE INDEX idx_acceso_usuario ON gen.acceso(id_usuario);
CREATE INDEX idx_acceso_fecha ON gen.acceso(fe_login);
CREATE INDEX idx_acceso_login ON gen.acceso(fh_login);
CREATE INDEX idx_acceso_empresa_fecha ON gen.acceso(id_empresa, fe_login);
CREATE INDEX idx_acceso_usuario_fecha ON gen.acceso(id_usuario, fe_login);
--
COMMENT ON TABLE gen.acceso IS 'Registro de accesos al sistema para auditoría.';
COMMENT ON COLUMN gen.acceso.id_acceso IS 'Identificador de acceso.';
COMMENT ON COLUMN gen.acceso.id_empresa IS 'Identificador de la empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.acceso.id_usuario IS 'Identificador del usuario [GEN.USUARIO].';
COMMENT ON COLUMN gen.acceso.id_tipo_usu IS 'Identificador del tipo de usuario [GEN.TIPO].';
COMMENT ON COLUMN gen.acceso.fe_login IS 'Fecha de acceso.';
COMMENT ON COLUMN gen.acceso.fh_login IS 'Fecha y hora del login.';
COMMENT ON COLUMN gen.acceso.fh_logout IS 'Fecha y hora del logout.';
COMMENT ON COLUMN gen.acceso.info_cliente IS 'Información del cliente en formato JSON: IP, user agent, navegador, OS, resolución, etc.';12, 95060, true, 'admin', '127.0.0.1'),    
(12, 95064, true, 'admin', '127.0.0.1'),    
(12, 95065, true, 'admin', '127.0.0.1');




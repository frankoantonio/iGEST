/* 
----------------------------------------------------------------------------------------------------------------------------------------
--direccion-----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS direccion; 
CREATE TABLE direccion (
	id_direccion 	bigserial 		NOT NULL PRIMARY KEY,
	corrido			bool			NOT NULL,
	id_tipo_via		int				NOT NULL,
	nom_tipo_via	varchar(25)		NOT NULL,
	nom_via 		varchar(125) 	NOT NULL,
	id_tipo_zona	int				NOT NULL,
	nom_tipo_zona	varchar(25)		NOT NULL,
	nom_zona		varchar(50)		NOT NULL,
	referencia 		varchar(125) 	NOT NULL,	
	id_pais			int				NOT NULL,
	id_distrito		char(6) 		NOT NULL,
	latitud 		varchar(25) 	NOT NULL,
	longitud 		varchar(25) 	NOT NULL,
	id_empresa		int				NOT NULL,
	CONSTRAINT direccion_id_distrito_fkey FOREIGN KEY (id_distrito) REFERENCES distrito(id_distrito) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
CREATE UNIQUE INDEX direccion_nom_via_ukey ON direccion ( id_empresa , id_distrito, id_tipo_via , fn_unaccent(nom_via) );
CREATE INDEX direccion_id_distrito_idx ON direccion (id_distrito);
CREATE INDEX direccion_id_empresa_idx ON direccion (id_empresa);
--
COMMENT ON TABLE direccion IS 'Direcciones por empresa.'; 
COMMENT ON COLUMN direccion.id_direccion IS 'Identificador de dirección.';
COMMENT ON COLUMN direccion.corrido IS 'Indica si toda la dirección irá en la columna "nom_via".';
COMMENT ON COLUMN direccion.id_tipo_via IS 'Identificador del tipo de vía [TI_VIA].';
COMMENT ON COLUMN direccion.nom_tipo_via IS 'Abreviatura del tipo de vía.';
COMMENT ON COLUMN direccion.nom_via IS 'Nombre de la vía o dirección.';
COMMENT ON COLUMN direccion.id_tipo_zona IS 'Identificador del tipo de zona [TI_ZONA].';
COMMENT ON COLUMN direccion.nom_tipo_zona IS 'Abreviatura del tipo de zona.';
COMMENT ON COLUMN direccion.nom_zona IS 'Nombre de la zona.';
COMMENT ON COLUMN direccion.referencia IS 'Referencia de la dirección.';
COMMENT ON COLUMN direccion.id_pais IS 'Identificador del país [PAIS].';
COMMENT ON COLUMN direccion.id_distrito IS 'Identificador del distrito [DISTRITO].';
COMMENT ON COLUMN direccion.latitud IS 'Coordenada en latitud.';
COMMENT ON COLUMN direccion.longitud IS 'Coordenada en longitud.';
COMMENT ON COLUMN direccion.id_empresa IS 'Identificador de empresa [EMPRESA].';
--
INSERT INTO direccion (corrido, id_tipo_via, nom_tipo_via, nom_via, id_tipo_zona, nom_tipo_zona, nom_zona, referencia, id_pais, id_distrito, latitud, longitud, id_empresa)
VALUES
(false, 95061, 'JR.' ,  'SANTA ISABEL NRO. 2065'   ,  95090,  'URB.' , 'MIRAFLORES' 	, 'ENTRE SANTA ISABEL Y SUMAR'     	, 9589, '110113' , '-12.0487659256089'	, '-75.2205508947372' ,  1004);
*/



----------------------------------------------------------------------------------------------------------------------------------------
--persona-------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS persona;
CREATE TABLE persona (
	id_persona 				bigserial 		NOT NULL PRIMARY KEY,
	id_empresa		 		int				NOT NULL,
	id_tipo_persona 		int		 		NOT NULL,	
	id_tipo_doc_ident 		int		 		NOT NULL,	
	num_doc_ident			varchar(20) 	NOT NULL,	
	paterno 				varchar(30) 	NOT NULL,
	materno 				varchar(30) 	NOT NULL,
	nombres 				varchar(125) 	NOT NULL,		
	num_ruc_per_nat			varchar(11)		NOT NULL,
	sigla 					varchar(125) 	NOT NULL,	
	validado 				bool 			NOT NULL,	
	CONSTRAINT persona_num_doc_ukey UNIQUE (id_empresa , id_tipo_doc_ident , num_doc_ident)	
);
--
CREATE UNIQUE INDEX persona_nombres_ukey ON persona (id_empresa , fn_unaccent(paterno), fn_unaccent(materno) , fn_unaccent(nombres));
ALTER SEQUENCE persona_id_persona_seq RESTART WITH 35;
--
COMMENT ON TABLE persona IS 'Personas y empresas.'; 
COMMENT ON COLUMN persona.id_persona IS 'Identificador de persona o empresa.';
COMMENT ON COLUMN persona.id_empresa IS 'Identificador de empresa del sistema.';
COMMENT ON COLUMN persona.id_tipo_persona IS 'Identificador del tipo de persona [TI_PERSONA].';
COMMENT ON COLUMN persona.id_tipo_doc_ident IS 'Identificador del tipo de documento de identidad [TI_DOC_IDENT].';
COMMENT ON COLUMN persona.num_doc_ident IS 'Número del documento de identidad.';
COMMENT ON COLUMN persona.paterno IS 'Apellido paterno o en blanco si es empresa.';
COMMENT ON COLUMN persona.materno IS 'Apellido materno o en blanco si es empresa.';
COMMENT ON COLUMN persona.nombres IS 'Nombres de la persona o razón social de la empresa.';
COMMENT ON COLUMN persona.num_ruc_per_nat IS 'Si es del tipo persona, registra RUC si lo tiene.';
COMMENT ON COLUMN persona.sigla IS 'Nombre comercial de empresa o persona con RUC.';
COMMENT ON COLUMN persona.validado IS 'Si es true, ya no se puede modificar ciertos datos.';
--
INSERT INTO persona (id_persona, id_empresa, id_tipo_persona, id_tipo_doc_ident, num_doc_ident, paterno, materno, nombres, num_ruc_per_nat, sigla, validado)
VALUES
(   0 ,    -1 , 95019,   95049 , 	'-'				,   ''			, ''			, 'CLIENTES VARIOS'							,  ''			 	, ''							, true	),
																																															
(	1 ,  1001 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(	2 ,  1001 , 95011,   95032 ,   '20600695771'	,   ''			, ''			, 'NUBEFACT S.A.'							,  ''				, ''							, true	),
(	3 ,  1001 , 95011,   95032 ,   '20133746278'	,   ''			, ''			, 'C.E. SAN JUAN BOSCO S.A.C.'				,  ''				, ''							, true	),
(	4 ,  1001 , 95010,   95030 ,   '07823084'		,   'YHA'		, 'GIBU'		, 'TAMMY GERALDINE'							,  '10078230849'	, 'LIBRERÍA BAZAR GERALDINE'	, true	),
(	5 ,  1001 , 95010,   95030 ,   '07826812'		,   'SALAZAR'	, 'LOAYZA'		, 'MIGUEL ANGEL'							,  '10078268129'	, 'MUNDO DE LOS LIBROS'			, true	),
(	6 ,  1001 , 95011,   95032 ,   '20605817123'	,   ''		    , ''		    , 'GRUPO SABAL S.A.C.'						,  ''				, 'CASA DEL NIÑO Y LA MADRE'	, true	),
																																															
(	7 ,  1002 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(	8 ,  1003 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(	9 ,  1004 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(  10,   1005 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(  11 ,  1006 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(  12 ,  1007 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
																																															
(  13 ,  1004 , 95010,   95030 ,   '20121955'		,   'SALAZAR'	, 'SAAVEDRA'	, 'SARA SAIDA'								,  ''			 	, ''							, true	),
(  14 ,  1004 , 95010,   95030 ,   '41330439'		,   'SINCHE'	, 'BARRA'		, 'YENNY GIOVANNA'							,  ''			 	, ''							, true	),
(  15 ,  1004 , 95010,   95030 ,   '71326982'		,   'ARROYO'	, 'QUINTANA'	, 'SHIRLEY ELIZABETH'						,  ''			 	, ''							, true	),
(  16 ,  1004 , 95010,   95030 ,   '44681435'		,   'SOLANO'	, 'SULCA'		, 'MARISA DIANA'							,  ''			 	, ''							, true	),
(  17 ,  1004 , 95010,   95030 ,   '41798320'		,   'SUASNABAR'	, 'ROJAS'		, 'YESENIA YULIA'							,  ''			 	, ''							, true	),
(  18 ,  1004 , 95010,   95030 ,   '07826812'		,   'SALAZAR'	, 'LOAYZA'		, 'MIGUEL ANGEL'							,  ''			 	, ''							, true	),
(  19 ,  1004 , 95010,   95030 ,   '19917113'		,   'BELTRAN'	, 'GALLARDO'	, 'ALBERTO DOMINGO'							,  ''			 	, ''							, true	),
(  20 ,  1004 , 95010,   95030 ,   '0496341'		,   'MELENDEZ'	, 'HERRERA'		, 'JOSE MARIA IGNACIO'						,  ''			 	, ''							, true	),
(  21 ,  1004 , 95010,   95030 ,   '20029016'		,   'REYES'		, 'ARTICA'		, 'LUZ NERIDA'								,  ''			 	, ''							, true	),
(  22 ,  1004 , 95010,   95030 ,   '70019247'		,   'CARDOZO'	, 'VILLAGARAY'	, 'FANNY ROSARIO'							,  ''			 	, ''							, true	),
(  23 ,  1004 , 95010,   95030 ,   '42444816'		,   'SERRANO'	, 'ALCANTARA'	, 'KARINA BERTHA'							,  ''			 	, ''							, true	),
(  24 ,  1004 , 95010,   95030 ,   '71696400'		,   'PAZ'		, 'MORALES'		, 'FIORELLA GERALDINE'						,  ''			 	, ''							, true	),
(  25 ,  1004 , 95010,   95030 ,   '42844755'		,   'GONZALEZ'	, 'FLORES'		, 'CINTHIA'									,  ''			 	, ''							, true	),
(  26 ,  1004 , 95010,   95030 ,   '20440709'		,   'PEREZ'		, 'MEZA'		, 'BLANCA JESUS'							,  ''			 	, ''							, true	),
(  27 ,  1004 , 95010,   95030 ,   '20074916'		,   'VERGARA'	, 'IZAGUIRRE'	, 'GABRIELA'								,  ''			 	, ''							, true	),
(  28 ,  1004 , 95011,   95032 ,   '20603133111'	,   ''			, ''			, 'YUPANA STUDIO E.I.R.L'					,  ''			 	, ''							, true	),
																																															
(  29 ,  1006 , 95010,   95030 ,   '20121955'		,   'SALAZAR'	, 'SAAVEDRA'	, 'SARA SAIDA'								,  ''			 	, ''							, true	),
(  30 ,  1006 , 95010,   95030 ,   '41330439'		,   'SINCHE'	, 'BARRA'		, 'YENNY GIOVANNA'							,  ''			 	, ''							, true	),
(  31 ,  1006 , 95010,   95030 ,   '71326982'		,   'ARROYO'	, 'QUINTANA'	, 'SHIRLEY ELIZABETH'						,  ''			 	, ''							, true	),
(  32 ,  1006 , 95010,   95030 ,   '44681435'		,   'SOLANO'	, 'SULCA'		, 'MARISA DIANA'							,  ''			 	, ''							, true	),

(  33 ,  1007 , 95010,   95030 ,   '20121955'		,   'SALAZAR'	, 'LOAYZA'		, 'FELIPE ARTURO'							,  ''			 	, ''							, true	),
(  34 ,  1007 , 95010,   95030 ,   '41330439'		,   'BALDEÓN'	, 'PORRAS'		, 'MARIA'									,  ''			 	, ''							, true	);




----------------------------------------------------------------------------------------------------------------------------------------
--trabajador----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS trabajador;
CREATE TABLE trabajador (
	id_trabajador 				bigint 			NOT NULL PRIMARY KEY,	
	id_tipo_sexo				int				NOT NULL,
	id_tipo_est_civil			int				NOT NULL,
	id_tipo_vivienda			int				NOT NULL,
	id_tipo_viv_material		int				NOT NULL,
	id_tipo_viv_condicion		int				NOT NULL,
	id_direccion				bigint 			NOT NULL,
	id_tipo_movilidad			int				NOT NULL,
	id_tipo_sit_edu				int				NOT NULL,	
	id_inst_egreso				int				NOT NULL,
	id_tipo_titulo				int				NOT NULL,
	profesion					varchar(50) 	NOT NULL,
	ocupacion					varchar(50) 	NOT NULL,		
	correo_per                 	varchar(75) 	NOT NULL,	
	correo_lab                 	varchar(75) 	NOT NULL,	
	celular_per					varchar(25) 	NOT NULL,	
	celular_lab					varchar(25) 	NOT NULL,	
	telefono					varchar(25) 	NOT NULL,					
	obs							varchar(100) 	NOT NULL,
	activo						bool			NOT NULL,
	CONSTRAINT trabajador_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE trabajador IS 'Trabajadores por empresa.'; 
COMMENT ON COLUMN trabajador.id_trabajador IS 'Identificador de trabajador.';
COMMENT ON COLUMN trabajador.id_tipo_sexo IS 'Identificador del tipo de sexo [TI_SEXO].';
COMMENT ON COLUMN trabajador.id_tipo_est_civil IS 'Identificador del tipo de estado civil [TI_EST_CIV].';
COMMENT ON COLUMN trabajador.id_tipo_vivienda IS 'Identificador del tipo de vivienda [TI_VIVIENDA].';
COMMENT ON COLUMN trabajador.id_tipo_viv_material IS 'Identificador del tipo de material de la vivienda [TI_VIV_MATERIAL].';
COMMENT ON COLUMN trabajador.id_tipo_viv_condicion IS 'Identificador del tipo de condición de la vivienda [TI_VIV_CONDICION].';
COMMENT ON COLUMN trabajador.id_direccion IS 'Identificador de la dirección [DIRECCION].';
COMMENT ON COLUMN trabajador.id_tipo_movilidad IS 'Identificador del tipo de movilidad con que se desplaza al trabajo [TI_MOVILIDAD].';
COMMENT ON COLUMN trabajador.id_tipo_sit_edu IS 'Identificador del tipo de situación educativa [TI_SIT_EDUC].';
COMMENT ON COLUMN trabajador.id_inst_egreso IS 'Identificador de la institución de egreso.';
COMMENT ON COLUMN trabajador.id_tipo_titulo IS 'Identificador del tipo de título [TI_TITULO].';
COMMENT ON COLUMN trabajador.profesion IS 'Nombre de la profesión que alcanzó.';
COMMENT ON COLUMN trabajador.ocupacion IS 'Nombre de la actividad a la que se dedica.';
COMMENT ON COLUMN trabajador.correo_per IS 'Correo electrónico personal.';
COMMENT ON COLUMN trabajador.correo_lab IS 'Correo electrónico laboral.';
COMMENT ON COLUMN trabajador.celular_per IS 'Número de celular personal.';
COMMENT ON COLUMN trabajador.celular_lab IS 'Número de celular laboral.';
COMMENT ON COLUMN trabajador.telefono IS 'Teléfono fijo.';
COMMENT ON COLUMN trabajador.obs IS 'Algún dato no contemplado.';
COMMENT ON COLUMN trabajador.activo IS 'Indica sí el trabajador es un personal activo/vigente.';
--
INSERT INTO trabajador (id_trabajador, id_tipo_sexo, id_tipo_est_civil, id_tipo_vivienda, id_tipo_viv_material, id_tipo_viv_condicion, id_direccion, id_tipo_movilidad, id_tipo_sit_edu, id_inst_egreso, id_tipo_titulo, profesion, ocupacion, correo_per, correo_lab, celular_per, celular_lab, telefono, obs, activo)
VALUES 
( 9, 95021, 95131, 95262, 95270, 95280, -1, 95290, 95153, -1, 95179, 'SISTEMAS Y COMPUTACIÓN'		, 'EMPLEADO', 'franko@gmail'	  , 'fbarzola@sanjuanbosco.edu.pe'	, '987779695' , '' , '' , '-' , true ),
(15, 95021, 95131, 95262, 95270, 95280, -1, 95290, 95153, -1, 95179, 'ADMINISTRACIÓN Y MARKETING'	, 'EMPLEADA', 'majachus@gmail'	  , 'ssalazar@sanjuanbosco.edu.pe'	, '966308555' , '' , '' , '-' , true ),
(16, 95021, 95131, 95260, 95270, 95281, -1, 95295, 95154, -1, 95174, 'CONTABILIDAD Y FINANZAS'   	, 'EMPLEADA', 'yenny@gmail@gmail' , 'ysinche@sanjuanbosco.edu.pe'	, '977111222' , '' , '' , '-' , false),
(17, 95021, 95130, 95260, 95270, 95282, -1, 95294, 95150, -1, 95184, 'ADMINISTRACIÓN'				, 'EMPLEADA', 'shirley@gmail'	  , 'sarroyo@sanjuanbosco.edu.pe' 	, '999888777' , '' , '' , '-' , true );



/*
----------------------------------------------------------------------------------------------------------------------------------------
--clie_prov-----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS clie_prov;
CREATE TABLE clie_prov (
	id_cli_pro 					bigserial 		NOT NULL PRIMARY KEY,	
	id_tipo_estado_contrib		int				NOT NULL,		
	id_tipo_condicion_contrib	int				NOT NULL,		
	id_direccion				int 			NOT NULL,			
	correo                  	varchar(75) 	NOT NULL,	
	celular						varchar(25) 	NOT NULL,	
	telefono					varchar(25) 	NOT NULL,	
	contacto					varchar(100) 	NOT NULL,	
	obs							varchar(100) 	NOT NULL,	
	CONSTRAINT clie_prov_id_cli_pro_fkey FOREIGN KEY (id_cli_pro) REFERENCES persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE clie_prov IS 'Clientes y/o proveedores.'; 
COMMENT ON COLUMN clie_prov.id_cli_pro IS 'Identificador de cliente y/o proveedor.';
COMMENT ON COLUMN clie_prov.id_tipo_estado_contrib IS 'Identificador del tipo de estado del contribuyente [TI_ESTADO_CONTRIB].';
COMMENT ON COLUMN clie_prov.id_tipo_condicion_contrib IS 'Identificador del tipo de condición del contribuyente [TI_CONDICION_CONTRIB].';
COMMENT ON COLUMN clie_prov.id_direccion IS 'Identificador de dirección [DIRECCION].';
COMMENT ON COLUMN clie_prov.correo IS 'Correo electrónico.';
COMMENT ON COLUMN clie_prov.celular IS 'Número de celular.';
COMMENT ON COLUMN clie_prov.telefono IS 'Teléfono fijo.';
COMMENT ON COLUMN clie_prov.contacto IS 'Nombre de un contacto, solo sí es persona jurídica.';
COMMENT ON COLUMN clie_prov.obs IS 'Alguna observación sobre el cliente y/o proveedor.';
--
INSERT INTO clie_prov (id_cli_pro, id_tipo_estado_contrib, id_tipo_condicion_contrib, id_direccion, correo, celular, telefono, contacto, obs)
VALUES 
(   0 ,     -1,     -1,   -1,   ''						 , ''			, ''  ,  ''	, ''),
(  15 ,     -1,     -1,   -1,   'majachus@gmail.com'	 , '966308555'	, ''  ,  '' , ''),
(  16 ,     -1,     -1,   -1,   'yenny@gmail.com'		 , ''			, ''  ,  ''	, ''),
(  17 ,     -1,     -1,   -1,   'shirley@gmail.com'		 , ''			, ''  ,  '' , ''),
(  18 ,     -1,     -1,   -1,   'marisa@gmail.com'		 , ''			, ''  ,  '' , ''),
(  19 ,     -1,     -1,   -1,   'yesenia@gmail.com'		 , ''			, ''  ,  '' , ''),
(  30 ,  10001,  10010,    1,   'yupanastudio@gmail.com' , '987779695'	, ''  ,  '' , '');

*/

--REQUIERE QUE SEA TRABAJADOR, trabajador_vigente, personal_recibo, cualquiera
----------------------------------------------------------------------------------------------------------------------------------------
--usuario-------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario (
	id_usuario		bigint			NOT NULL PRIMARY KEY,
	nom_usu			varchar(50)		NOT NULL,   
	pwd_usu			varchar(250)	NOT NULL,
	fe_operacion	date			NOT NULL,
	activo			bool 			NOT NULL,
	cambio_pwd		bool			NOT NULL,
	CONSTRAINT usuario_ukey UNIQUE (nom_usu),
	CONSTRAINT usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE usuario IS 'Usuarios del sistema.'; 
COMMENT ON COLUMN usuario.id_usuario IS 'Identificador de usuario.';
COMMENT ON COLUMN usuario.nom_usu IS 'Concatenación del "id_empresa" mas nombre de usuario. Ej. 1001.fbarzola.';
COMMENT ON COLUMN usuario.pwd_usu IS 'Contraseña encriptada.';
COMMENT ON COLUMN usuario.fe_operacion IS 'Fecha en que opera el usuario.';
COMMENT ON COLUMN usuario.activo IS 'Indica si el usuario esta activo.';
COMMENT ON COLUMN usuario.cambio_pwd IS 'Indica sí el usuario cambió contraseña asignada.';
--
INSERT INTO usuario (id_usuario, nom_usu, pwd_usu, fe_operacion, activo, cambio_pwd) --trabajador, fam_alumno
VALUES 
( 1, '1001.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
																												 		    
( 9, '1004.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(15, '1004.sarroyo'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(16, '1004.msolano'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(17, '1004.ysuasnabar'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(20, '1004.msalazar'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(21, '1004.abeltran'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(22, '1004.jmelendez'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(23, '1004.lreyes'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(24, '1004.fcardozo'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(25, '1004.kserrano'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(26, '1004.fpaz'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(27, '1004.cgonzalez'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(28, '1004.bperez'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(29, '1004.gvergara'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
																												 		    
(10, '1005.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(11, '1006.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(12, '1007.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false );



----------------------------------------------------------------------------------------------------------------------------------------
--usuario_tipo--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS usuario_tipo;
CREATE TABLE usuario_tipo (
	id_usu_tipo			bigserial 	NOT NULL PRIMARY KEY,	
	id_usuario	 		bigint 		NOT NULL,	
	id_tipo_usuario		int			NOT NULL,
	activo				boolean		NOT NULL,
	CONSTRAINT usuario_tipo_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE usuario_tipo IS 'Usuarios y sus tipos asociados.'; 
COMMENT ON COLUMN usuario_tipo.id_usu_tipo IS 'Identificador de entidad.';
COMMENT ON COLUMN usuario_tipo.id_usuario IS 'Identificador de usuario [USUARIO].';
COMMENT ON COLUMN usuario_tipo.id_tipo_usuario IS 'Identificador de tipo de usuario [TIPO].';
COMMENT ON COLUMN usuario_tipo.activo IS 'Indica sí el tipo de suaurio es está activo';
--
INSERT INTO usuario_tipo (id_usuario, id_tipo_usuario, activo)
VALUES
-- SJB-fbarzola
( 9,  95060,	true ),	
( 9,  95061,	true ),	
( 9,  95062,	true ),	
-- SANFER-fbarzola
(10,  95060,	true ),	
(10,  95063,	true ),	
-- POLID-fbarzola
(11,  95060,	true ),	
-- SABAL-fbarzola
(12,  95060,	true ),	
(12,  95064,	true ),	
(12,  95065,	true );



----------------------------------------------------------------------------------------------------------------------------------------
--usuario_sede_sistema------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS usuario_sede_sistema;
CREATE TABLE usuario_sede_sistema (
	id_usu_sed_sis		serial 		NOT NULL PRIMARY KEY,
	id_empresa			int			NOT NULL,
	id_usuario	 		bigint 		NOT NULL,
	id_sede				int			NOT NULL,
	activo_sede			boolean		NOT NULL,
	id_sistema			char(3)		NOT NULL,
	activo_sistema		boolean		NOT NULL,
	CONSTRAINT usuario_sistema_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE usuario_sede_sistema IS 'Sedes y sistemas habilitados por usuario.'; 
COMMENT ON COLUMN usuario_sede_sistema.id_usu_sed_sis IS 'Identificador de entidad.';
COMMENT ON COLUMN usuario_sede_sistema.id_empresa IS 'Identificador de empresa [EMPRESA].';
COMMENT ON COLUMN usuario_sede_sistema.id_usuario IS 'Identificador de usuario [USUARIO].';
COMMENT ON COLUMN usuario_sede_sistema.id_sede IS 'Identificador de sede [SEDE].';
COMMENT ON COLUMN usuario_sede_sistema.activo_sede IS 'Indica sí la sede está activo';
COMMENT ON COLUMN usuario_sede_sistema.id_sistema IS 'Identificador de sistema [SISTEMA].';
COMMENT ON COLUMN usuario_sede_sistema.activo_sistema IS 'Indica sí el sistema está activo';
--
INSERT INTO usuario_sede_sistema (id_empresa, id_usuario, id_sede, activo_sede, id_sistema, activo_sistema) 
VALUES
-- YSST-fbarzola
( 1001,  1,  1 ,  true ,  'ADM',	true ),	
( 1001,  1,  1 ,  true ,  'COM',	true ),	
( 1001,  1,  1 ,  true ,  'LGT',	true ),	
( 1001,  1,  1 ,  true ,  'PER',	true ),	
( 1001,  1,  1 ,  true ,  'FIN',	true ),	
-- SJB-fbarzola
( 1004,  9,  4 ,  true ,  'ADM',	true ),	
( 1004,  9,  4 ,  true ,  'COM',	true ),	
( 1004,  9,  4 ,  true ,  'LGT',	true ),	
( 1004,  9,  4 ,  true ,  'PER',	true ),	
( 1004,  9,  4 ,  true ,  'FIN',	true ),	
( 1004,  9,  4 ,  true ,  'COL',	true ),	
-- SJB-ssalazar
( 1004, 15,  4 ,  true ,  'ADM',	true ),	
( 1004, 15,  4 ,  true ,  'COM',	true ),	
( 1004, 15,  4 ,  true ,  'LGT',	true ),	
( 1004, 15,  4 ,  true ,  'PER',	true ),	
( 1004, 15,  4 ,  true ,  'FIN',	true ),	
( 1004, 15,  4 ,  true ,  'COL',	true ),	
-- SANFER-fbarzola
( 1005, 10, 10 ,  true ,  'ADM',	true ),	
( 1005, 10, 10 ,  true ,  'COM',	true ),	
( 1005, 10, 10 ,  true ,  'LGT',	true ),	
( 1005, 10, 10 ,  true ,  'PER',	true ),	
( 1005, 10, 10 ,  true ,  'FIN',	true ),	
( 1005, 10, 10 ,  true ,  'ACA',	true ),	
-- POLID-fbarzola
( 1006, 11, 14 ,  true ,  'ADM',	true ),	
( 1006, 11, 14 ,  true ,  'COM',	true ),	
( 1006, 11, 14 ,  true ,  'LGT',	true ),	
( 1006, 11, 14 ,  true ,  'PER',	true ),	
( 1006, 11, 14 ,  true ,  'FIN',	true ),	
( 1006, 11, 14 ,  true ,  'ACA',	true ),
-- POLID-fbarzola
( 1007, 12, 18 ,  true ,  'ADM',	true ),	
( 1007, 12, 18 ,  true ,  'COM',	true ),	
( 1007, 12, 18 ,  true ,  'LGT',	true ),	
( 1007, 12, 18 ,  true ,  'PER',	true ),	
( 1007, 12, 18 ,  true ,  'FIN',	true ),	
( 1007, 12, 18 ,  true ,  'ACA',	true );



----------------------------------------------------------------------------------------------------------------------------------------
--perfil--------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS perfil;
CREATE TABLE perfil (
	id_perfil			int				NOT NULL PRIMARY KEY,
	id_sistema 			char(3) 		NOT NULL,
	nom_perfil 			varchar(50) 	NOT NULL,
	activo				boolean 		NOT NULL,
	id_tipo_empresa		int				NOT NULL,
	ruta				varchar(250) 	NOT NULL,
	descripcion 		varchar(100) 	NOT NULL,
	id_empresa			int				NOT NULL,
	CONSTRAINT perfil_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES sistema(id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE perfil IS 'Perfiles o roles de sistema.'; 
COMMENT ON COLUMN perfil.id_perfil IS 'Identificador del perfil.';
COMMENT ON COLUMN perfil.id_sistema IS 'Identificador del sistema [SISTEMA].';
COMMENT ON COLUMN perfil.nom_perfil IS 'Nombre del perfil.';
COMMENT ON COLUMN perfil.activo IS 'Indica si el perfil esta habilitado para utilizarse';
COMMENT ON COLUMN perfil.id_tipo_empresa IS 'Para indicar el tipo de empresa [TI_EMPRESA].';
COMMENT ON COLUMN perfil.ruta IS 'Ruta del perfil.';
COMMENT ON COLUMN perfil.descripcion IS 'Descripción del perfil.';
COMMENT ON COLUMN perfil.id_empresa IS 'Para todas las empresas -1, sino identificador de empresa [EMPRESA].';
--
INSERT INTO perfil (id_perfil, id_sistema, nom_perfil, activo, id_tipo_empresa, ruta, descripcion, id_empresa) 
VALUES  

(9501, 'ADM', 'PERFIL USUARIO'									,	true ,	95000,	'/admin/perfilUsuario/**'		,  'Usuarios, contraseña, baja/suspension, roles, historial, accesos, auditoria'	,  -1 ),
(9502, 'ADM', 'PERFIL ADMININISTRADOR DE SISTEMA'				,	true ,	95000,	'/admin/perfilAdmin/**'			,  'Autenticar, mi perfil, mi contraseña, busqueda personas'						,  -1 ),
(9503, 'ADM', 'PERFIL ROOT'										,	true ,	95000,	'/admin/perfilRoot/**'			,  'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'		,  -1 ),
(9504, 'ADM', 'GERENTE GENERAL'									,	true ,	95000,	'/admin/perfilGerGen/**'		,  'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'		,  -1 ),
(9505, 'ADM', 'GERENTE ADMINISTRATIVO'							,	true ,	95000,	'/admin/perfilGerAdm/**'		,  'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'		,  -1 ),
(9506, 'ADM', 'DIRECTOR GENERAL'								,	true ,	95000,	'/admin/perfilDirGen/**'		,  'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'		,  -1 ),
	
(1001, 'COM', 'PERFIL INFORMES'									,	true ,	95000,	''							,  'Atención al cliente. Pre Ventas. Post Ventas. Cronogramas. Admisión'			,  -1 ),
(1002, 'COM', 'PERFIL ASISTENTE DE VENTAS'						,	true ,	95000,	''							,  'Atención al cliente. Pre Ventas. Post Ventas. Cronogramas.'					,  -1 ),
(1003, 'COM', 'PERFIL ASISTENTE DE FACTURACIÓN'					,	true ,	95000,	''							,  'Facturas. Notas de crédito. Boletaje. Anulaciones. Envío comprobantes.'		,  -1 ),
(1004, 'COM', 'PERFIL ASISTENTE DE CAJA'						,	true ,	95000,	''							,  'Cobranza. Anulaciones. Apertura/Cierre. Retiros. Pérdidas. Tmb. Facturación'	,  -1 ),
(1005, 'COM', 'PERFIL SUPERVISOR DE VENTAS'						,	true ,	95000,	''							,  'Comisiones. Metas. Seguimiento de ventas. Visto bueno autorizaciones'			,  -1 ),
(1006, 'COM', 'PERFIL SUPERVISOR DE FACTURACIÓN'				,	true ,	95000,	''							,  'Consistencia comprobantes. Pendientes. Prorrogas. Modificar. REGVENTAS'		,  -1 ),
(1007, 'COM', 'PERFIL SUPERVISOR DE COBRANZA'					,	true ,	95000,	''							,  'Consistencia comprobantes. Resumenes entrega de dinero.'						,  -1 ),
(1008, 'COM', 'PERFIL GESTOR COMERCIAL'							,	true ,	95000,	''							,  'Reportes gerenciales. Autorización: Descuentos. Prorrogas'						,  -1 ),
																	
(1501, 'LGT', 'PERFIL REQUIRIENTE'								,	true ,	95000,	''							,  'Si no pueden hacer requerimientos cada personal, hay un responsable'			,  -1 ),
(1502, 'LGT', 'PERFIL ASISTENTE DE COTIZACIONES'				,	true ,	95000,	''							,  'Informes al cliente, cotizaciones, proforma, seguimiento al cliente'			,  -1 ),
(1503, 'LGT', 'PERFIL ASISTENTE DE ALMACÉN'						,	true ,	95000,	''							,  'Apoyo en almacen, Nota pedido, matr, benef, kardex, valorizado, promedio'		,  -1 ),
(1504, 'LGT', 'PERFIL ASISTENTE DE ABASTECIMIENTO'				,	true ,	95000,	''							,  'Contratos, cotizaciones, compras, abastecimento, flete'						,  -1 ),
(1505, 'LGT', 'PERFIL ASISTENTE DE CAJA - COMPRAS'				,	true ,	95000,	''							,  'Cobranza. Anulaciones. Apertura/Cierre. Retiros. Pérdidas'						,  -1 ),
(1506, 'LGT', 'PERFIL SUPERVISOR LOGÍSTICO'						,	true ,	95000,	''							,  'Catalogo. verificar compras. salidas de almacen. REGISTRO COMPRAS'				,  -1 ),
(1507, 'LGT', 'PERFIL GESTOR LOGÍSTICO'							,	true ,	95000,	''							,  'Distribir trimestral los bienes. Plan anual. Programacion trimestral'			,  -1 ),
																	
(2001, 'PER', 'PERFIL ASISTENTE DE ESCALAFÓN'					,	true ,	95000,	''							,  'Informes al cliente, cotizaciones, proforma, seguimiento al cliente'			,  -1 ),
(2002, 'PER', 'PERFIL ASISTENTE DE REMUNERACIONES'				,	true ,	95000,	''							,  'Contratos y remuneracion. Notas de pedido, cronograma, req.  beneficio'		,  -1 ),
(2003, 'PER', 'PERFIL ASISTENTE DE BIENESTAR SOCIAL'			,	true ,	95000,	''							,  'Bienestar social. capacitaciones. alimentos.'									,  -1 ),
(2004, 'PER', 'PERFIL ASISTENTE DE SEGURIDAD SALUD HIGIENE'		,	true ,	95000,	''							,  'RR INDUSTRIALES, SEGURIDAD, SALUD, HIGIENE OCUPACIONAL'						,  -1 ),
(2005, 'PER', 'PERFIL GESTOR LABORAL'							,	true ,	95000,	''							,  'Reportes gerenciales, autorizaciones'											,  -1 ),
																
(2501, 'FIN', 'PERFIL ASISTENTE DE TESORERÍA'					,	true ,	95000,	''							,  'OTROS INGRESOS. ARQUEO CAJA. RECEPCION DINERO. PRESUPESTO DE INGRESOS'			,  -1 ),
(2502, 'FIN', 'PERFIL ASISTENTE DE PAGADURÍA'					,	true ,	95000,	''							,  'PAGO COMPRAS. PAGO REMUNERACIONES. CUADRE PAGOS. PSP EGRESOS'					,  -1 ),
(2503, 'FIN', 'PERFIL ASISTENTE DE FONDO FIJO'					,	true ,	95000,	''							,  'INGRESOS. RETIROS. COMPRAS. ADELANTOS. MOVILIDAD, VIATICOS. ALIMNETACIÓN'		,  -1 ),
(2504, 'FIN', 'PERFIL ASISTENTE FINANCIERO'						,	true ,	95000,	''							,  'CONTROL PRESUPUESTAL. ADELANTOS. VIATICOS. INVERSIONES. FINANCIEROS.'			,  -1 ),
(2505, 'FIN', 'PERFIL ASISTENTE CONTABLE'						,	true ,	95000,	''							,  'PATRIMONIO. REGVEN. REGCOMPRAS. FORMATOS SUNAT.'								,  -1 ),
(2506, 'FIN', 'PERFIL GESTOR FINANCIERO'						,	true ,	95000,	''							,  'AUTORIZACIONES. MODIFICAR. ELIMINAR. CUADRES DIARIOS. MENSUALES. ANUALES'		,  -1 ),
																	
--(3001, 'CNT', 'PERFIL ASISTENTE DE TESORERÍA'					,	true ,	95000,	''							,  'OTROS INGRESOS. ARQUEO CAJA. RECEPCION DINERO. PRESUPESTO DE INGRESOS'			,  -1 ),
--(3002, 'CNT', 'PERFIL ASISTENTE DE PAGADURÍA'					,	true ,	95000,	''							,  'PAGO COMPRAS. PAGO REMUNERACIONES. CUADRE PAGOS. PSP EGRESOS'					,  -1 ),
--(3003, 'CNT', 'PERFIL ASISTENTE DE FONDO FIJO'					,	true ,	95000,	''							,  'INGRESOS. RETIROS. COMPRAS. ADELANTOS. MOVILIDAD, VIATICOS. ALIMNETACIÓN'		,  -1 ),

(3501, 'COL', 'PERFIL AUXILIAR'									,	true ,	95001,	''							,  'ASISTENCIA. MERITOS/DEMERITOS. LLAMADAS. COMUNICADOS. OBSERVACION TUTOR'		,  -1 ),
(3502, 'COL', 'PERFIL DOCENTE'									,	true ,	95001,	''							,  'EVALUACIONES. TAREAS. COMUNICADOS'												,  -1 ),
(3503, 'COL', 'PERFIL ASISTENTE ACADÉMICO'						,	true ,	95001,	''							,  'EVALUACIONES Y MATRÍCULAS'														,  -1 ), 
(3504, 'COL', 'PERFIL ENFERMERO'								,	true ,	95001,	''							,  'ATENCIONES PSICOLOGICAS. OBSERVACIONES. RECOMENDACIONES. CITAS'				,  -1 ), 
(3505, 'COL', 'PERFIL PSICOLOGO'								,	true ,	95001,	''							,  'ATENCIÓN MEDICA. OBSERVACIONES. CITAS'											,  -1 ),
(3506, 'COL', 'PERFIL BIBLIOTECARIO'							,	true ,	95001,	''							,  'PRESTAMO DE LIBROS. CATALOGO.'													,  -1 ),
(3507, 'COL', 'PERFIL TAREADOR'									,	true ,	95001,	''							,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(3508, 'COL', 'PERFIL GESTOR ACADÉMICO'							,	true ,	95001,	''							,  'ESTADISTICAS ACADEMICAS. COMUNICADOS'											,  -1 ),

(4001, 'ACA', 'PERFIL TUTOR'									,	true ,	95002,	''							,  'ASISTENCIA. ETAS. EVAS. LLAMADAS. COMUNICADOS'									,  -1 ),
(4002, 'ACA', 'PERFIL TAREADOR'									,	true ,	95002,	''							,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(4003, 'ACA', 'PERFIL SUPERVISOR'								,	true ,	95002,	''							,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(4004, 'ACA', 'PERFIL CORDINADOR ACADÉMICO'						,	true ,	95002,	''							,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),

(4501, 'MED', 'PERFIL PROGRAMACIÓN DE HORARIOS'					,	true ,	95003,	''							,  'ASISTENCIA. ETAS. EVAS. LLAMADAS. COMUNICADOS'									,  -1 ),
(4502, 'MED', 'PERFIL PROFESIONALES'							,	true ,	95003,	''							,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(4503, 'MED', 'PERFIL TIPOS DE PROFESIONALES'					,	true ,	95003,	''							,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(4504, 'MED', 'PERFIL MEDICINA GNERAL'							,	true ,	95003,	''							,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(4505, 'MED', 'PERFIL NUTRICIÓN'								,	true ,	95003,	''							,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(4506, 'MED', 'PERFIL GINECOLOGÍA'								,	true ,	95003,	''							,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(4507, 'MED', 'PERFIL UROLOGÍA'									,	true ,	95003,	''							,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(4508, 'MED', 'PERFIL TRIAJE'									,	true ,	95003,	''							,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),

(5001, 'BKA', 'PERFIL ANALISTA'									,	true ,	95004,	''							,  'ASISTENCIA. ETAS. EVAS. LLAMADAS. COMUNICADOS'									,  -1 ),
(5002, 'BKA', 'PERFIL OPERACIONES'								,	true ,	95004,	''							,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(5003, 'BKA', 'PERFIL SUPERVISOR'								,	true ,	95004,	''							,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(5004, 'BKA', 'PERFIL JEFE DE OPERACIONES'						,	true ,	95004,	''							,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 );





----------------------------------------------------------------------------------------------------------------------------------------
--usuario_perfil------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS usuario_perfil;
CREATE TABLE usuario_perfil (
	id_usu_perfil 	bigserial 	NOT null PRIMARY KEY,
	id_usuario 		bigint 		NOT NULL,
	id_perfil 		int 		NOT NULL,
	ver 			bool 		NOT NULL,
	crear 			bool 		NOT NULL,
	editar 			bool 		NOT NULL,	
	eliminar 		bool 		NOT NULL,
	imprimir		bool 		NOT NULL,
	CONSTRAINT usuario_perfil_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT usuario_perfil_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
ALTER SEQUENCE usuario_perfil_id_usu_perfil_seq RESTART WITH 109;
--
INSERT INTO usuario_perfil (id_usu_perfil, id_usuario, id_perfil, ver, crear, editar, eliminar, imprimir) 
VALUES
(  1,  1, 9501, true , true , true , true , true ),
(  2,  1, 9502, true , true , true , true , true ),
(  3,  1, 9503, true , true , true , true , true ),
(  4,  1, 1001, true , true , true , true , true ),
(  5,  1, 1002, true , true , true , true , true ),
(  6,  1, 1003, true , true , true , true , true ),
(  7,  1, 1004, true , true , true , true , true ),
(  8,  1, 1005, true , true , true , true , true ),
(  9,  1, 1006, true , true , true , true , true ),
( 10,  1, 1007, true , true , true , true , true ),
( 11,  1, 1008, true , true , true , true , true ),
( 12,  1, 1501, true , true , true , true , true ),
( 13,  1, 1502, true , true , true , true , true ),
( 14,  1, 1503, true , true , true , true , true ),
( 15,  1, 1504, true , true , true , true , true ),
( 16,  1, 1505, true , true , true , true , true ),
( 17,  1, 1506, true , true , true , true , true ),
( 18,  1, 1507, true , true , true , true , true ),
( 19,  1, 2001, true , true , true , true , true ),
( 20,  1, 2002, true , true , true , true , true ),
( 21,  1, 2003, true , true , true , true , true ),
( 22,  1, 2004, true , true , true , true , true ),
( 23,  1, 2005, true , true , true , true , true ),
( 24,  1, 2501, true , true , true , true , true ),
( 25,  1, 2502, true , true , true , true , true ),
( 26,  1, 2503, true , true , true , true , true ),
( 27,  1, 2504, true , true , true , true , true ),
( 28,  1, 2505, true , true , true , true , true ),
( 29,  1, 2506, true , true , true , true , true ),
--( 30,  1, 3001, true , true , true , true , true ),
--( 31,  1, 3002, true , true , true , true , true ),
--( 32,  1, 3003, true , true , true , true , true ),
( 33,  9, 9501, true , true , true , true , true ),
( 34,  9, 9502, true , true , true , true , true ),
( 35,  9, 9503, true , true , true , true , true ),
( 36,  9, 1001, true , true , true , true , true ),
( 37,  9, 1002, true , true , true , true , true ),
( 38,  9, 1003, true , true , true , true , true ),
( 39,  9, 1004, true , true , true , true , true ),
( 40,  9, 1005, true , true , true , true , true ),
( 41,  9, 1006, true , true , true , true , true ),
( 42,  9, 1007, true , true , true , true , true ),
( 43,  9, 1008, true , true , true , true , true ),
( 44,  9, 1501, true , true , true , true , true ),
( 45,  9, 1502, true , true , true , true , true ),
( 46,  9, 1503, true , true , true , true , true ),
( 47,  9, 1504, true , true , true , true , true ),
( 48,  9, 1505, true , true , true , true , true ),
( 49,  9, 1506, true , true , true , true , true ),
( 50,  9, 1507, true , true , true , true , true ),
( 51,  9, 2001, true , true , true , true , true ),
( 52,  9, 2002, true , true , true , true , true ),
( 53,  9, 2003, true , true , true , true , true ),
( 54,  9, 2004, true , true , true , true , true ),
( 55,  9, 2005, true , true , true , true , true ),
( 56,  9, 2501, true , true , true , true , true ),
( 57,  9, 2502, true , true , true , true , true ),
( 58,  9, 2503, true , true , true , true , true ),
( 59,  9, 2504, true , true , true , true , true ),
( 60,  9, 2505, true , true , true , true , true ),
( 61,  9, 2506, true , true , true , true , true ),
--( 62,  9, 3001, true , true , true , true , true ),
--( 63,  9, 3002, true , true , true , true , true ),
--( 64,  9, 3003, true , true , true , true , true ),
( 65,  9, 3501, true , true , true , true , true ),
( 66,  9, 3502, true , true , true , true , true ),
( 67,  9, 3503, true , true , true , true , true ),
( 68,  9, 3504, true , true , true , true , true ),
( 69,  9, 3505, true , true , true , true , true ),
( 70,  9, 3506, true , true , true , true , true ),
( 71,  9, 3507, true , true , true , true , true ),
( 72,  9, 3508, true , true , true , true , true ),
( 73, 10, 9501, true , true , true , true , true ),
( 74, 10, 9502, true , true , true , true , true ),
( 75, 10, 9503, true , true , true , true , true ),
( 76, 10, 1001, true , true , true , true , true ),
( 77, 10, 1002, true , true , true , true , true ),
( 78, 10, 1003, true , true , true , true , true ),
( 79, 10, 1004, true , true , true , true , true ),
( 80, 10, 1005, true , true , true , true , true ),
( 81, 10, 1006, true , true , true , true , true ),
( 82, 10, 1007, true , true , true , true , true ),
( 83, 10, 1008, true , true , true , true , true ),
( 84, 10, 1501, true , true , true , true , true ),
( 85, 10, 1502, true , true , true , true , true ),
( 86, 10, 1503, true , true , true , true , true ),
( 87, 10, 1504, true , true , true , true , true ),
( 88, 10, 1505, true , true , true , true , true ),
( 89, 10, 1506, true , true , true , true , true ),
( 90, 10, 1507, true , true , true , true , true ),
( 91, 10, 2001, true , true , true , true , true ),
( 92, 10, 2002, true , true , true , true , true ),
( 93, 10, 2003, true , true , true , true , true ),
( 94, 10, 2004, true , true , true , true , true ),
( 95, 10, 2005, true , true , true , true , true ),
( 96, 10, 2501, true , true , true , true , true ),
( 97, 10, 2502, true , true , true , true , true ),
( 98, 10, 2503, true , true , true , true , true ),
( 99, 10, 2504, true , true , true , true , true ),
(100, 10, 2505, true , true , true , true , true ),
(101, 10, 2506, true , true , true , true , true ),
--(102, 10, 3001, true , true , true , true , true ),
--(103, 10, 3002, true , true , true , true , true ),
--(104, 10, 3003, true , true , true , true , true ),
(105, 10, 4001, true , true , true , true , true ),
(106, 10, 4002, true , true , true , true , true ),
(107, 10, 4003, true , true , true , true , true ),
(108, 10, 4004, true , true , true , true , true );


INSERT INTO usuario_perfil (id_usuario, id_perfil, ver, crear, editar, eliminar, imprimir) 
VALUES
( 12, 9501, true , true , true , true , true ),
( 12, 9502, true , true , true , true , true ),
( 12, 9503, true , true , true , true , true ),
( 12, 1001, true , true , true , true , true ),
( 12, 1002, true , true , true , true , true ),
( 12, 1003, true , true , true , true , true ),
( 12, 1004, true , true , true , true , true ),
( 12, 1005, true , true , true , true , true ),
( 12, 1006, true , true , true , true , true ),
( 12, 1007, true , true , true , true , true ),
( 12, 1008, true , true , true , true , true ),
( 12, 1501, true , true , true , true , true ),
( 12, 1502, true , true , true , true , true ),
( 12, 1503, true , true , true , true , true ),
( 12, 1504, true , true , true , true , true ),
( 12, 1505, true , true , true , true , true ),
( 12, 1506, true , true , true , true , true ),
( 12, 1507, true , true , true , true , true ),
( 12, 2001, true , true , true , true , true ),
( 12, 2002, true , true , true , true , true ),
( 12, 2003, true , true , true , true , true ),
( 12, 2004, true , true , true , true , true ),
( 12, 2005, true , true , true , true , true ),
( 12, 2501, true , true , true , true , true ),
( 12, 2502, true , true , true , true , true ),
( 12, 2503, true , true , true , true , true ),
( 12, 2504, true , true , true , true , true ),
( 12, 2505, true , true , true , true , true ),
( 12, 2506, true , true , true , true , true ),
--( 12, 3001, true , true , true , true , true ),
--( 12, 3002, true , true , true , true , true ),
--( 12, 3003, true , true , true , true , true ),
( 12, 3501, true , true , true , true , true ),
( 12, 3502, true , true , true , true , true ),
( 12, 3503, true , true , true , true , true ),
( 12, 3504, true , true , true , true , true ),
( 12, 3505, true , true , true , true , true ),
( 12, 3506, true , true , true , true , true ),
( 12, 3507, true , true , true , true , true ),
( 12, 3508, true , true , true , true , true );

INSERT INTO usuario_perfil (id_usuario, id_perfil, ver, crear, editar, eliminar, imprimir) 
VALUES
( 11, 9501, true , true , true , true , true ),
( 11, 9502, true , true , true , true , true ),
( 11, 9503, true , true , true , true , true ),
( 11, 1001, true , true , true , true , true ),
( 11, 1002, true , true , true , true , true ),
( 11, 1003, true , true , true , true , true ),
( 11, 1004, true , true , true , true , true ),
( 11, 1005, true , true , true , true , true ),
( 11, 1006, true , true , true , true , true ),
( 11, 1007, true , true , true , true , true ),
( 11, 1008, true , true , true , true , true ),
( 11, 1501, true , true , true , true , true ),
( 11, 1502, true , true , true , true , true ),
( 11, 1503, true , true , true , true , true ),
( 11, 1504, true , true , true , true , true ),
( 11, 1505, true , true , true , true , true ),
( 11, 1506, true , true , true , true , true ),
( 11, 1507, true , true , true , true , true ),
( 11, 2001, true , true , true , true , true ),
( 11, 2002, true , true , true , true , true ),
( 11, 2003, true , true , true , true , true ),
( 11, 2004, true , true , true , true , true ),
( 11, 2005, true , true , true , true , true ),
( 11, 2501, true , true , true , true , true ),
( 11, 2502, true , true , true , true , true ),
( 11, 2503, true , true , true , true , true ),
( 11, 2504, true , true , true , true , true ),
( 11, 2505, true , true , true , true , true ),
( 11, 2506, true , true , true , true , true );
--( 11, 3001, true , true , true , true , true ),
--( 11, 3002, true , true , true , true , true ),
--( 11, 3003, true , true , true , true , true );



----------------------------------------------------------------------------------------------------------------------------------------
--opcion--------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS opcion;
CREATE TABLE opcion (
	id_opcion 			int 		NOT NULL PRIMARY KEY,	
	id_padre 			int 		NOT NULL,
	id_sistema			char(3)		NOT NULL,	
	id_perfil			int			NOT NULL,
	nom_opcion 			varchar(50) NOT NULL,
	nom_control 		varchar(75) NOT NULL,
	orden 				int 		NOT NULL,
	id_tipo_opcion 		int 	 	NOT NULL,	
	id_tipo_empresa		int			NOT NULL,	
	activo 				bool 		NOT NULL,
	premium 			bool 		NOT NULL,
	id_empresa 			int 		NOT NULL,
	CONSTRAINT opcion_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES perfil(id_perfil) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE opcion IS 'Opciones de cada perfil de sistema.'; 
COMMENT ON COLUMN opcion.id_opcion IS 'Identificador de la opción.';
COMMENT ON COLUMN opcion.id_padre IS 'Identificador de la opción superior, si no va -1.';
COMMENT ON COLUMN opcion.id_sistema IS 'Identificador del sistema [SISTEMA].';
COMMENT ON COLUMN opcion.id_perfil IS 'Identificador del perfil [PERFIL].';
COMMENT ON COLUMN opcion.nom_opcion IS 'Nombre de la opción.';
COMMENT ON COLUMN opcion.nom_control IS 'Ruta o nombre del control de usuario.';
COMMENT ON COLUMN opcion.orden IS 'Orden en que se mostrará.';
COMMENT ON COLUMN opcion.id_tipo_opcion IS 'Identificador del tipo de opcion [TI_OPCION_SIS].';
COMMENT ON COLUMN opcion.id_tipo_empresa IS 'Identificador del tipo de empresa [TI_EMPRESA].';
COMMENT ON COLUMN opcion.activo IS 'Si la opción esta activo o vigente.';
COMMENT ON COLUMN opcion.premium IS 'Indica sí es una opción para clientes premium.';
COMMENT ON COLUMN opcion.id_empresa IS 'Para todas las empresas -1, sino identificador de empresa [EMPRESA].';
--
INSERT INTO opcion (id_opcion, id_padre, id_sistema, id_perfil, nom_opcion, nom_control, orden, id_tipo_opcion, id_tipo_empresa, activo, premium, id_empresa) 
VALUES 
-- opciones de rol usuario 
(9501001,	     -1,  'ADM',  9501, 'DATOS DE USUARIO'						, ''											,  1,	95050 ,	   -1 , true , false , -1),
(9501002,	9501001,  'ADM',  9501, 'Perfil de usuario'						, 'UcCategorias'								,  5,	95051 ,	   -1 , true , false , -1),
(9501003,	9501001,  'ADM',  9501, 'Mis roles y accesos'					, 'UcCampania'									, 10,	95051 ,	   -1 , true , false , -1),
(9501004,	9501001,  'ADM',  9501, 'Mis solicitudes y utorizaciones'		, 'UcCampaniaConf'								, 15,	95051 ,	   -1 , true , false , -1),
-- admin sis                                          	                                                                       	    
(9502001,	     -1,  'ADM',  9502, 'ADMINISTRACIÓN DE USUARIOS'			, ''											, 20,	95050 ,	   -1 , true , false , -1),
(9502002,	9502001,  'ADM',  9502, 'Usuarios y contraseña'					, 'UcUsuarios'									, 25,	95051 ,	   -1 , true , false , -1),
(9502003,	9502001,  'ADM',  9502, 'Asignar usuarios y perfiles'			, '/com/polaris/app/gen/FrmBuscarDirección'		, 30,	95051 ,	   -1 , true , false , -1),
(9502004,	9502001,  'ADM',  9502, 'REPORTES'								, 'UcUsuariosNegSis'							, 35,	95051 ,	   -1 , true , false , -1),
(9502005,	9502001,  'ADM',  9502, 'Reportes1'								, '/com/polaris/app/gen/FrmBuscarUbigeo'		, 40,	95051 ,	   -1 , true , false , -1),
(9502006,	9502001,  'ADM',  9502, 'Reportes2'								, '/com/polaris/app/gen/FrmBuscarUbigeo'		, 45,	95051 ,	   -1 , true , false , -1),
(9502007,	9502001,  'ADM',  9502, 'Reportes3'								, '/com/polaris/app/gen/FrmBuscarUbigeo'		, 50,	95051 ,	   -1 , true , false , -1),
--					  		  																									       	   
(9502008,        -1,  'ADM',  9502, 'OTRAS OPERACIONES'						, 'UcInformes'									, 55,	95050 ,	   -1 , true , false , -1),
(9502009,	9502001,  'ADM',  9502, 'Cajeros'								, 'UcInscripcionCole'							, 60,	95051 ,	   -1 , true , false , -1),
(9502010,	9502001,  'ADM',  9502, 'Supervisores'							, 'UcInscripcionAcad'							, 65,	95051 ,	   -1 , true , false , -1),
(9502011,	9502001,  'ADM',  9502, 'Gestores'								, 'UcEstudianteAcad'							, 70,	95051 ,	   -1 , true , false , -1),
-- superusuario				  																		                           	    
(9503001,	     -1,  'ADM',  9503, 'SUPER USUARIO'							, ''											, 80,	95050 ,	   -1 , true , false , -1),
(9503002,	9503001,  'ADM',  9503, 'Variables Globales'					, 'UcGbVars'									, 81,	95051 ,	   -1 , true , false , -1),
(9503003,	9503001,  'ADM',  9503, 'Datos "Tipo"'							, 'UcTipos'										, 82,	95051 ,	   -1 , true , false , -1),
(9503004,	9503001,  'ADM',  9503, 'Empresas y Sedes'						, 'UcEmpresas'									, 83,	95051 ,	   -1 , true , false , -1),
(9503005,	9503001,  'ADM',  9503, 'Usuarios'								, 'UcUsuarios'									, 84,	95051 ,	   -1 , true , false , -1),
(9503006,	9503001,  'ADM',  9503, 'Usuarios y roles'						, 'UcNegocios'									, 85,	95051 ,	   -1 , true , false , -1),
(9503007,	9503001,  'ADM',  9503, 'Trabajadores'							, 'UcTrabajador'								, 86,	95051 ,	   -1 , true , false , -1),
							  																										 	  
-- informes                                                                                                                     	
(1001001,	     -1,  'COM',  1001, 'VENTAS'								, ''											,  1,	95050 ,	   -1 , true , false , -1),
(1001002,	1001001,  'COM',  1001, 'Informes'								, '/app/comercial/PnlInformesVta.fxml'			,  5,	95051 ,	   -1 , false, false , -1),
(1001003,	1001001,  'COM',  1001, 'Nota de pedido'						, '/app/comercial/PnlNotaPedido.fxml'			, 10,	95051 ,	   -1 , true , false , -1),
-- vendedor                                         	                                                                       	    
(1002001,	     -1,  'COM',  1002, 'VENTAS'								, ''											,  1,	95050 ,	   -1 , true , false , -1),
(1002002,	1002001,  'COM',  1002, 'Informes'								, '/app/comercial/PnlInformesVta.fxml'			,  5,	95051 ,	   -1 , false, false , -1),
(1002003,	1002001,  'COM',  1002, 'Nota de pedido'						, '/app/comercial/PnlNotaPedido.fxml'			, 10,	95051 ,	   -1 , true , false , -1),
(1002004,	1002001,  'COM',  1002, 'Inscripción colegio'					, '/app/comercial/PnlInsColegio.fxml'			, 15,	95051 ,	   -1 , true , false , -1),
(1002005,	1002001,  'COM',  1002, 'Inscripción academia'					, '/app/comercial/PnlInsAcademia.fxml'			, 20,	95051 ,	   -1 , true , false , -1),
(1002006,	1002001,  'COM',  1002, 'Cronograma de pagos'					, '/app/comercial/PnlCronograma.fxml'			, 25,	95051 ,	   -1 , false, false , -1),
(1002007,	1002001,  'COM',  1002, 'Control de informes y ventas'			, '/app/comercial/PnlCtrlVTA.fxml'				, 30,	95051 ,	   -1 , false, false , -1),
--                                                              	                                                                  
(1002008,	1002001,  'COM',  1002, 'Reportes'								, '/app/comercial/PnlReporteVentas'				, 35,	95050 ,	   -1 , true , false , -1),
(1002009,	1002001,  'COM',  1002, 'Resumen de informes'					, 'xxx.jasper'									, 40,	95051 ,	   -1 , true , false , -1),
(1002010,	1002001,  'COM',  1002, 'Resumen de ventas'						, 'xxx.jasper'									, 45,	95051 ,	   -1 , false, false , -1),
(1002011,	1002001,  'COM',  1002, 'Resumen de rebotes'					, 'xxx.jasper'									, 50,	95051 ,	   -1 , false, false , -1),
-- rol facturador                                       	                                                                       	
(1003001,	     -1,  'COM',  1003, 'FACTURACIÓN'							, ''											, 55,	95050 ,	   -1 , true , false , -1),
(1003002,	1003001,  'COM',  1003, 'Facturación directa'					, '/app/comercial/PnlFactDirecta.fxml'			, 60,	95051 ,	   -1 , true , false , -1),
(1003003,	1003001,  'COM',  1003, 'Facturación con nota de pedido'		, '/app/comercial/PnlFactNotaPedido.fxml'		, 65,	95051 ,	   -1 , true , false , -1),
(1003004,	1003001,  'COM',  1003, 'Facturación con cronograma pagos'		, '/app/comercial/PnlFactCronograma.fxml'		, 70,	95051 ,	   -1 , false, false , -1),
(1003005,	1003001,  'COM',  1003, 'Facturación de alquileres'				, '/app/comercial/PnlFactAlquiler.fxml'			, 75,	95051 ,	   -1 , false, false , -1),
(1003006,	1003001,  'COM',  1003, 'Boletaje'								, '/app/comercial/PnlBoletaje.fxml'				, 80,	95051 ,	   -1 , false, false , -1),
(1003007,	1003001,  'COM',  1003, 'Nota de crédito'						, '/app/comercial/PnlNotaCredito.fxml'			, 85,	95051 ,	   -1 , true , false , -1),
(1003008,	1003001,  'COM',  1003, 'Solicita anulación de comprobante'	 	, '/app/comercial/PnlSolAnulaComp.fxml'			, 90,	95051 ,	   -1 , false, false , -1),
(1003009,	1003001,  'COM',  1003, 'Solicita eliminación comprobante'		, '/app/comercial/PnlSolEliminaComp.fxml'		, 95,	95051 ,	   -1 , false, false , -1),
(1003010,	1003001,  'COM',  1003, 'Control de comprobantes'				, '/app/comercial/PnlCtrlFAC.fxml'				,100,	95051 ,	   -1 , false, false , -1),
--                                                                    	                                                               	  
(1003011,	1003001,  'COM',  1003, 'Reportes'								, ''											,105,	95050 ,	   -1 , true , false , -1),
(1003012,	1003001,  'COM',  1003, 'Comprobantes emitidos'					, 'xxx.jasper'									,110,	95051 ,	   -1 , true , false , -1),
(1003013,	1003001,  'COM',  1003, 'Comprobantes anulados'					, 'xxx.jasper'									,115,	95051 ,	   -1 , true , false , -1),
(1003014,	1003001,  'COM',  1003, 'Comprobantes modificados'				, 'xxx.jasper'									,120,	95051 ,	   -1 , true , false , -1),
-- rol caja                                              	                                                                       	
(1004001,	     -1,  'COM',  1004, 'COBRANZA'								, ''	 										,125,	95050 ,	   -1 , true , false , -1),
(1004002,	1004001,  'COM',  1004, 'Cobranzas'								, ''											,130,	95051 ,	   -1 , true , false , -1),
(1004003,	1004001,  'COM',  1004, 'Solicita anulación de cobranza'		, '/app/comercial/UctSegCliente'				,135,	95051 ,	   -1 , false, false , -1),
(1004004,	1004001,  'COM',  1004, 'Caja - Apertura e ingresos'			, '/app/comercial/UctSegCliente'				,140,	95051 ,	   -1 , false, false , -1),
(1004005,	1004001,  'COM',  1004, 'Caja - Cierre y egresos'				, '/app/comercial/UctSegCliente'				,145,	95051 ,	   -1 , false, false , -1),
(1004006,	1004001,  'COM',  1004, 'Caja - Perdidas y robos'				, '/app/comercial/UctSegCliente'				,150,	95051 ,	   -1 , false, false , -1),
(1004007,	1004001,  'COM',  1004, 'Solicita anulación entrega dinero'		, '/app/comercial/UctSegCliente'				,155,	95051 ,	   -1 , false, false , -1),
--                                                            	                                                                    
(1004008,	1004001,  'COM',  1004, 'Reportes'								, ''											,160,	95050 ,	   -1 , true , false , -1),
(1004009,	1004001,  'COM',  1004, 'Cobranzas por caja'					, 'xxx.jasper'									,165,	95051 ,	   -1 , true , false , -1),
(1004010,	1004001,  'COM',  1004, 'Cobranzas por usuario'					, 'xxx.jasper'									,170,	95051 ,	   -1 , true , false , -1),
-- supervisor ventas                                         	                                                                    
(1005001,	     -1,  'COM',  1005, 'SUPERVISIÓN VENTAS'					, ''											,175,	95050 ,	   -1 , true , false , -1),
(1005002,	1005001,  'COM',  1005, 'Registrar alumno academia'				, 'com.yupana.polaris.app.FrmAlumno'			,180,	95051 ,	   -1 , true , false , -1),
(1005003,	1005001,  'COM',  1005, 'Registrar familiar colegio'			, 'com.yupana.polaris.app.FrmFamiliar'			,185,	95051 ,	   -1 , true , false , -1),
(1005004,	1005001,  'COM',  1005, 'Registrar cliente'						, 'com.yupana.polaris.app.Frmcliente'			,190,	95051 ,	   -1 , true , false , -1),
(1005005,	1005001,  'COM',  1005, 'Registrar contacto'					, 'com.yupana.polaris.app.FrmContactoMnt'		,195,	95051 ,	   -1 , true , false , -1),
(1005006,	1005001,  'COM',  1005, 'Registrar dirección'					, 'com.yupana.polaris.app.FrmDireccion'			,200,	95051 ,	   -1 , true , false , -1),
(1005007,	1005001,  'COM',  1005, 'Registrar ubigeo'						, 'com.yupana.polaris.app.FrmDireccion'			,205,	95051 ,	   -1 , true , false , -1),
(1005008,	1005001,  'COM',  1005, 'Registrar grupo familiar'				, 'com.yupana.polaris.app.FrmDireccion'			,210,	95051 ,	   -1 , true , false , -1),
--                                                        	                                                                        
(1005009,	1005001,  'COM',  1005, 'Reportes'								, ''											,215,	95050 ,	   -1 , true , false , -1),
(1005010,	1005001,  'COM',  1005, 'Reporte de cuotas'						, 'xxx.jasper'									,220,	95051 ,	   -1 , true , false , -1),
(1005011,	1005001,  'COM',  1005, 'Reporte de ventas'						, 'xxx.jasper'									,225,	95051 ,	   -1 , true , false , -1),
-- supervisor de facturacion                                    	                                                                  
(1006001,	     -1,  'COM',  1006, 'SUPERVISIÓN FACTURACIÓN'				, ''											,230,	95050 ,	   -1 , true , false , -1),
(1006002,	1006001,  'COM',  1006, 'Cierre de caja'						, 'com.yupana.polaris.app.UctSegCliente'		,235,	95051 ,	   -1 , true , false , -1),
(1006003,	1006001,  'COM',  1006, 'Campañas, cronogramas y precios'		, 'com.yupana.polaris.app.UctSegCliente'		,240,	95051 ,	   -1 , true , false , -1),
(1006004,	1006001,  'COM',  1006, 'Prorrogas'								, 'com.yupana.polaris.app.UctSegCliente'		,245,	95051 ,	   -1 , true , false , -1),
																																	
(1006005,	1006001,  'COM',  1006, 'Reportes'								, ''											,250,	95050 ,	   -1 , true , false , -1),
(1006006,	1006001,  'COM',  1006, 'Reporte de cuotas'						, 'xxx.jasper'									,255,	95051 ,	   -1 , true , false , -1),
(1006007,	1006001,  'COM',  1006, 'Reporte de ventas'						, 'xxx.jasper'									,260,	95051 ,	   -1 , true , false , -1),
-- rol supervisor de cobranza                                       	                                                            
(1007001,	     -1,  'COM',  1007, 'SUPERVISIÓN COBRANZA'					, ''											,265,	95050 ,	   -1 , true , false , -1),
(1007002,	1007001,  'COM',  1007, 'Cierre de caja'						, 'com.yupana.polaris.app.UctSegCliente'		,270,	95051 ,	   -1 , true , false , -1),
(1007003,	1007001,  'COM',  1007, 'Campañas, cronogramas y precios'		, 'com.yupana.polaris.app.UctSegCliente'		,275,	95051 ,	   -1 , true , false , -1),
(1007004,	1007001,  'COM',  1007, 'Prorrogas'								, 'com.yupana.polaris.app.UctSegCliente'		,280,	95051 ,	   -1 , true , false , -1),
--					  						  																	                    
(1007005,	1007001,  'COM',  1007, 'Reportes'								, ''											,285,	95050 ,	   -1 , true , false , -1),
(1007006,	1007001,  'COM',  1007, 'Reporte de cuotas'						, 'xxx.jasper'									,290,	95051 ,	   -1 , true , false , -1),
(1007007,	1007001,  'COM',  1007, 'Reporte de ventas'						, 'xxx.jasper'									,295,	95051 ,	   -1 , true , false , -1),
-- opciones de gestor comercial                                     	                                          	                
(1008001,	     -1,  'COM',  1008, 'GESTIÓN COMERCIAL'						, ''											,300,	95050 ,	   -1 , true , false , -1),
(1008002,	1008001,  'COM',  1008, 'Cajas, cajeros, comprobantes'			, 'com.yupana.polaris.app.UctSegCliente'		,305,	95051 ,	   -1 , true , false , -1),
(1008003,	1008001,  'COM',  1008, 'Precios/Descuentos x Art./Campaña'		, 'com.yupana.polaris.app.UctSegCliente'		,310,	95051 ,	   -1 , true , false , -1),
(1008004,	1008001,  'COM',  1008, 'Campañas'								, 'com.yupana.polaris.app.UctSegCliente'		,315,	95051 ,	   -1 , true , false , -1),
(1008005,	1008001,  'COM',  1008, 'Establecer numeración'					, 'com.yupana.polaris.app.UctSegCliente'		,320,	95051 ,	   -1 , true , false , -1),
--                                                                                                                                  
(1008006,	1008001,  'COM',  1008, 'Reportes'								, ''											,325,	95050 ,	   -1 , true , false , -1),
(1008007,	1008001,  'COM',  1008, 'Reporte de cuotas'						, 'xxx.jasper'									,330,	95051 ,	   -1 , true , false , -1),
(1008008,	1008001,  'COM',  1008, 'Reporte de ventas'						, 'xxx.jasper'									,335,	95051 ,	   -1 , true , false , -1),
																																	
-- opciones de requiriente                                                                                                          
(1501001,	     -1,  'LGT',  1501, 'CABECERA 01'							, ''											,  1,	95050 ,	   -1 , true , false , -1),
(1501002,	1501001,  'LGT',  1501, 'Opción 001'							, 'com.yupana.polaris.app.UctSegCliente'		,  5,	95051 ,	   -1 , true , false , -1),
(1501003,	1501001,  'LGT',  1501, 'Opción 002'							, 'com.yupana.polaris.app.UctSegCliente'		, 10,	95051 ,	   -1 , true , false , -1),
(1501004,	1501001,  'LGT',  1501, 'Opción 003'							, 'com.yupana.polaris.app.UctSegCliente'		, 15,	95051 ,	   -1 , true , false , -1),
(1501005,	1501001,  'LGT',  1501, 'Opción 004'							, 'com.yupana.polaris.app.UctSegCliente'		, 20,	95051 ,	   -1 , true , false , -1),
--                                                        	                                                                        
(1501006,	1501001,  'LGT',  1501, 'Reportes'								, ''											, 25,	95050 ,	   -1 , true , false , -1),
(1501007,	1501001,  'LGT',  1501, 'Reporte de 00001'						, 'xxx.jasper'									, 30,	95051 ,	   -1 , true , false , -1),
(1501008,	1501001,  'LGT',  1501, 'Reporte de 00002'						, 'xxx.jasper'									, 35,	95051 ,	   -1 , true , false , -1),
-- opciones de cotizador                                            	        	                                                
(1502001,	     -1,  'LGT',  1502, 'CABECERA 01'							, ''											, 40,	95050 ,	   -1 , true , false , -1),
(1502002,	1502001,  'LGT',  1502, 'Opción 001'							, 'com.yupana.polaris.app.UctSegCliente'		, 45,	95051 ,	   -1 , true , false , -1),
(1502003,	1502001,  'LGT',  1502, 'Opción 002'							, 'com.yupana.polaris.app.UctSegCliente'		, 50,	95051 ,	   -1 , true , false , -1),
(1502004,	1502001,  'LGT',  1502, 'Opción 003'							, 'com.yupana.polaris.app.UctSegCliente'		, 55,	95051 ,	   -1 , true , false , -1),
(1502005,	1502001,  'LGT',  1502, 'Opción 004'							, 'com.yupana.polaris.app.UctSegCliente'		, 60,	95051 ,	   -1 , true , false , -1),
--                                           	                                                                                    
(1502006,	1502001,  'LGT',  1502, 'Reportes'								, ''											, 65,	95050 ,	   -1 , true , false , -1),
(1502007,	1502001,  'LGT',  1502, 'Reporte de 00001'						, 'xxx.jasper'									, 70,	95051 ,	   -1 , true , false , -1),
(1502008,	1502001,  'LGT',  1502, 'Reporte de 00002'						, 'xxx.jasper'									, 75,	95051 ,	   -1 , true , false , -1),
-- opciones de almacenero                                           		                                                        
(1503001,	     -1,  'LGT',  1503, 'CABECERA 01'							, ''											, 80,	95050 ,	   -1 , true , false , -1),
(1503002,	1503001,  'LGT',  1503, 'Opción 001'							, 'com.yupana.polaris.app.UctSegCliente'		, 85,	95051 ,	   -1 , true , false , -1),
(1503003,	1503001,  'LGT',  1503, 'Opción 002'							, 'com.yupana.polaris.app.UctSegCliente'		, 90,	95051 ,	   -1 , true , false , -1),
(1503004,	1503001,  'LGT',  1503, 'Opción 003'							, 'com.yupana.polaris.app.UctSegCliente'		, 95,	95051 ,	   -1 , true , false , -1),
(1503005,	1503001,  'LGT',  1503, 'Opción 004'							, 'com.yupana.polaris.app.UctSegCliente'		,100,	95051 ,	   -1 , true , false , -1),
--                                                               	                                                                
(1503006,	1503001,  'LGT',  1503, 'Reportes'								, ''											,105,	95050 ,	   -1 , true , false , -1),
(1503007,	1503001,  'LGT',  1503, 'Reporte de 00001'						, 'xxx.jasper'									,110,	95051 ,	   -1 , true , false , -1),
(1503008,	1503001,  'LGT',  1503, 'Reporte de 00002'						, 'xxx.jasper'									,115,	95051 ,	   -1 , true , false , -1),
-- opciones de abastecimiento                              	        	                                                            
(1504001,        -1,  'LGT',  1504, 'CABECERA 01'							, ''											,120,	95050 ,	   -1 , true , false , -1),
(1504002,	1504001,  'LGT',  1504, 'Opción 001'							, 'com.yupana.polaris.app.UctSegCliente'		,125,	95051 ,	   -1 , true , false , -1),
(1504003,	1504001,  'LGT',  1504, 'Opción 002'							, 'com.yupana.polaris.app.UctSegCliente'		,130,	95051 ,	   -1 , true , false , -1),
(1504004,	1504001,  'LGT',  1504, 'Opción 003'							, 'com.yupana.polaris.app.UctSegCliente'		,135,	95051 ,	   -1 , true , false , -1),
(1504005,	1504001,  'LGT',  1504, 'Opción 004'							, 'com.yupana.polaris.app.UctSegCliente'		,140,	95051 ,	   -1 , true , false , -1),
--                                                              	                                                                
(1504006,	1504001,  'LGT',  1504, 'Reportes'								, ''											,145,	95050 ,	   -1 , true , false , -1),
(1504007,	1504001,  'LGT',  1504, 'Reporte de 00001'						, 'xxx.jasper'									,150,	95051 ,	   -1 , true , false , -1),
(1504008,	1504001,  'LGT',  1504, 'Reporte de 00002'						, 'xxx.jasper'									,155,	95051 ,	   -1 , true , false , -1),
-- opciones de caja - compras                 	                    	                                                            
(1505001,	     -1,  'LGT',  1505, 'CABECERA 01'							, ''											,160,	95050 ,	   -1 , true , false , -1),
(1505002,	1505001,  'LGT',  1505, 'Opción 001'							, 'com.yupana.polaris.app.UctSegCliente'		,165,	95051 ,	   -1 , true , false , -1),
(1505003,	1505001,  'LGT',  1505, 'Opción 002'							, 'com.yupana.polaris.app.UctSegCliente'		,170,	95051 ,	   -1 , true , false , -1),
(1505004,	1505001,  'LGT',  1505, 'Opción 003'							, 'com.yupana.polaris.app.UctSegCliente'		,175,	95051 ,	   -1 , true , false , -1),
(1505005,	1505001,  'LGT',  1505, 'Opción 004'							, 'com.yupana.polaris.app.UctSegCliente'		,180,	95051 ,	   -1 , true , false , -1),
--                                                          	                                                                    
(1505006,	1505001,  'LGT',  1505, 'Reportes'								, ''											,185,	95050 ,	   -1 , true , false , -1),
(1505007,	1505001,  'LGT',  1505, 'Reporte de 00001'						, 'xxx.jasper'									,190,	95051 ,	   -1 , true , false , -1),
(1505008,	1505001,  'LGT',  1505, 'Reporte de 00002'						, 'xxx.jasper'									,195,	95051 ,	   -1 , true , false , -1),
-- opciones de supervisor logistico                                 	                                                            
(1506001,	     -1,  'LGT',  1506, 'CABECERA 01'							, ''											,200,	95050 ,	   -1 , true , false , -1),
(1506002,	1506001,  'LGT',  1506, 'Opción 001'							, 'com.yupana.polaris.app.UctSegCliente'		,205,	95051 ,	   -1 , true , false , -1),
(1506003,	1506001,  'LGT',  1506, 'Opción 002'							, 'com.yupana.polaris.app.UctSegCliente'		,210,	95051 ,	   -1 , true , false , -1),
(1506004,	1506001,  'LGT',  1506, 'Opción 003'							, 'com.yupana.polaris.app.UctSegCliente'		,215,	95051 ,	   -1 , true , false , -1),
(1506005,	1506001,  'LGT',  1506, 'Opción 004'							, 'com.yupana.polaris.app.UctSegCliente'		,220,	95051 ,	   -1 , true , false , -1),
--                                                                	                                                                
(1506006,	1506001,  'LGT',  1506, 'Reportes'								, ''											,225,	95050 ,	   -1 , true , false , -1),
(1506007,	1506001,  'LGT',  1506, 'Reporte de 00001'						, 'xxx.jasper'									,230,	95051 ,	   -1 , true , false , -1),
(1506008,	1506001,  'LGT',  1506, 'Reporte de 00002'						, 'xxx.jasper'									,235,	95051 ,	   -1 , true , false , -1),
-- opciones de gestor logistico                                     	                                                            
(1507001,	     -1,  'LGT',  1507, 'CABECERA 01'							, ''											,240,	95050 ,	   -1 , true , false , -1),
(1507002,	1507001,  'LGT',  1507, 'Opción 001'							, 'com.yupana.polaris.app.UctSegCliente'		,245,	95051 ,	   -1 , true , false , -1),
(1507003,	1507001,  'LGT',  1507, 'Opción 002'							, 'com.yupana.polaris.app.UctSegCliente'		,250,	95051 ,	   -1 , true , false , -1),
(1507004,	1507001,  'LGT',  1507, 'Opción 003'							, 'com.yupana.polaris.app.UctSegCliente'		,255,	95051 ,	   -1 , true , false , -1),
(1507005,	1507001,  'LGT',  1507, 'Opción 004'							, 'com.yupana.polaris.app.UctSegCliente'		,260,	95051 ,	   -1 , true , false , -1),
--                                                                	                                                                
(1507006,	1507001,  'LGT',  1507, 'Reportes'								, ''											,265,	95050 ,	   -1 , true , false , -1),
(1507007,	1507001,  'LGT',  1507, 'Reporte de 00001'						, 'xxx.jasper'									,270,	95051 ,	   -1 , true , false , -1),
(1507008,	1507001,  'LGT',  1507, 'Reporte de 00002'						, 'xxx.jasper'									,275,	95051 ,	   -1 , true , false , -1),
																																	
-- laboral-escalafon                                                	                                                    	    
(2001001,	     -1,  'PER',  2001, 'CONFIGURACIÓN LAB aaaaaa'				, ''											,  1,	95050 ,	   -1 , true , false , -1),
(2001002,	2001001,  'PER',  2001, 'laboral   opcion opcion opcion 1'		, 'com.yupana.polaris.app.UctSegCliente'		,  5,	95051 ,	   -1 , true , false , -1),
(2001003,	2001001,  'PER',  2001, 'laboral   opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		, 10,	95051 ,	   -1 , true , false , -1),
(2001004,	2001001,  'PER',  2001, 'laboral   opcion opcion opcion 3'		, 'com.yupana.polaris.app.UctSegCliente'		, 15,	95051 ,	   -1 , true , false , -1),
(2001005,	2001001,  'PER',  2001, 'laboral   opcion opcion opcion 4'		, 'com.yupana.polaris.app.UctSegCliente'		, 20,	95051 ,	   -1 , true , false , -1),
-- laboral-remunerador                                              	                                                    	    
(2002001,	     -1,  'PER',  2002, 'CONFIGURACIÓN LAB aaaaaa'				, ''											, 25,	95050 ,	   -1 , true , false , -1),
(2002002,	2002001,  'PER',  2002, 'laboral   opcion opcion opcion 1'		, 'com.yupana.polaris.app.UctSegCliente'		, 30,	95051 ,	   -1 , true , false , -1),
(2002003,	2002001,  'PER',  2002, 'laboral   opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		, 35,	95051 ,	   -1 , true , false , -1),
(2002004,	2002001,  'PER',  2002, 'laboral   opcion opcion opcion 3'		, 'com.yupana.polaris.app.UctSegCliente'		, 40,	95051 ,	   -1 , true , false , -1),
(2002005,	2002001,  'PER',  2002, 'laboral   opcion opcion opcion 4'		, 'com.yupana.polaris.app.UctSegCliente'		, 45,	95051 ,	   -1 , true , false , -1),
-- laboral-binestar social                                          	                                           	                
(2003001,	     -1,  'PER',  2003, 'CONFIGURACIÓN LAB aaaaaa'				, ''											, 50,	95050 ,	   -1 , true , false , -1),
(2003002,	2003001,  'PER',  2003, 'laboral   opcion opcion opcion 1'		, 'com.yupana.polaris.app.UctSegCliente'		, 55,	95051 ,	   -1 , true , false , -1),
(2003003,	2003001,  'PER',  2003, 'laboral   opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		, 60,	95051 ,	   -1 , true , false , -1),
(2003004,	2003001,  'PER',  2003, 'laboral   opcion opcion opcion 3'		, 'com.yupana.polaris.app.UctSegCliente'		, 65,	95051 ,	   -1 , true , false , -1),
(2003005,	2003001,  'PER',  2003, 'laboral   opcion opcion opcion 4'		, 'com.yupana.polaris.app.UctSegCliente'		, 70,	95051 ,	   -1 , true , false , -1),	
-- laboral-seguridad salud e higiene                                	                             	                            
(2004001,	     -1,  'PER',  2004, 'CONFIGURACIÓN LAB aaaaaa'				, ''											, 75,	95050 ,	   -1 , true , false , -1),
(2004002,	2004001,  'PER',  2004, 'laboral   opcion opcion opcion 1'		, 'com.yupana.polaris.app.UctSegCliente'		, 80,	95051 ,	   -1 , true , false , -1),
(2004003,	2004001,  'PER',  2004, 'laboral   opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		, 85,	95051 ,	   -1 , true , false , -1),
(2004004,	2004001,  'PER',  2004, 'laboral   opcion opcion opcion 3'		, 'com.yupana.polaris.app.UctSegCliente'		, 90,	95051 ,	   -1 , true , false , -1),
(2004005,	2004001,  'PER',  2004, 'laboral   opcion opcion opcion 4'		, 'com.yupana.polaris.app.UctSegCliente'		, 95,	95051 ,	   -1 , true , false , -1),	
-- laboral-gestor laboral                                     	    	                                                            
(2005001,	     -1,  'PER',  2005, 'CONFIGURACIÓN LAB aaaaaa'				, ''											,100,	95050 ,	   -1 , true , false , -1),
(2005002,	2005001,  'PER',  2005, 'laboral   opcion opcion opcion 1'		, 'com.yupana.polaris.app.UctSegCliente'		,105,	95051 ,	   -1 , true , false , -1),
(2005003,	2005001,  'PER',  2005, 'laboral   opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		,110,	95051 ,	   -1 , true , false , -1),
(2005004,	2005001,  'PER',  2005, 'laboral   opcion opcion opcion 3'		, 'com.yupana.polaris.app.UctSegCliente'		,115,	95051 ,	   -1 , true , false , -1),
(2005005,	2005001,  'PER',  2005, 'laboral   opcion opcion opcion 4'		, 'com.yupana.polaris.app.UctSegCliente'		,120,	95051 ,	   -1 , true , false , -1),	
																																	
-- finanzas - tesoreria                                             	                                                            
(2501001,	     -1,  'FIN',  2501, 'CONFIGURACIÓN FIN aaaaaa'				, ''											,  1,	95050 ,	   -1 , true , false , -1),
(2501002,	2501001,  'FIN',  2501, 'financiero opcion opcion opcion 1'		, 'com.yupana.polaris.app.UctSegCliente'		,  5,	95051 ,	   -1 , true , false , -1),
(2501003,	2501001,  'FIN',  2501, 'financiero opcion opcion opcion 2 '	, 'com.yupana.polaris.app.UctSegCliente'		, 10,	95051 ,	   -1 , true , false , -1),
(2501004,	2501001,  'FIN',  2501, 'financiero opcion opcion opcion 3'		, 'com.yupana.polaris.app.UctSegCliente'		, 15,	95051 ,	   -1 , true , false , -1),
(2501005,	2501001,  'FIN',  2501, 'financiero opcion opcion opcion 4'		, 'com.yupana.polaris.app.UctSegCliente'		, 20,	95051 ,	   -1 , true , false , -1),
--finanzas-pagaduria                                                                                                                
(2502001,	     -1,  'FIN',  2502, 'CONFIGURACIÓN FIN bbbbbb'				, ''											, 25,	95050 ,	   -1 , true , false , -1),
(2502002,	2502001,  'FIN',  2502, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		, 30,	95051 ,	   -1 , true , false , -1),
(2502003,	2502001,  'FIN',  2502, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		, 35,	95051 ,	   -1 , true , false , -1),
(2502004,	2502001,  'FIN',  2502, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		, 40,	95051 ,	   -1 , true , false , -1),
(2502005,	2502001,  'FIN',  2502, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		, 45,	95051 ,	   -1 , true , false , -1),
--finanzas-fondo fijo                                                                                                   	        
(2503001,	     -1,  'FIN',  2503, 'CONFIGURACIÓN FIN bbbbbb'				, ''											, 50,	95050 ,	   -1 , true , false , -1),
(2503002,	2503001,  'FIN',  2503, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		, 55,	95051 ,	   -1 , true , false , -1),
(2503003,	2503001,  'FIN',  2503, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		, 60,	95051 ,	   -1 , true , false , -1),
(2503004,	2503001,  'FIN',  2503, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		, 65,	95051 ,	   -1 , true , false , -1),
(2503005,	2503001,  'FIN',  2503, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		, 70,	95051 ,	   -1 , true , false , -1),							
--finanzas-fondo asistente financiero                                                                               	            
(2504001,	     -1,  'FIN',  2504, 'CONFIGURACIÓN FIN bbbbbb'				, ''											, 80,	95050 ,	   -1 , true , false , -1),
(2504002,	2504001,  'FIN',  2504, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		, 85,	95051 ,	   -1 , true , false , -1),
(2504003,	2504001,  'FIN',  2504, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		, 90,	95051 ,	   -1 , true , false , -1),
(2504004,	2504001,  'FIN',  2504, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		, 95,	95051 ,	   -1 , true , false , -1),
(2504005,	2504001,  'FIN',  2504, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,100,	95051 ,	   -1 , true , false , -1),	
--finanzas-contable?                                                                                                                
(2505001, 	     -1,  'FIN',  2505, 'CONFIGURACIÓN FIN bbbbbb'				, ''											,130,	95050 ,	   -1 , true , false , -1),
(2505002,	2505001,  'FIN',  2505, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,135,	95051 ,	   -1 , true , false , -1),
(2505003,	2505001,  'FIN',  2505, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,140,	95051 ,	   -1 , true , false , -1),
(2505004,	2505001,  'FIN',  2505, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,145,	95051 ,	   -1 , true , false , -1),
(2505005,	2505001,  'FIN',  2505, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,150,	95051 ,	   -1 , true , false , -1),	
--finanzas-gestor financiero                                                                                                        
(2506001,	     -1,  'FIN',  2506, 'CONFIGURACIÓN FIN bbbbbb'				, ''											,130,	95050 ,	   -1 , true , false , -1),
(2506002,	2506001,  'FIN',  2506, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,135,	95051 ,	   -1 , true , false , -1),
(2506003,	2506001,  'FIN',  2506, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,140,	95051 ,	   -1 , true , false , -1),
(2506004,	2506001,  'FIN',  2506, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,145,	95051 ,	   -1 , true , false , -1),
(2506005,	2506001,  'FIN',  2506, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,150,	95051 ,	   -1 , true , false , -1),	
																																	
--contable 1                                                                                                                        
--(3001001,	     -1,  'CNT',  3001, 'CONFIGURACIÓN cnt AAAAAA'				, ''											,105,	95050 ,	   -1 , true , false , -1),
--(3001002,	3001001,  'CNT',  3001, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,110,	95051 ,	   -1 , true , false , -1),
--(3001003,	3001001,  'CNT',  3001, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,115,	95051 ,	   -1 , true , false , -1),
--(3001004,	3001001,  'CNT',  3001, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,120,	95051 ,	   -1 , true , false , -1),
--(3001005,	3001001,  'CNT',  3001, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,125,	95051 ,	   -1 , true , false , -1),	
--contable 2                                                                                                                        
--(3002001,	     -1,  'CNT',  3002, 'CONFIGURACIÓN cnt bbbbbb'				, ''											,105,	95050 ,	   -1 , true , false , -1),
--(3002002,	3002001,  'CNT',  3002, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,110,	95051 ,	   -1 , true , false , -1),
--(3002003,	3002001,  'CNT',  3002, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,115,	95051 ,	   -1 , true , false , -1),
--(3002004,	3002001,  'CNT',  3002, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,120,	95051 ,	   -1 , true , false , -1),
--(3002005,	3002001,  'CNT',  3002, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,125,	95051 ,	   -1 , true , false , -1),	
--contable 3                                                                                                                              
--(3003001,	     -1,  'CNT',  3003, 'CONFIGURACIÓN cnt CCCCC'				, ''											,105,	95050 ,	   -1 , true , false , -1),
--(3003002,	3003001,  'CNT',  3003, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,110,	95051 ,	   -1 , true , false , -1),
--(3003003,	3003001,  'CNT',  3003, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,115,	95051 ,	   -1 , true , false , -1),
--(3003004,	3003001,  'CNT',  3003, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,120,	95051 ,	   -1 , true , false , -1),
--(3003005,	3003001,  'CNT',  3003, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,125,	95051 ,	   -1 , true , false , -1),	
																																	
--academico-auxiliar                                                                                                                
(3501001,	     -1,  'COL',  3501, 'CONFIGURACIÓN academic'				, ''											,  1,	95050 ,	95001 , true , false , -1),
(3501002,	3501001,  'COL',  3501, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		,  5,	95051 ,	95001 , true , false , -1),
(3501003,	3501001,  'COL',  3501, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		, 10,	95051 ,	95001 , true , false , -1),
(3501004,	3501001,  'COL',  3501, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		, 15,	95051 ,	95001 , true , false , -1),
(3501005,	3501001,  'COL',  3501, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		, 20,	95051 ,	95001 , true , false , -1),	
--academico-docente                                                 	                                                                      
(3502001,	     -1,  'COL',  3502, 'CONFIGURACIÓN academic'				, ''											, 25,	95050 ,	95001 , true , false , -1),
(3502002,	3502001,  'COL',  3502, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		, 30,	95051 ,	95001 , true , false , -1),
(3502003,	3502001,  'COL',  3502, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		, 35,	95051 ,	95001 , true , false , -1),
(3502004,	3502001,  'COL',  3502, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		, 40,	95051 ,	95001 , true , false , -1),
(3502005,	3502001,  'COL',  3502, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		, 45,	95051 ,	95001 , true , false , -1),	
--academico-asiste academico                                        	                                                                      
(3503001,	     -1,  'COL',  3503, 'CONFIGURACIÓN academic'				, ''											, 50,	95050 ,	95001 , true , false , -1),
(3503002,	3503001,  'COL',  3503, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		, 55,	95051 ,	95001 , true , false , -1),
(3503003,	3503001,  'COL',  3503, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		, 60,	95051 ,	95001 , true , false , -1),
(3503004,	3503001,  'COL',  3503, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		, 65,	95051 ,	95001 , true , false , -1),
(3503005,	3503001,  'COL',  3503, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		, 70,	95051 ,	95001 , true , false , -1),								
--academico-enfermero                                               	                                                                      
(3504001,	     -1,  'COL',  3504, 'CONFIGURACIÓN academic'				, ''											, 75,	95050 ,	95001 , true , false , -1),
(3504002,	3504001,  'COL',  3504, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		, 80,	95051 ,	95001 , true , false , -1),
(3504003,	3504001,  'COL',  3504, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		, 85,	95051 ,	95001 , true , false , -1),
(3504004,	3504001,  'COL',  3504, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		, 90,	95051 ,	95001 , true , false , -1),
(3504005,	3504001,  'COL',  3504, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		,100,	95051 ,	95001 , true , false , -1),								
--academico-psicologo                                               	                                                                      
(3505001,	     -1,  'COL',  3505, 'CONFIGURACIÓN academic'				, ''											,105,	95050 ,	95001 , true , false , -1),
(3505002,	3505001,  'COL',  3505, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		,110,	95051 ,	95001 , true , false , -1),
(3505003,	3505001,  'COL',  3505, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		,115,	95051 ,	95001 , true , false , -1),
(3505004,	3505001,  'COL',  3505, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		,120,	95051 ,	95001 , true , false , -1),
(3505005,	3505001,  'COL',  3505, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		,125,	95051 ,	95001 , true , false , -1),								
--academico-bibliotecario                                           	                                                                
(3506001,	     -1,  'COL',  3506, 'CONFIGURACIÓN academic'				, ''											,130,	95050 ,	95001 , true , false , -1),
(3506002,	3506001,  'COL',  3506, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		,135,	95051 ,	95001 , true , false , -1),
(3506003,	3506001,  'COL',  3506, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		,140,	95051 ,	95001 , true , false , -1),
(3506004,	3506001,  'COL',  3506, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		,145,	95051 ,	95001 , true , false , -1),
(3506005,	3506001,  'COL',  3506, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		,150,	95051 ,	95001 , true , false , -1),	
--academico-tareador colegio                                                                                                            
(3507001,	     -1,  'COL',  3507, 'CONFIGURACIÓN academic'				, ''											,155,	95050 ,	95001 , true , false , -1),
(3507002,	3507001,  'COL',  3507, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		,160,	95051 ,	95001 , true , false , -1),
(3507003,	3507001,  'COL',  3507, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		,165,	95051 ,	95001 , true , false , -1),
(3507004,	3507001,  'COL',  3507, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		,170,	95051 ,	95001 , true , false , -1),
(3507005,	3507001,  'COL',  3507, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		,175,	95051 ,	95001 , true , false , -1),	
--academico-gestor academico                                        	                                                                
(3508001,	     -1,  'COL',  3508, 'CONFIGURACIÓN academic'				, ''											,180,	95050 ,	95001 , true , false , -1),
(3508002,	3508001,  'COL',  3508, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		,185,	95051 ,	95001 , true , false , -1),
(3508003,	3508001,  'COL',  3508, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		,190,	95051 ,	95001 , true , false , -1),
(3508004,	3508001,  'COL',  3508, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		,195,	95051 ,	95001 , true , false , -1),
(3508005,	3508001,  'COL',  3508, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		,200,	95051 ,	95001 , true , false , -1),								
																																	
--academico-tutor academia                                          	                                                                  
(4001001,	     -1,  'ACA',  4001, 'CONFIGURACIÓN academic'				, ''											,205,	95050 ,	95002 , true , false , -1),
(4001002,	4001001,  'ACA',  4001, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		,210,	95051 ,	95002 , true , false , -1),
(4001003,	4001001,  'ACA',  4001, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		,215,	95051 ,	95002 , true , false , -1),
(4001004,	4001001,  'ACA',  4001, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		,220,	95051 ,	95002 , true , false , -1),
(4001005,	4001001,  'ACA',  4001, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		,225,	95051 ,	95002 , true , false , -1),	
--academico-tareador academia                                       	                                                                
(4002001,	     -1,  'ACA',  4002, 'CONFIGURACIÓN academic'				, ''											,230,	95050 ,	95002 , true , false , -1),
(4002002,	4002001,  'ACA',  4002, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		,235,	95051 ,	95002 , true , false , -1),
(4002003,	4002001,  'ACA',  4002, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		,240,	95051 ,	95002 , true , false , -1),
(4002004,	4002001,  'ACA',  4002, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		,245,	95051 ,	95002 , true , false , -1),
(4002005,	4002001,  'ACA',  4002, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		,250,	95051 ,	95002 , true , false , -1),	
--academico-supervisor academia                                     	                                                                
(4003001, 	     -1,  'ACA',  4003, 'CONFIGURACIÓN academic'				, ''											,255,	95050 ,	95002 , true , false , -1),
(4003002,	4003001,  'ACA',  4003, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		,260,	95051 ,	95002 , true , false , -1),
(4003003,	4003001,  'ACA',  4003, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		,265,	95051 ,	95002 , true , false , -1),
(4003004,	4003001,  'ACA',  4003, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		,270,	95051 ,	95002 , true , false , -1),
(4003005,	4003001,  'ACA',  4003, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		,275,	95051 ,	95002 , true , false , -1),	
--academico-coordinador academico                                   	                                                                   
(4004001,	     -1,  'ACA',  4004, 'CONFIGURACIÓN academic'				, ''											,280,	95050 ,	95002 , true , false , -1),
(4004002,	4004001,  'ACA',  4004, 'acade on opcion opcion A'				, 'com.yupana.polaris.app.UctSegCliente'		,285,	95051 ,	95002 , true , false , -1),
(4004003,	4004001,  'ACA',  4004, 'acaede n opcion opcion B'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95002 , true , false , -1),
(4004004,	4004001,  'ACA',  4004, 'academ n opcion opcion C'				, 'com.yupana.polaris.app.UctSegCliente'		,295,	95051 ,	95002 , true , false , -1),
(4004005,	4004001,  'ACA',  4004, 'academi  opcion opcion D'				, 'com.yupana.polaris.app.UctSegCliente'		,300,	95051 ,	95002 , true , false , -1),
																																	
--medico 1                                                                                                                          
(4501001,	     -1,  'MED',  4501, 'CONFIGURACIÓN medico 1'				, ''											,280,	95050 ,	95003 , true , false , -1),
(4501002,	4501001,  'MED',  4501, 'acaede n opcion opcion 1'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95003 , true , false , -1),
--medico 2                                                                                                                                
(4502001,	     -1,  'MED',  4502, 'CONFIGURACIÓN medico 2'				, ''											,280,	95050 ,	95003 , true , false , -1),
(4502002,	4502001,  'MED',  4502, 'acaede n opcion opcion 2'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95003 , true , false , -1),
--medico 3                                                                                                                                
(4503001,	     -1,  'MED',  4503, 'CONFIGURACIÓN medico 3'				, ''											,280,	95050 ,	95003 , true , false , -1),
(4503002,	4503001,  'MED',  4503, 'acaede n opcion opcion 3'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95003 , true , false , -1),
--medico 4                                                                                                                                
(4504001,	     -1,  'MED',  4504, 'CONFIGURACIÓN medico 4'				, ''											,280,	95050 ,	95003 , true , false , -1),
(4504002,	4504001,  'MED',  4504, 'acaede n opcion opcion 4'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95003 , true , false , -1),
--medico 5                                                                                                                                
(4505001,	     -1,  'MED',  4505, 'CONFIGURACIÓN medico 5'				, ''											,280,	95050 ,	95003 , true , false , -1),
(4505002,	4505001,  'MED',  4505, 'acaede n opcion opcion 5'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95003 , true , false , -1),
--medico 6                                                                                                                                
(4506001,	     -1,  'MED',  4506, 'CONFIGURACIÓN medico 6'				, ''											,280,	95050 ,	95003 , true , false , -1),
(4506002,	4506001,  'MED',  4506, 'acaede n opcion opcion 6'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95003 , true , false , -1),
--medico 7                                                                                                                                
(4507001,	     -1,  'MED',  4507, 'CONFIGURACIÓN medico 7'				, ''											,280,	95050 ,	95003 , true , false , -1),
(4507002,	4507001,  'MED',  4507, 'acaede n opcion opcion 7'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95003 , true , false , -1),
--medico 8                                                                                                                                
(4508001,	     -1,  'MED',  4508, 'CONFIGURACIÓN medico 8'				, ''											,280,	95050 ,	95003 , true , false , -1),
(4508002,	4508001,  'MED',  4508, 'acaede n opcion opcion 8'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95003 , true , false , -1),
																																	
--banca 1                                                                                                                           
(5001001,	     -1,  'BKA',  5001, 'CONFIGURACIÓN banca 1'					, ''											,280,	95050 ,	95004 , true , false , -1),
(5001002,	5001001,  'BKA',  5001, 'acaede n opcion opcion 1'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95004 , true , false , -1),
--banca 2                                                                                                                                 
(5002001,	     -1,  'BKA',  5002, 'CONFIGURACIÓN banca 2'					, ''											,280,	95050 ,	95004 , true , false , -1),
(5002002,	5002001,  'BKA',  5002, 'acaede n opcion opcion 2'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95004 , true , false , -1),
--banca 3                                                                                                                                 
(5003001,	     -1,  'BKA',  5003, 'CONFIGURACIÓN banca 3'					, ''											,280,	95050 ,	95004 , true , false , -1),
(5003002,	5003001,  'BKA',  5003, 'acaede n opcion opcion 3'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95004 , true , false , -1),
--banca 4                                                                                                                                 
(5004001,	     -1,  'BKA',  5004, 'CONFIGURACIÓN banca 4'					, ''											,280,	95050 ,	95004 , true , false , -1),
(5004002,	5004001,  'BKA',  5004, 'acaede n opcion opcion 4'				, 'com.yupana.polaris.app.UctSegCliente'		,290,	95051 ,	95004 , true , false , -1);





/*
----------------------------------------------------------------------------------------------------------------------------------------
--estudiante_col--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS estudiante_col;
CREATE TABLE estudiante_col (
	id_est_col			bigint			NOT NULL PRIMARY KEY,
	id_tipo_grp_sange	int,
	codigo				varchar(14),
	id_tipo_religion	
	lugar_hnos	
	numero_hnos
	id_tipo_parto
	desc_parto
	obs_medica
	obs_adicional
	exo religion
	estado
	
	correo				varchar()
	telefono			varchar()
	celular				varchar()
	estado_Actual		boolean,	
	--CONSTRAINT trabajador_ukey UNIQUE (nom_usu),
	CONSTRAINT estudiante_col_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
INSERT INTO estudiante_col (id_usuario, nom_usu, pwd_usu, fe_operacion, activo, cambio_pwd) --trabajador, fam_alumno
VALUES 
( 1, '1001.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
																												 		    
( 9, '1004.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(15, '1004.ssalazar'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(16, '1004.ysinche'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(17, '1004.sarroyo'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(18, '1004.msolano'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(19, '1004.ysuasnabar'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(20, '1004.msalazar'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(21, '1004.abeltran'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(22, '1004.jmelendez'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(23, '1004.lreyes'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(24, '1004.fcardozo'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(25, '1004.kserrano'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(26, '1004.fpaz'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(27, '1004.cgonzalez'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(28, '1004.bperez'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(29, '1004.gvergara'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
																												 		    
(10, '1005.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(31, '1005.ssalazar'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(32, '1005.ysinche'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(33, '1005.sarroyo'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(34, '1005.msolano'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false );
*/


/*
----------------------------------------------------------------------------------------------------------------------------------------
--estudiante_aca--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS estudiante_col;
CREATE TABLE estudiante_col (
	id_est_col			bigint			NOT NULL PRIMARY KEY,
	id_tipo_grp_sange	int,
	--codigo				varchar(14),  esto va en la incripcion
	egresado
	idInstEst  --donde esta estudiando o donde ereso
	--lugar_hnos	
	--numero_hnos
	--id_tipo_parto
	--desc_parto
	obs_medica
	obs_adicional
	--exo religion
	estado
	
	correo				varchar()
	telefono			varchar()
	celular				varchar()
	estado_Actual		boolean,	
	--CONSTRAINT trabajador_ukey UNIQUE (nom_usu),
	CONSTRAINT estudiante_col_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
INSERT INTO estudiante_col (id_usuario, nom_usu, pwd_usu, fe_operacion, activo, cambio_pwd) --trabajador, fam_alumno
VALUES 
( 1, '1001.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
																												 		    
( 9, '1004.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(15, '1004.ssalazar'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(16, '1004.ysinche'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(17, '1004.sarroyo'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(18, '1004.msolano'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(19, '1004.ysuasnabar'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(20, '1004.msalazar'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(21, '1004.abeltran'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(22, '1004.jmelendez'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(23, '1004.lreyes'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(24, '1004.fcardozo'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(25, '1004.kserrano'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(26, '1004.fpaz'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(27, '1004.cgonzalez'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(28, '1004.bperez'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(29, '1004.gvergara'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
																												 		    
(10, '1005.fbarzola'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(31, '1005.ssalazar'		, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(32, '1005.ysinche'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(33, '1005.sarroyo'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false ),
(34, '1005.msolano'			, '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W'	, '2019-12-17' , true, false );
*/








/*
----------------------------------------------------------------------------------------------------------------------------------------
--usuario_sede----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS usuario_sede;
CREATE TABLE usuario_sede (
	id_usu_sede			serial 		NOT NULL PRIMARY KEY,	 
	id_usuario	 		bigint 		NOT NULL,	
	id_sede				int			NOT NULL,
	activo				boolean		NOT NULL,
	CONSTRAINT usuario_sede_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE usuario_sede IS 'Sedes donde trabaja el usuario.'; 
COMMENT ON COLUMN usuario_sede.id_usuario IS 'Identificador de usuario [usuario]';
COMMENT ON COLUMN usuario_sede.id_sede IS 'Identificador de sede [sede]';
COMMENT ON COLUMN usuario_sede.activo IS 'Indica sí la sede está activo';
--
INSERT INTO usuario_sede (id_usu_sede, id_usuario, id_sede, activo) 
VALUES
-- YSST-fbarzola
( 1,  1,  'ADM',  7501 , true , false ),	
( 1,  1,  'ADM',  7502 , true , false ),	
( 1,  1,  'ADM',  7503 , true , false ),	

( 2,  1,  'COM',  1001 , true , false ),	
( 2,  1,  'COM',  1002 , true , false ),	
( 2,  1,  'COM',  1003 , true , false ),	
( 2,  1,  'COM',  1004 , true , false ),	
( 2,  1,  'COM',  1005 , true , false ),	
( 2,  1,  'COM',  1006 , true , false ),	
( 2,  1,  'COM',  1007 , true , false ),	
( 2,  1,  'COM',  1008 , true , false ),	

( 3,  1,  'LGT',  1501 , true , false ),	
( 3,  1,  'LGT',  1502 , true , false ),	
( 3,  1,  'LGT',  1503 , true , false ),	
( 3,  1,  'LGT',  1504 , true , false ),	
( 3,  1,  'LGT',  1505 , true , false ),	
( 3,  1,  'LGT',  1506 , true , false ),	
( 3,  1,  'LGT',  1507 , true , false ),	
																							
( 4,  1,  'PER',  2001 , true , false ),
( 4,  1,  'PER',  2002 , true , false ),
( 4,  1,  'PER',  2003 , true , false ),
( 4,  1,  'PER',  2004 , true , false ),
( 4,  1,  'PER',  2005 , true , false ),

( 5,  1,  'FIN',  2501 , true , false ),
( 5,  1,  'FIN',  2502 , true , false ),
( 5,  1,  'FIN',  2503 , true , false ),
( 5,  1,  'FIN',  2504 , true , false ),
( 5,  1,  'FIN',  2505 , true , false ),
( 5,  1,  'FIN',  2506 , true , false ),
	
( 6,  1,  'CNT',  3001 , true , false ),	
( 6,  1,  'CNT',  3002 , true , false ),	
( 6,  1,  'CNT',  3003 , true , false ),	

-- SJB-fbarzola
( 7,  9,  'ADM',  7501 , true , false ),	
( 7,  9,  'ADM',  7502 , true , false ),	
( 7,  9,  'ADM',  7503 , true , false ),	

( 8,  9,  'COM',  1001 , true , false ),	
( 8,  9,  'COM',  1002 , true , false ),	
( 8,  9,  'COM',  1003 , true , false ),	
( 8,  9,  'COM',  1004 , true , false ),	
( 8,  9,  'COM',  1005 , true , false ),	
( 8,  9,  'COM',  1006 , true , false ),	
( 8,  9,  'COM',  1007 , true , false ),	
( 8,  9,  'COM',  1008 , true , false ),	

( 9,  9,  'LGT',  1501 , true , false ),	
( 9,  9,  'LGT',  1502 , true , false ),	
( 9,  9,  'LGT',  1503 , true , false ),	
( 9,  9,  'LGT',  1504 , true , false ),	
( 9,  9,  'LGT',  1505 , true , false ),	
( 9,  9,  'LGT',  1506 , true , false ),	
( 9,  9,  'LGT',  1507 , true , false ),	
																							
(10,  9,  'PER',  2001 , true , false ),
(10,  9,  'PER',  2002 , true , false ),
(10,  9,  'PER',  2003 , true , false ),
(10,  9,  'PER',  2004 , true , false ),
(10,  9,  'PER',  2005 , true , false ),

(11,  9,  'FIN',  2501 , true , false ),
(11,  9,  'FIN',  2502 , true , false ),
(11,  9,  'FIN',  2503 , true , false ),
(11,  9,  'FIN',  2504 , true , false ),
(11,  9,  'FIN',  2505 , true , false ),
(11,  9,  'FIN',  2506 , true , false ),
	
(12,  9,  'CNT',  3001 , true , false ),	
(12,  9,  'CNT',  3002 , true , false ),	
(12,  9,  'CNT',  3003 , true , false ),

(13,  9,  'COL',  3501 , true , false ),	
(13,  9,  'COL',  3502 , true , false ),	
(13,  9,  'COL',  3503 , true , false ),	
(13,  9,  'COL',  3504 , true , false ),	
(13,  9,  'COL',  3505 , true , false ),	
(13,  9,  'COL',  3506 , true , false ),	
(13,  9,  'COL',  3507 , true , false ),	
(13,  9,  'COL',  3508 , true , false ),	

-- SANFER-fbarzola
(21, 10,  'ADM',  7501 , true , false ),	
(21, 10,  'ADM',  7502 , true , false ),	
(21, 10,  'ADM',  7503 , true , false ),	

(22, 10,  'COM',  1001 , true , false ),	
(22, 10,  'COM',  1002 , true , false ),	
(22, 10,  'COM',  1003 , true , false ),	
(22, 10,  'COM',  1004 , true , false ),	
(22, 10,  'COM',  1005 , true , false ),	
(22, 10,  'COM',  1006 , true , false ),	
(22, 10,  'COM',  1007 , true , false ),	
(22, 10,  'COM',  1008 , true , false ),	

(23, 10,  'LGT',  1501 , true , false ),	
(23, 10,  'LGT',  1502 , true , false ),	
(23, 10,  'LGT',  1503 , true , false ),	
(23, 10,  'LGT',  1504 , true , false ),	
(23, 10,  'LGT',  1505 , true , false ),	
(23, 10,  'LGT',  1506 , true , false ),	
(23, 10,  'LGT',  1507 , true , false ),	
																							
(24, 10,  'PER',  2001 , true , false ),
(24, 10,  'PER',  2002 , true , false ),
(24, 10,  'PER',  2003 , true , false ),
(24, 10,  'PER',  2004 , true , false ),
(24, 10,  'PER',  2005 , true , false ),

(25, 10,  'FIN',  2501 , true , false ),
(25, 10,  'FIN',  2502 , true , false ),
(25, 10,  'FIN',  2503 , true , false ),
(25, 10,  'FIN',  2504 , true , false ),
(25, 10,  'FIN',  2505 , true , false ),
(25, 10,  'FIN',  2506 , true , false ),
	
(26, 10,  'CNT',  3001 , true , false ),	
(26, 10,  'CNT',  3002 , true , false ),	
(26, 10,  'CNT',  3003 , true , false ),

(27, 10,  'ACA',  4001 , true , false ),	
(27, 10,  'ACA',  4002 , true , false ),	
(27, 10,  'ACA',  4003 , true , false ),	
(27, 10,  'ACA',  4004 , true , false );

*/



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




--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--adm_inst_estudios---------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists adm_inst_estudios; 
CREATE TABLE adm_inst_estudios (
	idInstEst		bigserial		not null primary key,
	id_tipo_inst	int			 	not null,
	sigla			varchar(25)		not null,
	nombre			varchar(75)		not null,
	ciudad			varchar(50)		not null
);
--
CREATE UNIQUE INDEX institucion_estudio_noms_ukey ON adm_inst_estudios ( fn_my_fn_unaccent(nombre) , fn_my_fn_unaccent(ciudad) );
ALTER SEQUENCE adm_inst_estudios_idInstEst_seq RESTART WITH 9;
--
COMMENT ON TABLE adm_inst_estudios IS 'Instituciones de estudio.'; 
COMMENT ON COLUMN adm_inst_estudios.idInstEst IS 'Identificador de institución de estudio.';
COMMENT ON COLUMN adm_inst_estudios.id_tipo_inst IS 'Id. del tipo de institución [TI_INSTEST].';
COMMENT ON COLUMN adm_inst_estudios.sigla IS 'Sigla o abreviatura.';
COMMENT ON COLUMN adm_inst_estudios.nombre IS 'Nombre completo de la institución.';
COMMENT ON COLUMN adm_inst_estudios.ciudad IS 'Ciudad.';
--
INSERT INTO adm_inst_estudios (idInstEst, id_tipo_inst, sigla, nombre, ciudad)  
VALUES 
( 1, 156 , 'UPLA'	, 'UNIVERSIDAD PERUANA LOS ANDES'		, ''		),
( 2, 156 , 'UNCP'	, 'UNIVERSIDAD DEL CENTRO DEL PERÚ'		, ''		),
( 3, 156 , 'UTP'	, 'UNIVERSIDAD TECNOLÓGICA DEL PERÚ'	, ''		),
( 4, 150 , ''		, 'COLEGIO SANTA ISABEL'				, 'HUANCAYO'),
( 5, 150 , ''		, 'COLEGIO SAN JUAN BOSCO'				, 'HUANCAYO'),
( 6, 150 , ''		, 'COLEGIO NUESTRA SEÑORA DEL ROSARIO'	, 'HUANCAYO'),
( 7, 150 , ''		, 'COLEGIO SAGRADA FAMILIA'				, 'TARMA'   );


--INDICAR SI ES ESTTAL PROVADA MIXTA




--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--adm_lugar_nac-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists adm_lugar_nac; 
CREATE TABLE adm_lugar_nac (
	id_persona	bigint			NOT NULL,
	id_pais		int				NOT NULL,
	id_dist		char(6)			NOT NULL,
	nom_lugar	varchar(50) 	NOT NULL, 
	fe_nac		date			NOT NULL,
	CONSTRAINT lugar_nac_pkey PRIMARY KEY (id_persona),
	CONSTRAINT lugar_nac_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm_lugar_nac IS 'Lugar de nacimiento.'; 
COMMENT ON COLUMN adm_lugar_nac.id_persona IS 'Identificador de persona.';
COMMENT ON COLUMN adm_lugar_nac.id_pais IS 'Identificador de pais.';
COMMENT ON COLUMN adm_lugar_nac.id_dist IS 'Identificador de distrito.';
COMMENT ON COLUMN adm_lugar_nac.nom_lugar IS 'Nombre del centro poblado u otra observación.';
COMMENT ON COLUMN adm_lugar_nac.fe_nac IS 'Fecha de nacimiento.';
--
INSERT INTO adm_lugar_nac (id_persona, id_pais, id_dist, nom_lugar, fe_nac) 
	VALUES 
( 1, 9589, '110501', ''								, '1978-10-20'	),
(20, 9589, '110501', ''								, '1978-10-20'	),
(21, 9589, '140133', 'Fecha Real Nac. 21 JUL 1978'	, '1978-09-08'	);




--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--adm_familiar--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists adm_familiar; 
CREATE TABLE adm_familiar (
	id_familiar			bigint			NOT null primary key,
	ocupacion			varchar(75)		not null,					
	centro_lab			varchar(75)		not null,
	centro_lab_det		varchar(75)	not null,
	CONSTRAINT familiar_id_fam_fkey FOREIGN KEY (id_familiar) REFERENCES persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm_familiar IS 'Familiar del estudiante.'; 
COMMENT ON COLUMN adm_familiar.id_familiar IS 'Identificador del familiar o persona.';
COMMENT ON COLUMN adm_familiar.ocupacion IS 'Ocupación o labor que realiza.';
COMMENT ON COLUMN adm_familiar.centro_lab IS 'Nombre del centro de labores.';
COMMENT ON COLUMN adm_familiar.centro_lab_det IS 'Datos de contacto del centro de labores.';
--
INSERT INTO adm_familiar (id_familiar, ocupacion, centro_lab, centro_lab_det) 
VALUES 
(20, 'DESARROLLADOR DE SISTEMAS'	, 'C.E. SAN JUAN BOSCO'	, 'JR. CUZCO NRO 779, HUANCAYO. TELF: 064233789' ),
(21, 'EMPLEADO X'					, 'C.E. SAN JUAN BOSCO'	, 'JR. CUZCO NRO 779, HUANCAYO. TELF: 064233789' ),
(22, 'EMPLEADO Y'					, 'C.E. SAN JUAN BOSCO'	, 'JR. CUZCO NRO 779, HUANCAYO. TELF: 064233789' ),
(23, 'EMPLEADO Z'					, 'C.E. SAN JUAN BOSCO'	, 'JR. CUZCO NRO 779, HUANCAYO. TELF: 064233789' ),
(24, 'EMPLEADO XYZ'					, 'C.E. SAN JUAN BOSCO'	, 'JR. CUZCO NRO 779, HUANCAYO. TELF: 064233789' );




--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--adm_familiar_est----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists adm_familiar_est;
CREATE TABLE adm_familiar_est (
	id_fam_est			bigserial		NOT null primary key,
	id_familiar			bigint			not null,
	id_estudiante		bigint			not null,	
	id_tipo_pariente	int				not null,
	fallecido			bool			not null,
	apoderado			bool			not null,	
	vive_con_est		bool			not null,		
	CONSTRAINT familiar_est_id_familiar_fkey FOREIGN KEY (id_familiar) REFERENCES adm_familiar(id_familiar) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm_familiar_est IS 'Familiar del estudiante.'; 
COMMENT ON COLUMN adm_familiar_est.id_fam_est IS 'Identificador de entidad.';
COMMENT ON COLUMN adm_familiar_est.id_familiar IS 'Identificador del familiar.';
COMMENT ON COLUMN adm_familiar_est.id_estudiante IS 'Identificador del estudiante.';
COMMENT ON COLUMN adm_familiar_est.id_tipo_pariente IS 'Ientificador del tipo de pariente [TI_PARIENT].';
COMMENT ON COLUMN adm_familiar_est.fallecido IS 'Si el familiar falleció.';
COMMENT ON COLUMN adm_familiar_est.apoderado IS 'Si es apoderado del estudiante.';
COMMENT ON COLUMN adm_familiar_est.vive_con_est IS 'Si vive con el estudiante.';
--
INSERT INTO adm_familiar_est (id_familiar, id_estudiante, id_tipo_pariente, fallecido, apoderado, vive_con_est) 
VALUES 
(21, 20, 283, true, true , true ),
(22, 20, 284, true, false, true ),
(23, 20, 285, true, false, true );














--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--adm_estudiante_cole-------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists adm_estudiante_cole; 
CREATE TABLE adm_estudiante_cole (
	id_est_col			bigint			NOT null primary key,
	cod_estudiante		varchar(14)		not null,	
	id_tipo_lengua1		int				not null,		
	id_tipo_lengua2		int				not null,		
	id_tipo_religion	int				not null,						
	hnos_lugar			int				not null,		
	hnos_total			int				not null,						
	id_tipo_viv			int				not null,		
	id_tipo_viv_mat		int				not null,		
	id_tipo_viv_con		int				not null,
	id_tipo_fam_ing		int				not null,		
	id_tipo_fam_seg		int				not null,
	id_tipo_fam_veh		int				not null,
	activo				bool			not null,
	correo_cole			varchar(75)     not null,
	CONSTRAINT estudiante_cole_id_est_col_fkey FOREIGN KEY (id_est_col) REFERENCES persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm_estudiante_cole IS 'Estudiantes de colegio.'; 
COMMENT ON COLUMN adm_estudiante_cole.id_est_col IS 'Identificador de estudiante o persona.';
COMMENT ON COLUMN adm_estudiante_cole.cod_estudiante IS 'Código que asigna la UGEL al estudiante.';
COMMENT ON COLUMN adm_estudiante_cole.id_tipo_lengua1 IS 'Identificador del idioma materno [TI_LENGUA-].';
COMMENT ON COLUMN adm_estudiante_cole.id_tipo_lengua2 IS 'Identificador del segundo idioma [TI_LENGUA-].';
COMMENT ON COLUMN adm_estudiante_cole.id_tipo_religion IS 'Identificador de la religión que profesa [TI_RELIGIO].';
COMMENT ON COLUMN adm_estudiante_cole.hnos_lugar IS 'Lugar que ocupa en el total de hermanos.';
COMMENT ON COLUMN adm_estudiante_cole.hnos_total IS 'Total de hermanos.';
COMMENT ON COLUMN adm_estudiante_cole.id_tipo_viv IS 'Identificador del tipo de vivienda [TI_VIVIEND].';
COMMENT ON COLUMN adm_estudiante_cole.id_tipo_viv_mat IS 'Identificador del material de vivienda [TI_VIVMATE].';
COMMENT ON COLUMN adm_estudiante_cole.id_tipo_viv_con IS 'Identificador de la condición de vivienda [TI_VIVCOND].';
COMMENT ON COLUMN adm_estudiante_cole.id_tipo_fam_ing IS 'Identificador del tipo de ingreso mensual familiar [TI_FAMINGR].';
COMMENT ON COLUMN adm_estudiante_cole.id_tipo_fam_seg IS 'Identificador del tipo de seguro de salud [TI_FAMSEGU].';
COMMENT ON COLUMN adm_estudiante_cole.id_tipo_fam_veh IS 'Identificador del tipo de vehículo con el que se desplaza [TI_FAMVEHI].';
COMMENT ON COLUMN adm_estudiante_cole.activo IS 'Cuando esta inactivo no se debe modificar sus datos.';
COMMENT ON COLUMN adm_estudiante_cole.correo_cole IS 'Correo del estudiante.';
--
INSERT INTO adm_estudiante_cole (id_est_col, cod_estudiante, id_tipo_lengua1, id_tipo_lengua2, id_tipo_religion, hnos_lugar, hnos_total, 
	id_tipo_viv, id_tipo_viv_mat, id_tipo_viv_con, id_tipo_fam_ing, id_tipo_fam_seg, id_tipo_fam_veh, activo, correo_cole) 
VALUES 
(20, '12345678901234', 170, 192, 210, 3, 5, 221, 230, 240, 258, 262, 301, true  , 'correo@sanjuanbosco.edu.pe'),
(21, '12345678901235',  -1,  -1,  -1, 3, 5,	 -1,  -1,  -1,  -1,  -1,  -1, false , 'correo@sanjuanbosco.edu.pe');




--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--adm_estudiante_acad-------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists adm_estudiante_acad;
CREATE TABLE adm_estudiante_acad (
	id_est_acad			bigint			not null primary key,
	cod_estudiante		varchar(20)		not null,	
	activo				bool			not null,
	correo_acad			varchar(75)		not null,
	CONSTRAINT estudiante_acad_id_est_aca_fkey FOREIGN KEY (id_est_acad) REFERENCES persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm_estudiante_acad IS 'Estudiantes de la academia.';
COMMENT ON COLUMN adm_estudiante_acad.id_est_acad IS 'Identificador de estudiante o persona.';
COMMENT ON COLUMN adm_estudiante_acad.cod_estudiante IS 'Código que se asigna para las fichas de exámenes tipo admisión.';
COMMENT ON COLUMN adm_estudiante_acad.activo IS 'Cuando esta inactivo no se debe modificar sus datos.';
COMMENT ON COLUMN adm_estudiante_acad.correo_acad IS 'Correo del estudiante.';
--
INSERT INTO adm_estudiante_acad (id_est_acad, cod_estudiante, activo, correo_acad) 
VALUES
(20, '1234567890', true , 'sf40110805@sanjuanbosco.edu.pe'),
(21, '9190910002', false, 'sf40110805@sanjuanbosco.edu.pe');


*/







/*
----------------------------------------------------------------------------------------------------------------------------------------
--persona_jur-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists persona_jur; 
CREATE TABLE persona_jur (
	id_per_jur			bigint			NOT null primary key,	
	id_tipo_estado		int				not null,
	id_tipo_condicion	int				not null,
	obs					varchar(100)	not null--,	
	--CONSTRAINT persona_jur_id_per_jur_fkey FOREIGN KEY (id_per_jur) REFERENCES persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE persona_jur IS 'Empresas que son clientes o proveedores.'; 
COMMENT ON COLUMN persona_jur.id_per_jur IS 'Identificador de persona jurídica.';
COMMENT ON COLUMN persona_jur.id_tipo_estado IS 'Identificador de estado en SUNAT [].';
COMMENT ON COLUMN persona_jur.id_tipo_condicion IS 'Identificador de condición en SUNAt [].';
COMMENT ON COLUMN persona_jur.obs IS 'Observación o anotación sobre el cliente.';
--
INSERT INTO persona_jur (id_per_jur, id_tipo_estado, id_tipo_condicion, obs) 
VALUES 
(27, -1	, -1 , 'OBS 01' ),
(28, -1	, -1 , 'OBS 01' );
*/




/*
----------------------------------------------------------------------------------------------------------------------------------------
--persona---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists persona;
create table persona (
	id_persona 				bigserial 		not null	primary key,
	id_empresa		 		int				not null,
	id_tipo_persona 		int		 		not null,	
	id_tipo_doc_ident 		int		 		not null,	
	num_doc_ident			varchar(20) 	not null,	
	--nom_corrido			boolean			not null,	--SI IRA EN VAR_GLOBAL
	paterno 				varchar(30) 	not null,
	materno 				varchar(30) 	not null,
	nombres 				varchar(125) 	not null,		
	num_ruc_per_nat			varchar(11)		not null,
	sigla 					varchar(125) 	not null,	
	--id_direccion			bigint			not null,	
	--fijo 					varchar(50) 	not null,
	--movil 				varchar(50) 	not null,
	--correo				varchar(75) 	not null,
	obs						varchar(50) 	not null,
	validado 				bool 			not null,	
	id_tipo_estado_ruc		int				null,
	id_tipo_condicion_ruc	int				null,
	
	--id_tipo_sexo 			int		 		not null,
	--id_tipo_est_civil		int				not null,	
	--id_grp_fam			bigint			null,
	--id_tipo_sit_educ		int				not null,		
	--idInstEst			bigint			null,	
			
	--CONSTRAINT persona_id_grp_fam_fkey FOREIGN KEY (id_grp_fam) REFERENCES adm_grupo_fams(id_grp_fam) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	--CONSTRAINT persona_idInstEst_fkey FOREIGN KEY (idInstEst) REFERENCES adm_inst_estudios(idInstEst) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT persona_num_doc_ukey unique (id_empresa , id_tipo_doc_ident , num_doc_ident)	
);
--
CREATE UNIQUE INDEX persona_nombres_ukey ON persona ( id_empresa , fn_my_fn_unaccent(paterno), fn_my_fn_unaccent(materno) , fn_my_fn_unaccent(nombres) );
ALTER SEQUENCE persona_id_persona_seq RESTART WITH 40;
--
COMMENT ON TABLE persona IS 'Personas y empresas.'; 
COMMENT ON COLUMN persona.id_persona IS 'Identificador de persona o empresa.';
COMMENT ON COLUMN persona.id_empresa IS 'Identificador de empresa.';
COMMENT ON COLUMN persona.id_tipo_persona IS 'Identificador del tipo de persona [TI_PERSONA].';
--COMMENT ON COLUMN persona.id_tipo_sexo IS 'Identificador del tipo de sexo [TI_SEXO---].';
COMMENT ON COLUMN persona.id_tipo_doc_ident IS 'Identificador del tipo de documento de identidad [TI_DOC_IDENT].';
COMMENT ON COLUMN persona.num_doc_ident IS 'Número del documento de identidad.';
COMMENT ON COLUMN persona.paterno IS 'Apellido paterno o en blanco si es empresa.';
COMMENT ON COLUMN persona.materno IS 'Apellido materno o en blanco si es empresa.';
COMMENT ON COLUMN persona.nombres IS 'Nombres de la persona o razón social de la empresa.';
COMMENT ON COLUMN persona.num_ruc_per_nat IS 'Si es del tipo persona, registra RUC si lo tiene.';
COMMENT ON COLUMN persona.sigla IS 'Nombre comercial de empresa o persona con RUC.';
--COMMENT ON COLUMN persona.fijo IS 'Número del teléfono fijo.';
--COMMENT ON COLUMN persona.movil IS 'Número del celular.';
--COMMENT ON COLUMN persona.correo IS 'Correo personal.';
--COMMENT ON COLUMN persona.id_direccion IS 'Identificador de dirección.';
--COMMENT ON COLUMN persona.id_tipo_est_civil IS 'Identificador del tipo de estado civil [TI_ESTCIV-].';
COMMENT ON COLUMN persona.obs IS 'Observación, o anotación adicional de un cliente.';
COMMENT ON COLUMN persona.validado IS 'Si es true, ya no se puede modificar ciertos datos.';
COMMENT ON COLUMN persona.id_tipo_estado_ruc IS 'Identificador de estado en SUNAT [TI_ESTADO_RUC].';
COMMENT ON COLUMN persona.id_tipo_condicion_ruc IS 'Identificador de condición en SUNAT [TI_CONDICION_RUC].';
--COMMENT ON COLUMN persona.id_grp_fam IS 'Identificador del grupo familiar.';
--COMMENT ON COLUMN persona.id_tipo_sit_educ IS 'Identificador del tipo de situación educativa [TI_SITEDUC].';
--COMMENT ON COLUMN persona.idInstEst IS 'Identificador de la institución de estudios.';
--
INSERT INTO persona (id_persona, id_empresa, id_tipo_persona, id_tipo_doc_ident, num_doc_ident, paterno, materno, nombres, num_ruc_per_nat, sigla, obs, validado, id_tipo_estado_ruc, id_tipo_condicion_ruc)
VALUES
(   0 ,    -1 , 75019,   75049 , 	'-'				,   ''			, ''			, 'CLIENTES VARIOS'							,  ''			 	, ''							, '' , true	,  10007 , 10013 ),

(	1 ,  1001 , 75010,   75030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '1040110805' 	, ''							, '' , true	,  10001 , 10010 ),
(	2 ,  1001 , 75011,   75032 ,   '20600695771'	,   ''			, ''			, 'NUBEFACT S.A.'							,  ''				, ''							, '' , true	,  10001 , 10010 ),
(	3 ,  1001 , 75011,   75032 ,   '20133746278'	,   ''			, ''			, 'C.E. SAN JUAN BOSCO S.A.C.'				,  ''				, ''							, '' , true	,  10001 , 10010 ),
(	4 ,  1001 , 75010,   75030 ,   '07823084'		,   'YHA'		, 'GIBU'		, 'TAMMY GERALDINE'							,  '10078230849'	, 'LIBRERÍA BAZAR GERALDINE'	, '' , true	,  10001 , 10010 ),
(	5 ,  1001 , 75010,   75030 ,   '07826812'		,   'SALAZAR'	, 'LOAYZA'		, 'MIGUEL ANGEL'							,  '10078268129'	, 'MUNDO DE LOS LIBROS'			, '' , true	,  10001 , 10010 ),
(	6 ,  1001 , 75011,   75032 ,   '20611899964'	,   ''		    , ''		    , 'CASS - CAFÉ PASTELERIA S.A.C.'			,  ''				, ''							, '' , true	,  10001 , 10010 ),

(	7 ,  1002 , 75010,   75030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '1040110805' 	, ''							, '' , true	,  10001 , 10010 ),
(	8 ,  1003 , 75010,   75030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '1040110805' 	, ''							, '' , true	,  10001 , 10010 ),
(	9 ,  1004 , 75010,   75030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '1040110805' 	, ''							, '' , true	,  10001 , 10010 ),
(  10,   1005 , 75010,   75030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '1040110805' 	, ''							, '' , true	,  10001 , 10010 ),
(  11 ,  1006 , 75010,   75030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '1040110805' 	, ''							, '' , true	,  10001 , 10010 ),
(  12 ,  1007 , 75010,   75030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '1040110805' 	, ''							, '' , true	,  10001 , 10010 ),
(  13 ,  1008 , 75010,   75030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '1040110805' 	, ''							, '' , true	,  10001 , 10010 ),
(  14 ,  1009 , 75010,   75030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '1040110805' 	, ''							, '' , true	,  10001 , 10010 ),

(  15 ,  1004 , 75010,   75030 ,   '20121955'		,   'SALAZAR'	, 'SAAVEDRA'	, 'SARA SAIDA'								,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  16 ,  1004 , 75010,   75030 ,   '41330439'		,   'SINCHE'	, 'BARRA'		, 'YENNY GIOVANNA'							,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  17 ,  1004 , 75010,   75030 ,   '71326982'		,   'ARROYO'	, 'QUINTANA'	, 'SHIRLEY ELIZABETH'						,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  18 ,  1004 , 75010,   75030 ,   '44681435'		,   'SOLANO'	, 'SULCA'		, 'MARISA DIANA'							,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  19 ,  1004 , 75010,   75030 ,   '41798320'		,   'SUASNABAR'	, 'ROJAS'		, 'YESENIA YULIA'							,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  20 ,  1004 , 75010,   75030 ,   '07826812'		,   'SALAZAR'	, 'LOAYZA'		, 'MIGUEL ANGEL'							,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  21 ,  1004 , 75010,   75030 ,   '19917113'		,   'BELTRAN'	, 'GALLARDO'	, 'ALBERTO DOMINGO'							,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  22 ,  1004 , 75010,   75030 ,   '0496341'		,   'MELENDEZ'	, 'HERRERA'		, 'JOSE MARIA IGNACIO'						,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  23 ,  1004 , 75010,   75030 ,   '20029016'		,   'REYES'		, 'ARTICA'		, 'LUZ NERIDA'								,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  24 ,  1004 , 75010,   75030 ,   '70019247'		,   'CARDOZO'	, 'VILLAGARAY'	, 'FANNY ROSARIO'							,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  25 ,  1004 , 75010,   75030 ,   '42444816'		,   'SERRANO'	, 'ALCANTARA'	, 'KARINA BERTHA'							,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  26 ,  1004 , 75010,   75030 ,   '71696400'		,   'PAZ'		, 'MORALES'		, 'FIORELLA GERALDINE'						,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  27 ,  1004 , 75010,   75030 ,   '42844755'		,   'GONZALEZ'	, 'FLORES'		, 'CINTHIA'									,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  28 ,  1004 , 75010,   75030 ,   '20440709'		,   'PEREZ'		, 'MEZA'		, 'BLANCA JESUS'							,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  29 ,  1004 , 75010,   75030 ,   '20074916'		,   'VERGARA'	, 'IZAGUIRRE'	, 'GABRIELA'								,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  30 ,  1004 , 75011,   75032 ,   '20603133111'	,   ''			, ''			, 'YUPANA STUDIO E.I.R.L'					,  ''			 	, ''							, '' , true	,  10001 , 10010 ),

(  31 ,  1005 , 75010,   75030 ,   '20121955'		,   'SALAZAR'	, 'SAAVEDRA'	, 'SARA SAIDA'								,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  32 ,  1005 , 75010,   75030 ,   '41330439'		,   'SINCHE'	, 'BARRA'		, 'YENNY GIOVANNA'							,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  33 ,  1005 , 75010,   75030 ,   '71326982'		,   'ARROYO'	, 'QUINTANA'	, 'SHIRLEY ELIZABETH'						,  ''			 	, ''							, '' , true	,  10001 , 10010 ),
(  34 ,  1005 , 75010,   75030 ,   '44681435'		,   'SOLANO'	, 'SULCA'		, 'MARISA DIANA'							,  ''			 	, ''							, '' , true	,  10001 , 10010 );
*/











--select * from adm_grupo_fams gf ;
--select * from persona p where id_grp_fam = -1;










--contactos			varchar(1000)   not null,	COMMENT ON COLUMN adm_empresas.contactos IS 'Lista de contactos en formato: nom_apes;área;correo;celular|';
--LOS CAONTACTOS CUANDO SE CREA/REGISTRA EL CLIENTE PARA EMITIR LOS COMPROBANTES


--
 --###  , factura ;;; si es true emite factura???   EN_DATOS_PERSONA

















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
----------------------------------------------------------------------------------------------------------------------------------------
--adm.direccion-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.direccion; 
CREATE TABLE adm.direccion (
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
	CONSTRAINT direccion_id_distrito_fkey FOREIGN KEY (id_distrito) REFERENCES adm.distrito(id_distrito) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
CREATE UNIQUE INDEX direccion_nom_via_ukey ON adm.direccion ( id_empresa , id_distrito, id_tipo_via , fn_my_unaccent(nom_via) );
CREATE INDEX direccion_id_distrito_idx ON adm.direccion (id_distrito);
CREATE INDEX direccion_id_empresa_idx ON adm.direccion (id_empresa);
--
COMMENT ON TABLE adm.direccion IS 'Direcciones por empresa.'; 
COMMENT ON COLUMN adm.direccion.id_direccion IS 'Identificador de dirección.';
COMMENT ON COLUMN adm.direccion.corrido IS 'Indica si toda la dirección irá en la columna "nom_via".';
COMMENT ON COLUMN adm.direccion.id_tipo_via IS 'Identificador del tipo de vía [TI_VIA].';
COMMENT ON COLUMN adm.direccion.nom_tipo_via IS 'Abreviatura del tipo de vía.';
COMMENT ON COLUMN adm.direccion.nom_via IS 'Nombre de la vía o dirección.';
COMMENT ON COLUMN adm.direccion.id_tipo_zona IS 'Identificador del tipo de zona [TI_ZONA].';
COMMENT ON COLUMN adm.direccion.nom_tipo_zona IS 'Abreviatura del tipo de zona.';
COMMENT ON COLUMN adm.direccion.nom_zona IS 'Nombre de la zona.';
COMMENT ON COLUMN adm.direccion.referencia IS 'Referencia de la dirección.';
COMMENT ON COLUMN adm.direccion.id_pais IS 'Identificador del país [ADM.PAIS].';
COMMENT ON COLUMN adm.direccion.id_distrito IS 'Identificador del distrito [ADM.DISTRITO].';
COMMENT ON COLUMN adm.direccion.latitud IS 'Coordenada en latitud.';
COMMENT ON COLUMN adm.direccion.longitud IS 'Coordenada en longitud.';
COMMENT ON COLUMN adm.direccion.id_empresa IS 'Identificador de empresa [ADM.EMPRESA].';
--
INSERT INTO adm.direccion (corrido, id_tipo_via, nom_tipo_via, nom_via, id_tipo_zona, nom_tipo_zona, nom_zona, referencia, id_pais, id_distrito, latitud, longitud, id_empresa)
VALUES
(false, 95061, 'JR.' ,  'SANTA ISABEL NRO. 2065'   ,  95090,  'URB.' , 'MIRAFLORES' 	, 'ENTRE SANTA ISABEL Y SUMAR'     	, 9589, '110113' , '-12.0487659256089'	, '-75.2205508947372' ,  1004);




----------------------------------------------------------------------------------------------------------------------------------------
--adm.persona---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.persona;
CREATE TABLE adm.persona (
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
CREATE UNIQUE INDEX persona_nombres_ukey ON adm.persona (id_empresa , fn_my_unaccent(paterno), fn_my_unaccent(materno) , fn_my_unaccent(nombres));
ALTER SEQUENCE adm.persona_id_persona_seq RESTART WITH 35;
--
COMMENT ON TABLE adm.persona IS 'Personas y empresas.'; 
COMMENT ON COLUMN adm.persona.id_persona IS 'Identificador de persona o empresa.';
COMMENT ON COLUMN adm.persona.id_empresa IS 'Identificador de empresa del sistema.';
COMMENT ON COLUMN adm.persona.id_tipo_persona IS 'Identificador del tipo de persona [TI_PERSONA].';
COMMENT ON COLUMN adm.persona.id_tipo_doc_ident IS 'Identificador del tipo de documento de identidad [TI_DOC_IDENT].';
COMMENT ON COLUMN adm.persona.num_doc_ident IS 'Número del documento de identidad.';
COMMENT ON COLUMN adm.persona.paterno IS 'Apellido paterno o en blanco si es empresa.';
COMMENT ON COLUMN adm.persona.materno IS 'Apellido materno o en blanco si es empresa.';
COMMENT ON COLUMN adm.persona.nombres IS 'Nombres de la persona o razón social de la empresa.';
COMMENT ON COLUMN adm.persona.num_ruc_per_nat IS 'Si es del tipo persona, registra RUC si lo tiene.';
COMMENT ON COLUMN adm.persona.sigla IS 'Nombre comercial de empresa o persona con RUC.';
COMMENT ON COLUMN adm.persona.validado IS 'Si es true, ya no se puede modificar ciertos datos.';
--
INSERT INTO adm.persona (id_persona, id_empresa, id_tipo_persona, id_tipo_doc_ident, num_doc_ident, paterno, materno, nombres, num_ruc_per_nat, sigla, validado)
VALUES
(   0 ,    -1 , 95019,   95049 , 	'-'				,   ''			, ''			, 'CLIENTES VARIOS'							,  ''			 	, ''							, true	),
																																															
(	1 ,  1001 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(	2 ,  1001 , 95011,   95032 ,   '20600695771'	,   ''			, ''			, 'NUBEFACT S.A.'							,  ''				, ''							, true	),
(	3 ,  1001 , 95011,   95032 ,   '20133746278'	,   ''			, ''			, 'C.E. SAN JUAN BOSCO S.A.C.'				,  ''				, ''							, true	),
(	4 ,  1001 , 95010,   95030 ,   '07823084'		,   'YHA'		, 'GIBU'		, 'TAMMY GERALDINE'							,  '10078230849'	, 'LIBRERÍA BAZAR GERALDINE'	, true	),
(	5 ,  1001 , 95010,   95030 ,   '07826812'		,   'SALAZAR'	, 'LOAYZA'		, 'MIGUEL ANGEL'							,  '10078268129'	, 'MUNDO DE LOS LIBROS'			, true	),
(	6 ,  1001 , 95011,   95032 ,   '20611899964'	,   ''		    , ''		    , 'CASS - CAFÉ PASTELERIA S.A.C.'			,  ''				, ''							, true	),
																																															
(	7 ,  1002 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(	8 ,  1003 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(	9 ,  1004 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(  10,   1005 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(  11 ,  1006 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(  12 ,  1007 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(  13 ,  1008 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
(  14 ,  1009 , 95010,   95030 ,   '40110805'		,   'BARZOLA'	, 'OLIVARES'	, 'FRANKLIN ANTONIO'						,  '10401108055' 	, ''							, true	),
																																															
(  15 ,  1004 , 95010,   95030 ,   '20121955'		,   'SALAZAR'	, 'SAAVEDRA'	, 'SARA SAIDA'								,  ''			 	, ''							, true	),
(  16 ,  1004 , 95010,   95030 ,   '41330439'		,   'SINCHE'	, 'BARRA'		, 'YENNY GIOVANNA'							,  ''			 	, ''							, true	),
(  17 ,  1004 , 95010,   95030 ,   '71326982'		,   'ARROYO'	, 'QUINTANA'	, 'SHIRLEY ELIZABETH'						,  ''			 	, ''							, true	),
(  18 ,  1004 , 95010,   95030 ,   '44681435'		,   'SOLANO'	, 'SULCA'		, 'MARISA DIANA'							,  ''			 	, ''							, true	),
(  19 ,  1004 , 95010,   95030 ,   '41798320'		,   'SUASNABAR'	, 'ROJAS'		, 'YESENIA YULIA'							,  ''			 	, ''							, true	),
(  20 ,  1004 , 95010,   95030 ,   '07826812'		,   'SALAZAR'	, 'LOAYZA'		, 'MIGUEL ANGEL'							,  ''			 	, ''							, true	),
(  21 ,  1004 , 95010,   95030 ,   '19917113'		,   'BELTRAN'	, 'GALLARDO'	, 'ALBERTO DOMINGO'							,  ''			 	, ''							, true	),
(  22 ,  1004 , 95010,   95030 ,   '0496341'		,   'MELENDEZ'	, 'HERRERA'		, 'JOSE MARIA IGNACIO'						,  ''			 	, ''							, true	),
(  23 ,  1004 , 95010,   95030 ,   '20029016'		,   'REYES'		, 'ARTICA'		, 'LUZ NERIDA'								,  ''			 	, ''							, true	),
(  24 ,  1004 , 95010,   95030 ,   '70019247'		,   'CARDOZO'	, 'VILLAGARAY'	, 'FANNY ROSARIO'							,  ''			 	, ''							, true	),
(  25 ,  1004 , 95010,   95030 ,   '42444816'		,   'SERRANO'	, 'ALCANTARA'	, 'KARINA BERTHA'							,  ''			 	, ''							, true	),
(  26 ,  1004 , 95010,   95030 ,   '71696400'		,   'PAZ'		, 'MORALES'		, 'FIORELLA GERALDINE'						,  ''			 	, ''							, true	),
(  27 ,  1004 , 95010,   95030 ,   '42844755'		,   'GONZALEZ'	, 'FLORES'		, 'CINTHIA'									,  ''			 	, ''							, true	),
(  28 ,  1004 , 95010,   95030 ,   '20440709'		,   'PEREZ'		, 'MEZA'		, 'BLANCA JESUS'							,  ''			 	, ''							, true	),
(  29 ,  1004 , 95010,   95030 ,   '20074916'		,   'VERGARA'	, 'IZAGUIRRE'	, 'GABRIELA'								,  ''			 	, ''							, true	),
(  30 ,  1004 , 95011,   95032 ,   '20603133111'	,   ''			, ''			, 'YUPANA STUDIO E.I.R.L'					,  ''			 	, ''							, true	),
																																															
(  31 ,  1005 , 95010,   95030 ,   '20121955'		,   'SALAZAR'	, 'SAAVEDRA'	, 'SARA SAIDA'								,  ''			 	, ''							, true	),
(  32 ,  1005 , 95010,   95030 ,   '41330439'		,   'SINCHE'	, 'BARRA'		, 'YENNY GIOVANNA'							,  ''			 	, ''							, true	),
(  33 ,  1005 , 95010,   95030 ,   '71326982'		,   'ARROYO'	, 'QUINTANA'	, 'SHIRLEY ELIZABETH'						,  ''			 	, ''							, true	),
(  34 ,  1005 , 95010,   95030 ,   '44681435'		,   'SOLANO'	, 'SULCA'		, 'MARISA DIANA'							,  ''			 	, ''							, true	);




----------------------------------------------------------------------------------------------------------------------------------------
--adm.trabajador------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.trabajador;
CREATE TABLE adm.trabajador (
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
	CONSTRAINT trabajador_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES adm.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.trabajador IS 'Trabajadores por empresa.'; 
COMMENT ON COLUMN adm.trabajador.id_trabajador IS 'Identificador de trabajador.';
COMMENT ON COLUMN adm.trabajador.id_tipo_sexo IS 'Identificador del tipo de sexo [TI_SEXO].';
COMMENT ON COLUMN adm.trabajador.id_tipo_est_civil IS 'Identificador del tipo de estado civil [TI_EST_CIV].';
COMMENT ON COLUMN adm.trabajador.id_tipo_vivienda IS 'Identificador del tipo de vivienda [TI_VIVIENDA].';
COMMENT ON COLUMN adm.trabajador.id_tipo_viv_material IS 'Identificador del tipo de material de la vivienda [TI_VIV_MATERIAL].';
COMMENT ON COLUMN adm.trabajador.id_tipo_viv_condicion IS 'Identificador del tipo de condición de la vivienda [TI_VIV_CONDICION].';
COMMENT ON COLUMN adm.trabajador.id_direccion IS 'Identificador de la dirección [ADM.DIRECCION].';
COMMENT ON COLUMN adm.trabajador.id_tipo_movilidad IS 'Identificador del tipo de movilidad con que se desplaza al trabajo [TI_MOVILIDAD].';
COMMENT ON COLUMN adm.trabajador.id_tipo_sit_edu IS 'Identificador del tipo de situación educativa [TI_SIT_EDUC].';
COMMENT ON COLUMN adm.trabajador.id_inst_egreso IS 'Identificador de la institución de egreso.';
COMMENT ON COLUMN adm.trabajador.id_tipo_titulo IS 'Identificador del tipo de título [TI_TITULO].';
COMMENT ON COLUMN adm.trabajador.profesion IS 'Nombre de la profesión que alcanzó.';
COMMENT ON COLUMN adm.trabajador.ocupacion IS 'Nombre de la actividad a la que se dedica.';
COMMENT ON COLUMN adm.trabajador.correo_per IS 'Correo electrónico personal.';
COMMENT ON COLUMN adm.trabajador.correo_lab IS 'Correo electrónico laboral.';
COMMENT ON COLUMN adm.trabajador.celular_per IS 'Número de celular personal.';
COMMENT ON COLUMN adm.trabajador.celular_lab IS 'Número de celular laboral.';
COMMENT ON COLUMN adm.trabajador.telefono IS 'Teléfono fijo.';
COMMENT ON COLUMN adm.trabajador.obs IS 'Algún dato no contemplado.';
COMMENT ON COLUMN adm.trabajador.activo IS 'Indica sí el trabajador es un personal activo/vigente.';
--
INSERT INTO adm.trabajador (id_trabajador, id_tipo_sexo, id_tipo_est_civil, id_tipo_vivienda, id_tipo_viv_material, id_tipo_viv_condicion, id_direccion, id_tipo_movilidad, id_tipo_sit_edu, id_inst_egreso, id_tipo_titulo, profesion, ocupacion, correo_per, correo_lab, celular_per, celular_lab, telefono, obs, activo)
VALUES 
( 9, 95021, 95131, 95262, 95270, 95280, -1, 95290, 95153, -1, 95179, 'SISTEMAS Y COMPUTACIÓN'		, 'EMPLEADO', 'franko@gmail'	  , 'fbarzola@sanjuanbosco.edu.pe'	, '987779695' , '' , '' , '-' , true ),
(15, 95021, 95131, 95262, 95270, 95280, -1, 95290, 95153, -1, 95179, 'ADMINISTRACIÓN Y MARKETING'	, 'EMPLEADA', 'majachus@gmail'	  , 'ssalazar@sanjuanbosco.edu.pe'	, '966308555' , '' , '' , '-' , true ),
(16, 95021, 95131, 95260, 95270, 95281, -1, 95295, 95154, -1, 95174, 'CONTABILIDAD Y FINANZAS'   	, 'EMPLEADA', 'yenny@gmail@gmail' , 'ysinche@sanjuanbosco.edu.pe'	, '977111222' , '' , '' , '-' , false),
(17, 95021, 95130, 95260, 95270, 95282, -1, 95294, 95150, -1, 95184, 'ADMINISTRACIÓN'				, 'EMPLEADA', 'shirley@gmail'	  , 'sarroyo@sanjuanbosco.edu.pe' 	, '999888777' , '' , '' , '-' , true );




----------------------------------------------------------------------------------------------------------------------------------------
--adm.clie_prov-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.clie_prov;
CREATE TABLE adm.clie_prov (
	id_cli_pro 					bigserial 		NOT NULL PRIMARY KEY,	
	id_tipo_estado_contrib		int				NOT NULL,		
	id_tipo_condicion_contrib	int				NOT NULL,		
	id_direccion				int 			NOT NULL,			
	correo                  	varchar(75) 	NOT NULL,	
	celular						varchar(25) 	NOT NULL,	
	telefono					varchar(25) 	NOT NULL,	
	contacto					varchar(100) 	NOT NULL,	
	obs							varchar(100) 	NOT NULL,	
	CONSTRAINT clie_prov_id_cli_pro_fkey FOREIGN KEY (id_cli_pro) REFERENCES adm.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.clie_prov IS 'Clientes y/o proveedores.'; 
COMMENT ON COLUMN adm.clie_prov.id_cli_pro IS 'Identificador de cliente y/o proveedor.';
COMMENT ON COLUMN adm.clie_prov.id_tipo_estado_contrib IS 'Identificador del tipo de estado del contribuyente [TI_ESTADO_CONTRIB].';
COMMENT ON COLUMN adm.clie_prov.id_tipo_condicion_contrib IS 'Identificador del tipo de condición del contribuyente [TI_CONDICION_CONTRIB].';
COMMENT ON COLUMN adm.clie_prov.id_direccion IS 'Identificador de dirección [ADM.DIRECCION].';
COMMENT ON COLUMN adm.clie_prov.correo IS 'Correo electrónico.';
COMMENT ON COLUMN adm.clie_prov.celular IS 'Número de celular.';
COMMENT ON COLUMN adm.clie_prov.telefono IS 'Teléfono fijo.';
COMMENT ON COLUMN adm.clie_prov.contacto IS 'Nombre de un contacto, solo sí es persona jurídica.';
COMMENT ON COLUMN adm.clie_prov.obs IS 'Alguna observación sobre el cliente y/o proveedor.';
--
INSERT INTO adm.clie_prov (id_cli_pro, id_tipo_estado_contrib, id_tipo_condicion_contrib, id_direccion, correo, celular, telefono, contacto, obs)
VALUES 
(   0 ,     -1,     -1,   -1,   ''						 , ''			, ''  ,  ''	, ''),
(  15 ,     -1,     -1,   -1,   'majachus@gmail.com'	 , '966308555'	, ''  ,  '' , ''),
(  16 ,     -1,     -1,   -1,   'yenny@gmail.com'		 , ''			, ''  ,  ''	, ''),
(  17 ,     -1,     -1,   -1,   'shirley@gmail.com'		 , ''			, ''  ,  '' , ''),
(  18 ,     -1,     -1,   -1,   'marisa@gmail.com'		 , ''			, ''  ,  '' , ''),
(  19 ,     -1,     -1,   -1,   'yesenia@gmail.com'		 , ''			, ''  ,  '' , ''),
(  30 ,  10001,  10010,    1,   'yupanastudio@gmail.com' , '987779695'	, ''  ,  '' , '');




----------------------------------------------------------------------------------------------------------------------------------------
--adm.usuario---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.usuario;
CREATE TABLE adm.usuario (
	id_usuario		bigint			NOT NULL PRIMARY KEY,
	nom_usu			varchar(50)		NOT NULL,   
	pwd_usu			varchar(250)	NOT NULL,
	fe_operacion	date			NOT NULL,
	activo			bool 			NOT NULL,
	cambio_pwd		bool			NOT NULL,
	CONSTRAINT usuario_ukey UNIQUE (nom_usu),
	CONSTRAINT usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES adm.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.usuario IS 'Usuarios del sistema.'; 
COMMENT ON COLUMN adm.usuario.id_usuario IS 'Identificador de usuario.';
COMMENT ON COLUMN adm.usuario.nom_usu IS 'Concatenación del "idEmpresa" mas nombre de usuario. Ej. 1001.fbarzola.';
COMMENT ON COLUMN adm.usuario.pwd_usu IS 'Contraseña encriptada.';
COMMENT ON COLUMN adm.usuario.fe_operacion IS 'Fecha en que opera el usuario.';
COMMENT ON COLUMN adm.usuario.activo IS 'Indica si el usuario esta activo.';
COMMENT ON COLUMN adm.usuario.cambio_pwd IS 'Indica sí el usuario cambió contraseña asignada.';
--
INSERT INTO adm.usuario (id_usuario, nom_usu, pwd_usu, fe_operacion, activo, cambio_pwd) --trabajador, fam_alumno
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



----------------------------------------------------------------------------------------------------------------------------------------
--adm.usuario_sistema-------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.usuario_sistema;
CREATE TABLE adm.usuario_sistema (
	id_usu_sis			serial 		NOT NULL PRIMARY KEY,
	id_empresa			int			NOT NULL,
	id_usuario	 		bigint 		NOT NULL,	
	id_sistema			char(3)		NOT NULL,
	activo				boolean		NOT NULL,
	CONSTRAINT usuario_sistema_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES adm.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION--,
	--CONSTRAINT usuario_sistema_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES adm.sistema(id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.usuario_sistema IS 'Sistemas habilitados por usuario.'; 
COMMENT ON COLUMN adm.usuario_sistema.id_usu_sis IS 'Identificador de entidad.';
COMMENT ON COLUMN adm.usuario_sistema.id_empresa IS 'Identificador de empresa [adm.empresa].';
COMMENT ON COLUMN adm.usuario_sistema.id_usuario IS 'Identificador de usuario [adm.usuario].';
COMMENT ON COLUMN adm.usuario_sistema.id_sistema IS 'Identificador de sistema [adm.sistema].';
COMMENT ON COLUMN adm.usuario_sistema.activo IS 'Indica sí el sistema está activo';
--
INSERT INTO adm.usuario_sistema (id_empresa, id_usuario, id_sistema, activo) 
VALUES
-- YSST-fbarzola
( 1001,  1,  'ADM',	true ),	
( 1001,  1,  'COM',	true ),	
( 1001,  1,  'LGT',	true ),	
( 1001,  1,  'PER',	true ),	
( 1001,  1,  'FIN',	true ),	
( 1001,  1,  'CNT',	true ),	
-- SJB-fbarzola
( 1004,  9,  'ADM',	true ),	
( 1004,  9,  'COM',	true ),	
( 1004,  9,  'LGT',	true ),	
( 1004,  9,  'PER',	true ),	
( 1004,  9,  'FIN',	true ),	
( 1004,  9,  'CNT',	true ),	
( 1004,  9,  'COL',	true ),	
-- SJB-ssalazar
( 1004, 15,  'ADM',	true ),	
( 1004, 15,  'COM',	true ),	
( 1004, 15,  'LGT',	true ),	
( 1004, 15,  'PER',	true ),	
( 1004, 15,  'FIN',	true ),	
( 1004, 15,  'CNT',	true ),	
( 1004, 15,  'COL',	true ),	
-- SANFER-fbarzola
( 1005, 10,  'ADM',	true ),	
( 1005, 10,  'COM',	true ),	
( 1005, 10,  'LGT',	true ),	
( 1005, 10,  'PER',	true ),	
( 1005, 10,  'FIN',	true ),	
( 1005, 10,  'CNT',	true ),	
( 1005, 10,  'ACA',	true ),	
-- SANFER-ssalazar
( 1005, 31,  'ADM',	true ),	
( 1005, 31,  'COM',	true ),	
( 1005, 31,  'LGT',	true ),	
( 1005, 31,  'PER',	true ),	
( 1005, 31,  'FIN',	true ),	
( 1005, 31,  'CNT',	true ),	
( 1005, 31,  'ACA',	true );



----------------------------------------------------------------------------------------------------------------------------------------
--adm.usuario_perfil--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.usuario_perfil;
CREATE TABLE adm.usuario_perfil (
	id_usu_perfil 	bigserial 	NOT null PRIMARY KEY,
	id_usuario 		bigint 		NOT NULL,
	id_perfil 		int 		NOT NULL,
	activo 			bool 		NOT NULL,
	nuevo 			bool 		NOT NULL,
	modificar 		bool 		NOT NULL,	
	eliminar 		bool 		NOT NULL,
	imprimir		bool 		NOT NULL,
	CONSTRAINT usuario_perfil_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES adm.perfil(id_perfil) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT usuario_perfil_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES adm.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
ALTER SEQUENCE adm.usuario_perfil_id_usu_perfil_seq RESTART WITH 109;
--
INSERT INTO adm.usuario_perfil (id_usu_perfil, id_usuario, id_perfil, activo, nuevo, modificar, eliminar, imprimir) 
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
( 30,  1, 3001, true , true , true , true , true ),
( 31,  1, 3002, true , true , true , true , true ),
( 32,  1, 3003, true , true , true , true , true ),
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
( 62,  9, 3001, true , true , true , true , true ),
( 63,  9, 3002, true , true , true , true , true ),
( 64,  9, 3003, true , true , true , true , true ),
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
(102, 10, 3001, true , true , true , true , true ),
(103, 10, 3002, true , true , true , true , true ),
(104, 10, 3003, true , true , true , true , true ),
(105, 10, 4001, true , true , true , true , true ),
(106, 10, 4002, true , true , true , true , true ),
(107, 10, 4003, true , true , true , true , true ),
(108, 10, 4004, true , true , true , true , true );













----------------------------------------------------------------------------------------------------------------------------------------
--adm.estudiante_col--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.estudiante_col;
CREATE TABLE adm.estudiante_col (
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
	CONSTRAINT estudiante_col_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES adm.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
INSERT INTO adm.estudiante_col (id_usuario, nom_usu, pwd_usu, fe_operacion, activo, cambio_pwd) --trabajador, fam_alumno
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




----------------------------------------------------------------------------------------------------------------------------------------
--adm.estudiante_aca--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.estudiante_col;
CREATE TABLE adm.estudiante_col (
	id_est_col			bigint			NOT NULL PRIMARY KEY,
	id_tipo_grp_sange	int,
	--codigo				varchar(14),  esto va en la incripcion
	egresado
	id_inst_est  --donde esta estudiando o donde ereso
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
	CONSTRAINT estudiante_col_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES adm.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
INSERT INTO adm.estudiante_col (id_usuario, nom_usu, pwd_usu, fe_operacion, activo, cambio_pwd) --trabajador, fam_alumno
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









/*
----------------------------------------------------------------------------------------------------------------------------------------
--adm.usuario_sede----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.usuario_sede;
CREATE TABLE adm.usuario_sede (
	id_usu_sede			serial 		NOT NULL PRIMARY KEY,	 
	id_usuario	 		bigint 		NOT NULL,	
	id_sede				int			NOT NULL,
	activo				boolean		NOT NULL,
	CONSTRAINT usuario_sede_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES adm.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.usuario_sede IS 'Sedes donde trabaja el usuario.'; 
COMMENT ON COLUMN adm.usuario_sede.id_usuario IS 'Identificador de usuario [adm.usuario]';
COMMENT ON COLUMN adm.usuario_sede.id_sede IS 'Identificador de sede [adm.sede]';
COMMENT ON COLUMN adm.usuario_sede.activo IS 'Indica sí la sede está activo';
--
INSERT INTO adm.usuario_sede (id_usu_sede, id_usuario, id_sede, activo) 
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
CREATE UNIQUE INDEX adm_grupo_fams_noms_ukey ON adm_grupo_fams ( id_empresa , fn_my_unaccent(nom_grp_fam) , fn_my_unaccent(procedencia) );
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
	id_inst_est		bigserial		not null primary key,
	id_tipo_inst	int			 	not null,
	sigla			varchar(25)		not null,
	nombre			varchar(75)		not null,
	ciudad			varchar(50)		not null
);
--
CREATE UNIQUE INDEX institucion_estudio_noms_ukey ON adm_inst_estudios ( fn_my_unaccent(nombre) , fn_my_unaccent(ciudad) );
ALTER SEQUENCE adm_inst_estudios_id_inst_est_seq RESTART WITH 9;
--
COMMENT ON TABLE adm_inst_estudios IS 'Instituciones de estudio.'; 
COMMENT ON COLUMN adm_inst_estudios.id_inst_est IS 'Identificador de institución de estudio.';
COMMENT ON COLUMN adm_inst_estudios.id_tipo_inst IS 'Id. del tipo de institución [TI_INSTEST].';
COMMENT ON COLUMN adm_inst_estudios.sigla IS 'Sigla o abreviatura.';
COMMENT ON COLUMN adm_inst_estudios.nombre IS 'Nombre completo de la institución.';
COMMENT ON COLUMN adm_inst_estudios.ciudad IS 'Ciudad.';
--
INSERT INTO adm_inst_estudios (id_inst_est, id_tipo_inst, sigla, nombre, ciudad)  
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
	CONSTRAINT lugar_nac_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES adm.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
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
	CONSTRAINT familiar_id_fam_fkey FOREIGN KEY (id_familiar) REFERENCES adm.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
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
	CONSTRAINT estudiante_cole_id_est_col_fkey FOREIGN KEY (id_est_col) REFERENCES adm.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
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
	CONSTRAINT estudiante_acad_id_est_aca_fkey FOREIGN KEY (id_est_acad) REFERENCES adm.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
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
--adm.persona_jur-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists adm.persona_jur; 
CREATE TABLE adm.persona_jur (
	id_per_jur			bigint			NOT null primary key,	
	id_tipo_estado		int				not null,
	id_tipo_condicion	int				not null,
	obs					varchar(100)	not null--,	
	--CONSTRAINT persona_jur_id_per_jur_fkey FOREIGN KEY (id_per_jur) REFERENCES adm.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.persona_jur IS 'Empresas que son clientes o proveedores.'; 
COMMENT ON COLUMN adm.persona_jur.id_per_jur IS 'Identificador de persona jurídica.';
COMMENT ON COLUMN adm.persona_jur.id_tipo_estado IS 'Identificador de estado en SUNAT [].';
COMMENT ON COLUMN adm.persona_jur.id_tipo_condicion IS 'Identificador de condición en SUNAt [].';
COMMENT ON COLUMN adm.persona_jur.obs IS 'Observación o anotación sobre el cliente.';
--
INSERT INTO adm.persona_jur (id_per_jur, id_tipo_estado, id_tipo_condicion, obs) 
VALUES 
(27, -1	, -1 , 'OBS 01' ),
(28, -1	, -1 , 'OBS 01' );
*/




/*
----------------------------------------------------------------------------------------------------------------------------------------
--adm.persona---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists adm.persona;
create table adm.persona (
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
	--id_tipo_est_civ		int				not null,	
	--id_grp_fam			bigint			null,
	--id_tipo_sit_educ		int				not null,		
	--id_inst_est			bigint			null,	
			
	--CONSTRAINT persona_id_grp_fam_fkey FOREIGN KEY (id_grp_fam) REFERENCES adm_grupo_fams(id_grp_fam) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	--CONSTRAINT persona_id_inst_est_fkey FOREIGN KEY (id_inst_est) REFERENCES adm_inst_estudios(id_inst_est) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT persona_num_doc_ukey unique (id_empresa , id_tipo_doc_ident , num_doc_ident)	
);
--
CREATE UNIQUE INDEX persona_nombres_ukey ON adm.persona ( id_empresa , fn_my_unaccent(paterno), fn_my_unaccent(materno) , fn_my_unaccent(nombres) );
ALTER SEQUENCE adm.persona_id_persona_seq RESTART WITH 40;
--
COMMENT ON TABLE adm.persona IS 'Personas y empresas.'; 
COMMENT ON COLUMN adm.persona.id_persona IS 'Identificador de persona o empresa.';
COMMENT ON COLUMN adm.persona.id_empresa IS 'Identificador de empresa.';
COMMENT ON COLUMN adm.persona.id_tipo_persona IS 'Identificador del tipo de persona [TI_PERSONA].';
--COMMENT ON COLUMN adm.persona.id_tipo_sexo IS 'Identificador del tipo de sexo [TI_SEXO---].';
COMMENT ON COLUMN adm.persona.id_tipo_doc_ident IS 'Identificador del tipo de documento de identidad [TI_DOC_IDENT].';
COMMENT ON COLUMN adm.persona.num_doc_ident IS 'Número del documento de identidad.';
COMMENT ON COLUMN adm.persona.paterno IS 'Apellido paterno o en blanco si es empresa.';
COMMENT ON COLUMN adm.persona.materno IS 'Apellido materno o en blanco si es empresa.';
COMMENT ON COLUMN adm.persona.nombres IS 'Nombres de la persona o razón social de la empresa.';
COMMENT ON COLUMN adm.persona.num_ruc_per_nat IS 'Si es del tipo persona, registra RUC si lo tiene.';
COMMENT ON COLUMN adm.persona.sigla IS 'Nombre comercial de empresa o persona con RUC.';
--COMMENT ON COLUMN adm.persona.fijo IS 'Número del teléfono fijo.';
--COMMENT ON COLUMN adm.persona.movil IS 'Número del celular.';
--COMMENT ON COLUMN adm.persona.correo IS 'Correo personal.';
--COMMENT ON COLUMN adm.persona.id_direccion IS 'Identificador de dirección.';
--COMMENT ON COLUMN adm.persona.id_tipo_est_civ IS 'Identificador del tipo de estado civil [TI_ESTCIV-].';
COMMENT ON COLUMN adm.persona.obs IS 'Observación, o anotación adicional de un cliente.';
COMMENT ON COLUMN adm.persona.validado IS 'Si es true, ya no se puede modificar ciertos datos.';
COMMENT ON COLUMN adm.persona.id_tipo_estado_ruc IS 'Identificador de estado en SUNAT [TI_ESTADO_RUC].';
COMMENT ON COLUMN adm.persona.id_tipo_condicion_ruc IS 'Identificador de condición en SUNAT [TI_CONDICION_RUC].';
--COMMENT ON COLUMN adm.persona.id_grp_fam IS 'Identificador del grupo familiar.';
--COMMENT ON COLUMN adm.persona.id_tipo_sit_educ IS 'Identificador del tipo de situación educativa [TI_SITEDUC].';
--COMMENT ON COLUMN adm.persona.id_inst_est IS 'Identificador de la institución de estudios.';
--
INSERT INTO adm.persona (id_persona, id_empresa, id_tipo_persona, id_tipo_doc_ident, num_doc_ident, paterno, materno, nombres, num_ruc_per_nat, sigla, obs, validado, id_tipo_estado_ruc, id_tipo_condicion_ruc)
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
--select * from adm.persona p where id_grp_fam = -1;










--contactos			varchar(1000)   not null,	COMMENT ON COLUMN adm_empresas.contactos IS 'Lista de contactos en formato: nom_apes;área;correo;celular|';
--LOS CAONTACTOS CUANDO SE CREA/REGISTRA EL CLIENTE PARA EMITIR LOS COMPROBANTES


--
 --###  , factura ;;; si es true emite factura???   EN_DATOS_PERSONA



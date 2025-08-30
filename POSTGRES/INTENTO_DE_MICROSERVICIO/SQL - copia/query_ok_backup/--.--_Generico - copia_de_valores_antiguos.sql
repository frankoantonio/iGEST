----------------------------------------------------------------------------------------------------------------------------------------
--gen.tipo------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.tipo;
CREATE TABLE gen.tipo(
	id_tipo			char(6) 		NOT NULL,
	nom_tipo 		varchar(50) 	NOT NULL,
	nom_corto 		varchar(10) 	NOT NULL,
	cod_oficial 	varchar(10) 	NOT NULL,
	grupo 			char(10) 		NOT NULL,
	long_valor 		varchar(10)		NOT NULL,
	orden 			int 			NOT NULL,
	activo			boolean			NOT null,
	constraint tipo_pkey primary key (id_tipo)
);
create index tipo_grupo_ikey on (grupo);
--
COMMENT ON COLUMN gen.tipo.long_valor IS 'Tamaño, longitud, otro valor que lo caracteriza';
--
INSERT INTO gen.tipo (id_tipo, nom_tipo, nom_corto, cod_oficial, grupo, long_valor, orden, activo) 
VALUES
('100COM',	'COMERCIO EN GENERAL'		, 	'',		'',	'100TINEGOC', '', 1, true),
('100EBR',	'COLEGIO PARTICULAR'		, 	'',		'',	'100TINEGOC', '', 2, true),
('100APU',	'ACADEMIA PREUNIVERSITARIA'	, 	'',		'',	'100TINEGOC', '', 3, true),
('100FUT',	'CANCHA DE FUTBOL'			, 	'',		'',	'100TINEGOC', '', 4, true),
('100LIB',  'LIBRERÍA'					, 	'',		'',	'100TINEGOC', '', 5, true),
('100BAZ',  'BAZAR'						, 	'',		'',	'100TINEGOC', '', 6, true),
('100GYM',	'GYMNASIO'					, 	'',		'',	'100TINEGOC', '', 7, true),
('100CLI',	'CLÍNICA'					, 	'',		'',	'100TINEGOC', '', 8, true),

('101PER',	'PERSONA NATURAL'			, 	'',		'',	'101PERSONA', '', 1, true),
('101EMP',	'EMPRESA'					, 	'',		'',	'101PERSONA', '', 2, true),
('101INF',	'GRUPO INFORMAL'			, 	'',		'',	'101PERSONA', '', 3, true),
('101VAR',	'<VARIOS>'					, 	'',		'',	'101PERSONA', '', 4, true),

('102MAS',	'MASCULINO'					, 	'M',	'',	'102TGENERO', '', 1, true),
('102FEM',	'FEMENINO'					, 	'F',	'',	'102TGENERO', '', 2, true),
('102SIN',	'<SIN INDICAR>'				, 	'-',	'',	'102TGENERO', '', 3, true),

('103001',	'O-'						, 	'',		'',	'103GRPSANG', '', 1, true),
('103002',	'O+'						, 	'',		'',	'103GRPSANG', '', 2, true),
('103003',	'A-'						, 	'',		'',	'103GRPSANG', '', 3, true),
('103004',	'A+'						, 	'',		'',	'103GRPSANG', '', 4, true),	
('103005',	'B-'						, 	'',		'',	'103GRPSANG', '', 5, true),	
('103006',	'B+'						, 	'',		'',	'103GRPSANG', '', 6, true),	
('103007',	'AB-'						, 	'',		'',	'103GRPSANG', '', 7, true),	
('103008',	'AB+'						, 	'',		'',	'103GRPSANG', '', 8, true),	
('103SIN',	'<SIN INDICAR>'				, 	'',		'',	'103GRPSANG', '', 9, true),

('104DNI',	'DNI'						, 	''	, '01',	'104DOCUMEN', '8', 1, true),
('104CEX',	'CARNÉ DE EXTRANJERÍA'		, 	''	, '04',	'104DOCUMEN',  '', 2, true),
('104RUC',	'RUC'						, 	''	, '06',	'104DOCUMEN','11', 3, true),
('104PSP',	'PASAPORTE'					, 	''	, '07',	'104DOCUMEN',  '', 4, true),	
('104CSR',	'CARNÉ SOLICITUD REFUGIO'	, 	''	, '09',	'104DOCUMEN',  '', 5, true),	
('104PAR',	'PARTIDA DE NACIMIENTO'		, 	''	, '11',	'104DOCUMEN',  '', 6, false),
('104LCO',	'LICENCIA DE CONDUCIR'		, 	''	,   '',	'104DOCUMEN',  '', 7, false),
('104MAT',	'REGISTRO DE MATRÍCULA'		, 	''	,   '',	'104DOCUMEN',  '', 8, false),
('104SIN',	'<SIN INDICAR>'				, 	''	, '00',	'104DOCUMEN',  '', 9, true),
/*
('105AVE',	'AVENIDA'			, 	'AV.'	, '01',	'105TIPOVIA', '', 1, true),
('105JIR',	'JIRÓN'				, 	'JR.'	, '02',	'105TIPOVIA', '', 2, true),
('105CAL',	'CALLE'				, 	'CA.'	, '03',	'105TIPOVIA', '', 3, true),
('105PSJ',	'PASAJE'			, 	'PSJ.'	, '04',	'105TIPOVIA', '', 4, true),	
('105ALA',	'ALAMEDA'			, 	'ALA.'	, '05',	'105TIPOVIA', '', 5, true),	
('105MAL',	'MALECÓN'			, 	'MAL.'	, '06',	'105TIPOVIA', '', 6, true),
('105OVA',	'OVALO'				, 	'OV.'	, '07',	'105TIPOVIA', '', 7, true),
('105PAR',	'PARQUE'			, 	'PQ.'	, '08',	'105TIPOVIA', '', 8, true),
('105PLA',	'PLAZA'				, 	'PZ.'	, '09',	'105TIPOVIA', '', 9, true),
('105CAR',	'CARRETERA'			, 	'CAR.'	, '10',	'105TIPOVIA', '',10, true),	
('105TRO',	'TROCHA'			, 	'TRO.'	, '13',	'105TIPOVIA', '',11, true),	
('105CRU',	'CAMINO RURAL'		, 	'CRU.'	, '14',	'105TIPOVIA', '',12, true),	
('105BAJ',	'BAJADA'			, 	'BAJ.'	, '15',	'105TIPOVIA', '',13, true),
('105GAL',	'GALERIA'			, 	'GAL.'	, '16',	'105TIPOVIA', '',14, true),
('105PRO',	'PROLONGACIÓN'		, 	'PLG.'	, '17',	'105TIPOVIA', '',15, true),
('105PAS',	'PASEO'				, 	'PAS.'	, '18',	'105TIPOVIA', '',16, true),	
('105PZL',	'PLAZUELA'			, 	'PZL.'	, '19',	'105TIPOVIA', '',17, true),	
('105POR',	'PORTAL'			, 	'POR.'	, '20',	'105TIPOVIA', '',18, true),	
('105CAF',	'CAMINO AFIRMADO'	, 	'CAF.'	, '21',	'105TIPOVIA', '',19, true),	
('105TCA',	'TROCHA CARROZABLE'	, 	'TCA.'	, '22',	'105TIPOVIA', '',20, true),
('105OTR',	'<OTRO - ESPECIFICAR>', 	''		, '98',	'105TIPOVIA', '',21, true),	
('105SIN',	'<SIN INDICAR>'		,	''		, '99',	'105TIPOVIA', '',22, true),
*/
/*
('106URB',	'URBANIZACIÓN'			, 	'URB.'	, '01',	'106TIPOZON', '', 1, true),
('106PJV',	'PUEBLO JOVEN'			, 	'P.J.'	, '02',	'106TIPOZON', '', 2, true),
('106UVE',	'UNIDAD VECINAL'		, 	'U.V.'	, '03',	'106TIPOZON', '', 3, true),
('106CHA',	'CONJUNTO HABITACIONAL'	, 	'C.H.'	, '04',	'106TIPOZON', '', 4, true),	
('106AHU',	'ASENTAMIENTO HUMANO'	, 	'A.H.'	, '05',	'106TIPOZON', '', 5, true),	
('106COO',	'COOPERATIVA'			, 	'COO.'	, '06',	'106TIPOZON', '', 6, true),	
('106RES',	'RESIDENCIAL'			, 	'RES.'	, '07',	'106TIPOZON', '', 7, true),
('106ZIN',	'ZONA INDUSTRIAL'		, 	'Z.I.'	, '08',	'106TIPOZON', '', 8, true),
('106GRU',	'GRUPO'					, 	'GRU.'	, '09',	'106TIPOZON', '', 9, true),
('106CAS',	'CASERÍO'				, 	'CAS.'	, '10',	'106TIPOZON', '',10, true),	
('106FUN',	'FUNDO'					, 	'FND.'	, '11',	'106TIPOZON', '',11, true),
('106OTR',	'<OTRO - ESPECIFICAR>'	, 	''		, '98',	'106TIPOZON', '',12, true),
('106SIN',	'<SIN INDICAR>'			, 	''		, '99',	'106TIPOZON', '',13, true),
*/
('107001',	'SIN EDUCACIÓN FORMAL'							, 	'', '01',	'107SITUEDU', '', 1, true),
('107002',	'ESPECIAL INCOMPLETA'							, 	'', '02',	'107SITUEDU', '', 2, false),
('107003',	'ESPECIAL COMPLETA'								, 	'', '03',	'107SITUEDU', '', 3, false),
('107004',	'PRIMARIA INCOMPLETA'							, 	'', '04',	'107SITUEDU', '', 4, true),
('107005',	'PRIMARIA COMPLETA'								, 	'', '05',	'107SITUEDU', '', 5, true),
('107006',	'SECUNDARIA INCOMPLETA'							, 	'', '06',	'107SITUEDU', '', 6, true),
('107007',	'SECUNDARIA COMPLETA'							, 	'', '07',	'107SITUEDU', '', 7, true),
('107008',	'TÉCNICA INCOMPLETA -CETPRO'					, 	'', '08',	'107SITUEDU', '', 8, true),
('107009',	'TÉCNICA COMPLETA - CETPRO'						, 	'', '09',	'107SITUEDU', '', 9, true),
('107010',	'SUPERIOR INCOMPLETA - IEST|ISP|ESFA|ESOf'		, 	'', '10',	'107SITUEDU', '',10, true),
('107011',	'SUPERIOR COMPLETA - IEST|ISP|ESFA|ESOf'		, 	'', '11',	'107SITUEDU', '',11, true),
('107012',	'UNIVERSITARIA INCOMPLETA - UNIV|EOf'			, 	'', '12',	'107SITUEDU', '',12, true),
('107013',	'UNIVERSITARIA COMPLETA - UNIV|EOf'				, 	'', '13',	'107SITUEDU', '',13, true),
('107014',	'GRADO DE BACHILLER'							, 	'', '14',	'107SITUEDU', '',14, true),
('107015',	'TITULADO'										, 	'', '15',	'107SITUEDU', '',15, true),
('107016',	'ESTUD. MAESTRÍA INCOMPLETA'					, 	'', '16',	'107SITUEDU', '',16, true),
('107017',	'ESTUD. MAESTRÍA COMPLETA'						, 	'', '17',	'107SITUEDU', '',17, true),
('107018',	'GRADO DE MAESTRÍA'								, 	'', '18',	'107SITUEDU', '',18, true),
('107019',	'ESTUD. DOCTORADO INCOMPLETO'					, 	'', '19',	'107SITUEDU', '',19, true),
('107020',	'ESTUD. DOCTORADO COMPLETO'						, 	'', '20',	'107SITUEDU', '',20, true),
('107021',	'GRADO DE DOCTOR'								, 	'', '21',	'107SITUEDU', '',21, true),
('107SIN',	'<SIN INDICAR>'									, 	'', '99',	'107SITUEDU', '',22, true),

('108SOL',	'SOLTERO'				, 	'', '01',	'108ESTACIV', '', 1, true),
('108CAS',	'CASADO'				, 	'', '02',	'108ESTACIV', '', 2, true),
('108CON',	'CONVIVIENTE'			, 	'', '03',	'108ESTACIV', '', 3, true),
('108VIU',	'VIUDO'					, 	'', '04',	'108ESTACIV', '', 4, true),
('108DIV',	'DIVORCIADO/SEPARADO'	, 	'', '05',	'108ESTACIV', '', 5, true),
('108SIN',	'<SIN INDICAR>'			, 	'', '99',	'108ESTACIV', '', 6, true),
/*
('109HEA',  'HEADER'		, 	'', '',	'109OPCSIST', '', 1, true),
('109FRM',	'FORM'			, 	'', '',	'109OPCSIST', '', 2, true),
('109CON',	'CONTROL'		, 	'', '',	'109OPCSIST', '', 3, true),
('109PAG',	'PAGE'			, 	'', '',	'109OPCSIST', '', 4, true),
('109REP',	'REPORT'		, 	'', '',	'109OPCSIST', '', 5, true),

('110NOR',  'NORMAL'		, 	'', '',	'110TIPOROL', '', 1, true),
('110ADM',	'ADMIN'			, 	'', '',	'110TIPOROL', '', 2, true),
('110LEC',	'LECTURA'		, 	'', '',	'110TIPOROL', '', 3, true),

('111ADM',	'ADMINISTRATIVO', 	'', '',	'111TILOCAL', '', 1, true),
('111ALM',  'ALMACÉN'		, 	'', '',	'111TILOCAL', '', 2, true),
('111PRO',	'PRODUCCIÓN'	, 	'', '',	'111TILOCAL', '', 3, true),
('111COB',	'COBRANZA'		, 	'', '',	'111TILOCAL', '', 4, true),
('111PAG',	'PAGO'			, 	'', '',	'111TILOCAL', '', 5, true);
*/



----------------------------------------------------------------------------------------------------------------------------------------
--gen.empresa---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.empresa; 
create table gen.empresa (
	id_empresa		int				NOT NULL,
	nom_empresa 	varchar(100)	NOT NULL,
	alias			varchar(50)		NOT NULL,
	ruc				varchar(11)		NOT NULL,
	direccion		varchar(100)	NOT NULL,	
	telefonos		varchar(100)	NOT NULL,
	negocios		bool			NOT NULL,
	constraint empresa_pkey primary key (id_empresa) 
);
--
insert into gen.empresa (id_empresa, nom_empresa, alias, ruc, direccion, telefonos, negocios) 
values 
(1, 'YUPANA STUDIO E.I.R.L.'				 	, 'YUPANA STUDIO E.I.R.L.'		, '20603133111', 'Jr. Santa Isabel N° 2065 - El Tambo, Huancayo, Junín' , 'Tel. 064-248157', true),
(2, 'YHA GIBU TAMMY GERALDINI'					, 'LIBRERÍA BAZAR GERALDINE'	, '10078230849', 'Jr. Cusco N° 799 - Huancayo'			, '' , true),
(3, 'SALAZAR LOAYZA MIGUEL ANGEL'				, 'EDITORIAL SABER'				, '10078268129', 'Jr. Leandra Torres N° 123 - Huancayo'	, 'Tel. 064-248157 | Fax 064-501935', false),
(4, 'SJB GYM'									, ''							, '10401108055', 'Jr. Moquegua 215 Huancayo'			, 'Tel. 064-248157 | Fax 064-501935 | RPM 966308555 | RPC 987779695', false),
(5, 'CORPORACIÓN EDUCATIVA SAN JUAN BOSCO S.A.C', 'CORPORACIÓN SJB'				, '10401108055', 'Jr. Cusco 779 Huancayo'				, 'Tel. 064-248157 - Fax 064-501935 - RPM 966308555 - RPC 987779695', true);



----------------------------------------------------------------------------------------------------------------------------------------
--gen.negocio---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.negocio; 
create table gen.negocio(
	id_negocio		int				NOT NULL,
	id_tinegocio 	char(6)			NOT NULL,
	nom_negocio		varchar(50)		NOT NULL,
	principal		bool			NOT NULL,
	activo			bool			NOT NULL,
	id_empresa		int  			not null,
	constraint negocio_pkey primary key (id_negocio),
	constraint negocio_id_empresa_fkey foreign key (id_empresa) references gen.empresa(id_empresa) match simple on update no action on delete no action 
);
--
comment on column gen.negocio.id_tinegocio IS 'Identificador del tipo de negocio';
comment on column gen.negocio.principal IS 'Indica si es el negocio principal';
comment on table gen.negocio IS 'Unidades de negocio. Sus logos y banner se tienen que cargar de una URL y con su identificador de negocio y ruc???';
--
insert into gen.negocio (id_negocio, id_tinegocio, nom_negocio, principal, activo, id_empresa) --productos, logo, banner, 
values
(101, '100COM', 'YUPANA STUDIO'							, true , true, 1),		--UNIDAD DE PRODUCCION SISTEMAS, UN. PROD. CONTABLE
(102, '100COM', 'LIBRERÍA BAZAR GERALDINE' 				, true , true, 2),		--UNIDAD DE PRODUCCION BAZAR, UNIDAD DE PRODUCCION LIBROS
(103, '100LIB', 'EDITORIAL SABER'						, true , true, 3),		--SIN UNIDAD DE PRODUCCION
(104, '100DEP', 'SJB GYM'								, true , true, 4),		-- 	
(105, '100EBR', 'COLEGIO PARTICULAR SAN JUAN BOSCO'		, true , true, 5),
(106, '100APU', 'ACADEMIA PREUNIVERSITARIA SAN FERNANDO', false, true, 5),
(107, '100DEP', 'COMPLEJO DEPORTIVO SJB'				, false, true, 5);







----------------------------------------------------------------------------------------------------------------------------------------
--gen.local-----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.local;
CREATE TABLE gen.local(
	id_local		int				NOT NULL,
	nom_local		varchar(50)		NOT NULL,
	dir_local		varchar(100)	NOT NULL,
	id_dist			char(6)			NOT null,
	--id_empresa		int				not null,
	CONSTRAINT local_pkey PRIMARY KEY (id_local),
	CONSTRAINT local_id_dist_fkey FOREIGN KEY (id_dist) REFERENCES gen.distrito(id_dist) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action--,
	--constraint local_id_empresa_fkey foreign key (id_empresa) references gen.empresa(id_empresa) match simple on update no action on delete no action
);
--
COMMENT ON COLUMN gen.local.dir_local IS 'Dirección de local';
COMMENT ON COLUMN gen.local.id_dist IS 'Identificador del distrito donde se localiza el local';
COMMENT ON TABLE  gen.local IS 'Locales de una empresa';
--
INSERT INTO gen.local (id_local, nom_local, dir_local, id_dist) --, id_empresa 
VALUES 	
(1001, 'Jr. Santa Isabel N° 2065'	, 'Jr. Santa Isabel N° 2065 - El Tambo, Huancayo'	, '110201'),
(1002, 'Jr. Cuzco N° 799'		 	, 'Jr. Cuzco N° 779 - Huancayo'						, '110101'),
(1003, 'Jr. Leandra Torres N° 123'  , 'Jr. Leandra Torres N° 123 - Huancayo'			, '110101'),
(1004, 'Jr. Moquegua N° 258'		, 'Jr. Moquegua N° 258 - Huancayo'					, '110101'),
(1005, 'Hyo - Administrativo'	, 'Jr. Cuzco N° 779 - Huancayo'			, '110101'	),
(1006, 'Hyo - Inicial 3-4 Años'	, 'Jr. Cuzco N° 850 - Huancayo'			, '110101'	),
(1007, 'Hyo - Sec. Básica'		, 'Jr. Junín N° 101 - Huancayo'			, '110101'	),	
(1008, 'Hyo - Sec. Mayores'		, 'Jr. Junín N° 215 - Huancayo'			, '110101'	),
(1009, 'Hyo - Primaria'			, 'Jr. Libertad N° 201 - Huancayo'		, '110101'	),
(1010, 'Hyo - Polideportivo'	, 'Jr. Puno N°770 - Huancayo'			, '110101'	),
(1011, 'Jauja - Plaza De Armas'	, 'Jr. La Mar N° 790 - Jauja'			, '110301'	),
(1012, 'Pampas - Nstra. Sra. De Lourdes', 'Av. Central N° 158 Pampas' 	, '080501'	);


----------------------------------------------------------------------------------------------------------------------------------------
--gen.negocio_local---------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.negocio_local;
CREATE TABLE gen.negocio_local(
	id_negociolocal	int				NOT NULL,
	id_negocio		int				NOT NULL,
	id_local		int				NOT NULL,
	activo			bool			NOT NULL,
	--id_tilocal		char(6)			NOT NULL,
	CONSTRAINT negocio_local_pkey PRIMARY KEY (id_negociolocal),
	CONSTRAINT negocio_local_id_negocio_fkey FOREIGN KEY (id_negocio) REFERENCES gen.negocio(id_negocio) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT negocio_local_id_local_fkey FOREIGN KEY (id_local) REFERENCES gen.local(id_local) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON COLUMN gen.negocio_local.id_negociolocal IS 'Identificador de negocio_local';
COMMENT ON COLUMN gen.negocio_local.id_negocio IS 'Identificador de negocio';
COMMENT ON COLUMN gen.negocio_local.id_local IS 'Identificador de local';
COMMENT ON COLUMN gen.negocio_local.activo IS 'Si el local esta activo';
--COMMENT ON COLUMN gen.negocio_local.id_tilocal IS 'Identifica el tipo de local';
COMMENT ON TABLE  gen.negocio_local IS 'Locales asociado a cada unidad de negocio';
--
INSERT 
INTO gen.negocio_local (id_negociolocal, id_negocio, id_local, activo) --, id_tilocal 
VALUES 
(1011001, 101, 1001, true),
(1021001, 102, 1001, true),
(1031002, 103, 1002, true),
(1041002, 104, 1002, true),
(1051003, 105, 1003, true),
(1061004, 105, 1004, true),
(1071005, 105, 1005, true),
(1071006, 105, 1006, true),
(1071007, 106, 1007, true),
(1071008, 106, 1008, true),
(1081009, 106, 1009, true),
(1081010, 106, 1010, true),
(1081011, 107, 1011, true),
(1091012, 107, 1012, true);
--( 1, 101, 1001, true, '111ADM'),
--( 2, 102, 1002, true, '111ALM'),
--( 3, 103, 1003, true, '111PRO'),
--( 4, 104, 1004, true, '111COB'),
--( 5, 104, 1005, true, '111PAG'),
--( 6, 104, 1006, true, '111ADM');
--( 1, 104, 1, true, '111ADM'),
--( 2, 104, 1, true, '111ALM'),
--( 3, 104, 1, true, '111PRO'),
--( 4, 104, 1, true, '111COB'),
--( 5, 104, 1, true, '111PAG'),
--( 6, 105, 1, true, '111ADM'),
--( 7, 105, 4, true, '111ADM'),
--( 8, 105, 7, true, '111ADM'),
--( 9, 105, 8, true, '111ADM'),
--(10, 106, 1, true, '111ADM'),
--(11, 106, 6, true, '111ALM');




--select * from gen.negocio_local where id_tilocal='111COB';




/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.direccion-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.direccion; 
CREATE TABLE gen.direccion (
	id_direccion 	serial 			NOT NULL,
	id_tivia 		char(6) 		NOT NULL,
	nom_tivia 		varchar(25) 	NOT NULL,
	domicilio 		varchar(50) 	NOT NULL,
	id_tizona 		char(6) 		NOT NULL,
	nom_tizona 		varchar(25) 	NOT NULL,
	nom_zona 		varchar(50) 	NOT NULL,
	referencia 		varchar(100) 	NOT NULL,
	latitud 		varchar(25) 	NOT NULL,
	longitud 		varchar(25) 	NOT NULL,
	id_dist 		char(6) 		NOT NULL,
	editable 		bool 			NOT NULL,
	CONSTRAINT direccion_pkey PRIMARY KEY (id_direccion),
	constraint direccion_id_dist_fkey foreign key (id_dist) references gen.distrito(id_dist) match simple on update no action on delete no action 
);
--
comment on column gen.direccion.id_direccion IS 'Identificador de direccion';
comment on column gen.direccion.id_tivia IS 'Identificador de tipo de via';
comment on column gen.direccion.nom_tivia IS 'Nombre corto de tipo de via';
comment on column gen.direccion.domicilio IS 'Domicilio completo';
comment on column gen.direccion.id_tizona IS 'Identificador de tipo de zona';
comment on column gen.direccion.nom_tizona IS 'Nombre corto de tipo de zona';
comment on column gen.direccion.nom_zona IS 'Nombre de la zona';
comment on column gen.direccion.referencia IS 'Referencia';
comment on column gen.direccion.latitud IS 'Coordenada de latitud';
comment on column gen.direccion.longitud IS 'Coordenada de longitud';
comment on column gen.direccion.id_dist IS 'Identificador de distrito';
comment on column gen.direccion.editable IS 'Indica si el registro es editable';
comment on table gen.direccion IS 'Direcciones';
--
insert into gen.direccion (id_direccion, id_tivia, nom_tivia, domicilio, id_tizona, nom_tizona, nom_zona, referencia, latitud, longitud, id_dist, editable)
values
(	1, '105JIR', 'JR.', 'CUZCO 779'				, '106ZIN', 	'' , 'PARQUE INDUSTRIAL'	, ''										, '-12.043097770067745'	, '-75.22583434865904', '170101'	, false),
(  	2, '105JIR', 'JR.', 'JUNIN N° 2015'			, '106URB', 'URB.' , 'MIRAFLORES'			, 'ENTRE PARQUE MIRAFLORES Y PROL. SUMAR'	, '-11.9828735867347'	, '-75.2600598335266' , '110113'	, true),
(  	3, '105JIR', 'JR.', 'PUNO N° 751'			, '106URB', 'URB.' , 'MIRAFLORES'			, 'ENTRE PARQUE MIRAFLORES Y PROL. SUMAR'	, '-11.9828735867347'	, '-75.2600598335266' , '110113'	, true),
(  	4, '105JIR', 'JR.', 'MOQUEGUA N° 215'		, '106URB', 'URB.' , 'MIRAFLORES'			, 'ENTRE PARQUE MIRAFLORES Y PROL. SUMAR'	, '-11.9828735867347'	, '-75.2600598335266' , '110113'	, false),
(  	5, '105JIR', 'JR.', 'LEANDRA TORRES N° 105'	, '106URB', 'URB.' , 'MIRAFLORES'			, 'ENTRE PARQUE MIRAFLORES Y PROL. SUMAR'	, '-11.9828735867347'	, '-75.2600598335266' , '110113'	, false);

*/


----------------------------------------------------------------------------------------------------------------------------------------
--gen.persona---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.persona;
create table gen.persona(
	id_persona 		int 			not null,
	id_tipersona 	char(6) 		not null,
	id_tigenero 	char(6) 		not null,
	nombres 		varchar(100) 	not null,
	paterno 		varchar(30) 	not null,
	materno 		varchar(30) 	not null,
	sigla 			varchar(50) 	not null,
	dni				varchar(8) 	not null,
	ruc				varchar(11)    not null,
	fijo 			varchar(50) 	not null,
	movil 			varchar(50) 	not null,
	correo 			varchar(50) 	not null,	
	id_tigrpsan		char(6) 		not null,
	validado 		bool 			not null,
	id_usuval		int				not null,
	id_empresa		int				not null,
	constraint persona_pkey primary key (id_persona),
	constraint persona_ukey unique (nombres,paterno,materno)
);
--
COMMENT ON COLUMN gen.persona.id_persona IS 'Identificador de persona';
COMMENT ON COLUMN gen.persona.id_tipersona IS 'Identificador del tipo de persona. Si es persona, empresa, grupo informal';
COMMENT ON COLUMN gen.persona.id_tigenero IS 'Identificador del tipo de género';
COMMENT ON COLUMN gen.persona.nombres IS 'Nombre de la persona  o razón social de la empresa';
COMMENT ON COLUMN gen.persona.paterno IS 'Apellido paterno';
COMMENT ON COLUMN gen.persona.materno IS 'Apellido materno';
COMMENT ON COLUMN gen.persona.sigla IS 'Sigla o alias que identifica a una persona o empresa.  Ej. SEDAM, FBO, Franko Barzola';
--COMMENT ON COLUMN gen.persona.doc_ident IS 'Documento de identidad. Número de DNI, RUC, u otro';
COMMENT ON COLUMN gen.persona.fijo IS 'Teléfonos fijos, separados por punto y coma';
COMMENT ON COLUMN gen.persona.movil IS 'Números de celular, separados por punto y coma';
COMMENT ON COLUMN gen.persona.correo IS 'Correos electrónicos, separados con punto y coma';
COMMENT ON COLUMN gen.persona.id_tigrpsan IS 'Grupo sanguineo de la persona';
COMMENT ON COLUMN gen.persona.validado IS 'Para indicar que ya no se puede modificar';
COMMENT ON COLUMN gen.persona.id_usuval IS 'Identificador del usuario que valida los datos';
COMMENT ON TABLE  gen.persona IS 'Personas naturales y jurídicas';
--
INSERT INTO gen.persona (id_persona, id_tipersona, id_tigenero, nombres, paterno, materno, sigla, dni, ruc, fijo, movil, correo, id_tigrpsan, validado, id_usuval, id_empresa) 
VALUES	
(0,'101PEV','102SIN','<varios/todos/eventual>','','','','','','','','','103SIN',true, -1, -1),
(1,'101PEN','102MAS','FRANKLIN ANTONIO','BARZOLA','OLIVARES','FBO','40110805','10401108055','','','','103SIN',true, -1, 1),
(2,'101PEN','102FEM','SARA SAIDA','SALAZAR','SAAVEDRA','SSS','20121955','','','','','103SIN',true, -1, 1),
(3,'101PEN','102MAS','MIGUEL ANGEL','SALAZAR','LOAYZA','MSL','07826812','','','','','103SIN',true, -1, 1),
(4,'101PEN','102MAS','CARLOS FRANK','SALAZAR','LOAYZA','CSL','20027866','','','','','103SIN',true, -1, 1),
--(5,'101PEJ','102SIN','BARZOLA OLIVARES FRANKLIN ANTONIO','','','','10401108055','','','','103SIN',true, -1),
(6,'101PEN','102FEM','EMILIO','COLQUI','FAUSTINO','EQF','20018053','','','','','103SIN',true, -1, 1),
(7,'101PEN','102FEM','KETTY ALEJANDRINA','CAVERO','HUAMAN','KCH','20119610','','','','','103SIN',true, -1, 1),
(8,'101PEN','102FEM','YENNY GIOVANNA','SINCHE','BARRA','YSB','41330439','','','','','103SIN',true, -1, 1),
(9,'101PEN','102MAS','WILSON','CHAVEZ','VERASTEGUI','WCV','41722469','','','','','103SIN',true, -1, 1),
(10,'101PEN','102MAS','DAVY DARIO','VELI','ROJAS','DVR','40830629','','','','','103SIN',true, -1, 1),
(11,'101PEN','102FEM','CINTHIA','GONZALEZ','FLORES','CGF','40896047','','','','','103SIN',true, -1, 1),
(12,'101PEN','102FEM','BANEZA SINTIA','RAMOS','DIAZ','BRD','40416321','','','','','103SIN',true, -1, 1),
(13,'101PEN','102MAS','JOSSELYN MEDALITH','VALDIVIA','MONTALVO','ABG','19917113','','','','','103SIN',true, -1, 1),
(14,'101PEN','102FEM','LUZ NERIDA','REYES','ARTICA','LRA','20029016','','','','','103SIN',true, -1, 1),
(15,'101PEN','102FEM','MARISA DIANA','SOLANO','SULCA','MSS','44681435','','','','','103SIN',true, -1, 1),
(16,'101PEN','102MAS','JOSE MARIA IGNACIO','MELENDEZ','HERRERA','JMH','00496341','','','','','103SIN',true, -1, 1),
(17,'101PEN','102FEM','LESLIE CHERYL','TAIPE','SALAZAR','LTS','42214297','','','','','103SIN',true, -1, 1),
(18,'101PEN','102FEM','SHIRLEY ELIZABETH','ARROYO','QUINTANA','SCD','80654908','','','','','103SIN',true, -1, 1),
(19,'101PEN','102FEM','YESENIA YULIA','SUASNABAR','ROJAS','YSR','20074916','','','','','103SIN',true, -1, 1),
(20,'101PEN','102FEM','CONSUELO SOLEDAD','QUISPE','RIVAS','CQR','41583110','','','','','103SIN',true, -1, 1),
(21,'101PEN','102FEM','FLOR MARIA','CUADROS','ANGELES','FCA','20097327','','','','','103SIN',true, -1, 1),
(22,'101PEN','102FEM','YANETH ESTHER','GRANADOS','SAMANIEGO','YGS','40577194','','','','','103SIN',true, -1, 1),
(23,'101PEN','102FEM','KETTY R.','QUINTANA','AYLAS','KQA','40897017','','','','','103SIN',true, -1, 1);




--cambiar doc_ident por dni
--en la tabla cliente que será la misma tabla del proveedor (en el formulario cambiar el titulo de acuerdo si esta en ventas o compras)
--agregar una columna ruc (esto sera solo para empresas) y agreagar otras columa emitirFactura
--en el caso de empresas la col emitirFactura siempre sera TRUE, en el caso de personas, que su ruc empiece con 10, dar la opcion de elegir
--si se emitira factura o boleta










/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.doc_identidad_per_default---------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE gen.doc_identidad_per_default(
	id_persona	int		NOT NULL,
	id_doc_ident	char(2)		NOT NULL,
	id_tip_per	char(3) 	NOT NULL,
	CONSTRAINT doc_identidad_per_default_pkey PRIMARY KEY (id_persona,id_doc_ident,id_tip_per),
	CONSTRAINT doc_identidad_per_default_id_persona_fkey FOREIGN KEY (id_persona,id_doc_ident) REFERENCES gen.doc_identidad_per(id_persona,id_doc_ident) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT doc_identidad_per_default_id_tip_per_fkey FOREIGN KEY (id_tip_per) REFERENCES gen.persona_tipo(id_tip_per) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON COLUMN gen.doc_identidad_per_default.id_persona IS 'Identificador de persona';
COMMENT ON COLUMN gen.doc_identidad_per_default.id_doc_ident IS 'Identificador de documento de identidad';
COMMENT ON COLUMN gen.doc_identidad_per_default.id_tip_per IS 'Identificador de tipo de persona';
COMMENT ON TABLE  gen.doc_identidad_per_default IS 'Documento de identidad predeterminado de una persona de acuerdo al tipo_persona';
--
INSERT INTO gen.doc_identidad_per_default (id_persona, id_doc_ident, id_tip_per) 
VALUES 	(1, '00', 'EST'),
	(1, '01', 'TRA'),
	(2, '01', 'EST');
*/
	
	
	
	
/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.direccion-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE gen.direccion(
	id_direccion	int		NOT NULL,
	id_empresa	int		NOT NULL,
	id_tip_via	char(2)		NOT NULL,
	abr_tip_via	varchar(5)	NOT NULL,
	nom_direccion	varchar(100)	NOT NULL,
	id_tip_zon	char(2)		NOT NULL,
	abr_tip_zona	varchar(10) 	NOT NULL,
	nom_zona	varchar(100)	NOT NULL,
	id_dist		char(6)		NOT NULL,
	id_pais		int		NOT NULL,
	CONSTRAINT direccion_pkey PRIMARY KEY (id_direccion),
	CONSTRAINT direccion_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES gen.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT direccion_id_tip_via_fkey FOREIGN KEY (id_tip_via) REFERENCES gen.dir_tip_via(id_tip_via) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT direccion_id_tip_zon_fkey FOREIGN KEY (id_tip_zon) REFERENCES gen.dir_tip_zona(id_tip_zon) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT direccion_id_dist_fkey FOREIGN KEY (id_dist) REFERENCES gen.distrito(id_dist) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON COLUMN gen.direccion.id_direccion IS 'Identificador de domicilio';
COMMENT ON COLUMN gen.direccion.id_empresa IS 'Identificador de la empresa';
COMMENT ON COLUMN gen.direccion.id_tip_via IS 'Identificador del tipo de vía';
COMMENT ON COLUMN gen.direccion.abr_tip_via IS 'Abreviatura del tipo de vía';
COMMENT ON COLUMN gen.direccion.nom_direccion IS 'Dirección del domicilio';
COMMENT ON COLUMN gen.direccion.id_tip_zon IS 'Identificador del tipo de zona';
COMMENT ON COLUMN gen.direccion.abr_tip_zona IS 'Abreviatura del tipo de zona';
COMMENT ON COLUMN gen.direccion.nom_zona IS 'Nombre de la zona donde se reside';
COMMENT ON COLUMN gen.direccion.id_dist IS 'Identificador del distrito donde esta ubicado la dirección';
COMMENT ON COLUMN gen.direccion.id_pais IS 'Identificador del país donde esta ubicado la dirección';
COMMENT ON TABLE  gen.direccion IS 'Dirección de las personas';
--
INSERT INTO gen.direccion (id_direccion, id_empresa, id_tip_via, abr_tip_via, nom_direccion, id_tip_zon, abr_tip_zona, nom_zona, id_dist, id_pais) 
VALUES 	(1, 1001, '02', 'JR. ', 'SANTA ISABEL N° 2065', '01', 'URB. ', 'MIRAFLORES', '120114', 174),
	(2, 1001, '02', 'JR. ', 'ALEJANDRO O. DEUSTUA N° 705', '99', '', '', '120114', 174),
	(3, 1001, '02', 'JR. ', 'CUZCO N° 779', '99', '', '', '120101', 174),
	(4, 1001, '02', 'JR. ', 'LIBERTAD N° 201', '99', '', '', '120101', 174),
	(5, 1002, '02', 'JR. ', 'SANTA ISABEL N° 2065', '01', 'URB. ', 'MIRAFLORES', '120114', 174),
	(6, 1003, '02', 'JR. ', 'SANTA ISABEL N° 2065', '01', 'URB. ', 'MIRAFLORES', '120114', 174);
*/	
	

/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.dir_persona-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE gen.dir_persona(
	id_persona	int		NOT NULL,
	id_direccion	int		NOT NULL,
	CONSTRAINT dir_persona_pkey PRIMARY KEY (id_persona,id_direccion),
	CONSTRAINT dir_persona_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT dir_persona_id_direccion_fkey FOREIGN KEY (id_direccion) REFERENCES gen.direccion(id_direccion) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON COLUMN gen.dir_persona.id_persona IS 'Identificador de persona';
COMMENT ON COLUMN gen.dir_persona.id_direccion IS 'Identificador del domicilio que corresponde a una persona';
COMMENT ON TABLE  gen.dir_persona IS 'Direcciones de una persona';
--
INSERT INTO gen.dir_persona (id_persona, id_direccion) VALUES (1, 1);
INSERT INTO gen.dir_persona (id_persona, id_direccion) VALUES (1, 2);
INSERT INTO gen.dir_persona (id_persona, id_direccion) VALUES (1, 3);
INSERT INTO gen.dir_persona (id_persona, id_direccion) VALUES (1, 4);
INSERT INTO gen.dir_persona (id_persona, id_direccion) VALUES (2, 4);
*/


/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.gen.dir_persona_default-----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE gen.dir_persona_default(
	id_persona	int		NOT NULL,
	id_direccion	int		NOT NULL,
	id_tip_per	char(3) 	NOT NULL,	
	CONSTRAINT dir_persona_default_pkey PRIMARY KEY (id_persona,id_direccion,id_tip_per),
	CONSTRAINT dir_persona_id_persona_fkey FOREIGN KEY (id_persona,id_direccion) REFERENCES gen.dir_persona(id_persona,id_direccion) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,	
	CONSTRAINT dir_persona_id_tip_per_fkey FOREIGN KEY (id_tip_per) REFERENCES gen.persona_tipo(id_tip_per) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON COLUMN gen.dir_persona_default.id_persona IS 'Identificador de persona';
COMMENT ON COLUMN gen.dir_persona_default.id_direccion IS 'Identificador de dirección';
COMMENT ON COLUMN gen.dir_persona_default.id_tip_per IS 'Identificador de tipo de persona';
COMMENT ON TABLE  gen.dir_persona_default IS 'Direcciones predeterminada de una persona de acuerdo al tipo_persona';
--
INSERT INTO gen.dir_persona_default (id_persona, id_direccion, id_tip_per) VALUES (1, 1, 'EST');
INSERT INTO gen.dir_persona_default (id_persona, id_direccion, id_tip_per) VALUES (1, 2, 'TRA');
INSERT INTO gen.dir_persona_default (id_persona, id_direccion, id_tip_per) VALUES (2, 4, 'EST');
*/

/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.lugar_nac-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE gen.lugar_nac(
	id_persona	int		NOT NULL,
	nom_lugar	varchar(50) 	NOT NULL,
	id_dist		char(6)		NOT NULL,
	id_pais		int		NOT NULL,
	fe_nac		date		NOT NULL,
	CONSTRAINT lugar_nac_pkey PRIMARY KEY (id_persona),
	CONSTRAINT lugar_nac_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON COLUMN gen.lugar_nac.id_persona IS 'Identificador de persona';
COMMENT ON COLUMN gen.lugar_nac.id_persona IS 'Nombre de centro poblado/anexo/otro si fuera el caso';
COMMENT ON COLUMN gen.lugar_nac.id_persona IS 'Identificador de distrito';
COMMENT ON COLUMN gen.lugar_nac.id_persona IS 'Identificador de país';
COMMENT ON COLUMN gen.lugar_nac.id_persona IS 'Fecha de nacimiento';
COMMENT ON TABLE  gen.lugar_nac IS 'Lugar donde nació una persona';
--
INSERT INTO gen.lugar_nac (id_persona, nom_lugar, id_dist, id_pais, fe_nac) VALUES (1, 'URB. MIRAFLORES', '120101', 174, '17/03/1978');
INSERT INTO gen.lugar_nac (id_persona, nom_lugar, id_dist, id_pais, fe_nac) VALUES (2, 'CERCADO TARMA', '120701', 174, '20/10/1978');
INSERT INTO gen.lugar_nac (id_persona, nom_lugar, id_dist, id_pais, fe_nac) VALUES (3, '', '150117', 174, '21/07/1978');
*/


/*
select * from gen.doc_identidad
select * from gen.doc_identidad_per_default
select * from gen.dir_persona_default
select * from gen.persona
select * from gen.direccion
select * from gen.empresa
*/

/*
http://200.48.34.567:8080/yupana/ws/generic/empresa/valores/sjb
Envía /valores/sjb y recupera la empresa conID=1001
La empresa se recupera en el cliente (al cargar) y se almacena en su variable global
Con la empresa, el usuario, y la contraseña se valida  
Si se valida se muestra el formulario
*/



--Crear clave unica para id_empresa+id_tip_via+nom_direccion+id_tip_zon+nom_zona+id_dist
-- -- 
-- -- 
-- -- 
-- -- 



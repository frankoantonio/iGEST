----------------------------------------------------------------------------------------------------------------------------------------
--adm.auditoria-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.auditoria;
CREATE TABLE adm.auditoria (
    id_auditoria 	bigserial,
    anio 			int,
    nom_modulo 		varchar(50),
    nom_entidad 	varchar(50),
    id_entidad 		int,
    operacion 		varchar(10),
    id_usuario 		bigint,
    nom_usuario 	varchar(50),
    ip 				varchar(25),
    host 			varchar(100),
    fe_oper 		date,
    fh_oper 		timestamp,
    valores 		varchar(500),
    PRIMARY KEY (id_auditoria, anio, nom_modulo)
) PARTITION BY LIST (anio);
-- 2024 
CREATE TABLE adm.auditoria_2024 PARTITION OF adm.auditoria FOR VALUES IN (2024) PARTITION BY LIST (nom_modulo);
CREATE TABLE adm.auditoria_2024_com PARTITION OF adm.auditoria_2024 FOR VALUES IN ('COM');
CREATE TABLE adm.auditoria_2024_lgt PARTITION OF adm.auditoria_2024 FOR VALUES IN ('LGT');
CREATE TABLE adm.auditoria_2024_per PARTITION OF adm.auditoria_2024 FOR VALUES IN ('PER');
CREATE TABLE adm.auditoria_2024_fin PARTITION OF adm.auditoria_2024 FOR VALUES IN ('FIN');
CREATE TABLE adm.auditoria_2024_cnt PARTITION OF adm.auditoria_2024 FOR VALUES IN ('CNT');
CREATE TABLE adm.auditoria_2024_col PARTITION OF adm.auditoria_2024 FOR VALUES IN ('COL');
CREATE TABLE adm.auditoria_2024_aca PARTITION OF adm.auditoria_2024 FOR VALUES IN ('ACA');
CREATE TABLE adm.auditoria_2024_med PARTITION OF adm.auditoria_2024 FOR VALUES IN ('MED');
CREATE TABLE adm.auditoria_2024_bka PARTITION OF adm.auditoria_2024 FOR VALUES IN ('BKA');
CREATE TABLE adm.auditoria_2024_adm PARTITION OF adm.auditoria_2024 FOR VALUES IN ('ADM');
-- 2025 
CREATE TABLE adm.auditoria_2025 PARTITION OF adm.auditoria FOR VALUES IN (2025) PARTITION BY LIST (nom_modulo);
CREATE TABLE adm.auditoria_2025_com PARTITION OF adm.auditoria_2025 FOR VALUES IN ('COM');
CREATE TABLE adm.auditoria_2025_lgt PARTITION OF adm.auditoria_2025 FOR VALUES IN ('LGT');
CREATE TABLE adm.auditoria_2025_per PARTITION OF adm.auditoria_2025 FOR VALUES IN ('PER');
CREATE TABLE adm.auditoria_2025_fin PARTITION OF adm.auditoria_2025 FOR VALUES IN ('FIN');
CREATE TABLE adm.auditoria_2025_cnt PARTITION OF adm.auditoria_2025 FOR VALUES IN ('CNT');
CREATE TABLE adm.auditoria_2025_col PARTITION OF adm.auditoria_2025 FOR VALUES IN ('COL');
CREATE TABLE adm.auditoria_2025_aca PARTITION OF adm.auditoria_2025 FOR VALUES IN ('ACA');
CREATE TABLE adm.auditoria_2025_med PARTITION OF adm.auditoria_2025 FOR VALUES IN ('MED');
CREATE TABLE adm.auditoria_2025_bka PARTITION OF adm.auditoria_2025 FOR VALUES IN ('BKA');
CREATE TABLE adm.auditoria_2025_adm PARTITION OF adm.auditoria_2025 FOR VALUES IN ('ADM');
--CREAR INDICES PARA USUARIO Y FE_OPER
select *from adm.auditoria a 


----------------------------------------------------------------------------------------------------------------------------------------
--adm.tipo------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.tipo;
CREATE TABLE adm.tipo (
	id_tipo			int		 		NOT NULL PRIMARY KEY,
	nom_tipo 		varchar(100) 	NOT NULL,
	nom_corto 		varchar(25) 	NOT NULL,
	cod_oficial1 	varchar(10) 	NOT NULL,
	cod_oficial2 	varchar(10) 	NOT NULL,
	cod_oficial3 	varchar(10) 	NOT NULL,
	valor1			varchar(10) 	NOT NULL,
	valor2			varchar(10) 	NOT NULL,
	clave			varchar(20) 	NOT NULL,
	grupo 			varchar(20) 	NOT NULL,
	orden 			int 			NOT NULL,
	activo			boolean			NOT NULL,
	id_sistema		char(3)			NOT NULL,
	descripcion 	varchar(75)		NOT NULL
);
--
COMMENT ON TABLE adm.tipo IS 'Tabla tipos.'; 
COMMENT ON COLUMN adm.tipo.id_tipo IS 'Identificador de tipo.';
COMMENT ON COLUMN adm.tipo.nom_tipo IS 'Nombre del tipo.';
COMMENT ON COLUMN adm.tipo.nom_corto IS 'Nombre corto del tipo.';
COMMENT ON COLUMN adm.tipo.cod_oficial1 IS 'Código oficial. Ejm: SUNAT.';
COMMENT ON COLUMN adm.tipo.cod_oficial2 IS 'Código oficial.';
COMMENT ON COLUMN adm.tipo.cod_oficial3 IS 'Código oficial.';
COMMENT ON COLUMN adm.tipo.valor1 IS 'Algún valor necesario. Ejm: DNI=8.';
COMMENT ON COLUMN adm.tipo.valor2 IS 'Algún valor necesario.';
COMMENT ON COLUMN adm.tipo.clave IS 'Clave para el diccionario de datos.';
COMMENT ON COLUMN adm.tipo.grupo IS 'Nombre para agrupar tipo.';
COMMENT ON COLUMN adm.tipo.orden IS 'Orden en que se muestran.';
COMMENT ON COLUMN adm.tipo.activo IS 'Si el tipo está activo.';
COMMENT ON COLUMN adm.tipo.id_sistema IS 'Identificador del sistema.';
COMMENT ON COLUMN adm.tipo.descripcion IS 'Descripción del tipo.';
--
INSERT INTO adm.tipo (id_tipo, nom_tipo, nom_corto, cod_oficial1, cod_oficial2, cod_oficial3, valor1, valor2, clave, grupo, orden, activo, id_sistema, descripcion) 
VALUES 
(95000 , 'NEGOCIOS EN GENERAL'									,	'NEGOCIO'				, ''	,	''	,	''	,	''		,	''	,	'GENERAL'	    ,	'TI_EMPRESA'			, 	1, true	, 'ADM' , ''),	
(95001 , 'COLEGIOS PARTICULARES'								,	'COLEGIO'				, ''	,	''	,	''	,	''		,	''	,	'COLEGIO'	    ,	'TI_EMPRESA'			, 	2, true , 'ADM' , ''),
(95002 , 'ACADEMIAS PREUNIVERSITARIAS'							,	'ACADEMIA'				, ''	,	''	,	''	,	''		,	''	,	'ACADEMIA'	    ,	'TI_EMPRESA'			, 	3, true , 'ADM' , ''),
(95003 , 'CLÍNICAS MÉDICAS QUIRÚRGICAS'							,	'CLÍNICA'				, ''	,	''	,	''	,	''		,	''	,	'CLINICA'	    ,	'TI_EMPRESA'			, 	4, true , 'ADM' , ''),
(95004 , 'BANCOS - CAJAS DE AHORRO Y CRÉDITO'					,	'BANCA'					, ''	,	''	,	''	,	''		,	''	,	'BANCA'	    	,	'TI_EMPRESA'			, 	5, true , 'ADM' , ''),
(95005 , 'COLEGIO Y ACADEMIA'									,	'COLE_ACAD'				, ''	,	''	,	''	,	''		,	''	,	'COL_ACA'    	,	'TI_EMPRESA'			, 	6, true , 'ADM' , ''),
	
(95010, 'PERSONA NATURAL'										,	'PERSONA'				, ''	,	''	,	''	,	''		,	''	,	'NATURAL'	    ,	'TI_PERSONA'			, 	1, true , 'ADM' , ''),
(95011, 'PERSONA JURÍDICA (EMPRESA)'							,	'EMPRESA'				, ''	,	''	,	''	,	''		,	''	,	'JURIDICA'	    ,	'TI_PERSONA'			, 	2, true , 'ADM' , ''),
(95012, 'GRUPO INFORMAL'										,	'GRUPO'					, ''	,	''	,	''	,	''		,	''	,	'GRUPO'	    	,	'TI_PERSONA'			, 	3, true , 'ADM' , ''),
(95013, 'NATURAL/JURÍDICA'										,	'NAT/JUR'				, ''	,	''	,	''	,	''		,	''	,	'NAT/JUR'    	,	'TI_PERSONA'			, 	4, true , 'ADM' , ''),
(95014, 'NATURAL/JURÍDICA/GRUPO'								,	'NAT/JUR/GRP'			, ''	,	''	,	''	,	''		,	''	,	'NAT/JUR/GRP'  	,	'TI_PERSONA'			, 	5, true , 'ADM' , ''),
(95019, '<VARIOS>'												,	'VARIOS'				, ''	,	''	,	''	,	''		,	''	,	'VARIOS'	    ,	'TI_PERSONA'			, 	6, true , 'ADM' , ''),
	
(95020, 'HOMBRE'												,	'H'						, ''	,	''	,	''	,	''		,	''	,	'HOMBRE'	    ,	'TI_SEXO'				, 	1, true , 'ADM' , ''),
(95021, 'MUJER'													,	'M'						, ''	,	''	,	''	,	''		,	''	,	'MUJER'	    	,	'TI_SEXO'				, 	2, true , 'ADM' , ''),
(95029, '<SIN INDICAR>'											,	'-'						, ''	,	''	,	''	,	''		,	''	,	'S/I'	    	,	'TI_SEXO'				, 	3, true , 'ADM' , ''),
	
(95030, 'DOCUMENTO NACIONAL DE IDENTIDAD'						,	'DNI'					, '01'	,	''	,	''	,	'8'		,	''	,	'DNI'	    	,	'TI_DOC_IDENT'			, 	1, true , 'ADM' , ''), 	--SUNAT-PLAME-Anexo2.xlsx  ->  T3- Tipo Documento  
(95031, 'CARNÉ DE EXTRANJERÍA'									,	'CARNÉ EXTRANJERÍA'		, '04'	,	''	,	''	,	''		,	''	,	'CEX'	    	,	'TI_DOC_IDENT'			, 	5, true , 'ADM' , ''),
(95032, 'REGISTRO ÚNICO DE CONTRIBUYENTES'						,	'RUC'					, '06'	,	''	,	''	,	'11'	,	''	,	'RUC'	    	,	'TI_DOC_IDENT'			, 	2, true , 'ADM' , ''),
(95033, 'PASAPORTE'												,	'PASAPORTE'				, '07'	,	''	,	''	,	''		,	''	,	'PSP'	    	,	'TI_DOC_IDENT'			, 	5, true , 'ADM' , ''),	
(95034, 'CARNÉ DE SOLICITUD DE REFUGIO'							,	'CARNÉ SOL. REFUGIO'	, '09'	,	''	,	''	,	''		,	''	,	'CSR'	    	,	'TI_DOC_IDENT'			, 	5, true , 'ADM' , ''),
(95035, 'PARTIDA DE NACIMIENTO'									,	'PARTIDA NACIMIENTO'	, '11'	,	''	,	''	,	''		,	''	,	'PNA'	    	,	'TI_DOC_IDENT'			,   5, true , 'ADM' , ''),
(95036, 'CARNÉ DE IDENTIDAD RELACIONES EXTERIORES'				,	'CARNÉ IDENT. REL. EXT'	, '22'	,	''	,	''	,	''		,	''	,	'CRE'	    	,	'TI_DOC_IDENT'			,   5, true , 'ADM' , ''),
(95037, 'PERMISO TEMPORAL DE PERMANENCIA'						,	'PTP'					, '23'	,	''	,	''	,	''		,	''	,	'PTP'	    	,	'TI_DOC_IDENT'			,   5, true , 'ADM' , ''),
(95038, 'DOCUMENTO DE IDENTIDAD EXTRANJERO'						,	'DOC. IDENT. EXTRANJERO', '24'	,	''	,	''	,	''		,	''	,	'DEX'	    	,	'TI_DOC_IDENT'			,   5, true , 'ADM' , ''),
(95039, 'CARNÉ DE PERMISO TEMPORAL DE PERMANENCIA'				,	'CPP'					, '26'	,	''	,	''	,	''		,	''	,	'CPP'	    	,	'TI_DOC_IDENT'			,   5, true , 'ADM' , ''),
(95040, 'CÉDULA DIPLOMÁTICA DE IDENTIDAD'						,	'CÉDULA DIPLOMÁTICA'	, 'A'	,	''	,	''	,	''		,	''	,	'CDI'	    	,	'TI_DOC_IDENT'			,   5, true , 'ADM' , ''),
(95041, 'SALVOCONDUCTO'											,	'SALVOCONDUCTO'			, 'G'	,	''	,	''	,	''		,	''	,	'SAL'	    	,	'TI_DOC_IDENT'			,   5, true , 'ADM' , ''),
(95042, 'NO DOMICILIADO, SIN RUC (EXPORTACIÓN)'					,	'NO DOMICILIADO'		, '0'	,	''	,	''	,	''		,	''	,	'NDO'	    	,	'TI_DOC_IDENT'			,   5, true , 'ADM' , ''),
(95049, 'SIN DOCUMENTO - VARIOS - OTROS'						,	'SIN DOC. IDENTIDAD'	, '-'	,	''	,	''	,	''		,	''	,	'S/I'	    	,	'TI_DOC_IDENT'			,  10, true , 'ADM' , 'VENTAS MENORES A 700.00'),
	
(95050, 'CABECERA DE OPCIONES'									,	''						, ''	,	''	,	''	,	''		,	''	,	'CAB'			,	'TI_OPCION_SIS'			,  	1, true , 'ADM' , ''),
(95051, 'OPCIÓN - PANEL DE USUARIO'								,	''						, ''	,	''	,	''	,	''		,	''	,	'PNL'			,	'TI_OPCION_SIS'			,  	2, true , 'ADM' , ''),
(95052, 'OPCIÓN - FORMULARIO EMERGENTE'							,	''						, ''	,	''	,	''	,	''		,	''	,	'FRM'			,	'TI_OPCION_SIS'			,  	3, true , 'ADM' , ''),
(95053, 'OPCIÓN - REPORTE'										,	''						, ''	,	''	,	''	,	''		,	''	,	'RPT'			,	'TI_OPCION_SIS'			,  	4, true , 'ADM' , ''),
	
(95060, 'AVENIDA'												,	'AV.'					, '01'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),	--SUNAT-PLAME-Anexo2.xlsx  ->  T5 Via
(95061, 'JIRÓN'													,	'JR.'					, '02'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95062, 'CALLE'													,	'CA.'					, '03' 	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95063, 'PASAJE'												,	'PJ.'					, '04'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95064, 'ALAMEDA'												,	'AL.'					, '05' 	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95065, 'MALECÓN'												,	'MA.'					, '06'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95066, 'OVALO'													,	'OV.'					, '07'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95067, 'PARQUE'												,	'PQ.'					, '08'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95068, 'PLAZA'													,	'PLA.'					, '09'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95069, 'CARRETERA'												,	'CAR.'					, '10'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95070, 'TROCHA'												,	'TRO.'					, '13'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95071, 'CAMINO RURAL'											,	'CRU.' 					, '14'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95072, 'BAJADA'												,	'BAJ.' 					, '15'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95073, 'GALERIA'												,	'GAL.' 					, '16'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95074, 'PROLONGACIÓN'											,	'PRO.' 					, '17'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95075, 'PASEO'													,	'PAS.' 					, '18'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95076, 'PLAZUELA'												,	'PZU.' 					, '19'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95077, 'PORTAL'												,	'POR.' 					, '20'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95078, 'CAMINO AFIRMADO'										,	'CAF.' 					, '21'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95079, 'TROCHA CARROZABLE'										,	'TRC.' 					, '22'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'ADM' , ''),
(95080, 'OTROS'													,	'OTROS'					, '99'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   1, true , 'ADM' , ''),
(95089, '<SIN INDICAR>'											,	''						, '99'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   2, true , 'ADM' , ''),
	
(95090, 'URBANIZACIÓN'											,	'URB.'					, '01'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),	--SUNAT-PLAME-Anexo2.xlsx  ->  T6 Zona
(95091, 'PUEBLO JOVEN'											,	'P.J.'					, '02'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),
(95092, 'UNIDAD VECINAL'										,	'U.V.'					, '03'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),
(95093, 'CONJUNTO HABITACIONAL'									,	'C.H.'					, '04'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),
(95094, 'ASENTAMIENTO HUMANO'									,	'A.H.'					, '05'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),
(95095, 'COOPERATIVA'											,	'COO.'					, '06'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),
(95096, 'RESIDENCIAL'											,	'RES.'					, '07'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),
(95097, 'ZONA INDUSTRIAL'										,	'Z.I.'					, '08'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),
(95098, 'GRUPO'													,	'GRU.'					, '09'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),
(95099, 'CASERÍO'												,	'CAS.'					, '10'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),
(95100, 'FUNDO'													,	'FND.'					, '11'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'ADM' , ''),
(95101, 'OTROS'													,	'OTROS' 				, '99'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   1, true , 'ADM' , ''),
(95109, '<SIN INDICAR>'											,	'' 						, '99'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   2, true , 'ADM' , ''),
	
(95110, 'PAIS'													, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	1, true , 'ADM' , ''),
(95111, 'ZONA'													, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	2, true , 'ADM' , ''),
(95112, 'SEDE'													, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	3, true , 'ADM' , ''),
(95113, 'AGENCIA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	4, true , 'ADM' , ''),
(95114, 'LOCAL'													, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	5, true , 'ADM' , ''),
(95115, 'EOB'													, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	6, true , 'ADM' , ''),
(95116, 'PUNTO DE VENTA'										, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	7, true , 'ADM' , ''),
	
(95120, 'COLEGIO / ESCUELA'										,	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	1, true , 'ADM' , ''),
(95121, 'CETPRO / CEO / OTRO'									,	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	2, true , 'ADM' , ''),
(95122, 'INSTITUTO'												,	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	3, true , 'ADM' , ''),
(95123, 'ESCUELA ARTISTICA / DEPORTIVA / CULTURAL / OTRO'		,	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	4, true , 'ADM' , ''),
(95124, 'ESCUELA POLICIAL'										,	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	5, true , 'ADM' , ''),
(95125, 'ESCUELA MILITAR'										,	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	6, true , 'ADM' , ''),
(95126, 'UNIVERSIDAD'											,	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	7, true , 'ADM' , ''),
	
(95130, 'SOLTERO/A'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	1, true , 'ADM' , ''),
(95131, 'CASADO/A'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	2, true , 'ADM' , ''),
(95132, 'CONVIVIENTE'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	3, true , 'ADM' , ''),
(95133, 'SEPARADO/A'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	4, true , 'ADM' , ''),
(95134, 'DIVORCIADO/A'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	5, true , 'ADM' , ''),
(95135, 'VIUDO/A'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	6, true , 'ADM' , ''),
(95139, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	7, true , 'ADM' , ''),
	
(95140, 'SIN EDUCACIÓN FORMAL'									, 	''						, '01'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   1, true , 'ADM' , ''),	--SUNAT-PLAME-Anexo2.xlsx  ->  T9 Situación Educativa
(95141, 'ESPECIAL INCOMPLETA'									, 	''						, '02'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   2, true , 'ADM' , ''),
(95142, 'ESPECIAL COMPLETA'										, 	''						, '03'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   3, true , 'ADM' , ''),
(95143, 'PRIMARIA INCOMPLETA'									, 	''						, '04'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   4, true , 'ADM' , ''),
(95144, 'PRIMARIA COMPLETA'										, 	''						, '05'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   5, true , 'ADM' , ''),
(95145, 'SECUNDARIA INCOMPLETA'									, 	''						, '06'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   6, true , 'ADM' , ''),
(95146, 'SECUNDARIA COMPLETA'									, 	''						, '07'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   7, true , 'ADM' , ''),
(95147, 'TÉCNICA INCOMPLETA - CEO/CETPRO'						, 	''						, '08'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   8, true , 'ADM' , ''),
(95148, 'TÉCNICA COMPLETA - CEO/CETPRO'							, 	''						, '09'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   9, true , 'ADM' , ''),
(95149, 'SUPERIOR INCOMPLETA - IST/ISP/ESC. FORM. ART./ESC. SUBOF.',''						, '10'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  10, true , 'ADM' , ''),
(95150, 'SUPERIOR COMPLETA - IST/ISP/ESC. FORM. ART./ESC. SUBOF.'  ,''						, '11'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  11, true , 'ADM' , ''),
(95151, 'UNIVERSITARIA INCOMPLETA - ESCUELA OF.'				, 	''						, '12'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  12, true , 'ADM' , ''),
(95152, 'UNIVERSITARIA COMPLETA - ESCUELA OF.'					, 	''						, '13'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  13, true , 'ADM' , ''),
(95153, 'GRADO DE BACHILLER'									, 	''						, '14'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  14, true , 'ADM' , ''),
(95154, 'TITULADO'												, 	''						, '15'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  15, true , 'ADM' , ''),
(95155, 'MAESTRÍA INCOMPLETA'									, 	''						, '16'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  16, true , 'ADM' , ''),
(95156, 'MAESTRÍA COMPLETA'										, 	''  					, '17'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  17, true , 'ADM' , ''),
(95157, 'GRADO DE MAESTRÍA'										, 	''  					, '18'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  18, true , 'ADM' , ''),
(95158, 'DOCTORADO INCOMPLETO'									, 	''  					, '19'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  19, true , 'ADM' , ''),
(95159, 'DOCTORADO COMPLETO'									, 	''  					, '20'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  20, true , 'ADM' , ''),
(95160, 'GRADO DE DOCTOR'										, 	''  					, '21'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  21, true , 'ADM' , ''),
(95169, '<SIN INDICAR>'											, 	''  					, '99'	,	''	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  22, true , 'ADM' , ''),
	
(95170, 'SEÑOR'													, 	'SR.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	1, true , 'ADM' , ''),
(95171, 'SEÑORA'												, 	'SRA.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	2, true , 'ADM' , ''),
(95172, 'SEÑORITA'												, 	'SRTA.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	3, true , 'ADM' , ''),
(95173, 'LICENCIADO/A'											, 	'LIC.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95174, 'CONTADOR/A PÚBLICO/A COLEGIADO/A'						, 	'C.P.C.'				, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95175, 'ABOGADO/A'												, 	'ABOG.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95176, 'INGENIERO/A'											, 	'ING.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95177, 'ARQUITECTO/A'											, 	'ARQ.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95178, 'PROFESOR/A'											, 	'PROF.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95179, 'BACHILLER'												, 	'BACH.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95180, 'MAGISTER'												, 	'MG.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95181, 'DOCTOR/A'												, 	'DR.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95182, 'OFICIAL'												, 	'OF.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95183, 'SUBOFICIAL'											, 	'SOF.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95184, 'TÉCNICO/A'												, 	'TEC.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
(95185, 'PSICÓLOGO/A'											, 	'PS.'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'ADM' , ''),
	
(95200, 'OFICINA'												, 	'OFI'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95201, 'ALMACÉN CONSUMIBLES'									, 	'AL1'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95202, 'ALMACÉN MERCADERÍA'									, 	'AL2'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95203, 'ALMACÉN MATERIA PRIMA'									, 	'AMP'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95204, 'ALMACÉN GENERAL'										, 	'ALM'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95205, 'PUNTO DE VENTA'										, 	'PVT'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95206, 'SALÓN'													, 	'SAL'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95207, 'SALA'													, 	'SAA'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95208, 'HALL'													, 	'HAL'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95209, 'JARDÍN'												, 	'JAR'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95210, 'DUCTO'													, 	'DUC'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95211, 'PATIO'													, 	'PAT'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95212, 'PASADIZO'												, 	'PAS'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95213, 'ASENSOR'												, 	'ASE'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95214, 'GRADA'													, 	'GRA'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95215, 'BAÑO'													, 	'BAN'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95216, 'AUDITORIO'												, 	'AUD'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),
(95217, 'ALMACÉN PRODUCTOS TERMINADOS'							, 	'APT'					, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'ADM' , ''),

(95220, 'MAÑANA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	1, true , 'ADM' , ''),
(95221, 'TARDE'													, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	2, true , 'ADM' , ''),
(95222, 'NOCHE'													, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	3, true , 'ADM' , ''),
(95223, 'TODO EL DÍA'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	4, true , 'ADM' , ''),
(95224, 'TODA LA NOCHE'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	5, true , 'ADM' , ''),
(95225, 'SOLO FINES DE SEMANA'									, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	6, true , 'ADM' , ''),
(95226, 'INTERDIARIO'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	7, true , 'ADM' , ''),
(95229, 'VARIABLE'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	8, true , 'ADM' , ''),
	
(95230, 'CASTELLANO'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	1, true , 'ADM' , ''),
(95231, 'QUECHUA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	2, true , 'ADM' , ''),
(95232, 'AYMARA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95233, 'ASHANINKA(CAMPA)'										, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95234, 'AGUARUNA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95235, 'SHIPIBA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95236, 'HIJITOTO'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95237, 'COCAMA - COCAMILLA'									, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95238, 'MACHIGUENGA'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95239, 'PIRO'													, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95240, 'CASHINAHUA'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95241, 'COCATAIBO'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95242, 'YAMINAHUA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95243, 'CULINA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95244, 'SHARANAHUA'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95245, 'MATSANAHUA'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95246, 'ANAHUACA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95247, 'HUAMBISA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95248, 'ACHUAR'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95249, 'BORA'													, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95250, 'CHAYAHUITA'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95251, 'YANESHA'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'ADM' , ''),
(95252, 'INGLES'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	8, true , 'ADM' , ''),
(95253, 'FRANCES'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	8, true , 'ADM' , ''),
(95254, 'ITALIANO'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	8, true , 'ADM' , ''),
(95259, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  11, true , 'ADM' , ''),
	
(95260, 'CASA'													, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIVIENDA'			,  	1, true , 'ADM' , ''),
(95261, 'DEPARTAMENTO'											, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIVIENDA'			,  	2, true , 'ADM' , ''),
(95262, 'DUPLEX'												, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIVIENDA'			,  	3, true , 'ADM' , ''),
(95263, 'CUARTO'												, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIVIENDA'			,  	4, true , 'ADM' , ''),
(95269, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIVIENDA'			,  	5, true , 'ADM' , ''),
	
(95270, 'MATERIAL NOBLE'										, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIV_MATERIAL'		,  	1, true , 'ADM' , ''),
(95271, 'MADERA'												, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIV_MATERIAL'		,  	2, true , 'ADM' , ''),
(95272, 'RÚSTICO'												, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIV_MATERIAL'		,  	3, true , 'ADM' , ''),
(95279, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIV_MATERIAL'		,  	3, true , 'ADM' , ''),
	
(95280, 'ALQUILADO'												, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIV_CONDICION'		,  	1, true , 'ADM' , ''),
(95281, 'PROPIO'												, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIV_CONDICION'		,  	2, true , 'ADM' , ''),
(95282, 'FAMILIAR'												, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIV_CONDICION'		,  	3, true , 'ADM' , ''),
(95289, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''  ,	''	    ,	''	,	''	    		,	'TI_VIV_CONDICION'		,  	4, true , 'ADM' , ''),
	
(95290, 'SIN MOVILIDAD'											, 	''						, ''	,	''	,	''  ,	''		,	''	,	''	    		,	'TI_MOVILIDAD'			,  	1, true , 'ADM' , ''),
(95291, 'BICICLETA'												, 	''						, ''	,	''	,	''  ,	''		,	''	,	''	    		,	'TI_MOVILIDAD'			,  	2, true , 'ADM' , ''),
(95292, 'PROPIO MOTORIZADO 2|3 RUEDAS'							, 	''						, ''	,	''	,	''  ,	''		,	''	,	''	    		,	'TI_MOVILIDAD'	    	,  	3, true , 'ADM' , ''),
(95293, 'PROPIO MOTORIZADO 4+ RUEDAS'							, 	''						, ''	,	''	,	''  ,	''		,	''	,	''	    		,	'TI_MOVILIDAD'	    	,  	4, true , 'ADM' , ''),
(95294, 'TRANSPORTE PÚBLICO'									, 	''						, ''	,	''	,	''  ,	''		,	''	,	''	    		,	'TI_MOVILIDAD'	    	,  	5, true , 'ADM' , ''),
(95295, 'MIXTO [PROPIO/PÚBLICO]'								, 	''						, ''	,	''	,	''  ,	''		,	''	,	''	    		,	'TI_MOVILIDAD'	    	,  	6, true , 'ADM' , ''),
(95299, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''  ,	''		,	''	,	''	    		,	'TI_MOVILIDAD'	    	,  	7, true , 'ADM' , ''),


																																				
(10001, 'ACTIVO'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	1, true , 'COM' , ''),
(10002, 'SUSPENSIÓN TEMPORAL'									, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	2, true , 'COM' , ''),
(10003, 'BAJA PROVISIONAL'										, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	3, true , 'COM' , ''),
(10004, 'BAJA DEFINITIVA'										, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	4, true , 'COM' , ''),
(10005, 'BAJA PROVISIONAL DE OFICIO'							, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	5, true , 'COM' , ''),
(10006, 'BAJA DEFINITIVA DE OFICIO'								, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	6, true , 'COM' , ''),
(10007, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	7, true , 'COM' , ''),
																																																		
(10010, 'HABIDO'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_CONDICION_CONTRIB'	,  	1, true , 'COM' , ''),
(10011, 'NO HALLADO'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_CONDICION_CONTRIB'	,  	2, true , 'COM' , ''),
(10012, 'NO HABIDO'												, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_CONDICION_CONTRIB'	,  	3, true , 'COM' , ''),
(10013, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	,	''		,	''	,	''				,	'TI_CONDICION_CONTRIB'	,  	4, true , 'COM' , '');


/*
(10460, '<SIN INDICAR>'											, 	'---'					, ''	,	''	,	''		,	''		,	'TI_NIV_EDUC'		, 	4, true , 'ACD' , ''),
(10461, 'INICIAL'												, 	'INI'					, ''	,	''	,	''		,	''		,	'TI_NIV_EDUC'		, 	1, true , 'ACD' , ''),
(10462, 'PRIMARIA'												, 	'PRI'					, ''	,	''	,	''		,	''		,	'TI_NIV_EDUC'		, 	2, true , 'ACD' , ''),
(10463, 'SECUNDARIA'											, 	'SEC'					, ''	,	''	,	''		,	''		,	'TI_NIV_EDUC'		, 	3, true , 'ACD' , ''),


(10310, 'PAPÁ'													, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  	1, true , 'ACD' , ''),
(10311, 'MAMÁ'													, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  	2, true , 'ACD' , ''),
(10312, 'ESPOSO/A'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10313, 'PAREJA'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10314, 'HIJO/A'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10315, 'ABUELO/A'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10316, 'HERMANO/A'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10317, 'TÍO/A'													, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10318, 'PRIMO/A'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10319, 'PADRINO/MADRINA'										, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10320, 'TUTOR/A'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10321, 'COMPADRE/COMADRE'										, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10322, 'CUÑADO/A'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10323, 'SUEGRO/A'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10324, 'AMISTAD'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  97, true , 'ACD' , ''),
(10325, 'SOBRINO/A'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  10, true , 'ACD' , ''),
(10326, 'OTRO PARENTESCO'										, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  98, true , 'ACD' , ''),
(10327, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''	    ,	'TI_PARENTESCO'		,  99, true , 'ACD' , ''),
*/
																													



/*
																															
																																		
(10220, 'CATÓLICA'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_RELIGION'		,  	1, true , 'ADM' , ''),
(10221, 'CRISTIANA'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_RELIGION'		,  	2, true , 'ADM' , ''),
(10222, 'OTRA RELIGIÓN'											, 	''						, ''	,	''	,	''		,	''	    ,	'TI_RELIGION'		,  10, true , 'ADM' , ''),
(10223, 'NINGUNA RELIGIÓN'										, 	''						, ''	,	''	,	''		,	''	    ,	'TI_RELIGION'		,  11, true , 'ADM' , ''),
(10224, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''	    ,	'TI_RELIGION'		,  12, true , 'ADM' , ''),
(10225, 'DHÁRMICAS'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_RELIGION'		,  	3, true , 'ADM' , ''),
(10226, 'ISLAMÍCA'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_RELIGION'		,  	4, true , 'ADM' , ''),
(10227, 'JUDÍA'													, 	''						, ''	,	''	,	''		,	''	    ,	'TI_RELIGION'		,  	5, true , 'ADM' , ''),
																																		

																																		
(10270, '<1,000.00'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_INGRESOS'	,  	1, true , 'ADM' , ''),
(10271, '  1,000.00 -  2,000.00'								, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_INGRESOS'	,  	2, true , 'ADM' , ''),
(10272, '  2,001.00 -  3,000.00'								, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_INGRESOS'	,  	3, true , 'ADM' , ''),
(10273, '  3,001.00 -  4,000.00'								, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_INGRESOS'	,  	4, true , 'ADM' , ''),
(10274, '  4,001.00 -  5,000.00'								, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_INGRESOS'	,  	5, true , 'ADM' , ''),
(10275, '  5,001.00 -  7,500.00'								, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_INGRESOS'	,  	6, true , 'ADM' , ''),
(10276, '  7,501.00 - 10,000.00'								, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_INGRESOS'	,  	7, true , 'ADM' , ''),
(10277, '10,001.00 - 15,000.00'									, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_INGRESOS'	,  	8, true , 'ADM' , ''),
(10278, '15,001.00 - 20,000.00'									, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_INGRESOS'	,  	9, true , 'ADM' , ''),
(10279, '>20,000.00'											, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_INGRESOS'	,  10, true , 'ADM' , ''),

																																																														
																																																																																																																												
(10290, 'SIS - SEGURO INTEGRAL DE SALUD'						, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_SEGURO'		,  	1, true , 'ADM' , ''),
(10291, 'ESSALUD'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_SEGURO'		,  	2, true , 'ADM' , ''),
(10292, 'SEGURO SALUD FFAA'										, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_SEGURO'		,  	3, true , 'ADM' , ''),
(10293, 'SEGURO SALUD FFPP'										, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_SEGURO'		,  	4, true , 'ADM' , ''),
(10294, 'EPS RIMAC'												, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_SEGURO'		,  	5, true , 'ADM' , ''),
(10295, 'EPS MAPFRE'											, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_SEGURO'		,  	6, true , 'ADM' , ''),
(10296, 'EPS SANITAS'											, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_SEGURO'		,  	7, true , 'ADM' , ''),
(10297, 'EPS PACÍFICO'											, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_SEGURO'		,  	8, true , 'ADM' , ''),
(10298, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''	    ,	'TI_FAM_SEGURO'		,  	9, true , 'ADM' , ''),
																																		
																																								
(10350, 'DIARIO'												, 	''						, ''	,	''	,	'1'		,	'DÍA'	,	'TI_PERIODICIDAD'	,  	1, true , 'ADM' , ''),
(10351, 'SEMANAL'												, 	''						, ''	,	''	,	'7'		,	'DÍA'	,	'TI_PERIODICIDAD'	,  	2, true , 'ADM' , ''),
(10352, 'QUINCENAL 14'											, 	''						, ''	,	''	,	'14'	,	'DÍA'	,	'TI_PERIODICIDAD'	,  	3, true , 'ADM' , ''),
(10353, 'QUINCENAL 15'											, 	''						, ''	,	''	,	'15'	,	'DÍA'	,	'TI_PERIODICIDAD'	,  	4, true , 'ADM' , ''),
(10354, 'MENSUAL'												, 	''						, ''	,	''	,	'1'		,	'MES'	,	'TI_PERIODICIDAD'	,  	5, true , 'ADM' , ''),
(10355, 'BIMESTRAL'												, 	''						, ''	,	''	,	'2'		,	'MES'	,	'TI_PERIODICIDAD'	,  	6, true , 'ADM' , ''),
(10356, 'TRIMESTRAL'											, 	''						, ''	,	''	,	'3'		,	'MES'	,	'TI_PERIODICIDAD'	,  	7, true , 'ADM' , ''),
(10357, 'CUATRIMESTRAL'											, 	''						, ''	,	''	,	'4'		,	'MES'	,	'TI_PERIODICIDAD'	,  	8, true , 'ADM' , ''),
(10358, 'QUINQUEMESTRAL'										, 	''						, ''	,	''	,	'5'		,	'MES'	,	'TI_PERIODICIDAD'	,   9, true , 'ADM' , ''),
(10359, 'SEMESTRAL'												, 	''						, ''	,	''	,	'6'		,	'MES'	,	'TI_PERIODICIDAD'	,  10, true , 'ADM' , ''),
(10360, 'ANUAL'													, 	''						, ''	,	''	,	'1'		,	'AÑO'	,	'TI_PERIODICIDAD'	,  11, true , 'ADM' , ''),
(10361, 'NINGUNO'												, 	''						, ''	,	''	,	'0'		,	'---'	,	'TI_PERIODICIDAD'	,  12, true , 'ADM' , ''),
			
			

																																		

																																															
(10470, 'CIENCIAS'												, 	''						, ''	,	''	,	''		,	''		,	'TI_GRP_ESTUDIO'	,  	1, true , 'ACD' , ''),
(10471, 'LETRAS'												, 	''						, ''	,	''	,	''		,	''		,	'TI_GRP_ESTUDIO'	,  	2, true , 'ACD' , ''),
(10472, 'ESFUERZO FÍSICO'										, 	''						, ''	,	''	,	''		,	''		,	'TI_GRP_ESTUDIO'	,  	3, true , 'ACD' , ''),
(10473, 'CONOCIMIENTOS'											, 	''						, ''	,	''	,	''		,	''		,	'TI_GRP_ESTUDIO'	,  	4, true , 'ACD' , ''),
(10474, 'ÚNICO'													, 	''						, ''	,	''	,	''		,	''		,	'TI_GRP_ESTUDIO'	,  	5, true , 'ACD' , ''),
(10475, 'GRUPOS VARIOS'											, 	''						, ''	,	''	,	''		,	''		,	'TI_GRP_ESTUDIO'	,  	6, true , 'ACD' , ''),
(10476, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''		,	'TI_GRP_ESTUDIO'	,  16, true , 'ACD' , ''),
																																								

																																											
(10510, 'PRESENCIAL OFICINA'									, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,   1, true , 'COM' , ''),	--OK_OK
(10511, 'PRESENCIAL DOMICILIARIO'								, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,   2, true , 'COM' , ''),
(10512, 'PRESENCIAL LABORAL'									, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,   3, true , 'COM' , ''),
(10513, 'PRESENCIAL PUNTO DE VENTA'								, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,   4, true , 'COM' , ''),
(10514, 'EVENTOS 1'												, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,   5, true , 'COM' , ''),
(10515, 'LLAMADA'												, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10516, 'MENSAJE DE TEXTO'										, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10517, 'WHATSAPP'												, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10518, 'TELEGRAM'												, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10519, 'FACEBOOK'												, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10520, 'CORREO'												, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10521, 'INTRANET'												, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10522, 'FORMULARIO GOOGLE'										, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10523, 'FORMULARIO FACEBOOK'									, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10524, 'FORMULARIO WEB'										, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10525, 'EVENTOS 2'												, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,   6, true , 'COM' , ''),
(10526, 'EVENTOS 3'												, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,   7, true , 'COM' , ''),
(10527, 'OTRO MEDIO'											, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  20, true , 'COM' , ''),
(10528, '<NO SE LOGRO CONTACTAR>'								, 	''						, ''	,	''	,	''		,	''		,	'TI_ATENCION'		,  30, true , 'COM' , ''),
			
(10540, 'INICIADO'												, 	''						, ''	,	''	,	''		,	''		,	'TI_EST_MATR'		,  	1, true , 'COM' , ''),
(10541, 'EN PROCESO'											, 	''						, ''	,	''	,	''		,	''		,	'TI_EST_MATR'		,  	2, true , 'COM' , ''),
(10542, 'INSCRITO'												, 	''						, ''	,	''	,	''		,	''		,	'TI_EST_MATR'		,  	3, true , 'COM' , ''),
(10543, 'DESCALIFICADO'											, 	'TI_DESCALI'			, ''	,	''	,	''		,	''		,	'TI_EST_MATR'		,  	4, true , 'COM' , ''), --tipo DE DESCALIFICACIÓN
(10544, 'MATRICULADO'											, 	''						, ''	,	''	,	''		,	''		,	'TI_EST_MATR'		,  	5, true , 'COM' , ''),
(10545, 'ANULADO'												, 	'TI_ANULADO'			, ''	,	''	,	''		,	''		,	'TI_EST_MATR'		,  	6, true , 'COM' , ''), --tipo DE ANULADO
(10546, 'RETIRADO'												, 	'TI_RETIRAD'			, ''	,	''	,	''		,	''		,	'TI_EST_MATR'		,  	7, true , 'COM' , ''), --tipo DE RETIRO
(10547, 'TRASLADADO'											, 	'TI_TRASLAD'			, ''	,	''	,	''		,	''		,	'TI_EST_MATR'		,  	8, true , 'COM' , ''), --tipo DE TRASLADO
(10548, 'TRASLADO Y RESERVA'									, 	'TI_TRASLAD'			, ''	,	''	,	''		,	''		,	'TI_EST_MATR'		,  	9, true , 'COM' , ''), --tipo DE TRASLADO
																																		
(10560, 'NO MUESTRA INTERÉS'									, 	''						, ''	,	''	,	''		,	''		,	'TI_GDO_INTERES'	,  	1, true , 'COM' , ''),
(10561, 'INTERÉS NORMAL'										, 	''						, ''	,	''	,	''		,	''		,	'TI_GDO_INTERES'	,  	2, true , 'COM' , ''),
(10562, 'MUY INTERESADO'										, 	''						, ''	,	''	,	''		,	''		,	'TI_GDO_INTERES'	,  	3, true , 'COM' , ''),
(10563, 'POTENCIAL CLIENTE'										, 	''						, ''	,	''	,	''		,	''		,	'TI_GDO_INTERES'	,  	4, true , 'COM' , ''),
(10564, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''		,	'TI_GDO_INTERES'	,  	5, true , 'COM' , ''),
																																		
(10570, 'NO CUMPLE CON LA EDAD'									, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),	--OK_OK
(10571, 'MOTIVOS ECONÓMICOS'									, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10572, 'PROBLEMAS DE CONDUCTA'									, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10573, 'MOTIVOS DE SALUD'										, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10574, 'MOTIVOS FAMILIARES'									, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10575, 'CAMBIÓ DE RESIDENCIA'									, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10576, 'PREFIERE OTRA MODALIDAD DE ESTUDIO'					, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10577, 'ELIGIÓ OTRA INSTITUCIÓN'								, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10578, 'PERDIÓ EL INTERÉS'										, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,   1, true , 'COM' , ''),
(10579, 'DESISTIÓ SIN EXPONER MOTIVOS'							, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,   1, true , 'COM' , ''),
(10580, 'NO REALIZÓ PAGO ALGUNO'								, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,   1, true , 'COM' , ''),
(10581, 'OTROS'													, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCALIFICA'	,  10, true , 'COM' , ''),
																												
(10590, 'PIDIÓ DEVOLUCIÓN DE DINERO'							, 	''						, ''	,	''	,	''		,	''		,	'TI_ANULADO'		,  	1, true , 'COM' , ''),
(10591, 'SE TRASLADÓ ANTES DE INICIAR CLASES'					, 	''						, ''	,	''	,	''		,	''		,	'TI_ANULADO'		,  	2, true , 'COM' , ''),
(10592, 'MATRÍCULA DE PRUEBA'									, 	''						, ''	,	''	,	''		,	''		,	'TI_ANULADO'		,  	3, true , 'COM' , ''),
																																																
(10600, 'VANDALISMO Y/O VIOLENCIA '								, 	''						, ''	,	''	,	''		,	''		,	'TI_RETIRADO'		,  	7, true , 'COM' , ''),
(10601, 'DROGAS'												, 	''						, ''	,	''	,	''		,	''		,	'TI_RETIRADO'		,  	7, true , 'COM' , ''),
(10602, 'ALCOHOL'												, 	''						, ''	,	''	,	''		,	''		,	'TI_RETIRADO'		,  	7, true , 'COM' , ''),
(10603, 'PROBLEMAS DE CONDUCTA'									, 	''						, ''	,	''	,	''		,	''		,	'TI_RETIRADO'		,  	7, true , 'COM' , ''),
(10604, 'PROBLEMAS DE CONDUCTA'									, 	''						, ''	,	''	,	''		,	''		,	'TI_RETIRADO'		,  	7, true , 'COM' , ''),
																																									
(10610, 'MOTIVOS ECONÓMICOS'									, 	''						, ''	,	''	,	''		,	''		,	'TI_TRASLADO'		,  	7, true , 'COM' , ''),
(10611, 'MOTIVOS DE SALUD'										, 	''						, ''	,	''	,	''		,	''		,	'TI_TRASLADO'		,  	7, true , 'COM' , ''),
(10612, 'MOTIVOS FAMILIARES'									, 	''						, ''	,	''	,	''		,	''		,	'TI_TRASLADO'		,  	7, true , 'COM' , ''),
(10613, 'CAMBIO DE RESIDENCIA'									, 	''						, ''	,	''	,	''		,	''		,	'TI_TRASLADO'		,  	7, true , 'COM' , ''),
																																												
(10620, 'PRODUCCIÓN'											, 	'PRD'					, ''	,	''	,	''		,	''		,	'TI_UND_PROD'		,  	1, true , 'COM' , ''),
(10621, 'SERVICIO'												, 	'SER'					, ''	,	''	,	''		,	''		,	'TI_UND_PROD'		,  	2, true , 'COM' , ''),
(10622, 'COMERCIO'												, 	'COM'					, ''	,	''	,	''		,	''		,	'TI_UND_PROD'		,  	3, true , 'COM' , ''),
(10623, 'PROYECTO'												, 	'PRY'					, ''	,	''	,	''		,	''		,	'TI_UND_PROD'		,  	3, true , 'COM' , ''),
(10624, 'COMERCIO Y SERVICIO'									, 	'CSE'					, ''	,	''	,	''		,	''		,	'TI_UND_PROD'		,  	3, true , 'COM' , ''),
(10625, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''		,	'TI_UND_PROD'		,  	4, true , 'COM' , ''),
																																													
(10630, 'RADIO'													, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10631, 'TELEVISIÓN'											, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10632, 'PERIÓDICO'												, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10633, 'VOLANTES'												, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10634, 'BANNER PUBLICITARIO'									, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10635, 'CINE'													, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10636, 'CORREO'												, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10637, 'GOOGLE'												, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10638, 'YOUTUBE'												, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10639, 'FACEBOOK'												, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10640, 'INSTAGRAM'												, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10641, 'WHATSAPP'												, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10642, 'TELEGRAM'												, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10643, 'TIKTOK'												, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10644, 'VISITA AL COLEGIO'										, 	'' 						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10645, 'RECOMENDACIÓN'											, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10646, 'YA ES CLIENTE'											, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10647, 'OTROS'													, 	''						, ''	,	''	,	''		,	''		,	'TI_PUBLICIDAD'		,  	2, true , 'COM' , ''),
						
(10660, 'NUEVO'													, 	''						, ''	,	''	,	''		,	''		,	'TI_INGRESO'		,  	1, true , 'COM' , ''),
(10661, 'RATIFICADO'											, 	''						, ''	,	''	,	''		,	''		,	'TI_INGRESO'		,  	2, true , 'COM' , ''),
(10662, 'REINGRESANTE'											, 	''						, ''	,	''	,	''		,	''		,	'TI_INGRESO'		,  	3, true , 'COM' , ''),
(10663, 'ANTIGUO' 												, 	''						, ''	,	''	,	''		,	''		,	'TI_INGRESO'		,  	4, true , 'COM' , ''),
(10664, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''		,	'TI_INGRESO'		,  	5, true , 'COM' , ''),
																																					
(10670, 'INGRESANTE'											, 	''						, ''	,	''	,	''		,	''		,	'TI_EVAL_ING'		,  	1, true , 'COM' , ''), --ingreso en base a TI_EVALFIN
(10671, 'PROMOVIDO'												, 	''						, ''	,	''	,	''		,	''		,	'TI_EVAL_ING'		,  	2, true , 'COM' , ''),
(10672, 'REPITENTE'												, 	''						, ''	,	''	,	''		,	''		,	'TI_EVAL_ING'		,  	3, true , 'COM' , ''),
(10673, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''		,	'TI_EVAL_ING'		,  	4, true , 'COM' , ''),
																																		
(10680, 'SIN DESCUENTOS'										, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCUENTOS'		,  	1, true , 'COM' , ''),
(10681, 'BECA'													, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCUENTOS'		,  	2, true , 'COM' , ''),
(10682, 'BENEFICIOS DIVERSOS'									, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCUENTOS'		,  	3, true , 'COM' , ''),
(10683, 'BONIFICACIONES / REGALOS'								, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCUENTOS'		,  	4, true , 'COM' , ''),
(10684, 'CONVENIOS'												, 	''						, ''	,	''	,	''		,	''		,	'TI_DESCUENTOS'		,  	5, true , 'COM' , ''),
																																		
(10690, 'SIN EVALUAR'											, 	''						, ''	,	''	,	''		,	''		,	'TI_EVAL_FIN'		,  	1, true , 'COM' , ''),
(10691, 'APROBADO'												, 	''						, ''	,	''	,	''		,	''		,	'TI_EVAL_FIN'		,  	2, true , 'COM' , ''),
(10692, 'DESAPROBADO'											, 	''						, ''	,	''	,	''		,	''		,	'TI_EVAL_FIN'		,  	3, true , 'COM' , ''),
(10693, 'REQUIERE RECUPERACION'									, 	''						, ''	,	''	,	''		,	''		,	'TI_EVAL_FIN'		,  	4, true , 'COM' , ''),
(10694, 'INTERRUMPIDO'											, 	''						, ''	,	''	,	''		,	''		,	'TI_EVAL_FIN'		,  	4, true , 'COM' , ''),
(10695, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''		,	'TI_EVAL_FIN'		,  	4, true , 'COM' , ''),
																																		
(10700, 'PRESENCIAL'											, 	''						, ''	,	''	,	''		,	''		,	'TI_MOD_ESTUDIO'	,  	1, true , 'COM' , ''),
(10701, 'SEMIPRESENCIAL'										, 	''						, ''	,	''	,	''		,	''		,	'TI_MOD_ESTUDIO'	,  	2, true , 'COM' , ''),
(10702, 'VIRTUAL'												, 	''						, ''	,	''	,	''		,	''		,	'TI_MOD_ESTUDIO'	,  	3, true , 'COM' , ''),
(10703, 'POR DEFINIR'											, 	''						, ''	,	''	,	''		,	''		,	'TI_MOD_ESTUDIO'	,  	4, true , 'COM' , ''),
																																		
(10710, 'EDUCACIÓN REGULAR'										, 	''						, ''	,	''	,	''		,	''		,	'TI_INSCR_COL'		,  	1, true , 'COM' , ''),
(10711, 'VACACIONES ÚTILES'										, 	''						, ''	,	''	,	''		,	''		,	'TI_INSCR_COL'		,  	2, true , 'COM' , ''),
(10712, 'EXAMEN DE CLASIFICACIÓN'								, 	''						, ''	,	''	,	''		,	''		,	'TI_INSCR_COL'		,  	3, true , 'COM' , ''),
(10713, 'OTROS'													, 	''						, ''	,	''	,	''		,	''		,	'TI_INSCR_COL'		,  	4, true , 'COM' , ''),
																																		
(10720, 'CICLO REGULAR'											, 	''						, ''	,	''	,	''		,	''		,	'TI_INSCR_ACA'		,  	2, true , 'COM' , ''),
(10721, 'CICLO REPASO'											, 	''						, ''	,	''	,	''		,	''		,	'TI_INSCR_ACA'		,  	3, true , 'COM' , ''),
(10722, 'EXAMEN DE BECAS'										, 	''						, ''	,	''	,	''		,	''		,	'TI_INSCR_ACA'		,  	1, true , 'COM' , ''),
(10723, 'OTROS'													, 	''						, ''	,	''	,	''		,	''		,	'TI_INSCR_ACA'		,  	4, true , 'COM' , ''),
						
(10730, 'BOBINAS'												, 	'4A'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10731, 'BALDE'													, 	'BJ'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10732, 'BARRILES'												, 	'BLL'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10733, 'BOLSA'													, 	'BG'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10734, 'BOTELLAS'												, 	'BO'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10735, 'CAJA'													, 	'BX'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10736, 'CARTONES'												, 	'CT'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10737, 'CENTIMETRO CUADRADO'									, 	'CMK'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10738, 'CENTIMETRO CUBICO'										, 	'CMQ'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10739, 'CENTIMETRO LINEAL'										, 	'CMT'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10740, 'CIENTO DE UNIDADES'									, 	'CEN'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10741, 'CILINDRO'												, 	'CY'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10742, 'CONOS'													, 	'CJ'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10743, 'DOCENA'												, 	'DZN'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10744, 'DOCENA POR 10**6'										, 	'DZP'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10745, 'FARDO'													, 	'BE'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10746, 'GALON INGLES(4,545956L)'								, 	'GLI'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10747, 'GRAMO'													, 	'GRM'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10748, 'GRUESA'												,	'GRO'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10749, 'HECTOLITRO'											, 	'HLT'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10750, 'HOJA'													, 	'LEF'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10751, 'JUEGO'													, 	'SET'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10752, 'KILOGRAMO'												, 	'KGM'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10753, 'KILOMETRO'												, 	'KTM'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10754, 'KILOVATIO HORA'										, 	'KWH'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10755, 'KIT'													, 	'KT'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10756, 'LATAS'													, 	'CA'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10757, 'LIBRAS'												, 	'LBR'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10758, 'LITRO'													, 	'LTR'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10759, 'MEGAWATT HORA'											, 	'MWH'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10760, 'METRO'													, 	'MTR'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10761, 'METRO CUADRADO'										, 	'MTK'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10762, 'METRO CUBICO'											, 	'MTQ'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10763, 'MILIGRAMOS'											, 	'MGM'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10764, 'MILILITRO'												, 	'MLT'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10765, 'MILIMETRO'												, 	'MMT'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10766, 'MILIMETRO CUADRADO'									, 	'MMK'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10767, 'MILIMETRO CUBICO'										, 	'MMQ'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10768, 'MILLARES'												, 	'MLL'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10769, 'MILLON DE UNIDADES'									, 	'UM'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10770, 'ONZAS'													, 	'ONZ'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10771, 'PALETAS'												, 	'PF'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10772, 'PAQUETE'												, 	'PK'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10773, 'PAR'													, 	'PR'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10774, 'PIES'													, 	'FOT'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10775, 'PIES CUADRADOS'										, 	'FTK'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10776, 'PIES CUBICOS'											, 	'FTQ'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10777, 'PIEZAS'												, 	'C62'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10778, 'PLACAS'												, 	'PG'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10779, 'PLIEGO'												, 	'ST'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10780, 'PULGADAS'												, 	'INH'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10781, 'RESMA'													, 	'RM'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10782, 'TAMBOR'												, 	'DR'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10783, 'TONELADA CORTA'										, 	'STN'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10784, 'TONELADA LARGA'										, 	'LTN'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10785, 'TONELADAS'												, 	'TNE'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10786, 'TUBOS'													, 	'TU'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10787, 'UNIDAD (BIENES)'										, 	'NIU'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	1, true , 'COM' , ''),
(10788, 'UNIDAD (SERVICIOS)'									, 	'ZZ'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	2, true , 'COM' , ''),
(10789, 'US GALON(3,7843L)'										, 	'GLL'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10790, 'YARDA'													, 	'YRD'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10791, 'YARDA CUADRADA'										, 	'YDK'					, ''	,	''	,	''		,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
																																		
(10810, 'SOL'													, 	'PEN'					, 'S/'	,	''	,	''		,	''		,	'TI_MONEDAS'		,  	1, true , 'COM' , ''),
(10811, 'DOLAR AMERICANO'										, 	'USD'					, '$'	,	''	,	''		,	''		,	'TI_MONEDAS'		,  	2, true , 'COM' , ''),
(10812, 'EURO'													, 	'EUR'					, '€'	,	''	,	''		,	''		,	'TI_MONEDAS'		,  	3, true , 'COM' , ''),
(10813, '<A ESCOGER>'											, 	''						, ''	,	''	,	''		,	''		,	'TI_MONEDAS'		,  	9, true , 'COM' , ''),
																																		
(90001, 'GRUPO YUPANA STUDIO'									, 	'YUPSTU'				, ''	,	''	,	''		,	''		,	'TI_GRP_EMPRESA'	, 	0, true , 'GEN' , ''), --ESTOS SE QUITARIA E IRIA SU SIGLA NOMAS
(90002, 'GRUPO SJB HUANCAYO'									, 	'SJBHYO'				, ''	,	''	,	''		,	''		,	'TI_GRP_EMPRESA'	, 	0, true , 'GEN' , ''),
(90003, 'GRUPO MIGUEL SALAZAR'									, 	'MIGSAL'				, ''	,	''	,	''		,	''		,	'TI_GRP_EMPRESA'	, 	0, true , 'GEN' , ''); 
*/

----------------------------------------------------------------------------------------------------------------------------------------
--adm.empresa---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.empresa; 
CREATE TABLE adm.empresa (
	id_empresa			serial			NOT NULL PRIMARY KEY,
	grupo_emp			varchar(25)		NOT NULL,
	nom_empresa	 		varchar(100)	NOT NULL,
	nom_comercial		varchar(100)	NOT NULL,
	direccion			varchar(100)	NOT NULL,
	telefonos			varchar(100)	NOT NULL,
	ruc					varchar(11)		NOT NULL,
	sunat_usu			varchar(50)		NOT NULL,
	sunat_pwd			varchar(50)		NOT NULL,
	premium				bool			NOT NULL,
	activo				bool			NOT NULL,
	solo_lectura		bool			NOT NULL,
	id_tipo_empresa		int				NOT NULL,
	dominio				varchar(50)		NOT NULL,
	dominio_mail		varchar(50)		NOT NULL,		
	CONSTRAINT empresa_id_tipo_empresa_fkey FOREIGN KEY (id_tipo_empresa) REFERENCES adm.tipo(id_tipo) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION	
);
--
ALTER SEQUENCE adm.empresa_id_empresa_seq RESTART WITH 1010;
--
COMMENT ON TABLE adm.empresa IS 'Empresas que utilizan este sistema.'; 
COMMENT ON COLUMN adm.empresa.id_empresa IS 'Identificador de empresa.';
COMMENT ON COLUMN adm.empresa.grupo_emp IS 'Grupo empresarial.';
COMMENT ON COLUMN adm.empresa.nom_empresa IS 'Nombre oficial según SUNAT.';
COMMENT ON COLUMN adm.empresa.nom_comercial IS 'Nombre comercial o alias.';
COMMENT ON COLUMN adm.empresa.direccion IS 'Dirección fiscal.';
COMMENT ON COLUMN adm.empresa.telefonos IS 'Teléfonos.';
COMMENT ON COLUMN adm.empresa.ruc IS 'Número de RUC.';
COMMENT ON COLUMN adm.empresa.sunat_usu IS 'Usuario SOL para los comprobantes electrónicos.';
COMMENT ON COLUMN adm.empresa.sunat_pwd IS 'Contraseña SOL para los comprobantes electrónicos.';
COMMENT ON COLUMN adm.empresa.premium IS 'Indica si la empresa contará con opciones premium.';
COMMENT ON COLUMN adm.empresa.activo IS 'Indica si la empresa está activo o vigente.';
COMMENT ON COLUMN adm.empresa.solo_lectura IS 'Indica sí sólo podrá visualizar y no guardar cambios. Ej. Hasta 1 meses despues de baja.';
COMMENT ON COLUMN adm.empresa.id_tipo_empresa IS 'Identificador del rubro de negocio de la empresa [TI_EMPRESA].';
COMMENT ON COLUMN adm.empresa.dominio IS 'Dominio de internet.';
COMMENT ON COLUMN adm.empresa.dominio_mail IS 'Dominio del correo que utilizan.';
--
INSERT INTO adm.empresa (id_empresa, grupo_emp, nom_empresa, nom_comercial, direccion, telefonos, ruc, sunat_usu, sunat_pwd, premium, activo, solo_lectura, id_tipo_empresa, dominio, dominio_mail)
VALUES 
(1001,  'YUPANA'	, 'YUPANA STUDIO E.I.R.L.'							, 'POLARISS' 								, 'JR. SANTA ISABEL NRO. 2065 - URB. MIRAFLORES, EL TAMBO, HUANCAYO', ''												, '20603133111', '', '' , true , true , false, 95000, ''					, ''					),
(1002,  'SALOAYZA' 	, 'YHA GIBU TAMMY GERALDINI'						, 'BAZAR LIBRERÍA GERALDINE'   				, 'JR. CUZCO NRO. 793 - HUANCAYO'									, '' 												, '10078230849', '', '' , true , true , false, 95000, ''					, ''					),
(1003,  'SALOAYZA'	, 'SALAZAR LOAYZA MIGUEL ANGEL'						, 'MI MUNDO DE LOS LIBROS'     				, 'JR. FRANCISCO SOLANO NRO. 142 - URB. SAN CARLOS, HUANCAYO'		, ''												, '10078268129', '', '' , true , true , false, 95000, ''					, ''					),
(1004,  'SJBCORP'	, 'CORPORACION EDUCATIVA SAN JUAN BOSCO S.A.C.'		, 'COLEGIO PARTICULAR SAN JUAN BOSCO'		, 'JR. CUZCO NRO. 779 - HUANCAYO'									, 'Tel. +51 064 233 789 | WhatsApp +51 971 036 002'	, '20133746278', '', '' , true , true , false, 95001, 'sanjuanbosco.edu.pe' , '@sanjuanbosco.edu.pe'),
(1005,  'SJBCORP'	, 'CORPORACION EDUCATIVA SAN JUAN BOSCO S.A.C.'		, 'ACADEMIA PREUNIVERSITARIA SAN FERNANDO' 	, 'JR. CUZCO NRO. 779 - HUANCAYO'									, 'WhatsApp +51 971 036 002'						, '20133746278', '', '' , true , true , false, 95002, 'sanfernando.edu.pe'	, '@sanjuanbosco.edu.pe'),
(1006,  'SJBCORP'	, 'CORPORACION EDUCATIVA SAN JUAN BOSCO S.A.C.'		, 'POLIDEPORTIVO SAN JUAN BOSCO' 			, 'JR. CUZCO NRO. 779 - HUANCAYO'									, 'WhatsApp +51 971 036 002' 						, '20133746278', '', '' , true , true , false, 95000, ''					, '@sanjuanbosco.edu.pe'),
(1007,  'CAAS'		, 'CASS - CAFÉ PASTELERIA S.A.C.'					, 'CASS - CAFÉ PASTELERIA' 					, 'JR. AMAZONITAS NRO. 221 - COOP. 1RO DE MAYO, EL TAMBO, HUANCAYO'	, 'WhatsApp +51 940 372 081'						, '20611899964', '', '' , true , true , false, 95000, ''					, ''					),
(1008,  'SABAL'		, 'GRUPO SABAL S.A.C.'								, 'CENTRO MÉDICO CASA DEL NIÑO Y LA MADRE' 	, 'JR. MOQUEGUA NRO. 235 - HUANCAYO'								, ''												, '20605817123', '', '' , false, true , true , 95003, ''					, ''					),
(1009,  'LOSANDES'	, 'CAJA RURAL DE AHORRO Y CREDITO LOS ANDES S.A.' 	, 'CAJA LOS ANDES' 							, 'JR. JUNIN NRO. 129 - PUNO'										, ''												, '20322445564', '', '' , true , true , true , 95004, ''					, ''					);






----------------------------------------------------------------------------------------------------------------------------------------
--adm.var_global------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.var_global;
CREATE TABLE adm.var_global (
	id_var_gb		serial			NOT NULL PRIMARY KEY,
	id_empresa		int				NOT NULL,	
	id_sistema		char(3)			NOT NULL,
	nom_var_gb		varchar(25)		NOT NULL,
	valor			varchar(100)	NOT NULL,
	descripcion		varchar(100)	NOT NULL,		
	CONSTRAINT var_global_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES adm.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION	
);
--
COMMENT ON TABLE adm.var_global IS 'Variables globales. Se repite por cada empresa.'; 
COMMENT ON COLUMN adm.var_global.id_var_gb IS 'Identificador de la variable global.';
COMMENT ON COLUMN adm.var_global.id_empresa IS 'Identificador de empresa [adm.empresa].';
COMMENT ON COLUMN adm.var_global.id_sistema IS 'Identificador del sistema [adm.sistema].';
COMMENT ON COLUMN adm.var_global.nom_var_gb IS 'Nombre de la variable global. No modificar!';
COMMENT ON COLUMN adm.var_global.valor IS 'Valor en formato de texto. En la aplicación se tendrá que convertir adecuadamente.';
COMMENT ON COLUMN adm.var_global.descripcion IS 'Descripción de la variable global.';
--
INSERT INTO adm.var_global (id_empresa, id_sistema, nom_var_gb, valor, descripcion) 
VALUES 

(1001	, 'ADM',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para búsqueda'											),
(1002	, 'ADM',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para búsqueda'											),
(1003	, 'ADM',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para búsqueda'											),
(1004	, 'ADM',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para búsqueda'											),
(1005	, 'ADM',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para búsqueda'											),
(1006	, 'ADM',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para búsqueda'											),
(1007	, 'ADM',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para búsqueda'											),
(1008	, 'ADM',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para búsqueda'											),
(1009	, 'ADM',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para búsqueda'											),
					
(1001	, 'ADM',  'MinCarInput'			, '5'													, 'Mínimo de caracteres para ingresar texto'									),
(1002	, 'ADM',  'MinCarInput'			, '5'													, 'Mínimo de caracteres para ingresar texto'									),
(1003	, 'ADM',  'MinCarInput'			, '5'													, 'Mínimo de caracteres para ingresar texto'									),
(1004	, 'ADM',  'MinCarInput'			, '5'													, 'Mínimo de caracteres para ingresar texto'									),
(1005	, 'ADM',  'MinCarInput'			, '5'													, 'Mínimo de caracteres para ingresar texto'									),
(1006	, 'ADM',  'MinCarInput'			, '5'													, 'Mínimo de caracteres para ingresar texto'									),
(1007	, 'ADM',  'MinCarInput'			, '5'													, 'Mínimo de caracteres para ingresar texto'									),
(1008	, 'ADM',  'MinCarInput'			, '5'													, 'Mínimo de caracteres para ingresar texto'									),
(1009	, 'ADM',  'MinCarInput'			, '5'													, 'Mínimo de caracteres para ingresar texto'									)																												,
					
(1001	, 'ADM',  'MinCarNoms'			, '4'													, 'Mínimo de caracteres para ingresar nombres'									),
(1002	, 'ADM',  'MinCarNoms'			, '4'													, 'Mínimo de caracteres para ingresar nombres'									),
(1003	, 'ADM',  'MinCarNoms'			, '4'													, 'Mínimo de caracteres para ingresar nombres'									),
(1004	, 'ADM',  'MinCarNoms'			, '4'													, 'Mínimo de caracteres para ingresar nombres'									),
(1005	, 'ADM',  'MinCarNoms'			, '4'													, 'Mínimo de caracteres para ingresar nombres'									),
(1006	, 'ADM',  'MinCarNoms'			, '4'													, 'Mínimo de caracteres para ingresar nombres'									),
(1007	, 'ADM',  'MinCarNoms'			, '4'													, 'Mínimo de caracteres para ingresar nombres'									),
(1008	, 'ADM',  'MinCarNoms'			, '4'													, 'Mínimo de caracteres para ingresar nombres'									),
(1009	, 'ADM',  'MinCarNoms'			, '4'													, 'Mínimo de caracteres para ingresar nombres'									),
									
(1001	, 'ADM',  'MinCarApes'			, '4'													, 'Mínimo de caracteres para ingresar apellidos'								),
(1002	, 'ADM',  'MinCarApes'			, '4'													, 'Mínimo de caracteres para ingresar apellidos'								),
(1003	, 'ADM',  'MinCarApes'			, '4'													, 'Mínimo de caracteres para ingresar apellidos'								),
(1004	, 'ADM',  'MinCarApes'			, '4'													, 'Mínimo de caracteres para ingresar apellidos'								),
(1005	, 'ADM',  'MinCarApes'			, '4'													, 'Mínimo de caracteres para ingresar apellidos'								),
(1006	, 'ADM',  'MinCarApes'			, '4'													, 'Mínimo de caracteres para ingresar apellidos'								),
(1007	, 'ADM',  'MinCarApes'			, '4'													, 'Mínimo de caracteres para ingresar apellidos'								),
(1008	, 'ADM',  'MinCarApes'			, '4'													, 'Mínimo de caracteres para ingresar apellidos'								),
(1009	, 'ADM',  'MinCarApes'			, '4'													, 'Mínimo de caracteres para ingresar apellidos'								),
					
(1001	, 'ADM',  'NomsCorrido'			, 'true'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1002	, 'ADM',  'NomsCorrido'			, 'true'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1003	, 'ADM',  'NomsCorrido'			, 'true'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1004	, 'ADM',  'NomsCorrido'			, 'false'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1005	, 'ADM',  'NomsCorrido'			, 'false'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1006	, 'ADM',  'NomsCorrido'			, 'true'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1007	, 'ADM',  'NomsCorrido'			, 'true'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1008	, 'ADM',  'NomsCorrido'			, 'false'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1009	, 'ADM',  'NomsCorrido'			, 'false'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
					
(1001	, 'ADM',  'DirsCorrido'			, 'true'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1002	, 'ADM',  'DirsCorrido'			, 'true'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1003	, 'ADM',  'DirsCorrido'			, 'true'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1004	, 'ADM',  'DirsCorrido'			, 'false'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1005	, 'ADM',  'DirsCorrido'			, 'false'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1006	, 'ADM',  'DirsCorrido'			, 'true'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1007	, 'ADM',  'DirsCorrido'			, 'true'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1008	, 'ADM',  'DirsCorrido'			, 'true'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1009	, 'ADM',  'DirsCorrido'			, 'false'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
					
(1001	, 'ADM',  'FindPersona'			, 'NDOC'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1002	, 'ADM',  'FindPersona'			, 'NDOC'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1003	, 'ADM',  'FindPersona'			, 'NDOC'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1004	, 'ADM',  'FindPersona'			, 'NOMS'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1005	, 'ADM',  'FindPersona'			, 'NOMS'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1006	, 'ADM',  'FindPersona'			, 'NOMS'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1007	, 'ADM',  'FindPersona'			, 'NDOC'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1008	, 'ADM',  'FindPersona'			, 'NDOC'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1009	, 'ADM',  'FindPersona'			, 'NDOC'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
					
(1001	, 'ADM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1002	, 'ADM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1003	, 'ADM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1004	, 'ADM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1005	, 'ADM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1006	, 'ADM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1007	, 'ADM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1008	, 'ADM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1009	, 'ADM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
		
(1001	, 'ADM',  'UrlFotoTrab'			, 'https://polariss.net.pe/sjbcorp/'					, 'Ruta para la foto del trabajador'	    									),
(1002	, 'ADM',  'UrlFotoTrab'			, 'https://polariss.net.pe/sjbcorp/'					, 'Ruta para la foto del trabajador'											),
(1003	, 'ADM',  'UrlFotoTrab'			, 'https://polariss.net.pe/sjbcorp/'					, 'Ruta para la foto del trabajador'											),
(1004	, 'ADM',  'UrlFotoTrab'			, 'https://polariss.net.pe/sjbcorp/'					, 'Ruta para la foto del trabajador'											),
(1005	, 'ADM',  'UrlFotoTrab'			, 'https://polariss.net.pe/sjbcorp/'					, 'Ruta para la foto del trabajador'											),
(1006	, 'ADM',  'UrlFotoTrab'			, 'https://polariss.net.pe/sjbcorp/'					, 'Ruta para la foto del trabajador'											),
(1007	, 'ADM',  'UrlFotoTrab'			, 'https://polariss.net.pe/sjbcorp/'					, 'Ruta para la foto del trabajador'											),
(1008	, 'ADM',  'UrlFotoTrab'			, 'https://polariss.net.pe/sjbcorp/'					, 'Ruta para la foto del trabajador'											),
(1009	, 'ADM',  'UrlFotoTrab'			, 'https://polariss.net.pe/sjbcorp/'					, 'Ruta para la foto del trabajador'											),
		
(1001	, 'ADM',  'ReqUsuIsTrab'		, 'true'												, 'Requiere que usuario este registrado previamente como trabajador'			),
(1002	, 'ADM',  'ReqUsuIsTrab'		, 'true'												, 'Requerir que usuario este registrado previamente como trabajador'			),
(1003	, 'ADM',  'ReqUsuIsTrab'		, 'true'												, 'Requerir que usuario este registrado previamente como trabajador'			),
(1004	, 'ADM',  'ReqUsuIsTrab'		, 'true'												, 'Requerir que usuario este registrado previamente como trabajador'			),
(1005	, 'ADM',  'ReqUsuIsTrab'		, 'true'												, 'Requerir que usuario este registrado previamente como trabajador'			),
(1006	, 'ADM',  'ReqUsuIsTrab'		, 'true'												, 'Requerir que usuario este registrado previamente como trabajador'			),
(1007	, 'ADM',  'ReqUsuIsTrab'		, 'true'												, 'Requerir que usuario este registrado previamente como trabajador'			),
(1008	, 'ADM',  'ReqUsuIsTrab'		, 'true'												, 'Requerir que usuario este registrado previamente como trabajador'			),
(1009	, 'ADM',  'ReqUsuIsTrab'		, 'true'												, 'Requerir que usuario este registrado previamente como trabajador'			),

(1001	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requiere que usuario este registrado previamente como familiar (colegio)'	),
(1002	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1003	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1004	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1005	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1006	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1007	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1008	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1009	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
																																												
(1001	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requiere que usuario este registrado previamente como estudiante (academia)'	),
(1002	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1003	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1004	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1005	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1006	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1007	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1008	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1009	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),




(1001	, 'COM',  'MultiCampania'		, 'false'												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1002	, 'COM',  'MultiCampania'		, 'true '												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1003	, 'COM',  'MultiCampania'		, 'true '												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1004	, 'COM',  'MultiCampania'		, 'true '												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1005	, 'COM',  'MultiCampania'		, 'true '												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1006	, 'COM',  'MultiCampania'		, 'false'												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1007	, 'COM',  'MultiCampania'		, 'false'												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1008	, 'COM',  'MultiCampania'		, 'true '												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1009	, 'COM',  'MultiCampania'		, 'false'												, 'Sí se manejará múltiples campañas. Historial de precios .'					);
 


/*	

(1001	, 'COM',  'ReqFamiliar'			, 'false'									, 'SI/NO => Se requiere un familiar.'					),
(1002	, 'COM',  'ReqFamiliar'			, 'false'									, 'SI/NO => Se requiere un familiar.'					),
(1003	, 'COM',  'ReqFamiliar'			, 'false'									, 'SI/NO => Se requiere un familiar.'					),
(1004	, 'COM',  'ReqFamiliar'			, 'false'									, 'SI/NO => Se requiere un  familiar.'					),
(1005	, 'COM',  'ReqFamiliar'			, 'true'									, 'SI/NO => Se requiere un  familiar.'					),
(1006	, 'COM',  'ReqFamiliar'			, 'true'									, 'SI/NO => Se requiere un  familiar.'					),
(1007	, 'COM',  'ReqFamiliar'			, 'false'									, 'SI/NO => Se requiere un  familiar.'					),

(1001	, 'GEN',  'ReqLgNacEst'			, 'false'									, 'Requiere lugar y fecha de nacimiento del estudiante. [true|false]'	),
(1002	, 'GEN',  'ReqLgNacEst'			, 'false'									, 'Requiere lugar y fecha de nacimiento del estudiante. [true|false]'	),
(1003	, 'GEN',  'ReqLgNacEst'			, 'false'									, 'Requiere lugar y fecha de nacimiento del estudiante. [true|false]'	),
(1004	, 'GEN',  'ReqLgNacEst'			, 'true'									, 'Requiere lugar y fecha de nacimiento del estudiante. [true|false]'	),
(1005	, 'GEN',  'ReqLgNacEst'			, 'false'									, 'Requiere lugar y fecha de nacimiento del estudiante. [true|false]'	),
(1006	, 'GEN',  'ReqLgNacEst'			, 'true'									, 'Requiere lugar y fecha de nacimiento del estudiante. [true|false]'	),
(1007	, 'GEN',  'ReqLgNacEst'			, 'true'									, 'Requiere lugar y fecha de nacimiento del estudiante. [true|false]'	),

(1001	, 'GEN',  'ReqDirEst'			, 'false'									, 'Requiere dirección del estudiante|true|false'	),
(1002	, 'GEN',  'ReqDirEst'			, 'false'									, 'Requiere dirección del estudiante|true|false'	),
(1003	, 'GEN',  'ReqDirEst'			, 'false'									, 'Requiere dirección del estudiante|true|false'	),
(1004	, 'GEN',  'ReqDirEst'			, 'true'									, 'Requiere dirección del estudiante|true|false'	),
(1005	, 'GEN',  'ReqDirEst'			, 'false'									, 'Requiere dirección del estudiante|true|false'	),
(1006	, 'GEN',  'ReqDirEst'			, 'true'									, 'Requiere dirección del estudiante|true|false'	),
(1007	, 'GEN',  'ReqDirEst'			, 'true'									, 'Requiere dirección del estudiante|true|false'	),

(1001	, 'GEN',  'ReqInfContEst'		, 'false'									, 'Requiere información de contacto del estudiante|true|false'	),
(1002	, 'GEN',  'ReqInfContEst'		, 'false'									, 'Requiere información de contacto del estudiante|true|false'	),
(1003	, 'GEN',  'ReqInfContEst'		, 'false'									, 'Requiere información de contacto del estudiante|true|false'	),
(1004	, 'GEN',  'ReqInfContEst'		, 'true'									, 'Requiere información de contacto del estudiante|true|false'	),
(1005	, 'GEN',  'ReqInfContEst'		, 'false'									, 'Requiere información de contacto del estudiante|true|false'	),
(1006	, 'GEN',  'ReqInfContEst'		, 'true'									, 'Requiere información de contacto del estudiante|true|false'	),
(1007	, 'GEN',  'ReqInfContEst'		, 'true'									, 'Requiere información de contacto del estudiante|true|false'	),

(1001	, 'GEN',  'ReqInfContFam'		, 'false'									, 'Requiere información de contacto del familiar|true|false'	),
(1002	, 'GEN',  'ReqInfContFam'		, 'false'									, 'Requiere información de contacto del familiar|true|false'	),
(1003	, 'GEN',  'ReqInfContFam'		, 'false'									, 'Requiere información de contacto del familiar|true|false'	),
(1004	, 'GEN',  'ReqInfContFam'		, 'false'									, 'Requiere información de contacto del familiar|true|false'	),
(1005	, 'GEN',  'ReqInfContFam'		, 'true'									, 'Requiere información de contacto del familiar|true|false'	),
(1006	, 'GEN',  'ReqInfContFam'		, 'true'									, 'Requiere información de contacto del familiar|true|false'	),
(1007	, 'GEN',  'ReqInfContFam'		, 'false'									, 'Requiere información de contacto del familiar|true|false'	),






(1001	, 'GEN',  'ReqInfContPerJur'	, 'true'									, 'Requiere información de contacto de los clientes' ),
(1002	, 'GEN',  'ReqInfContPerJur'	, 'true'									, 'Obligatorio pedir al menos un dato de contacto'   ),
(1003	, 'GEN',  'ReqInfContPerJur'	, 'true'									, 'Obligatorio pedir al menos un dato de contacto'   ),
(1004	, 'GEN',  'ReqInfContPerJur'	, 'true'									, 'Obligatorio pedir al menos un dato de contacto'   ),
(1005	, 'GEN',  'ReqInfContPerJur'	, 'true'									, 'Obligatorio pedir al menos un dato de contacto'   ),


(1001	, 'GEN',  'ReqInfContPer'		, 'true'									, 'Obligatorio pedir al menos un dato de contacto'   ),
(1002	, 'GEN',  'ReqInfContPer'		, 'true'									, 'Obligatorio pedir al menos un dato de contacto'   ),
(1003	, 'GEN',  'ReqInfContPer'		, 'true'									, 'Obligatorio pedir al menos un dato de contacto'   ),
(1004	, 'GEN',  'ReqInfContPer'		, 'true'									, 'Obligatorio pedir al menos un dato de contacto'   ),
(1005	, 'GEN',  'ReqInfContPer'		, 'true'									, 'Obligatorio pedir al menos un dato de contacto'   ),






(1001	, 'GEN',  'SizeFichaOpt'		, '8'										, 'Tamaño código ficha óptica'						),
(1002	, 'GEN',  'SizeFichaOpt'		, '10'										, 'Tamaño código ficha óptica'						),
(1003	, 'GEN',  'SizeFichaOpt'		, '11'										, 'Tamaño código ficha óptica'						),
(1004	, 'GEN',  'SizeFichaOpt'		, '12'										, 'Tamaño código ficha óptica'						),
(1005	, 'GEN',  'SizeFichaOpt'		, '10'										, 'Tamaño código ficha óptica'						),


--ostrar direccion en ventas
--ostrar datos del trabajador en comercial

(1001	, 'GEN',  'EditObjectSi'		, '2'										, 'Edita si el objeto es usado menos de N veces'	),
(1002	, 'GEN',  'EditObjectSi'		, '2'										, 'Si el objetoX se usa >=N no puede editar'		),
(1003	, 'GEN',  'EditObjectSi'		, '2'										, 'Si el objetoX se usa >=N no puede editar'		),
(1004	, 'GEN',  'EditObjectSi'		, '2'										, 'Si el objetoX se usa >=N no puede editar'		),
(1005	, 'GEN',  'EditObjectSi'		, '2'										, 'Si el objetoX se usa >=N no puede editar'		),

(1001	, 'ACD',  'DirMapReqACD'		, 'SI'										, 'SI=Es exigible que ingrese coordenadas'			),
(1002	, 'ACD',  'DirMapReqACD'		, 'SI'										, 'SI=Es exigible que ingrese coordenadas'			),
(1003	, 'ACD',  'DirMapReqACD'		, 'SI'										, 'SI=Es exigible que ingrese coordenadas'			),
(1004	, 'ACD',  'DirMapReqACD'		, 'SI'										, 'SI=Es exigible que ingrese coordenadas'			),
(1005	, 'ACD',  'DirMapReqACD'		, 'SI'										, 'SI=Es exigible que ingrese coordenadas'			),

(1001	, 'LAB',  'DirMapReqLAB'		, 'SI'										, 'SI=Es exigible que ingrese coordenadas'			),
(1002	, 'LAB',  'DirMapReqLAB'		, 'SI'										, 'SI=Es exigible que ingrese coordenadas'			),
(1003	, 'LAB',  'DirMapReqLAB'		, 'SI'										, 'SI=Es exigible que ingrese coordenadas'			),
(1004	, 'LAB',  'DirMapReqLAB'		, 'SI'										, 'SI=Es exigible que ingrese coordenadas'			),
(1005	, 'LAB',  'DirMapReqLAB'		, 'SI'										, 'SI=Es exigible que ingrese coordenadas'			),



(1001	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1001/'		, 'Ruta para la foto del usuario de sistema'),
(1002	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1002/'		, 'Ruta para la foto del usuario de sistema'),
(1003	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1003/'		, 'Ruta para la foto del usuario de sistema'),
(1004	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1004/'		, 'Ruta para la foto del usuario de sistema'),
(1005	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1005/'		, 'Ruta para la foto del usuario de sistema'),
(1006	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1005/'		, 'Ruta para la foto del usuario de sistema'),
(1007	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1005/'		, 'Ruta para la foto del usuario de sistema'),

(1001	, 'GEN',  'UrlFotoEst'			, 'https://yupanastudio.com/fotos-estudiante/10001/'	, 'Ruta para la foto del estudiante'	    ),
(1002	, 'GEN',  'UrlFotoEst'			, 'https://yupanastudio.com/fotos-estudiante/10002/'	, 'Ruta para la foto del estudiante'	    ),
(1003	, 'GEN',  'UrlFotoEst'			, 'https://yupanastudio.com/fotos-estudiante/10003/'	, 'Ruta para la foto del estudiante'	    ),
(1004	, 'GEN',  'UrlFotoEst'			, 'https://yupanastudio.com/fotos-estudiante/10004/'	, 'Ruta para la foto del estudiante'	    ),
(1005	, 'GEN',  'UrlFotoEst'			, 'https://yupanastudio.com/fotos-estudiante/10005/'	, 'Ruta para la foto del estudiante'	    ),
(1006	, 'GEN',  'UrlFotoEst'			, 'https://yupanastudio.com/fotos-estudiante/10006/'	, 'Ruta para la foto del estudiante'	    ),

--10001	, 'GEN',  'UrlFotos'			, 'http://polariss.net.pe/fotos/1001/'		, 'Ruta para acceder a la foto de las personas'	    ),
--10002	, 'GEN',  'UrlFotos'			, 'http://polariss.net.pe/fotos/1002/'		, 'Ruta para acceder a la foto de las personas'		),
--10003	, 'GEN',  'UrlFotos'			, 'http://polariss.net.pe/fotos/1003/'		, 'Ruta para acceder a la foto de las personas'		),
--10004	, 'GEN',  'UrlFotos'			, 'http://polariss.net.pe/fotos/1004/'		, 'Ruta para acceder a la foto de las personas'		),
--10005	, 'GEN',  'UrlFotos'			, 'http://polariss.net.pe/fotos/1005/'		, 'Ruta para acceder a la foto de las personas'		),


(1001	, 'GEN',  'RegDireccion'		, 'SIM'										, 'Dirección de corrido=SIMPLE; compuesto=COM'		),
(1002	, 'GEN',  'RegDireccion'		, 'COM'										, 'Dirección de corrido=SIMPLE; compuesto=2'		),
(1003	, 'GEN',  'RegDireccion'		, 'COM'										, 'Dirección de corrido=SIMPLE; compuesto=2'		),
(1004	, 'GEN',  'RegDireccion'		, 'SIM'										, 'Dirección de corrido=SIMPLE; compuesto=2'		),
(1005	, 'GEN',  'RegDireccion'		, 'SIM'										, 'Dirección de corrido=SIMPLE; compuesto=2'		),

(1001	, 'GEN',  'RegDirCoord'		, 'SIM'										, 'Registro coordenadas en direccion, true o false'		),
(1002	, 'GEN',  'RegDirCoord'		, 'SIM'										, 'Registro coordenadas en direccion, true o false'		),
(1003	, 'GEN',  'RegDirCoord'		, 'SIM'										, 'Registro coordenadas en direccion, true o false'		),
(1004	, 'GEN',  'RegDirCoord'		, 'SIM'										, 'Registro coordenadas en direccion, true o false'		),
(1005	, 'GEN',  'RegDirCoord'		, 'SIM'										, 'Registro coordenadas en direccion, true o false'		),
	
(1001	, 'GEN',  'DistDefault'		, ' 1;101012'								, 'Distrito predeerminado'								),
(1002	, 'GEN',  'DistDefault'		, ' 2;110201'								, 'id_sede;id_distrito|'								),
(1003	, 'GEN',  'DistDefault'		, ' 3;110301'								, 'Minimo de caracteres para búsqueda'					),
(1004	, 'GEN',  'DistDefault'		, '-1;110401'								, 'Minimo de caracteres para búsqueda'					),
(1005	, 'GEN',  'DistDefault'		, '-1;110101'								, 'Distrito pred. para local. id_sede;id_distrito|'		),

(1001	, 'COM',  'IGV'				, '0.18'									, 'IGV'												),
(1002	, 'COM',  'IGV'				, '0.18'									, 'IGV'												),
(1003	, 'COM',  'IGV'				, '0.18'									, 'IGV'												),
(1004	, 'COM',  'IGV'				, '0.18'									, 'IGV'												),
(1005	, 'COM',  'IGV'				, '0.18'									, 'IGV'												),
(1006	, 'COM',  'IGV'				, '0.18'									, 'IGV'												),


(1001	, 'COM',  'TrabInVta'			, 'SI'									, 'SI/NO => Manipular datos trabajador en Ventas'	),
(1002	, 'COM',  'TrabInVta'			, 'NO'									, 'SI/NO => Manipular datos trabajador en Ventas'	),
(1003	, 'COM',  'TrabInVta'			, 'NO'									, 'SI/NO => Manipular datos trabajador en Ventas'	),
(1004	, 'COM',  'TrabInVta'			, 'NO'									, 'SI/NO => Manipular datos trabajador en Ventas'	),
(1005	, 'COM',  'TrabInVta'			, 'NO'									, 'SI/NO => Manipular datos trabajador en Ventas'	),
(1006	, 'COM',  'TrabInVta'			, 'NO'									, 'SI/NO => Manipular datos trabajador en Ventas'	),
(1007	, 'COM',  'TrabInVta'			, 'NO'									, 'SI/NO => Manipular datos trabajador en Ventas'	);

*/



--COM Dias extra para vencimiento VAR_GB_COMERCIAL

--GTH		'mailReadONly'		'true'		'Indica si desde el modulo de registro de personal se podra escrinir el correo, o el area de sistemas lo crera si es flaso'
--GTH		'activoTrabSimple'	'true'		'True=Se define manualmene. False=Se obtiene a partir de las fechas de su contrato'

--######LABORAL
--##  crear variable que indique si 


		    
/*	    
(1001	,   'GEN',  'DefIxFindPer'		, '2'										, '1 = Buscar por DOC_IDENT; 2 = Buscar por NOMBRES'),
(1002	,   'GEN',  'DefIxFindPer'		, '1'										, '1 = Buscar por DOC_IDENT; 2 = Buscar por NOMBRES'),
(1003	,   'GEN',  'DefIxFindPer'		, '1'										, '1 = Buscar por DOC_IDENT; 2 = Buscar por NOMBRES'),
(1004	,   'GEN',  'DefIxFindPer'		, '1'										, '1 = Buscar por DOC_IDENT; 2 = Buscar por NOMBRES'),
(1005	,   'GEN',  'DefIxFindPer'		, '1'										, '1 = Buscar por DOC_IDENT; 2 = Buscar por NOMBRES'),
	    	    	    
--COM       
(1001	,   'COM',  'IGV'				, '0.18'									, 'IGV'												),
(1002	,   'COM',  'IGV'				, '0.18'									, 'IGV'												),
(1003	,   'COM',  'IGV'				, '0.18'									, 'IGV'												),
(1004	,   'COM',  'IGV'				, '0.18'									, 'IGV'												),
(1005	,   'COM',  'IGV'				, '0.18'									, 'IGV'												),

(1001	,   'COM',  'MoraDia'			, '0.00'									, 'Mora por día'									),
(1002	,   'COM',  'MoraDia'			, '0.00'									, 'Mora por día'									),
(1003	,   'COM',  'MoraDia'			, '0.00'									, 'Mora por día'									),
(1004	,   'COM',  'MoraDia'			, '0.00'									, 'Mora por día'									),
(1005	,   'COM',  'MoraDia'			, '0.50'									, 'Mora por día'									),

(1001	,   'COM',  'MonedaUnica'		, 'true '									, 'Si operaciones son en una sola moneda'			),
(1002	,   'COM',  'MonedaUnica'		, 'true '									, 'Si operaciones son en una sola moneda'			),
(1003	,   'COM',  'MonedaUnica'		, 'true '									, 'Si operaciones son en una sola moneda'			),
(1004	,   'COM',  'MonedaUnica'		, 'true '									, 'Si operaciones son en una sola moneda'			),
(1005	,   'COM',  'MonedaUnica'		, 'false'									, 'Si operaciones son en una sola moneda'			),

(1001	,   'COM',  'FacElecFiles'		, '//192.168.123.15/data'					, 'Ruta para archivos de comprobante electrónico'	);

(1000	,   -1, 	'PER',  'rmRMV'				, '850.00'									, 'Remuneración mínima vital'),
(1000	,   -1, 	'PER',  'rmAsigFam'			, '85.00'									, 'Asignación familiar'),
(1000	,   -1, 	'PER',  'rmEsSalud'			, '0.09'									, 'Taza por EsSalud'),
(1000	,   -1, 	'PER',  'rmHhExt01'			, '0.25'									, 'Primer tramo por horas extras'),
(1000	,   -1, 	'PER',  'rmHhExt02'			, '0.45'									, 'Segundo tramo por horas extras'),
(1000	,   -1, 	'PER',  'rmHhExt03'			, '0.25'									, 'Primer tramo por horas extras'),
(1000	,   -1, 	'FIN',  'ffPlazoRend'		, '10'										, 'Plazo para rendir el fondo fijo'),
(1000	,  101, 	'FIN',  'ffTopeLiq'			, '4000.00'									, 'Tope para liquidar un fondo fijo'),
(1000	,  101, 	'FIN',  'ffMaxComp'			, '700.00'									, 'Importe máximo por comprobante'),
(1000	,  102, 	'FIN',  'ffTopeLiq'			, '2000.00'									, 'Tope para liquidar un fondo fijo'),
(1000	,  102, 	'FIN',  'ffMaxComp'			, '500.00'									, 'Importe máximo por comprobante'),
(1000	,  103, 	'FIN',  'ffTopeLiq'			, '1000.00'									, 'Tope para liquidar un fondo fijo'),
(1000	,  103, 	'FIN',  'ffMaxComp'			, '500.00'									, 'Importe máximo por comprobante'),
(1000	,   -1, 	'FIN',  'cjIR'				, '0.10'									, 'Impuesto a la renta'),
(1000	,  101, 	'ACD',  'anioMat'			, '2018'									, 'Año para las matrículas'),
(1000	,  101, 	'ACD',  'anioEva'			, '2017'									, 'Año para las evaluaciones');
*/





/* 
 C# TRABAJAR EN SEGUNDO PLANO 
 https://social.msdn.microsoft.com/Forums/es-ES/e4e370d0-273f-4202-b9a3-34400ff998d9/como-evitar-bloqueo-con-buttonclick?forum=vcses
*/


/*
CAMBIO_FECHA										
id_cambio_fecha	id_usuario	id_negocio	id_modulo	fe_solicita	fe_cambio	motivo	desde_sol	hasta_sol	desde_aut	hasta_aut
1	20	col	com	1/10/2021	30/09/2021	Confirmo banco	08:00	10:00	09:00	10:00
2	20	col	com	1/10/2021	30/09/2021	Confirmo banco	08:00	10:00	-	-
3	20	col	com	1/10/2021	30/09/2021	Confirmo banco	08:00	10:00	-	-
4	20	aca	ac1	1/10/2021	30/09/2021	Confirmo banco	08:00	10:00	-	-
5	20	aca	ac1							
6	20	aca	ac2							
7	20	pol	ac2	En comercial para emitir comprobantes, pero no esceder de 6 dias según sunat						
8	20	pol	lgt	En academico, podría ser para subir las notas si se atrasaron??? Por periodo podria ser						
			lgt	En logistico para registrar comprobantes ??? Es  mas por periodo en este caso						
			lgt	En recursos humanos, es mas por periodo						
			lab	En finanzas es mas por periodo						
			lab							
			lab							
										
AUTORIZA										
id_autorizacion	id_negocio	id_usu_sol	id_usu_aut	id_tipo_aut	id_solicita	id_sistema	fehh_sol	ffhh_aut	de	hasta
*/


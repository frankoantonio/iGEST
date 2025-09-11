-- ============================================================================
-- TABLA: gen.sistema
-- ============================================================================
DROP TABLE IF EXISTS gen.sistema CASCADE;
CREATE TABLE gen.sistema (
	id_sistema 		CHAR(3) 		NOT NULL PRIMARY KEY,
    nom_sistema 	VARCHAR(50) 	NOT NULL,
    nom_corto 		VARCHAR(25) 	NOT NULL UNIQUE,
    descripcion 	VARCHAR(100) 	NOT NULL
);
--
COMMENT ON TABLE gen.sistema IS 'Tabla de los sistemas del ERP.'; 
COMMENT ON COLUMN gen.sistema.id_sistema IS 'Identificador de sistema.';
COMMENT ON COLUMN gen.sistema.nom_sistema IS 'Nombre del sistema.';
COMMENT ON COLUMN gen.sistema.nom_corto IS 'Nombre para ser usado en la ruta del API REST.';
COMMENT ON COLUMN gen.sistema.descripcion IS 'Descripción del sistema.';
--
INSERT INTO gen.sistema (id_sistema, nom_sistema, nom_corto, descripcion)
VALUES 
('COM', 'SISTEMA COMERCIAL'				, 'comercial'	,	'Ventas, matrículas, suscripciones, facturación electrónica, cobranza.'			),
('LGT', 'SISTEMA LOGÍSTICO'				, 'logistico'	,	'Requerimientos, cotización, órdenes de C/S, compras, facturación, almacén.'	),
('PER', 'SISTEMA TALENTO HUMANO'		, 'personal'	,	'Escalafón, asistencia, remuneraciones, CAP.'									),
('FIN', 'SISTEMA FINANCIERO'			, 'financiero'	,	'Tesorería, pagaduría, fondo fijo, pendientes, conciliaciones, proyecciones.'	),
('CNT', 'SISTEMA CONTABLE'				, 'contable'	,	'Asientos, registros de compras/ventas, estados financieros.'	 				),
('ADM', 'SISTEMA DE GESTIÓN'			, 'gestion'		,	'Mesa de partes, requerimientos, reportes gerenciales.'	 						),
('COL', 'SISTEMA ACADÉMICO'				, 'colegio'		,	'Asistencia, conducta, evaluaciones, comunicados, psicología, enfermería.'		),
('ACA', 'SISTEMA ACADÉMICO'				, 'academia'	,	'Asistencia, etas, evas, fast test, simulacros, comunicados.'					),
('MED', 'SISTEMA MÉDICO'				, 'medico'		,	'Turnos, citas, triaje, laboratorio, historia, nutrición.'						),
('BKA', 'SISTEMA BANCA'					, 'banca'		,	'Préstamos, operaciones, refinanciamientos, seguros.'							),
('GEN', 'SISTEMA DE CONTROL Y ACCESO'	, 'principal' 	, 	'Datos genéricos, seguridad, catálogo, unidades orgánicas.'						);



-- ============================================================================
-- TABLA: gen.tipo
-- ============================================================================
DROP TABLE IF EXISTS gen.tipo CASCADE;
CREATE TABLE gen.tipo (
	id_tipo          INT        	NOT NULL PRIMARY KEY,
	nom_tipo         VARCHAR(100)  	NOT NULL,
	nom_corto        VARCHAR(25)   	NOT NULL,
	cod_oficial1     VARCHAR(10)   	NOT NULL,
	cod_oficial2     VARCHAR(10)   	NOT NULL,
	valor1           VARCHAR(10)   	NOT NULL,
	valor2           VARCHAR(10)   	NOT NULL,
	clave            VARCHAR(20)   	NOT NULL,
	grupo            VARCHAR(20)   	NOT NULL,
	orden            INT           	NOT NULL,
	activo           BOOLEAN       	NOT NULL,
	id_sistema       CHAR(3)       	NOT NULL,
	descripcion      VARCHAR(75)   	NOT NULL
);
--
CREATE UNIQUE INDEX ON gen.tipo (grupo, clave) WHERE clave IS NOT NULL AND clave != '';
--
COMMENT ON TABLE gen.tipo IS 'Tabla de tipos multiusos.';
COMMENT ON COLUMN gen.tipo.id_tipo IS 'Identificador de tipo.';
COMMENT ON COLUMN gen.tipo.nom_tipo IS 'Nombre de tipo.';
COMMENT ON COLUMN gen.tipo.nom_corto IS 'Nombre corto de tipo.';
COMMENT ON COLUMN gen.tipo.cod_oficial1 IS 'Código oficial principal. Ejemplo: SUNAT.';
COMMENT ON COLUMN gen.tipo.cod_oficial2 IS 'Código oficial alternativo.';
COMMENT ON COLUMN gen.tipo.valor1 IS 'Algún valor necesario 1. Ejemplo: DNI=8.';
COMMENT ON COLUMN gen.tipo.valor2 IS 'Algún valor necesario 2.';
COMMENT ON COLUMN gen.tipo.clave IS 'Clave del diccionario, para evitar hardcode en la aplicación.';
COMMENT ON COLUMN gen.tipo.grupo IS 'Grupo del diccionario, para evitar hardcode en la aplicación.';
COMMENT ON COLUMN gen.tipo.orden IS 'Orden en que se muestran los registros.';
COMMENT ON COLUMN gen.tipo.activo IS 'Indica si el tipo está activo.';
COMMENT ON COLUMN gen.tipo.id_sistema IS 'Identificador de sistema [GEN.SISTEMA].';
COMMENT ON COLUMN gen.tipo.descripcion IS 'Descripción de tipo.';
--
INSERT INTO gen.tipo (id_tipo, nom_tipo, nom_corto, cod_oficial1, cod_oficial2, valor1, valor2, clave, grupo, orden, activo, id_sistema, descripcion) 
VALUES 
(10000 , 'NEGOCIOS EN GENERAL'									,	'COMERCIO'				, ''	,	''	,	''		,	''	,	'COMERCIO'	    ,	'TI_NEGOCIO'			, 	1, true	, 'GEN' , ''),	
(10001 , 'COLEGIOS PARTICULARES'								,	'COLEGIO'				, ''	,	''	,	''		,	''	,	'COLEGIO'	    ,	'TI_NEGOCIO'			, 	2, true , 'GEN' , ''),
(10002 , 'ACADEMIAS PREUNIVERSITARIAS'							,	'ACADEMIA'				, ''	,	''	,	''		,	''	,	'ACADEMIA'	    ,	'TI_NEGOCIO'			, 	3, true , 'GEN' , ''),
(10003 , 'CLÍNICAS MÉDICAS QUIRÚRGICAS'							,	'CLÍNICA'				, ''	,	''	,	''		,	''	,	'CLINICA'	    ,	'TI_NEGOCIO'			, 	4, true , 'GEN' , ''),
(10004 , 'BANCOS - CAJAS DE AHORRO Y CRÉDITO'					,	'BANCA'					, ''	,	''	,	''		,	''	,	'BANCA'	    	,	'TI_NEGOCIO'			, 	5, true , 'GEN' , ''),
	
(10010, 'PERSONA NATURAL'										,	'PERSONA'				, ''	,	''	,	''		,	''	,	'NATURAL'	    ,	'TI_PERSONA'			, 	1, true , 'GEN' , ''),
(10011, 'PERSONA JURÍDICA'										,	'EMPRESA'				, ''	,	''	,	''		,	''	,	'JURIDICA'	    ,	'TI_PERSONA'			, 	2, true , 'GEN' , ''),
(10012, 'GRUPO INFORMAL'										,	'GRUPO'					, ''	,	''	,	''		,	''	,	'GRUPO'	    	,	'TI_PERSONA'			, 	3, true , 'GEN' , ''),
(10019, 'VARIOS'												,	'VARIOS'				, ''	,	''	,	''		,	''	,	'VARIOS'	    ,	'TI_PERSONA'			, 	6, true , 'GEN' , ''),

(10020, 'HOMBRE'												,	'H'						, ''	,	''	,	''		,	''	,	'HOMBRE'	    ,	'TI_SEXO'				, 	1, true , 'GEN' , ''),
(10021, 'MUJER'													,	'M'						, ''	,	''	,	''		,	''	,	'MUJER'	    	,	'TI_SEXO'				, 	2, true , 'GEN' , ''),
(10029, 'SIN INDICAR'											,	'-'						, ''	,	''	,	''		,	''	,	'---'	    	,	'TI_SEXO'				, 	3, true , 'GEN' , ''),
																																													   
(10030, 'DOCUMENTO NACIONAL DE IDENTIDAD'						,	'DNI'					, '01'	,	''	,	'8'		,	''	,	'DNI'	    	,	'TI_DOC_IDENT'			, 	1, true , 'GEN' , ''), 	--SUNAT-PLAME-Anexo2.xlsx  ->  T3- Tipo Documento  
(10031, 'CARNÉ DE EXTRANJERÍA'									,	'CARNÉ EXTRANJERÍA'		, '04'	,	''	,	''		,	''	,	'CEX'	    	,	'TI_DOC_IDENT'			, 	5, true , 'GEN' , ''),
(10032, 'REGISTRO ÚNICO DE CONTRIBUYENTES'						,	'RUC'					, '06'	,	''	,	'11'	,	''	,	'RUC'	    	,	'TI_DOC_IDENT'			, 	2, true , 'GEN' , ''),
(10033, 'PASAPORTE'												,	'PASAPORTE'				, '07'	,	''	,	''		,	''	,	'PSP'	    	,	'TI_DOC_IDENT'			, 	5, true , 'GEN' , ''),	
(10034, 'CARNÉ DE SOLICITUD DE REFUGIO'							,	'CARNÉ SOL. REFUGIO'	, '09'	,	''	,	''		,	''	,	'CSR'	    	,	'TI_DOC_IDENT'			, 	5, true , 'GEN' , ''),
(10035, 'PARTIDA DE NACIMIENTO'									,	'PARTIDA NACIMIENTO'	, '11'	,	''	,	''		,	''	,	'PNA'	    	,	'TI_DOC_IDENT'			,   5, true , 'GEN' , ''),
(10036, 'CARNÉ DE IDENTIDAD RELACIONES EXTERIORES'				,	'CARNÉ IDENT. REL. EXT'	, '22'	,	''	,	''		,	''	,	'CRE'	    	,	'TI_DOC_IDENT'			,   5, true , 'GEN' , ''),
(10037, 'PERMISO TEMPORAL DE PERMANENCIA'						,	'PTP'					, '23'	,	''	,	''		,	''	,	'PTP'	    	,	'TI_DOC_IDENT'			,   5, true , 'GEN' , ''),
(10038, 'DOCUMENTO DE IDENTIDAD EXTRANJERO'						,	'DOC. IDENT. EXTRANJERO', '24'	,	''	,	''		,	''	,	'DEX'	    	,	'TI_DOC_IDENT'			,   5, true , 'GEN' , ''),
(10039, 'CARNÉ DE PERMISO TEMPORAL DE PERMANENCIA'				,	'CPP'					, '26'	,	''	,	''		,	''	,	'CPP'	    	,	'TI_DOC_IDENT'			,   5, true , 'GEN' , ''),
(10040, 'CÉDULA DIPLOMÁTICA DE IDENTIDAD'						,	'CÉDULA DIPLOMÁTICA'	, 'A'	,	''	,	''		,	''	,	'CDI'	    	,	'TI_DOC_IDENT'			,   5, true , 'GEN' , ''),
(10041, 'SALVOCONDUCTO'											,	'SALVOCONDUCTO'			, 'G'	,	''	,	''		,	''	,	'SAL'	    	,	'TI_DOC_IDENT'			,   5, true , 'GEN' , ''),
(10042, 'NO DOMICILIADO, SIN RUC (EXPORTACIÓN), VARIOS'			,	'NO DOMICILIADO'		, '0'	,	''	,	''		,	''	,	'NDO'	    	,	'TI_DOC_IDENT'			,   5, true , 'GEN' , ''),
(10049, 'SIN DOCUMENTO'											,	'SIN DOC. IDENTIDAD'	, '-'	,	''	,	''		,	''	,	'S/I'	    	,	'TI_DOC_IDENT'			,  10, true , 'GEN' , 'VENTAS MENORES A 700.00'),

(10050, 'CORE EDITION'											,	''						, ''	,	''	,	''		,	''	,	'LITE'			,	'TI_EDITION'			,  	1, true , 'GEN' , ''),
(10051, 'PRO EDITION'											,	''						, ''	,	''	,	''		,	''	,	'ESTD'			,	'TI_EDITION'			,  	2, true , 'GEN' , ''),
(10052, 'PREMIUM EDITION'										,	''						, ''	,	''	,	''		,	''	,	'FULL'			,	'TI_EDITION'			,  	3, true , 'GEN' , ''),

(10060, 'PAIS'													, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	1, true , 'GEN' , ''),
(10061, 'ZONA'													, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	2, true , 'GEN' , ''),
(10062, 'SEDE'													, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	3, true , 'GEN' , ''),
(10063, 'AGENCIA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	4, true , 'GEN' , ''),
(10064, 'LOCAL'													, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	5, true , 'GEN' , ''),
(10065, 'EOB'													, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	6, true , 'GEN' , ''),
(10066, 'PUNTO DE VENTA'										, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_SEDE'				, 	7, true , 'GEN' , ''),

(10070, 'AVENIDA'												,	'AV.'					, '01'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),	--SUNAT-PLAME-Anexo2.xlsx  ->  T5 Via
(10071, 'JIRÓN'													,	'JR.'					, '02'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10072, 'CALLE'													,	'CA.'					, '03' 	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10073, 'PASAJE'												,	'PJ.'					, '04'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10074, 'ALAMEDA'												,	'AL.'					, '05' 	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10075, 'MALECÓN'												,	'MA.'					, '06'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10076, 'OVALO'													,	'OV.'					, '07'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10077, 'PARQUE'												,	'PQ.'					, '08'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10078, 'PLAZA'													,	'PLA.'					, '09'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10079, 'CARRETERA'												,	'CAR.'					, '10'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10080, 'TROCHA'												,	'TRO.'					, '13'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10081, 'CAMINO RURAL'											,	'CRU.' 					, '14'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10082, 'BAJADA'												,	'BAJ.' 					, '15'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10083, 'GALERIA'												,	'GAL.' 					, '16'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10084, 'PROLONGACIÓN'											,	'PRO.' 					, '17'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10085, 'PASEO'													,	'PAS.' 					, '18'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10086, 'PLAZUELA'												,	'PZU.' 					, '19'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10087, 'PORTAL'												,	'POR.' 					, '20'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10088, 'CAMINO AFIRMADO'										,	'CAF.' 					, '21'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10089, 'TROCHA CARROZABLE'										,	'TRC.' 					, '22'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   0, true , 'GEN' , ''),
(10090, 'OTROS'													,	'OTROS'					, '99'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   1, true , 'GEN' , ''),
(10099, '<SIN INDICAR>'											,	''						, '99'	,	''	,	''		,	''	,	''	    		,	'TI_VIA'				,   2, true , 'GEN' , ''),

(10100, 'URBANIZACIÓN'											,	'URB.'					, '01'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),	--SUNAT-PLAME-Anexo2.xlsx  ->  T6 Zona
(10101, 'PUEBLO JOVEN'											,	'P.J.'					, '02'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),
(10102, 'UNIDAD VECINAL'										,	'U.V.'					, '03'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),
(10103, 'CONJUNTO HABITACIONAL'									,	'C.H.'					, '04'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),
(10104, 'ASENTAMIENTO HUMANO'									,	'A.H.'					, '05'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),
(10105, 'COOPERATIVA'											,	'COO.'					, '06'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),
(10106, 'RESIDENCIAL'											,	'RES.'					, '07'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),
(10107, 'ZONA INDUSTRIAL'										,	'Z.I.'					, '08'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),
(10108, 'GRUPO'													,	'GRU.'					, '09'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),
(10109, 'CASERÍO'												,	'CAS.'					, '10'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),
(10110, 'FUNDO'													,	'FND.'					, '11'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   0, true , 'GEN' , ''),
(10111, 'OTROS'													,	'OTROS' 				, '99'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   1, true , 'GEN' , ''),
(10119, '<SIN INDICAR>'											,	'' 						, '99'	,	''	,	''		,	''	,	''	    		,	'TI_ZONA'				,   2, true , 'GEN' , ''),

(10120, 'PAPÁ'													, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,  	1, true , 'GEN' , ''),
(10121, 'MAMÁ'													, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,  	2, true , 'GEN' , ''),
(10122, 'TÍO/A'													, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,   3, true , 'GEN' , ''),
(10123, 'ABUELO/A'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,   4, true , 'GEN' , ''),
(10124, 'HERMANO/A'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,   5, true , 'GEN' , ''),
(10125, 'PRIMO/A'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,   6, true , 'GEN' , ''),
(10126, 'PADRINO/MADRINA'										, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,   7, true , 'GEN' , ''),
(10127, 'TUTOR/A'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,   8, true , 'GEN' , ''),
(10128, 'HIJO/A'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,   9, true , 'GEN' , ''),
(10129, 'SOBRINO/A'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,  10, true , 'GEN' , ''),
(10130, 'AHIJADO/A'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,  11, true , 'GEN' , ''),
(10131, 'OTRO PARENTESCO'										, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,  90, true , 'GEN' , ''),
(10139, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_PARENTESCO_EST'		,  99, true , 'GEN' , ''),

(10140, 'SOLTERO/A'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	1, true , 'GEN' , ''),
(10141, 'CASADO/A'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	2, true , 'GEN' , ''),
(10142, 'CONVIVIENTE'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	3, true , 'GEN' , ''),
(10143, 'SEPARADO/A'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	4, true , 'GEN' , ''),
(10144, 'DIVORCIADO/A'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	5, true , 'GEN' , ''),
(10145, 'VIUDO/A'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	6, true , 'GEN' , ''),
(10149, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_EST_CIV'			, 	7, true , 'GEN' , ''),

(10150, 'CASA'													, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIVIENDA'			,  	1, true , 'GEN' , ''),
(10151, 'DEPARTAMENTO'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIVIENDA'			,  	2, true , 'GEN' , ''),
(10152, 'DUPLEX'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIVIENDA'			,  	3, true , 'GEN' , ''),
(10153, 'CUARTO'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIVIENDA'			,  	4, true , 'GEN' , ''),
(10159, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIVIENDA'			,  	5, true , 'GEN' , ''),
	
(10160, 'MATERIAL NOBLE'										, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIV_MATERIAL'		,  	1, true , 'GEN' , ''),
(10161, 'MADERA'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIV_MATERIAL'		,  	2, true , 'GEN' , ''),
(10162, 'RÚSTICO'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIV_MATERIAL'		,  	3, true , 'GEN' , ''),
(10169, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIV_MATERIAL'		,  	3, true , 'GEN' , ''),
	
(10170, 'ALQUILADO'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIV_CONDICION'		,  	1, true , 'GEN' , ''),
(10171, 'PROPIO'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIV_CONDICION'		,  	2, true , 'GEN' , ''),
(10172, 'FAMILIAR'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIV_CONDICION'		,  	3, true , 'GEN' , ''),
(10179, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_VIV_CONDICION'		,  	4, true , 'GEN' , ''),
	
(10180, 'SIN MOVILIDAD'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_MOVILIDAD'			,  	1, true , 'GEN' , ''),
(10181, 'BICICLETA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_MOVILIDAD'			,  	2, true , 'GEN' , ''),
(10182, 'PROPIO MOTORIZADO 2|3 RUEDAS'							, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_MOVILIDAD'	    	,  	3, true , 'GEN' , ''),
(10183, 'PROPIO MOTORIZADO 4+ RUEDAS'							, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_MOVILIDAD'	    	,  	4, true , 'GEN' , ''),
(10184, 'TRANSPORTE PÚBLICO'									, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_MOVILIDAD'	    	,  	5, true , 'GEN' , ''),
(10185, 'MIXTO [PROPIO/PÚBLICO]'								, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_MOVILIDAD'	    	,  	6, true , 'GEN' , ''),
(10189, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_MOVILIDAD'	    	,  	7, true , 'GEN' , ''),

(10190, 'SIN EDUCACIÓN FORMAL'									, 	''						, '01'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   1, true , 'GEN' , ''),	--SUNAT-PLAME-Anexo2.xlsx  ->  T9 Situación Educativa
(10191, 'ESPECIAL INCOMPLETA'									, 	''						, '02'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   2, true , 'GEN' , ''),
(10192, 'ESPECIAL COMPLETA'										, 	''						, '03'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   3, true , 'GEN' , ''),
(10193, 'PRIMARIA INCOMPLETA'									, 	''						, '04'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   4, true , 'GEN' , ''),
(10194, 'PRIMARIA COMPLETA'										, 	''						, '05'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   5, true , 'GEN' , ''),
(10195, 'SECUNDARIA INCOMPLETA'									, 	''						, '06'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   6, true , 'GEN' , ''),
(10196, 'SECUNDARIA COMPLETA'									, 	''						, '07'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   7, true , 'GEN' , ''),
(10197, 'TÉCNICA INCOMPLETA - CEO/CETPRO'						, 	''						, '08'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   8, true , 'GEN' , ''),
(10198, 'TÉCNICA COMPLETA - CEO/CETPRO'							, 	''						, '09'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,   9, true , 'GEN' , ''),
(10199, 'SUPERIOR INCOMPLETA - IST/ISP/ESC. FORM. ART./ESC. SUBOF.',''						, '10'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  10, true , 'GEN' , ''),
(10200, 'SUPERIOR COMPLETA - IST/ISP/ESC. FORM. ART./ESC. SUBOF.'  ,''						, '11'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  11, true , 'GEN' , ''),
(10201, 'UNIVERSITARIA INCOMPLETA - ESCUELA OF.'				, 	''						, '12'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  12, true , 'GEN' , ''),
(10202, 'UNIVERSITARIA COMPLETA - ESCUELA OF.'					, 	''						, '13'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  13, true , 'GEN' , ''),
(10203, 'GRADO DE BACHILLER'									, 	''						, '14'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  14, true , 'GEN' , ''),
(10204, 'TITULADO'												, 	''						, '15'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  15, true , 'GEN' , ''),
(10205, 'MAESTRÍA INCOMPLETA'									, 	''						, '16'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  16, true , 'GEN' , ''),
(10206, 'MAESTRÍA COMPLETA'										, 	''  					, '17'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  17, true , 'GEN' , ''),
(10207, 'GRADO DE MAESTRÍA'										, 	''  					, '18'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  18, true , 'GEN' , ''),
(10208, 'DOCTORADO INCOMPLETO'									, 	''  					, '19'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  19, true , 'GEN' , ''),
(10209, 'DOCTORADO COMPLETO'									, 	''  					, '20'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  20, true , 'GEN' , ''),
(10210, 'GRADO DE DOCTOR'										, 	''  					, '21'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  21, true , 'GEN' , ''),
(10219, '<SIN INDICAR>'											, 	''  					, '99'	,	''	,	''		,	''	,	''	    		,	'TI_SIT_EDUC'			,  22, true , 'GEN' , ''),

(10220, 'COLEGIO / ESCUELA'										,	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	1, true , 'GEN' , ''),
(10221, 'CETPRO / CEO / OTRO'									,	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	2, true , 'GEN' , ''),
(10222, 'INSTITUTO'												,	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	3, true , 'GEN' , ''),
(10223, 'ESCUELA ARTISTICA / DEPORTIVA / CULTURAL / OTRO'		,	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	4, true , 'GEN' , ''),
(10224, 'ESCUELA POLICIAL'										,	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	5, true , 'GEN' , ''),
(10225, 'ESCUELA MILITAR'										,	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	6, true , 'GEN' , ''),
(10226, 'UNIVERSIDAD'											,	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_INST_ESTUDIO'		,  	7, true , 'GEN' , ''),

(10230, 'SEÑOR'													, 	'SR.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	1, true , 'GEN' , ''),
(10231, 'SEÑORA'												, 	'SRA.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	2, true , 'GEN' , ''),
(10232, 'SEÑORITA'												, 	'SRTA.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	3, true , 'GEN' , ''),
(10233, 'LICENCIADO/A'											, 	'LIC.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10234, 'CONTADOR/A PÚBLICO/A COLEGIADO/A'						, 	'C.P.C.'				, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10235, 'ABOGADO/A'												, 	'ABOG.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10236, 'INGENIERO/A'											, 	'ING.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10237, 'ARQUITECTO/A'											, 	'ARQ.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10238, 'PROFESOR/A'											, 	'PROF.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10239, 'BACHILLER'												, 	'BACH.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10240, 'MAGISTER'												, 	'MG.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10241, 'DOCTOR/A'												, 	'DR.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10242, 'OFICIAL'												, 	'OF.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10243, 'SUBOFICIAL'											, 	'SOF.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10244, 'TÉCNICO/A'												, 	'TEC.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
(10245, 'PSICÓLOGO/A'											, 	'PS.'					, ''	,	''	,	''		,	''	,	''				,	'TI_TITULO'				, 	4, true , 'GEN' , ''),
--hasta el 10259

(10260, 'ACTIVO'												, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	1, true , 'GEN' , ''),
(10261, 'SUSPENSIÓN TEMPORAL'									, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	2, true , 'GEN' , ''),
(10262, 'BAJA PROVISIONAL'										, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	3, true , 'GEN' , ''),
(10263, 'BAJA DEFINITIVA'										, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	4, true , 'GEN' , ''),
(10264, 'BAJA PROVISIONAL DE OFICIO'							, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	5, true , 'GEN' , ''),
(10265, 'BAJA DEFINITIVA DE OFICIO'								, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	6, true , 'GEN' , ''),
(10266, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_ESTADO_CONTRIB'		,  	7, true , 'GEN' , ''),
																																																
(10270, 'HABIDO'												, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_CONDICION_CONTRIB'	,  	1, true , 'GEN' , ''),
(10271, 'NO HALLADO'											, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_CONDICION_CONTRIB'	,  	2, true , 'GEN' , ''),
(10272, 'NO HABIDO'												, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_CONDICION_CONTRIB'	,  	3, true , 'GEN' , ''),
(10273, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_CONDICION_CONTRIB'	,  	4, true , 'GEN' , ''),

(10280, 'CASTELLANO'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	1, true , 'GEN' , ''),
(10281, 'QUECHUA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	2, true , 'GEN' , ''),
(10282, 'AYMARA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10283, 'ASHANINKA(CAMPA)'										, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10284, 'AGUARUNA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10285, 'SHIPIBA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10286, 'HIJITOTO'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10287, 'COCAMA - COCAMILLA'									, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10288, 'MACHIGUENGA'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10289, 'PIRO'													, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10290, 'CASHINAHUA'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10291, 'COCATAIBO'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10292, 'YAMINAHUA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10293, 'CULINA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10294, 'SHARANAHUA'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10295, 'MATSANAHUA'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10296, 'ANAHUACA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10297, 'HUAMBISA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10298, 'ACHUAR'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10299, 'BORA'													, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10300, 'CHAYAHUITA'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10301, 'YANESHA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	3, true , 'GEN' , ''),
(10302, 'INGLES'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	8, true , 'GEN' , ''),
(10303, 'FRANCES'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	8, true , 'GEN' , ''),
(10304, 'ITALIANO'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  	8, true , 'GEN' , ''),
(10308, '<OTRO>'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  10, true , 'GEN' , ''),
(10309, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_LENGUA'				,  20, true , 'GEN' , ''),

(10310, 'CATÓLICA'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_RELIGION'			,  	1, true , 'GEN' , ''),
(10311, 'CRISTIANA'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_RELIGION'			,  	2, true , 'GEN' , ''),
(10312, 'OTRA RELIGIÓN'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_RELIGION'			,  10, true , 'GEN' , ''),
(10313, 'NINGUNA RELIGIÓN'										, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_RELIGION'			,  11, true , 'GEN' , ''),
(10314, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_RELIGION'			,  12, true , 'GEN' , ''),
(10315, 'DHÁRMICAS'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_RELIGION'			,  	3, true , 'GEN' , ''),
(10316, 'ISLAMÍCA'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_RELIGION'			,  	4, true , 'GEN' , ''),
(10317, 'JUDÍA'													, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_RELIGION'			,  	5, true , 'GEN' , ''),

(10320, '<1,500.00'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  	1, true , 'GEN' , ''),
(10321, ' 1,500.00 -  2,500.00'								 	, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  	2, true , 'GEN' , ''),
(10322, ' 2,501.00 -  4,000.00'									, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  	3, true , 'GEN' , ''),
(10323, ' 4,001.00 -  5,500.00'									, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  	4, true , 'GEN' , ''),
(10324, ' 5,501.00 -  7,000.00'									, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  	5, true , 'GEN' , ''),
(10325, ' 7,001.00 -  8,500.00'									, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  	6, true , 'GEN' , ''),
(10326, ' 8,501.00 - 10,000.00'									, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  	7, true , 'GEN' , ''),
(10327, '10,001.00 - 15,000.00'									, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  	8, true , 'GEN' , ''),
(10328, '15,001.00 - 20,000.00'									, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  	9, true , 'GEN' , ''),
(10329, '>20,000.00'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  10, true , 'GEN' , ''),
(10339, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_INGRESOS'		,  10, true , 'GEN' , ''),
																																																																																																																												
(10340, 'SIS - SEGURO INTEGRAL DE SALUD'						, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_SEGURO'			,  	1, true , 'GEN' , ''),
(10341, 'ESSALUD'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_SEGURO'			,  	2, true , 'GEN' , ''),
(10342, 'SEGURO SALUD FFAA / FFPP'								, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_SEGURO'			,  	3, true , 'GEN' , ''),
(10343, 'EPS RIMAC'												, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_SEGURO'			,  	5, true , 'GEN' , ''),
(10344, 'EPS MAPFRE'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_SEGURO'			,  	6, true , 'GEN' , ''),
(10345, 'EPS SANITAS'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_SEGURO'			,  	7, true , 'GEN' , ''),
(10346, 'EPS PACÍFICO'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_SEGURO'			,  	8, true , 'GEN' , ''),
(10349, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''	    ,	''	,	''	    		,	'TI_FAM_SEGURO'			,  	9, true , 'GEN' , ''),


(10990, 'PRODUCCIÓN'											,	''						, ''	,	''	,	''		,	''	,	'PRO'			,	'TI_CECO'				,  	1, true , 'GEN' , ''),
(10991, 'ADMINISTRACIÓN'										,	''						, ''	,	''	,	''		,	''	,	'GEN'			,	'TI_CECO'				,  	2, true , 'GEN' , ''),
(10992, 'VENTAS'												,	''						, ''	,	''	,	''		,	''	,	'VTA'			,	'TI_CECO'				,  	3, true , 'GEN' , '');


/*	

-- TALVES NO SE USE
(10120, 'TRABAJADOR'											,	''						, ''	,	''	,	'USU'	,	''	,	'TRA'			,	'TI_GRP_PER'			,  	1, true , 'GEN' , ''),
(10121, 'SOCIO COMERCIAL - CLIENTE'								,	''						, ''	,	''	,	''		,	''	,	'CLI'			,	'TI_GRP_PER'			,  	2, true , 'GEN' , ''),
(10122, 'SOCIO COMERCIAL - PROVEEDOR'							,	''						, ''	,	''	,	''		,	''	,	'PRO'			,	'TI_GRP_PER'			,  	2, true , 'GEN' , ''),
(10123, 'ESTUDIANTE COLEGIO'									,	''						, ''	,	''	,	'USU'	,	''	,	'ECO'			,	'TI_GRP_PER'			,  	3, true , 'GEN' , ''),
(10124, 'ESTUDIANTE ACADEMIA'									,	''						, ''	,	''	,	'USU'	,	''	,	'EAC'			,	'TI_GRP_PER'			,  	4, true , 'GEN' , ''),
(10125, 'DOCTOR'												,	''						, ''	,	''	,	''	    ,	''	,	'DOC'			,	'TI_GRP_PER'			,   5, true , 'GEN' , ''),
(10126, 'PACIENTE'												,	''						, ''	,	''	,	'USU'	,	''	,	'PAC'			,	'TI_GRP_PER'			,  	6, true , 'GEN' , ''),
(10127, 'FAMILIAR TRABAJADOR'									,	''						, ''	,	''	,	''		,	''	,	'FTR'			,	'TI_GRP_PER'			,  	6, true , 'GEN' , ''),
(10128, 'FAMILIAR ESTUDIANTE'									,	''						, ''	,	''	,	'USU'	,	''	,	'FES'			,	'TI_GRP_PER'			,  	7, true , 'GEN' , ''),
(10129, 'FAMILIAR PACIENTE'										,	''						, ''	,	''	,	''		,	''	,	'FPA'			,	'TI_GRP_PER'			,  	9, true , 'GEN' , ''),
	
	
(95050, 'CABECERA DE OPCIONES'									,	''						, ''	,	''	,	''		,	''	,	'CAB'			,	'TI_OPCION_SIS'			,  	1, true , 'GEN' , ''),
(95051, 'OPCIÓN - PANEL DE USUARIO'								,	''						, ''	,	''	,	''		,	''	,	'PNL'			,	'TI_OPCION_SIS'			,  	2, true , 'GEN' , ''),
(95052, 'OPCIÓN - FORMULARIO EMERGENTE'							,	''						, ''	,	''	,	''		,	''	,	'FRM'			,	'TI_OPCION_SIS'			,  	3, true , 'GEN' , ''),
(95053, 'OPCIÓN - REPORTE'										,	''						, ''	,	''	,	''		,	''	,	'RPT'			,	'TI_OPCION_SIS'			,  	4, true , 'GEN' , ''),
		
(95200, 'OFICINA'												, 	'OFI'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95201, 'ALMACÉN CONSUMIBLES'									, 	'AL1'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95202, 'ALMACÉN MERCADERÍA'									, 	'AL2'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95203, 'ALMACÉN MATERIA PRIMA'									, 	'AMP'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95204, 'ALMACÉN GENERAL'										, 	'ALM'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95205, 'PUNTO DE VENTA'										, 	'PVT'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95206, 'SALÓN'													, 	'SAL'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95207, 'SALA'													, 	'SAA'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95208, 'HALL'													, 	'HAL'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95209, 'JARDÍN'												, 	'JAR'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95210, 'DUCTO'													, 	'DUC'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95211, 'PATIO'													, 	'PAT'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95212, 'PASADIZO'												, 	'PAS'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95213, 'ASENSOR'												, 	'ASE'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95214, 'GRADA'													, 	'GRA'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95215, 'BAÑO'													, 	'BAN'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95216, 'AUDITORIO'												, 	'AUD'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95217, 'ALMACÉN PRODUCTOS TERMINADOS'							, 	'APT'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95218, 'LABORATORIO'											, 	'LAB'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
(95219, 'PISO'													, 	'PIS'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),
--(95220, 'PABELLON'											, 	'PAB'					, ''	,	''	,	''		,	''	,	''				,	'TI_AMBIENTE'			, 	9, true , 'GEN' , ''),

(95220, 'MAÑANA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	1, true , 'GEN' , ''),
(95221, 'TARDE'													, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	2, true , 'GEN' , ''),
(95222, 'NOCHE'													, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	3, true , 'GEN' , ''),
(95223, 'TODO EL DÍA'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	4, true , 'GEN' , ''),
(95224, 'TODA LA NOCHE'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	5, true , 'GEN' , ''),
(95225, 'SOLO FINES DE SEMANA'									, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	6, true , 'GEN' , ''),
(95226, 'INTERDIARIO'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	7, true , 'GEN' , ''),
(95229, 'VARIABLE'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_TURNO'				,  	8, true , 'GEN' , ''),
	

-- COLEGIO

(35000, 'INICIAL'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_EDU_BAS_REG'		,  	1, true , 'COL' , ''),
(35001, 'PRIMARIA'												, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_EDU_BAS_REG'		,  	2, true , 'COL' , ''),
(35002, 'SECUNDARIA'											, 	''						, ''	,	''	,	''		,	''	,	''	    		,	'TI_EDU_BAS_REG'	    ,  	3, true , 'COL' , ''),


-- ACADEMIA

(40000, 'REFORZAMIENTO ESCOLAR'									, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_PROGRAMA_ACAD'		,  	1, true , 'ACA' , ''),
(40001, 'PREPARACIÓN PREUNIVERSITARIA'							, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_PROGRAMA_ACAD'		,  	2, true , 'ACA' , ''),
(40002, 'TALLERES'												, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_PROGRAMA_ACAD'		,  	3, true , 'ACA' , ''),
(40003, 'PROYECTOS DE REFORZAMIENTO'							, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_PROGRAMA_ACAD'		,  	4, true , 'ACA' , ''),
(40004, 'REFORZAMIENTO UNIVERSITARIO'							, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_PROGRAMA_ACAD'		,  	5, true , 'ACA' , ''),

(40010, 'EXAMEN DE BECAS'										, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_INSCR_ACA'			,  	1, true , 'ACA' , ''),
(40011, 'CICLO VERANO'											, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_INSCR_ACA'			,  	2, true , 'ACA' , ''),
(40012, 'CICLO REGULAR'											, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_INSCR_ACA'			,  	3, true , 'ACA' , ''),
(40013, 'CICLO REPASO'											, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_INSCR_ACA'			,  	4, true , 'ACA' , ''),

(40020, 'HABILIDADES FÍSICAS'									, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_HAB_HUMANA'			,  	1, true , 'ACA' , ''),
(40021, 'HABILIDADES COGNITIVAS'								, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_HAB_HUMANA'			,  	2, true , 'ACA' , ''),
(40022, 'HABILIDADES EMOCIONALES Y SOCIALES'					, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_HAB_HUMANA'			,  	3, true , 'ACA' , ''),
(40023, 'HABILIDADES CREATIVAS Y TÉCNICAS'						, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_HAB_HUMANA'			,  	4, true , 'ACA' , ''),
(40024, 'HABILIDADES ÉTICAS Y ADAPTATIVAS'						, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_HAB_HUMANA'			,  	5, true , 'ACA' , ''),
*/


--(40000, 'EXAMEN TIPO ADMISIÓN'								, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_EVALUACION'			,  	1, true , 'ACA' , ''),
--(40001, 'EVALUACIONES DIARIAS'								, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_EVALUACION'			,  	1, true , 'ACA' , ''),
--(40002, 'SIMULACROS'											, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_EVALUACION'			,  	2, true , 'ACA' , ''),
--(40003, 'TAREAS'												, 	''						, ''	,	''	,	''		,	''	,	''				,	'TI_EVALUACION'			,  	3, true , 'ACA' , '')


/*
 
(10660, 'NUEVO'													, 	''						, ''	,	''	,	''		,	'TI_INGRESO'		,  	1, true , 'COM' , ''),
(10661, 'RATIFICADO'											, 	''						, ''	,	''	,	''		,	'TI_INGRESO'		,  	2, true , 'COM' , ''),
(10662, 'REINGRESANTE'											, 	''						, ''	,	''	,	''		,	'TI_INGRESO'		,  	3, true , 'COM' , ''),
(10663, 'ANTIGUO' 												, 	''						, ''	,	''	,	''		,	'TI_INGRESO'		,  	4, true , 'COM' , ''),
(10664, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	'TI_INGRESO'		,  	5, true , 'COM' , ''),
																																		
(10670, 'INGRESANTE'											, 	''						, ''	,	''	,	''		,	'TI_EVAL_ING'		,  	1, true , 'COM' , ''), --ingreso en base a TI_EVALFIN
(10671, 'PROMOVIDO'												, 	''						, ''	,	''	,	''		,	'TI_EVAL_ING'		,  	2, true , 'COM' , ''),
(10672, 'REPITENTE'												, 	''						, ''	,	''	,	''		,	'TI_EVAL_ING'		,  	3, true , 'COM' , ''),
(10673, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	'TI_EVAL_ING'		,  	4, true , 'COM' , ''),

(10690, 'SIN EVALUAR'											, 	''						, ''	,	''	,	''		,	'TI_EVAL_FIN'		,  	1, true , 'COM' , ''),
(10691, 'APROBADO'												, 	''						, ''	,	''	,	''		,	'TI_EVAL_FIN'		,  	2, true , 'COM' , ''),
(10692, 'DESAPROBADO'											, 	''						, ''	,	''	,	''		,	'TI_EVAL_FIN'		,  	3, true , 'COM' , ''),
(10693, 'REQUIERE RECUPERACION'									, 	''						, ''	,	''	,	''		,	'TI_EVAL_FIN'		,  	4, true , 'COM' , ''),
(10694, 'INTERRUMPIDO'											, 	''						, ''	,	''	,	''		,	'TI_EVAL_FIN'		,  	4, true , 'COM' , ''),
(10695, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	'TI_EVAL_FIN'		,  	4, true , 'COM' , ''),
																															
(10700, 'PRESENCIAL'											, 	''						, ''	,	''	,	''		,	'TI_MOD_ESTUDIO'	,  	1, true , 'COM' , ''),
(10701, 'SEMIPRESENCIAL'										, 	''						, ''	,	''	,	''		,	'TI_MOD_ESTUDIO'	,  	2, true , 'COM' , ''),
(10702, 'VIRTUAL'												, 	''						, ''	,	''	,	''		,	'TI_MOD_ESTUDIO'	,  	3, true , 'COM' , ''),
(10703, 'POR DEFINIR'											, 	''						, ''	,	''	,	''		,	'TI_MOD_ESTUDIO'	,  	4, true , 'COM' , ''),
																															
(10710, 'EDUCACIÓN REGULAR'										, 	''						, ''	,	''	,	''		,	'TI_INSCR_COL'		,  	1, true , 'COM' , ''),
(10711, 'VACACIONES ÚTILES'										, 	''						, ''	,	''	,	''		,	'TI_INSCR_COL'		,  	2, true , 'COM' , ''),
(10712, 'EXAMEN DE CLASIFICACIÓN'								, 	''						, ''	,	''	,	''		,	'TI_INSCR_COL'		,  	3, true , 'COM' , ''),
(10713, 'OTROS'													, 	''						, ''	,	''	,	''		,	'TI_INSCR_COL'		,  	4, true , 'COM' , ''),

(10470, 'CIENCIAS'												, 	''						, ''	,	''	,	''		,	'TI_GRP_ESTUDIO'	,  	1, true , 'ACD' , ''),
(10471, 'LETRAS'												, 	''						, ''	,	''	,	''		,	'TI_GRP_ESTUDIO'	,  	2, true , 'ACD' , ''),
(10472, 'ESFUERZO FÍSICO'										, 	''						, ''	,	''	,	''		,	'TI_GRP_ESTUDIO'	,  	3, true , 'ACD' , ''),
(10473, 'CONOCIMIENTOS'											, 	''						, ''	,	''	,	''		,	'TI_GRP_ESTUDIO'	,  	4, true , 'ACD' , ''),
(10474, 'ÚNICO'													, 	''						, ''	,	''	,	''		,	'TI_GRP_ESTUDIO'	,  	5, true , 'ACD' , ''),
(10475, 'GRUPOS VARIOS'											, 	''						, ''	,	''	,	''		,	'TI_GRP_ESTUDIO'	,  	6, true , 'ACD' , ''),
(10476, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	'TI_GRP_ESTUDIO'	,  16, true , 'ACD' , ''),
																																		
  
(10460, '<SIN INDICAR>'											, 	'---'					, ''	,	''	,	''		,	'TI_NIV_EDUC'		, 	4, true , 'ACD' , ''),
(10461, 'INICIAL'												, 	'INI'					, ''	,	''	,	''		,	'TI_NIV_EDUC'		, 	1, true , 'ACD' , ''),
(10462, 'PRIMARIA'												, 	'PRI'					, ''	,	''	,	''		,	'TI_NIV_EDUC'		, 	2, true , 'ACD' , ''),
(10463, 'SECUNDARIA'											, 	'SEC'					, ''	,	''	,	''		,	'TI_NIV_EDUC'		, 	3, true , 'ACD' , ''),


*/
																													



/*
																															
																																		

																													
																															

																																		
																																								
(10350, 'DIARIO'												, 	''						, ''	,	'1'	,	'DÍA'	,	'TI_PERIODICIDAD'	,  	1, true , 'GEN' , ''),
(10351, 'SEMANAL'												, 	''						, ''	,	'7'	,	'DÍA'	,	'TI_PERIODICIDAD'	,  	2, true , 'GEN' , ''),
(10352, 'QUINCENAL 14'											, 	''						, ''	,	'14',	'DÍA'	,	'TI_PERIODICIDAD'	,  	3, true , 'GEN' , ''),
(10353, 'QUINCENAL 15'											, 	''						, ''	,	'15',	'DÍA'	,	'TI_PERIODICIDAD'	,  	4, true , 'GEN' , ''),
(10354, 'MENSUAL'												, 	''						, ''	,	'1'	,	'MES'	,	'TI_PERIODICIDAD'	,  	5, true , 'GEN' , ''),
(10355, 'BIMESTRAL'												, 	''						, ''	,	'2'	,	'MES'	,	'TI_PERIODICIDAD'	,  	6, true , 'GEN' , ''),
(10356, 'TRIMESTRAL'											, 	''						, ''	,	'3'	,	'MES'	,	'TI_PERIODICIDAD'	,  	7, true , 'GEN' , ''),
(10357, 'CUATRIMESTRAL'											, 	''						, ''	,	'4'	,	'MES'	,	'TI_PERIODICIDAD'	,  	8, true , 'GEN' , ''),
(10358, 'QUINQUEMESTRAL'										, 	''						, ''	,	'5'	,	'MES'	,	'TI_PERIODICIDAD'	,   9, true , 'GEN' , ''),
(10359, 'SEMESTRAL'												, 	''						, ''	,	'6'	,	'MES'	,	'TI_PERIODICIDAD'	,  10, true , 'GEN' , ''),
(10360, 'ANUAL'													, 	''						, ''	,	'1'	,	'AÑO'	,	'TI_PERIODICIDAD'	,  11, true , 'GEN' , ''),
(10361, 'NINGUNO'												, 	''						, ''	,	'0'	,	'---'	,	'TI_PERIODICIDAD'	,  12, true , 'GEN' , ''),
			
																																									
(10510, 'PRESENCIAL OFICINA'									, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,   1, true , 'COM' , ''),	--OK_OK
(10511, 'PRESENCIAL DOMICILIARIO'								, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,   2, true , 'COM' , ''),
(10512, 'PRESENCIAL LABORAL'									, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,   3, true , 'COM' , ''),
(10513, 'PRESENCIAL PUNTO DE VENTA'								, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,   4, true , 'COM' , ''),
(10514, 'EVENTOS 1'												, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,   5, true , 'COM' , ''),
(10515, 'LLAMADA'												, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10516, 'MENSAJE DE TEXTO'										, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10517, 'WHATSAPP'												, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10518, 'TELEGRAM'												, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10519, 'FACEBOOK'												, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10520, 'CORREO'												, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10521, 'INTRANET'												, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10522, 'FORMULARIO GOOGLE'										, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10523, 'FORMULARIO FACEBOOK'									, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10524, 'FORMULARIO WEB'										, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  10, true , 'COM' , ''),
(10525, 'EVENTOS 2'												, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,   6, true , 'COM' , ''),
(10526, 'EVENTOS 3'												, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,   7, true , 'COM' , ''),
(10527, 'OTRO MEDIO'											, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  20, true , 'COM' , ''),
(10528, '<NO SE LOGRO CONTACTAR>'								, 	''						, ''	,	''	,	''		,	'TI_ATENCION'		,  30, true , 'COM' , ''),
			
(10540, 'INICIADO'												, 	''						, ''	,	''	,	''		,	'TI_EST_MATR'		,  	1, true , 'COM' , ''),
(10541, 'EN PROCESO'											, 	''						, ''	,	''	,	''		,	'TI_EST_MATR'		,  	2, true , 'COM' , ''),
(10542, 'INSCRITO'												, 	''						, ''	,	''	,	''		,	'TI_EST_MATR'		,  	3, true , 'COM' , ''),
(10543, 'DESCALIFICADO'											, 	'TI_DESCALI'			, ''	,	''	,	''		,	'TI_EST_MATR'		,  	4, true , 'COM' , ''), --gen.tipo DE DESCALIFICACIÓN
(10544, 'MATRICULADO'											, 	''						, ''	,	''	,	''		,	'TI_EST_MATR'		,  	5, true , 'COM' , ''),
(10545, 'ANULADO'												, 	'TI_ANULADO'			, ''	,	''	,	''		,	'TI_EST_MATR'		,  	6, true , 'COM' , ''), --gen.tipo DE ANULADO
(10546, 'RETIRADO'												, 	'TI_RETIRAD'			, ''	,	''	,	''		,	'TI_EST_MATR'		,  	7, true , 'COM' , ''), --gen.tipo DE RETIRO
(10547, 'TRASLADADO'											, 	'TI_TRASLAD'			, ''	,	''	,	''		,	'TI_EST_MATR'		,  	8, true , 'COM' , ''), --gen.tipo DE TRASLADO
(10548, 'TRASLADO Y RESERVA'									, 	'TI_TRASLAD'			, ''	,	''	,	''		,	'TI_EST_MATR'		,  	9, true , 'COM' , ''), --gen.tipo DE TRASLADO
																															
(10560, 'NO MUESTRA INTERÉS'									, 	''						, ''	,	''	,	''		,	'TI_GDO_INTERES'	,  	1, true , 'COM' , ''),
(10561, 'INTERÉS NORMAL'										, 	''						, ''	,	''	,	''		,	'TI_GDO_INTERES'	,  	2, true , 'COM' , ''),
(10562, 'MUY INTERESADO'										, 	''						, ''	,	''	,	''		,	'TI_GDO_INTERES'	,  	3, true , 'COM' , ''),
(10563, 'POTENCIAL CLIENTE'										, 	''						, ''	,	''	,	''		,	'TI_GDO_INTERES'	,  	4, true , 'COM' , ''),
(10564, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	'TI_GDO_INTERES'	,  	5, true , 'COM' , ''),
																															
(10570, 'NO CUMPLE CON LA EDAD'									, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),	--OK_OK
(10571, 'MOTIVOS ECONÓMICOS'									, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10572, 'PROBLEMAS DE CONDUCTA'									, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10573, 'MOTIVOS DE SALUD'										, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10574, 'MOTIVOS FAMILIARES'									, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10575, 'CAMBIÓ DE RESIDENCIA'									, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10576, 'PREFIERE OTRA MODALIDAD DE ESTUDIO'					, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10577, 'ELIGIÓ OTRA INSTITUCIÓN'								, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,  	1, true , 'COM' , ''),
(10578, 'PERDIÓ EL INTERÉS'										, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,   1, true , 'COM' , ''),
(10579, 'DESISTIÓ SIN EXPONER MOTIVOS'							, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,   1, true , 'COM' , ''),
(10580, 'NO REALIZÓ PAGO ALGUNO'								, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,   1, true , 'COM' , ''),
(10581, 'OTROS'													, 	''						, ''	,	''	,	''		,	'TI_DESCALIFICA'	,  10, true , 'COM' , ''),
																												
(10590, 'PIDIÓ DEVOLUCIÓN DE DINERO'							, 	''						, ''	,	''	,	''		,	'TI_ANULADO'		,  	1, true , 'COM' , ''),
(10591, 'SE TRASLADÓ ANTES DE INICIAR CLASES'					, 	''						, ''	,	''	,	''		,	'TI_ANULADO'		,  	2, true , 'COM' , ''),
(10592, 'MATRÍCULA DE PRUEBA'									, 	''						, ''	,	''	,	''		,	'TI_ANULADO'		,  	3, true , 'COM' , ''),
																																													
(10600, 'VANDALISMO Y/O VIOLENCIA '								, 	''						, ''	,	''	,	''		,	'TI_RETIRADO'		,  	7, true , 'COM' , ''),
(10601, 'DROGAS'												, 	''						, ''	,	''	,	''		,	'TI_RETIRADO'		,  	7, true , 'COM' , ''),
(10602, 'ALCOHOL'												, 	''						, ''	,	''	,	''		,	'TI_RETIRADO'		,  	7, true , 'COM' , ''),
(10603, 'PROBLEMAS DE CONDUCTA'									, 	''						, ''	,	''	,	''		,	'TI_RETIRADO'		,  	7, true , 'COM' , ''),
(10604, 'PROBLEMAS DE CONDUCTA'									, 	''						, ''	,	''	,	''		,	'TI_RETIRADO'		,  	7, true , 'COM' , ''),
																																						
(10610, 'MOTIVOS ECONÓMICOS'									, 	''						, ''	,	''	,	''		,	'TI_TRASLADO'		,  	7, true , 'COM' , ''),
(10611, 'MOTIVOS DE SALUD'										, 	''						, ''	,	''	,	''		,	'TI_TRASLADO'		,  	7, true , 'COM' , ''),
(10612, 'MOTIVOS FAMILIARES'									, 	''						, ''	,	''	,	''		,	'TI_TRASLADO'		,  	7, true , 'COM' , ''),
(10613, 'CAMBIO DE RESIDENCIA'									, 	''						, ''	,	''	,	''		,	'TI_TRASLADO'		,  	7, true , 'COM' , ''),
																																									
(10620, 'PRODUCCIÓN'											, 	'PRD'					, ''	,	''	,	''		,	'TI_UND_PROD'		,  	1, true , 'COM' , ''),
(10621, 'SERVICIO'												, 	'SER'					, ''	,	''	,	''		,	'TI_UND_PROD'		,  	2, true , 'COM' , ''),
(10622, 'COMERCIO'												, 	'COM'					, ''	,	''	,	''		,	'TI_UND_PROD'		,  	3, true , 'COM' , ''),
(10623, 'PROYECTO'												, 	'PRY'					, ''	,	''	,	''		,	'TI_UND_PROD'		,  	3, true , 'COM' , ''),
(10624, 'COMERCIO Y SERVICIO'									, 	'CSE'					, ''	,	''	,	''		,	'TI_UND_PROD'		,  	3, true , 'COM' , ''),
(10625, '<SIN INDICAR>'											, 	''						, ''	,	''	,	''		,	'TI_UND_PROD'		,  	4, true , 'COM' , ''),
																																										
(10630, 'RADIO'													, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10631, 'TELEVISIÓN'											, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10632, 'PERIÓDICO'												, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10633, 'VOLANTES'												, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10634, 'BANNER PUBLICITARIO'									, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10635, 'CINE'													, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10636, 'CORREO'												, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10637, 'GOOGLE'												, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10638, 'YOUTUBE'												, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10639, 'FACEBOOK'												, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10640, 'INSTAGRAM'												, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10641, 'WHATSAPP'												, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10642, 'TELEGRAM'												, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10643, 'TIKTOK'												, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10644, 'VISITA AL COLEGIO'										, 	'' 						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10645, 'RECOMENDACIÓN'											, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10646, 'YA ES CLIENTE'											, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	1, true , 'COM' , ''),
(10647, 'OTROS'													, 	''						, ''	,	''	,	''		,	'TI_PUBLICIDAD'		,  	2, true , 'COM' , ''),
																																					
(10680, 'SIN DESCUENTOS'										, 	''						, ''	,	''	,	''		,	'TI_DESCUENTOS'		,  	1, true , 'COM' , ''),
(10681, 'BECA'													, 	''						, ''	,	''	,	''		,	'TI_DESCUENTOS'		,  	2, true , 'COM' , ''),
(10682, 'BENEFICIOS DIVERSOS'									, 	''						, ''	,	''	,	''		,	'TI_DESCUENTOS'		,  	3, true , 'COM' , ''),
(10683, 'BONIFICACIONES / REGALOS'								, 	''						, ''	,	''	,	''		,	'TI_DESCUENTOS'		,  	4, true , 'COM' , ''),
(10684, 'CONVENIOS'												, 	''						, ''	,	''	,	''		,	'TI_DESCUENTOS'		,  	5, true , 'COM' , ''),
																															
						
(10730, 'BOBINAS'												, 	'4A'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10731, 'BALDE'													, 	'BJ'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10732, 'BARRILES'												, 	'BLL'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10733, 'BOLSA'													, 	'BG'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10734, 'BOTELLAS'												, 	'BO'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10735, 'CAJA'													, 	'BX'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10736, 'CARTONES'												, 	'CT'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10737, 'CENTIMETRO CUADRADO'									, 	'CMK'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10738, 'CENTIMETRO CUBICO'										, 	'CMQ'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10739, 'CENTIMETRO LINEAL'										, 	'CMT'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10740, 'CIENTO DE UNIDADES'									, 	'CEN'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10741, 'CILINDRO'												, 	'CY'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10742, 'CONOS'													, 	'CJ'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10743, 'DOCENA'												, 	'DZN'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10744, 'DOCENA POR 10**6'										, 	'DZP'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10745, 'FARDO'													, 	'BE'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10746, 'GALON INGLES(4,545956L)'								, 	'GLI'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10747, 'GRAMO'													, 	'GRM'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10748, 'GRUESA'												,	'GRO'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, false, 'COM' , ''),
(10749, 'HECTOLITRO'											, 	'HLT'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10750, 'HOJA'													, 	'LEF'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10751, 'JUEGO'													, 	'SET'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10752, 'KILOGRAMO'												, 	'KGM'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10753, 'KILOMETRO'												, 	'KTM'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10754, 'KILOVATIO HORA'										, 	'KWH'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10755, 'KIT'													, 	'KT'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10756, 'LATAS'													, 	'CA'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10757, 'LIBRAS'												, 	'LBR'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10758, 'LITRO'													, 	'LTR'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10759, 'MEGAWATT HORA'											, 	'MWH'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10760, 'METRO'													, 	'MTR'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10761, 'METRO CUADRADO'										, 	'MTK'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10762, 'METRO CUBICO'											, 	'MTQ'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10763, 'MILIGRAMOS'											, 	'MGM'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10764, 'MILILITRO'												, 	'MLT'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10765, 'MILIMETRO'												, 	'MMT'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10766, 'MILIMETRO CUADRADO'									, 	'MMK'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10767, 'MILIMETRO CUBICO'										, 	'MMQ'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10768, 'MILLARES'												, 	'MLL'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10769, 'MILLON DE UNIDADES'									, 	'UM'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10770, 'ONZAS'													, 	'ONZ'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10771, 'PALETAS'												, 	'PF'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10772, 'PAQUETE'												, 	'PK'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10773, 'PAR'													, 	'PR'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10774, 'PIES'													, 	'FOT'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10775, 'PIES CUADRADOS'										, 	'FTK'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10776, 'PIES CUBICOS'											, 	'FTQ'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10777, 'PIEZAS'												, 	'C62'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10778, 'PLACAS'												, 	'PG'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10779, 'PLIEGO'												, 	'ST'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10780, 'PULGADAS'												, 	'INH'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10781, 'RESMA'													, 	'RM'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10782, 'TAMBOR'												, 	'DR'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10783, 'TONELADA CORTA'										, 	'STN'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10784, 'TONELADA LARGA'										, 	'LTN'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10785, 'TONELADAS'												, 	'TNE'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10786, 'TUBOS'													, 	'TU'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10787, 'UNIDAD (BIENES)'										, 	'NIU'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	1, true , 'COM' , ''),
(10788, 'UNIDAD (SERVICIOS)'									, 	'ZZ'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	2, true , 'COM' , ''),
(10789, 'US GALON(3,7843L)'										, 	'GLL'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10790, 'YARDA'													, 	'YRD'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
(10791, 'YARDA CUADRADA'										, 	'YDK'					, ''	,	''	,	''		,	'TI_UND_MED'		,  	3, true , 'COM' , ''),
																															
(10810, 'SOL'													, 	'PEN'					, 'S/'	,	''	,	''		,	'TI_MONEDAS'		,  	1, true , 'COM' , ''),
(10811, 'DOLAR AMERICANO'										, 	'USD'					, '$'	,	''	,	''		,	'TI_MONEDAS'		,  	2, true , 'COM' , ''),
(10812, 'EURO'													, 	'EUR'					, '€'	,	''	,	''		,	'TI_MONEDAS'		,  	3, true , 'COM' , ''),
(10813, '<A ESCOGER>'											, 	''						, ''	,	''	,	''		,	'TI_MONEDAS'		,  	9, true , 'COM' , ''),
																																		 
*/



-- ============================================================================
-- TABLA: gen.empresa
-- ============================================================================
DROP TABLE IF EXISTS gen.empresa CASCADE;
CREATE TABLE gen.empresa (
	id_empresa			SERIAL			NOT NULL PRIMARY KEY,
	uuid_empresa		UUID			NOT NULL UNIQUE DEFAULT gen_random_uuid(),
	grupo_emp			VARCHAR(25)		NOT NULL,
	nom_empresa	 		VARCHAR(100)	NOT NULL,
	direccion			VARCHAR(100)	NOT NULL,
	telefonos			VARCHAR(100)	NOT NULL,
	ruc					VARCHAR(11)		NOT NULL,
	sunat_usu			VARCHAR(50)		NOT NULL,
	sunat_pwd			VARCHAR(50)		NOT NULL,
	activo				BOOLEAN			NOT NULL	
);
--
ALTER SEQUENCE gen.empresa_id_empresa_seq RESTART WITH 1007;
--
COMMENT ON TABLE gen.empresa IS 'Empresas que utilizan este sistema.'; 
COMMENT ON COLUMN gen.empresa.id_empresa IS 'Identificador de empresa.';
COMMENT ON COLUMN gen.empresa.uuid_empresa IS 'Identificador público UUID para la API.';
COMMENT ON COLUMN gen.empresa.grupo_emp IS 'Grupo empresarial.';
COMMENT ON COLUMN gen.empresa.nom_empresa IS 'Nombre oficial según SUNAT.';
COMMENT ON COLUMN gen.empresa.direccion IS 'Dirección fiscal.';
COMMENT ON COLUMN gen.empresa.telefonos IS 'Teléfonos.';
COMMENT ON COLUMN gen.empresa.ruc IS 'Número de RUC.';
COMMENT ON COLUMN gen.empresa.sunat_usu IS 'Usuario SOL para los comprobantes electrónicos.';
COMMENT ON COLUMN gen.empresa.sunat_pwd IS 'Contraseña SOL para los comprobantes electrónicos.';
COMMENT ON COLUMN gen.empresa.activo IS 'Indica si la empresa está activa o vigente.';
--
INSERT INTO gen.empresa (id_empresa, grupo_emp, nom_empresa, direccion, telefonos, ruc, sunat_usu, sunat_pwd, activo)
VALUES 
(1001, 'YUPANA'  , 'YUPANA STUDIO E.I.R.L.'                       , 'JR. SANTA ISABEL NRO. 2065 - EL TAMBO, HUANCAYO'			, '' 													, '20603133111', '', '' , true ),
(1002, 'SALOAYZA', 'YHA GIBU TAMMY GERALDINI'                     , 'JR. CUZCO NRO. 793 - HUANCAYO'                     		, '' 													, '10078230849', '', '' , true ),
(1003, 'SALOAYZA', 'SALAZAR LOAYZA MIGUEL ANGEL'                  , 'JR. FRANCISCO SOLANO NRO. 142 - URB. SAN CARLOS, HUANCAYO'	, '' 													, '10078268129', '', '' , true ),
(1004, 'SALOAYZA', 'CORPORACION EDUCATIVA SAN JUAN BOSCO S.A.C.'  , 'JR. CUZCO NRO. 779 - HUANCAYO'                    			, 'Tel. +51 064 233 789 | WhatsApp +51 971 036 002'		, '20133746278', '', '' , true ),
(1005, 'SABAL'   , 'GRUPO SABAL S.A.C.'                           , 'JR. MOQUEGUA NRO. 235 - HUANCAYO'                 			, '' 													, '20605817123', '', '' , true ),
(1006, 'LOSANDES', 'CAJA RURAL DE AHORRO Y CREDITO LOS ANDES S.A.', 'JR. JUNIN NRO. 129 - PUNO'                         		, '' 													, '20322445564', '', '' , false);



-- ============================================================================
-- TABLA: gen.var_global
-- ============================================================================
DROP TABLE IF EXISTS gen.var_global CASCADE;
CREATE TABLE gen.var_global (
	id_var_gb			SERIAL			NOT NULL PRIMARY KEY,
	id_empresa			INT				NOT NULL,
	id_sistema			CHAR(3)			NOT NULL CHECK (id_sistema IN ('COM','LGT','PER','FIN','CNT','ADM','COL','ACA','MED','BKA','GEN')),
	nom_var_gb			VARCHAR(25)		NOT NULL,
	valor				VARCHAR(100)	NOT NULL,
	descripcion			VARCHAR(100)	NOT NULL,
	UNIQUE (id_empresa, id_sistema, nom_var_gb),
	CONSTRAINT var_global_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES gen.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.var_global IS 'Variables globales. Se repite por cada empresa.';
COMMENT ON COLUMN gen.var_global.id_var_gb IS 'Identificador de la variable global.';
COMMENT ON COLUMN gen.var_global.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.var_global.id_sistema IS 'Identificador del sistema [GEN.SISTEMA].';
COMMENT ON COLUMN gen.var_global.nom_var_gb IS 'Nombre de la variable global. No modificar!';
COMMENT ON COLUMN gen.var_global.valor IS 'Valor en formato de texto. En la aplicación se tendrá que convertir adecuadamente.';
COMMENT ON COLUMN gen.var_global.descripcion IS 'Descripción de la variable global.';
--
INSERT INTO gen.var_global (id_empresa, id_sistema, nom_var_gb, valor, descripcion) 
VALUES 
(1001	, 'GEN',  'MinCarInput'			, '6'													, 'Mínimo de caracteres para ingresar cualquier texto'							),
(1002	, 'GEN',  'MinCarInput'			, '6'													, 'Mínimo de caracteres para ingresar cualquier texto'							),
(1003	, 'GEN',  'MinCarInput'			, '6'													, 'Mínimo de caracteres para ingresar cualquier texto'							),
(1004	, 'GEN',  'MinCarInput'			, '6'													, 'Mínimo de caracteres para ingresar cualquier texto'							),
(1005	, 'GEN',  'MinCarInput'			, '6'													, 'Mínimo de caracteres para ingresar cualquier texto'							),
(1006	, 'GEN',  'MinCarInput'			, '6'													, 'Mínimo de caracteres para ingresar cualquier texto'							),
				
(1001	, 'GEN',  'MinCarApeNoms'		, '3'													, 'Mínimo de caracteres para ingresar nombres o apellidos'						),
(1002	, 'GEN',  'MinCarApeNoms'		, '3'													, 'Mínimo de caracteres para ingresar nombres o apellidos'						),
(1003	, 'GEN',  'MinCarApeNoms'		, '3'													, 'Mínimo de caracteres para ingresar nombres o apellidos'						),
(1004	, 'GEN',  'MinCarApeNoms'		, '3'													, 'Mínimo de caracteres para ingresar nombres o apellidos'						),
(1005	, 'GEN',  'MinCarApeNoms'		, '3'													, 'Mínimo de caracteres para ingresar nombres o apellidos'						),
(1006	, 'GEN',  'MinCarApeNoms'		, '3'													, 'Mínimo de caracteres para ingresar nombres o apellidos'						),
		   
(1001	, 'GEN',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para realizar búsquedas'								),
(1002	, 'GEN',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para realizar búsquedas'								),
(1003	, 'GEN',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para realizar búsquedas'								),
(1004	, 'GEN',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para realizar búsquedas'								),
(1005	, 'GEN',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para realizar búsquedas'								),
(1006	, 'GEN',  'MinCarFind'			, '5'													, 'Mínimo de caracteres para realizar búsquedas'								),
		   
(1001	, 'GEN',  'NomsCorrido'			, 'true'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1002	, 'GEN',  'NomsCorrido'			, 'true'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1003	, 'GEN',  'NomsCorrido'			, 'true'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1004	, 'GEN',  'NomsCorrido'			, 'false'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1005	, 'GEN',  'NomsCorrido'			, 'false'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
(1006	, 'GEN',  'NomsCorrido'			, 'true'												, 'True. Exige que los nombre se escriban en un solo campo/columna.'			),
					
(1001	, 'GEN',  'DirsCorrido'			, 'true'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1002	, 'GEN',  'DirsCorrido'			, 'true'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1003	, 'GEN',  'DirsCorrido'			, 'true'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1004	, 'GEN',  'DirsCorrido'			, 'false'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1005	, 'GEN',  'DirsCorrido'			, 'false'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
(1006	, 'GEN',  'DirsCorrido'			, 'true'												, 'True. Exige que la dirección se escriba en un solo campo/columna'			),
					
(1001	, 'GEN',  'FindPersona'			, 'NDOC'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1002	, 'GEN',  'FindPersona'			, 'NDOC'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1003	, 'GEN',  'FindPersona'			, 'NDOC'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1004	, 'GEN',  'FindPersona'			, 'NOMS'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1005	, 'GEN',  'FindPersona'			, 'NOMS'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),
(1006	, 'GEN',  'FindPersona'			, 'NOMS'												, 'NDOC = Búsqueda por Doc. Identidad. NOMS=Búsqueda por nombres'				),

--por diseño los usuarios siempre seran trabajadores/estudiantes/familiares_estudiantes registrados 
(1001	, 'GEN',  'ReqUsuIsVigente'		, 'false'												, 'True (valida que tenga contrato vigente)'									),
(1002	, 'GEN',  'ReqUsuIsVigente'		, 'true'												, 'True (valida que tenga contrato vigente)'									),
(1003	, 'GEN',  'ReqUsuIsVigente'		, 'true'												, 'True (valida que tenga contrato vigente)'									),
(1004	, 'GEN',  'ReqUsuIsVigente'		, 'true'												, 'True (valida que tenga contrato vigente)'									),
(1005	, 'GEN',  'ReqUsuIsVigente'		, 'true'												, 'True (valida que tenga contrato vigente)'									),
(1006	, 'GEN',  'ReqUsuIsVigente'		, 'true'												, 'True (valida que tenga contrato vigente)'									),


(1001	, 'GEN',  'NumDecimales'		, '2'													, 'Número de decimales que se verá en los reportes'								),
(1002	, 'GEN',  'NumDecimales'		, '2'													, 'Número de decimales que se verá en los reportes'								),
(1003	, 'GEN',  'NumDecimales'		, '2'													, 'Número de decimales que se verá en los reportes'								),
(1004	, 'GEN',  'NumDecimales'		, '2'													, 'Número de decimales que se verá en los reportes'								),
(1005	, 'GEN',  'NumDecimales'		, '2'													, 'Número de decimales que se verá en los reportes'								),
(1006	, 'GEN',  'NumDecimales'		, '2'													, 'Número de decimales que se verá en los reportes'								);

/*
INSERT INTO gen.var_global (id_empresa, id_sistema, nom_var_gb, valor, descripcion) 
VALUES 

(1001	, 'COM',  'FacturaDiferida'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1002	, 'COM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1003	, 'COM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1004	, 'COM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1005	, 'COM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1006	, 'COM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1007	, 'COM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
(1008	, 'COM',  'HorasCambio'			, '3'													, 'Cantidad de horas permitidas para una fecha cambiada.'						),
	
		
	

(1001	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requiere que usuario este registrado previamente como familiar (colegio)'	),
(1002	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1003	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1004	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1005	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1006	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1007	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
(1008	, 'ADM',  'ReqUsuIsFam' 		, 'true'												, 'Requerir que usuario este registrado previamente como familiar (colegio)'	),
																																												
(1001	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requiere que usuario este registrado previamente como estudiante (academia)'	),
(1002	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1003	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1004	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1005	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1006	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1007	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),
(1008	, 'ADM',  'ReqUsuIsAlu' 		, 'true'												, 'Requerir que usuario este registrado previamente como estudiante (academia)'	),




(1001	, 'COM',  'MultiCampania'		, 'false'												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1002	, 'COM',  'MultiCampania'		, 'true '												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1003	, 'COM',  'MultiCampania'		, 'true '												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1004	, 'COM',  'MultiCampania'		, 'true '												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1005	, 'COM',  'MultiCampania'		, 'true '												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1006	, 'COM',  'MultiCampania'		, 'false'												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1007	, 'COM',  'MultiCampania'		, 'false'												, 'Sí se manejará múltiples campañas. Historial de precios .'					),
(1008	, 'COM',  'MultiCampania'		, 'true '												, 'Sí se manejará múltiples campañas. Historial de precios .'					);
*/ 


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



(1001	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1001/'		, 'Ruta para la foto del usuario de gen.sistema'),
(1002	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1002/'		, 'Ruta para la foto del usuario de gen.sistema'),
(1003	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1003/'		, 'Ruta para la foto del usuario de gen.sistema'),
(1004	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1004/'		, 'Ruta para la foto del usuario de gen.sistema'),
(1005	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1005/'		, 'Ruta para la foto del usuario de gen.sistema'),
(1006	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1005/'		, 'Ruta para la foto del usuario de gen.sistema'),
(1007	, 'GEN',  'UrlFotoUsu'			, 'https://yupanastudio.com/fotos-usuario/1005/'		, 'Ruta para la foto del usuario de gen.sistema'),

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



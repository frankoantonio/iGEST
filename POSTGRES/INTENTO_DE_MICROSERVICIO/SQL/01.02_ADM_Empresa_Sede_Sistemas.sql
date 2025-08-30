----------------------------------------------------------------------------------------------------------------------------------------
--adm.sede------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.sede;
CREATE TABLE adm.sede (
	id_sede			serial			NOT NULL PRIMARY KEY,
	id_padre		int				NOT NULL,
	id_empresa		int				NOT NULL,
	nivel			int 			NOT NULL,
	id_tipo_sede   	int				NOT NULL,
	nom_sede		varchar(50)		NOT NULL,
	dir_sede		varchar(100)	NOT NULL,
	id_distrito		char(6)			NOT NULL,
	activo			bool			NOT NULL,	
	sunat_oficial 	bool			NOT NULL,
	sunat_cod		varchar(10)		NOT NULL,
	fac_ele_ruta	varchar(250)	NOT NULL,
	fac_ele_token	varchar(250)	NOT NULL,
	latitud			varchar(25)		NOT NULL,
	longitud		varchar(25)		NOT NULL,
	orden			int				NOT NULL,		
	CONSTRAINT sede_id_distrito_fkey FOREIGN KEY (id_distrito) REFERENCES adm.distrito(id_distrito) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT sede_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES adm.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION 
);
ALTER SEQUENCE adm.sede_id_sede_seq RESTART WITH 31;
--
COMMENT ON TABLE adm.sede IS 'Lugares geográficos donde funciona la empresa.'; 
COMMENT ON COLUMN adm.sede.id_sede IS 'Identificador de la sede.';
COMMENT ON COLUMN adm.sede.id_padre IS 'Identificador de la sede padre. Valor -1 para indicar ninguno [ADM.SEDE].';
COMMENT ON COLUMN adm.sede.id_empresa IS 'Identificador de la empresa [ADM.EMPRESA].';
COMMENT ON COLUMN adm.sede.nivel IS 'Nivel dentro de cada empresa, empieza en uno.';
COMMENT ON COLUMN adm.sede.id_tipo_sede  IS 'Identificador del tipo de sede [TI_SEDE].';
COMMENT ON COLUMN adm.sede.nom_sede IS 'Código o nombre del local o sede.';
COMMENT ON COLUMN adm.sede.dir_sede IS 'Dirección, sí queda en blanco, se muestra dirección definido en empresa.';
COMMENT ON COLUMN adm.sede.id_distrito IS 'Identificador del distrito [ADM.DISTRITO].';
COMMENT ON COLUMN adm.sede.activo IS 'Indica si la sede está activo o vigente.';
COMMENT ON COLUMN adm.sede.sunat_oficial IS 'Si la sede esta registrado en la SUNAT.';
COMMENT ON COLUMN adm.sede.sunat_cod IS 'Código que asigna la SUNAT a las sedes.';
COMMENT ON COLUMN adm.sede.fac_ele_ruta IS 'Ruta para comprobantes electrónicos.';
COMMENT ON COLUMN adm.sede.fac_ele_token IS 'Token para comprobantes electrónicos.';
COMMENT ON COLUMN adm.sede.latitud IS 'Coordenada, latitud en google maps.';
COMMENT ON COLUMN adm.sede.longitud IS 'Coordenada, longitud en google maps.';
COMMENT ON COLUMN adm.sede.orden IS 'Orden en que se muestran.';
--
INSERT INTO adm.sede (id_sede, id_padre, id_empresa, nivel, id_tipo_sede, nom_sede, dir_sede, id_distrito, activo, sunat_oficial, sunat_cod, fac_ele_ruta, fac_ele_token, latitud, longitud, orden) 
VALUES 	
( 1,   -1,  1001,   1,  10014,  'LOCAL HUANCAYO'						, 'JR. SANTA ISABEL NRO. 2065 - URB. MIRAFLORES, EL TAMBO, HUANCAYO'	, '110113' , true , true  , ''	    , '', '' , '' , '' ,   1 ),	--YSST
( 2,   -1,  1002,   1,  10014,  'LOCAL HUANCAYO' 						, 'JR. CUZCO NRO. 793 - HUANCAYO'										, '110101' , true , true  , ''	    , '', '' , '' , '' ,   1 ),	--BAZAR
( 3,   -1,  1003,   1,  10014,  'LOCAL HUANCAYO'						, 'JR. FRANCISCO SOLANO NRO. 142 - URB. SAN CARLOS, HUANCAYO'			, '110101' , true , true  , ''	    , '', '' , '' , '' ,   1 ),	--EDITORIAL
( 4,   -1,  1004,   1,  10014,  'LOCAL CUZCO 779'						, 'JR. CUZCO NRO. 779 - HUANCAYO'										, '110101' , true , true  , ''	    , '', '' , '' , '' ,   1 ),	--COLEGIO
( 5,   -1,  1004,   1,  10014,  'LOCAL CUZCO 789'						, 'JR. CUZCO NRO. 789 - HUANCAYO'										, '110101' , true , true  , ''	    , '', '' , '' , '' ,   2 ),
( 6,   -1,  1004,   1,  10014,  'LOCAL JUNÍN 111'						, 'JR. JUNÍN NRO. 111 - HUANCAYO'										, '110101' , true , true  , ''	    , '', '' , '' , '' ,   3 ),
( 7,   -1,  1004,   1,  10014,  'LOCAL JUNÍN 215'						, 'JR. JUNÍN NRO. 215 - HUANCAYO'										, '110101' , true , true  , '0003'  , '', '' , '' , '' ,   4 ),
( 8,   -1,  1004,   1,  10014,  'LOCAL LIBERTAD 205'					, 'JR. LIBERTAD NRO. 205 - HUANCAYO'									, '110101' , true , true  , '0001'  , '', '' , '' , '' ,   5 ),
( 9,   -1,  1004,   1,  10014,  'LOCAL PUNO 555'						, 'JR. PUNO NRO. 555 - HUANCAYO'										, '110101' , true , true  , '0002'  , '', '' , '' , '' ,   6 ),
(10,   -1,  1005,   1,  10014,  'LOCAL HUANCAYO, CUZCO 779'				, 'JR. CUZCO NRO. 779 - HUANCAYO'										, '110101' , true , true  , '0007'  , '', '' , '' , '' ,   1 ),	--ACADEMIA
(11,   -1,  1005,   1,  10014,  'LOCAL HUANCAYO, JUNIN 215'				, 'Jr. JUNIN Nro. 215, Huancayo'										, '110101' , true , true  , '0009'  , '', '' , '' , '' ,   2 ),
(12,   -1,  1005,   1,  10014,  'LOCAL PAMPAS, NTRA. SEÑORA LOURDES'	, 'AV. PROGRESO N° 252. PAMPAS, TAYACAJA'								, '080501' , true , false , ''      , '', '' , '' , '' ,   3 ),
(13,   -1,  1005,   1,  10014,  'LOCAL JAUJA, VIRGEN CARMEN'			, 'JR. LA MAR N° 790. JAUJA'											, '110301' , true , true  , '0010'  , '', '' , '' , '' ,   4 ),
(14,   -1,  1006,   1,  10014,  'LOCAL CUZCO 779'						, 'JR. CUZCO NRO. 779 - HUANCAYO'										, '110101' , true , true  , '0011'  , '', '' , '' , '' ,   1 ),	--POLIDEPORTIVO
(15,   -1,  1006,   1,  10014,  'LOCAL PUNO 555'						, 'JR. PUNO NRO. 555, HUANCAYO'											, '110101' , true , true  , '0011'  , '', '' , '' , '' ,   2 ),
(16,   -1,  1007,   1,  10014,  'LOCAL HUANCAYO - 1RO DE MAYO'			, 'JR. AMAZONITAS NRO. 221 - COOP. 1RO DE MAYO, EL TAMBO, HUANCAYO'		, '110113' , true , true  , '0000'  , '', '' , '' , '' ,   2 ),	--CASS
(17,   -1,  1007,   1,  10014,  'LOCAL HUANCAYO - GUIDO'				, 'JR. GUIDO NRO. 757, HUANCAYO'										, '110101' , true , true  , '0001'  , '', '' , '' , '' ,   1 ),
(18,   -1,  1008,   1,  10014,  'LOCAL HUANCAYO - MOQUEGUA'				, 'JR. MOQUEGUA NRO. 235 - HUANCAYO'									, '110101' , true , true  , ''  	, '', '' , '' , '' ,   1 ),	--SABAL
(19,   -1,  1009,   1,  10010,  'PERÚ'									, 'JR. JUNIN NRO. 129 - PUNO'											, '080501' , true , true  , '0011'  , '', '' , '' , '' ,   1 ),	--CLA
(20,   19,  1009,   2,  10011,  'ZONA NORTE'							, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 100 ),
(21,   19,  1009,   2,  10011,  'ZONA CENTRO'							, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 200 ),
(22,   19,  1009,   2,  10011,  'ZONA SUR'								, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 300 ),
(23,   19,  1009,   2,  10011,  'ZONA ORIENTE'							, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 400 ),
(24,   21,  1009,   3,  10012,  'SEDE LIMA'								, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 210 ),
(25,   21,  1009,   3,  10012,  'SEDE HUANCAYO'							, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 220 ),
(26,   21,  1009,   3,  10012,  'SEDE TARMA'							, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 230 ),
(27,   25,  1009,   4,  10013,  'AGENCIA MERCADO'						, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 221 ),
(28,   25,  1009,   4,  10013,  'AGENCIA SAN CARLOS'					, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 222 ),
(29,   25,  1009,   4,  10013,  'AGENCIA CERCADO HYO'					, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 223 ),
(30,   29,  1009,   5,  10015,  'AGENCIA PARIAHUANCA'					, ''																	, '080501' , true , true  , '0011'  , '', '' , '' , '' , 224 );



----------------------------------------------------------------------------------------------------------------------------------------
--adm.sistema---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.sistema;
CREATE TABLE adm.sistema (
	id_sistema		char(3)			NOT NULL PRIMARY KEY,
	nom_sistema 	varchar(50)		NOT NULL,
	nom_corto		varchar(25)		NOT NULL,
	descripcion 	varchar(100)	NOT NULL,
	orden			int				NOT NULL
);
--
COMMENT ON TABLE adm.sistema IS 'Sistemas del ERP.'; 
COMMENT ON COLUMN adm.sistema.id_sistema IS 'Identificador del sistema.';
COMMENT ON COLUMN adm.sistema.nom_sistema IS 'Nombre del sistema.';
COMMENT ON COLUMN adm.sistema.nom_corto IS 'Nombre abreviado para la ruta API REST.';
COMMENT ON COLUMN adm.sistema.descripcion IS 'Descripción.';
COMMENT ON COLUMN adm.sistema.orden IS 'Orden en que se muestran.';
--
INSERT INTO adm.sistema (id_sistema, nom_sistema, nom_corto, descripcion, orden)
VALUES  
('COM', 'SISTEMA COMERCIAL'				, 'comercial'	,	'Ventas, Matrículas, Admisiones, Facturación Electrónica, Cobranza'					,10),
('LGT', 'SISTEMA LOGÍSTICO'				, 'logistico'	,	'Requerimientos, cotización, compras, facturación, almacén'							,15),
('PER', 'SISTEMA RECURSOS HUMANOS'		, 'personal'	,	'Escalafón, asistencia y remuneraciones, mesa de partes'							,20),
('FIN', 'SISTEMA FINANCIERO CONTABLE'	, 'financiero'	,	'Tesorería, Fondo Fijo, Pendientes, Conciliaciones'									,25),
('CNT', 'SISTEMA CONTABLE'				, 'contable'	,	'Registro de Ventas, Compras, AFP, ESSALUD, Patrimonio'								,30),
('COL', 'SISTEMA ACADÉMICO COLEGIO'		, 'colegio'		,	'Asistencia, Conducta, Evaluaciones, ETAS, EVAS, Comunicados, Psicológico, Médico'	,35),
('ACA', 'SISTEMA ACADÉMICO ACADEMIA'	, 'academia'	,	'Asistencia, ETAS, EVAS, Comunicados'												,40),
('MED', 'SISTEMA CLÍNICO MÉDICO'		, 'medico'		,	'Turnos, Citas, Triaje, Laboratorio, Historia, Nutrición'							,45),
('BKA', 'SISTEMA BANCA'					, 'banca'		,	'Turnos, Citas, Triaje, Laboratorio, Historia, Nutrición'							,50),
('ADM', 'SISTEMA DE CONTROL Y ACCESO'	, 'admin' 		, 	'Controles génericos, seguridad, catálogo, unidades orgánicas'						,95);



----------------------------------------------------------------------------------------------------------------------------------------
--adm.empresa_sistema-------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.empresa_sistema;
CREATE TABLE adm.empresa_sistema (
	id_emp_sis			serial		NOT NULL PRIMARY KEY,
	id_empresa			int			NOT NULL,
	id_sistema			char(3)		NOT NULL,
	activo 				bool		NOT NULL,
	CONSTRAINT empresa_sistema_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES adm.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT empresa_sistema_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES adm.sistema(id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.empresa_sistema IS 'Sistemas por cada empresa'; 
COMMENT ON COLUMN adm.empresa_sistema.id_emp_sis IS 'Identificador de entidad.';
COMMENT ON COLUMN adm.empresa_sistema.id_empresa IS 'Identificador de empresa [ADM.EMPRESA].';
COMMENT ON COLUMN adm.empresa_sistema.id_sistema IS 'Identificador de sistema [ADM.SISTEMA].';
COMMENT ON COLUMN adm.empresa_sistema.activo IS 'Sí el sistema está activo para la empresa.';
--
INSERT INTO adm.empresa_sistema (id_empresa, id_sistema, activo) 
VALUES 
( 1001, 'ADM', true),	--YSST
( 1001, 'COM', true),
( 1001, 'LGT', true),
( 1001, 'PER', true),
( 1001, 'FIN', true),
( 1001, 'CNT', true),
 
( 1002, 'ADM', true),	--BAZAR
( 1002, 'COM', true),	
( 1002, 'LGT', true),	
( 1002, 'FIN', true),
  
( 1003, 'ADM', true),	--EDITORIAL
( 1003, 'COM', true),	
( 1003, 'LGT', true),	
( 1003, 'FIN', true),	
  
( 1004, 'ADM', true),	--COLE
( 1004, 'COM', true),
( 1004, 'LGT', true),
( 1004, 'PER', true),
( 1004, 'FIN', true),
( 1004, 'CNT', true),
( 1004, 'COL', true),
 
( 1005, 'ADM', true),	--ACAD
( 1005, 'COM', true),
( 1005, 'LGT', true),
( 1005, 'PER', true),
( 1005, 'FIN', true),
( 1005, 'CNT', true),
( 1005, 'ACA', true),
  
( 1006, 'ADM', true),	--POLID
( 1006, 'COM', true),
( 1006, 'LGT', true),
( 1006, 'PER', true),
( 1006, 'FIN' , true),
( 1006, 'CNT', true),
  
( 1007, 'ADM', true),	--CASS
( 1007, 'COM', true),
( 1007, 'LGT', true),

( 1008, 'ADM', true),	--SABAL
( 1008, 'COM', true),
( 1008, 'LGT', true),
( 1008, 'PER', true),
( 1008, 'FIN', true),
( 1008, 'CNT', true),
( 1008, 'MED', true),

( 1009, 'ADM', true),	--CLA
( 1009, 'COM', true),
( 1009, 'LGT', true),
( 1009, 'PER', true),
( 1009, 'FIN', true),
( 1009, 'CNT', true),
( 1009, 'BKA', true);



----------------------------------------------------------------------------------------------------------------------------------------
--adm.perfil----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.perfil;
CREATE TABLE adm.perfil (
	id_perfil		int				NOT NULL PRIMARY KEY,
	id_sistema 		char(3) 		NOT NULL,
	nom_perfil 		varchar(50) 	NOT NULL,
	activo			boolean 		NOT NULL,
	id_tipo_empresa	int				NOT NULL,
	descripcion 	varchar(100) 	NOT NULL,
	id_empresa		int				NOT NULL,
	CONSTRAINT perfil_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES adm.sistema(id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.perfil IS 'Perfiles o roles de sistema.'; 
COMMENT ON COLUMN adm.perfil.id_perfil IS 'Identificador del perfil.';
COMMENT ON COLUMN adm.perfil.id_sistema IS 'Identificador del sistema [ADM.SISTEMA].';
COMMENT ON COLUMN adm.perfil.nom_perfil IS 'Nombre del perfil.';
COMMENT ON COLUMN adm.perfil.activo IS 'Indica si el perfil esta habilitado para utilizarse';
COMMENT ON COLUMN adm.perfil.id_tipo_empresa IS 'Para indicar el tipo de empresa [TI_EMPRESA].';
COMMENT ON COLUMN adm.perfil.descripcion IS 'Descripción del perfil.';
COMMENT ON COLUMN adm.perfil.id_empresa IS 'Para todas las empresas -1, sino identificador de empresa [ADM.EMPRESA].';
--
INSERT INTO adm.perfil (id_perfil, id_sistema, nom_perfil, activo, id_tipo_empresa, descripcion, id_empresa) 
VALUES  

(9501, 'ADM', 'PERFIL USUARIO'									,	true ,	95000,	'Usuarios, contraseña, baja/suspension, roles, historial, accesos, auditoria'	,  -1 ),
(9502, 'ADM', 'PERFIL ADMININISTRADOR DE SISTEMA'				,	true ,	95000,	'Autenticar, mi perfil, mi contraseña, busqueda personas'						,  -1 ),
(9503, 'ADM', 'PERFIL ROOT'										,	true ,	95000,	'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'	,  -1 ),
(9504, 'ADM', 'GERENTE GENERAL'									,	true ,	95000,	'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'	,  -1 ),
(9505, 'ADM', 'GERENTE ADMINISTRATIVO'							,	true ,	95000,	'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'	,  -1 ),
(9506, 'ADM', 'DIRECTOR GENERAL'								,	true ,	95000,	'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'	,  -1 ),
	
(1001, 'COM', 'PERFIL INFORMES'									,	true ,	95000,	'Atención al cliente. Pre Ventas. Post Ventas. Cronogramas. Admisión'			,  -1 ),
(1002, 'COM', 'PERFIL ASISTENTE DE VENTAS'						,	true ,	95000,	'Atención al cliente. Pre Ventas. Post Ventas. Cronogramas.'					,  -1 ),
(1003, 'COM', 'PERFIL ASISTENTE DE FACTURACIÓN'					,	true ,	95000,	'Facturas. Notas de crédito. Boletaje. Anulaciones. Envío comprobantes.'		,  -1 ),
(1004, 'COM', 'PERFIL ASISTENTE DE CAJA'						,	true ,	95000,	'Cobranza. Anulaciones. Apertura/Cierre. Retiros. Pérdidas. Tmb. Facturación'	,  -1 ),
(1005, 'COM', 'PERFIL SUPERVISOR DE VENTAS'						,	true ,	95000,	'Comisiones. Metas. Seguimiento de ventas. Visto bueno autorizaciones'			,  -1 ),
(1006, 'COM', 'PERFIL SUPERVISOR DE FACTURACIÓN'				,	true ,	95000,	'Consistencia comprobantes. Pendientes. Prorrogas. Modificar. REGVENTAS'		,  -1 ),
(1007, 'COM', 'PERFIL SUPERVISOR DE COBRANZA'					,	true ,	95000,	'Consistencia comprobantes. Resumenes entrega de dinero.'						,  -1 ),
(1008, 'COM', 'PERFIL GESTOR COMERCIAL'							,	true ,	95000,	'Reportes gerenciales. Autorización: Descuentos. Prorrogas'						,  -1 ),
																	
(1501, 'LGT', 'PERFIL REQUIRIENTE'								,	true ,	95000,	'Si no pueden hacer requerimientos cada personal, hay un responsable'			,  -1 ),
(1502, 'LGT', 'PERFIL ASISTENTE DE COTIZACIONES'				,	true ,	95000,	'Informes al cliente, cotizaciones, proforma, seguimiento al cliente'			,  -1 ),
(1503, 'LGT', 'PERFIL ASISTENTE DE ALMACÉN'						,	true ,	95000,	'Apoyo en almacen, Nota pedido, matr, benef, kardex, valorizado, promedio'		,  -1 ),
(1504, 'LGT', 'PERFIL ASISTENTE DE ABASTECIMIENTO'				,	true ,	95000,	'Contratos, cotizaciones, compras, abastecimento, flete'						,  -1 ),
(1505, 'LGT', 'PERFIL ASISTENTE DE CAJA - COMPRAS'				,	true ,	95000,	'Cobranza. Anulaciones. Apertura/Cierre. Retiros. Pérdidas'						,  -1 ),
(1506, 'LGT', 'PERFIL SUPERVISOR LOGÍSTICO'						,	true ,	95000,	'Catalogo. verificar compras. salidas de almacen. REGISTRO COMPRAS'				,  -1 ),
(1507, 'LGT', 'PERFIL GESTOR LOGÍSTICO'							,	true ,	95000,	'Distribir trimestral los bienes. Plan anual. Programacion trimestral'			,  -1 ),
																	
(2001, 'PER', 'PERFIL ASISTENTE DE ESCALAFÓN'					,	true ,	95000,	'Informes al cliente, cotizaciones, proforma, seguimiento al cliente'			,  -1 ),
(2002, 'PER', 'PERFIL ASISTENTE DE REMUNERACIONES'				,	true ,	95000,	'Contratos y remuneracion. Notas de pedido, cronograma, req.  beneficio'		,  -1 ),
(2003, 'PER', 'PERFIL ASISTENTE DE BIENESTAR SOCIAL'			,	true ,	95000,	'Bienestar social. capacitaciones. alimentos.'									,  -1 ),
(2004, 'PER', 'PERFIL ASISTENTE DE SEGURIDAD SALUD HIGIENE'		,	true ,	95000,	'RR INDUSTRIALES, SEGURIDAD, SALUD, HIGIENE OCUPACIONAL'						,  -1 ),
(2005, 'PER', 'PERFIL GESTOR LABORAL'							,	true ,	95000,	'Reportes gerenciales, autorizaciones'											,  -1 ),
																
(2501, 'FIN', 'PERFIL ASISTENTE DE TESORERÍA'					,	true ,	95000,	'OTROS INGRESOS. ARQUEO CAJA. RECEPCION DINERO. PRESUPESTO DE INGRESOS'			,  -1 ),
(2502, 'FIN', 'PERFIL ASISTENTE DE PAGADURÍA'					,	true ,	95000,	'PAGO COMPRAS. PAGO REMUNERACIONES. CUADRE PAGOS. PSP EGRESOS'					,  -1 ),
(2503, 'FIN', 'PERFIL ASISTENTE DE FONDO FIJO'					,	true ,	95000,	'INGRESOS. RETIROS. COMPRAS. ADELANTOS. MOVILIDAD, VIATICOS. ALIMNETACIÓN'		,  -1 ),
(2504, 'FIN', 'PERFIL ASISTENTE FINANCIERO'						,	true ,	95000,	'CONTROL PRESUPUESTAL. ADELANTOS. VIATICOS. INVERSIONES. FINANCIEROS.'			,  -1 ),
(2505, 'FIN', 'PERFIL ASISTENTE CONTABLE'						,	true ,	95000,	'PATRIMONIO. REGVEN. REGCOMPRAS. FORMATOS SUNAT.'								,  -1 ),
(2506, 'FIN', 'PERFIL GESTOR FINANCIERO'						,	true ,	95000,	'AUTORIZACIONES. MODIFICAR. ELIMINAR. CUADRES DIARIOS. MENSUALES. ANUALES'		,  -1 ),
																	
(3001, 'CNT', 'PERFIL ASISTENTE DE TESORERÍA'					,	true ,	95000,	'OTROS INGRESOS. ARQUEO CAJA. RECEPCION DINERO. PRESUPESTO DE INGRESOS'			,  -1 ),
(3002, 'CNT', 'PERFIL ASISTENTE DE PAGADURÍA'					,	true ,	95000,	'PAGO COMPRAS. PAGO REMUNERACIONES. CUADRE PAGOS. PSP EGRESOS'					,  -1 ),
(3003, 'CNT', 'PERFIL ASISTENTE DE FONDO FIJO'					,	true ,	95000,	'INGRESOS. RETIROS. COMPRAS. ADELANTOS. MOVILIDAD, VIATICOS. ALIMNETACIÓN'		,  -1 ),

(3501, 'COL', 'PERFIL AUXILIAR'									,	true ,	95001,	'ASISTENCIA. MERITOS/DEMERITOS. LLAMADAS. COMUNICADOS. OBSERVACION TUTOR'		,  -1 ),
(3502, 'COL', 'PERFIL DOCENTE'									,	true ,	95001,	'EVALUACIONES. TAREAS. COMUNICADOS'												,  -1 ),
(3503, 'COL', 'PERFIL ASISTENTE ACADÉMICO'						,	true ,	95001,	'EVALUACIONES Y MATRÍCULAS'														,  -1 ), 
(3504, 'COL', 'PERFIL ENFERMERO'								,	true ,	95001,	'ATENCIONES PSICOLOGICAS. OBSERVACIONES. RECOMENDACIONES. CITAS'				,  -1 ), 
(3505, 'COL', 'PERFIL PSICOLOGO'								,	true ,	95001,	'ATENCIÓN MEDICA. OBSERVACIONES. CITAS'											,  -1 ),
(3506, 'COL', 'PERFIL BIBLIOTECARIO'							,	true ,	95001,	'PRESTAMO DE LIBROS. CATALOGO.'													,  -1 ),
(3507, 'COL', 'PERFIL TAREADOR'									,	true ,	95001,	'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(3508, 'COL', 'PERFIL GESTOR ACADÉMICO'							,	true ,	95001,	'ESTADISTICAS ACADEMICAS. COMUNICADOS'											,  -1 ),

(4001, 'ACA', 'PERFIL TUTOR'									,	true ,	95002,	'ASISTENCIA. ETAS. EVAS. LLAMADAS. COMUNICADOS'									,  -1 ),
(4002, 'ACA', 'PERFIL TAREADOR'									,	true ,	95002,	'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(4003, 'ACA', 'PERFIL SUPERVISOR'								,	true ,	95002,	'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(4004, 'ACA', 'PERFIL CORDINADOR ACADÉMICO'						,	true ,	95002,	'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),

(4501, 'MED', 'PERFIL PROGRAMACIÓN DE HORARIOS'					,	true ,	95003,	'ASISTENCIA. ETAS. EVAS. LLAMADAS. COMUNICADOS'									,  -1 ),
(4502, 'MED', 'PERFIL PROFESIONALES'							,	true ,	95003,	'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(4503, 'MED', 'PERFIL TIPOS DE PROFESIONALES'					,	true ,	95003,	'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(4504, 'MED', 'PERFIL MEDICINA GNERAL'							,	true ,	95003,	'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(4505, 'MED', 'PERFIL NUTRICIÓN'								,	true ,	95003,	'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(4506, 'MED', 'PERFIL GINECOLOGÍA'								,	true ,	95003,	'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(4507, 'MED', 'PERFIL UROLOGÍA'									,	true ,	95003,	'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(4508, 'MED', 'PERFIL TRIAJE'									,	true ,	95003,	'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),

(5001, 'BKA', 'PERFIL ANALISTA'									,	true ,	95004,	'ASISTENCIA. ETAS. EVAS. LLAMADAS. COMUNICADOS'									,  -1 ),
(5002, 'BKA', 'PERFIL OPERACIONES'								,	true ,	95004,	'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(5003, 'BKA', 'PERFIL SUPERVISOR'								,	true ,	95004,	'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(5004, 'BKA', 'PERFIL JEFE DE OPERACIONES'						,	true ,	95004,	'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 );




/*
----------------------------------------------------------------------------------------------------------------------------------------
--adm.opcion----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.opcion;
CREATE TABLE adm.opcion (
	id_opcion 		int 		NOT NULL PRIMARY KEY,	
	id_padre 		int 		NOT NULL,
	id_sistema		char(3)		NOT NULL,	
	nivel			int			NOT NULL,
	nom_opcion 		varchar(50) NOT NULL,
	nom_control 	varchar(95) NOT NULL,
	orden 			int 		NOT NULL,
	id_tipo_opcion 	int 	 	NOT NULL,	
	id_tipo_empresa	int			NOT NULL,	
	activo 			bool 		NOT NULL,
	premium 		bool 		NOT NULL,
	id_empresa 		int 		NOT NULL,
	CONSTRAINT opcion_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES adm.sistema(id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.opcion IS 'Opciones de cada perfil de sistema.'; 
COMMENT ON COLUMN adm.opcion.id_opcion IS 'Identificador de la opción';
COMMENT ON COLUMN adm.opcion.id_padre IS 'Identificador de la opción superior, si no va -1.';
COMMENT ON COLUMN adm.opcion.id_sistema IS 'Identificador del sistema [ADM.SISTEMA].';
COMMENT ON COLUMN adm.opcion.nivel IS 'Determina el nivel [1,2,3...] de las opciones.'; 
COMMENT ON COLUMN adm.opcion.nom_opcion IS 'Nombre de la opción.';
COMMENT ON COLUMN adm.opcion.nom_control IS 'Ruta o nombre del control de usuario.';
COMMENT ON COLUMN adm.opcion.orden IS 'Orden en que se mostraran las opciones.';
COMMENT ON COLUMN adm.opcion.id_tipo_opcion IS 'Identificador del tipo de opcion [TI_OPCION_SIS].';
COMMENT ON COLUMN adm.opcion.id_tipo_empresa IS 'Identificador del tipo de empresa [TI_EMPRESA].';
COMMENT ON COLUMN adm.opcion.activo IS 'Si la opción esta activo o vigente.';
COMMENT ON COLUMN adm.opcion.premium IS 'Indica sí es una opción para clientes premium.';
COMMENT ON COLUMN adm.opcion.id_empresa IS 'Para todas las empresas -1, sino identificador de empresa [ADM.EMPRESA].';
--
INSERT INTO adm.opcion (id_opcion, id_padre, id_sistema, nivel, nom_opcion, nom_control, orden, id_tipo_opcion, id_tipo_empresa, activo, premium, id_empresa) 
VALUES 
-- opciones de rol usuario 
(9501001,	     -1,  'ADM',  1, 'DATOS DE USUARIO'							, 'UcArticulos'									,  1,     95050 ,	95000 , true , false ,   -1 ),
(9501002,	9501001,  'ADM',  2, 'Perfil de usuario'						, 'UcCategorias'								,  5,     95051 ,	95000 , true , false ,   -1 ),
(9501003,	9501001,  'ADM',  2, 'Mis roles y accesos'						, 'UcCampania'									, 10,     95051 ,	95000 , true , false ,   -1 ),
(9501004,	9501001,  'ADM',  2, 'Mis solicitudes y utorizaciones'			, 'UcCampaniaConf'								, 15,     95051 ,	95000 , true , false ,   -1 ),
-- admin sis                                          	                	                                                                    
(9502001,	     -1,  'ADM',  1, 'ADMINISTRACIÓN DE USUARIOS'				, ''											, 20,     95050 ,	95000 , true , false ,   -1 ),
(9502002,	9502001,  'ADM',  2, 'Usuarios y contraseña'					, '/com/polaris/app/gen/FrmBuscarDirección'		, 25,     95051 ,	95000 , true , false ,   -1 ),
(9502003,	9502001,  'ADM',  2, 'Asignar usuarios y perfiles'				, '/com/polaris/app/gen/FrmBuscarDirección'		, 30,     95051 ,	95000 , true , false ,   -1 ),
(9502004,	9502001,  'ADM',  2, 'REPORTES'									, 'UcUsuariosNegSis'							, 35,     95051 ,	95000 , true , false ,   -1 ),
(9502005,	9502001,  'ADM',  2, 'Reportes1'								, '/com/polaris/app/gen/FrmBuscarUbigeo'		, 40,     95051 ,	95000 , true , false ,   -1 ),
(9502006,	9502001,  'ADM',  2, 'Reportes2'								, '/com/polaris/app/gen/FrmBuscarUbigeo'		, 45,     95051 ,	95000 , true , false ,   -1 ),
(9502007,	9502001,  'ADM',  2, 'Reportes3'								, '/com/polaris/app/gen/FrmBuscarUbigeo'		, 50,     95051 ,	95000 , true , false ,   -1 ),
--					  		  																									           	    
(9502008,        -1,  'ADM',  1, 'OTRAS OPERACIONES'						, 'UcInformes'									, 55,     95050 ,	95000 , true , false ,   -1 ),
(9502009,	9502001,  'ADM',  2, 'Cajeros'									, 'UcInscripcionCole'							, 60,     95051 ,	95000 , true , false ,   -1 ),
(9502010,	9502001,  'ADM',  2, 'Supervisores'								, 'UcInscripcionAcad'							, 65,     95051 ,	95000 , true , false ,   -1 ),
(9502011,	9502001,  'ADM',  2, 'Gestores'									, 'UcEstudianteAcad'							, 70,     95051 ,	95000 , true , false ,   -1 ),
-- superusuario				  																		                           	                
(9503001,	     -1,  'ADM',  1, 'SUPER USUARIO'							, ''											, 80,     95050 ,	95000 , true , false ,   -1 ),
(9503002,	9503001,  'ADM',  2, 'Variables Globales'						, 'UcGbVars'									, 81,     95051 ,	95000 , true , false ,   -1 ),
(9503003,	9503001,  'ADM',  2, 'Datos "Tipo"'								, 'UcTipos'										, 82,     95051 ,	95000 , true , false ,   -1 ),
(9503004,	9503001,  'ADM',  2, 'Empresas y Sedes'							, 'UcEmpresas'									, 83,     95051 ,	95000 , true , false ,   -1 ),
(9503005,	9503001,  'ADM',  2, 'Usuarios'									, 'UcUsuarios'									, 84,     95051 ,	95000 , true , false ,   -1 ),
(9503006,	9503001,  'ADM',  2, 'Usuarios y roles'							, 'UcNegocios'									, 85,     95051 ,	95000 , true , false ,   -1 ),
(9503007,	9503001,  'ADM',  2, 'Trabajadores'								, 'UcTrabajador'								, 86,     95051 ,	95000 , true , false ,   -1 ),
																																     
-- informes                                                             	                                                                    
(1001001,	     -1,  'COM',  1, 'VENTAS'									, ''											,  1,     95050 ,	95000 , true , false ,   -1 ),
(1001002,	1001001,  'COM',  2, 'Informes'									, '/app/comercial/PnlInformesVta.fxml'			,  5,     95051 ,	95000 , false, false ,   -1 ),
(1001003,	1001001,  'COM',  2, 'Nota de pedido'							, '/app/comercial/PnlNotaPedido.fxml'			, 10,     95051 ,	95000 , true , false ,   -1 ),
-- vendedor                                         	                	                                                                    
(1002001,	     -1,  'COM',  1, 'VENTAS'									, ''											,  1,     95050 ,	95000 , true , false ,   -1 ),
(1002002,	1002001,  'COM',  2, 'Informes'									, '/app/comercial/PnlInformesVta.fxml'			,  5,     95051 ,	95000 , false, false ,   -1 ),
(1002003,	1002001,  'COM',  2, 'Nota de pedido'							, '/app/comercial/PnlNotaPedido.fxml'			, 10,     95051 ,	95000 , true , false ,   -1 ),
(1002004,	1002001,  'COM',  2, 'Inscripción colegio'						, '/app/comercial/PnlInsColegio.fxml'			, 15,     95051 ,	95000 , true , false ,   -1 ),
(1002005,	1002001,  'COM',  2, 'Inscripción academia'						, '/app/comercial/PnlInsAcademia.fxml'			, 20,     95051 ,	95000 , true , false ,   -1 ),
(1002006,	1002001,  'COM',  2, 'Cronograma de pagos'						, '/app/comercial/PnlCronograma.fxml'			, 25,     95051 ,	95000 , false, false ,   -1 ),
(1002007,	1002001,  'COM',  2, 'Control de informes y ventas'				, '/app/comercial/PnlCtrlVTA.fxml'				, 30,     95051 ,	95000 , false, false ,   -1 ),
--                                                              	    	                                                               	    
(1002008,	1002001,  'COM',  1, 'Reportes'									, '/app/comercial/PnlReporteVentas'				, 35,     95050 ,	95000 , true , false ,   -1 ),
(1002009,	1002001,  'COM',  2, 'Resumen de informes'						, 'xxx.jasper'									, 40,     95051 ,	95000 , true , false ,   -1 ),
(1002010,	1002001,  'COM',  2, 'Resumen de ventas'						, 'xxx.jasper'									, 45,     95051 ,	95000 , false, false ,   -1 ),
(1002011,	1002001,  'COM',  2, 'Resumen de rebotes'						, 'xxx.jasper'									, 50,     95051 ,	95000 , false, false ,   -1 ),
-- rol facturador                                       	            	                                                                    
(1003001,	     -1,  'COM',  1, 'FACTURACIÓN'								, ''											, 55,     95050 ,	95000 , true , false ,   -1 ),
(1003002,	1003001,  'COM',  2, 'Facturación directa'						, '/app/comercial/PnlFactDirecta.fxml'			, 60,     95051 ,	95000 , true , false ,   -1 ),
(1003003,	1003001,  'COM',  2, 'Facturación con nota de pedido'			, '/app/comercial/PnlFactNotaPedido.fxml'		, 65,     95051 ,	95000 , true , false ,   -1 ),
(1003004,	1003001,  'COM',  2, 'Facturación con cronograma pagos'			, '/app/comercial/PnlFactCronograma.fxml'		, 70,     95051 ,	95000 , false, false ,   -1 ),
(1003005,	1003001,  'COM',  2, 'Facturación de alquileres'				, '/app/comercial/PnlFactAlquiler.fxml'			, 95,     95051 ,	95000 , false, false ,   -1 ),
(1003006,	1003001,  'COM',  2, 'Boletaje'									, '/app/comercial/PnlBoletaje.fxml'				, 80,     95051 ,	95000 , false, false ,   -1 ),
(1003007,	1003001,  'COM',  2, 'Nota de crédito'							, '/app/comercial/PnlNotaCredito.fxml'			, 85,     95051 ,	95000 , true , false ,   -1 ),
(1003008,	1003001,  'COM',  2, 'Solicita anulación de comprobante'		, '/app/comercial/PnlSolAnulaComp.fxml'			, 90,     95051 ,	95000 , false, false ,   -1 ),
(1003009,	1003001,  'COM',  2, 'Solicita eliminación comprobante'			, '/app/comercial/PnlSolEliminaComp.fxml'		, 95,     95051 ,	95000 , false, false ,   -1 ),
(1003010,	1003001,  'COM',  2, 'Control de comprobantes'					, '/app/comercial/PnlCtrlFAC.fxml'				,100,     95051 ,	95000 , false, false ,   -1 ),
--                                                                    		                                                                   	
(1003011,	1003001,  'COM',  1, 'Reportes'									, 'xxx.jasper'									,105,     95050 ,	95000 , true , false ,   -1 ),
(1003012,	1003001,  'COM',  2, 'Comprobantes emitidos'					, 'xxx.jasper'									,110,     95051 ,	95000 , true , false ,   -1 ),
(1003013,	1003001,  'COM',  2, 'Comprobantes anulados'					, 'xxx.jasper'									,115,     95051 ,	95000 , true , false ,   -1 ),
(1003014,	1003001,  'COM',  2, 'Comprobantes modificados'					, 'xxx.jasper'									,120,     95051 ,	95000 , true , false ,   -1 ),
-- rol caja                                              	            	                                                                    
(1004001,	     -1,  'COM',  1, 'COBRANZA'									, ''	 										,125,     95050 ,	95000 , true , false ,   -1 ),
(1004002,	1004001,  'COM',  2, 'Cobranzas'								, '/app/comercial/PnlCobranzaCliente.fxml'		,130,     95051 ,	95000 , true , false ,   -1 ),
(1004003,	1004001,  'COM',  2, 'Solicita anulación de cobranza'			, '/app/comercial/UctSegCliente'				,135,     95051 ,	95000 , false, false ,   -1 ),
(1004004,	1004001,  'COM',  2, 'Caja - Apertura e ingresos'				, '/app/comercial/UctSegCliente'				,140,     95051 ,	95000 , false, false ,   -1 ),
(1004005,	1004001,  'COM',  2, 'Caja - Cierre y egresos'					, '/app/comercial/UctSegCliente'				,145,     95051 ,	95000 , false, false ,   -1 ),
(1004006,	1004001,  'COM',  2, 'Caja - Perdidas y robos'					, '/app/comercial/UctSegCliente'				,150,     95051 ,	95000 , false, false ,   -1 ),
(1004007,	1004001,  'COM',  2, 'Solicita anulación entrega dinero'		, '/app/comercial/UctSegCliente'				,155,     95051 ,	95000 , false, false ,   -1 ),
--                                                            	        	                                                                    
(1004008,	1004001,  'COM',  1, 'Reportes'									, 'xxx.jasper'									,160,     95050 ,	95000 , true , false ,   -1 ),
(1004009,	1004001,  'COM',  2, 'Cobranzas por caja'						, 'xxx.jasper'									,165,     95051 ,	95000 , true , false ,   -1 ),
(1004010,	1004001,  'COM',  2, 'Cobranzas por usuario'					, 'xxx.jasper'									,170,     95051 ,	95000 , true , false ,   -1 ),
-- supervisor ventas                                         	        	                                                                    
(1005001,	     -1,  'COM',  1, 'SUPERVISIÓN VENTAS'						, 'com.yupana.polaris.app.FrmAlumno'			,195,     95050 ,	95000 , true , false ,   -1 ),
(1005002,	1005001,  'COM',  2, 'Registrar alumno academia'				, 'com.yupana.polaris.app.FrmAlumno'			,180,     95051 ,	95000 , true , false ,   -1 ),
(1005003,	1005001,  'COM',  2, 'Registrar familiar colegio'				, 'com.yupana.polaris.app.FrmFamiliar'			,185,     95051 ,	95000 , true , false ,   -1 ),
(1005004,	1005001,  'COM',  2, 'Registrar cliente'						, 'com.yupana.polaris.app.Frmcliente'			,190,     95051 ,	95000 , true , false ,   -1 ),
(1005005,	1005001,  'COM',  2, 'Registrar contacto'						, 'com.yupana.polaris.app.FrmContactoMnt'		,195,     95051 ,	95000 , true , false ,   -1 ),
(1005006,	1005001,  'COM',  2, 'Registrar dirección'						, 'com.yupana.polaris.app.FrmDireccion'			,200,     95051 ,	95000 , true , false ,   -1 ),
(1005007,	1005001,  'COM',  2, 'Registrar ubigeo'							, 'com.yupana.polaris.app.FrmDireccion'			,205,     95051 ,	95000 , true , false ,   -1 ),
(1005008,	1005001,  'COM',  2, 'Registrar grupo familiar'					, 'com.yupana.polaris.app.FrmDireccion'			,210,     95051 ,	95000 , true , false ,   -1 ),
--                                                        	            	                                                                    
(1005009,	1005001,  'COM',  1, 'Reportes'									, 'xxx.jasper'									,215,     95050 ,	95000 , true , false ,   -1 ),
(1005010,	1005001,  'COM',  2, 'Reporte de cuotas'						, 'xxx.jasper'									,220,     95051 ,	95000 , true , false ,   -1 ),
(1005011,	1005001,  'COM',  2, 'Reporte de ventas'						, 'xxx.jasper'									,225,     95051 ,	95000 , true , false ,   -1 ),
-- supervisor de facturacion                                    	                                                                            
(1006001,	     -1,  'COM',  1, 'SUPERVISIÓN FACTURACIÓN'					, 'com.yupana.polaris.app.UctSegCliente'		,230,     95050 ,	95000 , true , false ,   -1 ),
(1006002,	1006001,  'COM',  2, 'Cierre de caja'							, 'com.yupana.polaris.app.UctSegCliente'		,235,     95051 ,	95000 , true , false ,   -1 ),
(1006003,	1006001,  'COM',  2, 'Campañas, cronogramas y precios'			, 'com.yupana.polaris.app.UctSegCliente'		,240,     95051 ,	95000 , true , false ,   -1 ),
(1006004,	1006001,  'COM',  2, 'Prorrogas'								, 'com.yupana.polaris.app.UctSegCliente'		,245,     95051 ,	95000 , true , false ,   -1 ),
																																     
(1006005,	1006001,  'COM',  1, 'Reportes'									, 'xxx.jasper'									,250,     95050 ,	95000 , true , false ,   -1 ),
(1006006,	1006001,  'COM',  2, 'Reporte de cuotas'						, 'xxx.jasper'									,255,     95051 ,	95000 , true , false ,   -1 ),
(1006007,	1006001,  'COM',  2, 'Reporte de ventas'						, 'xxx.jasper'									,260,     95051 ,	95000 , true , false ,   -1 ),
-- rol supervisor de cobranza                                       	                                                                        
(1007001,	     -1,  'COM',  1, 'SUPERVISIÓN COBRANZA'						, 'com.yupana.polaris.app.UctSegCliente'		,265,     95050 ,	95000 , true , false ,   -1 ),
(1007002,	1007001,  'COM',  2, 'Cierre de caja'							, 'com.yupana.polaris.app.UctSegCliente'		,270,     95051 ,	95000 , true , false ,   -1 ),
(1007003,	1007001,  'COM',  2, 'Campañas, cronogramas y precios'			, 'com.yupana.polaris.app.UctSegCliente'		,295,     95051 ,	95000 , true , false ,   -1 ),
(1007004,	1007001,  'COM',  2, 'Prorrogas'								, 'com.yupana.polaris.app.UctSegCliente'		,280,     95051 ,	95000 , true , false ,   -1 ),
--					  						  																	                                
(1007005,	1007001,  'COM',  1, 'Reportes'									, 'xxx.jasper'									,285,     95050 ,	95000 , true , false ,   -1 ),
(1007006,	1007001,  'COM',  2, 'Reporte de cuotas'						, 'xxx.jasper'									,290,     95051 ,	95000 , true , false ,   -1 ),
(1007007,	1007001,  'COM',  2, 'Reporte de ventas'						, 'xxx.jasper'									,295,     95051 ,	95000 , true , false ,   -1 ),
-- opciones de gestor comercial                                     	                                          	                            
(1008001,	     -1,  'COM',  1, 'GESTIÓN COMERCIAL'						, 'com.yupana.polaris.app.UctSegCliente'		,300,     95050 ,	95000 , true , false ,   -1 ),
(1008002,	1008001,  'COM',  2, 'Cajas, cajeros, comprobantes'				, 'com.yupana.polaris.app.UctSegCliente'		,305,     95051 ,	95000 , true , false ,   -1 ),
(1008003,	1008001,  'COM',  2, 'Precios/Descuentos x Art./Campaña'		, 'com.yupana.polaris.app.UctSegCliente'		,310,     95051 ,	95000 , true , false ,   -1 ),
(1008004,	1008001,  'COM',  2, 'Campañas'									, 'com.yupana.polaris.app.UctSegCliente'		,315,     95051 ,	95000 , true , false ,   -1 ),
(1008005,	1008001,  'COM',  2, 'Establecer numeración'					, 'com.yupana.polaris.app.UctSegCliente'		,320,     95051 ,	95000 , true , false ,   -1 ),
--                                                                                                                                              
(1008006,	1008001,  'COM',  1, 'Reportes'									, 'xxx.jasper'									,325,     95050 ,	95000 , true , false ,   -1 ),
(1008007,	1008001,  'COM',  2, 'Reporte de cuotas'						, 'xxx.jasper'									,330,     95051 ,	95000 , true , false ,   -1 ),
(1008008,	1008001,  'COM',  2, 'Reporte de ventas'						, 'xxx.jasper'									,335,     95051 ,	95000 , true , false ,   -1 ),
																																     
-- opciones de requiriente                                                                                                                      
(1501001,	     -1,  'LGT',  1, 'CABECERA 01'								, 'com.yupana.polaris.app.UctSegCliente'		,  1,     95050 ,	95000 , true , false ,   -1 ),
(1501002,	1501001,  'LGT',  2, 'Opción 001'								, 'com.yupana.polaris.app.UctSegCliente'		,  5,     95051 ,	95000 , true , false ,   -1 ),
(1501003,	1501001,  'LGT',  2, 'Opción 002'								, 'com.yupana.polaris.app.UctSegCliente'		, 10,     95051 ,	95000 , true , false ,   -1 ),
(1501004,	1501001,  'LGT',  2, 'Opción 003'								, 'com.yupana.polaris.app.UctSegCliente'		, 15,     95051 ,	95000 , true , false ,   -1 ),
(1501005,	1501001,  'LGT',  2, 'Opción 004'								, 'com.yupana.polaris.app.UctSegCliente'		, 20,     95051 ,	95000 , true , false ,   -1 ),
--                                                        	            	                                                                    
(1501006,	1501001,  'LGT',  1, 'Reportes'									, 'xxx.jasper'									, 25,     95050 ,	95000 , true , false ,   -1 ),
(1501007,	1501001,  'LGT',  2, 'Reporte de 00001'							, 'xxx.jasper'									, 30,     95051 ,	95000 , true , false ,   -1 ),
(1501008,	1501001,  'LGT',  2, 'Reporte de 00002'							, 'xxx.jasper'									, 35,     95051 ,	95000 , true , false ,   -1 ),
-- opciones de cotizador                                            		        	                                                        
(1502001,	     -1,  'LGT',  1, 'CABECERA 01'								, 'com.yupana.polaris.app.UctSegCliente'		, 40,     95050 ,	95000 , true , false ,   -1 ),
(1502002,	1502001,  'LGT',  2, 'Opción 001'								, 'com.yupana.polaris.app.UctSegCliente'		, 45,     95051 ,	95000 , true , false ,   -1 ),
(1502003,	1502001,  'LGT',  2, 'Opción 002'								, 'com.yupana.polaris.app.UctSegCliente'		, 50,     95051 ,	95000 , true , false ,   -1 ),
(1502004,	1502001,  'LGT',  2, 'Opción 003'								, 'com.yupana.polaris.app.UctSegCliente'		, 55,     95051 ,	95000 , true , false ,   -1 ),
(1502005,	1502001,  'LGT',  2, 'Opción 004'								, 'com.yupana.polaris.app.UctSegCliente'		, 60,     95051 ,	95000 , true , false ,   -1 ),
--                                           	                        	                                                                    
(1502006,	1502001,  'LGT',  1, 'Reportes'									, 'xxx.jasper'									, 65,     95050 ,	95000 , true , false ,   -1 ),
(1502007,	1502001,  'LGT',  2, 'Reporte de 00001'							, 'xxx.jasper'									, 70,     95051 ,	95000 , true , false ,   -1 ),
(1502008,	1502001,  'LGT',  2, 'Reporte de 00002'							, 'xxx.jasper'									, 95,     95051 ,	95000 , true , false ,   -1 ),
-- opciones de almacenero                                           			                                                                
(1503001,	     -1,  'LGT',  1, 'CABECERA 01'								, 'com.yupana.polaris.app.UctSegCliente'		, 80,     95050 ,	95000 , true , false ,   -1 ),
(1503002,	1503001,  'LGT',  2, 'Opción 001'								, 'com.yupana.polaris.app.UctSegCliente'		, 85,     95051 ,	95000 , true , false ,   -1 ),
(1503003,	1503001,  'LGT',  2, 'Opción 002'								, 'com.yupana.polaris.app.UctSegCliente'		, 90,     95051 ,	95000 , true , false ,   -1 ),
(1503004,	1503001,  'LGT',  2, 'Opción 003'								, 'com.yupana.polaris.app.UctSegCliente'		, 95,     95051 ,	95000 , true , false ,   -1 ),
(1503005,	1503001,  'LGT',  2, 'Opción 004'								, 'com.yupana.polaris.app.UctSegCliente'		,100,     95051 ,	95000 , true , false ,   -1 ),
--                                                               	    	                                                                    
(1503006,	1503001,  'LGT',  1, 'Reportes'									, 'xxx.jasper'									,105,     95050 ,	95000 , true , false ,   -1 ),
(1503007,	1503001,  'LGT',  2, 'Reporte de 00001'							, 'xxx.jasper'									,110,     95051 ,	95000 , true , false ,   -1 ),
(1503008,	1503001,  'LGT',  2, 'Reporte de 00002'							, 'xxx.jasper'									,115,     95051 ,	95000 , true , false ,   -1 ),
-- opciones de abastecimiento                              	        		                                                                    
(1504001,        -1,  'LGT',  1, 'CABECERA 01'								, 'com.yupana.polaris.app.UctSegCliente'		,120,     95050 ,	95000 , true , false ,   -1 ),
(1504002,	1504001,  'LGT',  2, 'Opción 001'								, 'com.yupana.polaris.app.UctSegCliente'		,125,     95051 ,	95000 , true , false ,   -1 ),
(1504003,	1504001,  'LGT',  2, 'Opción 002'								, 'com.yupana.polaris.app.UctSegCliente'		,130,     95051 ,	95000 , true , false ,   -1 ),
(1504004,	1504001,  'LGT',  2, 'Opción 003'								, 'com.yupana.polaris.app.UctSegCliente'		,135,     95051 ,	95000 , true , false ,   -1 ),
(1504005,	1504001,  'LGT',  2, 'Opción 004'								, 'com.yupana.polaris.app.UctSegCliente'		,140,     95051 ,	95000 , true , false ,   -1 ),
--                                                              	                                                                            
(1504006,	1504001,  'LGT',  1, 'Reportes'									, 'xxx.jasper'									,145,     95050 ,	95000 , true , false ,   -1 ),
(1504007,	1504001,  'LGT',  2, 'Reporte de 00001'							, 'xxx.jasper'									,150,     95051 ,	95000 , true , false ,   -1 ),
(1504008,	1504001,  'LGT',  2, 'Reporte de 00002'							, 'xxx.jasper'									,155,     95051 ,	95000 , true , false ,   -1 ),
-- opciones de caja - compras                 	                    	                                                                        
(1505001,	     -1,  'LGT',  1, 'CABECERA 01'								, 'com.yupana.polaris.app.UctSegCliente'		,160,     95050 ,	95000 , true , false ,   -1 ),
(1505002,	1505001,  'LGT',  2, 'Opción 001'								, 'com.yupana.polaris.app.UctSegCliente'		,165,     95051 ,	95000 , true , false ,   -1 ),
(1505003,	1505001,  'LGT',  2, 'Opción 002'								, 'com.yupana.polaris.app.UctSegCliente'		,170,     95051 ,	95000 , true , false ,   -1 ),
(1505004,	1505001,  'LGT',  2, 'Opción 003'								, 'com.yupana.polaris.app.UctSegCliente'		,195,     95051 ,	95000 , true , false ,   -1 ),
(1505005,	1505001,  'LGT',  2, 'Opción 004'								, 'com.yupana.polaris.app.UctSegCliente'		,180,     95051 ,	95000 , true , false ,   -1 ),
--                                                          	        	                                                                    
(1505006,	1505001,  'LGT',  1, 'Reportes'									, 'xxx.jasper'									,185,     95050 ,	95000 , true , false ,   -1 ),
(1505007,	1505001,  'LGT',  2, 'Reporte de 00001'							, 'xxx.jasper'									,190,     95051 ,	95000 , true , false ,   -1 ),
(1505008,	1505001,  'LGT',  2, 'Reporte de 00002'							, 'xxx.jasper'									,195,     95051 ,	95000 , true , false ,   -1 ),
-- opciones de supervisor logistico                                 		                                                                    
(1506001,	     -1,  'LGT',  1, 'CABECERA 01'								, 'com.yupana.polaris.app.UctSegCliente'		,200,     95050 ,	95000 , true , false ,   -1 ),
(1506002,	1506001,  'LGT',  2, 'Opción 001'								, 'com.yupana.polaris.app.UctSegCliente'		,205,     95051 ,	95000 , true , false ,   -1 ),
(1506003,	1506001,  'LGT',  2, 'Opción 002'								, 'com.yupana.polaris.app.UctSegCliente'		,210,     95051 ,	95000 , true , false ,   -1 ),
(1506004,	1506001,  'LGT',  2, 'Opción 003'								, 'com.yupana.polaris.app.UctSegCliente'		,215,     95051 ,	95000 , true , false ,   -1 ),
(1506005,	1506001,  'LGT',  2, 'Opción 004'								, 'com.yupana.polaris.app.UctSegCliente'		,220,     95051 ,	95000 , true , false ,   -1 ),
--                                                                	    	                                                                    
(1506006,	1506001,  'LGT',  1, 'Reportes'									, 'xxx.jasper'									,225,     95050 ,	95000 , true , false ,   -1 ),
(1506007,	1506001,  'LGT',  2, 'Reporte de 00001'							, 'xxx.jasper'									,230,     95051 ,	95000 , true , false ,   -1 ),
(1506008,	1506001,  'LGT',  2, 'Reporte de 00002'							, 'xxx.jasper'									,235,     95051 ,	95000 , true , false ,   -1 ),
-- opciones de gestor logistico                                     		                                                                    
(1507001,	     -1,  'LGT',  1, 'CABECERA 01'								, 'com.yupana.polaris.app.UctSegCliente'		,240,     95050 ,	95000 , true , false ,   -1 ),
(1507002,	1507001,  'LGT',  2, 'Opción 001'								, 'com.yupana.polaris.app.UctSegCliente'		,245,     95051 ,	95000 , true , false ,   -1 ),
(1507003,	1507001,  'LGT',  2, 'Opción 002'								, 'com.yupana.polaris.app.UctSegCliente'		,250,     95051 ,	95000 , true , false ,   -1 ),
(1507004,	1507001,  'LGT',  2, 'Opción 003'								, 'com.yupana.polaris.app.UctSegCliente'		,255,     95051 ,	95000 , true , false ,   -1 ),
(1507005,	1507001,  'LGT',  2, 'Opción 004'								, 'com.yupana.polaris.app.UctSegCliente'		,260,     95051 ,	95000 , true , false ,   -1 ),
--                                                                	                                                                            
(1507006,	1507001,  'LGT',  1, 'Reportes'									, 'xxx.jasper'									,265,     95050 ,	95000 , true , false ,   -1 ),
(1507007,	1507001,  'LGT',  2, 'Reporte de 00001'							, 'xxx.jasper'									,270,     95051 ,	95000 , true , false ,   -1 ),
(1507008,	1507001,  'LGT',  2, 'Reporte de 00002'							, 'xxx.jasper'									,295,     95051 ,	95000 , true , false ,   -1 ),
																																     
-- laboral-escalafon                                                		                                                                 
(2001001,	     -1,  'PER',  1, 'CONFIGURACIÓN LAB aaaaaa'					, 'com.yupana.polaris.app.UctSegCliente'		,  1,     95050 ,	95000 , true , false ,   -1 ),
(2001002,	2001001,  'PER',  2, 'laboral   opcion opcion opcion 1'			, 'com.yupana.polaris.app.UctSegCliente'		,  5,     95051 ,	95000 , true , false ,   -1 ),
(2001003,	2001001,  'PER',  2, 'laboral   opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		, 10,     95051 ,	95000 , true , false ,   -1 ),
(2001004,	2001001,  'PER',  2, 'laboral   opcion opcion opcion 3'			, 'com.yupana.polaris.app.UctSegCliente'		, 15,     95051 ,	95000 , true , false ,   -1 ),
(2001005,	2001001,  'PER',  2, 'laboral   opcion opcion opcion 4'			, 'com.yupana.polaris.app.UctSegCliente'		, 20,     95051 ,	95000 , true , false ,   -1 ),
-- laboral-remunerador                                              		                                                                 
(2002001,	     -1,  'PER',  1, 'CONFIGURACIÓN LAB aaaaaa'					, 'com.yupana.polaris.app.UctSegCliente'		, 25,     95050 ,	95000 , true , false ,   -1 ),
(2002002,	2002001,  'PER',  2, 'laboral   opcion opcion opcion 1'			, 'com.yupana.polaris.app.UctSegCliente'		, 30,     95051 ,	95000 , true , false ,   -1 ),
(2002003,	2002001,  'PER',  2, 'laboral   opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		, 35,     95051 ,	95000 , true , false ,   -1 ),
(2002004,	2002001,  'PER',  2, 'laboral   opcion opcion opcion 3'			, 'com.yupana.polaris.app.UctSegCliente'		, 40,     95051 ,	95000 , true , false ,   -1 ),
(2002005,	2002001,  'PER',  2, 'laboral   opcion opcion opcion 4'			, 'com.yupana.polaris.app.UctSegCliente'		, 45,     95051 ,	95000 , true , false ,   -1 ),
-- laboral-binestar social                                          		                                           	                        
(2003001,	     -1,  'PER',  1, 'CONFIGURACIÓN LAB aaaaaa'					, 'com.yupana.polaris.app.UctSegCliente'		, 50,     95050 ,	95000 , true , false ,   -1 ),
(2003002,	2003001,  'PER',  2, 'laboral   opcion opcion opcion 1'			, 'com.yupana.polaris.app.UctSegCliente'		, 55,     95051 ,	95000 , true , false ,   -1 ),
(2003003,	2003001,  'PER',  2, 'laboral   opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		, 60,     95051 ,	95000 , true , false ,   -1 ),
(2003004,	2003001,  'PER',  2, 'laboral   opcion opcion opcion 3'			, 'com.yupana.polaris.app.UctSegCliente'		, 65,     95051 ,	95000 , true , false ,   -1 ),
(2003005,	2003001,  'PER',  2, 'laboral   opcion opcion opcion 4'			, 'com.yupana.polaris.app.UctSegCliente'		, 70,     95051 ,	95000 , true , false ,   -1 ),	
-- laboral-seguridad salud e higiene                                		                             	                                    
(2004001,	     -1,  'PER',  1, 'CONFIGURACIÓN LAB aaaaaa'					, 'com.yupana.polaris.app.UctSegCliente'		, 95,     95050 ,	95000 , true , false ,   -1 ),
(2004002,	2004001,  'PER',  2, 'laboral   opcion opcion opcion 1'			, 'com.yupana.polaris.app.UctSegCliente'		, 80,     95051 ,	95000 , true , false ,   -1 ),
(2004003,	2004001,  'PER',  2, 'laboral   opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		, 85,     95051 ,	95000 , true , false ,   -1 ),
(2004004,	2004001,  'PER',  2, 'laboral   opcion opcion opcion 3'			, 'com.yupana.polaris.app.UctSegCliente'		, 90,     95051 ,	95000 , true , false ,   -1 ),
(2004005,	2004001,  'PER',  2, 'laboral   opcion opcion opcion 4'			, 'com.yupana.polaris.app.UctSegCliente'		, 95,     95051 ,	95000 , true , false ,   -1 ),	
-- laboral-gestor laboral                                     	    		                                                                    
(2005001,	     -1,  'PER',  1, 'CONFIGURACIÓN LAB aaaaaa'					, 'com.yupana.polaris.app.UctSegCliente'		,100,     95050 ,	95000 , true , false ,   -1 ),
(2005002,	2005001,  'PER',  2, 'laboral   opcion opcion opcion 1'			, 'com.yupana.polaris.app.UctSegCliente'		,105,     95051 ,	95000 , true , false ,   -1 ),
(2005003,	2005001,  'PER',  2, 'laboral   opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		,110,     95051 ,	95000 , true , false ,   -1 ),
(2005004,	2005001,  'PER',  2, 'laboral   opcion opcion opcion 3'			, 'com.yupana.polaris.app.UctSegCliente'		,115,     95051 ,	95000 , true , false ,   -1 ),
(2005005,	2005001,  'PER',  2, 'laboral   opcion opcion opcion 4'			, 'com.yupana.polaris.app.UctSegCliente'		,120,     95051 ,	95000 , true , false ,   -1 ),	
																																     
-- finanzas - tesoreria                                             		                                                                    
(2501001,	     -1,  'FIN',  1, 'CONFIGURACIÓN FIN aaaaaa'					, 'com.yupana.polaris.app.UctSegCliente'		,  1,     95050 ,	95000 , true , false ,   -1 ),
(2501002,	2501001,  'FIN',  2, 'financiero opcion opcion opcion 1'		, 'com.yupana.polaris.app.UctSegCliente'		,  5,     95051 ,	95000 , true , false ,   -1 ),
(2501003,	2501001,  'FIN',  2, 'financiero opcion opcion opcion 2 '		, 'com.yupana.polaris.app.UctSegCliente'		, 10,     95051 ,	95000 , true , false ,   -1 ),
(2501004,	2501001,  'FIN',  2, 'financiero opcion opcion opcion 3'		, 'com.yupana.polaris.app.UctSegCliente'		, 15,     95051 ,	95000 , true , false ,   -1 ),
(2501005,	2501001,  'FIN',  2, 'financiero opcion opcion opcion 4'		, 'com.yupana.polaris.app.UctSegCliente'		, 20,     95051 ,	95000 , true , false ,   -1 ),
--finanzas-pagaduria                                                                                                                            
(2502001,	     -1,  'FIN',  1, 'CONFIGURACIÓN FIN bbbbbb'					, 'com.yupana.polaris.app.UctSegCliente'		, 25,     95050 ,	95000 , true , false ,   -1 ),
(2502002,	2502001,  'FIN',  2, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		, 30,     95051 ,	95000 , true , false ,   -1 ),
(2502003,	2502001,  'FIN',  2, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		, 35,     95051 ,	95000 , true , false ,   -1 ),
(2502004,	2502001,  'FIN',  2, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		, 40,     95051 ,	95000 , true , false ,   -1 ),
(2502005,	2502001,  'FIN',  2, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		, 45,     95051 ,	95000 , true , false ,   -1 ),
--finanzas-fondo fijo                                                                                                   	                    
(2503001,	     -1,  'FIN',  1, 'CONFIGURACIÓN FIN bbbbbb'					, 'com.yupana.polaris.app.UctSegCliente'		, 50,     95050 ,	95000 , true , false ,   -1 ),
(2503002,	2503001,  'FIN',  2, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		, 55,     95051 ,	95000 , true , false ,   -1 ),
(2503003,	2503001,  'FIN',  2, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		, 60,     95051 ,	95000 , true , false ,   -1 ),
(2503004,	2503001,  'FIN',  2, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		, 65,     95051 ,	95000 , true , false ,   -1 ),
(2503005,	2503001,  'FIN',  2, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		, 70,     95051 ,	95000 , true , false ,   -1 ),							
--finanzas-fondo asistente financiero                                                                               	                        
(2504001,	     -1,  'FIN',  1, 'CONFIGURACIÓN FIN bbbbbb'					, 'com.yupana.polaris.app.UctSegCliente'		, 80,     95050 ,	95000 , true , false ,   -1 ),
(2504002,	2504001,  'FIN',  2, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		, 85,     95051 ,	95000 , true , false ,   -1 ),
(2504003,	2504001,  'FIN',  2, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		, 90,     95051 ,	95000 , true , false ,   -1 ),
(2504004,	2504001,  'FIN',  2, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		, 95,     95051 ,	95000 , true , false ,   -1 ),
(2504005,	2504001,  'FIN',  2, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,100,     95051 ,	95000 , true , false ,   -1 ),	
--finanzas-contable?                                                                                                                            
(2505001, 	     -1,  'FIN',  1, 'CONFIGURACIÓN FIN bbbbbb'					, 'com.yupana.polaris.app.UctSegCliente'		,130,     95050 ,	95000 , true , false ,   -1 ),
(2505002,	2505001,  'FIN',  2, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,135,     95051 ,	95000 , true , false ,   -1 ),
(2505003,	2505001,  'FIN',  2, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,140,     95051 ,	95000 , true , false ,   -1 ),
(2505004,	2505001,  'FIN',  2, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,145,     95051 ,	95000 , true , false ,   -1 ),
(2505005,	2505001,  'FIN',  2, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,150,     95051 ,	95000 , true , false ,   -1 ),	
--finanzas-gestor financiero                                                                                                                    
(2506001,	     -1,  'FIN',  1, 'CONFIGURACIÓN FIN bbbbbb'					, 'com.yupana.polaris.app.UctSegCliente'		,130,     95050 ,	95000 , true , false ,   -1 ),
(2506002,	2506001,  'FIN',  2, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,135,     95051 ,	95000 , true , false ,   -1 ),
(2506003,	2506001,  'FIN',  2, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,140,     95051 ,	95000 , true , false ,   -1 ),
(2506004,	2506001,  'FIN',  2, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,145,     95051 ,	95000 , true , false ,   -1 ),
(2506005,	2506001,  'FIN',  2, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,150,     95051 ,	95000 , true , false ,   -1 ),	
																																     
--contable 1                                                                                                                                    
(3001001,	     -1,  'CNT',  1, 'CONFIGURACIÓN cnt AAAAAA'					, 'com.yupana.polaris.app.UctSegCliente'		,105,     95050 ,	95000 , true , false ,   -1 ),
(3001002,	3001001,  'CNT',  2, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,110,     95051 ,	95000 , true , false ,   -1 ),
(3001003,	3001001,  'CNT',  2, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,115,     95051 ,	95000 , true , false ,   -1 ),
(3001004,	3001001,  'CNT',  2, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,120,     95051 ,	95000 , true , false ,   -1 ),
(3001005,	3001001,  'CNT',  2, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,125,     95051 ,	95000 , true , false ,   -1 ),	
--contable 2                                                                                                                                    
(3002001,	     -1,  'CNT',  1, 'CONFIGURACIÓN cnt bbbbbb'					, 'com.yupana.polaris.app.UctSegCliente'		,105,     95050 ,	95000 , true , false ,   -1 ),
(3002002,	3002001,  'CNT',  2, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,110,     95051 ,	95000 , true , false ,   -1 ),
(3002003,	3002001,  'CNT',  2, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,115,     95051 ,	95000 , true , false ,   -1 ),
(3002004,	3002001,  'CNT',  2, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,120,     95051 ,	95000 , true , false ,   -1 ),
(3002005,	3002001,  'CNT',  2, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,125,     95051 ,	95000 , true , false ,   -1 ),	
--contable 3                                                                                                                                                
(3003001,	     -1,  'CNT',  1, 'CONFIGURACIÓN cnt CCCCC'					, 'com.yupana.polaris.app.UctSegCliente'		,105,     95050 ,	95000 , true , false ,   -1 ),
(3003002,	3003001,  'CNT',  2, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,110,     95051 ,	95000 , true , false ,   -1 ),
(3003003,	3003001,  'CNT',  2, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,115,     95051 ,	95000 , true , false ,   -1 ),
(3003004,	3003001,  'CNT',  2, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,120,     95051 ,	95000 , true , false ,   -1 ),
(3003005,	3003001,  'CNT',  2, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,125,     95051 ,	95000 , true , false ,   -1 ),	
																																							
--academico-auxiliar                                                                                                                                        
(3501001,	     -1,  'COL',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		,  1,     95050 ,	95001 , true , false ,   -1 ),
(3501002,	3501001,  'COL',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		,  5,     95051 ,	95001 , true , false ,   -1 ),
(3501003,	3501001,  'COL',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		, 10,     95051 ,	95001 , true , false ,   -1 ),
(3501004,	3501001,  'COL',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		, 15,     95051 ,	95001 , true , false ,   -1 ),
(3501005,	3501001,  'COL',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		, 20,     95051 ,	95001 , true , false ,   -1 ),	
--academico-docente                                                 		                                                                                
(3502001,	     -1,  'COL',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		, 25,     95050 ,	95001 , true , false ,   -1 ),
(3502002,	3502001,  'COL',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		, 30,     95051 ,	95001 , true , false ,   -1 ),
(3502003,	3502001,  'COL',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		, 35,     95051 ,	95001 , true , false ,   -1 ),
(3502004,	3502001,  'COL',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		, 40,     95051 ,	95001 , true , false ,   -1 ),
(3502005,	3502001,  'COL',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		, 45,     95051 ,	95001 , true , false ,   -1 ),	
--academico-asiste academico                                        		                                                                                
(3503001,	     -1,  'COL',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		, 50,     95050 ,	95001 , true , false ,   -1 ),
(3503002,	3503001,  'COL',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		, 55,     95051 ,	95001 , true , false ,   -1 ),
(3503003,	3503001,  'COL',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		, 60,     95051 ,	95001 , true , false ,   -1 ),
(3503004,	3503001,  'COL',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		, 65,     95051 ,	95001 , true , false ,   -1 ),
(3503005,	3503001,  'COL',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		, 70,     95051 ,	95001 , true , false ,   -1 ),								
--academico-enfermero                                               		                                                                                
(3504001,	     -1,  'COL',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		, 95,     95050 ,	95001 , true , false ,   -1 ),
(3504002,	3504001,  'COL',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		, 80,     95051 ,	95001 , true , false ,   -1 ),
(3504003,	3504001,  'COL',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		, 85,     95051 ,	95001 , true , false ,   -1 ),
(3504004,	3504001,  'COL',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		, 90,     95051 ,	95001 , true , false ,   -1 ),
(3504005,	3504001,  'COL',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		,100,     95051 ,	95001 , true , false ,   -1 ),								
--academico-psicologo                                               		                                                                                
(3505001,	     -1,  'COL',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		,105,     95050 ,	95001 , true , false ,   -1 ),
(3505002,	3505001,  'COL',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		,110,     95051 ,	95001 , true , false ,   -1 ),
(3505003,	3505001,  'COL',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		,115,     95051 ,	95001 , true , false ,   -1 ),
(3505004,	3505001,  'COL',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		,120,     95051 ,	95001 , true , false ,   -1 ),
(3505005,	3505001,  'COL',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		,125,     95051 ,	95001 , true , false ,   -1 ),								
--academico-bibliotecario                                           		                                                                                
(3506001,	     -1,  'COL',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		,130,     95050 ,	95001 , true , false ,   -1 ),
(3506002,	3506001,  'COL',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		,135,     95051 ,	95001 , true , false ,   -1 ),
(3506003,	3506001,  'COL',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		,140,     95051 ,	95001 , true , false ,   -1 ),
(3506004,	3506001,  'COL',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		,145,     95051 ,	95001 , true , false ,   -1 ),
(3506005,	3506001,  'COL',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		,150,     95051 ,	95001 , true , false ,   -1 ),	
--academico-tareador colegio                                            	                                                                                
(3507001,	     -1,  'COL',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		,155,     95050 ,	95001 , true , false ,   -1 ),
(3507002,	3507001,  'COL',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		,160,     95051 ,	95001 , true , false ,   -1 ),
(3507003,	3507001,  'COL',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		,165,     95051 ,	95001 , true , false ,   -1 ),
(3507004,	3507001,  'COL',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		,170,     95051 ,	95001 , true , false ,   -1 ),
(3507005,	3507001,  'COL',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		,195,     95051 ,	95001 , true , false ,   -1 ),	
--academico-gestor academico                                        		                                                                                 
(3508001,	     -1,  'COL',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		,180,     95050 ,	95001 , true , false ,   -1 ),
(3508002,	3508001,  'COL',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		,185,     95051 ,	95001 , true , false ,   -1 ),
(3508003,	3508001,  'COL',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		,190,     95051 ,	95001 , true , false ,   -1 ),
(3508004,	3508001,  'COL',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		,195,     95051 ,	95001 , true , false ,   -1 ),
(3508005,	3508001,  'COL',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		,200,     95051 ,	95001 , true , false ,   -1 ),								
																																								
--academico-tutor academia                                          		                                                                                  
(4001001,	     -1,  'ACA',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		,205,     95050 ,	95002 , true , false ,   -1 ),
(4001002,	4001001,  'ACA',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		,210,     95051 ,	95002 , true , false ,   -1 ),
(4001003,	4001001,  'ACA',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		,215,     95051 ,	95002 , true , false ,   -1 ),
(4001004,	4001001,  'ACA',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		,220,     95051 ,	95002 , true , false ,   -1 ),
(4001005,	4001001,  'ACA',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		,225,     95051 ,	95002 , true , false ,   -1 ),	
--academico-tareador academia                                       		                                                                                    
(4002001,	     -1,  'ACA',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		,230,     95050 ,	95002 , true , false ,   -1 ),
(4002002,	4002001,  'ACA',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		,235,     95051 ,	95002 , true , false ,   -1 ),
(4002003,	4002001,  'ACA',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		,240,     95051 ,	95002 , true , false ,   -1 ),
(4002004,	4002001,  'ACA',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		,245,     95051 ,	95002 , true , false ,   -1 ),
(4002005,	4002001,  'ACA',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		,250,     95051 ,	95002 , true , false ,   -1 ),	
--academico-supervisor academia                                     		                                                                                    
(4003001, 	     -1,  'ACA',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		,255,     95050 ,	95002 , true , false ,   -1 ),
(4003002,	4003001,  'ACA',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		,260,     95051 ,	95002 , true , false ,   -1 ),
(4003003,	4003001,  'ACA',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		,265,     95051 ,	95002 , true , false ,   -1 ),
(4003004,	4003001,  'ACA',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		,270,     95051 ,	95002 , true , false ,   -1 ),
(4003005,	4003001,  'ACA',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		,295,     95051 ,	95002 , true , false ,   -1 ),	
--academico-coordinador academico                                   		                                                                                         
(4004001,	     -1,  'ACA',  1, 'CONFIGURACIÓN academic'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95002 , true , false ,   -1 ),
(4004002,	4004001,  'ACA',  2, 'acade on opcion opcion A'					, 'com.yupana.polaris.app.UctSegCliente'		,285,     95051 ,	95002 , true , false ,   -1 ),
(4004003,	4004001,  'ACA',  2, 'acaede n opcion opcion B'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95002 , true , false ,   -1 ),
(4004004,	4004001,  'ACA',  2, 'academ n opcion opcion C'					, 'com.yupana.polaris.app.UctSegCliente'		,295,     95051 ,	95002 , true , false ,   -1 ),
(4004005,	4004001,  'ACA',  2, 'academi  opcion opcion D'					, 'com.yupana.polaris.app.UctSegCliente'		,300,     95051 ,	95002 , true , false ,   -1 ),
																																									 
--medico 1                                                              	                                                                                         
(4501001,	     -1,  'MED',  1, 'CONFIGURACIÓN medico 1'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95003 , true , false ,   -1 ),
(4501002,	4501001,  'MED',  2, 'acaede n opcion opcion 1'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95003 , true , false ,   -1 ),
--medico 2                                                              	                                                                                         
(4502001,	     -1,  'MED',  1, 'CONFIGURACIÓN medico 2'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95003 , true , false ,   -1 ),
(4502002,	4502001,  'MED',  2, 'acaede n opcion opcion 2'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95003 , true , false ,   -1 ),
--medico 3                                                              	                                                                                         
(4503001,	     -1,  'MED',  1, 'CONFIGURACIÓN medico 3'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95003 , true , false ,   -1 ),
(4503002,	4503001,  'MED',  2, 'acaede n opcion opcion 3'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95003 , true , false ,   -1 ),
--medico 4                                                              	                                                                                         
(4504001,	     -1,  'MED',  1, 'CONFIGURACIÓN medico 4'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95003 , true , false ,   -1 ),
(4504002,	4504001,  'MED',  2, 'acaede n opcion opcion 4'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95003 , true , false ,   -1 ),
--medico 5                                                              	                                                                                         
(4505001,	     -1,  'MED',  1, 'CONFIGURACIÓN medico 5'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95003 , true , false ,   -1 ),
(4505002,	4505001,  'MED',  2, 'acaede n opcion opcion 5'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95003 , true , false ,   -1 ),
--medico 6                                                              	                                                                                         
(4506001,	     -1,  'MED',  1, 'CONFIGURACIÓN medico 6'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95003 , true , false ,   -1 ),
(4506002,	4506001,  'MED',  2, 'acaede n opcion opcion 6'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95003 , true , false ,   -1 ),
--medico 7                                                              	                                                                                         
(4507001,	     -1,  'MED',  1, 'CONFIGURACIÓN medico 7'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95003 , true , false ,   -1 ),
(4507002,	4507001,  'MED',  2, 'acaede n opcion opcion 7'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95003 , true , false ,   -1 ),
--medico 8                                                              	                                                                                         
(4508001,	     -1,  'MED',  1, 'CONFIGURACIÓN medico 8'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95003 , true , false ,   -1 ),
(4508002,	4508001,  'MED',  2, 'acaede n opcion opcion 8'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95003 , true , false ,   -1 ),
																																									 
--banca 1                                                               	                                                                                         
(5001001,	     -1,  'BKA',  1, 'CONFIGURACIÓN banca 1'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95004 , true , false ,   -1 ),
(5001002,	5001001,  'BKA',  2, 'acaede n opcion opcion 1'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95004 , true , false ,   -1 ),
--banca 2                                                               	                                                                                         
(5002001,	     -1,  'BKA',  1, 'CONFIGURACIÓN banca 2'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95004 , true , false ,   -1 ),
(5002002,	5002001,  'BKA',  2, 'acaede n opcion opcion 2'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95004 , true , false ,   -1 ),
--banca 3                                                               	                                                                                         
(5003001,	     -1,  'BKA',  1, 'CONFIGURACIÓN banca 3'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95004 , true , false ,   -1 ),
(5003002,	5003001,  'BKA',  2, 'acaede n opcion opcion 3'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95004 , true , false ,   -1 ),
--banca 4                                                               	                                                                                         
(5004001,	     -1,  'BKA',  1, 'CONFIGURACIÓN banca 4'					, 'com.yupana.polaris.app.UctSegCliente'		,280,     95050 ,	95004 , true , false ,   -1 ),
(5004002,	5004001,  'BKA',  2, 'acaede n opcion opcion 4'					, 'com.yupana.polaris.app.UctSegCliente'		,290,     95051 ,	95004 , true , false ,   -1 );



----------------------------------------------------------------------------------------------------------------------------------------
--adm.perfil_opcion---------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.perfil_opcion;
CREATE TABLE adm.perfil_opcion (
	id_per_opc 		serial 		NOT NULL PRIMARY KEY,	
	id_perfil 		int 		NOT NULL,
	id_opcion 		int 		NOT NULL,	
	activo 			bool 		NOT NULL,
	id_empresa 		int 		NOT NULL,
	CONSTRAINT perfil_opcion_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES adm.perfil(id_perfil) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, 
	CONSTRAINT perfil_opcion_id_opcion_fkey FOREIGN KEY (id_opcion) REFERENCES adm.opcion(id_opcion) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.perfil_opcion IS 'Opciones de sistema por perfil de usuario.'; 
COMMENT ON COLUMN adm.perfil_opcion.id_per_opc IS 'Identificador.';
COMMENT ON COLUMN adm.perfil_opcion.id_perfil IS 'Identificador de la opción superior, si no va -1.';
COMMENT ON COLUMN adm.perfil_opcion.id_opcion IS 'Identificador de la opción';
COMMENT ON COLUMN adm.perfil_opcion.activo IS 'Si la opción esta activo o vigente.';
COMMENT ON COLUMN adm.perfil_opcion.id_empresa IS 'Para todas las empresas -1, sino identificador de empresa [ADM.EMPRESA].';
--
INSERT INTO adm.perfil_opcion (id_perfil, id_opcion, activo, id_empresa) 
VALUES 
-- opciones de rol usuario 
(9501,  9501001,	true  ,   -1 ),
(9501,  9501002,	true  ,   -1 ),
(9501,  9501003,	true  ,   -1 ),
(9501,  9501004,	true  ,   -1 ),
-- admin sis        
(9502,  9502001,	true  ,   -1 ),
(9502,  9502002,	true  ,   -1 ),
(9502,  9502003,	true  ,   -1 ),
(9502,  9502004,	true  ,   -1 ),
(9502,  9502005,	true  ,   -1 ),
(9502,  9502006,	true  ,   -1 ),
(9502,  9502007,	true  ,   -1 ),
--					
(9502,  9502008,    true  ,   -1 ),
(9502,  9502009,	true  ,   -1 ),
(9502,  9502010,	true  ,   -1 ),
(9502,  9502011,	true  ,   -1 ),
-- superusuario		
(9503,  9503001,	true  ,   -1 ),
(9503,  9503002,	true  ,   -1 ),
(9503,  9503003,	true  ,   -1 ),
(9503,  9503004,	true  ,   -1 ),
(9503,  9503005,	true  ,   -1 ),
(9503,  9503006,	true  ,   -1 ),
(9503,  9503007,	true  ,   -1 ),
					
-- informes         
(1001,  1001001,	true  ,   -1 ),
(1001,  1001002,	true  ,   -1 ),
(1001,  1001003,	true  ,   -1 ),
-- vendedor         
(1002,  1002001,	true  ,   -1 ),
(1002,  1002002,	true  ,   -1 ),
(1002,  1002003,	true  ,   -1 ),
(1002,  1002004,	true  ,   -1 ),
(1002,  1002005,	true  ,   -1 ),
(1002,  1002006,	true  ,   -1 ),
(1002,  1002007,	true  ,   -1 ),
--                  
(1002,  1002008,	true  ,   -1 ),
(1002,  1002009,	true  ,   -1 ),
(1002,  1002010,	true  ,   -1 ),
(1002,  1002011,	true  ,   -1 ),
-- rol facturador   
(1003,  1003001,	true  ,   -1 ),
(1003,  1003002,	true  ,   -1 ),
(1003,  1003003,	true  ,   -1 ),
(1003,  1003004,	true  ,   -1 ),
(1003,  1003005,	true  ,   -1 ),
(1003,  1003006,	true  ,   -1 ),
(1003,  1003007,	true  ,   -1 ),
(1003,  1003008,	true  ,   -1 ),
(1003,  1003009,	true  ,   -1 ),
(1003,  1003010,	true  ,   -1 ),
--                  
(1003,  1003011,	true  ,   -1 ),
(1003,  1003012,	true  ,   -1 ),
(1003,  1003013,	true  ,   -1 ),
(1003,  1003014,	true  ,   -1 ),
-- rol caja         
(1004,  1004001,	true  ,   -1 ),
(1004,  1004002,	true  ,   -1 ),
(1004,  1004003,	true  ,   -1 ),
(1004,  1004004,	true  ,   -1 ),
(1004,  1004005,	true  ,   -1 ),
(1004,  1004006,	true  ,   -1 ),
(1004,  1004007,	true  ,   -1 ),
--                  
(1004,  1004008,	true  ,   -1 ),
(1004,  1004009,	true  ,   -1 ),
(1004,  1004010,	true  ,   -1 ),
-- supervisor ventas
(1005,  1005001,	true  ,   -1 ),
(1005,  1005002,	true  ,   -1 ),
(1005,  1005003,	true  ,   -1 ),
(1005,  1005004,	true  ,   -1 ),
(1005,  1005005,	true  ,   -1 ),
(1005,  1005006,	true  ,   -1 ),
(1005,  1005007,	true  ,   -1 ),
(1005,  1005008,	true  ,   -1 ),
--                  
(1005,  1005009,	true  ,   -1 ),
(1005,  1005010,	true  ,   -1 ),
(1005,  1005011,	true  ,   -1 ),
-- supervisor de fact
(1006,  1006001,	true  ,   -1 ),
(1006,  1006002,	true  ,   -1 ),
(1006,  1006003,	true  ,   -1 ),
(1006,  1006004,	true  ,   -1 ),
					
(1006,  1006005,	true  ,   -1 ),
(1006,  1006006,	true  ,   -1 ),
(1006,  1006007,	true  ,   -1 ),
-- rol supervisor de
(1007,  1007001,	true  ,   -1 ),
(1007,  1007002,	true  ,   -1 ),
(1007,  1007003,	true  ,   -1 ),
(1007,  1007004,	true  ,   -1 ),
--					
(1007,  1007005,	true  ,   -1 ),
(1007,  1007006,	true  ,   -1 ),
(1007,  1007007,	true  ,   -1 ),
-- opciones de gesto
(1008,  1008001,	true  ,   -1 ),
(1008,  1008002,	true  ,   -1 ),
(1008,  1008003,	true  ,   -1 ),
(1008,  1008004,	true  ,   -1 ),
(1008,  1008005,	true  ,   -1 ),
--                  
(1008,  1008006,	true  ,   -1 ),
(1008,  1008007,	true  ,   -1 ),
(1008,  1008008,	true  ,   -1 ),
					
-- opciones de requi
(1501,  1501001,	true  ,   -1 ),
(1501,  1501002,	true  ,   -1 ),
(1501,  1501003,	true  ,   -1 ),
(1501,  1501004,	true  ,   -1 ),
(1501,  1501005,	true  ,   -1 ),
--                  
(1501,  1501006,	true  ,   -1 ),
(1501,  1501007,	true  ,   -1 ),
(1501,  1501008,	true  ,   -1 ),
-- opciones de cotiz
(1502,  1502001,	true  ,   -1 ),
(1502,  1502002,	true  ,   -1 ),
(1502,  1502003,	true  ,   -1 ),
(1502,  1502004,	true  ,   -1 ),
(1502,  1502005,	true  ,   -1 ),
--                  
(1502,  1502006,	true  ,   -1 ),
(1502,  1502007,	true  ,   -1 ),
(1502,  1502008,	true  ,   -1 ),
-- opciones de almac
(1503,  1503001,	true  ,   -1 ),
(1503,  1503002,	true  ,   -1 ),
(1503,  1503003,	true  ,   -1 ),
(1503,  1503004,	true  ,   -1 ),
(1503,  1503005,	true  ,   -1 ),
--                  
(1503,  1503006,	true  ,   -1 ),
(1503,  1503007,	true  ,   -1 ),
(1503,  1503008,	true  ,   -1 ),
-- opciones de abast
(1504,  1504001,    true  ,   -1 ),
(1504,  1504002,	true  ,   -1 ),
(1504,  1504003,	true  ,   -1 ),
(1504,  1504004,	true  ,   -1 ),
(1504,  1504005,	true  ,   -1 ),
--                 
(1504,  1504006,	true  ,   -1 ),
(1504,  1504007,	true  ,   -1 ),
(1504,  1504008,	true  ,   -1 ),
-- opciones de caja 
(1505,  1505001,	true  ,   -1 ),
(1505,  1505002,	true  ,   -1 ),
(1505,  1505003,	true  ,   -1 ),
(1505,  1505004,	true  ,   -1 ),
(1505,  1505005,	true  ,   -1 ),
--                  
(1505,  1505006,	true  ,   -1 ),
(1505,  1505007,	true  ,   -1 ),
(1505,  1505008,	true  ,   -1 ),
-- opciones de super
(1506,  1506001,	true  ,   -1 ),
(1506,  1506002,	true  ,   -1 ),
(1506,  1506003,	true  ,   -1 ),
(1506,  1506004,	true  ,   -1 ),
(1506,  1506005,	true  ,   -1 ),
--                  
(1506,  1506006,	true  ,   -1 ),
(1506,  1506007,	true  ,   -1 ),
(1506,  1506008,	true  ,   -1 ),
-- opciones de gesto
(1507,  1507001,	true  ,   -1 ),
(1507,  1507002,	true  ,   -1 ),
(1507,  1507003,	true  ,   -1 ),
(1507,  1507004,	true  ,   -1 ),
(1507,  1507005,	true  ,   -1 ),
--                  
(1507,  1507006,	true  ,   -1 ),
(1507,  1507007,	true  ,   -1 ),
(1507,  1507008,	true  ,   -1 ),
--
-- laboral-escalafon
(2001,  2001001,	true  ,   -1 ),
(2001,  2001002,	true  ,   -1 ),
(2001,  2001003,	true  ,   -1 ),
(2001,  2001004,	true  ,   -1 ),
(2001,  2001005,	true  ,   -1 ),
-- laboral-remunerad
(2002,  2002001,	true  ,   -1 ),
(2002,  2002002,	true  ,   -1 ),
(2002,  2002003,	true  ,   -1 ),
(2002,  2002004,	true  ,   -1 ),
(2002,  2002005,	true  ,   -1 ),
-- laboral-binestar 
(2003,  2003001,	true  ,   -1 ),
(2003,  2003002,	true  ,   -1 ),
(2003,  2003003,	true  ,   -1 ),
(2003,  2003004,	true  ,   -1 ),
(2003,  2003005,	true  ,   -1 ),	
-- laboral-seguridad
(2004,  2004001,	true  ,   -1 ),
(2004,  2004002,	true  ,   -1 ),
(2004,  2004003,	true  ,   -1 ),
(2004,  2004004,	true  ,   -1 ),
(2004,  2004005,	true  ,   -1 ),	
-- laboral-gestor la
(2005,  2005001,	true  ,   -1 ),
(2005,  2005002,	true  ,   -1 ),
(2005,  2005003,	true  ,   -1 ),
(2005,  2005004,	true  ,   -1 ),
(2005,  2005005,	true  ,   -1 ),	
					 
-- finanzas - tesore
(2501,  2501001,	true  ,   -1 ),
(2501,  2501002,	true  ,   -1 ),
(2501,  2501003,	true  ,   -1 ),
(2501,  2501004,	true  ,   -1 ),
(2501,  2501005,	true  ,   -1 ),
--finanzas-pagaduria
(2502,  2502001,	true  ,   -1 ),
(2502,  2502002,	true  ,   -1 ),
(2502,  2502003,	true  ,   -1 ),
(2502,  2502004,	true  ,   -1 ),
(2502,  2502005,	true  ,   -1 ),
--finanzas-fondo fij
(2503,  2503001,	true  ,   -1 ),
(2503,  2503002,	true  ,   -1 ),
(2503,  2503003,	true  ,   -1 ),
(2503,  2503004,	true  ,   -1 ),
(2503,  2503005,	true  ,   -1 ),							
--finanzas-fondo asi
(2504,  2504001,	true  ,   -1 ),
(2504,  2504002,	true  ,   -1 ),
(2504,  2504003,	true  ,   -1 ),
(2504,  2504004,	true  ,   -1 ),
(2504,  2504005,	true  ,   -1 ),	
--finanzas-contable
(2505,  2505001, 	true  ,   -1 ),
(2505,  2505002,	true  ,   -1 ),
(2505,  2505003,	true  ,   -1 ),
(2505,  2505004,	true  ,   -1 ),
(2505,  2505005,	true  ,   -1 ),	
--finanzas-gestor fi
(2506,  2506001,	true  ,   -1 ),
(2506,  2506002,	true  ,   -1 ),
(2506,  2506003,	true  ,   -1 ),
(2506,  2506004,	true  ,   -1 ),
(2506,  2506005,	true  ,   -1 ),	
					 
--contable 1        
(3001,  3001001,	true  ,   -1 ),
(3001,  3001002,	true  ,   -1 ),
(3001,  3001003,	true  ,   -1 ),
(3001,  3001004,	true  ,   -1 ),
(3001,  3001005,	true  ,   -1 ),	
--contable 2        
(3002,  3002001,	true  ,   -1 ),
(3002,  3002002,	true  ,   -1 ),
(3002,  3002003,	true  ,   -1 ),
(3002,  3002004,	true  ,   -1 ),
(3002,  3002005,	true  ,   -1 ),	
--contable 3        
(3003,  3003001,	true  ,   -1 ),
(3003,  3003002,	true  ,   -1 ),
(3003,  3003003,	true  ,   -1 ),
(3003,  3003004,	true  ,   -1 ),
(3003,  3003005,	true  ,   -1 ),
--
--academico-auxiliar
(3501,  3501001,	true  ,   -1 ),
(3501,  3501002,	true  ,   -1 ),
(3501,  3501003,	true  ,   -1 ),
(3501,  3501004,	true  ,   -1 ),
(3501,  3501005,	true  ,   -1 ),	
--academico-docente 
(3502,  3502001,	true  ,   -1 ),
(3502,  3502002,	true  ,   -1 ),
(3502,  3502003,	true  ,   -1 ),
(3502,  3502004,	true  ,   -1 ),
(3502,  3502005,	true  ,   -1 ),	
--academico-asiste a
(3503,  3503001,	true  ,   -1 ),
(3503,  3503002,	true  ,   -1 ),
(3503,  3503003,	true  ,   -1 ),
(3503,  3503004,	true  ,   -1 ),
(3503,  3503005,	true  ,   -1 ),								
--academico-enfermer
(3504,  3504001,	true  ,   -1 ),
(3504,  3504002,	true  ,   -1 ),
(3504,  3504003,	true  ,   -1 ),
(3504,  3504004,	true  ,   -1 ),
(3504,  3504005,	true  ,   -1 ),								
--academico-psicolog
(3505,  3505001,	true  ,   -1 ),
(3505,  3505002,	true  ,   -1 ),
(3505,  3505003,	true  ,   -1 ),
(3505,  3505004,	true  ,   -1 ),
(3505,  3505005,	true  ,   -1 ),								
--academico-bibliote
(3506,  3506001,	true  ,   -1 ),
(3506,  3506002,	true  ,   -1 ),
(3506,  3506003,	true  ,   -1 ),
(3506,  3506004,	true  ,   -1 ),
(3506,  3506005,	true  ,   -1 ),	
--academico-tareador
(3507,  3507001,	true  ,   -1 ),
(3507,  3507002,	true  ,   -1 ),
(3507,  3507003,	true  ,   -1 ),
(3507,  3507004,	true  ,   -1 ),
(3507,  3507005,	true  ,   -1 ),	
--academico-gestor a
(3508,  3508001,	true  ,   -1 ),
(3508,  3508002,	true  ,   -1 ),
(3508,  3508003,	true  ,   -1 ),
(3508,  3508004,	true  ,   -1 ),
(3508,  3508005,	true  ,   -1 ),								
					 
--academico-tutor ac
(4001,  4001001,	true  ,   -1 ),
(4001,  4001002,	true  ,   -1 ),
(4001,  4001003,	true  ,   -1 ),
(4001,  4001004,	true  ,   -1 ),
(4001,  4001005,	true  ,   -1 ),	
--academico-tareador
(4002,  4002001,	true  ,   -1 ),
(4002,  4002002,	true  ,   -1 ),
(4002,  4002003,	true  ,   -1 ),
(4002,  4002004,	true  ,   -1 ),
(4002,  4002005,	true  ,   -1 ),	
--academico-supervis
(4003,  4003001, 	true  ,   -1 ),
(4003,  4003002,	true  ,   -1 ),
(4003,  4003003,	true  ,   -1 ),
(4003,  4003004,	true  ,   -1 ),
(4003,  4003005,	true  ,   -1 ),	
--academico-coordina
(4004,  4004001,	true  ,   -1 ),
(4004,  4004002,	true  ,   -1 ),
(4004,  4004003,	true  ,   -1 ),
(4004,  4004004,	true  ,   -1 ),
(4004,  4004005,	true  ,   -1 ),
--
--medico 1          
(4501,  4501001,	true  ,   -1 ),
(4501,  4501002,	true  ,   -1 ),
--medico 2          
(4502,  4502001,	true  ,   -1 ),
(4502,  4502002,	true  ,   -1 ),
--medico 3          
(4503,  4503001,	true  ,   -1 ),
(4503,  4503002,	true  ,   -1 ),
--medico 4          
(4504,  4504001,	true  ,   -1 ),
(4504,  4504002,	true  ,   -1 ),
--medico 5          
(4505,  4505001,	true  ,   -1 ),
(4505,  4505002,	true  ,   -1 ),
--medico 6          
(4506,  4506001,	true  ,   -1 ),
(4506,  4506002,	true  ,   -1 ),
--medico 7          
(4507,  4507001,	true  ,   -1 ),
(4507,  4507002,	true  ,   -1 ),
--medico 8          
(4508,  4508001,	true  ,   -1 ),
(4508,  4508002,	true  ,   -1 ),
 
--banca 1           
(5001,  5001001,	true  ,   -1 ),
(5001,  5001002,	true  ,   -1 ),
--banca 2           
(5002,  5002001,	true  ,   -1 ),
(5002,  5002002,	true  ,   -1 ),
--banca 3           
(5003,  5003001,	true  ,   -1 ),
(5003,  5003002,	true  ,   -1 ),
--banca 4           
(5004,  5004001,	true  ,   -1 ),
(5004,  5004002,	true  ,   -1 );

*/




----------------------------------------------------------------------------------------------------------------------------------------
--adm.opcion----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS adm.opcion;
CREATE TABLE adm.opcion (
	id_opcion 		int 		NOT NULL PRIMARY KEY,	
	id_padre 		int 		NOT NULL,
	id_sistema		char(3)		NOT NULL,	
	id_perfil		int			NOT NULL,
	nom_opcion 		varchar(50) NOT NULL,
	nom_control 	varchar(75) NOT NULL,
	orden 			int 		NOT NULL,
	id_tipo_opcion 	int 	 	NOT NULL,	
	id_tipo_empresa	int			NOT NULL,	
	activo 			bool 		NOT NULL,
	premium 		bool 		NOT NULL,
	id_empresa 		int 		NOT NULL,
	CONSTRAINT opcion_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES adm.perfil(id_perfil) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE adm.opcion IS 'Opciones de cada perfil de sistema.'; 
COMMENT ON COLUMN adm.opcion.id_opcion IS 'Identificador de la opción.';
COMMENT ON COLUMN adm.opcion.id_padre IS 'Identificador de la opción superior, si no va -1.';
COMMENT ON COLUMN adm.opcion.id_sistema IS 'Identificador del sistema [ADM.SISTEMA].';
COMMENT ON COLUMN adm.opcion.id_perfil IS 'Identificador del perfil [ADM.PERFIL].';
COMMENT ON COLUMN adm.opcion.nom_opcion IS 'Nombre de la opción.';
COMMENT ON COLUMN adm.opcion.nom_control IS 'Ruta o nombre del control de usuario.';
COMMENT ON COLUMN adm.opcion.orden IS 'Orden en que se mostrará.';
COMMENT ON COLUMN adm.opcion.id_tipo_opcion IS 'Identificador del tipo de opcion [TI_OPCION_SIS].';
COMMENT ON COLUMN adm.opcion.id_tipo_empresa IS 'Identificador del tipo de empresa [TI_EMPRESA].';
COMMENT ON COLUMN adm.opcion.activo IS 'Si la opción esta activo o vigente.';
COMMENT ON COLUMN adm.opcion.premium IS 'Indica sí es una opción para clientes premium.';
COMMENT ON COLUMN adm.opcion.id_empresa IS 'Para todas las empresas -1, sino identificador de empresa [ADM.EMPRESA].';
--
INSERT INTO adm.opcion (id_opcion, id_padre, id_sistema, id_perfil, nom_opcion, nom_control, orden, id_tipo_opcion, id_tipo_empresa, activo, premium, id_empresa) 
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
(3001001,	     -1,  'CNT',  3001, 'CONFIGURACIÓN cnt AAAAAA'				, ''											,105,	95050 ,	   -1 , true , false , -1),
(3001002,	3001001,  'CNT',  3001, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,110,	95051 ,	   -1 , true , false , -1),
(3001003,	3001001,  'CNT',  3001, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,115,	95051 ,	   -1 , true , false , -1),
(3001004,	3001001,  'CNT',  3001, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,120,	95051 ,	   -1 , true , false , -1),
(3001005,	3001001,  'CNT',  3001, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,125,	95051 ,	   -1 , true , false , -1),	
--contable 2                                                                                                                        
(3002001,	     -1,  'CNT',  3002, 'CONFIGURACIÓN cnt bbbbbb'				, ''											,105,	95050 ,	   -1 , true , false , -1),
(3002002,	3002001,  'CNT',  3002, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,110,	95051 ,	   -1 , true , false , -1),
(3002003,	3002001,  'CNT',  3002, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,115,	95051 ,	   -1 , true , false , -1),
(3002004,	3002001,  'CNT',  3002, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,120,	95051 ,	   -1 , true , false , -1),
(3002005,	3002001,  'CNT',  3002, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,125,	95051 ,	   -1 , true , false , -1),	
--contable 3                                                                                                                              
(3003001,	     -1,  'CNT',  3003, 'CONFIGURACIÓN cnt CCCCC'				, ''											,105,	95050 ,	   -1 , true , false , -1),
(3003002,	3003001,  'CNT',  3003, 'financiero opcion opcion opcion A'		, 'com.yupana.polaris.app.UctSegCliente'		,110,	95051 ,	   -1 , true , false , -1),
(3003003,	3003001,  'CNT',  3003, 'financiero opcion opcion opcion B'		, 'com.yupana.polaris.app.UctSegCliente'		,115,	95051 ,	   -1 , true , false , -1),
(3003004,	3003001,  'CNT',  3003, 'financiero opcion opcion opcion C'		, 'com.yupana.polaris.app.UctSegCliente'		,120,	95051 ,	   -1 , true , false , -1),
(3003005,	3003001,  'CNT',  3003, 'financiero opcion opcion opcion D'		, 'com.yupana.polaris.app.UctSegCliente'		,125,	95051 ,	   -1 , true , false , -1),	
																																	
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





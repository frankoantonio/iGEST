--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--com.producto_proyecto-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.producto_proyecto;
CREATE TABLE com.producto_proyecto (
	id_prod_proy			serial			NOT NULL PRIMARY KEY,
	id_negocio				int				NOT NULL,
	nom_prod_proy			varchar(100)	NOT NULL,
	tipo					char(8)			NOT NULL,
	ventas					boolean			NOT NULL,
	planilla				boolean			NOT NULL,
	orden					int				NOT null,
	activo					boolean			NOT NULL,
	constraint producto_proyecto_id_negocio_fkey foreign key (id_negocio) references gen.negocio(id_negocio) match simple on update no action on delete no action 
);
--
COMMENT ON TABLE com.producto_proyecto IS 'Unidades de producción o proyectos.'; 
COMMENT ON COLUMN com.producto_proyecto.id_prod_proy IS 'Identificador de entidad.';
COMMENT ON COLUMN com.producto_proyecto.id_negocio IS 'Identificador de unidad de negocio [GEN.NEGOCIO].';
COMMENT ON COLUMN com.producto_proyecto.nom_prod_proy IS 'Nombre de la unidad de producción o proyecto.';
COMMENT ON COLUMN com.producto_proyecto.tipo IS 'PRODUCTO ó PROYECTO.';
COMMENT ON COLUMN com.producto_proyecto.ventas IS 'Para que se habilite las ventas. Un proyecto por lo general no tiene ventas.';
COMMENT ON COLUMN com.producto_proyecto.planilla IS 'Para que se habilite planillas de pago al personal.';
COMMENT ON COLUMN com.producto_proyecto.orden  IS 'Orden de los registros.';
COMMENT ON COLUMN com.producto_proyecto.activo  IS 'Para indicar sí el registro está activo.';
--
INSERT INTO com.producto_proyecto (id_negocio, nom_prod_proy, tipo, ventas, planilla, orden, activo)
values 
(10001,   'COMERCIO'					,  'PRODUCTO' , true , true, 	1,	true ), --ys
(10002,   'COMERCIO'					,  'PRODUCTO' , true , true,  	1,	true ), --ty
(10003,   'COMERCIO'					,  'PRODUCTO' , true , true, 	1,	true ), --mg
(10004,   'COMERCIO'					,  'PRODUCTO' , true , true,  	1,	true ), --escuela_ft  - VA PASAR A SER COLEGIO
						   
(10005,   'INICIAL'						,  'PRODUCTO' , true , true,  	1,	true ),	--colegio
(10005,   'PRIMARIA'					,  'PRODUCTO' , true , true,  	2,	true ),
(10005,   'SECUNDARIA'					,  'PRODUCTO' , true , true,  	3,	true ),
(10005,   'CONSTRUCCIONES'				,  'PROYECTO' , false, true, 	4,	true ),

(10006,   'INTENSIVO'					,  'PRODUCTO' , true , true, 	1,	true ), --academia
(10006,   'PRIMERA SELECCIÓN'			,  'PRODUCTO' , true , true, 	2,	true ),
(10006,   'SEMESTRAL'					,  'PRODUCTO' , true , true, 	3,	true ),	
(10006,   'REPASO'						,  'PRODUCTO' , true , true, 	4,	true ),
(10006,   'CICLO ESCOLAR INICIAL'		,  'PRODUCTO' , true , true, 	5,	true ),
(10006,   'CICLO ESCOLAR PRIMARIA'		,  'PRODUCTO' , true , true, 	6,	true ),
(10006,   'CICLO ESCOLAR SECUNDARIA'	,  'PRODUCTO' , true , true, 	7,	true ),
(10006,   'CICLO ANUAL'					,  'PRODUCTO' , true , true, 	8,	true ),
(10006,   'REFORZAMIENTO ACADÉMICO'		,  'PROYECTO' , true , true, 	9,	true ),
(10006,   'TALLERES'					,  'PRODUCTO' , true , true,   10,	false),

(10007,   'COMERCIO'					,  'PRODUCTO' , true , true, 	1,	true );	--complejo deportivo



--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--com.campania--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.campania;
create table com.campania (
	id_campania			bigserial		NOT NULL PRIMARY KEY,	
	id_negocio			int 			not null,
	id_sede				int 			not null,
	anio				int 			not null,
	frecuencia			int 			not null,	
	id_prod_proy		int 			not null,	
	fe_ini				date 			not null,
	fe_fin				date 			not null,
	nom_campania		varchar(100) 	not null,	
	activo				bool			not null,
	id_tipo_mod_est		int				not null,
	cod_sede			varchar(6)      not null,
	id_tipo_turno		int 			not null,
	id_tipo_inscripcion	int 			not null,
	matr_sin_pago 		bool			not null,
	fe_ini_clas			date 			not null,
	fe_fin_clas			date 			not null,
	id_tipo_periodo		int				not null, 
	redefinir			bool			not null,
	constraint campania_id_prod_proy_fkey foreign key (id_prod_proy) references com.producto_proyecto(id_prod_proy) match simple on update no action on delete no action 
);
--
CREATE UNIQUE index campania_frecuencia_ukey ON com.campania (id_negocio, id_sede, id_prod_proy, anio, frecuencia);
CREATE UNIQUE index campania_nom_campania_ukey ON com.campania (id_negocio, fn_my_unaccent(nom_campania));
--
COMMENT ON TABLE com.campania IS 'Campañas comerciales que se crean por cada unidad de negocio.'; 
COMMENT ON COLUMN com.campania.id_campania IS 'Identificador de campaña.';
COMMENT ON COLUMN com.campania.id_negocio IS 'Identificador de unidad de negocio [GEN.NEGOCIO].';
COMMENT ON COLUMN com.campania.id_sede IS 'Identificador de sede [GEN.SEDE].';
COMMENT ON COLUMN com.campania.anio IS 'Año de la campaña.';
COMMENT ON COLUMN com.campania.frecuencia IS 'Número de vez que se da una campaña en un mismo año.';
COMMENT ON COLUMN com.campania.id_prod_proy IS 'Identificador de unidad de producto o proyecto [COM.PRODUCTO_PROYECTO].';
COMMENT ON COLUMN com.campania.fe_ini IS 'Fecha de inicio de la campaña.';
COMMENT ON COLUMN com.campania.fe_fin IS 'Fecha de finalización de la campaña.';
COMMENT ON COLUMN com.campania.nom_campania IS 'Nombre descriptivo de la campaña.';
COMMENT ON COLUMN com.campania.activo IS 'Indica sí la campaña esta activo.';
COMMENT ON COLUMN com.campania.id_tipo_mod_est IS 'Identificador del tipo de modalidad de estudio [TI_MOD_ESTUDIO].';
COMMENT ON COLUMN com.campania.cod_sede IS 'Código o nombre corto de una sede.';
COMMENT ON COLUMN com.campania.id_tipo_turno IS 'Identificador del tipo de turno [TI_TURNO].';
COMMENT ON COLUMN com.campania.id_tipo_inscripcion IS 'Identificador del tipo de inscripción [TI_INSCR_ACA] ó [TI_INSCR_COL].';
COMMENT ON COLUMN com.campania.matr_sin_pago IS 'True, indica que todas las inscripciones pasaran al estado matriculado.';
COMMENT ON COLUMN com.campania.fe_ini_clas IS 'Fecha de inicio de clases.';
COMMENT ON COLUMN com.campania.fe_fin_clas IS 'Fecha de culminación de clases.';
COMMENT ON COLUMN com.campania.id_tipo_periodo IS 'Identificador del tipo de periodicidad [TI_PERIODICIDAD].';
COMMENT ON COLUMN com.campania.redefinir IS 'Indica si se puede redefinir este cronograma al momento de crear el cronograma del cliente.';
--
insert into com.campania (id_negocio, id_sede, anio, frecuencia, id_prod_proy, fe_ini, fe_fin, nom_campania, activo, id_tipo_mod_est, cod_sede, id_tipo_turno, id_tipo_inscripcion, matr_sin_pago, fe_ini_clas, fe_fin_clas, id_tipo_periodo, redefinir) 
values 
(10001,  1, 2020, 1,  1, '2020-01-01', '9999-12-31', 'CAMPAÑA FOREVER'				, TRUE ,   -1 , 'HYSI01' , 10340 , -1   , false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),                                                                	
(10002,  2, 2020, 1,  2, '2020-01-01', '2020-12-31', 'CAMPAÑA 2020 a'				, TRUE ,   -1 , 'HYSI01' , 10340 , -1   , false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),                                                                		
(10003,  3, 2020, 1,  3, '2020-01-01', '2020-12-31', 'CAMPAÑA 2020 b'				, TRUE ,   -1 , 'HYSI01' , 10340 , -1   , false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10004,  4, 2020, 1,  4, '2020-01-01', '2020-12-31', 'CAMPAÑA 2020 c'				, TRUE ,   -1 , 'HYSI01' , 10340 , -1   , false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
																																											 
(10005,  6, 2019, 1,  5, '2019-03-01', '2019-12-20', 'INICIAL 2019'					, FALSE, 10700, 'HYSI01' , 10340 , 10710, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10005,  6, 2019, 1,  6, '2019-03-01', '2019-12-20', 'PRIMARIA 2019'				, FALSE, 10700, 'HYSI01' , 10340 , 10710, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10005,  6, 2019, 1,  7, '2019-03-01', '2019-12-20', 'SECUNDARIA 2019'				, FALSE, 10700, 'HYSI01' , 10340 , 10710, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
																																											 
(10005,  6, 2020, 1,  5, '2020-03-01', '2020-12-20', 'INICIAL 2020'					, TRUE , 10700, 'HYSI01' , 10340 , 10710, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10005,  6, 2020, 1,  6, '2020-03-01', '2020-12-20', 'PRIMARIA 2020'				, TRUE , 10700, 'HYSI01' , 10340 , 10710, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10005,  6, 2020, 1,  7, '2020-03-01', '2020-12-20', 'SECUNDARIA 2020'				, TRUE , 10700, 'HYSI01' , 10340 , 10710, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
																																											 
(10005,  6, 2021, 1,  5, '2021-03-01', '2021-12-20', 'INICIAL 2021'					, TRUE , 10700, 'HYSI01' , 10340 , 10710, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10005,  6, 2021, 1,  6, '2021-03-01', '2021-12-20', 'PRIMARIA 2021'				, TRUE , 10700, 'HYSI01' , 10340 , 10710, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10005,  6, 2021, 1,  7, '2021-03-01', '2021-12-20', 'SECUNDARIA 2021'				, TRUE , 10700, 'HYSI01' , 10340 , 10710, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
																																											 
(10006,  9, 2019, 1, 10, '2018-12-10', '2019-03-31', 'HYO - PRIMERA SELECCIÓN I'	, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006,  9, 2019, 2, 11, '2018-12-20', '2019-05-31', 'HYO - SEMESTRAL I'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006,  9, 2019, 3, 10, '2019-06-01', '2019-11-30', 'HYO - PRIMERA SELECCIÓN II'	, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006,  9, 2019, 4, 11, '2019-07-01', '2019-12-10', 'HYO - SEMESTRAL II'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),

(10006,  9, 2020, 5, 10, '2019-12-10', '2020-03-31', 'HYO - PRIMERA SELECCIÓN I a'	, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006,  9, 2020, 6, 11, '2019-12-20', '2020-05-31', 'HYO - SEMESTRAL I a'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006,  9, 2020, 7, 10, '2020-06-01', '2020-11-30', 'HYO - PRIMERA SELECCIÓN II b'	, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006,  9, 2020, 8, 11, '2020-07-01', '2020-12-10', 'HYO - SEMESTRAL II b'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),

(10006, 13, 2020, 9, 10, '2019-12-10', '2020-03-31', 'JAUJA - PRIMERA SELECCIÓN I'	, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2020,10, 11, '2019-12-20', '2020-05-31', 'JAUJA - SEMESTRAL I'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2020,11, 10, '2020-06-01', '2020-11-30', 'JAUJA - PRIMERA SELECCIÓN II'	, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2020,12, 11, '2020-07-01', '2020-12-10', 'JAUJA - SEMESTRAL II'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),

(10007,  8, 2020, 1, 19, '2020-01-01', '2020-12-31', 'CAMPAÑA 2020 d'				, TRUE , -1   , 'HYSI01' , 10340 , -1   , false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),

(10006, 13, 2022, 7,  9, '2022-12-10', '2022-03-31', 'JAUJA - INTENSIVO X'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2022, 8, 10, '2022-12-20', '2022-05-31', 'JAUJA - PRIMERA SELECCIÓN X'	, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2022, 9, 11, '2022-06-01', '2022-11-30', 'JAUJA - SEMESTRAL X'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2022,10, 12, '2022-07-01', '2022-12-10', 'JAUJA - REPASO X'				, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2022,11, 13, '2022-12-10', '2022-03-31', 'JAUJA - INICIAL X'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2022,12, 14, '2022-12-20', '2022-05-31', 'JAUJA - PRIMARIA X'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2022,13, 15, '2022-06-01', '2022-11-30', 'JAUJA - SECUNDARIA X'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2022,14, 16, '2022-07-01', '2022-12-10', 'JAUJA - CICLADO ANUAL X'		, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2022,15, 17, '2022-07-01', '2022-12-10', 'JAUJA - REFORZAMIENTO ACAD. X', TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true ),
(10006, 13, 2022,16, 18, '2022-07-01', '2022-12-10', 'JAUJA - TALLERES X'			, TRUE , 10700, 'HYSI01' , 10340 , 10720, false , '0001-01-01' , '0001-01-01' , 10354 ,  true );



--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--com.cronograma_plantilla--------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.cronograma_plantilla;
create table com.cronograma_plantilla (
	id_cron_plant		bigserial		NOT NULL PRIMARY KEY,
	id_campania			bigint			NOT NULL,		
	orden				int				NOT NULL,
	nombre				varchar(50)		NOT NULL,
	num_mes				int				NOT NULL,
	periodo				varchar(7)		NOT NULL,
	fe_pago				date			NOT NULL,
	fe_pago_orig		date			NOT NULL,
	eliminado			bool			NOT NULL,
	constraint cronograma_plantilla_id_campania_fkey  foreign key (id_campania) references com.campania(id_campania) match simple on update no action on delete no action 
);
--
COMMENT ON TABLE com.cronograma_plantilla IS 'Plantilla de cronograma de pagos.'; 
COMMENT ON COLUMN com.cronograma_plantilla.id_cron_plant IS 'Identificador de entidad.';
COMMENT ON COLUMN com.cronograma_plantilla.id_campania IS 'Identificador de campaña [COM.CAMPANIA].';
COMMENT ON COLUMN com.cronograma_plantilla.orden IS 'Orden de las cuotas.';
COMMENT ON COLUMN com.cronograma_plantilla.nombre IS 'Nombre de la cuota.';
COMMENT ON COLUMN com.cronograma_plantilla.num_mes IS 'Número del mes, del 1 al 12.';
COMMENT ON COLUMN com.cronograma_plantilla.periodo IS 'Periodo del año, en formato yyyy-mm.';
COMMENT ON COLUMN com.cronograma_plantilla.fe_pago IS 'Fecha de pago de la cuota.';
COMMENT ON COLUMN com.cronograma_plantilla.fe_pago_orig IS 'Fecha original de pago de la cuota.';
COMMENT ON COLUMN com.cronograma_plantilla.eliminado IS 'True, indica que el registro fue eliminado.';
--
insert into com.cronograma_plantilla (id_campania, orden, nombre, num_mes, periodo, fe_pago, fe_pago_orig, eliminado) 
values 
( 11 ,  1 , '2023-MARZO'	 	, 3  , '2023-03' , '2023-03-31' , '2023-03-31' , false), 
( 11 ,  2 , '2023-ABRIL'	 	, 4  , '2023-04' , '2023-04-30' , '2023-04-30' , false), 
( 11 ,  3 , '2023-MAYO'		 	, 5  , '2023-05' , '2023-05-31' , '2023-05-31' , false), 
( 11 ,  4 , '2023-JUNIO' 		, 6  , '2023-06' , '2023-06-30' , '2023-06-30' , false), 
( 11 ,  5 , '2023-JULIO' 		, 7  , '2023-07' , '2023-07-31' , '2023-07-31' , false), 
( 11 ,  6 , '2023-AGOSTO' 		, 8  , '2023-08' , '2023-08-31' , '2023-08-31' , false), 
( 11 ,  7 , '2023-SETIEMBRE'	, 9  , '2023-09' , '2023-09-30' , '2023-09-30' , false), 
( 11 ,  8 , '2023-OCTUBRE' 		, 10 , '2023-10' , '2023-10-31' , '2023-10-31' , false), 
( 11 ,  9 , '2023-NOVIEMBRE' 	, 11 , '2023-11' , '2023-11-30' , '2023-11-30' , false),
( 11 , 10 , '2023-DICIEMBRE' 	, 12 , '2023-12' , '2023-12-31' , '2023-12-31' , false);




----------------------------------------------------------------------------------------------------------------------------------------
--com.afectacion------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.afectacion; 
create table com.afectacion (
	id_afectacion	int 		not null primary key,
	nom_afectacion	varchar(75)	not null,
	registro		char(2)		not null,
	orden			int 		not null,
	activo			boolean 	not null
);
--
insert into com.afectacion (id_afectacion, nom_afectacion, registro, orden, activo)
values  
(10, 'GRAVADO - OPERACIÓN ONEROSA.'								, 	'RV'	, 1, TRUE ),
(20, 'EXONERADO - OPERACIÓN ONEROSA.'							, 	'RV'	, 2, TRUE ),
(30, 'INAFECTO - OPERACIÓN ONEROSA.'							, 	'RV'	, 3, TRUE ),
(40, 'EXPORTACIÓN'												, 	'RV'	, 4, TRUE ),
(11, '[GRATUITA] GRAVADO. RETIRO POR PREMIO'					, 	'RV'	, 5, FALSE),
(12, '[GRATUITA] GRAVADO. RETIRO POR DONACIÓN'					, 	'RV'	, 6, FALSE),
(13, '[GRATUITA] GRAVADO. RETIRO'								, 	'RV'	, 7, FALSE),
(14, '[GRATUITA] GRAVADO. RETIRO POR PUBLICIDAD'				, 	'RV'	, 8, FALSE),
(15, '[GRATUITA] GRAVADO. BONIFICACIONES'						, 	'RV'	, 9, FALSE),
(16, '[GRATUITA] GRAVADO. RETIRO POR ENTREGA A TRABAJADORES'	, 	'RV'	,10, FALSE),
(31, '[GRATUITA] INAFECTO. RETIRO POR BONIFICACIÓN'				, 	'RV'	,11, FALSE),
(32, '[GRATUITA] INAFECTO. RETIRO'								, 	'RV'	,12, FALSE),
(33, '[GRATUITA] INAFECTO. RETIRO POR MUESTRAS MÉDICAS'			, 	'RV'	,13, FALSE),
(34, '[GRATUITA] INAFECTO. RETIRO POR CONVENIO COLECTIVO'		, 	'RV'	,14, FALSE),
(35, '[GRATUITA] INAFECTO. RETIRO POR PREMIO'					, 	'RV'	,15, FALSE),
(36, '[GRATUITA] INAFECTO. RETIRO POR PUBLICIDAD'				, 	'RV'	,16, FALSE);
select * from com.afectacion a;




--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--com.producto_sunat--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.producto_sunat;
create table com.producto_sunat (
	id_prod_sunat  	bigserial		NOT NULL PRIMARY KEY,
	tipo			varchar(10)		NOT NULL,
	codigo			varchar(10)		NOT NULL,
	codigo_padre	varchar(10)		NOT NULL,
	nombre			varchar(250)	NOT NULL,
	nivel			int				NOT NULL
);
--
COMMENT ON TABLE com.producto_sunat IS 'Categorización de bienes y servicios según SUNAT-UNSPSC.'; 
COMMENT ON COLUMN com.producto_sunat.id_prod_sunat IS 'Identificador autoincremental.';
COMMENT ON COLUMN com.producto_sunat.tipo IS 'Tipo [Segmento, Familia, Clase, Producto]';
COMMENT ON COLUMN com.producto_sunat.codigo IS 'Código de producto que asigna SUNAT.';
COMMENT ON COLUMN com.producto_sunat.codigo_padre IS 'Código de producto del nivel superior.';
COMMENT ON COLUMN com.producto_sunat.nombre IS 'Nombre del bien o servicio.';
COMMENT ON COLUMN com.producto_sunat.nivel IS 'Nivel del 1 al 4 que corresponde al campo "tipo".';
--
--IR AL SCRIPT 02.01_
--




--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--com.categoria-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.categoria;
create table com.categoria (
	id_categoria	bigserial		NOT NULL PRIMARY KEY,
	nom_categoria 	varchar(100)	NOT NULL,	
	cod_interno		varchar(10)		NOT NULL,
	orden			int				NOT NULL,	
	id_negocio		int  			NOT NULL,
	id_empresa		int				NOT NULL,
	id_clase_sunat	bigint			NOT NULL
);
--
COMMENT ON TABLE com.categoria is 'Categorización de los bienes o servicios de una unidad de negocio.'; 
COMMENT ON COLUMN com.categoria.id_categoria IS 'Identificador autoincremental de categoría.';
COMMENT ON COLUMN com.categoria.nom_categoria IS 'Nombre de categoría.';
COMMENT ON COLUMN com.categoria.cod_interno IS 'Código interno.';
COMMENT ON COLUMN com.categoria.orden IS 'Para mostrar en el orden indicado.';
COMMENT ON COLUMN com.categoria.id_negocio IS 'Identificador de unidad de negocio.';
COMMENT ON COLUMN com.categoria.id_empresa IS 'Identificador de empresa.';
COMMENT ON COLUMN com.categoria.id_clase_sunat IS 'Identificador de "Código de Clase SUNAT".';
--
ALTER SEQUENCE com.categoria_id_categoria_seq RESTART WITH 1000;
-- 
insert into com.categoria (id_categoria, nom_categoria, cod_interno, orden, id_negocio, id_empresa, id_clase_sunat) 
values  
( 1, 'SISTEMAS'									,	'SIS' 	, 1 , 10001, 1001 ,  1),
( 2, 'WEB HOSTING'								,	'WEB' 	, 2 , 10001, 1001 ,  2),
( 3, 'TECNOLOGÍA Y ELECTRÓNICA'					,	'TEC' 	, 3 , 10001, 1001 ,  3),
( 4, 'SEGURIDAD Y ACCESO'						,	'SEG' 	, 4 , 10001, 1001 ,  3),
( 5, 'BIENES. SUMINISTROS. HERRAMIENTAS.'		,	'BIE' 	, 5 , 10001, 1001 ,  3),
( 6, 'SERVICIOS DIVERSOS'						,	'SER' 	, 6 , 10001, 1001 ,  3),
( 7, 'MUEBLE. INMUEBLE. MAQUINARIA. EQUIPO'		,	'MAQ'	, 7 , 10001, 1001 ,  3),
																				 
( 8, 'UNIFORME ESCOLAR'							,	'UNF'	, 1	, 10002, 1002 ,  3),		--BAZAR
( 9, 'BUZO ESCOLAR'								,	'BUZ'	, 2	, 10002, 1002 ,  3),
(10, 'LIBROS'									,	'LIB'	, 3	, 10002, 1002 ,  3),
(11, 'PLAN LECTOR'								,	'PLE'	, 4	, 10002, 1002 ,  3),
(12, 'BIENES. SUMINISTROS. HERRAMIENTAS.'		,	'BIE' 	, 5 , 10002, 1002 ,  3),
(13, 'SERVICIOS DIVERSOS'						,	'SER' 	, 6 , 10002, 1002 ,  3),
(14, 'MUEBLE. INMUEBLE. MAQUINARIA. EQUIPO'		,	'MAQ'	, 7 , 10002, 1002 ,  3),
																				 
(15, 'LIBROS'									,	'LIB'	, 1	, 10003, 1003 ,  3),		--EDITORIAL
(16, 'PLAN LECTOR'								,	'PLE'	, 2	, 10003, 1003 ,  3),
(17, 'BIENES. SUMINISTROS. HERRAMIENTAS.'		,	'BIE' 	, 3 , 10003, 1003 ,  3),
(18, 'SERVICIOS DIVERSOS'						,	'SER' 	, 4 , 10003, 1003 ,  3),
(19, 'MUEBLE. INMUEBLE. MAQUINARIA. EQUIPO'		,	'MAQ'	, 5 , 10003, 1003 ,  3),
																				 
(20, 'SERVICIOS GIMNASIO'						,	'GIM'	, 1	, 10004, 1004 ,  3),		--GIMNASIO
(21, 'ARTÍCULOS DIVERSOS'						,	'ART'	, 2	, 10004, 1004 ,  3),
(22, 'BIENES. SUMINISTROS. HERRAMIENTAS.'		,	'BIE' 	, 3 , 10004, 1004 ,  3),
(23, 'SERVICIOS DIVERSOS'						,	'SER' 	, 4 , 10004, 1004 ,  3),
(24, 'MUEBLE. INMUEBLE. MAQUINARIA. EQUIPO'		,	'MAQ'	, 5 , 10004, 1004 ,  3),
																				 
(25, 'ALIMENTOS. BEBIDAS'						,	'ALI'	, 1	, 10005, 1005 ,  3),		--SJBCORP
(26, 'LIMPIEZA. HIGIENE. SEGURIDAD. SALUD'		,	'LIM'   , 2	, 10005, 1005 ,  3),
(27, 'MUEBLES. DECORACIÓN'						,	'MUE'	, 3	, 10005, 1005 ,  3),
(28, 'TECNOLOGÍA. ELECTRÓNICA'					,	'TEC'	, 4	, 10005, 1005 ,  3),
(29, 'ÚTILES. ACCESORIOS DE OFICINA'			,	'OFI'	, 5	, 10005, 1005 ,  3),
(30, 'HERRAMIENTAS. UTENSILIOS'					,	'HER' 	, 6 , 10005, 1005 ,  3),
(31, 'SUMINISTROS DIVERSOS'						,	'SUM' 	, 3 , 10005, 1005 ,  3),
(32, 'SERVICIOS DIVERSOS'						,	'SER' 	, 4 , 10005, 1005 ,  3),
(33, 'INMUEBLE. MAQUINARIA. EQUIPO'				,	'MAQ'	, 5 , 10005, 1005 ,  3),
																				 
(34, 'SERVICIOS EDUCATIVOS'						,	'EDU'	, 1	, 10005, 1005 ,  3),		--SJBCORP-COLEGIO
(35, 'OTROS SERVICIOS EDUCATIVOS'				,	'OSE'	, 2	, 10005, 1005 ,  3),
(36, 'OTROS INGRESOS OPERATIVOS'				,	'OIN'	, 3	, 10005, 1005 ,  3),
																				 
(37, 'SERVICIOS EDUCATIVOS'						,	'EDU'	, 1	, 10006, 1005 ,  3),		--SJBCORP-ACADEMIA
(38, 'OTROS SERVICIOS EDUCATIVOS'				,	'OSE'	, 2	, 10006, 1005 ,  3),
(39, 'OTROS INGRESOS OPERATIVOS'				,	'OIN'	, 3	, 10006, 1005 ,  3),
																				 
(40, 'ALQUILERES POR HORA'						,	'ALQ'	, 1	, 10007, 1005 ,  3),		--SJBCORP-POLIDEPORTIVO
(41, 'OTROS INGRESOS OPERATIVOS'				,	'OIO'	, 2	, 10007, 1005 ,  3),
																				 
(42, 'AUTOS, CAMIONETAS, VANS'					,	'AUT'	, 1	, 10008, 1006 ,  3),		--MOTORS
(43, 'CAMIONES, BUSES'							,	'CAM'	, 2	, 10008, 1006 ,  3),
(44, 'MAQUINARIA PESADA'						,	'MAQ'	, 3	, 10008, 1006 ,  3),
(45, 'REPUESTOS Y/O LUBRICANTES'				,	'REP'	, 4	, 10008, 1006 ,  3),
(46, 'BIENES. SUMINISTROS. HERRAMIENTAS.'		,	'BIE' 	, 5 , 10008, 1006 ,  3),
(47, 'SERVICIOS DIVERSOS'						,	'SER' 	, 6 , 10008, 1006 ,  3),
(48, 'MUEBLE. INMUEBLE. MAQUINARIA. EQUIPO'		,	'MAQ'	, 7 , 10008, 1006 ,  3),
																				 
																				 
(49, 'ALIMENTOS. BEBIDAS'						,	'ALI'	, 1	, 10006, 1005 ,  3),		--SJBCORP
(50, 'LIMPIEZA. HIGIENE. SEGURIDAD. SALUD'		,	'LIM'   , 2	, 10006, 1005 ,  3),
(51, 'MUEBLES. DECORACIÓN'						,	'MUE'	, 3	, 10006, 1005 ,  3),
(52, 'TECNOLOGÍA. ELECTRÓNICA'					,	'TEC'	, 4	, 10006, 1005 ,  3),
(53, 'ÚTILES. ACCESORIOS DE OFICINA'			,	'OFI'	, 5	, 10006, 1005 ,  3),
(54, 'HERRAMIENTAS. UTENSILIOS'					,	'HER' 	, 6 , 10006, 1005 ,  3),
(55, 'SUMINISTROS DIVERSOS'						,	'SUM' 	, 3 , 10006, 1005 ,  3),
(56, 'SERVICIOS DIVERSOS'						,	'SER' 	, 4 , 10006, 1005 ,  3),
(57, 'INMUEBLE. MAQUINARIA. EQUIPO'				,	'MAQ'	, 5 , 10006, 1005 ,  3),
																				 
(58, 'ALIMENTOS. BEBIDAS'						,	'ALI'	, 1	, 10007, 1005 ,  3),		--SJBCORP
(59, 'LIMPIEZA. HIGIENE. SEGURIDAD. SALUD'		,	'LIM'   , 2	, 10007, 1005 ,  3),
(60, 'MUEBLES. DECORACIÓN'						,	'MUE'	, 3	, 10007, 1005 ,  3),
(61, 'TECNOLOGÍA. ELECTRÓNICA'					,	'TEC'	, 4	, 10007, 1005 ,  3),
(62, 'ÚTILES. ACCESORIOS DE OFICINA'			,	'OFI'	, 5	, 10007, 1005 ,  3),
(63, 'HERRAMIENTAS. UTENSILIOS'					,	'HER' 	, 6 , 10007, 1005 ,  3),
(64, 'SUMINISTROS DIVERSOS'						,	'SUM' 	, 3 , 10007, 1005 ,  3),
(65, 'SERVICIOS DIVERSOS'						,	'SER' 	, 4 , 10007, 1005 ,  3),
(66, 'INMUEBLE. MAQUINARIA. EQUIPO'				,	'MAQ'	, 5 , 10007, 1005 ,  3);




--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
--com.articulo--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.articulo; 
create table com.articulo (
	id_articulo			bigserial		NOT NULL PRIMARY KEY,
	id_categoria		bigint			NOT NULL,
	id_afectacion		int				NOT NULL,
	venta				bool			NOT NULL, 
	compra				bool			NOT NULL,
	cod_interno			varchar(20)		NOT NULL,
	id_prod_sunat		bigint			NOT NULL,
	sub_categoria		varchar(50)		NOT NULL,
	nom_articulo 		varchar(75)		NOT NULL,
	marca		 		varchar(75)		NOT NULL,
	modelo 				varchar(75)		NOT NULL,		
	descripcion			varchar(250)	NOT NULL,		
	activo				bool			NOT NULL,
	und_med				varchar(6)		NOT NULL,
	validado			bool			NOT NULL,
	fraccion			int				NOT NULL,  	
	tipo				char(1)			NOT NULL,
	precio_con_igv		numeric(18,4)	NOT NULL,
	precio_con_igv_fr 	numeric(18,4)	NOT NULL,
	id_negocio			int  			NOT NULL,
	id_empresa			int				NOT NULL,
	edit_precio			boolean			NOT NULL,	
	patrimonio			boolean			NOT NULL,
	stock				int				NOT NULL,
	stock_fr			int				NOT NULL,
	und_moneda			char(3)			NOT NULL,
	constraint articulo_id_categoria_fkey  foreign key (id_categoria) references com.categoria(id_categoria) match simple on update no action on delete no action,
	constraint articulo_id_afectacion_fkey foreign key (id_afectacion) references com.afectacion(id_afectacion) match simple on update no action on delete no action
);
--
COMMENT ON TABLE com.articulo IS 'Bienes y servicios por unidad de negocio.'; 
COMMENT ON COLUMN com.articulo.id_articulo IS 'Identificador autoincremental de artículo.';
COMMENT ON COLUMN com.articulo.id_categoria is 'Identificador de categoría.';
COMMENT ON COLUMN com.articulo.id_afectacion is 'Identificador del tipo de afectación IGV.';
COMMENT ON COLUMN com.articulo.venta IS 'Indica sí el B/S es para vender.';
COMMENT ON COLUMN com.articulo.compra IS 'Indica sí el B/S es para comprar.';
COMMENT ON COLUMN com.articulo.cod_interno IS 'Correlativo por cada unidad de negocio.';
COMMENT ON COLUMN com.articulo.id_prod_sunat IS 'Identificador del "Código Producto SUNAT".';
COMMENT ON COLUMN com.articulo.sub_categoria IS 'Nombre descriptivo para subagrupar los B/S.';
COMMENT ON COLUMN com.articulo.nom_articulo IS 'Nombre generico del bien o servicio.';
COMMENT ON COLUMN com.articulo.marca is 'Nombre de la marca.';
COMMENT ON COLUMN com.articulo.modelo is 'Nombre del modelo.';
COMMENT ON COLUMN com.articulo.descripcion IS 'Descripción del bien o servicio.';
COMMENT ON COLUMN com.articulo.activo IS 'Sí esta activo se puede vender.';
COMMENT ON COLUMN com.articulo.und_med IS 'Tipo de unidad de medida [TI_UNDMEDI].';
COMMENT ON COLUMN com.articulo.validado  IS 'Sí esta validado no se podrá cambiar el nombre, marca, modelo.';
COMMENT ON COLUMN com.articulo.fraccion  IS 'Indica en cuantas partes se puede fraccionar.';
COMMENT ON COLUMN com.articulo.tipo IS 'Indica sí es (B)ien o (S)ervico.';
COMMENT ON COLUMN com.articulo.precio_con_igv IS 'Precio de venta, incluido el IGV sí está "Gravado".';
COMMENT ON COLUMN com.articulo.precio_con_igv_fr IS 'Precio de venta de una fraccion, incluido el IGV sí está "Gravado.';
COMMENT ON COLUMN com.articulo.id_negocio IS 'Identificador de la unidad de negocio.';
COMMENT ON COLUMN com.articulo.id_empresa IS 'Identificador de la empresa.';
COMMENT ON COLUMN com.articulo.edit_precio IS 'Indica sí al momento de vender, el usuario puede modificar el precio.';
COMMENT ON COLUMN com.articulo.patrimonio IS 'Indica sí el bien, será considerado como parte del patrimonio.';
COMMENT ON COLUMN com.articulo.stock IS 'Cantidad total del bien.';
COMMENT ON COLUMN com.articulo.stock_fr IS 'Cantidad total de las fracciones del bien.';
COMMENT ON COLUMN com.articulo.und_moneda IS 'Tipo de moneda [TI_MONEDAS].';
--
ALTER SEQUENCE com.articulo_id_articulo_seq RESTART WITH 1000;
--
insert into com.articulo (id_categoria, id_afectacion, venta, compra, cod_interno, id_prod_sunat, sub_categoria, nom_articulo, marca, modelo, descripcion, 
	activo, und_med, validado, fraccion, tipo, precio_con_igv, precio_con_igv_fr, id_negocio, id_empresa, edit_precio, patrimonio, stock, stock_fr, und_moneda) -- EN OTRO FORMULARIO ALQUILERES: poner los horarios y dias que se alquila, con pago o separado solamente
values 
(  1, 10, true , false, '001', 4540 , '',  'DESARROLLO DE SISTEMAS.'					, ''		   	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , true , '002', 4550 , '',  'FACT. ELECTRÓNICA. CLOUD SERVER.'			, ''		   	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , true , '003', 4560 , '',  'FACT. ELECTRÓNICA. P.S.E.'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '004', 4540 , '',  'FACT. ELECTRÓNICA. INTEGRACIÓN PSE-OSE.' 	, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '005', 4540 , '',  'POLARIS SISTEMA COMERCIAL.'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '006', 4540 , '',  'POLARIS SISTEMA LOGÍSTICO.'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '007', 4540 , '',  'POLARIS SISTEMA LABORAL.'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '008', 4540 , '',  'POLARIS SISTEMA FINANCIERO.'				, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '009', 4540 , '',  'POLARIS SISTEMA ACADEMICO.'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '010', 4540 , '',  'POLARIS SISTEMA INTEGRAL.'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',1000.0000 , 1180.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , true , '011', 4540 , '',  'COMPROBANTE ADICIONAL VENTAS'				, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0847 ,    0.1000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '012', 4540 , '',  'COMPROBANTE ADICIONAL COMPRAS'				, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0847 ,    0.1000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '013', 4540 , '',  'COLABORADOR ADICIONAL'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.4237 ,    0.5000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '014', 4540 , '',  'ESTUDIANTE ADICIONAL'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.4237 ,    0.5000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '015', 4540 , '',  'UNIDAD DE NEGOCIO ADICIONAL'				, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 100.0000 ,  118.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  1, 10, true , false, '016', 4540 , '',  'POLARIS SISTEMA ADMINISTRACIÓN LOCAL'		, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',1200.0000 , 1416.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
																																																		  
(  2, 10, true , false, '017', 4550 , '',  'DESARROLLO DE SITIOS WEB'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',     0.00 ,    0.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, true , false, '018', 4550 , '',  'ADMINISTRACIÓN WEB Y CORREO INSTITUCIONAL'	, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   600.00 ,  708.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, false, true , '019', 4550 , '',  'HOSTING RESELLER'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',     0.00 ,    0.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, true , false, '020', 4550 , '',  'HOSTING 01 GB PERSONAL'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   100.00 ,  118.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, true , false, '021', 4550 , '',  'HOSTING 03 GB PROFESIONAL'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   150.00 ,  177.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, true , false, '022', 4550 , '',  'HOSTING 05 GB EJECUTIVO'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   200.00 ,  236.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, true , false, '023', 4550 , '',  'HOSTING 10 GB EMPRESA LIGHT'				, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   370.00 ,  436.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, true , false, '024', 4550 , '',  'HOSTING 20 GB EMPRESA STANDARD'				, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   700.00 ,  826.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, true , false, '025', 4550 , '',  'HOSTING 30 GB EMPRESA FULL'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   990.00 , 1168.2000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, true , false, '026', 4550 , '',  'HOSTING 50 GB CORPORATIVO'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  1200.00 , 1416.0000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, true , true , '027', 4550 , '',  'DOMINIOS .COM .NET .ORG'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',    90.00 ,  106.2000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  2, 10, true , true , '028', 4550 , '',  'DOMINIOS .PE'								, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
--                                                                                                                                                                                                          
(  3, 10, true , true , '029', 4550 , '',  'CASE '										, ''		  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '030', 4550 , '',  'PLACA COMPUTADOR.'							, 'AVATEQ'  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '031', 4550 , '',  'MEMORIA RAM'								, 'KINGSTON'	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '032', 4550 , '',  'DISCO DURO'									, 'SEGATE'  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '033', 4550 , '',  'LECTORA DVD'								, 'SAMSUMG' 	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '034', 4550 , '',  'FUENTES ATX'								, 'GYGABYE' 	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '035', 4550 , '',  'ESTABILIZAR.'								, 'FORZA'	  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '036', 4550 , '',  'MONITOR'									, 'SAMSUNG' 	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '037', 4550 , '',  'MOUSE.'										, 'LOGITECH'	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '038', 4550 , '',  'TECLAdo'									, 'LOGITECH'	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '039', 4550 , '',  'kit TECLAFO MOUSE.'							, 'MICROSOF'	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '040', 4550 , '',  'PARLANTES'									, 'CYBERTEL'	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '041', 4550 , '',  'SWITCH 48 PUERTOS OFFICE'					, 'HP'	 		,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  3, 10, true , true , '042', 4550 , '',  'SWITCH 16 PUERTOS'							, 'TPLINK'		,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
--                                                                                                                                                                                                          
(  4, 10, true , true , '043', 4550 , '',  'DVR 4 CANALES'								, 'HIKVISION' 	,'' 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  4, 10, true , true , '044', 4550 , '',  'CAMARA DOMO 720 HD'							, 'HIKVISION' 	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  4, 10, true , true , '045', 4550 , '',  'CAMARA TUBO 720 HD'							, 'HIKVISION' 	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  4, 10, true , true , '046', 4550 , '',  'BALUN'										, 'HIKVISION' 	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  4, 10, true , true , '047', 4550 , '',  'ADAPATADORES ENERGIA'						, ''	      	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
--                                                                                                                                                                                                         
(  5, 10, true , false, '048', 4550 , '',  'CAJAS DE PASE 5IN x 5IN'					, ''		  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  5, 10, true , false, '049', 4550 , '',  'TORNILLOS 2IN'								, ''	  	  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  5, 10, true , false, '050', 4550 , '',  'ESTOBONES 1/4'								, ''	  	  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  5, 10, true , true , '051', 4550 , '',  'CANALESTAS 39*19'							, 'SATRA'	  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  5, 10, true , true , '052', 4550 , '',  'CANALESTAS 24*14'							, 'SATRA'	  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  5, 10, true , false, '053', 4550 , '',  'ALICATE.'									, 'STANLEY'		,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  5, 10, true , false, '054', 4550 , '',  'MARTILLO'									, 'CYBERLINK' 	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  5, 10, true , true , '055', 4550 , '',  'PAD MOOUSE.'								, ''	  	  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
(  5, 10, true , true , '056', 4550 , '',  'FUNDAS'										, ''	  	  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10001, 1001 , false, false,  1, 0 , 'PEN'),
--------------------------------                                                                                                                                                                            
(  8, 10, true , true , '001', 4550 , '',  'PANTALÓN 12'								, 'ROGER'	  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
(  8, 10, true , true , '002', 4550 , '',  'PANTALÓN 14'								, 'ROGER'  		,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
(  8, 10, true , true , '003', 4550 , '',  'CAMISA 12'									, 'ROGER'  		,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
(  8, 10, true , true , '004', 4550 , '',  'CAMISA 12'									, 'GLORIA'		,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
(  8, 10, true , true , '005', 4550 , '',  'FALDA 15'									, 'GLORIA'		,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
(  8, 10, true , true , '006', 4550 , '',  'MEDIAS M'									, ''		  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
(  8, 10, true , true , '007', 4550 , '',  'MEDIAS L'									, ''		  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
(  9, 10, true , true , '008', 4550 , '',  'BUZO L PANTALÓN'							, ''	  	  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
(  9, 10, true , true , '009', 4550 , '',  'BUZO L CASACA'								, ''	  	  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
( 10, 20, true , true , '010', 4550 , '',  '3AÑO MATEMATICA'							, 'NORMA'	  	,'LIB.INI'	, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
( 10, 20, true , true , '011', 4550 , '',  '6GDO MATEMATICA'							, 'NORMA'  		,'LIB.PRI'	, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
( 10, 20, true , true , '012', 4550 , '',  '5GDO MATEMATICA'							, 'NORMA'  		,'LIB.SEC'	, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
( 11, 20, true , true , '013', 4550 , '',  'CAPERUCITA ROJA'							, 'SANTILLANA'	,'PL. PRI'	, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
( 11, 20, true , true , '014', 4550 , '',  'LOS PERROS HAMBRIENTOS'						, 'SM'	  		,'PL. SEC'	, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10002, 1002 , false, false,  1, 0 , 'PEN'),
--------------------------------                                                                                                                                                                            
( 15, 20, true , true , '001', 4550 , '',  '3AÑO MATEMATICA'							, 'NORMA'	  	,'LIB.INI'	, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10003, 1003 , false, false,  1, 0 , 'PEN'),
( 15, 20, true , true , '002', 4550 , '',  '6GDO MATEMATICA'							, 'NORMA'  		,'LIB.PRI'	, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10003, 1003 , false, false,  1, 0 , 'PEN'),
( 15, 20, true , true , '003', 4550 , '',  '5GDO MATEMATICA'							, 'NORMA'  		,'LIB.SEC'	, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10003, 1003 , false, false,  1, 0 , 'PEN'),
( 16, 20, true , true , '004', 4550 , '',  'CAPERUCITA ROJA'							, 'SANTILLANA'	,'PL. PRI'	, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10003, 1003 , false, false,  1, 0 , 'PEN'),
( 16, 20, true , true , '005', 4550 , '',  'LOS PERROS HAMBRIENTOS'						, 'SM'	  		,'PL. SEC'	, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10003, 1003 , false, false,  1, 0 , 'PEN'),
--------------------------------                                                                                                                                                                            
( 20, 10, true , false, '001', 4550 , '',  'MEMBRESÍA 01 MES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',     0.00 ,    0.0000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '002', 4550 , '',  'MEMBRESÍA 02 MES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   600.00 ,  708.0000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, false, false, '003', 4550 , '',  'MEMBRESÍA 03 MES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',     0.00 ,    0.0000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '004', 4550 , '',  'MEMBRESÍA 04 MES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   100.00 ,  118.0000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '005', 4550 , '',  'MEMBRESÍA 05 MES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   150.00 ,  177.0000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '006', 4550 , '',  'MEMBRESÍA 06 MES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   200.00 ,  236.0000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '007', 4550 , '',  'MEMBRESÍA 08 MES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   370.00 ,  436.6000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '008', 4550 , '',  'MEMBRESÍA 09 MES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   700.00 ,  826.0000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '009', 4550 , '',  'MEMBRESÍA 10 MES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   990.00 , 1168.2000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '010', 4550 , '',  'MEMBRESÍA 12 MES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  1200.00 , 1416.0000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '011', 4550 , '',  'RUTINA DIARIA'								, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',    90.00 ,  106.2000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '012', 4550 , '',  'CAMBIO TITULAR MEMBRESÍA'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   120.00 ,  141.6000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '013', 4550 , '',  'ALQUILER DE ESPACIOS'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   120.00 ,  141.6000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 20, 10, true , false, '014', 4550 , '',  'ALQUILER DE GIMNASIO'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   120.00 ,  141.6000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 21, 10, true , false, '015', 4550 , '',  'BEBIDAS GASEOSAS'							, ''		  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
( 21, 10, true , false, '016', 4550 , '',  'TOALLAS DE MANO'							, ''		  	,''	 		, '',  true , 'NIU', false, 1, 'B',   120.00 ,  141.6000 , 10004, 1004 , false, false,  1, 0 , 'PEN'),
------------------------------                                                                                                                                                                              
( 34, 20, true , false, '001', 4550 , '',  'DERECHO DE INSCRIPCIÓN'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  70.0000 ,   70.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 34, 20, true , false, '002', 4550 , '',  'CUOTA DE INGRESO'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',1000.0000 , 1000.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 34, 20, true , false, '003', 4550 , '',  'MATRÍCULA'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 500.0000 ,  500.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 34, 20, true , false, '004', 4550 , '',  'PENSIÓN ESTUDIOS'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 500.0000 ,  500.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '005', 4550 , '',  'CONSTANCIA DE CONDUCTA'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '006', 4550 , '',  'CONSTANCIA DE NO ADEUDO'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '007', 4550 , '',  'CONSTANCIA ESTUDIOS' 						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '008', 4550 , '',  'CONSTANCIA MATRICULA'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '009', 4550 , '',  'CONSTANCIA TERCIO SUPERIOR'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '010', 4550 , '',  'DEVOLUCIÓN DOCUMENTO'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '011', 4550 , '',  'DUPLICADO AGENDA'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '012', 4550 , '',  'DUPLICADO BOLETA NOTAS'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '013', 4550 , '',  'DUPLICADO TARJETA PAGOS'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '014', 4550 , '',  'EXAMEN RECUPERACIÓN'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '015', 4550 , '',  'FICHA ÚNICA DE MATRÍCULA'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '016', 4550 , '',  'GASTOS ADMINISTRATIVOS'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '017', 4550 , '',  'RECORD DE PAGOS'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0847 ,   50.1000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 35, 20, true , false, '018', 4550 , '',  'TRÁMITES'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   1.0000 ,    1.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 36, 10, true , false, '019', 4550 , '',  'ALQUILER DE ESPACIOS'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 36, 10, true , false, '020', 4550 , '',  'MOROSIDAD'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.4000 ,    0.5000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 36, 10, true , false, '021', 4550 , '',  'MATERIALES DADOS DE BAJA'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 36, 10, true , false, '022', 4550 , '',  'OTROS GRAVADO'								, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 36, 20, true , false, '023', 4550 , '',  'OTROS SIN GRAVAR'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
( 36, 11, true , false, '024', 4550 , '',  'PREMIOS'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10005, 1005 , false, false,  1, 0 , 'PEN'),
--                                                                                                                                                                                                          
( 37, 20, true , false, '025', 4550 , '',  'MATRÍCULA Y PENSIÓN'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  70.0000 ,   70.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 37, 20, true , false, '026', 4550 , '',  'MATRÍCULA'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 500.0000 ,  500.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 37, 20, true , false, '027', 4550 , '',  'PENSIÓN ESTUDIOS'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 500.0000 ,  500.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 37, 20, true , false, '028', 4550 , '',  'SEMINARIOS'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 500.0000 ,  500.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 37, 20, true , false, '029', 4550 , '',  'REFORZAMIENTO ACADÉMICO'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 500.0000 ,  500.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 37, 20, true , false, '030', 4550 , '',  'SOLO ETAS'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 500.0000 ,  500.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 37, 20, true , false, '031', 4550 , '',  'SOLO CURSOS'								, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 500.0000 ,  500.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 37, 20, true , false, '032', 4550 , '',  'MARATÓN'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 500.0000 ,  500.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '033', 4550 , '',  'BIBLIOTECA' 								, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '034', 4550 , '',  'BUZO'										, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '035', 4550 , '',  'DEVOLUCIÓN DOCUMENTO'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '036', 4550 , '',  'DUPLICADO AGENDA'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '037', 4550 , '',  'DUPLICADO BOLETA NOTAS'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '038', 4550 , '',  'DUPLICADO TARJETA PAGOS'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '039', 4550 , '',  'CAMBIO DE SEDE/CICLO'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '040', 4550 , '',  'GASTOS ADMINISTRATIVOS'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0000 ,   50.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '041', 4550 , '',  'COMPENDIO'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0847 ,   50.1000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '042', 4550 , '',  'MATERIALES DE ESTUDIO'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',  50.0847 ,   50.1000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 38, 20, true , false, '043', 4550 , '',  'TRÁMITES'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   1.0000 ,    1.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 39, 10, true , false, '044', 4550 , '',  'ALQUILER DE ESPACIOS'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 39, 10, true , false, '045', 4550 , '',  'MOROSIDAD'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.4000 ,    0.5000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 39, 10, true , false, '046', 4550 , '',  'MATERIALES DADOS DE BAJA'					, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 39, 10, true , false, '047', 4550 , '',  'OTROS GRAVADO'								, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 39, 20, true , false, '048', 4550 , '',  'OTROS SIN GRAVAR'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
( 39, 11, true , false, '049', 4550 , '',  'PREMIOS'									, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10006, 1005 , false, false,  1, 0 , 'PEN'),
--                                                                                                                                                                                                          
( 40, 10, true , false, '050', 4550 , '',  'ALQUILER CAMPO 01'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10007, 1005 , false, false,  1, 0 , 'PEN'),
( 40, 10, true , false, '051', 4550 , '',  'ALQUILER CAMPO 02'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.4000 ,    0.5000 , 10007, 1005 , false, false,  1, 0 , 'PEN'),
( 40, 10, true , false, '052', 4550 , '',  'ALQUILER PATIO 01'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10007, 1005 , false, false,  1, 0 , 'PEN'),
( 40, 10, true , false, '053', 4550 , '',  'ALQUILER PATIO 02'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10007, 1005 , false, false,  1, 0 , 'PEN'),
( 40, 10, true , false, '054', 4550 , '',  'ALQUILER TODO'								, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10007, 1005 , false, false,  1, 0 , 'PEN'),
( 40, 10, true , false, '055', 4550 , '',  'OTROS ALQUILERES'							, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10007, 1005 , false, false,  1, 0 , 'PEN'),
-----------------------------                                                                                                                                                                               
( 42, 10, true , false, '001', 4550 , '',  'CAMIONETA RURAL SUV 4X2 2.0LT'				, 'RENAULT' 	,'DUSTER'	, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10008, 1006 , false, false,  1, 0 , 'PEN'),
( 43, 10, true , false, '002', 4550 , '',  'CAMIÓN 40TN 3 EJES 2 PAS ARO 20'			, 'VOLVO'	  	,'SCANIA'	, '',  true , 'ZZ' , false, 1, 'S',   0.4000 ,    0.5000 , 10008, 1006 , false, false,  1, 0 , 'PEN'),
( 44, 10, true , false, '003', 4550 , '',  'RETROEXCAVADORA 3450 HP'					, 'CAT'	  		,'CISNEX5'	, '',  true , 'ZZ' , false, 1, 'S', 250.0000 ,  295.0000 , 10008, 1006 , false, false,  1, 0 , 'PEN'),
( 45, 10, true , false, '004', 4550 , '',  'ACEITE 40W AUTOS'							, 'REPSOL'  	,'ACEITE'	, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10008, 1006 , false, false,  1, 0 , 'PEN'),
( 46, 10, true , false, '005', 4550 , '',  'FRENO CERAMICO ALTA COMPETENCIA'			, 'FRENOSA' 	,'FRR23W' 	, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10008, 1006 , false, false,  1, 0 , 'PEN'),
( 47, 10, true , false, '006', 4550 , '',  'MANTENIMIENTO AUTOS'						, ''		  	,''	 		, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10008, 1006 , false, false,  1, 0 , 'PEN'),
( 48, 10, true , false, '007', 4550 , '',  'LAPTOP 15INCH NEGRO/GRIS COREI7'			, 'HP'	  		,'PAVILIO'	, '',  true , 'ZZ' , false, 1, 'S',   0.0000 ,    0.0000 , 10008, 1006 , false, false,  1, 0 , 'PEN');

select * from com.articulo a ;
select * from com.categoria c  ;
select * from com.producto_sunat ps  ;


select * from com.campania c where c.id_campania =11 ;
select * from GEN.tipo t ;





----------------------------------------------------------------------------------------------------------------------------------------
--com.beneficio-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.beneficio;
create table com.beneficio (
	id_beneficio		bigserial		NOT NULL PRIMARY KEY,
	id_negocio			int				NOT NULL,	
	id_tipo_beneficio	int				not null,
	nom_beneficio		varchar(50)		NOT NULL,
	activo				bool			NOT NULL,
	porcentual			bool			NOT NULL,
	valor				decimal(18,4)	NULL,			-- -1 es sin valor, 0 = para configurar , otro valor > 0 solo jala, no permite modificar en configuracion
	orden				int				NOT null,
	modificable			bool			not null,		--permite modificar en tiempo de ejecucion
	total				bool			not null,
	--id_b_s				bigint[]         null,		--NO VA DE TODAS MANERAS, NO VA
	no_reqiere_campaña	decimal(18,4)	NULL,			--si no requiere campaña, se puede ingresdar monto predefeinido, si se jala en una campaña esa el de cmapaña
	oper_estado			char(1)		NULL,	--I-U-X
	oper_fecha			varchar(50) null,
	oper_host			varchar(50) NULL,
	oper_user			varchar(50) NULL		
);
--
COMMENT ON TABLE com.beneficio IS 'Beneficios que se otorga'; 
COMMENT ON COLUMN com.beneficio.id_beneficio IS 'Identificador de beneficio.';
COMMENT ON COLUMN com.beneficio.id_negocio IS 'Identificador de unidad de negocio.';
COMMENT ON COLUMN com.beneficio.id_tipo_beneficio IS 'Identificador del tipo de beneficio [TI_DESCTOS].';
COMMENT ON COLUMN com.beneficio.nom_beneficio IS 'Nombre del beneficio.';
COMMENT ON COLUMN com.beneficio.activo IS 'Si el beneficio está activo.';
COMMENT ON COLUMN com.beneficio.porcentual IS 'Si el beneficio es un valor porcentual o un monto fijo.';
COMMENT ON COLUMN com.beneficio.orden IS 'Orden en que se muestran los registros.';
COMMENT ON COLUMN com.beneficio.modificable IS 'Si el usuario podrá modificar el importe del descuento.';
COMMENT ON COLUMN com.beneficio.total IS 'Si el descuento se aplica al total de una factura.';
--
insert into com.beneficio (id_negocio, id_tipo_beneficio, nom_beneficio, activo, porcentual, orden, modificable, total) 
values 
(10005 , 2180 , 'SIN DESCUENTO' 										, true , false , 100 , false , false ), 
(10005 , 2181 , 'BECA POR APOYO SOLIDARIO - 25%' 						, true , true  , 200 , false , false ), 
(10005 , 2181 , 'BECA POR APOYO SOLIDARIO - 50%' 						, true , true  , 201 , false , false ), 
(10005 , 2181 , 'BECA POR APOYO SOLIDARIO - 100%' 						, true , true  , 202 , false , false ), 
(10005 , 2181 , 'BECA POR RENDIMIENTO ACADÉMICO - 25%' 					, true , true  , 203 , false , false ), 
(10005 , 2181 , 'BECA POR RENDIMIENTO ACADÉMICO - 50%' 					, true , true  , 204 , false , false ), 
(10005 , 2181 , 'BECA POR RENDIMIENTO ACADÉMICO - 100%'					, true , true  , 205 , false , false ), 
(10005 , 2182 , 'DSCTO. ESPECIAL' 										, true , false , 300 , true  , false ), 
--(10005 , 2182 , 'DSCTO. MODALIDAD VIRTUAL' 								, true , false , 301 , false , false ), 
(10005 , 2182 , 'DSCTO. POR HERMANO ADICIONAL' 							, true , false , 302 , false , false ), 
(10005 , 2182 , 'DSCTO. POR HIJO DE EX-ALUMNO' 							, true , false , 303 , false , false ), 
(10005 , 2182 , 'DSCTO. POR HIJO DE TRABAJADOR' 						, true , false , 304 , false , false ), 
(10005 , 2182 , 'DSCTO. POR INSCRIPCIÓN INTRANET' 						, true , false , 305 , false , false ), 
(10005 , 2182 , 'DSCTO. POR MATRÍCULA ANTICIPADA - NUEVOS' 				, true , false , 306 , false , false ), 
(10005 , 2182 , 'DSCTO. POR MATRÍCULA ANTICIPADA - RATIFICADOS' 		, true , false , 307 , false , false ), 
(10005 , 2182 , 'DSCTO. POR MATRÍCULA ANTICIPADA - REINGRESANTES' 		, true , false , 308 , false , false ), 
--(10005 , 2182 , 'DSCTO. POR PAGAR PUNTUALMENTE' 						, true , false , 309 , false , false ), 
(10005 , 2182 , 'DSCTO. POR PAGO TOTAL 3%' 								, true , true  , 310 , false , true  ), 
(10005 , 2182 , 'DSCTO. POR PAGO TOTAL 5%' 								, true , true  , 311 , false , true  ), 
(10005 , 2182 , 'DSCTO. POR PAGO TOTAL 6%' 								, true , true  , 312 , false , true  ), 
(10005 , 2182 , 'DSCTO. POR PAGO TOTAL 7%' 								, true , true  , 313 , false , true  ), 
(10005 , 2182 , 'DSCTO. POR PAGO TOTAL 10%'								, true , true  , 314 , false , true  ), 
(10005 , 2182 , 'DSCTO. POR PARTICIPAR EN CONCURSO BECAS' 				, true , false , 315 , false , false ), 
(10005 , 2182 , 'DSCTO. PROMOCIONAL 25%' 								, true , true  , 316 , false , false ), 
(10005 , 2182 , 'DSCTO. PROMOCIONAL 50%' 								, true , true  , 317 , false , false ), 
(10005 , 2182 , 'DSCTO. PROMOCIONAL 100%'								, true , true  , 318 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - CAJA HUANCAYO' 							, true , false , 400 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - COLEGIO ABOGADOS' 						, true , false , 401 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - COLEGIO ADMINISTRADORES' 				, true , false , 402 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - COLEGIO ARQUITECTOS' 					, true , false , 403 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - COLEGIO CONTADORES' 					, true , false , 404 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - COLEGIO ENFERMEROS' 					, true , false , 405 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - COLEGIO INGENIEROS' 					, true , false , 406 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - COLEGIO MÉDICOS' 						, true , false , 407 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - COLEGIO OBSTETRAS' 						, true , false , 408 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - COLEGIO ODONTOLOGOS' 					, true , false , 409 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - COLEGIO TECNOLOGOS MEDICO' 				, true , false , 410 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - ESSALUD' 								, true , false , 411 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - FFPP / FFAA' 							, true , false , 412 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - INSTITUCIONES VARIOS' 					, true , false , 413 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - SAGA FALABELLA' 						, true , false , 414 , false , false ), 
(10005 , 2184 , 'POR CONVENIO - UNIVERSIDAD CONTINENTAL' 				, true , false , 415 , false , false ), 
(10006 , 2180 , 'SIN DESCUENTO' 										, true , false , 100 , false , false ), 
(10006 , 2181 , 'BECA POR CONCURSO - 25%' 								, true , true  , 200 , false , false ), 
(10006 , 2181 , 'BECA POR CONCURSO - 50%' 								, true , true  , 201 , false , false ), 
(10006 , 2181 , 'BECA POR CONCURSO - 100%' 								, true , true  , 202 , false , false ), 
(10006 , 2181 , 'BECA POR APOYO SOLIDARIO - 25%' 						, true , true  , 203 , false , false ), 
(10006 , 2181 , 'BECA POR APOYO SOLIDARIO - 50%' 						, true , true  , 204 , false , false ), 
(10006 , 2181 , 'BECA POR APOYO SOLIDARIO - 100%' 						, true , true  , 205 , false , false ), 
(10006 , 2181 , 'BECA POR PRIMEROS PUESTOS COLEGIO - 25%' 				, true , true  , 206 , false , false ), 
(10006 , 2181 , 'BECA POR PRIMEROS PUESTOS COLEGIO - 50%' 				, true , true  , 207 , false , false ), 
(10006 , 2181 , 'BECA POR PRIMEROS PUESTOS COLEGIO - 100%' 				, true , true  , 208 , false , false ), 
(10006 , 2182 , 'DESCUENTO ESPECIAL' 									, true , false , 300 , true  , false ), 
(10006 , 2182 , 'DESCUENTO POR ASISTENCIA INTERMITENTE' 				, true , false , 301 , false , false ), 
(10006 , 2182 , 'DESCUENTO POR HERMANO ADICIONAL' 						, true , false , 302 , false , false ), 
(10006 , 2182 , 'DESCUENTO POR EX ALUMNO' 								, true , false , 303 , false , false ), 
(10006 , 2182 , 'DESCUENTO POR INSCRIPCIÓN INTRANET' 					, true , false , 304 , false , false ), 
(10006 , 2182 , 'DESCUENTO POR MATRÍCULA TARDÍA' 						, true , false , 305 , true  , false ), 
(10006 , 2182 , 'DESCUENTO POR PARTICIPAR EN CONCURSO BECAS' 			, true , false , 306 , false , false ), 
(10006 , 2182 , 'DESCUENTO POR PRONTO PAGO' 							, true , false , 307 , false , false ), 
(10006 , 2182 , 'DESCUENTO POR RENDIR SÓLO EXÁMENES' 					, true , false , 308 , false , false ), 
(10006 , 2184 , 'CONVENIO COLEGIO SAN JUAN BOSCO' 						, true , false , 400 , false , false ), 
(10006 , 2184 , 'CONVENIO COLEGIOS ESTATALES' 							, true , false , 401 , false , false ), 
(10006 , 2184 , 'CONVENIO COLEGIOS PARTICULARES' 						, true , false , 402 , false , false ), 
(10006 , 2184 , 'CONVENIO GOBIERNO REGIONAL' 							, true , false , 403 , false , false );
select * from com.beneficio b ;
select * from com.campania c  ;


 


----------------------------------------------------------------------------------------------------------------------------------------
--com.comprobante-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.comprobante;		--PLE_Anexo3-Tabla10
create table com.comprobante (
	id_comprobante  char(2)			NOT NULL,
	nom_comprobante varchar(50)		not null,
	activo			boolean			NOT NULL,
	venta			boolean			NOT NULL,
	compra			boolean			not null,
	constraint comprobante_pkey primary key (id_comprobante)  
);
--
insert into com.comprobante (id_comprobante, nom_comprobante, activo, venta, compra) 
values 
('--',	'<ninguno>'							,	false, false, false),
('01',	'FACTURA'							,	true , true , true ),
('02',	'RECIBO POR HONORARIOS'				,	true , false, true ), 
('03',	'BOLETA DE VENTA'					,	true , true , true ),
('05',	'BOLETO DE TRANSPORTE AEREO'		,	true , false, true ),
('07',	'NOTA DE CRÉDITO ELECTRÓNICA'		,	true , true , false),
('09',	'GUIA DE REMISIÓN'					,	true , false, true ),
('10',	'RECIBO POR ARRENDAMIENTO'			,	true , false, true ),
('12',	'TICKET'							,	true , false, true );


----------------------------------------------------------------------------------------------------------------------------------------
--com.comprobante-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.comprobante;		--PLE_Anexo3-Tabla10
create table com.comprobante (
	id_comprobante  char(2)			NOT NULL primary key,
	nom_comprobante varchar(75)		not null,
	doc_interno		boolean			not null
);
-- 
insert into com.comprobante (id_comprobante, nom_comprobante, doc_interno) 
values  
('00',	'OTROS'													,	false),
('01',	'FACTURA'												,	false),
('02',	'RECIBO POR HONORARIOS'									,	false), 
('03',	'BOLETA DE VENTA'										,	false),
('04',	'LIQUIDACIÓN DE COMPRA'									,	false),
('05',	'BOLETO DE TRANSPORTE AEREO - PERSONAS'					,	false),
('06',	'CARGA DE PORTE AEREO - TRANSPORTE DE CARGA'			,	false),
('07',	'NOTA DE CRÉDITO'										,	false),
('08',	'NOTA DE DÉBITO'										,	false),
('09',	'GUIA DE REMISIÓN'										,	false),
('10',	'RECIBO POR ARRENDAMIENTO'								,	false),
('11',	'PÓLIZA EMITIDA POR BOLSAS DE VALORES - SMV'			,	false),
('12',	'TICKET MÁQUINA REGISTRADORA'							,	false),
('13',	'DOCS. SISTEMA FINANC, SEGUROS, COOP. - SBS'			,	false),
('14',	'RECIBO SERV. PÚBLICOS - AGUA, LUZ, TELÉFONO'			,	false),
('15',	'BOLETOS TRANS. TERRESTRE FERROVIARIO LOCAL'			,	false),
('16',	'BOLETOS TRANS. TERRESTRE FERROVIARIO NACIONAL'			,	false),
('17',	'DOCUMENTO IGLESIA CATÓLICA POR ARRENDAMIENTO'			,	false),
('18',	'DOCUMENTO EMITIDOS POR AFP SUPERVISADOS SBS'			,	false),
('19',	'BOLETO POR ATRACCIONES Y ESPECTÁCULOS PÚBLICOS'		,	false),
('20',	'COMPROBANTE DE RETENCIÓN'								,	false),
('21',	'CONOCIMIENTO DE EMBARQUE TRANS. CARGA MARÍTIMA'		,	false),
('22',	'COMPROBANTE POR OPERACIONES NO HABITUALES'				,	false),
('23',	'PÓLIZAS DE ADJUDICACIÓN POR REMATES O SUBASTAS'		,	false),
('24',	'CERTIFICADO DE PAGO DE REGALÍAS POR PERUPETRO'			,	false),
('25',	'DOCUMENTO DE ATRIBUCIÓN'								,	false),
('26 ',	'RECIBO COMISIÓN REGANTES. USO AGUA SUPERFICIAL'		,	false),
('27',	'SEGURO COMPLEMENTARIO DE TRABAJO DE RIESGO'			,	false),
('28',	'SERVICIOS AEROPORTUARIOS A PASAJEROS. ETIQUETAS AUTO.' ,	false),
('29',	'DOC. COFOPRI. VENTA DE TERRENOS. SUBASTAS PÚBLICAS'	,	false),
('30',	'SISTEMAS DE PAGO MEDIANTE TARJETAS CRÉDITO Y DÉBITO'	,	false),
('31',	'GUÍA DE REMISIÓN - TRANSPORTISTA'						,	false),
('32',	'DOC. EMPRESAS RECAUDADORAS RED PRINCIPAL GNV'			,	false),
('33',	'MANIFIESTO DE PASAJEROS'								,	false),
('34',	'DOCUMENTO DEL OPERADOR'								,	false),
('35',	'DOCUMENTO DEL PARTÍCIPE'								,	false),
('36',	'RECIBO DE DISTRIBUCIÓN DE GAS NATURAL'					,	false),
('37',	'DOC. EMITIDOS REVISIONES TÉCNICAS VEHICULARES'			,	false),
('40',	'COMPROBANTE DE PERCEPCIÓN'								,	false),
('41',	'COMPROBANTE DE PERCEPCIÓN - VENTA INTERNA'				,	false),
('42',	'PAGO CON TARJETAS CRÉDITO EMITIDAS POR SI MISMAS'		,	false),
('43',	'TRANSPORTE AÉREO NO REGULAR Y/O ESPECIAL PASAJEROS'	,	false),
('44',	'BILLETES DE LOTERÍA, RIFAS Y APUESTAS.'				,	false),
('45',	'DOC. CENTROS EDUCATIVOS. ACT. NO GRAVADAS'				,	false),
('46',	'FORMULARIO DE DECLARACIÓN. BOLETA TRIBUTOS INT.'		,	false),
('48',	'COMPROBANTE DE OPERACIONES - LEY N° 29972'				,	false),
('49',	'CONSTANCIA DE DEPÓSITO - IVAP (LEY 28211)'				,	false),
('50',	'DECLARACIÓN ÚNICA DE ADUANAS.IMPORT. DEFINITIVA'		,	false),
('51',	'PÓLIZA O DUI FRACCIONADA'								,	false),
('52',	'DESPACHO SIMPLIFICADO. IMPORTACIÓN SIMPLIFICADA'		,	false),
('53',	'DECLARACIÓN DE MENSAJERÍA O COURIER'					,	false),
('54',	'LIQUIDACIÓN DE COBRANZA'								,	false),
('55',	'BVME PARA TRANSPORTE FERROVIARIO DE PASAJEROS'			,	false),
('56',	'COMPROBANTE DE PAGO SEAE'								,	false),
('87',	'NOTA DE CRÉDITO ESPECIAL'								,	false),
('88',	'NOTA DE DÉBITO ESPECIAL'								,	false),
('89',	'NOTA DE AJUSTE DE OPERACIONES - LEY N° 29972'			,	false),
('91',	'COMPROBANTE DE NO DOMICILIADO'							,	false),
('96',	'EXCESO DE CRÉDITO FISCAL POR RETIRO DE BIENES'			,	false),
('97',	'NOTA DE CRÉDITO - NO DOMICILIADO'						,	false),
('98',	'NOTA DE DÉBITO - NO DOMICILIADO'						,	false),
('A1',	'COMPROBANTE CAJA - INGRESO'							,	true ),
('A2',	'COMPROBANTE CAJA - EGRESO'								,	true ),
('A3',	'COMPROBANTE CAJA - RETIRO'								,	true ),
('A4',	'COMPROBANTE CAJA - DEPÓSITO'							,	true ),
('B1',	'COMPROBANTE FONDO FIJO - INGRESO'						,	true ),
('B2',	'COMPROBANTE FONDO FIJO - EGRESO'						,	true ),
('B3',	'COMPROBANTE FONDO FIJO - RETIRO'						,	true ),
('B4',	'COMPROBANTE FONDO FIJO - DEPÓSITO'						,	true ),
('C1',	'COMPROBANTE BANCO - INGRESO'							,	true ),
('C2',	'COMPROBANTE BANCO - EGRESO'							,	true ),
('C3',	'COMPROBANTE BANCO - RETIRO'							,	true ),
('C4',	'COMPROBANTE BANCO - DEPÓSITO'							,	true ),
('D1',	'COMPROBANTE BÓVEDA - INGRESO'							,	true ),
('D2',	'COMPROBANTE BÓVEDA - EGRESO'							,	true ),
('D3',	'COMPROBANTE BÓVEDA - RETIRO'							,	true ),
('D4',	'COMPROBANTE BÓVEDA - DEPÓSITO'							,	true ),
('X1',	'NOTA DE PEDIDO'										,	true ),
('X2',	'COTIZACIÓN PROFORMA'									,	true ),
('X3',	'AFILIACIÓN A MEMBRESÍA'								,	true ),
('X4',	'DECLARACIÓN JURADA DE INGRESO'							,	true ),
('X5',	'DECLARACIÓN JURADA DE GASTO'							,	true );



--##### MEDIOS DE PAGO				--> PLE_ANEXO3 - TABLA01
--##### DOCUMENTOAS DE IDENTIDAD	--> PLE_ANEXO3 - TABLA02
--##### ENTIDAD FINANCIERA			--> PLE_ANEXO3 - TABLA03
--##### MONEDA						--> PLE_ANEXO3 - TABLA04
--##### TIPO DE EXISTENCOIA			--> PLE_ANEXO3 - TABLA05, REVISAR TABLA 30
--##### UNIDAD DE MEDIDA			--> PLE_ANEXO3 - TABLA06
--##### TIPO_OPERACION				--> PLE_ANEXO3 - TABLA12
--##### VALUACIÓN					--> PLE_ANEXO3 - TABLA14
------#######EN TABLA TIPOS
------#######EN TABLA TIPOS
------#######EN TABLA TIPOS
------#######EN TABLA TIPOS


--EL ARTICULO REQUIERE SIEMPRE UNA INSCRIPCIÓN?????????????????????????
--req_inscripcion	bool			not null,	cuando se crea una campaña se exige cuales conceptos son exigibles

--detraccion,  , en otra tabla considera su porcentaje de detraccion y a oartir de cuanto
-- en esta tabla poner que codigo de detraccion le corresponde
/*
insert into detraccion (id_detraccion, nom_detraccion, a_partir_de, porcentaje)
values   (0, 'no afecto'			,  00.00, 0.00),
		 (1, 'SERVICIOS EN GENERAL'	, 700.00, 0.10),
*/
--en opciones del SISTEMAS, PONER COLUMA, EMPRESA, SI ES -1 ES PARA TODOS, SI TIENE EL CODIGO DE LA EMPRESA, LA OPCION LO USA SOLO LA EMPRESA
--VARGEN-PUEDE EDITAR PRECIO
--VARGEN-PUEDE EDITAR  NOMBRE
--VARGEN-supervidor ventas puede cambiar montos de la factura
--VARGEN-supervidor ventas puede cambiar montos de la factura
--vargen- SI ES QUE SE EMITIRA COMPROBANTE SEPARDOS POR EL TIPO DE AFECTACION, PARA FINES CONTABLES
--vargen- SI EN ESE NEGOCIOS SE DA COMISIONES POR VENTA
--



/*
----------------------------------------------------------------------------------------------------------------------------------------
--com.tipo_cambio-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.tipo_cambio;
create table com.tipo_cambio (
	id_tipo_cambio	serial			NOT NULL,
	id_empresa		int				not null,
	id_ti_moneda	int				not null,
	fecha			boolean			NOT NULL,
	importe		    varchar(50)		not null,		
	activo			varchar(10)		not null,
	constraint tipo_cambio_pkey primary key (id_tipo_cambio)  
);
--
insert into com.moneda (id_empresa, id_ti_moneda, fecha, importe, activo) 
values 
(102, 'USD',	'2019-07-17'	,	3.3545		,	true),
(103, 'EUR',	'2019-09-17'	,	4.1515		,	true);
*/

--VARGEN-->varias monedas: si no
--VARGEN-->moneda_default   --> 1=sol, 2=dolar, 3=euro, 4=








----------------------------------------------------------------------------------------------------------------------------------------
--com.venta-----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.venta;
create table com.venta (
	id_venta		bigint			NOT NULL,
	id_negocio		int				not null,
	id_local		int				NOT NULL,
	id_comprobante	char(2)			not null,
	serie			varchar(15)		not null,
	numero			int				not null,
	id_cliente		bigint			not null,
	id_tidocident	char(6)			not null,	
	num_docident	varchar(15)		not null,	--doc_cliente		varchar(15)		not null,
	id_beneficiario	bigint			not null,
	id_inscripcion	bigint			not null,	
	dscto_gb		decimal(18,2)	not null,
	cargo_gb		decimal(18,2)	not null,	
	importe_tt		decimal(18,2)	not null,
	descuento_tt	decimal(18,2)	not null,
	neto_tt			decimal(18,2)	not null,	
	exonerado_tt	decimal(18,2)	not null,
	inafecto_tt		decimal(18,2)	not null,		
	gravado_tt		decimal(18,2)	not null,
	igv_tt			decimal(18,2)	not null,	
	saldo_tt		decimal(18,2)	not null,
	fe_emite		timestamp		not null,
	fe_cancela		timestamp		null,
	estado			char(1)			not null,	--(A) Anulado, (D) Crédito, (A) Amortizado, (C) Cancelado, (E) Emitido  --(X) NO HABRA Eliminado
	credito			boolean			not null,			
	id_moneda		char(3)			not null,	--(PEN)soles, (SOL)dolar, (EUR) euro 	
	id_notacred		bigint			not null,	
	obs				varchar(100)	not null,	
	--id_pedido		bigint			not null,
	--tipo_cambio		decimal(18,2)	not null,
	--id_vendedor		bigint			not null,
	--pedido_anio		int				not null,	-- si no tiene pedido: -1
    --pedido_num		int				not null,	-- si no tiene pedido: -1
	--pedido_est		char(1)			not null,	-- (-) sin pedido, (S) solicitado, (F) facturado 
	--cuotas			int				not null,
	constraint venta_pkey primary key (id_venta),
	constraint venta_id_comprobante_fkey foreign key (id_comprobante) references com.comprobante (id_comprobante) match simple on update no action on delete no action,
	constraint venta_id_cliente_fkey foreign key (id_cliente) references gen.persona(id_persona) match simple on update no action on delete no action
	--constraint venta_id_moneda_fkey foreign key (id_moneda) references com.moneda(id_moneda) match simple on update no action on delete no action
);
--
insert into com.venta (id_venta, id_negocio, id_local, id_comprobante, serie, numero, id_cliente, id_tidocident, num_docident, id_beneficiario, id_inscripcion, 
																	dscto_gb, cargo_gb, importe_tt, descuento_tt, neto_tt, exonerado_tt, inafecto_tt, gravado_tt, igv_tt, saldo_tt, fe_emite, fe_cancela, estado, credito, id_moneda, id_notacred, obs)   
values 
(1, 10001, 1, '01', 'FE01',  1,  7, '104RUC', '10401108055', -1, -1,  200.00, 100.00, 12000.00,   0.00, 12000.00, 0.00, 0.00, 10169.49,  1830.51,	    0.00, '2019-04-26', '2019-04-26', 'C', false,  'PEN',  -1	, ''			),
(2, 10004, 4, '01', 'F001', 10, 21, '104RUC', '10401108055', -1, -1,	0.00,   0.00,  8050.00,   0.00,  8050.00, 0.00, 0.00,  6822.03,  1227.97, 		0.00, '2019-04-26', '2019-04-26', 'C', false,  'USD',   3	, ''			), --su nota de credito es id=3
(3, 10004, 4, '07', 'FC01',  1, 21, '104RUC', '10401108055', -1, -1, 	0.00,   0.00,  8050.00,   0.00,  8050.00, 0.00, 0.00,  6822.03,  1227.97,		0.00, '2019-04-26', '2019-04-26', 'C', false,  'USD',   2	, 'F001-10*OBS' ), --afecta al comprobante con id=2
(4, 10004, 5, '01', 'F002', 11, 21, '104RUC', '10401108055', -1, -1, 	0.00,   0.00,  5000.00, 500.00,  4500.00, 0.00, 0.00,  3813.56,   686.44, 		0.00, '2019-04-27', '2019-04-27', 'C', false,  'PEN',  -1	, ''			),
(5, 10004, 6, '03', 'B003', 12, 20, '104DNI', '10401108055', -1, -1, 	0.00,   0.00,  1000.00,   0.00,  1000.00, 0.00, 0.00,   847.46,   152.54,	 1000.00, '2019-04-28', null		, 'D', true ,  'PEN',  -1	, ''			);
--cuando es nota de credito, el campo id_beneficiario haría referencia a la persona que recibe el cheque



----------------------------------------------------------------------------------------------------------------------------------------
--com.venta_detalle---------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.venta_detalle;
create table com.venta_detalle (
	id_ventadet		bigint			NOT NULL,
	id_venta		bigint			not null,
	id_articulo		bigint			NOT NULL,
	mes_prog		int				not null,
	nombre			varchar(1000)	not null,
	un_med			varchar(10)		NOT NULL,
	cantidad		int				not null,
	precio			decimal(18,2)	not null,
	descuento		decimal(18,2)	not null,
	importe			decimal(18,2)	not null,
	igv				decimal(18,2)	not null,
	sub				decimal(18,2)	not null,
	constraint venta_detalle_pkey primary key (id_ventadet),
	constraint venta_detalle_id_venta_fkey foreign key (id_venta) references com.venta (id_venta) match simple on update no action on delete no action
);
--
insert into com.venta_detalle (id_ventadet, id_venta, id_articulo, mes_prog, nombre, un_med, cantidad, precio, descuento, importe, igv, sub) 
values 
( 1, 1,  1,  3, 'DVR HIKVISION'			, 'NIU', 1,   300.00, 50.00,  250.00,  40.50,  201.50),
( 2, 1,  2,  3, 'CAMARA DOMO !'			, 'NIU', 5,   100.00,  0.00,  100.00,  18.00,   82.00),
( 3, 2, 20,  4, 'MINIVAN 8 PLAZAS'		, 'NIU', 1,  8500.00,  0.00, 8500.00, 380.00, 8150.00),
( 4, 2, 21,  4, 'BARRA DE ESCALON PAR'	, 'NIU', 1,   400.00,400.00,    0.00,   0.00,    0.00),
--( 1, 3, id_articulo, mes_prog, nombre, un_med, cantidad, precio, descuento, importe, igv, sub),
( 5, 3, 22,  5, 'CAMIONETA HILUX'		, 'NIU', 1, 30000.00,  0.00,30000.00,1800.00,28900.00),
( 6, 3, 23,  5, 'VALE POR 5 GALONES'	, 'GLN',50,   100.00,100.00,    0.00,   0.00,    0.00),
( 7, 4, 24,  6, 'ACEITE SHELIX 5G 1/4'	, 'NIU', 2,   30.00,   0.00,   30.00,   5.50,   24.50),
( 8, 4, 25,  6, 'FILTRO DE ACEITE'		, 'NIU', 1,   30.00,   0.00,   30.00,   5.50,   24.50);


--OTRO NOMBRE ---->>>    venta_detalle_add     venta_detalle_art (detalle del articulo que se vende)
----------------------------------------------------------------------------------------------------------------------------------------
--com.venta_detalle_add-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.venta_detalle_add;
create table com.venta_detalle_add (
	id_ventadetadd	bigint			NOT NULL,
	id_ventadet		bigint			NOT NULL,
	col_id			int				not null,
	col1_key		varchar(100)	NOT NULL,
	col1_value		varchar(100)	NOT NULL,
	col2_key		varchar(100)	NOT NULL,
	col2_value		varchar(100)	NOT NULL,
	constraint venta_detalle_add_pkey primary key (id_ventadetadd),
	constraint venta_detalle_add_id_ventadet_fkey foreign key (id_ventadet) references com.venta_detalle (id_ventadet) match simple on update no action on delete no action
);
--
insert into com.venta_detalle_add (id_ventadetadd, id_ventadet, col_id, col1_key, col1_value, col2_key, col2_value) 
values 
( 1, 3,  1,  'Clase'				, 'M1'					,'Modelo'				, 'FJSDJSDNSD'		),
( 2, 3,  2,  'Año de fabricación'	, '2018'				,'Color'					, 'BLANCO'			),
( 3, 3,  3,  'Número de motor'		, 'J4S34KMSD586'		,'Potencia del motor'	, '67@600'			),
( 4, 3,  4,  'Tamaño'				, '2.30 x 4.67 x 1.23'	,'Peso Bruto'			, '1850 KG'			);









----------------------------------------------------------------------------------------------------------------------------------------
--com.grp_comercial---------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.grp_comercial;
create table com.grp_comercial (
	id_grpcom		int				NOT NULL,
	id_negociolocal	int				not null,
	id_tigrpcom		char(6)			not null,	-- caja 110CAJ, serie 110SER, punto de venta 110PVT, almacen 110ALM
	nom_grpcom		varchar(25)		NOT NULL,		
	activo			bool			NOT NULL,
	id_supervisor	int				not null, 	-- todos tienen supervisor: los vendedores, los facturadores, los cajeros
	pv_idalmacenes	varchar(50)		not null,	-- separados por unto y coma
	pv_idprecios	int				not null,	-- identificador del grupo de precios
	se_idcomp		char(2)			not null, 	-- serie facturacion, identificador de comprobante (si no usa --)
	se_nucomp		int				not null, 	-- serie facturacion, numero de comprobante (si no se usa -1)
	constraint grp_comercial_pkey primary key (id_grpcom),
	constraint grp_comercial_id_negociolocal_fkey foreign key (id_negociolocal) references gen.negocio_local (id_negociolocal) match simple on update no action on delete no action,
	constraint grp_comercial_se_idcomp_fkey foreign key (se_idcomp) references com.comprobante (id_comprobante) match simple on update no action on delete no action
);
--
insert into com.grp_comercial (id_grpcom, id_negociolocal, id_tigrpcom, nom_grpcom, activo, id_supervisor, pv_idalmacenes, pv_idprecios, se_idcomp, se_nucomp)
values 
( 1, 1, '110PVT', 'PUNTO DE VENTA 01'	, true, -1, '9' 		,  1,	'--',  000),	-- ysst
( 2, 1, '110PVT', 'PUNTO DE VENTA 02'	, true, -1, '9'			,  1,	'--',  000),
( 3, 1, '110PVT', 'PUNTO DE VENTA 03'	, true, -1, '9'			,  1,	'--',  000),
(31, 1, '110SER', 'F001'	   			, true, -1, ''			, -1,	'01',  011),
( 4, 1, '110SER', 'FE01'	   			, true, -1, ''			, -1,	'01',  011),
( 5, 1, '110SER', 'BE01'	   			, true, -1, ''			, -1,	'03',  022),
( 6, 1, '110SER', 'FC01'       			, true, -1, ''			, -1,	'07',  033),
( 7, 1, '110SER', 'BC01'       			, true, -1, ''			, -1,	'07',  044),
( 8, 1, '110CAJ', 'CAJA ÚNICA'			, true, -1, ''			, -1,	'--',  000), 
( 9, 1, '110ALM', 'ALMACÉN GENERAL'		, true, -1, ''			, -1,	'--',  000), 
			
(10, 4, '110PVT', 'PILCO.PUNTO VENTA 1'	, true, -1, '28'		,  2,	'--',  000),	-- motors
(11, 5, '110PVT', 'SPEDR.PUNTO VENTA 1'	, true, -1, '28;29;30'	,  2,	'--',  000),
(12, 6, '110PVT', 'PQIND.PUNTO VENTA 1'	, true, -1, '28;29;30'	,  2,	'--',  000),
(32, 6, '110PVT', 'PQIND.PUNTO VENTA 2'	, true, -1, '28;29;30'	,  2,	'--',  000),
(33, 6, '110PVT', 'PQIND.PUNTO VENTA 3'	, true, -1, '28;29;30'	,  2,	'--',  000),
(34, 6, '110PVT', 'PQIND.PUNTO VENTA 4'	, true, -1, '28;29;30'	,  2,	'--',  000),
(35, 6, '110PVT', 'PQIND.PUNTO VENTA 5'	, true, -1, '28;29;30'	,  2,	'--',  000),
(13, 4, '110SER', 'F001'	   			, true, -1, ''			, -1,	'01',  100),
(14, 4, '110SER', 'B001'	   			, true, -1, ''			, -1,	'03',  120),
(15, 4, '110SER', 'FC01'       			, true, -1, ''			, -1,	'07',  140),
(16, 4, '110SER', 'BC01'       			, true, -1, ''			, -1,	'07',  160),
(17, 5, '110SER', 'F002'	   			, true, -1, ''			, -1,	'01',  200),
(18, 5, '110SER', 'B002'	   			, true, -1, ''			, -1,	'03',  220),
(19, 5, '110SER', 'FC02'       			, true, -1, ''			, -1,	'07',  240),
(20, 5, '110SER', 'BC02'       			, true, -1, ''			, -1,	'07',  260),
(21, 6, '110SER', 'F003'	   			, true, -1, ''			, -1,	'01',  300),
(22, 6, '110SER', 'B003'	   			, true, -1, ''			, -1,	'03',  320),
(23, 6, '110SER', 'FC03'       			, true, -1, ''			, -1,	'07',  340),
(24, 6, '110SER', 'BC03'       			, true, -1, ''			, -1,	'07',  360),
(25, 4, '110CAJ', 'PILCO.CAJA01'		, true, -1, ''			, -1,	'--',  000), 
(26, 5, '110CAJ', 'SPEDR.CAJA01'		, true, -1, ''			, -1,	'--',  000), 
(27, 6, '110CAJ', 'PQIND.CAJA01'		, true, -1, ''			, -1,	'--',  000), 
(28, 4, '110ALM', 'PILCO.ALM.GENERAL'	, true, -1, ''			, -1,	'--',  000),
(29, 5, '110ALM', 'SPEDR.ALM.GENERAL'	, true, -1, ''			, -1,	'--',  000),
(30, 6, '110ALM', 'PQIND.ALM.GENERAL'	, true, -1, ''			, -1,	'--',  000);



----------------------------------------------------------------------------------------------------------------------------------------
--com.almacen_articulo------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.almacen_articulo; 
create table com.almacen_articulo ( 
	id_almart			bigserial		NOT NULL,
	id_almacen			int				NOT NULL,
	id_articulo			int 			not null,
	stock				int				not null,
	stock_fracc			int				not null,
	constraint almacen_articulo_pkey primary key (id_almart),
	constraint almacen_articulo_id_almacen_fkey foreign key (id_almacen) references com.grp_comercial (id_grpcom) match simple on update no action on delete no action,
	constraint almacen_articulo_id_articulo_fkey foreign key (id_articulo) references com.articulo (id_articulo) match simple on update no action on delete no action 
); 
--
insert into com.almacen_articulo (id_almart, id_almacen, id_articulo, stock, stock_fracc)   
values
( 1,	28,	10,	 	5, 	0 ),
( 2,	28,	11, 	5, 	0 ),
( 3,	28,	12,     5,  0 ),
( 4,	28,	13,     5,  20),
( 5,	29,	10,	 	3, 	0 ),
( 6,	29,	11, 	3, 	0 ),
( 7,	29,	12,     3,  0 ),
( 8,	29,	13,     3,  15),
( 9,	30,	10,	 	1, 	0 ),
(10,	30,	11, 	1, 	0 ),
(11,	30,	12,     0,  0 ),
(12,	30,	13,     0,  15);



----------------------------------------------------------------------------------------------------------------------------------------
--com.grp_precio------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.grp_precio;
CREATE TABLE com.grp_precio(
	id_grpprecio	serial			NOT NULL,
	id_negocio		int				not null,	
	fe_ini			date			not null,
	fe_fin			date			not null,
	nom_grpprecio	varchar(100)	not null,	
	activo			bool			NOT NULL,
	CONSTRAINT grp_precio_pkey PRIMARY KEY (id_grpprecio) 
);
--
INSERT INTO com.grp_precio (id_grpprecio, id_negocio, fe_ini, fe_fin, nom_grpprecio, activo) 
VALUES
( 1, 10001, '2000-01-01', '9999-12-31', 'ÚNICO GRUPO DE PRECIOS'		, true ),
( 2, 10004, '2000-01-01', '9999-12-31', 'PRECIOS PRINCIPAL'				, true ),
( 3, 10004, '2000-01-01', '9999-12-31', 'PRECIOS SUCURSALES'			, true );



----------------------------------------------------------------------------------------------------------------------------------------
--com.precio----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.precio; 
create table com.precio ( 
	id_precio			int				NOT NULL,
	id_articulo			int 			not null,
	id_grpprecio		int				not null,
	importe				decimal(18,2)	not null,
	importe_fracc		decimal(18,2)	not null,
	id_moneda			char(3)			not null,
	constraint precio_pkey primary key (id_precio),
	constraint precio_id_articulo_fkey foreign key (id_articulo) references com.articulo (id_articulo) match simple on update no action on delete no action,
	constraint precio_id_grpprecio_fkey foreign key (id_grpprecio) references com.grp_precio(id_grpprecio) match simple on update no action on delete no action,
	constraint precio_id_moneda_fkey foreign key (id_moneda) references com.moneda(id_moneda) match simple on update no action on delete no action
);
--
insert into com.precio (id_precio, id_articulo, id_grpprecio, importe, importe_fracc, id_moneda)  
values 
( 1,  1, 	1,	  500.00, 	0.00  , 'PEN'),
( 2,  2, 	1, 	  250.00, 	0.00  , 'PEN'),
( 3,  3, 	1, 	    0.10, 	0.00  , 'PEN'),
( 4,  4, 	1,	    0.00, 	0.00  , 'PEN'),
( 5,  5, 	1,	  100.00, 	0.00  , 'PEN'),
( 6,  6, 	1,	  100.00, 	0.00  , 'PEN'),
( 7,  7, 	1,	  100.00, 	0.00  , 'PEN'),
( 8,  8, 	1,	  100.00, 	0.00  , 'PEN'),
( 9,  9, 	1,	  100.00, 	0.00  , 'PEN'),

(10, 10, 	2,	10700.00, 	0.00  , 'USD'),
(11, 11, 	2,	32500.00, 	0.00  , 'USD'),
(12, 12, 	2,	95000.00, 	0.00  , 'USD'),
(13, 13, 	2,	 2000.00,  90.00  , 'PEN'),

(14, 10, 	3,	11700.00, 	0.00  , 'USD'),
(15, 11, 	3,	33500.00, 	0.00  , 'USD'),
(16, 12, 	3,	96000.00, 	0.00  , 'USD'),
(17, 13, 	3,	 2100.00,  92.50  , 'PEN');







/*
 * COLUMNA PRECIO (YA QUE EL CATALOGO SE DEFINE POR LOCAL)
 * COLUMNA TIPO (MARCAR POR DEFECTO COMO : MERCADERIA, SUMNISTRO, MATERIA PRIMA)
 * */



--TABLA BOLETa/FACTURA
--cod_bar			varchar(25)		NOT NULL,	
-- CADA INSTANCIA DE UN ARTICULO TIENE SU PROPIO CODIGO (SERIE, EJEMPLO LAPTOP, TECLADO, esto iria en la boleta/factura


/*
----------------------------------------------------------------------------------------------------------------------------------------
--com.articulo_editorial----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.articulo_editorial; 
create table com.articulo_editorial (
	id_articulo		int			NOT NULL,
	id_tieditorial	char(6)		NOT NULL,
	id_tinivel	 	char(6)		NOT NULL,
	id_tigrado		char(6)		NOT NULL,
	id_tiarea		char(6)		NOT NULL,
	id_tiidioma		char(6)		NOT NULL,
	id_tiautor		char(6)		NOT NULL,
	constraint articulo_editorial_pkey primary key (id_articulo),
	constraint articulo_editorial_id_articulo_fkey foreign key (id_articulo) references com.articulo(id_articulo) match simple on update no action on delete no action 
);
*/



/*
Ciclo Pre PUCP							tipo_Examen: estrucutra diferente a uncp
Ciclo UNI								tipo_Examen: estrucutra diferente a uncp
Élite									tipo_Examen: estrucutra diferente a uncp
Programa de Reforzamiento Censal		¿?
Ciclo " Todo el Día "					¿?
Repaso									TIPOS: examen, ciclo, repaso
Q - PRE									colegio
Examen Becas							TIPOS: examen, ciclo, repaso	
------------------------------------------------------------------------------------------------------------------------
(42, 'ING. POR OTRAS VENTAS DE GESTIÓN'				,	true, 	false, 	'VIG', 1	, 10006, 1004);
( 6, 'ING. POR INYECCIÓN DE CAPITAL'				,	false, 	false, 	'IOP', 	true, 	'ICA'	, 6	, 10000, 1000),	
( 7, 'ING. POR PRÉSTAMOS DE ENTIDADES FINANCIERAS'	,	false, 	false, 	'IOP', 	true, 	'PFI'	, 7	, 10000, 1000),	
( 8, 'ING. POR PRÉSTAMOS DE TERCEROS'				,	false, 	false, 	'IOP', 	true, 	'PTE'	, 8	, 10000, 1000),	
( 9, 'ING. POR PRÉSTAMOS DE SOCIOS'					,	false, 	false, 	'IOP', 	true, 	'PSA'	, 9	, 10000, 1000),	
(10, 'ING. POR COBRO DE PRÉSTAMOS'					,	false, 	false, 	'IOP', 	true, 	'PCO'	,10	, 10000, 1000),	
(11, 'ING. POR REEMBOLSOS'							,	false, 	false, 	'IOP', 	true, 	'DEV'	,11	, 10000, 1000),
(12, 'ING. FINANCIEROS'								,	false, 	false, 	'IOP', 	true, 	'DEV'	,12	, 10000, 1000),
(13, 'ING. DE INVERSIÓN'							,	false, 	false, 	'IOP', 	true, 	'DEV'	,13	, 10000, 1000),
*/

/*EL CATALOGO LO DEBERIA/TENDRIA QUE  MANEJAR CONTABILIDAD*/
/*
select * from gen.empresa;
select * from gen.negocio;
select * from com.afectacion;
select * from com.catalogo where id_empresa=1001;
select * from com.und_prod;
select * from com.producto;
*/



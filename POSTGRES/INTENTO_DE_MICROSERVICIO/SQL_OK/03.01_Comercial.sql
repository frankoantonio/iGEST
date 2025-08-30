--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--com.informe---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.informe;
create table com.informe (
	id_informe			bigserial		primary key,	
	id_negocio			int				not null,	
	id_persona			bigint			not null,
	id_familiar			bigint			not null,
	id_campania			bigint			not null,
	id_prod_proy		int				not null,
	id_grado			int				not null,
	id_carr_prof		int				not null,
	id_vendedor			bigint			not null,	
	fe_ini				timestamp		not null,
	fe_fin				timestamp		not null,
	id_tipo_estado		int				not null,
	id_inst_est			int				not null,		
	cerrado				bool			not null,
	nom_grado			varchar(20)		not null,	
	vendedor			varchar(20)		not null,
	id_tipo_gdo_interes	int				not null,
	constraint informe_id_campania_fkey foreign key (id_campania) references com.campania(id_campania) match simple on update no action on delete no action 
);
--
COMMENT ON TABLE com.informe IS 'Informes sobre campañas de colegios y academias.'; 
COMMENT ON COLUMN com.informe.id_informe IS 'Identificador de informe.';
COMMENT ON COLUMN com.informe.id_negocio IS 'Identificador de unidad de negocio.';
COMMENT ON COLUMN com.informe.id_persona IS 'Identificador del estudiante o beneficiario.';
COMMENT ON COLUMN com.informe.id_familiar IS 'Identificador del familiar.';
COMMENT ON COLUMN com.informe.id_campania IS 'Identificador de campaña.';
COMMENT ON COLUMN com.informe.id_prod_proy is 'Identificador del producto o proyecto.';
COMMENT ON COLUMN com.informe.id_grado IS 'Identificador del grado de interes.';
COMMENT ON COLUMN com.informe.id_carr_prof IS 'Identificador de la carrera profesional.';
COMMENT ON COLUMN com.informe.id_vendedor IS 'Identificador del ejecutivo de ventas.';
COMMENT ON COLUMN com.informe.fe_ini IS 'Fecha de inicio del proceso de informe.';
COMMENT ON COLUMN com.informe.fe_fin IS 'Fecha de finalización.';
COMMENT ON COLUMN com.informe.id_tipo_estado IS 'Identificador del tipo de estado [TI_ESTMATR].';
COMMENT ON COLUMN com.informe.id_inst_est IS 'Identificador de la institución de procedencia.';
COMMENT ON COLUMN com.informe.cerrado IS 'Indica si un proceso de informe ya esta finalizado.';
COMMENT ON COLUMN com.informe.nom_grado IS 'Nombre del grado de interes.';
COMMENT ON COLUMN com.informe.vendedor IS 'Nombre del ejecutivo de ventas.';
COMMENT ON COLUMN com.informe.id_tipo_gdo_interes IS 'Identificador del grado de interés [TI_GDOINTE].';
--
insert into com.informe (id_negocio, id_persona, id_familiar, id_campania, id_prod_proy, id_grado, id_carr_prof, id_vendedor, fe_ini, fe_fin, id_tipo_estado, id_inst_est, cerrado, nom_grado, vendedor, id_tipo_gdo_interes)
values
(10005, 20, 21, 10, 7, 14, -1, 20, '2021-03-17 08:01:02', '2021-03-31 18:29:59', 2040, -1  , true  , 'PRIMERO' , 'BRAMOS'		, 2061),
(10005, 21, 22, 10, 7, 14, -1, 20, '2021-04-17 08:02:03', '2021-04-30 15:01:03', 2040, -1  , true  , 'PRIMERO' , 'LREYES'		, 2061),
(10005, 22, 23, 10, 7, 14, -1, 20, '2021-05-17 08:03:04', '2021-05-31 16:58:08', 2041,  2  , true  , 'PRIMERO' , 'BRAMOS'		, 2061),
(10005, 23, 21, 10, 7, 14, -1, 20, '2021-06-17 08:04:05', '0001-01-01 00:00:00', 2041,  3  , false , 'PRIMERO' , 'LREYES'		, 2061),
(10005, 24, 22, 10, 7, 14, -1, 20, '2021-07-17 08:05:06', '0001-01-01 00:00:00', 2042,  4  , false , 'PRIMERO' , 'BRAMOS'		, 2061),
(10005, 25, 23, 10, 7, 14, -1, 20, '2021-08-17 08:06:07', '0001-01-01 00:00:00', 2043,  5  , false , 'PRIMERO' , 'YSUASNABAR'	, 2061),
(10005, 26, 23, 10, 7, 14, -1, 20, '2021-09-17 08:07:08', '0001-01-01 00:00:00', 2044,  6  , false , 'PRIMERO' , 'BRAMOS'		, 2061),
																								    
(10006, 27, 21, 14, 7, 14, -1, 20, '2021-03-17 08:01:02', '2021-03-31 18:29:59', 2040, -1  , true  , 'PRIMERO' , 'YSUASNABAR'	, 2061),
(10006, 26, 22, 14, 7, 14, -1, 20, '2021-04-17 08:02:03', '2021-04-30 15:01:03', 2040, -1  , true  , 'PRIMERO' , 'SARROYO'		, 2061),
(10006, 25, 23, 14, 7, 14, -1, 20, '2021-05-17 08:03:04', '2021-05-31 16:58:08', 2041,  2  , true  , 'PRIMERO' , 'SARROYO'		, 2061);



--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--com.atencion--------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.atencion;
create table com.atencion (
	id_atencion			bigserial		primary key,
	id_negocio			int				not null,
	id_informe			bigint			not null,
	fecha				timestamp		not null,
	id_tipo_atencion	int				not null,
	id_tipo_gdo_interes	int				not null,
	prox_fecha			varchar(10)		not null,
	prox_hora			varchar(5)		not null,
	obs					varchar(100)	not null,
	id_vendedor			bigint			not null,
	vendedor			varchar(20)		not null,
	constraint atencion_id_informe_fkey foreign key (id_informe) references com.informe(id_informe) match simple on update no action on delete no action 
);
--
COMMENT ON TABLE com.atencion IS 'Atención al cliente relacionado con un proceso de "Informe".'; 
COMMENT ON COLUMN com.atencion.id_atencion IS 'Identificador de atención.';
COMMENT ON COLUMN com.atencion.id_negocio IS 'Identificador de la unidad de negocio.';
COMMENT ON COLUMN com.atencion.id_informe IS 'Identificador del informe.';
COMMENT ON COLUMN com.atencion.fecha IS 'Fecha y hora de registro en el servidor.';
COMMENT ON COLUMN com.atencion.id_tipo_atencion IS 'Identificador del tipo de atención o contacto [TI_ATENCIO].';
COMMENT ON COLUMN com.atencion.id_tipo_gdo_interes IS 'Identificador del grado de interés [TI_GDOINTE].';
COMMENT ON COLUMN com.atencion.prox_fecha is 'Fecha de próxima cita, en formato dd/mm/yyyy.';
COMMENT ON COLUMN com.atencion.prox_hora IS 'Hora de próxima cita, en formato hh:mm.';
COMMENT ON COLUMN com.atencion.obs IS 'Consulta o comentario de la atención al cliente.';
COMMENT ON COLUMN com.atencion.id_vendedor IS 'Identificador del ejecutivo de ventas.';
COMMENT ON COLUMN com.atencion.vendedor IS 'Nombre de usuario del ejecutivo de ventas.';
--
insert into com.atencion (id_negocio, id_informe, fecha, id_tipo_atencion, id_tipo_gdo_interes, prox_fecha, prox_hora, obs, id_vendedor, vendedor )
values
(10005,  1 , '0001-01-01 00:00:00' , 2021 , 2060,  '21/01/2019', '08:00', 'SE LE OFRECIÓ DESCUENTOS DEL 10%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  1 , '0001-01-01 09:12:00' , 2021 , 2060,  '22/02/2019', '09:00', 'SE LE OFRECIÓ DESCUENTOS DEL 20%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  1 , '2021-04-01 10:12:00' , 2021 , 2060,  '23/03/2019', '10:00', 'SE LE OFRECIÓ DESCUENTOS DEL 30%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  2 , '2021-05-01 11:12:00' , 2021 , 2060,  '24/04/2019', '11:00', 'SE LE OFRECIÓ DESCUENTOS DEL 40%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  3 , '2021-06-01 12:12:00' , 2021 , 2060,  '25/05/2019', '12:00', 'SE LE OFRECIÓ DESCUENTOS DEL 50%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  3 , '2021-07-01 13:12:00' , 2021 , 2060,  '26/06/2019', '01:00', 'SE LE OFRECIÓ DESCUENTOS DEL 60%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  4 , '2021-08-01 14:12:00' , 2021 , 2060,  '27/07/2019', '02:00', 'SE LE OFRECIÓ DESCUENTOS DEL 70%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  4 , '2021-09-01 15:12:00' , 2021 , 2060,  '28/08/2019', '03:00', 'SE LE OFRECIÓ DESCUENTOS DEL 80%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  4 , '2021-10-01 16:12:00' , 2021 , 2060,  '29/09/2019', '04:00', 'SE LE OFRECIÓ DESCUENTOS DEL 90%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  4 , '2021-10-02 17:12:00' , 2021 , 2060,  '30/10/2019', '05:00', 'SE LE OFRECIÓ DESCUENTOS DEL 91%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  4 , '2021-10-03 18:12:00' , 2021 , 2060,  '21/11/2019', '06:00', 'SE LE OFRECIÓ DESCUENTOS DEL 92%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  4 , '2021-10-04 19:12:00' , 2021 , 2060,  '22/12/2019', '07:00', 'SE LE OFRECIÓ DESCUENTOS DEL 93%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  4 , '2021-10-05 20:12:00' , 2021 , 2060,  '23/01/2019', '08:00', 'SE LE OFRECIÓ DESCUENTOS DEL 94%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA'), 
(10005,  5 , '2021-11-01 21:12:00' , 2021 , 2060,  '24/02/2019', '09:00', 'SE LE OFRECIÓ DESCUENTOS DEL 95%, SÍ MATRICULA ANTES DEL 01/10/2021' , '20' , 'FBARZOLA');



--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--com.descalifica-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.descalifica;
create table com.descalifica (
	id_descalifica		bigserial		NOT NULL PRIMARY KEY,
	id_informe			bigint			NOT NULL,	
	id_atencion			bigint			not null,
	id_tipo_descalifica	int				NOT NULL,
	id_inst_est			bigint			NOT NULL,	
	porque_inst_est		varchar(50)		NOT NULL,
	obs					varchar(50)		NOT NULL,
	llamar_prox			bool			NOT null,
	id_tipo_atencion	int				NOT NULL,
	constraint descalifica_id_atencion_fkey foreign key (id_atencion) references com.atencion(id_atencion) match simple on update no action on delete no action
);
--
COMMENT ON TABLE com.descalifica IS 'Descalificación relacionado a un proceso de "Informe".'; 
COMMENT ON COLUMN com.descalifica.id_descalifica IS 'Identificador de descalificación.';
COMMENT ON COLUMN com.descalifica.id_informe IS 'Identificador de informe.';
COMMENT ON COLUMN com.descalifica.id_atencion IS 'Identificador de atención.';
COMMENT ON COLUMN com.descalifica.id_tipo_descalifica IS 'Identificador del tipo de descalificación [TI_DESCALI].';
COMMENT ON COLUMN com.descalifica.id_inst_est IS 'Identificador de institución de estudio.';
COMMENT ON COLUMN com.descalifica.porque_inst_est IS 'Motivo por el que elije otra institución.';
COMMENT ON COLUMN com.descalifica.obs IS 'Observación o comentario al descalificar.';
COMMENT ON COLUMN com.descalifica.llamar_prox IS 'Si acepta se le llame próxima campaña.';
COMMENT ON COLUMN com.descalifica.id_tipo_atencion IS 'Identificador del tipo de atención o contacto [TI_ATENCIO].';
--
insert into com.descalifica (id_informe, id_atencion, id_tipo_descalifica, id_inst_est, porque_inst_est, obs, llamar_prox, id_tipo_atencion) 
values 
( 1 ,  1 , 2070,  -1, ''					, '---'							, true , 2025),
( 2 ,  4 , 2071,   1, 'NO EXIGE LIBROS'		, 'MUY MOLESTO POR LOS LIBROS'	, true , 2025),
( 3 ,  5 , 2072,   2, 'MAS CERCA A SU CASA'	, '---'							, false, 2025);



--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--com.inscripcion-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists com.inscripcion;
create table com.inscripcion (
	id_inscripcion		bigserial		primary key,	
	id_negocio			int				not null,	
	id_estudiante		bigint			not null,
	id_familiar			bigint			not null,
	id_campania			bigint			not null,
	id_prod_proy		int				not null,
	id_grado			int				not null,
	id_carr_prof		int				not null,	
	id_area_prof		int				not null,
	fe_insc				timestamp		not null,
	id_inst_est			bigint			not null,	
	id_vendedor			bigint			not null,	
	vendedor			varchar(25)		not null,	
	id_seccion			bigint			not null,
	id_tipo_publicidad	int				not null,	--[TI_PUBLICI]
	id_tipo_estado		int				not null,	--[TI_ESTMATR]
	id_tipo_dscto		int				not null,	--[TI_DESCTOS]
	id_tipo_ingreso		int				not null,	--[TI_INGRESO]
	id_tipo_eval_ing	int				not null,	--[TI_EVALING]
	id_tipo_eval_fin	int				not null,	--[TI_EVALFIN]
	id_informe			bigint			not null,
	cod_matricula		varchar(10)		not null,
	id_beneficio		bigint 			not null,
	obs					varchar(50)		not null,
	fe_matr				timestamp		not null,
	cerrado				bool			not null,
	id_tipo_inscripcion	int 			not null,	
	constraint inscripcion_id_campania_fkey foreign key (id_campania) references com.campania(id_campania) match simple on update no action on delete no action, 
	constraint inscripcion_id_seccion_fkey foreign key (id_seccion) references acd.seccion(id_seccion) match simple on update no action on delete no action
);
-- 
COMMENT ON TABLE com.inscripcion IS 'Inscripciones y/o matrículas en una campaña.'; 
COMMENT ON COLUMN com.inscripcion.id_inscripcion IS 'Identificador de inscripción.';
COMMENT ON COLUMN com.inscripcion.id_negocio IS 'Identificador de unidad de negocio.';
COMMENT ON COLUMN com.inscripcion.id_estudiante IS 'Identificador del estudiante.';
COMMENT ON COLUMN com.inscripcion.id_familiar IS 'Identificador del familiar.';
COMMENT ON COLUMN com.inscripcion.id_campania IS 'Identificador de campaña.';
COMMENT ON COLUMN com.inscripcion.id_prod_proy is 'Identificador del producto o proyecto.';
COMMENT ON COLUMN com.inscripcion.id_grado IS 'Identificador del grado o ciclo de estudios.';
COMMENT ON COLUMN com.inscripcion.id_carr_prof IS 'Identificador de la carrera profesional.';
COMMENT ON COLUMN com.inscripcion.id_area_prof IS 'Identificador del área profesional.';
COMMENT ON COLUMN com.inscripcion.fe_insc IS 'Fecha en que se registra la inscripción.';
COMMENT ON COLUMN com.inscripcion.id_inst_est IS 'Identificador de la institución de estudio.';
COMMENT ON COLUMN com.inscripcion.id_vendedor IS 'Identificador del ejecutivo de ventas.';
COMMENT ON COLUMN com.inscripcion.vendedor IS 'Nombre del ejecutivo de ventas.';
COMMENT ON COLUMN com.inscripcion.id_seccion IS 'Identificador de la sección.';
COMMENT ON COLUMN com.inscripcion.id_tipo_publicidad IS 'Identificador del tipo de publicidad [TI_PUBLICI].';
COMMENT ON COLUMN com.inscripcion.id_tipo_estado IS 'Identificador del tipo de estado [TI_ESTMATR].';
COMMENT ON COLUMN com.inscripcion.id_tipo_dscto IS 'Identificador del tipo de descuento [TI_DESCTOS].';
COMMENT ON COLUMN com.inscripcion.id_tipo_ingreso IS 'Identificador del tipo de ingreso a la institución [TI_INGRESO].';
COMMENT ON COLUMN com.inscripcion.id_tipo_eval_ing IS 'Identificador del tipo de ingreso en base a la evaluación pasada [TI_EVALING].';
COMMENT ON COLUMN com.inscripcion.id_tipo_eval_fin IS 'Identificador del tipo de situación de evaluación al finalizar campaña [TI_EVALFIN].';
COMMENT ON COLUMN com.inscripcion.id_informe IS 'Identificador del informe asociado, sí no lo tiene, -1 como predeterminado.';
COMMENT ON COLUMN com.inscripcion.cod_matricula IS 'Código de matrícula para la academia.';
COMMENT ON COLUMN com.inscripcion.id_beneficio IS 'Identificador del beneficio o descuento.';
COMMENT ON COLUMN com.inscripcion.obs IS 'Alguna observación al momento de la inscripción.';
COMMENT ON COLUMN com.inscripcion.fe_matr IS 'Fecha en que se concreta la matrícula.';
COMMENT ON COLUMN com.inscripcion.cerrado IS 'Cuando es true, ya no se permitirá modificar.';
COMMENT ON COLUMN com.inscripcion.id_tipo_inscripcion IS 'Según tipo de inscripción de la campaña [TI_INSCRCO][TI_INSCRAC].';
-- 
insert into com.inscripcion (id_negocio, id_estudiante, id_familiar, id_campania, id_prod_proy, id_grado, id_carr_prof, id_area_prof, fe_insc, id_inst_est, id_vendedor, vendedor, id_seccion, id_tipo_publicidad, id_tipo_estado, id_tipo_dscto, id_tipo_ingreso, id_tipo_eval_ing, id_tipo_eval_fin, id_informe, cod_matricula, id_beneficio, obs, fe_matr, cerrado, id_tipo_inscripcion)
values
(10005, 20, 21,  8, 5, 2, 0, 0, '2020-01-05', 5, 20, 'fbarzola', 3, 2130, 2044, 2180, 2150, 2170, 2192, -1, '20000001' , 1 , 'Observación 1' , '2016-01-01' , true  , 2210),
(10005, 20, 21,  8, 5, 3, 0, 0, '2020-02-06', 5, 20, 'fbarzola', 5, 2131, 2043, 2181, 2151, 2171, 2199, -1, '20000002' , 2 , 'Observación 2' , '2017-02-01' , true  , 2210),
(10005, 20, 21,  9, 6, 8, 0, 0, '2020-03-07', 5, 20, 'fbarzola',15, 2132, 2044, 2182, 2152, 2172, 2192, -1, '20000003' , 8 , 'Observación 3' , '2018-03-01' , false , 2210),
(10005, 20, 21,  9, 6, 9, 0, 0, '2020-04-08', 5, 20, 'fbarzola',17, 2133, 2045, 2180, 2150, 2170, 2199, -1, '21000001' , 1 , ''			     , '2019-04-01' , false , 2210),
(10005, 20, 21, 10, 7,12, 0, 0, '2020-05-09', 5, 20, 'fbarzola',23, 2134, 2046, 2181, 2151, 2171, 2199, -1, '21000002' , 3 , 'Observación 4' , '2019-05-01' , false , 2210),
(10005, 20, 21, 10, 7,13, 0, 0, '2020-06-10', 5, 20, 'fbarzola',25, 2135, 2047, 2182, 2152, 2172, 2199, -1, '21000003' , 9 , 'Observación 5' , '2019-06-01' , false , 2210),
(10005, 20, 21, 10, 7,14, 0, 0, '2020-07-10', 5, 20, 'fbarzola',27, 2136, 2044, 2182, 2150, 2170, 2191, -1, '22000099' , 27, ''			     , '2019-07-01' , false , 2210);



--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--acd.docs_exige------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists acd.docs_exige;
create table acd.docs_exige (
	id_docs_exige		bigserial		primary key,	
	id_negocio			int				not null,		
	nom_doc				varchar(50)		not null,	
	activo				boolean			not null,
	obligado			boolean			not null
);
--
COMMENT ON TABLE acd.docs_exige IS 'Documentos que se exige al matricular en el colegio o academia.'; 
COMMENT ON COLUMN acd.docs_exige.id_docs_exige IS 'Identificador de documento exigido.';
COMMENT ON COLUMN acd.docs_exige.id_negocio IS 'Identificador de unidad de negocio.';
COMMENT ON COLUMN acd.docs_exige.nom_doc IS 'Nombre del documento.';
COMMENT ON COLUMN acd.docs_exige.activo is 'Sí verdadero, se muestra para ser solicitado.';
COMMENT ON COLUMN acd.docs_exige.obligado is 'Sí verdadero, es obligatorio solicitar el documento.';
-- 
insert into acd.docs_exige (id_negocio, nom_doc, activo, obligado)
values
(10005, 'PARTIDA DE NACIMIENTO'		,  true,  false),
(10005, 'COPIA DE DNI O SIMILAR'	,  true,  true ),
(10005, 'RECIBO DE AGUA ó LUZ'		,  true,  true ),
(10005, 'CONSTANCIA DE NO ADEUDO'	,  true,  false),
(10005, 'BOLETA DE CALIFICACIONES'	,  true,  true ),
(10005, 'CONTRATO 2021'				,  true,  true ),
(10005, 'FOTOGRAFÍA'				,  true,  false),

(10006, 'COPIA DEL DNI O SIMILAR'	,  true,  false),
(10006, 'FOTOGRAFÍA'				,  true,  true );



--=================_OK_OK_OK_=================*=================_OK_OK_OK_=================*=================_OK_OK_OK_================*
----------------------------------------------------------------------------------------------------------------------------------------
--acd.docs_estudiante------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists acd.docs_estudiante;
create table acd.docs_estudiante (
	id_docs_est			bigserial		primary key,	
	id_negocio			int				not null,	
	id_estudiante		bigint 			not null,
	id_docs				bigint 			not null,
	recibe_fe			timestamp		not null,	
	recibe_usu			varchar(25)		not null,
	actualiza_fe		timestamp		not null,	
	actualiza_usu		varchar(25)		not null,
	devuelve_fe			timestamp		not null,	
	devuelve_usu		varchar(25)		not null	
);
--
COMMENT ON TABLE acd.docs_estudiante IS 'Documentos exigidos por estudiante y unidad de negocio.'; 
COMMENT ON COLUMN acd.docs_estudiante.id_docs_est IS 'Identificador de entidad.';
COMMENT ON COLUMN acd.docs_estudiante.id_negocio IS 'Identificador de unidad de negocio.';
COMMENT ON COLUMN acd.docs_estudiante.id_estudiante IS 'Identificador de estudiante.';
COMMENT ON COLUMN acd.docs_estudiante.id_docs is 'Identificador de documento.';
COMMENT ON COLUMN acd.docs_estudiante.recibe_fe is 'Fecha de recepción.';
COMMENT ON COLUMN acd.docs_estudiante.recibe_usu is 'Usuario que recepciona.';
COMMENT ON COLUMN acd.docs_estudiante.actualiza_fe is 'Fecha de actualización.';
COMMENT ON COLUMN acd.docs_estudiante.actualiza_usu is 'Usuario que actualiza';
COMMENT ON COLUMN acd.docs_estudiante.devuelve_fe is 'Fecha de devolución.';
COMMENT ON COLUMN acd.docs_estudiante.devuelve_usu is 'Usuario que devuelve los documentos.';
-- 
insert into acd.docs_estudiante (id_negocio, id_estudiante, id_docs, recibe_fe, recibe_usu, actualiza_fe, actualiza_usu, devuelve_fe, devuelve_usu)
values
(10005,  20 ,  1 ,  '2022-04-01'  , 'FBARZOLA'  ,  '2022-05-01'  ,   'BRAMOS'  	,  '2022-07-01'  , 'SARROYO'),
(10005,  20 ,  2 ,  '2022-04-01'  , 'FBARZOLA'  ,  '2022-06-01'  ,   'SSALAZAR'	,  '0001-01-01'  , '' 		),
(10005,  20 ,  5 ,  '2022-05-25'  , 'FBARZOLA'  ,  '0001-01-01'  ,   ''  		,  '0001-01-01'  , ''		),
(10005,  21 ,  6 ,  '2022-03-01'  , 'FBARZOLA'  ,  '0001-01-01'  ,   ''  		,  '0001-01-01'  , ''		),
(10005,  21 ,  7 ,  '2022-04-01'  , 'FBARZOLA'  ,  '0001-01-01'  ,   ''  		,  '0001-01-01'  , ''		);



----------------------------------------------------------------------------------------------------------------------------------------
--alm.almacen---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists alm.almacen; 
create table alm.almacen( 
	id_almacen		int				NOT NULL,
	--id_empresa		int				NOT NULL,
	id_negocio		int				NOT NULL,
	id_local		int				not null,
	nom_almacen 	varchar(100)	NOT NULL,
	activo			bool			NOT NULL,
	constraint almacen_pkey primary key (id_almacen)--,
	--constraint almacen_id_negociolocal_fkey foreign key (id_negociolocal) references gen.negocio_local (id_negociolocal) match simple on update no action on delete no action
	--constraint almacen_id_negocio_fkey foreign key (id_negocio) references gen.negocio (id_negocio) match simple on update no action on delete no action  
);
--
--comment on column alm.almacen.id_almacen IS 'Identificador de almacÃ©n';
--comment on column alm.almacen.nom_almacen IS 'Nombre de almacÃ©n';
--comment on column alm.almacen.id_local IS 'Identificador del local donde esta el almacen';
--comment on column alm.almacen.id_negocio IS 'Identificador de negocio';
--comment on column alm.almacen.activo IS 'Indica si el almacÃ©n esta activo';
--comment on column alm.almacen.id_empresa IS 'Identificador de empresa';
comment on table alm.almacen IS 'Almacenes de una unidad de negocio y/o de toda la empresa'; --SIEMPRE TENDRÃ�AN UN ALMACEN aun asi sea false 
--
--insert into alm.almacen (id_almacen, nom_almacen, id_negociolocal, activo, id_empresa) --id_local, id_negocio
insert into alm.almacen (id_almacen, id_negocio, id_local, nom_almacen, activo) --id_local, id_negocio id_empresa,  
values 
(1, 101, 1001, 'ALMACÉN GENERAL YS'	, false),	-- almacen por defecto, pero false
(2, 102, 1002, 'ALMACÉN CENTRAL LBG', true ),
(3, 103, 1003, 'ALMACÉN CENTRAL ES'	, true ), 
(4, 104, 1004, 'ALMACÉN GYMNASIO'	, false), 
(5,  -1, 1005, 'ALMACÉN COL|ACD|DEP', true  ),	-- un solo almacen en un solo locla para todos los negocios
(6, 104, 1006, 'ALMACÉN GYMNASIO'	, false),	-- en un mismo local tres almacenes diferentes
(7, 104, 1006, 'ALMACÉN GYMNASIO'	, false),
(8, 104, 1006, 'ALMACÉN GYMNASIO'	, false);


----------------------------------------------------------------------------------------------------------------------------------------
--alm.almacenero----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists alm.almacenero; 
create table alm.almacenero(
	id_almacenero	int				NOT NULL,
	id_almacen		int				NOT NULL,
	id_usuario		int				NOT NULL,
	activo			bool			NOT NULL,
	--id_empresa		int				not null,
	constraint almacenero_pkey primary key (id_almacenero),
	constraint almacenero_id_almacen_fkey foreign key (id_almacen) references alm.almacen(id_almacen) match simple on update no action on delete no action
);
--
comment on table alm.almacenero IS 'Registro de los responsables de almacÃ©n, puede estar activo mas de uno en un almacÃ©n';
--
insert into alm.almacenero (id_almacenero, id_almacen, id_usuario, activo) --, id_empresa 
values 
(1, 2, 101, true), --, 1001 
(2, 3, 101, true), --, 1001	 
(3, 5, 103, true),
(4, 6, 103, true),
(5, 7, 104, true);



----------------------------------------------------------------------------------------------------------------------------------------
--alm.stock---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists alm.stock; 
create table alm.stock(
	id_stock		int				NOT NULL,
	id_almacen		int				NOT NULL,
	id_articulo		int				NOT NULL,
	cantidad		int				NOT NULL,
	--cant_min		int				NOT NULL,
	--cant_real		int				NOT NULL,
	--anio			int				not null,
	id_empresa		int				not null,
	constraint almacen_articulo_pkey primary key (id_stock),
	constraint almacen_articulo_id_almacen_fkey foreign key (id_almacen) references alm.almacen(id_almacen) match simple on update no action on delete no action,
	constraint almacen_articulo_id_articulo_fkey foreign key (id_articulo) references alm.articulo (id_articulo) match simple on update no action on delete no action
);
--
comment on column alm.stock.id_stock IS 'Identificador de tabla';
comment on column alm.stock.id_almacen IS 'Identificador de almacÃ©n';
comment on column alm.stock.id_articulo IS 'Identificador de artÃ­culo';
--comment on column alm.stock.cant_min IS 'Cantidad mÃ­nima de artÃ­culos en el almacÃ©n';
--comment on column alm.stock.cant_real IS 'Cantidad actual de artÃ­culos';
comment on column alm.stock.cantidad IS 'Cantidad actual de artÃ­culos';
--comment on column alm.stock.anio IS 'El stock de un artÃ­culo en un aÃ±o, si se trabaja en aÃ±o. Si no se controla por aÃ±o, va -1';
comment on column alm.stock.id_empresa IS 'Identificador de empresa';
comment on table alm.stock IS 'Stock de artÃ­culos por almacÃ©n';
--
insert into alm.stock (id_stock, id_almacen, id_articulo, cantidad, id_empresa) --anio,  
values 
(1, 1,  2, 100	, 1001), 
(2, 1,  3, 100	, 1001), 
(3, 1,  4, 100	, 1001),
(4, 2,  2,  25	, 1001), 
(5, 2,  3,  25	, 1001), 
(6, 2,  4,  25	, 1001),
(7, 3,  2,  50	, 1001), 
(8, 3,  3,  50	, 1001), 
(9, 3,  4,  50	, 1001); 


-- LOS INGRESOS A ALMACEN TAMBIEN PUEDEN SER A TRAVÉS DE UN CONTRATO GLOBAL, DONDE NO SE DETALLA CADA UNO DE LOS COMPONESTES
-- LAS SALIDAS DE ALMACEN TAMBIEN SER POR UN CONTRATO, EN EL CONTRATO SE PROVEE DE TODOS LOS MATERIALES
----------------------------------------------------------------------------------------------------------------------------------------
--alm.nota_almacen--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists alm.nota_almacen; 
create table alm.nota_almacen(
	id_nota			int				NOT NULL,
	id_almacen		int				not null,
	anio			int				NOT NULL,
	numero			int				NOT NULL,	
	id_tipoes		char(1)			not null, 		-- E/S
	id_tioper		char(6)			NOT NULL,		-- compra, venta, donacion, reparacion, devolucion de compra o venta, cambio, custodia
	id_requerimiento int			not null,		-- numero de requerimiento de almacen
	id_orden		int				not null,		-- orden de compra o -1
	id_comprobante	int				not null,		-- factura o boleta Ã³ -1
	guia_remision	varchar(50)		NOT NULL,		-- si tiene guia que indique los datos de la guia de remision	
	conforme		bool			not null,
	fe_operacion	date			NOT NULL,
	observaciÃ³n		varchar(100)	NOT NULL,
	id_almacenero	int				not null,
	eliminado		bool			not null,		-- marcar como eliminado, puede repetirse el aÃ±o y numero de la nota de almacen
		--id_tiestopalm	char(6)			not null,		-- tipo de estado en operacion de almacen: registrado, anulado --cambiar por estados: conforme(C), rechazado(R), anulado(X)
	id_empresa		int				not null,
	constraint nota_almacen_pkey primary key (id_nota),
	constraint nota_almacen_id_almacen_fkey foreign key (id_almacen) references alm.almacen(id_almacen) match simple on update no action on delete no action
	--constraint nota_es_id_articulo_fkey foreign key (id_articulo) references alm.articulo (id_articulo) match simple on update no action on delete no action
);
--
comment on table alm.nota_almacen IS 'Notas de entrada y salida de almacÃ©n';
--
/*
insert into alm.nota_es (id_almart, id_almacen, id_articulo, cantidad) 
values 
(1, 1,  2, 100), 
(2, 1,  3, 100), 
(3, 1,  4, 100),
(4, 2,  2,  25), 
(5, 2,  3,  25), 
(6, 2,  4,  25),
(7, 3,  2,  50), 
(8, 3,  3,  50), 
(9, 3,  4,  50); 
*/

--select * from alm.almacen
--select * from alm.articulo


/*
----------------------------------------------------------------------------------------------------------------------------------------
--alm.nota_esdet----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists alm.nota_esdet; 
create table alm.nota_esdet(
	id_notaesdet	int				NOT NULL,
	id_notaes		int				NOT NULL,
	id_almacen		int				not null,
	id_articulo		int				not null,
	precio			decimal(18,2)	NOT NULL,
	cantidad		int				NOT NULL,
	fraccion		int				NOT null,	
	constraint nota_esdet_pkey primary key (id_notaesdet),
	constraint nota_esdet_id_notaes_fkey foreign key (id_notaes) references alm.nota_es(id_notaes) match simple on update no action on delete no action
);
--
comment on table alm.nota_esdet IS 'Detalle de los artÃ­culos de notas de entrada y salida de almacÃ©n';
--


*/
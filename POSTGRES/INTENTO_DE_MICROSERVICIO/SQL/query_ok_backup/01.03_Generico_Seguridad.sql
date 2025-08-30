/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.gb_var----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.gb_var; 
CREATE TABLE gen.gb_var (
	id_gbvar		int			NOT NULL PRIMARY KEY,
	id_negocio		int			NOT NULL,
	id_sistema		char(3)		NOT NULL,
	nom_gbvar		varchar(25)	NOT null,
	valor			varchar(50)	NOT NULL,
	descripcion		varchar(75)	NOT NULL
);
--
COMMENT ON COLUMN gen.gb_var.id_gbvar IS 'Identificador de variable global';
COMMENT ON COLUMN gen.gb_var.id_negocio IS 'Identificador del negocio. -1 cuando es para todos los negocios';
COMMENT ON COLUMN gen.gb_var.id_sistema IS 'Identificador de sistema';
COMMENT ON COLUMN gen.gb_var.nom_gbvar IS 'Nombre de variable global';
COMMENT ON COLUMN gen.gb_var.valor IS 'Valor de la variable global';
COMMENT ON COLUMN gen.gb_var.descripcion IS 'Descripción de la variable global';
COMMENT ON TABLE  gen.gb_var IS 'Variables globales del sistema';
--
INSERT INTO gen.gb_var (id_gbvar, id_negocio, id_sistema, nom_gbvar, valor, descripcion)
values
( 1,  -1, 'GEN',  'minCarFind'	, '5'										, 'Minimo de caracteres para búsqueda'),
( 2,  -1, 'GEN',  'urlReports'	, 'http://125.125.125.235/sigaad/report/'	, 'Dirección del servidor de reportes'),
( 3,  -1, 'PER',  'rmRMV'		, '850.00'									, 'Remuneración mínima vital'),
( 4,  -1, 'PER',  'rmAsigFam'	,  '85.00'									, 'Asignación familiar'),
( 5,  -1, 'PER',  'rmEsSalud'	,   '0.09'									, 'Taza por EsSalud'),
( 6,  -1, 'PER',  'rmHhExt01'	,   '0.25'									, 'Primer tramo por horas extras'),
( 7,  -1, 'PER',  'rmHhExt02'	,   '0.45'									, 'Segundo tramo por horas extras'),
( 8,  -1, 'PER',  'rmHhExt03'	,   '0.25'									, 'Primer tramo por horas extras'),
( 9,  -1, 'FIN',  'ffPlazoRend'	, '10'										, 'Plazo para rendir el fondo fijo'),
(10, 101, 'FIN',  'ffTopeLiq'	, '4000.00'									, 'Tope para liquidar un fondo fijo'),
(11, 101, 'FIN',  'ffMaxComp'	, '700.00'									, 'Importe máximo por comprobante'),
(12, 102, 'FIN',  'ffTopeLiq'	, '2000.00'									, 'Tope para liquidar un fondo fijo'),
(13, 102, 'FIN',  'ffMaxComp'	, '500.00'									, 'Importe máximo por comprobante'),
(14, 103, 'FIN',  'ffTopeLiq'	, '1000.00'									, 'Tope para liquidar un fondo fijo'),
(15, 103, 'FIN',  'ffMaxComp'	, '500.00'									, 'Importe máximo por comprobante'),
(16, 101, 'FIN',  'cjMoradia'	, '0.50'									, 'Mora por día'),
(17,  -1, 'FIN',  'cjIGV'		, '0.18'									, 'IGV'),
(18,  -1, 'FIN',  'cjIR'		, '0.10'									, 'Impuesto a la renta'),
(19,  -1, 'FIN',  'cjFacEl'		, '//192.168.123.15/data'					, 'Ruta para archivos de texto de comprobante electrónico'),
(20, 101, 'ACD',  'anioMat'		, '2018'									, 'Año para las matrículas'),
(21, 101, 'ACD',  'anioEva'		, '2017'									, 'Año para las evaluaciones');
*/

/*LOS ROLES SERÁN LOS SISTEMAS QUE SE ASIGNAN AL USUARIO*/
----------------------------------------------------------------------------------------------------------------------------------------
--user_roles------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.user_roles;
create table gen.user_roles (
	username 		varchar(50) 	not null,
	role			varchar(50) 	NOT NULL
);
--
INSERT INTO gen.user_roles (username, role) 
VALUES 
('fbarzola'	, 'GENERAL'),
('fbarzola'	, 'COMERCIAL'),
('fbarzola'	, 'LOGISTICO'),
('fbarzola'	, 'LABORAL'),
('fbarzola'	, 'FINANCIERO'),
('ssalazar'	, 'GENERAL'),
('ssalazar'	, 'COMERCIAL'),
('ssalazar'	, 'FINANCIERO');






----------------------------------------------------------------------------------------------------------------------------------------
--gen.rol_usuario-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.rol_usuario;
create table gen.rol_usuario(
	id_rolusuario		int			not null primary key,
	--id_negocio 			int 		NOT NULL,
	--id_sistema 			char(3) 	NOT NULL,
	id_rol 				char(4)		NOT NULL,
	id_usuario 			int 		NOT NULL,	
	lectura 			bool 		NOT NULL,
	activo 				bool 		NOT null,
	--CONSTRAINT rol_usuario_id_negocio_id_sistema_fkey FOREIGN KEY (id_negocio,id_sistema) REFERENCES gen.negocio_sistema(id_negocio,id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT rol_usuario_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES gen.rol(id_rol) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT rol_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
INSERT INTO gen.rol_usuario (id_rolusuario, id_rol, id_usuario, lectura, activo) 
VALUES  
( 1, 'RG01', 1, false, true),
( 2, 'RG02', 1, false, true),
( 3, 'RG03', 1, false, true),
( 4, 'RG04', 1, false, true),
( 5, 'RC01', 1, false, true),
( 6, 'RC02', 1, false, true),
(11, 'RC03', 2, false, true),
(12, 'RC04', 2, true,  true),
(13, 'RC05', 2, true,  true);




----------------------------------------------------------------------------------------------------------------------------------------
--gen.opcion----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.opcion;
create table gen.opcion(
	id_opcion 		int 		not null primary key,	
	id_padre 		int 		not null,
	id_rol			char(4)		not null,	
	nom_opcion 		varchar(50) not null,
	nom_control 	varchar(75) not null,
	id_tiopcion 	char(6) 	not null,
	orden 			int 		not null,
	visible 		bool 		not null,
	id_tinegocio	char(6)		not null,
	CONSTRAINT opcion_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES gen.rol(id_rol) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT opcion_id_tinegocio_fkey FOREIGN KEY (id_tinegocio) REFERENCES gen.tipo(id_tipo) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
COMMENT ON COLUMN gen.opcion.nom_control IS 'Ruta y nombre del control fxml';
COMMENT ON COLUMN gen.opcion.id_tiopcion IS 'Tipo de la opcion: Cabecera, Control, Reporte';
COMMENT ON COLUMN gen.opcion.visible IS 'Indica si la opción se muestra al usuario en el árbol de opciones';
--
INSERT INTO gen.opcion (id_opcion, id_padre, id_rol, nom_opcion, nom_control, id_tiopcion, orden, visible, id_tinegocio) 
values
-- rol búsqueda
(1001,   -1, 'RG01', 'BÚSQUEDA'					, ''											, '109HEA',  1, false	,'100COM'),
(1002, 1001, 'RG01', 'BUSCAR PERSONA'			, '/com/sigaad/app/gen/FrmBuscarPersona'		, '109FRM',  2, false	,'100COM'),
(1004, 1001, 'RG01', 'BUSCAR DIRECCIÓN'			, '/com/sigaad/app/gen/FrmBuscarDirección'		, '109FRM',  4,	false	,'100COM'),
(1005, 1001, 'RG01', 'BUSCAR UBIGEO'			, '/com/sigaad/app/gen/FrmBuscarUbigeo'			, '109FRM',  5,	false	,'100COM'),

-- rol pre ventas 
(1102, 2001, 'RG01', 'Buscar persona'			, 'com.yupana.sigaad.app.FrmBuscarPersona'		, '109FRM',  5,	false	,'100EBR'),
(1103, 2001, 'RG01', 'Buscar dirección'			, 'com.yupana.sigaad.app.FrmBuscarDireccion'	, '109FRM',  5,	false	,'100APU'),
(1104, 2001, 'RG01', 'Registrar persona'		, 'com.yupana.sigaad.app.FrmPersona'			, '109FRM',  5,	false	,'100COM'),
(1105, 2001, 'RG01', 'Registrar alumno'			, 'com.yupana.sigaad.app.FrmAlumno'				, '109FRM',  5,	false	,'100COM'),
(1106, 2001, 'RG01', 'Registrar familiar'		, 'com.yupana.sigaad.app.FrmFamiliar'			, '109FRM',  5,	false	,'100COM'),
(1107, 2001, 'RG01', 'Registrar cliente'		, 'com.yupana.sigaad.app.Frmcliente'			, '109FRM',  5,	false	,'100COM'),
(1108, 2001, 'RG01', 'Registrar proveedor'		, 'com.yupana.sigaad.app.Frmcliente'			, '109FRM',  5,	false	,'100COM'),
(1109, 2001, 'RG01', 'Registrar trabajador'		, 'com.yupana.sigaad.app.Frmcliente'			, '109FRM',  5,	false	,'100COM'),
(1110, 2001, 'RG01', 'Registrar dirección'		, 'com.yupana.sigaad.app.FrmDireccion'			, '109FRM',  5,	false	,'100COM'),
(1111, 2001, 'RG01', 'Registrar ubigeo'			, 'com.yupana.sigaad.app.FrmDireccion'			, '109FRM',  5,	false	,'100COM'),
(1112, 2001, 'RG01', 'Registrar grupo familiar'	, 'com.yupana.sigaad.app.FrmDireccion'			, '109FRM',  5,	false	,'100COM'),
(1201, 2001, 'RG01', 'Informes colegio'			, 'com.yupana.sigaad.app.UctInformesColegio'	, '109UCT',  5,	false	,'100COM'),
(1202, 2001, 'RG01', 'Informes academia'		, 'com.yupana.sigaad.app.UctInformesAcademia'	, '109UCT',  5,	false	,'100COM'),
(1203, 2001, 'RG01', 'Registrar Informes'		, 'com.yupana.sigaad.app.FrmInformesMnt'		, '109FRM',  5,	false	,'100COM'),
(1304, 2001, 'RG01', 'Seguimiento de informes'	, 'com.yupana.sigaad.app.UctSegCliente'			, '109UCT',  5,	false	,'100COM'),
(1305, 2001, 'RG01', 'Registrar Contacto'		, 'com.yupana.sigaad.app.FrmContactoMnt'		, '109FRM',  5,	false	,'100COM'),

-- rol ventas
(1401, 2001, 'RG02', 'Inscripciónes'			, '/com/apivsa/sigaad/application/ventas/FrmS'	, '109FRM',  5,	false	,'100COM'),
(1412, 2001, 'RG02', 'Grupo Familiar'			, 'com.yupana.sigaad.app.FrmSegCliente'			, '109UCT',  5,	false	,'100COM'),
(1403, 2001, 'RG02', 'Notas de pedido'			, '/com/apivsa/sigaad/application/ventas/Frm'	, '109FRM',  5,	false	,'100COM'),
(1404, 2001, 'RG02', 'Cronograma de pago'		, '/com/apivsa/sigaad/application/ventas/FrmS'	, '109FRM',  5,	false	,'100COM'),
(1405, 2001, 'RG02', 'Beneficios otorgados'		, '/com/apivsa/sigaad/application/ventas/FrmSe'	, '109FRM',  5,	false	,'100COM'),
(1406, 2001, 'RG02', 'Adquiriente'				, '/com/apivsa/sigaad/application/ventas/Frm'	, '109FRM',  5,	false	,'100COM')

;


/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.usuario_sistema-------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.usuario_sistema;
CREATE TABLE gen.usuario_sistema(
	id_ususistema	int			NOT NULL,
	id_usuario		int			NOT NULL,
	id_negocio		int			NOT NULL,
	id_sistema		char(3)		NOT NULL,	
	activo 			bool		not null,
	CONSTRAINT usuario_sistema_pkey PRIMARY KEY (id_ususistema),
	CONSTRAINT usuario_sistema_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON COLUMN gen.usuario_sistema.id_ususistema IS 'Identificador de usuario y negocio_sistema';
COMMENT ON COLUMN gen.usuario_sistema.id_usuario IS 'Identificador de usuario';
COMMENT ON COLUMN gen.usuario_sistema.id_negocio IS 'Identificador de negocio';
COMMENT ON COLUMN gen.usuario_sistema.id_sistema IS 'Identificador de sistema';
COMMENT ON COLUMN gen.usuario_sistema.activo IS 'Indica si el sistema esta activo para el usuario';
COMMENT ON TABLE  gen.usuario_sistema IS 'Sistemas habilitados por cada usuario';
--
INSERT INTO gen.usuario_sistema (id_ususistema, id_usuario, id_negocio, id_sistema, activo) 
VALUES 
( 1, 1, 101, 'GEN', true),
( 2, 1, 101, 'VTA', true),
( 3, 1, 101, 'LGT', true),
( 4, 1, 101, 'PER', true),
( 5, 1, 101, 'FIN', true),
( 6, 1, 101, 'ACD', true),
( 7, 1, 101, 'SEG', true),
( 8, 1, 102, 'GEN', true),
( 9, 1, 102, 'VTA', true),
(10, 1, 102, 'LGT', true),
(11, 1, 102, 'PER', true),
(12, 1, 102, 'FIN', true),
(13, 1, 102, 'ACD', true),
(14, 1, 102, 'SEG', true),
(15, 1, 103, 'GEN', true),
(16, 1, 103, 'VTA', true),
(17, 1, 103, 'LGT', true),
(18, 1, 103, 'PER', true),
(19, 1, 103, 'FIN', true),
(20, 1, 103, 'ACD', true),
(21, 1, 103, 'SEG', true);
*/


/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.usuario_local---------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.usuario_local;
CREATE TABLE gen.usuario_local(
	id_usulocal		int			NOT NULL,
	id_usuario		int			NOT NULL,
	id_negocio		int			NOT NULL,
	id_local		int			NOT NULL,
	activo 			bool		not null,
	CONSTRAINT usuario_local_pkey PRIMARY KEY (id_usulocal),
	CONSTRAINT usuario_local_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON COLUMN gen.usuario_local.id_usulocal IS 'Identificador de usuario y negocio_local';
COMMENT ON COLUMN gen.usuario_local.id_usuario IS 'Identificador de usuario';
COMMENT ON COLUMN gen.usuario_local.id_negocio IS 'Identificador de negocio';
COMMENT ON COLUMN gen.usuario_local.id_local IS 'Identificador de local';
COMMENT ON COLUMN gen.usuario_local.activo IS 'Indica si el local esta activo para el usuario';
COMMENT ON TABLE  gen.usuario_local IS 'Locales habilitados por cada usuario';
--
INSERT INTO gen.usuario_local (id_usulocal, id_usuario, id_negocio, id_local, activo) 
VALUES 
( 1, 1, 101, 1, true),
( 2, 1, 101, 2, true),
( 3, 1, 101, 3, true),
( 4, 1, 101, 4, true),
( 5, 1, 101, 5, true),
( 8, 1, 102, 1, true),
( 9, 1, 102, 4, true),
(10, 1, 102, 7, true),
(11, 1, 102, 8, true),
(15, 1, 103, 1, true),
(16, 1, 103, 6, true);
*/



--------------------------------------------------------------------------------------------------------------------------------------
--gen.gb_var----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--CREATE TABLE gen.gb_var(
--	id_gb_var	int		NOT NULL,
--	id_empresa	int		NOT NULL,
--	id_mod_sys      char(3)		NOT NULL,
--	nom_var		varchar(50)	NOT NULL,
--	valor		varchar(50)	NOT NULL,
--	tipo_dato	varchar(50)	NOT NULL,
--	descripcion	varchar(100)	NOT NULL,
--	CONSTRAINT gb_var_pkey PRIMARY KEY (id_gb_var),
--	CONSTRAINT gb_var_id_mod_sys_fkey FOREIGN KEY (id_mod_sys) REFERENCES gen.modulo_sys(id_mod_sys) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION 
--);

--COMMENT ON COLUMN gen.gb_var.id_gb_var IS 'Identificador de variable global';
--COMMENT ON COLUMN gen.gb_var.id_empresa IS 'Identificador de empresa';
--COMMENT ON COLUMN gen.gb_var.id_mod_sys IS 'Identificador de módulo del sistema';
--COMMENT ON COLUMN gen.gb_var.nom_var IS 'Nombre de la variable';
--COMMENT ON COLUMN gen.gb_var.valor IS 'Valor de la variable';
--COMMENT ON COLUMN gen.gb_var.tipo_dato IS 'Tipo de dato de variable';
--COMMENT ON COLUMN gen.gb_var.descripcion IS 'Descripción de la variable';
--COMMENT ON TABLE  gen.gb_var IS 'Variable globales del sistema';

--INSERT INTO gen.gb_var (id_gb_var, id_empresa, id_mod_sys, nom_var, valor, tipo_dato, descripcion)
--VALUES  (10001,  -1, 'SEG', 'segMinCar', '5', 'int', 'Tamaño mínimo de caracteres requerido'),
--	(10002,  -1, 'SEG', 'segUrlPDC', 'ldap://192.168.1.5:389/DC=grupovalores,DC=local', 'varchar', 'Ruta del servidor de dominio'),
--	(10003,  -1, 'SEG', 'segNomPDC', '@grupovalores.local', 'varchar', 'Nombre del servidor de dominio'),	
--	(10004,  -1, 'SEG', 'segUrlFotos', '/home/franklin/Imágenes/urlFotos/', 'varchar', 'Ruta predeterminado de fotografías. Cliente, proveedor, etc.'),
--	(10005,  -1, 'SEG', 'segUrlFotoTRA', '/home/franklin/Imágenes/urlFotoTRA/', 'varchar', 'Ruta de fotografías de trabajadores'),
--	(10006,  -1, 'SEG', 'segUrlFotoALU', '/home/franklin/Imágenes/urlFotoALU/', 'varchar', 'Ruta de fotografías de alumnos'),
--	(10007,  -1, 'SEG', 'segUrlFotoUSU', '/home/franklin/Imágenes/urlFotoUSU/', 'varchar', 'Ruta de fotografías de usuarios'),	
--	(10008,  -1, 'SEG', 'segUrlReporte', '/home/franklin/Imágenes/urlReportes/', 'varchar', 'Ruta donde se almacena los reportes'),	
--	(10009,  -1, 'SEG', 'segFindPersona', '1', 'int', '1=ByNoms, 2=ByDNI, 3=ByID'),
--	(10101, 101, 'SEG', 'segDominio', 'sanjuanbosco.edu.pe', 'varchar', 'Nombre del dominio de internet'),
--	(10201, 102, 'SEG', 'segDominio', 'sanfernando.edu.pe' , 'varchar', 'Nombre del dominio de internet'),
--	(10301, 103, 'SEG', 'segDominio', 'lbgeraldine.com.pe' , 'varchar', 'Nombre del dominio de internet'),
--	(10401, 104, 'SEG', 'segDominio', 'comdepsjb.com.pe'   , 'varchar', 'Nombre del dominio de internet'),
--	(10501, 105, 'SEG', 'segDominio', 'sjbgym.com.pe'      , 'varchar', 'Nombre del dominio de internet'),
--	(10601, 106, 'SEG', 'segDominio', 'clisalazar.com.pe'  , 'varchar', 'Nombre del dominio de internet'),
--	(10701, 107, 'SEG', 'segDominio', 'colpesac.com.pe'    , 'varchar', 'Nombre del dominio de internet');
--
--	--(  -5,-1, 'FIN', 'fondoPlazo', '2', 'int', 'Plazo en dias para rendir los retiros de fondo fijo'),
--	--(  -4,-1, 'FIN', 'fondoMin', '200', 'money', 'Monto mínimo para renovar caja chica'),
--	--(  -3,-1, 'FIN', 'fondoMax', '4000', 'money', 'Monto máximo de caja chica'),
--	--(  -2,-1, 'FIN', 'lDatosLabACD', 'true | 1', 'varchar', 'Determinar obligatoriedad de rellenar datos laborales'),
--	--(  -1,-1, 'FIN', 'igv', '0.18', 'money', 'Impuesto general a las ventas');
--
--
--
--------------------------------------------------------------------------------------------------------------------------------------
--gen.usuario_det-----------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--CREATE TABLE gen.usuario_det(
--	id_usuario	int		NOT NULL,
--	id_empresa	int		NOT NULL,
--	estado		char(1) 	NOT NULL,
--	fe_oper		date		NOT NULL,
--	CONSTRAINT usuario_det_pkey PRIMARY KEY (id_usuario, id_empresa),
--	CONSTRAINT usuario_det_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
--	CONSTRAINT usuario_det_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES gen.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
--);

--COMMENT ON COLUMN gen.usuario_det.id_usuario IS 'Identificador de usuario';
--COMMENT ON COLUMN gen.usuario_det.id_empresa IS 'Identificador de empresa';
--COMMENT ON COLUMN gen.usuario_det.estado IS 'Estado del usuario en el sistema: Activo(A), Baja(B)';
--COMMENT ON COLUMN gen.usuario_det.fe_oper IS 'Fecha de operación para la empresa';
--COMMENT ON TABLE  gen.usuario_det IS 'Empresas donde el usuario tiene permiso de acceso';

--INSERT INTO gen.usuario_det (id_usuario, id_empresa, estado, fe_oper)
--VALUES	( 1, 101, 'A', '15/09/2014'),
--	( 1, 102, 'A', '15/09/2014'),
--	( 1, 103, 'A', '15/09/2014'),
--	( 1, 104, 'A', '15/09/2014'),
--	( 1, 105, 'A', '15/09/2014'),
--	( 1, 106, 'A', '15/09/2014'),
--	( 1, 107, 'A', '15/09/2014'),
--	( 2, 101, 'A', '15/09/2014'),
--	( 2, 102, 'A', '15/09/2014'),
--	( 2, 103, 'A', '15/09/2014'),
--	( 2, 104, 'A', '15/09/2014'),
--	( 2, 105, 'A', '15/09/2014'),
--	( 3, 102, 'A', '15/09/2014'),
--	( 3, 104, 'A', '15/09/2014'),
--	( 3, 107, 'A', '15/09/2014');
--
--
--------------------------------------------------------------------------------------------------------------------------------------
--gen.usuario_local---------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--CREATE TABLE gen.usuario_local(
--	id_usuario	int		NOT NULL,
--	id_empresa	int		NOT NULL,
--	id_local	int 		NOT NULL,
--	def		boolean		NOT NULL,
--	activo 		boolean		NOT NULL,
--	CONSTRAINT usuario_local_pkey PRIMARY KEY (id_usuario, id_empresa, id_local),
--	CONSTRAINT usuario_local_fkey FOREIGN KEY (id_usuario, id_empresa) REFERENCES gen.usuario_det(id_usuario, id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
--);

--COMMENT ON COLUMN gen.usuario_local.id_usuario IS 'Identificador de usuario';
--COMMENT ON COLUMN gen.usuario_local.id_empresa IS 'Identificador de empresa';
--COMMENT ON COLUMN gen.usuario_local.id_local IS 'Identificador de local';
--COMMENT ON COLUMN gen.usuario_local.def IS 'Local predeterminado del usuario, para cuestiones de selección inicial';
--COMMENT ON COLUMN gen.usuario_local.activo IS 'Indica si el usuario esta activo en el local';
--COMMENT ON TABLE  gen.usuario_local IS 'Locales asociados a un usuario en una empresa';

--INSERT INTO gen.usuario_local (id_usuario, id_empresa, id_local, def, activo)
--VALUES 	( 1, 101, 1, true,  true),
--	( 1, 101, 2, false, true),
--	( 1, 101, 3, false, true),
--	( 1, 101, 4, false, true),
--	( 1, 101, 5, false, true),
--	( 1, 102, 3, false, true),
--	( 1, 102, 4, false, true),
--	( 1, 102,10, true,  true),
--	( 1, 103, 4, true,  true),
--	( 1, 104, 4, false, true),
--	( 1, 104, 6, true,  true),
--	( 1, 105, 7, true,  true),
--	( 1, 106, 8, true,  true),
--	( 1, 107, 9, true,  true),
--	( 2, 101, 1, true,  true),
--	( 2, 101, 2, false, true),
--	( 2, 101, 3, false, true),
--	( 2, 102, 3, false, true),
--	( 2, 103, 4, false, true),
--	( 2, 104, 4, false, true),
--	( 2, 105, 7, false, true),	
--	( 3, 102, 3, false, true),
--	( 3, 102, 4, false, true),
--	( 3, 102,10, true,  true),	
--	( 3, 104, 4, false, true),
--	( 3, 104, 6, false, true),	
--	( 3, 107, 9, false, true);
--
--
--------------------------------------------------------------------------------------------------------------------------------------
--gen.opcion_sys------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--CREATE TABLE gen.opcion_sys(
--	id_opc_sys	int		NOT NULL PRIMARY KEY,
--	id_opc_padre	int		NOT NULL,
--	orden		int		NOT NULL,
--	id_mod_sys	char(3)		NOT NULL,
--	nom_opc_sys	varchar(100)	NOT NULL,	
--	id_empresa	int		NOT NULL,
--	ebr		boolean		NOT NULL,
--	apu		boolean		NOT NULL,
--	com		boolean		NOT NULL,
--	tip_opc		varchar(100)	NOT NULL,
--	nom_control	varchar(100)	NOT NULL,
--	descripcion	varchar(250)	NOT NULL,
--	CONSTRAINT opcion_sys_id_mod_sys_fkey FOREIGN KEY (id_mod_sys) REFERENCES gen.modulo_sys(id_mod_sys) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
--);

--COMMENT ON COLUMN gen.opcion_sys.id_opc_sys IS 'Identificador de la opción de sistema';
--COMMENT ON COLUMN gen.opcion_sys.id_opc_padre IS 'Identificador de la opción de nivel superior';
--COMMENT ON COLUMN gen.opcion_sys.orden IS 'Orden en que se muestran las opciones dentro de un módulo';
--COMMENT ON COLUMN gen.opcion_sys.id_mod_sys IS 'Identificador de módulo de sistema';
--COMMENT ON COLUMN gen.opcion_sys.nom_opc_sys IS 'Nombre de la opción de sistema';
--COMMENT ON COLUMN gen.opcion_sys.id_empresa IS 'Identificador de empresa';
--COMMENT ON COLUMN gen.opcion_sys.ebr IS 'Si corresponde a educación básica regular';
--COMMENT ON COLUMN gen.opcion_sys.apu IS 'Si corresponde a academia preuniversitaria';
--COMMENT ON COLUMN gen.opcion_sys.com IS 'Si corresponde a empresa comercial';
--COMMENT ON COLUMN gen.opcion_sys.tip_opc IS 'Tipo de opción: Panel, Formulario, Reporte';
--COMMENT ON COLUMN gen.opcion_sys.nom_control IS 'Ruta y nombre del panel, formulario, reporte';
--COMMENT ON COLUMN gen.opcion_sys.descripcion IS 'Comentario sobre la opción';
--COMMENT ON TABLE  gen.opcion_sys IS 'Opciones del sistema agrupados por módulo';

--INSERT INTO gen.opcion_sys (id_opc_sys, id_opc_padre, orden, id_mod_sys, nom_opc_sys, id_empresa, ebr, apu, com, tip_opc, nom_control, descripcion) 
--VALUES  ('10000','-1','1','ACD','MATRÍCULA','-1','true','true','false','','',''),
--('10001','10000','2','ACD','Estudiante','-1','true','true','false','Panel','/com/fbo/yupana/app/mat/AlumnoFx.fxml','Datos generales de estudiante'),
--('10002','10000','3','ACD','Familiar y apoderado','-1','true','true','false','Panel','/com/fbo/siad/app/mat/PnlAluColegio.fxml','Familiares y apoderado del estudiante'),
--('10003','10000','4','ACD','Informes y reservas','-1','true','true','false','Panel','/com/fbo/siad/app/acd/Prueba.fxml','Registro provisional de año, local, nivel y grado'),
--('10004','10000','5','ACD','Matrícula colegio','-1','true','false','false','Panel','/com/fbo/siad/app/acd/Prueba.fxml','Matrículas del estudiante. Documentos a presentar'),
--('10005','10000','6','ACD','Matrícula academia','-1','false','true','false','Panel','','Matrículas del estudiante. Documentos a presentar'),
--('10006','10000','7','ACD','Examen selección','-1','true','true','false','Panel','','Datos básicos del estudiante y matrícula en un solo paso'),
--('10007','10000','8','ACD','Retiros y traslados','-1','true','false','false','Panel','','Gestión de alumnos que se retiran del colegio'),
--('10100','-1','9','ACD','TUTORÍA','-1','true','true','false','','',''),
--('10101','10100','10','ACD','Asistencia','-1','true','true','false','Panel','','Asistencia. Asignar tutor por aula y área'),
--('10102','10100','11','ACD','Conducta','-1','true','false','false','Panel','','Méritos y deméritos. Asignar tutor por aula'),
--('10103','10100','12','ACD','Apreciación bimestral','-1','true','false','false','Panel','','Observación mensual o bimestral del tutor. Asignar tutor por aula'),
--('10104','10100','13','ACD','Cambiar aula y carrera profesional','-1','true','true','false','Panel','','Cambiar grupo evaluación, área, y carrera profesional'),
--('10200','-1','14','ACD','EVALUACIÓN','-1','true','true','false','','',''),
--('10201','10200','15','ACD','Registro auxiliar','-1','true','false','false','Panel','','Genera registro auxiliar de notas y carga notas x docente'),
--('10202','10200','16','ACD','Actualizar notas','-1','true','false','false','Panel','','Modifica notas si opción está habilitada x docente'),
--('10203','10200','17','ACD','Examen manual','-1','true','true','false','Panel','','Genera registro de ETAs - EVAs - Tareas y carga notas. Asignar tutor por aula y área. Si es por puntaje el tota de preguntas y total de puntos, si es vigesimal'),
--('10204','10200','18','ACD','Examen ficha óptica','-1','true','true','false','Panel','','Carga archivo de lectora óptica. Un encargado de evaluacion'),
--('10300','-1','19','ACD','PROCESAMIENTO','-1','true','false','false','','',''),
--('10301','10300','20','ACD','Registro auxiliar','-1','true','false','false','Panel','','Genera registro auxiliar de notas y carga notas x nivel/local'),
--('10302','10300','21','ACD','Actualizar notas','-1','true','false','false','Panel','','Modifica notas si opción está habilitada x nivel/local'),
--('10303','10300','22','ACD','Procesar notas','-1','true','false','false','Panel','','Procesado bimestral, anual, y cierre x nivel/local'),
--('10304','10300','23','ACD','Actualizar formato siagie','-1','true','false','false','Panel','','Notas finales de alumnos para el siagie'),
--('10305','10300','24','ACD','Generar registros siagie','-1','true','false','false','Panel','','Notas bimestrales por docente y seccion según formato siagie'),
--('10306','10300','25','ACD','Actualizar cursos desaprobados','-1','true','false','false','Panel','','Actualizar notas x nivel/local'),
--('10307','10300','26','ACD','Emitir boletas y certificado de estudio','-1','true','false','false','Panel','',''),
--('10400','-1','27','ACD','CONFIGURACIÓN','-1','true','true','false','','',''),
--('10401','10400','28','ACD','Configurar matrículas','-1','true','true','false','Panel','','Periodos, niveles, grados, salones, aulas, turnos'),
--('10402','10400','29','ACD','Configurar evaluación colegio','-1','true','false','false','Panel','','Bimestres, notas por bimestre, fechas de notas y bimestres, equiv.'),
--('10403','10400','30','ACD','Configurar evaluación academia','-1','true','true','false','Panel','','Grupos eval., áreas, cursos, tipos evaluación, cant. Evals.'),
--('10404','10400','31','ACD','Plan curricular colegio','-1','true','false','false','Panel','','Íreas, cursos, criterios, indicadores por periodo educativo'),
--('10405','10400','32','ACD','Plan curricular academia','-1','true','true','false','Panel','','Íreas, cursos, cantidad de preguntas, ponderaciones, clave de exámenes'),
--('10406','10400','33','ACD','Asignar tutor y docente','-1','true','true','false','Panel','','Docentes a cursos, tutores, directores, procesadores a nivel/grado'),
--('10500','-1','34','ACD','REPORTES','-1','true','true','false','','',''),
--('10501','10500','1','ACD','Lista de reportes','-1','true','true','false','Panel','','Panel con todos los reportes'),
--('10502','10500','2','ACD','Ficha del estudiante','-1','true','true','false','Reporte','','Datos generales, matrícula, adquirente, domicilio, documentación'),
--('10503','10500','3','ACD','Historial del estudiante','-1','true','true','false','Reporte','','Datos completos, matrículas, familiares, pagos, evaluaciones'),
--('10504','10500','4','ACD','------------------------------------------------------','-1','true','true','false','Reporte','',''),
--('10505','10500','5','ACD','Matriculados - Resumen','-1','true','true','false','Reporte','','Cantidad de matriculados, vacantes, reeentrantes, nuevos, inscritos, etc.'),
--('10506','10500','6','ACD','Pendientes de ratificar','-1','true','false','false','Reporte','','Medios de contacto de los alumnos que aún no ratificaron'),
--('10507','10500','7','ACD','Matriculados - Detalle','-1','true','true','false','Reporte','','Nombre de alumnos por año, local, nivel, grado, sección, hnos, religión, genero'),
--('10508','10500','8','ACD','Matriculados - Resumen por género','-1','true','true','false','Reporte','','Estudiantes matriculados clasificado por género'),
--('10509','10500','9','ACD','Matriculados por zona','-1','true','true','false','Reporte','','Estudiantes matriculados clasificados por ubicación geográfica'),
--('10510','10500','10','ACD','Matriculados por inst. educ. de procedencia','-1','true','true','false','Reporte','','Estudiantes matriculados clasificados por la inst. educ. de procedencia'),
--('10511','10500','11','ACD','Matriculados por lugar de nacimiento','-1','true','true','false','Reporte','','Estudiantes matriculados por lugar de nacimiento'),
--('10512','10500','12','ACD','Matriculados por religión que practican','-1','true','false','false','Reporte','','Estudiantes matriculados clasificados por religión'),
--('10513','10500','13','ACD','Matriculados por idioma natal','-1','true','false','false','Reporte','','Estudiantes matriculados clasificados por idioma natal'),
--('10514','10500','14','ACD','Matriculados por cantidad de hermanos','-1','true','false','false','Reporte','','Estudiantes matriculados ordenados por cantidad de hermanos'),
--('10515','10500','15','ACD','Matriculados por áreas y carreras','-1','true','true','false','Reporte','','Clasificados por grupos de evaluación, área y carreras profesionales'),
--('10516','10500','16','ACD','Matriculados sin documentación completa','-1','true','false','false','Reporte','','Estudiantes matriculados sin documentación + medios de contacto'),
--('10517','10500','17','ACD','Matriculados con curso exonerado','-1','true','false','false','Reporte','','Estudiantes matriculados que tienen cursos exonerados'),
--('10518','10500','18','ACD','Matriculados con curso a cargo','-1','true','false','false','Reporte','','Estudiantes matriculados con curso a cargo + medios de contacto'),
--('10519','10500','19','ACD','Padrón de estudiantes y familiares','-1','true','true','false','Reporte','','Estudiantes matrículados con datos de familiares + medios de contacto'),
--('10520','10500','20','ACD','Nómina de matriculas','-1','true','false','false','Reporte','','Acta oficial de matriculados x local y nivel'),
--('10521','10500','21','ACD','------------------------------------------------------','-1','true','true','false','Reporte','',''),
--('10522','10500','22','ACD','Asistencia y conducta por estudiante','-1','true','true','false','Reporte','','Por alumno, incluir observación del tutor'),
--('10523','10500','23','ACD','Asistencia por sección','-1','true','true','false','Reporte','','Filtrar por local y tutor'),
--('10524','10500','24','ACD','------------------------------------------------------','-1','true','true','false','Reporte','',''),
--('10525','10500','25','ACD','Notas pendientes de carga','-1','true','false','false','Reporte','',''),
--('10526','10500','26','ACD','Acta consolidada por bimestre','-1','true','false','false','Reporte','',''),
--('10527','10500','27','ACD','Acta consolidada de recuperación','-1','true','false','false','Reporte','',''),
--('10528','10500','28','ACD','Rendimiento académico bimestral','-1','true','false','false','Reporte','',''),
--('10529','10500','29','ACD','Primeros puestos','-1','true','false','false','Reporte','',''),
--('10530','10500','30','ACD','Acta consolidada anual','-1','true','false','false','Reporte','',''),
--('10531','10500','31','ACD','Reporte de aprobados y desaprobados','-1','true','false','false','Reporte','',''),
--('10532','10500','32','ACD','Reporte de ETAS, EVAS academia','-1','false','true','false','Reporte','',''),
--('10533','10500','33','ACD','------------------------------------------------------','-1','true','true','false','Reporte','',''),
--('10534','10500','34','ACD','Boleta de notas academia','-1','true','true','false','Reporte','',''),
--('10535','10500','35','ACD','Boletas de notas SJB','-1','true','true','false','Reporte','',''),
--('10536','10500','36','ACD','------------------------------------------------------','-1','true','true','false','Reporte','',''),
--('10537','10500','37','ACD','Tendencia de matriculados','-1','true','true','false','Reporte','',''),
--('10538','10500','38','ACD','Matriculados por años','-1','true','true','false','Reporte','',''),
--('10900','-1','1','SEG','USUARIO','-1','true','true','true','','',''),
--('10901','10900','2','SEG','Datos de usuario','-1','true','true','true','Panel','','Cambiar contraseña, cambiar foto'),
--('10902','10900','3','SEG','Administrar usuarios','-1','true','true','true','Panel','','Crear usuario, asignar roles, restablecer contraseña'),
--('11000','-1','4','SEG','REPORTES','-1','true','true','true','','',''),
--('11001','11000','5','SEG','Reportes','-1','true','true','true','Panel','','Reportes módulo de seguridad'),
--('11002','11000','6','SEG','Lista de usuarios activos','-1','true','true','true','Reporte','','Todos los usuarios, activos e inactivos'),
--('11003','11000','7','SEG','Usuario y fechas de acceso al sistema','-1','true','true','true','Reporte','','Detalle de acceso de cada usuario');
--
--
--------------------------------------------------------------------------------------------------------------------------------------
--gen.usuario_perfil--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--CREATE TABLE gen.usuario_opcion_sys(
--	id_usuario	int		NOT NULL,
--	id_empresa	int 		NOT NULL,
--	id_opc_sys	int		NOT NULL,
--	activo		boolean		NOT NULL,
--	CONSTRAINT usuario_opcion_sys_pkey PRIMARY KEY (id_usuario,id_empresa,id_opc_sys),
--	CONSTRAINT usuario_opcion_sys_id_usuario_fkey FOREIGN KEY (id_usuario,id_empresa) REFERENCES gen.usuario_det(id_usuario,id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
--	CONSTRAINT usuario_opcion_sys_id_opc_sys_fkey FOREIGN KEY (id_opc_sys) REFERENCES gen.opcion_sys(id_opc_sys) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
--);

--COMMENT ON COLUMN gen.usuario_opcion_sys.id_usuario IS 'Identificador de usuario';
--COMMENT ON COLUMN gen.usuario_opcion_sys.id_empresa IS 'Identificador de empresa';
--COMMENT ON COLUMN gen.usuario_opcion_sys.id_opc_sys IS 'Identificador de opción del sistema';
--COMMENT ON COLUMN gen.usuario_opcion_sys.activo IS 'Si la opción de sistema se deshabilita al usuario';
--COMMENT ON TABLE  gen.usuario_opcion_sys IS 'Opciones de sistema asociados al usuario';

--INSERT INTO gen.usuario_opcion_sys (id_usuario, id_empresa, id_opc_sys, activo) 
--VALUES  (1, 101, 10000, true),
--	(1, 101, 10001, true),
--	(1, 101, 10002, true),
--	(1, 101, 10003, true),
--	(1, 101, 10004, true),
--	(1, 101, 10005, true),
--	(1, 101, 10006, true),
--	(1, 101, 10007, true),
--	(1, 101, 10100, true),
--	(2, 103, 11003, true);





/***********************************************************************************************************************************************************
 Objetivo	:	Variables del sistema por empresa
 Autor		:	Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695
 			select * from gen.gb_vars__sel_by_emp_sp(101)
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.gb_vars__sel_by_emp_sp(_id_empresa int)
--RETURNS TABLE (id_mod_sys char(3), nom_var varchar(50), valor varchar(50))
--AS $$
--BEGIN 
--
--	RETURN QUERY 
--	SELECT DISTINCT A.id_mod_sys, A.nom_var, A.valor
--	FROM gen.gb_var A
--	WHERE A.id_empresa=_id_empresa OR A.id_empresa=-1;
--	
--END
--$$ LANGUAGE PLPGSQL;


/***********************************************************************************************************************************************************
 Objetivo	:	Usuario de sistema
 Autor		:	Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695
			select * from gen.usuario__sel_by_nom_sp(101,'franco_barzola')
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.usuario__sel_by_nom_sp(_id_empresa int, _nom_usu varchar)
--RETURNS TABLE (id_usuario int, nom_usu varchar, pwd_usu varchar, id_empresa int, estado char, fe_oper date, fe_server date, periodo text, domain_usu boolean)
--AS $$
--BEGIN 
--
--	RETURN QUERY
--	SELECT A.id_usuario, A.nom_usu, A.pwd_usu, B.id_empresa, B.estado, B.fe_oper, current_date AS fe_server, 
--	       DATE_PART('year',B.fe_oper)  	|| '.' || 
--	       CASE WHEN DATE_PART('month',B.fe_oper) in (1,2,3)    THEN 1  
--  		    WHEN DATE_PART('month',B.fe_oper) in (4,5,6)    THEN 2  
--		    WHEN DATE_PART('month',B.fe_oper) in (7,8,9)    THEN 3  
--		    WHEN DATE_PART('month',B.fe_oper) in (10,11,12) THEN 4  
--	       END 				|| '.' ||	RIGHT('00' || DATE_PART('month',B.fe_oper) ,2) AS periodo, A.domain_usu
--	FROM gen.usuario A
--	     INNER JOIN gen.usuario_det B on (A.id_usuario=B.id_usuario)
--	WHERE B.id_empresa=_id_empresa and A.nom_usu ILIKE _nom_usu;
--
--END
--$$ LANGUAGE PLPGSQL;


/***********************************************************************************************************************************************************
 Objetivo	:	Lista de locales de un usuario
 Autor		:	Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695				
  			select * from gen.usuario_local__sel_by_usu_sp(101,1)
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.usuario_local__sel_by_usu_sp(_id_empresa int, _id_usuario int)
--RETURNS TABLE (id_usuario int, id_empresa int, id_local int, nom_local varchar, direccion varchar, id_dist char, full_ugeo text, def boolean, activo boolean)
--AS $$ 
--BEGIN
--
--	RETURN QUERY
--	SELECT B.id_usuario, B.id_empresa, A.id_local, A.nom_local, A.direccion, A.id_dist, C.nom_prov||'/'||D.nom_dpto AS full_ugeo, B.def, B.activo
--	FROM gen.local A
--	     INNER JOIN gen.usuario_local B ON (A.id_local=B.id_local)
--	     INNER JOIN gen.provincia C ON (left(A.id_dist,4)=C.id_prov)
--	     INNER JOIN gen.departamento D ON (C.id_dpto=D.id_dpto)
--	WHERE B.id_empresa=_id_empresa AND B.id_usuario=_id_usuario --AND B.activo=true, mostrar mensaje que esta desactivado
--	ORDER BY def DESC, id_dist, nom_local;	
--	
--END 
--$$ LANGUAGE PLPGSQL;


/***********************************************************************************************************************************************************
 Objetivo	:	Lista de módulos o subsistemas
 Autor		:	Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695				
  			select * from gen.modulo_sys__sel_by_emp_sp(101)
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.modulo_sys__sel_by_emp_sp(_id_empresa int)
--RETURNS SETOF gen.modulo_sys
--AS $$ 
--BEGIN
--
--	RETURN QUERY
--	SELECT A.id_mod_sys, nom_modulo, descripcion, nom_ico, orden
--	FROM gen.modulo_sys A
--	     INNER JOIN gen.modulo_sys_empresa B ON (A.id_mod_sys=B.id_mod_sys)
--	WHERE B.id_empresa=_id_empresa
--	ORDER BY orden;	
--	
--END 
--$$ LANGUAGE PLPGSQL;


/***********************************************************************************************************************************************************
 Objetivo	:	Lista de opciones del sistema por empresa, usuario, módulo
 Autor		:	Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695 
			select * from gen.opcion_sys__sel_by_usu_sp(101, 1, 'SEG', false)
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.opcion_sys__sel_by_usu_sp (_id_empresa int, _id_usuario int, _id_mod_sys char, _onlyRep boolean)
--RETURNS TABLE (id_opc_sys INT, id_opc_padre INT, orden INT, id_mod_sys CHAR, nom_opc_sys VARCHAR, id_empresa INT, ebr BOOLEAN, apu BOOLEAN, com BOOLEAN, tip_opc VARCHAR, nom_control VARCHAR, descripcion VARCHAR, id_usuario INT, activo BOOLEAN)
--AS $$ 
--BEGIN
--	
--	RETURN QUERY
--	SELECT B.id_opc_sys, B.id_opc_padre, B.orden, B.id_mod_sys, B.nom_opc_sys, _id_empresa AS id_empresa, B.ebr, B.apu, B.com, B.tip_opc, B.nom_control, B.descripcion, A.id_usuario, A.activo
--	FROM gen.usuario_opcion_sys A
--	     INNER JOIN gen.opcion_sys B on (A.id_opc_sys=B.id_opc_sys)
--	WHERE (A.id_empresa=_id_empresa OR A.id_empresa=-1) 
--	      and A.id_usuario=_id_usuario 
--	      and B.id_mod_sys=_id_mod_sys 
--	      and ( B.tip_opc = (CASE WHEN _onlyRep THEN 'Reporte' ELSE '' END)
--	            OR
--	            B.tip_opc = (CASE WHEN _onlyRep THEN 'Reporte' ELSE 'Panel' END)
--	            OR
--	            B.tip_opc = (CASE WHEN _onlyRep THEN 'Reporte' ELSE 'Formulario' END)
--	          );
--
--END
--$$ LANGUAGE PLPGSQL;



/*
select * from gen.persona
select * from gen.gb_var

101;"COLEGIO PARTICULAR SAN JUAN BOSCO S.A.C.";"20133746278";"Jr. Cuzco N° 779 - Huancayo";"64-212121  / 65-252525";"C.P. SAN JUAN BOSCO";t;"EBR"
102;"ACADEMIA PRE UNIVERSITARIA SAN FERNANDO S.A.C.";"20280769674";"Jr. Cuzco N° 779 - Huancayo";"64-212121 Â / 65-252525";"A.P. SAN FERNANDO";t;"APU"
103;"LIBRERÍA BAZAR GERALDINE";"20161572366";"Calle Cuzco N° 799 - Huancayo";"064-232521";"BAZAR GERALDINE";t;"COM"
104;"COMPLEJO DEPORTIVO SJB";"10612902577";"Calle Puno N° 357 - Huancayo";"064-232521";"COMPLEJO DEPORTIVO SJB";t;"COM"
105;"SJB GYM";"10401108055";"Calle Puno N° 357 - Huancayo";"064-232521";"SJB GYM";t;"COM"
106;"CLÍNICA SALAZAR";"10210741677";"Calle Leandra Torres N° 555 - Huancayo";"064-232521";"CLÍNICA SALAZAR";t;"COM"
107;"COMBUSTIBLES LIMPIOS DEL PERÚ S.A.C.";"10210756305";"Calle Real N° 759 - El Tambo";"064-232521";"GRIFO COLPESAC";t;"COM"
*/




/*
select * from gen.gb_var


select * from gen.modulo_sys_empresa
select * from gen.empresa
select * from gen.empresa_local where id_empresa=101
select * from gen.usuario_local where id_empresa=101
select * from gen.gb_var

select * from gen.empresa
SELECT * FROM gen.MODULO_SYS
SELECT * FROM gen.MODULO_SYS_EMPRESA
SELECT * FROM gen.gb_var
select * from gen.persona__sel_by_find_sp(1,'');
select * from gen.persona__sel_by_find_sp(3,'1')
*/



/*
Cuando se tiene el dinero se tendra en bolsas/fondos
Banco - Cuentas en banco - El dinero estará dividido en: Disponible, Provision pagos al personal, Retenciones, Prestamo, etc.
Fondo Fijo - Dinero en las distintas cajas - Dinero que llega del banco
Caja Finanzas- Dinero en las distintas cajas generales - Dinero que llega de prestamos, por ingresos de tesoreria, por reingresos o recuperaciones
Caja Tesorería - Dinero que tienen las chicas de caja - Dinero que llega por ventas
*/


--select * from gen.opcion_sys
--select * from gen.usuario_det

-- PERIODOS EDUCATIVOS
-- Tenemos tres niveles: Inicial, Primaria, Secundaria
-- Por cada nivel tenemos grados
-- Tenemos turnos por cada local y nivel
-- Tenemos tipos de matrícula: Ordinaria, Extraordinaria (La fecha es lo que diferencia)
-- Tenemos tipos de inscripción: Regular, Vacaciones útiles, Exámenes, Talleres
-- Al definir un periodo educativo consideramos
-- 	idEmpresa, anio,  idLocal, idTipInsc, idNivel, idGrado, idTurno, idPlanCurr, actInsc, actEval, dFeIni, dFeFin, item
-- Tambien podría indicarse si un aula es de ciencias o letras, o que es indistinto
-- El alumno en su matrícula tendría que indicar si se matricula a ciencias o letras, el área si lo conoce, y la carrera profesional, si no supiera la carrera prof, al menos debe conocer el area y grupo

-- DEFINIR LAS AULAS
-- Por cada grado definido como periodo educativo, se indica la cantidad de secciones, sus vacantes, 
-- idAula, idEmpresa, idPerEdu, sección, vacantes_ugel, vacantes disponibles, cuantos faltan matricularse del periodo anterior que no se llevaron sus papeles

-- DE IGUAL FORMA SE DEFINIRÍA LAS PENSIONES, 

--PARA TRASLADOS
-- idInscripcion, idEstado --> para cada inscripcion se crearía una tablita que registre la fecha de matrícula(in), fecha de traslado(out), fecha de reincorporación(in), abandono(out-ademas de ingresar detalles de llamaas realizadas y/o visitas) 

-- select * from gen.persona
-- select * from gen.local
-- select * from gen.usuario
-- select * from gen.usuario_det	
-- select * from gen.local
-- select * from gen.empresa order by 1
-- select * from gen.empresa_locAL WHERE ID_EMPRESA=102
-- -- en el sistema se debe tener as variables globales: GRUPO_EMPRESARIAL, EMPRESA, EMPRESA_LOCAL, USUARIO, USUARIO_LOCAL 
-- select * from gen.empresa
-- select * from gen.persona
-- select * from gen.usuario
-- select * from gen.usuario_det
-- COMMENT ON COLUMN gen.usuario_det.id_local IS 'Identificador de local. El usuario puede tener el control de varios locales';
-- 
-- 
-- select * from gen.usuario
-- select * from gen.usuario_det	
-- 



-- ============================================================================
-- TABLA: gen.usuario
-- ============================================================================
DROP TABLE IF EXISTS gen.usuario CASCADE;
CREATE TABLE gen.usuario (
    id_usuario          BIGINT          NOT NULL PRIMARY KEY,
    nom_usu             VARCHAR(50)     NOT NULL UNIQUE,
    pwd_usu             VARCHAR(250)    NOT NULL,
    activo              BOOLEAN         NOT NULL,
    bloqueado           BOOLEAN         NOT NULL DEFAULT false,
    cambio_pwd          BOOLEAN         NOT NULL DEFAULT false,
    cambio_fh           TIMESTAMP       NULL,
    us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
    CONSTRAINT usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.usuario IS 'Usuarios del sistema con control de acceso y seguridad.';
COMMENT ON COLUMN gen.usuario.id_usuario IS 'Identificador de usuario [GEN.PERSONA].';
COMMENT ON COLUMN gen.usuario.nom_usu IS 'Nombre de usuario.';
COMMENT ON COLUMN gen.usuario.pwd_usu IS 'Contraseña encriptada.';
COMMENT ON COLUMN gen.usuario.activo IS 'Indica si el usuario está activo y puede acceder.';
COMMENT ON COLUMN gen.usuario.bloqueado IS 'Indica si el usuario está bloqueado por seguridad.';
COMMENT ON COLUMN gen.usuario.cambio_pwd IS 'Si cambió la contraseña asignada inicialmente.';
COMMENT ON COLUMN gen.usuario.cambio_fh IS 'Fecha y hora del último cambio de contraseña.';
COMMENT ON COLUMN gen.usuario.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.usuario.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.usuario.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.usuario (id_usuario, nom_usu, pwd_usu, activo, us_registra, ip_registra) VALUES
( 1, '1001.fbarzola'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
( 9, '1004.fbarzola'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(10, '1005.fbarzola'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(11, '1006.fbarzola'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(12, '1007.fbarzola'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(15, '1004.sarroyo'   ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(16, '1004.msolano'   ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(17, '1004.ysuasnabar',     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(18, '1004.msalazar'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(19, '1004.abeltran'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(20, '1004.jmelendez' ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(21, '1004.lreyes'    ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(22, '1004.fcardozo'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(23, '1004.kserrano'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(24, '1004.fpaz'      ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(25, '1004.cgonzalez' ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(26, '1004.bperez'    ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
(27, '1004.gvergara'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1'),
( 9, '1004.40110805'  ,     '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'admin' , '127.0.0.1');



-- ============================================================================
-- TABLA: gen.usuario_tipo
-- ============================================================================
DROP TABLE IF EXISTS gen.usuario_tipo CASCADE;
CREATE TABLE gen.usuario_tipo (
    id_usu_tipo         BIGSERIAL       NOT NULL PRIMARY KEY,    
    id_usuario          BIGINT          NOT NULL,    
    tipo_usuario        VARCHAR(25)     NOT NULL CHECK (tipo_usuario IN ('TRABAJADOR', 'ESTUDIANTE','FAMILIAR','CLIENTE')),
    activo              BOOLEAN         NOT NULL,
    us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
    UNIQUE (id_usuario, tipo_usuario),
    CONSTRAINT usuario_tipo_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
);
--
COMMENT ON TABLE gen.usuario_tipo IS 'Tipos de usuario asignados a cada usuario.'; 
COMMENT ON COLUMN gen.usuario_tipo.id_usu_tipo IS 'Identificador de entidad.';
COMMENT ON COLUMN gen.usuario_tipo.id_usuario IS 'Identificador de usuario [GEN.USUARIO].';
COMMENT ON COLUMN gen.usuario_tipo.tipo_usuario IS 'Tipos de usuario que ingresarán al sistema.';
COMMENT ON COLUMN gen.usuario_tipo.activo IS 'Indica si el usuario con el tipo indicado está activo.';
COMMENT ON COLUMN gen.usuario_tipo.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.usuario_tipo.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.usuario_tipo.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.usuario_tipo (id_usuario, id_tipo_usuario, activo, us_registra, ip_registra) VALUES
( 9, 'TRABAJADOR', true, 'admin', '127.0.0.1'),	-- fbarzola [trabajador]
(10, 'TRABAJADOR', true, 'admin', '127.0.0.1'),
(11, 'TRABAJADOR', true, 'admin', '127.0.0.1'),
( 9, 'ESTUDIANTE', true, 'admin', '127.0.0.1'),	--40110805 [estudiante, familiar, cliente_clinica_por_ahora]    
( 9, 'FAMILIAR'  , true, 'admin', '127.0.0.1'),   
( 9, 'CLIENTE'   , true, 'admin', '127.0.0.1');



-- ============================================================================
-- TABLA: gen.usuario_sede_sistema
-- ============================================================================
DROP TABLE IF EXISTS gen.usuario_sede_sistema CASCADE;
CREATE TABLE gen.usuario_sede_sistema (
    id_usu_sed_sis      SERIAL          NOT NULL PRIMARY KEY,
    id_empresa          INT             NOT NULL,
    id_usuario          BIGINT          NOT NULL,
    id_sede             INT             NOT NULL,
    activo_sede         BOOLEAN         NOT NULL,
    id_sistema          CHAR(3)         NOT NULL,
    activo_sistema      BOOLEAN         NOT NULL,
    us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
    CONSTRAINT usuario_sede_sistema_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT usuario_sede_sistema_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES gen.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT usuario_sede_sistema_id_sede_fkey FOREIGN KEY (id_sede) REFERENCES gen.sede(id_sede) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT usuario_sede_sistema_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES gen.sistema(id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT usuario_sede_sistema_ukey UNIQUE (id_usuario, id_sede, id_sistema)
);
--
CREATE INDEX ON gen.usuario_sede_sistema(id_empresa);
CREATE INDEX ON gen.usuario_sede_sistema(id_usuario);
CREATE INDEX ON gen.usuario_sede_sistema(id_sede, activo_sede);
CREATE INDEX ON gen.usuario_sede_sistema(id_sistema, activo_sistema);
--
COMMENT ON TABLE gen.usuario_sede_sistema IS 'Sedes y sistemas habilitados por usuario.'; 
COMMENT ON COLUMN gen.usuario_sede_sistema.id_usu_sed_sis IS 'Identificador de entidad.';
COMMENT ON COLUMN gen.usuario_sede_sistema.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.usuario_sede_sistema.id_usuario IS 'Identificador de usuario [GEN.USUARIO].';
COMMENT ON COLUMN gen.usuario_sede_sistema.id_sede IS 'Identificador de sede [GEN.SEDE].';
COMMENT ON COLUMN gen.usuario_sede_sistema.activo_sede IS 'Indica si la sede está activa para el usuario.';
COMMENT ON COLUMN gen.usuario_sede_sistema.id_sistema IS 'Identificador de sistema [GEN.SISTEMA].';
COMMENT ON COLUMN gen.usuario_sede_sistema.activo_sistema IS 'Indica si el sistema está activo para el usuario.';
COMMENT ON COLUMN gen.usuario_sede_sistema.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.usuario_sede_sistema.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.usuario_sede_sistema.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.usuario_sede_sistema (id_empresa, id_usuario, id_sede, activo_sede, id_sistema, activo_sistema, us_registra, ip_registra) 
VALUES
-- YSST-fbarzola
( 1001,  1,  1, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1001,  1,  1, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1001,  1,  1, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1001,  1,  1, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1001,  1,  1, true, 'FIN', true, 'admin', '127.0.0.1'),    
-- SJB-fbarzola
( 1004,  9,  4, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1004,  9,  4, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1004,  9,  4, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1004,  9,  4, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1004,  9,  4, true, 'FIN', true, 'admin', '127.0.0.1'),    
( 1004,  9,  4, true, 'COL', true, 'admin', '127.0.0.1'),    
-- SJB-sarroyo
( 1004, 15,  4, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1004, 15,  4, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1004, 15,  4, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1004, 15,  4, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1004, 15,  4, true, 'FIN', true, 'admin', '127.0.0.1'),    
( 1004, 15,  4, true, 'COL', true, 'admin', '127.0.0.1'),    
-- SANFER-fbarzola
( 1005, 10, 10, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1005, 10, 10, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1005, 10, 10, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1005, 10, 10, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1005, 10, 10, true, 'FIN', true, 'admin', '127.0.0.1'),    
( 1005, 10, 10, true, 'ACA', true, 'admin', '127.0.0.1'),    
-- POLID-fbarzola
( 1006, 11, 14, true, 'ADM', true, 'admin', '127.0.0.1'),    
( 1006, 11, 14, true, 'COM', true, 'admin', '127.0.0.1'),    
( 1006, 11, 14, true, 'LGT', true, 'admin', '127.0.0.1'),    
( 1006, 11, 14, true, 'PER', true, 'admin', '127.0.0.1'),    
( 1006, 11, 14, true, 'FIN', true, 'admin', '127.0.0.1'),    
( 1006, 11, 14, true, 'ACA', true, 'admin', '127.0.0.1');
-- SABAL-fbarzola







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





-- ============================================================================
-- TABLA: gen.acceso
-- ============================================================================
DROP TABLE IF EXISTS gen.acceso CASCADE;
CREATE TABLE gen.acceso (
    id_acceso           BIGSERIAL       NOT NULL PRIMARY KEY,
    id_empresa          INT             NOT NULL,
    id_usuario          BIGINT          NOT NULL,
    id_tipo_usu         INT             NOT NULL,
    fe_login            DATE            NOT NULL,
    fh_login            TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fh_logout           TIMESTAMP       NULL,
    info_cliente        JSONB           NOT NULL DEFAULT '{}'::jsonb,
    CONSTRAINT acceso_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES gen.empresa(id_empresa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT acceso_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT acceso_id_tipo_usu_fkey FOREIGN KEY (id_tipo_usu) REFERENCES gen.tipo(id_tipo) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
CREATE INDEX idx_acceso_empresa ON gen.acceso(id_empresa);
CREATE INDEX idx_acceso_usuario ON gen.acceso(id_usuario);
CREATE INDEX idx_acceso_fecha ON gen.acceso(fe_login);
CREATE INDEX idx_acceso_login ON gen.acceso(fh_login);
CREATE INDEX idx_acceso_empresa_fecha ON gen.acceso(id_empresa, fe_login);
CREATE INDEX idx_acceso_usuario_fecha ON gen.acceso(id_usuario, fe_login);
--
COMMENT ON TABLE gen.acceso IS 'Registro de accesos al sistema para auditoría.';
COMMENT ON COLUMN gen.acceso.id_acceso IS 'Identificador de acceso.';
COMMENT ON COLUMN gen.acceso.id_empresa IS 'Identificador de la empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.acceso.id_usuario IS 'Identificador del usuario [GEN.USUARIO].';
COMMENT ON COLUMN gen.acceso.id_tipo_usu IS 'Identificador del tipo de usuario [GEN.TIPO].';
COMMENT ON COLUMN gen.acceso.fe_login IS 'Fecha de acceso.';
COMMENT ON COLUMN gen.acceso.fh_login IS 'Fecha y hora del login.';
COMMENT ON COLUMN gen.acceso.fh_logout IS 'Fecha y hora del logout.';
COMMENT ON COLUMN gen.acceso.info_cliente IS 'Información del cliente en formato JSON: IP, user agent, navegador, OS, resolución, etc.';12, 95060, true, 'admin', '127.0.0.1'),    
(12, 95064, true, 'admin', '127.0.0.1'),    
(12, 95065, true, 'admin', '127.0.0.1');





-- EN LA MATRICULA/SUSCRIPCION IRIA LOS CURSOS EXONERADOS, EL CONTACTO DE EMERGENCAI, E APODERADO ACADEMICO, EL APODERADO ECONOMICO
-- EN LA MATRICULA/SUSCRIPCION IRIA LOS CURSOS EXONERADOS, EL CONTACTO DE EMERGENCAI, E APODERADO ACADEMICO, EL APODERADO ECONOMICO
-- EN LA MATRICULA/SUSCRIPCION IRIA LOS CURSOS EXONERADOS, EL CONTACTO DE EMERGENCAI, E APODERADO ACADEMICO, EL APODERADO ECONOMICO
-- EN LA MATRICULA/SUSCRIPCION IRIA LOS CURSOS EXONERADOS, EL CONTACTO DE EMERGENCAI, E APODERADO ACADEMICO, EL APODERADO ECONOMICO
-- EN LA MATRICULA/SUSCRIPCION IRIA LOS CURSOS EXONERADOS, EL CONTACTO DE EMERGENCAI, E APODERADO ACADEMICO, EL APODERADO ECONOMICO
--COMMENT ON COLUMN gen.estudiante_cole.contacto_full IS 'Información completa de contacto de emergencia (nombres, celular, parentesco).';

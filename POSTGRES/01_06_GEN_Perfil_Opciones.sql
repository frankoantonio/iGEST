-- ============================================================================
-- TABLA: gen.usuario
-- ============================================================================
DROP TABLE IF EXISTS gen.usuario CASCADE;
CREATE TABLE gen.usuario (
    nom_usu             VARCHAR(50)     NOT NULL PRIMARY KEY,
	id_empresa			INT          	NOT NULL,
    id_persona          BIGINT          NOT NULL,    
    pwd_usu             VARCHAR(250)    NOT NULL,
    activo              BOOLEAN         NOT NULL,
    bloqueado           BOOLEAN         NOT NULL DEFAULT false,
    cambio_pwd          BOOLEAN         NOT NULL DEFAULT false,
    cambio_fh           TIMESTAMP       NULL,
    us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
    CONSTRAINT usuario_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES gen.persona(id_persona) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.usuario IS 'Usuarios del sistema.';
COMMENT ON COLUMN gen.usuario.nom_usu IS 'Nombre de usuario.';
COMMENT ON COLUMN gen.usuario.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.usuario.id_persona IS 'Identificador de persona/usuario [GEN.PERSONA].';
COMMENT ON COLUMN gen.usuario.pwd_usu IS 'Contraseña encriptada.';
COMMENT ON COLUMN gen.usuario.activo IS 'Indica si el usuario está activo y puede acceder.';
COMMENT ON COLUMN gen.usuario.bloqueado IS 'Indica si el usuario está bloqueado temporalmente.';
COMMENT ON COLUMN gen.usuario.cambio_pwd IS 'Si cambió la contraseña asignada inicialmente.';
COMMENT ON COLUMN gen.usuario.cambio_fh IS 'Fecha y hora del último cambio de contraseña.';
COMMENT ON COLUMN gen.usuario.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.usuario.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.usuario.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.usuario (nom_usu, id_empresa, id_persona, pwd_usu, activo, us_registra, ip_registra) VALUES
('1004.40110805'  , 1004 , 10 , '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'dba' , 'localhost'),
('1004.ssalazar'  , 1004 ,  9 , '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'dba' , 'localhost'),
('1004.fbarzola'  , 1004 , 10 , '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'dba' , 'localhost'),
('1004.ysinche'   , 1004 , 11 , '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'dba' , 'localhost'),
('1004.sarroyo'   , 1004 , 12 , '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'dba' , 'localhost'),
('1004.msolano'   , 1004 , 13 , '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'dba' , 'localhost'),
('1005.fbarzola'  , 1005 , 15 , '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'dba' , 'localhost'),
('1005.40110805'  , 1005 , 15 , '$2a$12$dODuS6SCsnv1pOmulWf0s.I1hqvoVcz1sl1izkthWZxtSpn5iUI2W', true, 'dba' , 'localhost');



-- ============================================================================
-- TABLA: gen.usuario_app
-- ============================================================================
DROP TABLE IF EXISTS gen.usuario_app CASCADE;
CREATE TABLE gen.usuario_app (
    id_usu_app        	BIGSERIAL       NOT NULL PRIMARY KEY,    
	nom_usu             VARCHAR(50)     NOT NULL,
	id_persona			BIGINT       	NOT NULL,
    id_und_negocio      INT          	NOT NULL,    
    id_tipo_negocio     INT          	NOT NULL,   
    grupo_usuario       VARCHAR(25)     NOT NULL CHECK (grupo_usuario IN ('TRABAJADOR', 'ESTUDIANTE','FAMILIAR','CLIENTE')),
    activo              BOOLEAN         NOT NULL,
    aplicativo          VARCHAR(25)     NOT NULL CHECK (aplicativo IN ('iGest', 'iLearn','iHealth')),
    us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
    UNIQUE (nom_usu, id_und_negocio, grupo_usuario),
    CONSTRAINT usuario_app_nom_usu_fkey FOREIGN KEY (nom_usu) REFERENCES gen.usuario(nom_usu) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.usuario_app IS 'Aplicativos asignados a los usuario.'; 
COMMENT ON COLUMN gen.usuario_app.id_usu_app IS 'Identificador de entidad.';
COMMENT ON COLUMN gen.usuario_app.nom_usu IS 'Nombre de usuario [GEN.USUARIO].';
COMMENT ON COLUMN gen.usuario_app.id_persona IS 'Identificador de persona [GEN.PERSONA].';
COMMENT ON COLUMN gen.usuario_app.id_und_negocio IS 'Identificador de unidad de negocio [GEN.UND_NEGOCIO].';
COMMENT ON COLUMN gen.usuario_app.id_tipo_negocio IS 'Identificador del tipo de negocio [GEN.TIPO/TI_NEGOCIO].';
COMMENT ON COLUMN gen.usuario_app.grupo_usuario IS 'Grupo de usuarios del sistema (TRABAJADOR, ESTUDIANTE, FAMILIAR, CLIENTE).';
COMMENT ON COLUMN gen.usuario_app.activo IS 'Indica si el usuario está activo.';
COMMENT ON COLUMN gen.usuario_app.aplicativo IS 'Aplicación donde estará habilitado.';
COMMENT ON COLUMN gen.usuario_app.us_registra IS 'Usuario que registra.';
COMMENT ON COLUMN gen.usuario_app.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.usuario_app.ip_registra IS 'Dirección IP o nombre del dispositivo de registro.';
--
INSERT INTO gen.usuario_app (nom_usu, id_persona, id_und_negocio, id_tipo_negocio, grupo_usuario, activo, aplicativo, us_registra, ip_registra) VALUES
('1004.ssalazar'  ,  9  , 4 , 10001,  'TRABAJADOR' , true, 'iGest'  , 'dba', 'localhost'),
('1004.fbarzola'  , 10  , 4 , 10001,  'TRABAJADOR' , true, 'iGest'  , 'dba', 'localhost'),
('1004.ysinche'   , 11  , 4 , 10001,  'TRABAJADOR' , true, 'iGest'  , 'dba', 'localhost'),
('1004.sarroyo'   , 12  , 4 , 10001,  'TRABAJADOR' , true, 'iGest'  , 'dba', 'localhost'),
('1004.msolano'   , 13  , 4 , 10001,  'TRABAJADOR' , true, 'iGest'  , 'dba', 'localhost'),
('1004.40110805'  , 10  , 4 , 10001,  'ESTUDIANTE' , true, 'iLearn' , 'dba', 'localhost'),
('1004.40110805'  , 10  , 4 , 10001,  'FAMILIAR'   , true, 'iLearn' , 'dba', 'localhost'),    
('1004.fbarzola'  , 10  , 5 , 10002,  'TRABAJADOR' , true, 'iGest'  , 'dba', 'localhost'),
('1004.40110805'  , 10  , 5 , 10002,  'ESTUDIANTE' , true, 'iLearn' , 'dba', 'localhost'),
('1004.40110805'  , 10  , 5 , 10002,  'FAMILIAR'   , true, 'iLearn' , 'dba', 'localhost'),
('1004.fbarzola'  , 10  , 6 , 10000,  'TRABAJADOR' , true, 'iGest'  , 'dba', 'localhost'),
('1005.fbarzola'  , 15  , 7 , 10003,  'TRABAJADOR' , true, 'iGest'  , 'dba', 'localhost'),
('1005.40110805'  , 15  , 7 , 10003,  'CLIENTE'    , true, 'iHealth', 'dba', 'localhost');



-- ============================================================================ 
-- TABLA: gen.acceso
-- ============================================================================ 
DROP TABLE IF EXISTS gen.acceso CASCADE;
CREATE TABLE gen.acceso (
    id_acceso           BIGSERIAL       NOT NULL,
    anio                INT             NOT NULL,
    id_empresa          INT             NOT NULL,
    nom_usu             VARCHAR(50)     NOT NULL,
    id_persona          BIGINT          NULL,
    fe_login            DATE            NOT NULL,
    fh_login            TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fh_logout           TIMESTAMP       NULL,
    duracion_minutos    INT             NULL,
    exito_login         BOOLEAN         NOT NULL,
    motivo_fallo        VARCHAR(100)    NOT NULL,
    activo              BOOLEAN         NOT NULL,    
    ip_cliente          VARCHAR(50)     NOT NULL,
    dispositivo         VARCHAR(100)    NOT NULL,
    sis_operativo		VARCHAR(50)     NOT NULL,
    navegador           VARCHAR(100)    NOT NULL,    
    CONSTRAINT acceso_nom_usu_fkey FOREIGN KEY (nom_usu) REFERENCES gen.usuario(nom_usu) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    PRIMARY KEY (id_acceso, anio)
) PARTITION BY LIST (anio);
--
SELECT fn_crear_particiones('gen', 'acceso', 2025, 2030);
--
COMMENT ON TABLE gen.acceso IS 'Registro de accesos al sistema.';
COMMENT ON COLUMN gen.acceso.id_acceso IS 'Identificador de entidad.';
COMMENT ON COLUMN gen.acceso.anio IS 'Año del acceso para particionamiento.';
COMMENT ON COLUMN gen.acceso.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.acceso.nom_usu IS 'Nombre de usuario [GEN.USUARIO].';
COMMENT ON COLUMN gen.acceso.id_persona IS 'Identificador de persona [GEN.PERSONA].';
COMMENT ON COLUMN gen.acceso.fe_login IS 'Fecha de inicio de sesión.';
COMMENT ON COLUMN gen.acceso.fh_login IS 'Fecha y hora de inicio de sesión.';
COMMENT ON COLUMN gen.acceso.fh_logout IS 'Fecha y hora de cierre de sesión.';
COMMENT ON COLUMN gen.acceso.duracion_minutos IS 'Duración total de la sesión en minutos.';
COMMENT ON COLUMN gen.acceso.exito_login IS 'Indica si el login fue exitoso.';
COMMENT ON COLUMN gen.acceso.motivo_fallo IS 'Motivo del fallo en login, si aplica.';
COMMENT ON COLUMN gen.acceso.activo IS 'Indica si la sesión está actualmente activa.';
COMMENT ON COLUMN gen.acceso.ip_cliente IS 'Dirección IP del cliente.';
COMMENT ON COLUMN gen.acceso.dispositivo IS 'Tipo de dispositivo usado.';
COMMENT ON COLUMN gen.acceso.sis_operativo IS 'Sistema operativo del cliente.';
COMMENT ON COLUMN gen.acceso.navegador IS 'Navegador utilizado.';



-- ============================================================================
-- TABLA: gen.rol
-- ============================================================================
DROP TABLE IF EXISTS gen.rol CASCADE;
CREATE TABLE gen.rol (
    id_rol              INT             NOT NULL PRIMARY KEY,
    id_sistema          CHAR(3)         NOT NULL,
    nom_rol             VARCHAR(50)     NOT NULL,
    activo              BOOLEAN         NOT NULL,
    id_tipo_empresa     INT             NOT NULL,
    ruta                VARCHAR(250)    NOT NULL,
    descripcion         VARCHAR(100)    NOT NULL,
    id_empresa          INT             NOT NULL,
    CONSTRAINT rol_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES gen.sistema(id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
CREATE INDEX ON gen.rol (id_sistema);
CREATE INDEX ON gen.rol (id_tipo_empresa);
CREATE INDEX ON gen.rol (id_empresa);
CREATE INDEX ON gen.rol (activo);
--
COMMENT ON TABLE gen.rol IS 'Rol o perfil de sistema.';
COMMENT ON COLUMN gen.rol.id_rol IS 'Identificador del rol.';
COMMENT ON COLUMN gen.rol.id_sistema IS 'Identificador del sistema [GEN.SISTEMA].';
COMMENT ON COLUMN gen.rol.nom_rol IS 'Nombre del rol o perfil.';
COMMENT ON COLUMN gen.rol.activo IS 'Indica si el perfil está habilitado para utilizarse.';
COMMENT ON COLUMN gen.rol.id_tipo_empresa IS 'Tipo de empresa u organización [GEN.TIPO_EMPRESA].';
COMMENT ON COLUMN gen.rol.ruta IS 'Ruta o patrón de acceso que aplica al rol.';
COMMENT ON COLUMN gen.rol.descripcion IS 'Descripción del rol.';
COMMENT ON COLUMN gen.rol.id_empresa IS 'Identificador de empresa, -1 si aplica a todas [GEN.EMPRESA].';
--
INSERT INTO gen.rol (id_rol, id_sistema, nom_rol, activo, id_tipo_empresa, ruta, descripcion, id_empresa) 
VALUES  

(100, 'GEN', 'ROL USUARIO'									,	true ,	10000,	'/principal/perfilUsuario/**'	,  'Usuarios, contraseña, baja/suspension, roles, historial, accesos, auditoria'	,  -1 ),
(101, 'GEN', 'ROL ADMININISTRADOR DE SISTEMA'				,	true ,	10000,	'/principal/perfilAdmin/**'		,  'Autenticar, mi perfil, mi contraseña, busqueda personas'						,  -1 ),
(102, 'GEN', 'ROL ROOT'										,	true ,	10000,	'/principal/perfilRoot/**'		,  'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'		,  -1 ),
	
(150, 'COM', 'ROL INFORMES'									,	true ,	10000,	''								,  'Atención al cliente. Pre Ventas. Post Ventas. Cronogramas. Admisión'			,  -1 ),
(151, 'COM', 'ROL ASISTENTE DE VENTAS'						,	true ,	10000,	''								,  'Atención al cliente. Pre Ventas. Post Ventas. Cronogramas.'						,  -1 ),
(152, 'COM', 'ROL ASISTENTE DE FACTURACIÓN'					,	true ,	10000,	''								,  'Facturas. Notas de crédito. Boletaje. Anulaciones. Envío comprobantes.'			,  -1 ),
(153, 'COM', 'ROL ASISTENTE DE CAJA'						,	true ,	10000,	''								,  'Cobranza. Anulaciones. Apertura/Cierre. Retiros. Pérdidas. Tmb. Facturación'	,  -1 ),
(154, 'COM', 'ROL SUPERVISOR DE VENTAS'						,	true ,	10000,	''								,  'Comisiones. Metas. Seguimiento de ventas. Visto bueno autorizaciones'			,  -1 ),
(155, 'COM', 'ROL SUPERVISOR DE FACTURACIÓN'				,	true ,	10000,	''								,  'Consistencia comprobantes. Pendientes. Prorrogas. Modificar. REGVENTAS'			,  -1 ),
(156, 'COM', 'ROL SUPERVISOR DE COBRANZA'					,	true ,	10000,	''								,  'Consistencia comprobantes. Resumenes entrega de dinero.'						,  -1 ),
(157, 'COM', 'ROL GESTOR COMERCIAL'							,	true ,	10000,	''								,  'Reportes gerenciales. Autorización: Descuentos. Prorrogas'						,  -1 ),
																		
(200, 'LGT', 'ROL REQUIRIENTE'								,	true ,	10000,	''								,  'Si no pueden hacer requerimientos cada personal, hay un responsable'			,  -1 ),
(201, 'LGT', 'ROL ASISTENTE DE COTIZACIONES'				,	true ,	10000,	''								,  'Informes al cliente, cotizaciones, proforma, seguimiento al cliente'			,  -1 ),
(202, 'LGT', 'ROL ASISTENTE DE ALMACÉN'						,	true ,	10000,	''								,  'Apoyo en almacen, Nota pedido, matr, benef, kardex, valorizado, promedio'		,  -1 ),
(203, 'LGT', 'ROL ASISTENTE DE ABASTECIMIENTO'				,	true ,	10000,	''								,  'Contratos, cotizaciones, compras, abastecimento, flete'							,  -1 ),
(204, 'LGT', 'ROL ASISTENTE DE CAJA - COMPRAS'				,	true ,	10000,	''								,  'Cobranza. Anulaciones. Apertura/Cierre. Retiros. Pérdidas'						,  -1 ),
(205, 'LGT', 'ROL SUPERVISOR LOGÍSTICO'						,	true ,	10000,	''								,  'Catalogo. verificar compras. salidas de almacen. REGISTRO COMPRAS'				,  -1 ),
(206, 'LGT', 'ROL GESTOR LOGÍSTICO'							,	true ,	10000,	''								,  'Distribir trimestral los bienes. Plan anual. Programacion trimestral'			,  -1 ),
																		
(250, 'PER', 'ROL ASISTENTE DE ESCALAFÓN'					,	true ,	10000,	''								,  'Informes al cliente, cotizaciones, proforma, seguimiento al cliente'			,  -1 ),
(251, 'PER', 'ROL ASISTENTE DE REMUNERACIONES'				,	true ,	10000,	''								,  'Contratos y remuneracion. Notas de pedido, cronograma, req.  beneficio'			,  -1 ),
(252, 'PER', 'ROL ASISTENTE DE BIENESTAR SOCIAL'			,	true ,	10000,	''								,  'Bienestar social. capacitaciones. alimentos.'									,  -1 ),
(253, 'PER', 'ROL ASISTENTE DE SEGURIDAD SALUD HIGIENE'		,	true ,	10000,	''								,  'RR INDUSTRIALES, SEGURIDAD, SALUD, HIGIENE OCUPACIONAL'							,  -1 ),
(254, 'PER', 'ROL GESTOR LABORAL'							,	true ,	10000,	''								,  'Reportes gerenciales, autorizaciones'											,  -1 ),
																	
(300, 'FIN', 'ROL ASISTENTE DE TESORERÍA'					,	true ,	10000,	''								,  'OTROS INGRESOS. ARQUEO CAJA. RECEPCION DINERO. PRESUPESTO DE INGRESOS'			,  -1 ),
(301, 'FIN', 'ROL ASISTENTE DE PAGADURÍA'					,	true ,	10000,	''								,  'PAGO COMPRAS. PAGO REMUNERACIONES. CUADRE PAGOS. PSP EGRESOS'					,  -1 ),
(302, 'FIN', 'ROL ASISTENTE DE FONDO FIJO'					,	true ,	10000,	''								,  'INGRESOS. RETIROS. COMPRAS. ADELANTOS. MOVILIDAD, VIATICOS. ALIMNETACIÓN'		,  -1 ),
(303, 'FIN', 'ROL ASISTENTE FINANCIERO'						,	true ,	10000,	''								,  'CONTROL PRESUPUESTAL. ADELANTOS. VIATICOS. INVERSIONES. FINANCIEROS.'			,  -1 ),
(304, 'FIN', 'ROL GESTOR FINANCIERO'						,	true ,	10000,	''								,  'AUTORIZACIONES. MODIFICAR. ELIMINAR. CUADRES DIARIOS. MENSUALES. ANUALES'		,  -1 ),
																		
(350, 'CNT', 'ROL ASISTENTE CONTABLE COMERCIAL'				,	true ,	10000,	''								,  'OTROS INGRESOS. ARQUEO CAJA. RECEPCION DINERO. PRESUPESTO DE INGRESOS'			,  -1 ),
(351, 'CNT', 'ROL ASISTENTE CONTABLE LOGÍSTICO'				,	true ,	10000,	''								,  'PAGO COMPRAS. PAGO REMUNERACIONES. CUADRE PAGOS. PSP EGRESOS'					,  -1 ),
(352, 'CNT', 'ROL ASISTENTE CONTABLE PERSONAL'				,	true ,	10000,	''								,  'INGRESOS. RETIROS. COMPRAS. ADELANTOS. MOVILIDAD, VIATICOS. ALIMNETACIÓN'		,  -1 ),
(353, 'CNT', 'ROL ASISTENTE CONTABLE FINANCIERO'			,	true ,	10000,	''								,  'INGRESOS. RETIROS. COMPRAS. ADELANTOS. MOVILIDAD, VIATICOS. ALIMNETACIÓN'		,  -1 ),
(354, 'CNT', 'ROL ASISTENTE PATRIMONIAL'					,	true ,	10000,	''								,  'INGRESOS. RETIROS. COMPRAS. ADELANTOS. MOVILIDAD, VIATICOS. ALIMNETACIÓN'		,  -1 ),
(355, 'CNT', 'ROL GESTOR CONTABLE'							,	true ,	10000,	''								,  'PATRIMONIO. REGVEN. REGCOMPRAS. FORMATOS SUNAT.'								,  -1 ),
	
(400, 'ADM', 'ROL MESA DE PARTES'							,	true ,	10000,	''								,  'OTROS INGRESOS. ARQUEO CAJA. RECEPCION DINERO. PRESUPESTO DE INGRESOS'			,  -1 ),
(401, 'ADM', 'ROL TRAMITES DOCUMENTARIO'					,	true ,	10000,	''								,  'PAGO COMPRAS. PAGO REMUNERACIONES. CUADRE PAGOS. PSP EGRESOS'					,  -1 ),
(402, 'ADM', 'GERENTE GENERAL'								,	true ,	10000,	'/principal/perfilGerGen/**'	,  'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'		,  -1 ),
(403, 'ADM', 'GERENTE ADMINISTRATIVO'						,	true ,	10000,	'/principal/perfilGerAdm/**'	,  'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'		,  -1 ),
(404, 'ADM', 'DIRECTOR GENERAL'								,	true ,	10000,	'/principal/perfilDirGen/**'	,  'Configura empresas, negocios, sistemas, roles, opciones, usuarios en linea'		,  -1 ),

(450, 'COL', 'ROL AUXILIAR'									,	true ,	10001,	''								,  'ASISTENCIA. MERITOS/DEMERITOS. LLAMADAS. COMUNICADOS. OBSERVACION TUTOR'		,  -1 ),
(451, 'COL', 'ROL DOCENTE'									,	true ,	10001,	''								,  'EVALUACIONES. TAREAS. COMUNICADOS'												,  -1 ),
(452, 'COL', 'ROL ASISTENTE ACADÉMICO'						,	true ,	10001,	''								,  'EVALUACIONES Y MATRÍCULAS'														,  -1 ), 
(453, 'COL', 'ROL ENFERMERO'								,	true ,	10001,	''								,  'ATENCIONES PSICOLOGICAS. OBSERVACIONES. RECOMENDACIONES. CITAS'					,  -1 ), 
(454, 'COL', 'ROL PSICOLOGO'								,	true ,	10001,	''								,  'ATENCIÓN MEDICA. OBSERVACIONES. CITAS'											,  -1 ),
(455, 'COL', 'ROL BIBLIOTECARIO'							,	true ,	10001,	''								,  'PRESTAMO DE LIBROS. CATALOGO.'													,  -1 ),
(456, 'COL', 'ROL TAREADOR'									,	true ,	10001,	''								,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(457, 'COL', 'ROL GESTOR ACADÉMICO'							,	true ,	10001,	''								,  'ESTADISTICAS ACADEMICAS. COMUNICADOS'											,  -1 ),
	
(500, 'ACA', 'ROL TUTOR'									,	true ,	10002,	''								,  'ASISTENCIA. ETAS. EVAS. LLAMADAS. COMUNICADOS'									,  -1 ),
(501, 'ACA', 'ROL TAREADOR'									,	true ,	10002,	''								,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(502, 'ACA', 'ROL SUPERVISOR'								,	true ,	10002,	''								,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(503, 'ACA', 'ROL CORDINADOR ACADÉMICO'						,	true ,	10002,	''								,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
	
(550, 'MED', 'ROL PROGRAMACIÓN DE HORARIOS'					,	true ,	10003,	''								,  'ASISTENCIA. ETAS. EVAS. LLAMADAS. COMUNICADOS'									,  -1 ),
(551, 'MED', 'ROL PROFESIONALES'							,	true ,	10003,	''								,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(552, 'MED', 'ROL TIPOS DE PROFESIONALES'					,	true ,	10003,	''								,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(553, 'MED', 'ROL MEDICINA GNERAL'							,	true ,	10003,	''								,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(554, 'MED', 'ROL NUTRICIÓN'								,	true ,	10003,	''								,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(555, 'MED', 'ROL GINECOLOGÍA'								,	true ,	10003,	''								,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(556, 'MED', 'ROL UROLOGÍA'									,	true ,	10003,	''								,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
(557, 'MED', 'ROL TRIAJE'									,	true ,	10003,	''								,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 ),
	
(600, 'BKA', 'ROL ANALISTA'									,	true ,	10004,	''								,  'ASISTENCIA. ETAS. EVAS. LLAMADAS. COMUNICADOS'									,  -1 ),
(601, 'BKA', 'ROL OPERACIONES'								,	true ,	10004,	''								,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(602, 'BKA', 'ROL SUPERVISOR'								,	true ,	10004,	''								,  'HORAS DICTADAS POR DOCENTES. SEGUIMIENTO DOCENTES'								,  -1 ),
(603, 'BKA', 'ROL JEFE DE OPERACIONES'						,	true ,	10004,	''								,  'CARGA HORARIA, PROFESORES POR CICLO. HORAS DICTADAS. AVANCE SILABICO'			,  -1 );



-- ============================================================================
-- TABLA: gen.opcion
-- ============================================================================
DROP TABLE IF EXISTS gen.opcion CASCADE;
CREATE TABLE gen.opcion (
    id_opcion           INT          	NOT NULL PRIMARY KEY,
    id_padre            INT             NOT NULL,
    id_sistema          CHAR(3)         NOT NULL,
    id_rol              INT             NOT NULL,
    nom_opcion          VARCHAR(50)     NOT NULL,
    nom_control         VARCHAR(75)     NOT NULL,
    orden               INT             NOT NULL,
    id_tipo_opcion      INT             NOT NULL,
    id_tipo_negocio     INT             NOT NULL,
    activo              BOOLEAN         NOT NULL,
    core                BOOLEAN         NOT NULL,
    pro                 BOOLEAN         NOT NULL,
    premium             BOOLEAN         NOT NULL,
    id_empresa          INT             NOT NULL,
    CONSTRAINT opcion_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES gen.rol(id_rol) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.opcion IS 'Opciones de cada rol de sistema.';
COMMENT ON COLUMN gen.opcion.id_opcion IS 'Identificador de la opción.';
COMMENT ON COLUMN gen.opcion.id_padre IS 'Identificador de la opción superior, si no tiene, usar -1.';
COMMENT ON COLUMN gen.opcion.id_sistema IS 'Identificador del sistema [GEN.SISTEMA].';
COMMENT ON COLUMN gen.opcion.id_rol IS 'Identificador del rol [GEN.ROL].';
COMMENT ON COLUMN gen.opcion.nom_opcion IS 'Nombre de la opción.';
COMMENT ON COLUMN gen.opcion.nom_control IS 'Ruta o nombre del componente/control asociado a la opción.';
COMMENT ON COLUMN gen.opcion.orden IS 'Orden en que se mostrará la opción en el menú.';
COMMENT ON COLUMN gen.opcion.id_tipo_opcion IS 'Tipo de opción de sistema [GEN.TIPO/TI_OPCION_SIS].';
COMMENT ON COLUMN gen.opcion.id_tipo_negocio IS 'Tipo de empresa a la que aplica la opción [GEN.TIPO/TI_NEGOCIO].';
COMMENT ON COLUMN gen.opcion.activo IS 'Indica si la opción está activa o vigente.';
COMMENT ON COLUMN gen.opcion.core IS 'Indica si la opción está disponible para el plan Core.';
COMMENT ON COLUMN gen.opcion.pro IS 'Indica si la opción está disponible para el plan Pro.';
COMMENT ON COLUMN gen.opcion.premium IS 'Indica si la opción requiere suscripción Premium.';
COMMENT ON COLUMN gen.opcion.id_empresa IS 'Identificador de empresa; -1 si aplica a todas [GEN.EMPRESA].';
--
INSERT INTO gen.opcion (id_opcion, id_padre, id_sistema, id_rol, nom_opcion, nom_control, orden, id_tipo_opcion, id_tipo_negocio, activo, core, pro, premium, id_empresa) 
VALUES 
-- (GEN) ============================================================================
-- ROL 100: ROL USUARIO 
(10001,      -1, 'GEN',  100, 'DATOS DE USUARIO',                    '',                                           1, 95050, 10000, true, true,  true , true, -1),
(10002,   10001, 'GEN',  100, 'Perfil de usuario',                   'UcCategorias',                               1, 95051, 10000, true, true,  true , true, -1),
(10003,   10001, 'GEN',  100, 'Mis roles y accesos',                 'UcCampania',                                 1, 95051, 10000, true, true,  true , true, -1),
(10004,   10001, 'GEN',  100, 'Mis solicitudes y autorizaciones',    'UcCampaniaConf',                             1, 95051, 10000, true, true,  true , true, -1),
-- ROL 101: ROL ADMINISTRADOR DE SISTEMA                                                                                                               
(10101,      -1, 'GEN',  101, 'ADMINISTRACIÓN DE USUARIOS',          '',                                           1, 95050, 10000, true, true,  true , true, -1),
(10102,   10101, 'GEN',  101, 'Usuarios y contraseña',               'UcUsuarios',                                 1, 95051, 10000, true, true,  true , true, -1),
(10103,   10101, 'GEN',  101, 'Asignar usuarios y perfiles',         '/com/polaris/app/gen/FrmBuscarDirección',    1, 95051, 10000, true, true,  true , true, -1),
(10104,   10101, 'GEN',  101, 'REPORTES',                            'UcUsuariosNegSis',                           1, 95051, 10000, true, true,  true , true, -1),
(10105,   10101, 'GEN',  101, 'Reportes1',                           '/com/polaris/app/gen/FrmBuscarUbigeo',       1, 95051, 10000, true, true,  true , true, -1),
(10106,   10101, 'GEN',  101, 'Reportes2',                           '/com/polaris/app/gen/FrmBuscarUbigeo',       1, 95051, 10000, true, true,  true , true, -1),
(10107,   10101, 'GEN',  101, 'Reportes3',                           '/com/polaris/app/gen/FrmBuscarUbigeo',       1, 95051, 10000, true, true,  true , true, -1),
--                                                                                                                                                     
(10108,      -1, 'GEN',  101, 'OTRAS OPERACIONES',                   'UcInformes',                                 1, 95050, 10000, true, true,  true , true, -1),
(10109,   10108, 'GEN',  101, 'Cajeros',                             'UcInscripcionCole',                          1, 95051, 10000, true, true,  true , true, -1),
(10110,   10108, 'GEN',  101, 'Supervisores',                        'UcInscripcionAcad',                          1, 95051, 10000, true, true,  true , true, -1),
(10111,   10108, 'GEN',  101, 'Gestores',                            'UcEstudianteAcad',                           1, 95051, 10000, true, true,  true , true, -1),
-- ROL 102: ROL ROOT                                                                                                                                   
(10201,      -1, 'GEN',  102, 'SUPER USUARIO',                       '',                                           1, 95050, 10000, true, true,  true , true, -1),
(10202,   10201, 'GEN',  102, 'Variables Globales',                  'UcGbVars',                                   1, 95051, 10000, true, true,  true , true, -1),
(10203,   10201, 'GEN',  102, 'Datos "Tipo"',                        'UcTipos',                                    1, 95051, 10000, true, true,  true , true, -1),
(10204,   10201, 'GEN',  102, 'Empresas y Sedes',                    'UcEmpresas',                                 1, 95051, 10000, true, true,  true , true, -1),
(10205,   10201, 'GEN',  102, 'Usuarios',                            'UcUsuarios',                                 1, 95051, 10000, true, true,  true , true, -1),
(10206,   10201, 'GEN',  102, 'Usuarios y roles',                    'UcNegocios',                                 1, 95051, 10000, true, true,  true , true, -1),
(10207,   10201, 'GEN',  102, 'Trabajadores',                        'UcTrabajador',                               1, 95051, 10000, true, true,  true , true, -1),

-- (COM) ============================================================================
-- ROL 150: ROL INFORMES
(10501,      -1, 'COM',  150, 'VENTAS',                              '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10502,   10501, 'COM',  150, 'Informes',                            '/app/comercial/PnlInformesVta.fxml',         1, 95051, 10000, true, false, false, true, -1),
(10503,   10501, 'COM',  150, 'Nota de pedido',                      '/app/comercial/PnlNotaPedido.fxml',          1, 95051, 10000, true, true,  false, true, -1),
-- ROL 151: ROL ASISTENTE DE VENTAS
(10511,      -1, 'COM',  151, 'VENTAS',                              '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10512,   10511, 'COM',  151, 'Informes',                            '/app/comercial/PnlInformesVta.fxml',         1, 95051, 10000, true, false, false, true, -1),
(10513,   10511, 'COM',  151, 'Nota de pedido',                      '/app/comercial/PnlNotaPedido.fxml',          1, 95051, 10000, true, true,  false, true, -1),
(10514,   10511, 'COM',  151, 'Inscripción colegio',                 '/app/comercial/PnlInsColegio.fxml',          1, 95051, 10000, true, true,  false, true, -1),
(10515,   10511, 'COM',  151, 'Inscripción academia',                '/app/comercial/PnlInsAcademia.fxml',         1, 95051, 10000, true, true,  false, true, -1),
(10516,   10511, 'COM',  151, 'Cronograma de pagos',                 '/app/comercial/PnlCronograma.fxml',          1, 95051, 10000, true, false, false, true, -1),
(10517,   10511, 'COM',  151, 'Control de informes y ventas',        '/app/comercial/PnlCtrlVTA.fxml',             1, 95051, 10000, true, false, false, true, -1),
--
(10518,   10511, 'COM',  151, 'Reportes',                            '/app/comercial/PnlReporteVentas',            1, 95050, 10000, true, true,  false, true, -1),
(10519,   10518, 'COM',  151, 'Resumen de informes',                 'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(10520,   10518, 'COM',  151, 'Resumen de ventas',                   'xxx.jasper',                                 1, 95051, 10000, true, false, false, true, -1),
-- ROL 152: ROL ASISTENTE DE FACTURACIÓN
(10521,      -1, 'COM',  152, 'FACTURACIÓN',                         '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10522,   10521, 'COM',  152, 'Facturación directa',                 '/app/comercial/PnlFactDirecta.fxml',         1, 95051, 10000, true, true,  false, true, -1),
(10523,   10521, 'COM',  152, 'Facturación con nota de pedido',      '/app/comercial/PnlFactNotaPedido.fxml',      1, 95051, 10000, true, true,  false, true, -1),
(10524,   10521, 'COM',  152, 'Facturación con cronograma pagos',    '/app/comercial/PnlFactCronograma.fxml',      1, 95051, 10000, true, false, false, true, -1),
(10525,   10521, 'COM',  152, 'Facturación de alquileres',           '/app/comercial/PnlFactAlquiler.fxml',        1, 95051, 10000, true, false, false, true, -1),
(10526,   10521, 'COM',  152, 'Boletaje',                            '/app/comercial/PnlBoletaje.fxml',            1, 95051, 10000, true, false, false, true, -1),
(10527,   10521, 'COM',  152, 'Nota de crédito',                     '/app/comercial/PnlNotaCredito.fxml',         1, 95051, 10000, true, true,  false, true, -1),
(10528,   10521, 'COM',  152, 'Solicita anulación de comprobante',   '/app/comercial/PnlSolAnulaComp.fxml',        1, 95051, 10000, true, false, false, true, -1),
(10529,   10521, 'COM',  152, 'Solicita eliminación comprobante',    '/app/comercial/PnlSolEliminaComp.fxml',      1, 95051, 10000, true, false, false, true, -1),
(10530,   10521, 'COM',  152, 'Control de comprobantes',             '/app/comercial/PnlCtrlFAC.fxml',             1, 95051, 10000, true, false, false, true, -1),
--
(10531,   10521, 'COM',  152, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10532,   10531, 'COM',  152, 'Comprobantes emitidos',               'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(10533,   10531, 'COM',  152, 'Comprobantes anulados',               'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(10534,   10531, 'COM',  152, 'Comprobantes modificados',            'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 153: ROL ASISTENTE DE CAJA                                                                                  
(10535,      -1, 'COM',  153, 'COBRANZA',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10536,   10531, 'COM',  153, 'Cobranzas',                           '',                                           1, 95051, 10000, true, true,  false, true, -1),
(10537,   10531, 'COM',  153, 'Solicita anulación de cobranza',      '/app/comercial/UctSegCliente',               1, 95051, 10000, true, false, false, true, -1),
(10538,   10531, 'COM',  153, 'Caja - Apertura e ingresos',          '/app/comercial/UctSegCliente',               1, 95051, 10000, true, false, false, true, -1),
(10539,   10531, 'COM',  153, 'Caja - Cierre y egresos',             '/app/comercial/UctSegCliente',               1, 95051, 10000, true, false, false, true, -1),
(10540,   10531, 'COM',  153, 'Caja - Perdidas y robos',             '/app/comercial/UctSegCliente',               1, 95051, 10000, true, false, false, true, -1),
(10541,   10531, 'COM',  153, 'Solicita anulación entrega dinero',   '/app/comercial/UctSegCliente',               1, 95051, 10000, true, false, false, true, -1),
--                                                                                                                 
(10542,   10531, 'COM',  153, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10543,   10538, 'COM',  153, 'Cobranzas por caja',                  'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(10544,   10538, 'COM',  153, 'Cobranzas por usuario',               'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 154: ROL SUPERVISOR DE VENTAS                                                                               
--(10541,      -1, 'COM',  154, 'SUPERVISIÓN VENTAS',                  '',                                           1, 95050, 10000, true, true,  false, true, -1),
--(10542,   10541, 'COM',  154, 'Registrar alumno academia',           'com.yupana.polaris.app.FrmAlumno',           1, 95051, 10000, true, true,  false, true, -1),
--(10543,   10541, 'COM',  154, 'Registrar familiar colegio',          'com.yupana.polaris.app.FrmFamiliar',         1, 95051, 10000, true, true,  false, true, -1),
--(10544,   10541, 'COM',  154, 'Registrar cliente',                   'com.yupana.polaris.app.Frmcliente',          1, 95051, 10000, true, true,  false, true, -1),
--(10545,   10541, 'COM',  154, 'Registrar contacto',                  'com.yupana.polaris.app.FrmContactoMnt',      1, 95051, 10000, true, true,  false, true, -1),
--(10546,   10541, 'COM',  154, 'Registrar dirección',                 'com.yupana.polaris.app.FrmDireccion',        1, 95051, 10000, true, true,  false, true, -1),
--(10547,   10541, 'COM',  154, 'Registrar ubigeo',                    'com.yupana.polaris.app.FrmDireccion',        1, 95051, 10000, true, true,  false, true, -1),
--(10548,   10541, 'COM',  154, 'Registrar grupo familiar',            'com.yupana.polaris.app.FrmDireccion',        1, 95051, 10000, true, true,  false, true, -1),
----                                                                                                                 
--(10549,   10541, 'COM',  154, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
--(10550,   10549, 'COM',  154, 'Reporte de cuotas',                   'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
--(10551,   10549, 'COM',  154, 'Reporte de ventas',                   'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 155: ROL SUPERVISOR DE FACTURACIÓN                                                                          
(10551,      -1, 'COM',  155, 'SUPERVISIÓN FACTURACIÓN',             '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10552,   10551, 'COM',  155, 'Cierre de caja',                      'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(10553,   10551, 'COM',  155, 'Campañas, cronogramas y precios',     'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(10554,   10551, 'COM',  155, 'Prorrogas',                           'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
--                                                                                                                                                      
(10555,   10551, 'COM',  155, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10556,   10555, 'COM',  155, 'Reporte de cuotas',                   'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(10557,   10555, 'COM',  155, 'Reporte de ventas',                   'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 156: ROL SUPERVISOR DE COBRANZA                                                                             
(10561,      -1, 'COM',  156, 'SUPERVISIÓN COBRANZA',                '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10562,   10561, 'COM',  156, 'Cierre de caja',                      'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(10563,   10561, 'COM',  156, 'Campañas, cronogramas y precios',     'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(10564,   10561, 'COM',  156, 'Prorrogas',                           'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
--                                                                                                                 
(10565,   10561, 'COM',  156, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10566,   10565, 'COM',  156, 'Reporte de cuotas',                   'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(10567,   10565, 'COM',  156, 'Reporte de ventas',                   'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 157: ROL GESTOR COMERCIAL
(10571,      -1, 'COM',  157, 'GESTIÓN COMERCIAL',                   '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10572,   10571, 'COM',  157, 'Cajas, cajeros, comprobantes',        'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(10573,   10571, 'COM',  157, 'Precios/Descuentos x Art./Campaña',   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(10574,   10571, 'COM',  157, 'Campañas',                            'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(10575,   10571, 'COM',  157, 'Establecer numeración',               'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
--                                                                                                                 
(10576,   10571, 'COM',  157, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(10577,   10576, 'COM',  157, 'Reporte de cuotas',                   'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(10578,   10576, 'COM',  157, 'Reporte de ventas',                   'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),

-- (LGT) ============================================================================
-- ROL 200: ROL REQUIRIENTE
(12001,      -1, 'LGT',  200, 'REQUERIMIENTOS',                      '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12002,   12001, 'LGT',  200, 'Opción 001',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12003,   12001, 'LGT',  200, 'Opción 002',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12004,   12001, 'LGT',  200, 'Opción 003',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12005,   12001, 'LGT',  200, 'Opción 004',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
--
(12006,   12001, 'LGT',  200, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12007,   12006, 'LGT',  200, 'Reporte de 00001',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(12008,   12006, 'LGT',  200, 'Reporte de 00002',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 201: ROL ASISTENTE DE COTIZACIONES
(12101,      -1, 'LGT',  201, 'COTIZACIONES',                        '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12102,   12101, 'LGT',  201, 'Opción 001',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12103,   12101, 'LGT',  201, 'Opción 002',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12104,   12101, 'LGT',  201, 'Opción 003',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12105,   12101, 'LGT',  201, 'Opción 004',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
--
(12106,   12101, 'LGT',  201, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12107,   12106, 'LGT',  201, 'Reporte de 00001',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(12108,   12106, 'LGT',  201, 'Reporte de 00002',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 202: ROL ASISTENTE DE ALMACÉN
(12201,      -1, 'LGT',  202, 'ALMACÉN',                             '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12202,   12201, 'LGT',  202, 'Opción 001',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12203,   12201, 'LGT',  202, 'Opción 002',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12204,   12201, 'LGT',  202, 'Opción 003',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12205,   12201, 'LGT',  202, 'Opción 004',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
--
(12206,   12201, 'LGT',  202, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12207,   12206, 'LGT',  202, 'Reporte de 00001',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(12208,   12206, 'LGT',  202, 'Reporte de 00002',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 203: ROL ASISTENTE DE ABASTECIMIENTO                                                                        
(12301,      -1, 'LGT',  203, 'ABASTECIMIENTO',                      '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12302,   12301, 'LGT',  203, 'Opción 001',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12303,   12301, 'LGT',  203, 'Opción 002',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12304,   12301, 'LGT',  203, 'Opción 003',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12305,   12301, 'LGT',  203, 'Opción 004',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
--                                                                                                                 
(12306,   12301, 'LGT',  203, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12307,   12306, 'LGT',  203, 'Reporte de 00001',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(12308,   12306, 'LGT',  203, 'Reporte de 00002',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 204: ROL ASISTENTE DE CAJA - COMPRAS                                                                        
(12401,      -1, 'LGT',  204, 'CAJA - COMPRAS',                      '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12402,   12401, 'LGT',  204, 'Opción 001',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12403,   12401, 'LGT',  204, 'Opción 002',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12404,   12401, 'LGT',  204, 'Opción 003',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12405,   12401, 'LGT',  204, 'Opción 004',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
--                                                                                                                 
(12406,   12401, 'LGT',  204, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12407,   12406, 'LGT',  204, 'Reporte de 00001',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(12408,   12406, 'LGT',  204, 'Reporte de 00002',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 205: ROL SUPERVISOR LOGÍSTICO                                                                               
(12501,      -1, 'LGT',  205, 'SUPERVISIÓN LOGÍSTICA',               '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12502,   12501, 'LGT',  205, 'Opción 001',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12503,   12501, 'LGT',  205, 'Opción 002',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12504,   12501, 'LGT',  205, 'Opción 003',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12505,   12501, 'LGT',  205, 'Opción 004',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
--                                                                                                                 
(12506,   12501, 'LGT',  205, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12507,   12506, 'LGT',  205, 'Reporte de 00001',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(12508,   12506, 'LGT',  205, 'Reporte de 00002',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
-- ROL 206: ROL GESTOR LOGÍSTICO
(12601,      -1, 'LGT',  206, 'GESTIÓN LOGÍSTICA',                   '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12602,   12601, 'LGT',  206, 'Opción 001',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12603,   12601, 'LGT',  206, 'Opción 002',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12604,   12601, 'LGT',  206, 'Opción 003',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(12605,   12601, 'LGT',  206, 'Opción 004',                          'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
--                                                                                                                 
(12606,   12601, 'LGT',  206, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(12607,   12606, 'LGT',  206, 'Reporte de 00001',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),
(12608,   12606, 'LGT',  206, 'Reporte de 00002',                    'xxx.jasper',                                 1, 95051, 10000, true, true,  false, true, -1),

-- (PER) ============================================================================
-- ROL 250: ROL ASISTENTE DE ESCALAFÓN
(13001,      -1, 'PER',  250, 'ESCALAFÓN LABORAL',                   '',                                           1, 95050, 10000, true, true,  false, true, -1),
(13002,   13001, 'PER',  250, 'Laboral opción 1',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13003,   13001, 'PER',  250, 'Laboral opción 2',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13004,   13001, 'PER',  250, 'Laboral opción 3',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13005,   13001, 'PER',  250, 'Laboral opción 4',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 251: ROL ASISTENTE DE REMUNERACIONES                                                                        
(13101,      -1, 'PER',  251, 'REMUNERACIONES',                      '',                                           1, 95050, 10000, true, true,  false, true, -1),
(13102,   13101, 'PER',  251, 'Laboral opción 1',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13103,   13101, 'PER',  251, 'Laboral opción 2',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13104,   13101, 'PER',  251, 'Laboral opción 3',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13105,   13101, 'PER',  251, 'Laboral opción 4',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 252: ROL ASISTENTE DE BIENESTAR SOCIAL                                                                      
(13201,      -1, 'PER',  252, 'BIENESTAR SOCIAL',                    '',                                           1, 95050, 10000, true, true,  false, true, -1),
(13202,   13201, 'PER',  252, 'Laboral opción 1',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13203,   13201, 'PER',  252, 'Laboral opción 2',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13204,   13201, 'PER',  252, 'Laboral opción 3',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13205,   13201, 'PER',  252, 'Laboral opción 4',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 253: ROL ASISTENTE DE SEGURIDAD SALUD HIGIENE                                                               
(13301,      -1, 'PER',  253, 'SEGURIDAD SALUD HIGIENE',             '',                                           1, 95050, 10000, true, true,  false, true, -1),
(13302,   13301, 'PER',  253, 'Laboral opción 1',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13303,   13301, 'PER',  253, 'Laboral opción 2',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13304,   13301, 'PER',  253, 'Laboral opción 3',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13305,   13301, 'PER',  253, 'Laboral opción 4',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 254: ROL GESTOR LABORAL
(13401,      -1, 'PER',  254, 'GESTIÓN LABORAL',                     '',                                           1, 95050, 10000, true, true,  false, true, -1),
(13402,   13401, 'PER',  254, 'Laboral opción 1',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13403,   13401, 'PER',  254, 'Laboral opción 2',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13404,   13401, 'PER',  254, 'Laboral opción 3',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13405,   13401, 'PER',  254, 'Laboral opción 4',                    'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),

-- (FIN) ============================================================================
-- ROL 300: ROL ASISTENTE DE TESORERÍA
(13501,      -1, 'FIN',  300, 'TESORERÍA',                           '',                                           1, 95050, 10000, true, true,  false, true, -1),
(13502,   13501, 'FIN',  300, 'Financiero opción 1',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13503,   13501, 'FIN',  300, 'Financiero opción 2',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13504,   13501, 'FIN',  300, 'Financiero opción 3',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13505,   13501, 'FIN',  300, 'Financiero opción 4',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 301: ROL ASISTENTE DE PAGADURÍA                                                                             
(13601,      -1, 'FIN',  301, 'PAGADURÍA',                           '',                                           1, 95050, 10000, true, true,  false, true, -1),
(13602,   13601, 'FIN',  301, 'Financiero opción A',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13603,   13601, 'FIN',  301, 'Financiero opción B',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13604,   13601, 'FIN',  301, 'Financiero opción C',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13605,   13601, 'FIN',  301, 'Financiero opción D',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 302: ROL ASISTENTE DE FONDO FIJO                                                                            
(13701,      -1, 'FIN',  302, 'FONDO FIJO',                          '',                                           1, 95050, 10000, true, true,  false, true, -1),
(13702,   13701, 'FIN',  302, 'Financiero opción A',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13703,   13701, 'FIN',  302, 'Financiero opción B',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13704,   13701, 'FIN',  302, 'Financiero opción C',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13705,   13701, 'FIN',  302, 'Financiero opción D',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 303: ROL ASISTENTE FINANCIERO
(13801,      -1, 'FIN',  303, 'ASISTENTE FINANCIERO',                '',                                           1, 95050, 10000, true, true,  false, true, -1),
(13802,   13801, 'FIN',  303, 'Financiero opción A',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13803,   13801, 'FIN',  303, 'Financiero opción B',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13804,   13801, 'FIN',  303, 'Financiero opción C',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13805,   13801, 'FIN',  303, 'Financiero opción D',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 304: ROL GESTOR FINANCIERO                                                                                  
(13901,      -1, 'FIN',  304, 'GESTIÓN FINANCIERA',                  '',                                           1, 95050, 10000, true, true,  false, true, -1),
(13902,   13901, 'FIN',  304, 'Financiero opción A',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13903,   13901, 'FIN',  304, 'Financiero opción B',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13904,   13901, 'FIN',  304, 'Financiero opción C',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(13905,   13901, 'FIN',  304, 'Financiero opción D',                 'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),

-- (CNT) ============================================================================
-- ROL 350: ROL ASISTENTE CONTABLE COMERCIAL
(14001,      -1, 'CNT',  350, 'CONTABILIDAD COMERCIAL',              '',                                           1, 95050, 10000, true, true,  false, true, -1),
(14002,   14001, 'CNT',  350, 'Contable opción A',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14003,   14001, 'CNT',  350, 'Contable opción B',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14004,   14001, 'CNT',  350, 'Contable opción C',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14005,   14001, 'CNT',  350, 'Contable opción D',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 351: ROL ASISTENTE CONTABLE LOGÍSTICO                                                                       
(14101,      -1, 'CNT',  351, 'CONTABILIDAD LOGÍSTICA',              '',                                           1, 95050, 10000, true, true,  false, true, -1),
(14102,   14101, 'CNT',  351, 'Contable opción A',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14103,   14101, 'CNT',  351, 'Contable opción B',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14104,   14101, 'CNT',  351, 'Contable opción C',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14105,   14101, 'CNT',  351, 'Contable opción D',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 352: ROL ASISTENTE CONTABLE PERSONAL                                                                        
(14201,      -1, 'CNT',  352, 'CONTABILIDAD PERSONAL',               '',                                           1, 95050, 10000, true, true,  false, true, -1),
(14202,   14201, 'CNT',  352, 'Contable opción A',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14203,   14201, 'CNT',  352, 'Contable opción B',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14204,   14201, 'CNT',  352, 'Contable opción C',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14205,   14201, 'CNT',  352, 'Contable opción D',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 353: ROL ASISTENTE CONTABLE FINANCIERO                                                                      
(14301,      -1, 'CNT',  353, 'CONTABILIDAD FINANCIERA',             '',                                           1, 95050, 10000, true, true,  false, true, -1),
(14302,   14301, 'CNT',  353, 'Contable opción A',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14303,   14301, 'CNT',  353, 'Contable opción B',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14304,   14301, 'CNT',  353, 'Contable opción C',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14305,   14301, 'CNT',  353, 'Contable opción D',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 354: ROL ASISTENTE PATRIMONIAL                                                                              
(14401,      -1, 'CNT',  354, 'GESTIÓN PATRIMONIAL',                 '',                                           1, 95050, 10000, true, true,  false, true, -1),
(14402,   14401, 'CNT',  354, 'Contable opción A',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14403,   14401, 'CNT',  354, 'Contable opción B',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14404,   14401, 'CNT',  354, 'Contable opción C',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14405,   14401, 'CNT',  354, 'Contable opción D',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
-- ROL 355: ROL GESTOR CONTABLE                                                                                    
(14501,      -1, 'CNT',  355, 'GESTIÓN CONTABLE',                    '',                                           1, 95050, 10000, true, true,  false, true, -1),
(14502,   14501, 'CNT',  355, 'Contable opción A',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14503,   14501, 'CNT',  355, 'Contable opción B',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14504,   14501, 'CNT',  355, 'Contable opción C',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),
(14505,   14501, 'CNT',  355, 'Contable opción D',                   'com.yupana.polaris.app.UctSegCliente',       1, 95051, 10000, true, true,  false, true, -1),

-- (ADM) ============================================================================
-- ROL 400: ROL MESA DE PARTES
(14601,      -1, 'ADM',  400, 'MESA DE PARTES',                      '',                                           1, 95050, 10000, true, true,  false, true, -1),
(14602,   14601, 'ADM',  400, 'Registro de documentos',               'MesaPartes/FrmRegistroDocumentos',          1, 95051, 10000, true, true,  false, true, -1),
(14603,   14601, 'ADM',  400, 'Seguimiento de expedientes',           'MesaPartes/FrmSeguimientoExp',              1, 95051, 10000, true, true,  false, true, -1),
(14604,   14601, 'ADM',  400, 'Control de plazos',                    'MesaPartes/FrmControlPlazos',               1, 95051, 10000, true, true,  false, true, -1),
(14605,   14601, 'ADM',  400, 'Notificaciones',                      'MesaPartes/FrmNotificaciones',               1, 95051, 10000, true, true,  false, true, -1),
--
(14606,   14601, 'ADM',  400, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(14607,   14606, 'ADM',  400, 'Reporte de ingreso documentos',       'Reportes/RptIngresoDocumentos.jasper',       1, 95051, 10000, true, true,  false, true, -1),
(14608,   14606, 'ADM',  400, 'Reporte de expedientes pendientes',   'Reportes/RptExpedientesPendientes.jasper',   1, 95051, 10000, true, true,  false, true, -1),
-- ROL 401: ROL TRAMITES DOCUMENTARIO
(14701,      -1, 'ADM',  401, 'TRÁMITES DOCUMENTARIOS',              '',                                           1, 95050, 10000, true, true,  false, true, -1),
(14702,   14701, 'ADM',  401, 'Gestión de trámites',                 'Tramites/FrmGestionTramites',                1, 95051, 10000, true, true,  false, true, -1),
(14703,   14701, 'ADM',  401, 'Emisión de certificados',             'Tramites/FrmEmisionCertificados',            1, 95051, 10000, true, true,  false, true, -1),
(14704,   14701, 'ADM',  401, 'Archivo documentario',                'Tramites/FrmArchivoDocumentario',            1, 95051, 10000, true, true,  false, true, -1),
(14705,   14701, 'ADM',  401, 'Derivación de documentos',            'Tramites/FrmDerivacionDocumentos',           1, 95051, 10000, true, true,  false, true, -1),
--
(14706,   14701, 'ADM',  401, 'Reportes',                            '',                                           1, 95050, 10000, true, true,  false, true, -1),
(14707,   14706, 'ADM',  401, 'Reporte de trámites por área',        'Reportes/RptTramitesArea.jasper',            1, 95051, 10000, true, true,  false, true, -1),
(14708,   14706, 'ADM',  401, 'Reporte de certificados emitidos',    'Reportes/RptCertificadosEmitidos.jasper',    1, 95051, 10000, true, true,  false, true, -1),
-- ROL 402: GERENTE GENERAL
(14801,      -1, 'ADM',  402, 'GERENCIA GENERAL',                    '/principal/perfilGerGen/**',                 1, 95050, 10000, true, true,  true , true, -1),
(14802,   14801, 'ADM',  402, 'Dashboard ejecutivo',                 'Gerencia/FrmDashboardEjecutivo',             1, 95051, 10000, true, true,  true , true, -1),
(14803,   14801, 'ADM',  402, 'Planificación estratégica',           'Gerencia/FrmPlanificacionEstrategica',       1, 95051, 10000, true, true,  true , true, -1),
(14804,   14801, 'ADM',  402, 'Control presupuestal',                'Gerencia/FrmControlPresupuestal',            1, 95051, 10000, true, true,  true , true, -1),
(14805,   14801, 'ADM',  402, 'Autorizaciones especiales',           'Gerencia/FrmAutorizacionesEspeciales',       1, 95051, 10000, true, true,  true , true, -1),
--
(14806,   14801, 'ADM',  402, 'Reportes Gerenciales',                '',                                           1, 95050, 10000, true, true,  true , true, -1),
(14807,   14806, 'ADM',  402, 'Estados financieros consolidados',    'Reportes/RptEstadosFinancieros.jasper',      1, 95051, 10000, true, true,  true , true, -1),
(14808,   14806, 'ADM',  402, 'Indicadores de gestión',              'Reportes/RptIndicadoresGestion.jasper',      1, 95051, 10000, true, true,  true , true, -1),
(14809,   14806, 'ADM',  402, 'Análisis de rentabilidad',            'Reportes/RptAnalisisRentabilidad.jasper',    1, 95051, 10000, true, true,  true , true, -1),
-- ROL 403: GERENTE ADMINISTRATIVO                                                                                 
(14901,      -1, 'ADM',  403, 'GERENCIA ADMINISTRATIVA',             '/principal/perfilGerAdm/**',                 1, 95050, 10000, true, true,  true , true, -1),
(14902,   14901, 'ADM',  403, 'Gestión de procesos',                 'GerenciaAdm/FrmGestionProcesos',             1, 95051, 10000, true, true,  true , true, -1),
(14903,   14901, 'ADM',  403, 'Control de calidad',                  'GerenciaAdm/FrmControlCalidad',              1, 95051, 10000, true, true,  true , true, -1),
(14904,   14901, 'ADM',  403, 'Administración de recursos',          'GerenciaAdm/FrmAdminRecursos',               1, 95051, 10000, true, true,  true , true, -1),
(14905,   14901, 'ADM',  403, 'Supervisión operacional',             'GerenciaAdm/FrmSupervisionOperacional',      1, 95051, 10000, true, true,  true , true, -1),
--                                                                                                                 
(14906,   14901, 'ADM',  403, 'Reportes Administrativos',            '',                                           1, 95050, 10000, true, true,  true , true, -1),
(14907,   14906, 'ADM',  403, 'Eficiencia operacional',              'Reportes/RptEficienciaOperacional.jasper',   1, 95051, 10000, true, true,  true , true, -1),
(14908,   14906, 'ADM',  403, 'Control de gastos administrativos',   'Reportes/RptControlGastos.jasper',           1, 95051, 10000, true, true,  true , true, -1),
-- ROL 404: DIRECTOR GENERAL                                                                                       
(15001,      -1, 'ADM',  404, 'DIRECCIÓN GENERAL',                   '/principal/perfilDirGen/**',                 1, 95050, 10000, true, true,  true , true, -1),
(15002,   15001, 'ADM',  404, 'Dirección estratégica',               'Direccion/FrmDireccionEstrategica',          1, 95051, 10000, true, true,  true , true, -1),
(15003,   15001, 'ADM',  404, 'Gobierno corporativo',                'Direccion/FrmGobiernoCorporativo',           1, 95051, 10000, true, true,  true , true, -1),
(15004,   15001, 'ADM',  404, 'Relaciones institucionales',          'Direccion/FrmRelacionesInstitucionales',     1, 95051, 10000, true, true,  true , true, -1),
(15005,   15001, 'ADM',  404, 'Toma de decisiones estratégicas',     'Direccion/FrmDecisionesEstrategicas',        1, 95051, 10000, true, true,  true , true, -1),
--                                                                                                                 
(15006,   15001, 'ADM',  404, 'Reportes Directivos',                 '',                                           1, 95050, 10000, true, true,  true , true, -1),
(15007,   15006, 'ADM',  404, 'Cuadro de mando integral',            'Reportes/RptCuadroMandoIntegral.jasper',     1, 95051, 10000, true, true,  true , true, -1),
(15008,   15006, 'ADM',  404, 'Análisis de cumplimiento objetivos',  'Reportes/RptCumplimientoObjetivos.jasper',   1, 95051, 10000, true, true,  true , true, -1),

-- (COL) ============================================================================
-- ROL 450: ROL AUXILIAR
(15101,      -1, 'COL',  450, 'AUXILIAR EDUCATIVO',                  '',                                           1, 95050, 10001, true, true,  false, true, -1),
(15102,   15101, 'COL',  450, 'Control de asistencia',               'Colegio/FrmControlAsistencia',               1, 95051, 10001, true, true,  false, true, -1),
(15103,   15101, 'COL',  450, 'Registro de incidencias',             'Colegio/FrmRegistroIncidencias',             1, 95051, 10001, true, true,  false, true, -1),
(15104,   15101, 'COL',  450, 'Comunicados a padres',                'Colegio/FrmComunicadosPadres',               1, 95051, 10001, true, true,  false, true, -1),
(15105,   15101, 'COL',  450, 'Observaciones disciplinarias',       'Colegio/FrmObservacionesDisciplinarias',      1, 95051, 10001, true, true,  false, true, -1),
-- ROL 451: ROL DOCENTE                                                                                            
(15201,      -1, 'COL',  451, 'DOCENTE',                             '',                                           1, 95050, 10001, true, true,  false, true, -1),
(15202,   15201, 'COL',  451, 'Registro de calificaciones',          'Colegio/FrmRegistroCalificaciones',          1, 95051, 10001, true, true,  false, true, -1),
(15203,   15201, 'COL',  451, 'Planificación curricular',            'Colegio/FrmPlanificacionCurricular',         1, 95051, 10001, true, true,  false, true, -1),
(15204,   15201, 'COL',  451, 'Asignación de tareas',                'Colegio/FrmAsignacionTareas',                1, 95051, 10001, true, true,  false, true, -1),
(15205,   15201, 'COL',  451, 'Evaluaciones y exámenes',             'Colegio/FrmEvaluacionesExamenes',            1, 95051, 10001, true, true,  false, true, -1),
-- ROL 452: ROL ASISTENTE ACADÉMICO                                                                                
(15301,      -1, 'COL',  452, 'ASISTENTE ACADÉMICO',                 '',                                           1, 95050, 10001, true, true,  false, true, -1),
(15302,   15301, 'COL',  452, 'Matrículas escolares',                'Colegio/FrmMatriculasEscolares',             1, 95051, 10001, true, true,  false, true, -1),
(15303,   15301, 'COL',  452, 'Expedientes académicos',              'Colegio/FrmExpedientesAcademicos',           1, 95051, 10001, true, true,  false, true, -1),
(15304,   15301, 'COL',  452, 'Certificados y constancias',          'Colegio/FrmCertificadosConstancias',         1, 95051, 10001, true, true,  false, true, -1),
(15305,   15301, 'COL',  452, 'Horarios y cronogramas',              'Colegio/FrmHorariosCronogramas',             1, 95051, 10001, true, true,  false, true, -1),
-- ROL 453: ROL ENFERMERO                                                                                          
(15401,      -1, 'COL',  453, 'ENFERMERÍA ESCOLAR',                  '',                                           1, 95050, 10001, true, true,  false, true, -1),
(15402,   15401, 'COL',  453, 'Atención médica básica',              'Colegio/FrmAtencionMedicaBasica',            1, 95051, 10001, true, true,  false, true, -1),
(15403,   15401, 'COL',  453, 'Control de medicamentos',             'Colegio/FrmControlMedicamentos',             1, 95051, 10001, true, true,  false, true, -1),
(15404,   15401, 'COL',  453, 'Emergencias y accidentes',            'Colegio/FrmEmergenciasAccidentes',           1, 95051, 10001, true, true,  false, true, -1),
(15405,   15401, 'COL',  453, 'Fichas médicas estudiantes',          'Colegio/FrmFichasMedicasEstudiantes',        1, 95051, 10001, true, true,  false, true, -1),
-- ROL 454: ROL PSICÓLOGO
(15501,      -1, 'COL',  454, 'PSICOLOGÍA EDUCATIVA',                '',                                           1, 95050, 10001, true, true,  false, true, -1),
(15502,   15501, 'COL',  454, 'Evaluaciones psicológicas',           'Colegio/FrmEvaluacionesPsicologicas',        1, 95051, 10001, true, true,  false, true, -1),
(15503,   15501, 'COL',  454, 'Sesiones de consejería',              'Colegio/FrmSesionesConsejeria',              1, 95051, 10001, true, true,  false, true, -1),
(15504,   15501, 'COL',  454, 'Orientación vocacional',              'Colegio/FrmOrientacionVocacional',           1, 95051, 10001, true, true,  false, true, -1),
(15505,   15501, 'COL',  454, 'Programas de bienestar',              'Colegio/FrmProgramasBienestar',              1, 95051, 10001, true, true,  false, true, -1),
-- ROL 455: ROL BIBLIOTECARIO                                                                                      
(15601,      -1, 'COL',  455, 'BIBLIOTECA ESCOLAR',                  '',                                           1, 95050, 10001, true, true,  false, true, -1),
(15602,   15601, 'COL',  455, 'Catálogo de libros',                  'Colegio/FrmCatalogoLibros',                  1, 95051, 10001, true, true,  false, true, -1),
(15603,   15601, 'COL',  455, 'Préstamos y devoluciones',            'Colegio/FrmPrestamosDevoluciones',           1, 95051, 10001, true, true,  false, true, -1),
(15604,   15601, 'COL',  455, 'Inventario bibliográfico',            'Colegio/FrmInventarioBibliografico',         1, 95051, 10001, true, true,  false, true, -1),
(15605,   15601, 'COL',  455, 'Actividades de lectura',              'Colegio/FrmActividadesLectura',              1, 95051, 10001, true, true,  false, true, -1),
-- ROL 456: ROL TAREADOR                                                                                           
(15701,      -1, 'COL',  456, 'CONTROL DE TAREAS',                   '',                                           1, 95050, 10001, true, true,  false, true, -1),
(15702,   15701, 'COL',  456, 'Seguimiento de docentes',             'Colegio/FrmSeguimientoDocentes',             1, 95051, 10001, true, true,  false, true, -1),
(15703,   15701, 'COL',  456, 'Horas dictadas por curso',            'Colegio/FrmHorasDictadasCurso',              1, 95051, 10001, true, true,  false, true, -1),
(15704,   15701, 'COL',  456, 'Control de cumplimiento',             'Colegio/FrmControlCumplimiento',             1, 95051, 10001, true, true,  false, true, -1),
(15705,   15701, 'COL',  456, 'Reportes de avance curricular',       'Colegio/FrmReportesAvanceCurricular',        1, 95051, 10001, true, true,  false, true, -1),
-- ROL 457: ROL GESTOR ACADÉMICO                                                                                   
(15801,      -1, 'COL',  457, 'GESTIÓN ACADÉMICA',                   '',                                           1, 95050, 10001, true, true,  true ,  true, -1),
(15802,   15801, 'COL',  457, 'Planificación académica anual',       'Colegio/FrmPlanificacionAcademicaAnual',     1, 95051, 10001, true, true,  true ,  true, -1),
(15803,   15801, 'COL',  457, 'Estadísticas académicas',             'Colegio/FrmEstadisticasAcademicas',          1, 95051, 10001, true, true,  true ,  true, -1),
(15804,   15801, 'COL',  457, 'Evaluación institucional',            'Colegio/FrmEvaluacionInstitucional',         1, 95051, 10001, true, true,  true ,  true, -1),
(15805,   15801, 'COL',  457, 'Comunicados institucionales',         'Colegio/FrmComunicadosInstitucionales',      1, 95051, 10001, true, true,  true ,  true, -1),
--                                                                                                                 
(15806,   15801, 'COL',  457, 'Reportes Académicos',                 '',                                           1, 95050, 10001, true, true,  true ,  true, -1),
(15807,   15806, 'COL',  457, 'Rendimiento académico por grado',     'Reportes/RptRendimientoAcademico.jasper',    1, 95051, 10001, true, true,  true ,  true, -1),
(15808,   15806, 'COL',  457, 'Indicadores educativos',              'Reportes/RptIndicadoresEducativos.jasper',   1, 95051, 10001, true, true,  true ,  true, -1),

-- (ACA) ============================================================================
-- ROL 500: ROL TUTOR
(16001,      -1, 'ACA',  500, 'TUTORÍA ACADÉMICA',                   '',                                           1, 95050, 10002, true, true,  false, true, -1),
(16002,   16001, 'ACA',  500, 'Seguimiento de estudiantes',          'Academia/FrmSeguimientoEstudiantes',         1, 95051, 10002, true, true,  false, true, -1),
(16003,   16001, 'ACA',  500, 'Control de asistencia',               'Academia/FrmControlAsistencia',              1, 95051, 10002, true, true,  false, true, -1),
(16004,   16001, 'ACA',  500, 'Evaluaciones y simulacros',           'Academia/FrmEvaluacionesSimulacros',         1, 95051, 10002, true, true,  false, true, -1),
(16005,   16001, 'ACA',  500, 'Comunicados y citaciones',            'Academia/FrmComunicadosCitaciones',          1, 95051, 10002, true, true,  false, true, -1),
-- ROL 501: ROL TAREADOR                                                                                           
(16101,      -1, 'ACA',  501, 'CONTROL DE TAREAS ACADEMIA',          '',                                           1, 95050, 10002, true, true,  false, true, -1),
(16102,   16101, 'ACA',  501, 'Horas dictadas por docente',          'Academia/FrmHorasDictadasDocente',           1, 95051, 10002, true, true,  false, true, -1),
(16103,   16101, 'ACA',  501, 'Seguimiento de profesores',           'Academia/FrmSeguimientoProfesores',          1, 95051, 10002, true, true,  false, true, -1),
(16104,   16101, 'ACA',  501, 'Control de cumplimiento',             'Academia/FrmControlCumplimiento',            1, 95051, 10002, true, true,  false, true, -1),
(16105,   16101, 'ACA',  501, 'Reportes de avance temático',         'Academia/FrmReportesAvanceTematico',         1, 95051, 10002, true, true,  false, true, -1),
-- ROL 502: ROL SUPERVISOR                                                                                         
(16201,      -1, 'ACA',  502, 'SUPERVISIÓN ACADÉMICA',               '',                                           1, 95050, 10002, true, true,  false, true, -1),
(16202,   16201, 'ACA',  502, 'Supervisión de clases',               'Academia/FrmSupervisionClases',              1, 95051, 10002, true, true,  false, true, -1),
(16203,   16201, 'ACA',  502, 'Evaluación de docentes',              'Academia/FrmEvaluacionDocentes',             1, 95051, 10002, true, true,  false, true, -1),
(16204,   16201, 'ACA',  502, 'Control de metodologías',             'Academia/FrmControlMetodologias',            1, 95051, 10002, true, true,  false, true, -1),
(16205,   16201, 'ACA',  502, 'Planes de mejora',                    'Academia/FrmPlanesMejora',                   1, 95051, 10002, true, true,  false, true, -1),
-- ROL 503: ROL COORDINADOR ACADÉMICO                                                                              
(16301,      -1, 'ACA',  503, 'COORDINACIÓN ACADÉMICA',              '',                                           1, 95050, 10002, true, true,  true , true, -1),
(16302,   16301, 'ACA',  503, 'Carga horaria por ciclo',             'Academia/FrmCargaHorariaCiclo',              1, 95051, 10002, true, true,  true , true, -1),
(16303,   16301, 'ACA',  503, 'Asignación de profesores',            'Academia/FrmAsignacionProfesores',           1, 95051, 10002, true, true,  true , true, -1),
(16304,   16301, 'ACA',  503, 'Planificación curricular',            'Academia/FrmPlanificacionCurricular',        1, 95051, 10002, true, true,  true , true, -1),
(16305,   16301, 'ACA',  503, 'Avance silábico',                     'Academia/FrmAvanceSilabico',                 1, 95051, 10002, true, true,  true , true, -1),
--                                                                                                                 
(16306,   16301, 'ACA',  503, 'Reportes Académicos',                 '',                                           1, 95050, 10002, true, true,  true , true, -1),
(16307,   16306, 'ACA',  503, 'Rendimiento por ciclo',               'Reportes/RptRendimientoCiclo.jasper',        1, 95051, 10002, true, true,  true , true, -1),
(16308,   16306, 'ACA',  503, 'Estadísticas de ingreso universidad', 'Reportes/RptEstadisticasIngreso.jasper',     1, 95051, 10002, true, true,  true , true, -1),

-- (MED) ============================================================================
-- ROL 550: ROL PROGRAMACIÓN DE HORARIOS
(16401,      -1, 'MED',  550, 'PROGRAMACIÓN DE HORARIOS MÉDICOS',    '',                                           1, 95050, 10003, true, true,  false, true, -1),
(16402,   16401, 'MED',  550, 'Gestión de turnos médicos',           'Medicina/FrmGestionTurnosMedicos',           1, 95051, 10003, true, true,  false, true, -1),
(16403,   16401, 'MED',  550, 'Calendario de especialistas',         'Medicina/FrmCalendarioEspecialistas',        1, 95051, 10003, true, true,  false, true, -1),
(16404,   16401, 'MED',  550, 'Control de disponibilidad',           'Medicina/FrmControlDisponibilidad',          1, 95051, 10003, true, true,  false, true, -1),
(16405,   16401, 'MED',  550, 'Reprogramación de citas',             'Medicina/FrmReprogramacionCitas',            1, 95051, 10003, true, true,  false, true, -1),
-- ROL 551: ROL PROFESIONALES                                                                                      
(16501,      -1, 'MED',  551, 'GESTIÓN DE PROFESIONALES',            '',                                           1, 95050, 10003, true, true,  false, true, -1),
(16502,   16501, 'MED',  551, 'Registro de especialidades',          'Medicina/FrmRegistroEspecialidades',         1, 95051, 10003, true, true,  false, true, -1),
(16503,   16501, 'MED',  551, 'Credenciales y certificaciones',      'Medicina/FrmCredencialesCertificaciones',    1, 95051, 10003, true, true,  false, true, -1),
(16504,   16501, 'MED',  551, 'Historial profesional',               'Medicina/FrmHistorialProfesional',           1, 95051, 10003, true, true,  false, true, -1),
(16505,   16501, 'MED',  551, 'Evaluación de desempeño',             'Medicina/FrmEvaluacionDesempeno',            1, 95051, 10003, true, true,  false, true, -1),
-- ROL 552: ROL TIPOS DE PROFESIONALES                                                                             
(16601,      -1, 'MED',  552, 'CLASIFICACIÓN DE PROFESIONALES',      '',                                           1, 95050, 10003, true, true,  false, true, -1),
(16602,   16601, 'MED',  552, 'Categorías médicas',                  'Medicina/FrmCategoriasMedicas',              1, 95051, 10003, true, true,  false, true, -1),
(16603,   16601, 'MED',  552, 'Especialidades y subespecialidades',  'Medicina/FrmEspecialidadesSubesp',           1, 95051, 10003, true, true,  false, true, -1),
(16604,   16601, 'MED',  552, 'Niveles de autorización',             'Medicina/FrmNivelesAutorizacion',            1, 95051, 10003, true, true,  false, true, -1),
(16605,   16601, 'MED',  552, 'Perfiles profesionales',              'Medicina/FrmPerfilesProfesionales',          1, 95051, 10003, true, true,  false, true, -1),
-- ROL 553: ROL MEDICINA GENERAL                                                                                   
(16701,      -1, 'MED',  553, 'MEDICINA GENERAL',                    '',                                           1, 95050, 10003, true, true,  false, true, -1),
(16702,   16701, 'MED',  553, 'Consultas generales',                 'Medicina/FrmConsultasGenerales',             1, 95051, 10003, true, true,  false, true, -1),
(16703,   16701, 'MED',  553, 'Diagnósticos preliminares',           'Medicina/FrmDiagnosticosPreliminares',       1, 95051, 10003, true, true,  false, true, -1),
(16704,   16701, 'MED',  553, 'Prescripciones médicas',              'Medicina/FrmPrescripcionesMedicas',          1, 95051, 10003, true, true,  false, true, -1),
(16705,   16701, 'MED',  553, 'Referencias a especialistas',         'Medicina/FrmReferenciasEspecialistas',       1, 95051, 10003, true, true,  false, true, -1),
-- ROL 554: ROL NUTRICIÓN                                                                                          
(16801,      -1, 'MED',  554, 'NUTRICIÓN CLÍNICA',                   '',                                           1, 95050, 10003, true, true,  false, true, -1),
(16802,   16801, 'MED',  554, 'Evaluación nutricional',              'Medicina/FrmEvaluacionNutricional',          1, 95051, 10003, true, true,  false, true, -1),
(16803,   16801, 'MED',  554, 'Planes alimentarios',                 'Medicina/FrmPlanesAlimentarios',             1, 95051, 10003, true, true,  false, true, -1),
(16804,   16801, 'MED',  554, 'Seguimiento nutricional',             'Medicina/FrmSeguimientoNutricional',         1, 95051, 10003, true, true,  false, true, -1),
(16805,   16801, 'MED',  554, 'Educación alimentaria',               'Medicina/FrmEducacionAlimentaria',           1, 95051, 10003, true, true,  false, true, -1),
-- ROL 555: ROL GINECOLOGÍA                                                                                        
(16901,      -1, 'MED',  555, 'GINECOLOGÍA',                         '',                                           1, 95050, 10003, true, true,  false, true, -1),
(16902,   16901, 'MED',  555, 'Consultas ginecológicas',             'Medicina/FrmConsultasGinecologicas',         1, 95051, 10003, true, true,  false, true, -1),
(16903,   16901, 'MED',  555, 'Control prenatal',                    'Medicina/FrmControlPrenatal',                1, 95051, 10003, true, true,  false, true, -1),
(16904,   16901, 'MED',  555, 'Exámenes preventivos',                'Medicina/FrmExamenesPreventivos',            1, 95051, 10003, true, true,  false, true, -1),
(16905,   16901, 'MED',  555, 'Planificación familiar',              'Medicina/FrmPlanificacionFamiliar',          1, 95051, 10003, true, true,  false, true, -1),
-- ROL 556: ROL UROLOGÍA                                                                                           
(17001,      -1, 'MED',  556, 'UROLOGÍA',                            '',                                           1, 95050, 10003, true, true,  false, true, -1),
(17002,   17001, 'MED',  556, 'Consultas urológicas',                'Medicina/FrmConsultasUrologicas',            1, 95051, 10003, true, true,  false, true, -1),
(17003,   17001, 'MED',  556, 'Exámenes especializados',             'Medicina/FrmExamenesEspecializados',         1, 95051, 10003, true, true,  false, true, -1),
(17004,   17001, 'MED',  556, 'Procedimientos urológicos',           'Medicina/FrmProcedimientosUrologicos',       1, 95051, 10003, true, true,  false, true, -1),
(17005,   17001, 'MED',  556, 'Seguimiento postoperatorio',          'Medicina/FrmSeguimientoPostoperatorio',      1, 95051, 10003, true, true,  false, true, -1),
-- ROL 557: ROL TRIAJE                                                                                             
(17101,      -1, 'MED',  557, 'TRIAJE MÉDICO',                       '',                                           1, 95050, 10003, true, true,  false, true, -1),
(17102,   17101, 'MED',  557, 'Clasificación de urgencias',          'Medicina/FrmClasificacionUrgencias',         1, 95051, 10003, true, true,  false, true, -1),
(17103,   17101, 'MED',  557, 'Evaluación inicial pacientes',        'Medicina/FrmEvaluacionInicialPacientes',     1, 95051, 10003, true, true,  false, true, -1),
(17104,   17101, 'MED',  557, 'Asignación de prioridades',           'Medicina/FrmAsignacionPrioridades',          1, 95051, 10003, true, true,  false, true, -1),
(17105,   17101, 'MED',  557, 'Control de flujo de pacientes',       'Medicina/FrmControlFlujoPacientes',          1, 95051, 10003, true, true,  false, true, -1),

-- (BKA) ============================================================================
-- ROL 600: ROL ANALISTA
(17201,      -1, 'BKA',  600, 'ANÁLISIS BANCARIO',                   '',                                           1, 95050, 10004, true, true,  false, true, -1),
(17202,   17201, 'BKA',  600, 'Análisis de riesgo crediticio',       'Banca/FrmAnalisisRiesgoCrediticio',          1, 95051, 10004, true, true,  false, true, -1),
(17203,   17201, 'BKA',  600, 'Evaluación financiera',               'Banca/FrmEvaluacionFinanciera',              1, 95051, 10004, true, true,  false, true, -1),
(17204,   17201, 'BKA',  600, 'Reportes de morosidad',               'Banca/FrmReportesMorosidad',                 1, 95051, 10004, true, true,  false, true, -1),
(17205,   17201, 'BKA',  600, 'Análisis de portafolio',              'Banca/FrmAnalisisPortafolio',                1, 95051, 10004, true, true,  false, true, -1),
-- ROL 601: ROL OPERACIONES                                                                                        
(17301,      -1, 'BKA',  601, 'OPERACIONES BANCARIAS',               '',                                           1, 95050, 10004, true, true,  false, true, -1),
(17302,   17301, 'BKA',  601, 'Procesamiento de transacciones',      'Banca/FrmProcesamientoTransacciones',        1, 95051, 10004, true, true,  false, true, -1),
(17303,   17301, 'BKA',  601, 'Conciliación bancaria',               'Banca/FrmConciliacionBancaria',              1, 95051, 10004, true, true,  false, true, -1),
(17304,   17301, 'BKA',  601, 'Control de efectivo',                 'Banca/FrmControlEfectivo',                   1, 95051, 10004, true, true,  false, true, -1),
(17305,   17301, 'BKA',  601, 'Operaciones interbancarias',          'Banca/FrmOperacionesInterbancarias',         1, 95051, 10004, true, true,  false, true, -1),
-- ROL 602: ROL SUPERVISOR                                                                                         
(17401,      -1, 'BKA',  602, 'SUPERVISIÓN BANCARIA',                '',                                           1, 95050, 10004, true, true,  false, true, -1),
(17402,   17401, 'BKA',  602, 'Supervisión de operaciones',          'Banca/FrmSupervisionOperaciones',            1, 95051, 10004, true, true,  false, true, -1),
(17403,   17401, 'BKA',  602, 'Control de cumplimiento',             'Banca/FrmControlCumplimiento',               1, 95051, 10004, true, true,  false, true, -1),
(17404,   17401, 'BKA',  602, 'Auditoría interna',                   'Banca/FrmAuditoriaInterna',                  1, 95051, 10004, true, true,  false, true, -1),
(17405,   17401, 'BKA',  602, 'Gestión de incidencias',              'Banca/FrmGestionIncidencias',                1, 95051, 10004, true, true,  false, true, -1),
-- ROL 603: ROL JEFE DE OPERACIONES                                                                                
(17501,      -1, 'BKA',  603, 'JEFATURA DE OPERACIONES',             '',                                           1, 95050, 10004, true, true,  true , true, -1),
(17502,   17501, 'BKA',  603, 'Planificación operacional',           'Banca/FrmPlanificacionOperacional',          1, 95051, 10004, true, true,  true , true, -1),
(17503,   17501, 'BKA',  603, 'Gestión de recursos',                 'Banca/FrmGestionRecursos',                   1, 95051, 10004, true, true,  true , true, -1),
(17504,   17501, 'BKA',  603, 'Estrategias operativas',              'Banca/FrmEstrategiasOperativas',             1, 95051, 10004, true, true,  true , true, -1),
(17505,   17501, 'BKA',  603, 'Autorización de operaciones',         'Banca/FrmAutorizacionOperaciones',           1, 95051, 10004, true, true,  true , true, -1),
--                                                                                                                 
(17506,   17501, 'BKA',  603, 'Reportes Ejecutivos',                 '',                                           1, 95050, 10004, true, true,  true,  true, -1),
(17507,   17506, 'BKA',  603, 'Dashboard operacional',               'Reportes/RptDashboardOperacional.jasper',    1, 95051, 10004, true, true,  true,  true, -1),
(17508,   17506, 'BKA',  603, 'Indicadores de eficiencia',           'Reportes/RptIndicadoresEficiencia.jasper',   1, 95051, 10004, true, true,  true,  true, -1);



-- ============================================================================
-- TABLA: gen.usuario_perfil
-- ============================================================================
DROP TABLE IF EXISTS gen.usuario_perfil CASCADE;
CREATE TABLE gen.usuario_perfil (
    id_usu_perfil       BIGSERIAL       NOT NULL PRIMARY KEY,
    nom_usu         	VARCHAR(50)     NOT NULL,
    id_empresa          INT             NOT NULL,
    id_und_negocio      INT             NOT NULL,
    id_sistema          CHAR(3)         NOT NULL,
    activo_sistema		BOOLEAN         NOT NULL,
    id_rol              INT             NOT NULL,
    activo_rol			BOOLEAN         NOT NULL,
    ver                 BOOLEAN         NOT NULL,
    crear               BOOLEAN         NOT NULL,
    editar              BOOLEAN         NOT NULL,
    eliminar            BOOLEAN         NOT NULL,
    us_registra         VARCHAR(25)     NOT NULL,
    fh_registra         TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ip_registra         VARCHAR(25)     NOT NULL,
    CONSTRAINT usuario_perfil_nom_usu_fkey FOREIGN KEY (nom_usu) REFERENCES gen.usuario(nom_usu) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
COMMENT ON TABLE gen.usuario_perfil IS 'Perfiles y permisos asignados a usuarios por sistema, rol, empresa y unidad de negocio.';
COMMENT ON COLUMN gen.usuario_perfil.id_usu_perfil IS 'Identificador único del perfil del usuario.';
COMMENT ON COLUMN gen.usuario_perfil.nom_usu IS 'Nombre del usuario [GEN.USUARIO].';
COMMENT ON COLUMN gen.usuario_perfil.id_empresa IS 'Identificador de empresa [GEN.EMPRESA].';
COMMENT ON COLUMN gen.usuario_perfil.id_und_negocio IS 'Identificador de unidad de negocio [GEN.UNIDAD_NEGOCIO].';
COMMENT ON COLUMN gen.usuario_perfil.id_sistema IS 'Identificador del sistema [GEN.SISTEMA].';
COMMENT ON COLUMN gen.usuario_perfil.activo_sistema IS 'Estado del sistema para el usuario.';
COMMENT ON COLUMN gen.usuario_perfil.id_rol IS 'Identificador del rol asignado [GEN.ROL].';
COMMENT ON COLUMN gen.usuario_perfil.activo_rol IS 'Estado del rol asignado.';
COMMENT ON COLUMN gen.usuario_perfil.ver IS 'Permiso para visualizar.';
COMMENT ON COLUMN gen.usuario_perfil.crear IS 'Permiso para crear.';
COMMENT ON COLUMN gen.usuario_perfil.editar IS 'Permiso para editar.';
COMMENT ON COLUMN gen.usuario_perfil.eliminar IS 'Permiso para eliminar.';
COMMENT ON COLUMN gen.usuario_perfil.us_registra IS 'Usuario que registró el perfil.';
COMMENT ON COLUMN gen.usuario_perfil.fh_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN gen.usuario_perfil.ip_registra IS 'IP o dispositivo desde el cual se realizó el registro.';
--



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





-- EN LA MATRICULA/SUSCRIPCION IRIA LOS CURSOS EXONERADOS, EL CONTACTO DE EMERGENCAI, E APODERADO ACADEMICO, EL APODERADO ECONOMICO
-- EN LA MATRICULA/SUSCRIPCION IRIA LOS CURSOS EXONERADOS, EL CONTACTO DE EMERGENCAI, E APODERADO ACADEMICO, EL APODERADO ECONOMICO
-- EN LA MATRICULA/SUSCRIPCION IRIA LOS CURSOS EXONERADOS, EL CONTACTO DE EMERGENCAI, E APODERADO ACADEMICO, EL APODERADO ECONOMICO
-- EN LA MATRICULA/SUSCRIPCION IRIA LOS CURSOS EXONERADOS, EL CONTACTO DE EMERGENCAI, E APODERADO ACADEMICO, EL APODERADO ECONOMICO
-- EN LA MATRICULA/SUSCRIPCION IRIA LOS CURSOS EXONERADOS, EL CONTACTO DE EMERGENCAI, E APODERADO ACADEMICO, EL APODERADO ECONOMICO
--COMMENT ON COLUMN gen.estudiante_cole.contacto_full IS 'Información completa de contacto de emergencia (nombres, celular, parentesco).';


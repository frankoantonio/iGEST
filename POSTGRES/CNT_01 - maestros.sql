-- ============================================================================
-- TABLA: moneda
-- ============================================================================
DROP TABLE IF EXISTS moneda CASCADE;
CREATE TABLE moneda (
    id_moneda       SERIAL         	NOT NULL PRIMARY KEY,
    id_empresa      INT          	NOT NULL,
    codigo          VARCHAR(3)     	NOT NULL,
    nombre          VARCHAR(50)    	NOT NULL,
    simbolo         VARCHAR(5)     	NOT NULL,   
    principal     	BOOLEAN        	NOT NULL,
    activo        	BOOLEAN        	NOT NULL,
    UNIQUE (id_empresa, codigo)
);
--
CREATE UNIQUE INDEX ON moneda(id_empresa) WHERE principal = true;
--
COMMENT ON TABLE moneda IS 'Tabla para registrar las monedas.';
COMMENT ON COLUMN moneda.id_moneda IS 'Identificador de moneda.';
COMMENT ON COLUMN moneda.id_empresa IS 'Identificador de empresa [db_igest_gen.empresa].';
COMMENT ON COLUMN moneda.codigo IS 'Código según la ISO 4217.';
COMMENT ON COLUMN moneda.nombre IS 'Nombre oficial de la moneda.';
COMMENT ON COLUMN moneda.simbolo IS 'Símbolo para mostrar.';
COMMENT ON COLUMN moneda.principal IS 'Indica sí es la moneda principal.';
COMMENT ON COLUMN moneda.activo IS 'Indica sí está activo.';
-- 
INSERT INTO moneda (id_empresa, codigo, nombre, simbolo, principal, activo) VALUES 
(1004, 'PEN', 'Sol Peruano'		, 'S/'	,  true , true ),
(1004, 'USD', 'Dólar Americano'	, '$'	,  false, true ),
(1004, 'EUR', 'Euro'			, '€'	,  false, true );



-- ============================================================================
-- TABLA: tipo_cambio
-- ============================================================================
DROP TABLE IF EXISTS tipo_cambio CASCADE;
CREATE TABLE tipo_cambio (
	id_tipo_cambio    	SERIAL          NOT NULL PRIMARY KEY,
    id_empresa          INT             NOT NULL,
    id_moneda           INT             NOT NULL REFERENCES moneda(id_moneda),
    fecha               DATE            NOT NULL,
    valor               NUMERIC(8,4)    NOT NULL,
    fuente              VARCHAR(20)     NOT NULL CHECK (fuente IN ('SBS','SUNAT','BCR','MANUAL')),
    fe_registra        	TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fe_modifica         TIMESTAMP		NULL,
    UNIQUE (id_empresa, id_moneda, fecha)
);
--
COMMENT ON TABLE tipo_cambio IS 'Tabla para registrar los tipos de cambio.';
COMMENT ON COLUMN tipo_cambio.id_tipo_cambio IS 'Identificador del tipo de cambio.';
COMMENT ON COLUMN tipo_cambio.id_empresa IS 'Identificador de empresa [db_igest_gen.empresa].';
COMMENT ON COLUMN tipo_cambio.id_moneda IS 'Identificador de moneda [moneda].';
COMMENT ON COLUMN tipo_cambio.fecha IS 'Fecha del tipo de cambio.';
COMMENT ON COLUMN tipo_cambio.valor IS 'Valor de 1 U.M. convertida a la moneda principal.';
COMMENT ON COLUMN tipo_cambio.fuente IS 'Fuente del tipo de cambio: SBS, SUNAT, BCR, MANUAL.';
COMMENT ON COLUMN tipo_cambio.fe_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN tipo_cambio.fe_modifica IS 'Fecha y hora de última modificación.';
--
INSERT INTO tipo_cambio (id_empresa, id_moneda, fecha, valor, fuente) VALUES
(1004, 2, '2024-12-01', 3.7500, 'SBS'	 ),	-- dolar=2
(1004, 2, '2024-12-02', 3.7450, 'SBS'	 ),
(1004, 2, '2024-12-03', 3.7400, 'SBS'	 ),
(1004, 2, '2024-12-04', 3.7550, 'SBS'	 ),
(1004, 2, '2024-12-05', 3.7600, 'SBS'	 ),
(1004, 3, '2024-12-01', 3.9850, 'SBS'	 ),	--euro=3
(1004, 3, '2024-12-02', 3.9750, 'SBS'	 ),
(1004, 3, '2024-12-03', 3.9650, 'SBS'	 ),
(1004, 3, '2024-12-04', 3.9950, 'SBS'	 ),
(1004, 3, '2024-12-05', 4.0050, 'SBS'	 ),
(1004, 2, '2024-12-11', 3.7720, 'MANUAL' ),	--no es de la SBS, es manual
(1004, 3, '2024-12-11', 4.0200, 'MANUAL' ),
(1004, 2, '2024-12-12', 3.7480, 'SUNAT'	 ),	--si fuera el caso poner para la SUNAT
(1004, 3, '2024-12-12', 3.9830, 'SUNAT'	 );



-- ============================================================================
-- TABLA: centro_costo
-- ============================================================================
DROP TABLE IF EXISTS centro_costo CASCADE;
CREATE TABLE centro_costo (
	id_centro_costo		SERIAL   		NOT NULL PRIMARY KEY,
    id_empresa        	INT          	NOT NULL,
    nombre            	VARCHAR(100) 	NOT NULL,
    id_tipo_empresa     INT	  			NOT NULL, 
    id_tipo_ceco      	INT			  	NOT NULL,
    id_padre          	BIGINT       	NULL REFERENCES centro_costo(id_centro_costo),
    nivel             	INT          	NOT NULL,
    activo            	BOOLEAN      	NOT NULL,
    fe_registra       	TIMESTAMP    	NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fe_modifica       	TIMESTAMP       NULL
);
--
CREATE INDEX ON centro_costo(id_tipo_empresa);
CREATE INDEX ON centro_costo(id_tipo_ceco);
--
COMMENT ON TABLE  centro_costo IS 'Tabla de centros de costo.';
COMMENT ON COLUMN centro_costo.id_centro_costo IS 'Identificador del centro de costo.';
COMMENT ON COLUMN centro_costo.id_empresa IS 'Identificador de empresa [db_igest_gen.empresa].';
COMMENT ON COLUMN centro_costo.nombre IS 'Nombre del centro de costo.';
COMMENT ON COLUMN centro_costo.id_tipo_empresa IS 'Identificador de empresa [db_igest_gen.tipo/TI_EMPRESA].';
COMMENT ON COLUMN centro_costo.id_tipo_ceco IS 'Identificador de centro de costo: [db_igest_gen.tipo/TI_CECO].';
COMMENT ON COLUMN centro_costo.id_padre IS 'Identificador del centro de costo padre.';
COMMENT ON COLUMN centro_costo.nivel IS 'Nivel jerárquico en la estructura de centros de costo.';
COMMENT ON COLUMN centro_costo.activo IS 'Indica sí está activo.';
COMMENT ON COLUMN centro_costo.fe_registra IS 'Fecha y hora de registro.';
COMMENT ON COLUMN centro_costo.fe_modifica IS 'Fecha y hora de última modificación.';
--
INSERT INTO centro_costo (id_empresa, nombre, id_tipo_empresa, id_tipo_ceco, id_padre, nivel, activo) VALUES
(1001, 'PRODUCCIÓN'			, 	95000, 95090, NULL, 1, TRUE),
(1001, 'ADMINISTRACION'		,   95000, 95091, NULL, 1, TRUE),
(1001, 'VENTAS'				, 	95000, 95092, NULL, 1, TRUE),
--                                                     
(1002, 'PRODUCCIÓN'			, 	95000, 95090, NULL, 1, TRUE),
(1002, 'ADMINISTRACION'		,   95000, 95091, NULL, 1, TRUE),
(1002, 'VENTAS'				, 	95000, 95092, NULL, 1, TRUE),
--                                                     
(1003, 'PRODUCCIÓN'			, 	95000, 95090, NULL, 1, TRUE),
(1003, 'ADMINISTRACION'		,   95000, 95091, NULL, 1, TRUE),
(1003, 'VENTAS'				, 	95000, 95092, NULL, 1, TRUE),
--                                                     
(1004, 'PRODUCCIÓN'			, 	95001, 95090, NULL, 1, TRUE),
(1004, 'ADMINISTRACION'		,   95001, 95091, NULL, 1, TRUE),
(1004, 'VENTAS'				, 	95001, 95092, NULL, 1, TRUE),
(1004, 'INICIAL'			, 	95001, 95090,   10, 2, TRUE),
(1004, 'PRIMARIA'			, 	95001, 95090,   10, 2, TRUE),
(1004, 'SECUNDARIA'			, 	95001, 95090,   10, 2, TRUE),
--                                                     
(1005, 'PRODUCCIÓN'			, 	95002, 95090, NULL, 1, TRUE),
(1005, 'ADMINISTRACION'		,   95002, 95091, NULL, 1, TRUE),
(1005, 'VENTAS'				, 	95002, 95092, NULL, 1, TRUE),
(1005, 'INICIAL'			, 	95002, 95090,   16, 2, TRUE),
(1005, 'PRIMARIA'			, 	95002, 95090,   16, 2, TRUE),
(1005, 'SECUNDARIA'			, 	95002, 95090,   16, 2, TRUE),
(1005, 'PRIMERA SELECCIÓN'	, 	95002, 95090,   16, 2, TRUE),
(1005, 'SEMESTRAL'			, 	95002, 95090,   16, 2, TRUE),
(1005, 'INTENSIVO'			, 	95002, 95090,   16, 2, TRUE),
(1005, 'CHINALCO'			, 	95002, 95090,   16, 2, TRUE),
--                                                     
(1006, 'PRODUCCIÓN'			, 	95000, 95090, NULL, 1, TRUE),
(1006, 'ADMINISTRACION'		,   95000, 95091, NULL, 1, TRUE),
(1006, 'VENTAS'				, 	95000, 95092, NULL, 1, TRUE),
--
(1007, 'PRODUCCIÓN'			, 	95003, 95090, NULL, 1, TRUE),
(1007, 'ADMINISTRACION'		,   95003, 95091, NULL, 1, TRUE),
(1007, 'VENTAS'				, 	95003, 95092, NULL, 1, TRUE),
(1007, 'CONSULTORIOS'		, 	95003, 95090,   29, 2, TRUE),
(1007, 'LABORATORIO'		, 	95003, 95090,   29, 2, TRUE),
(1007, 'FARMACIA'			, 	95003, 95090,   29, 2, TRUE),
(1007, 'HOSPITALIZACIÓN'	, 	95003, 95090,   29, 2, TRUE);






-- Tabla de campañas
CREATE TABLE campania (
    id_campania       BIGSERIAL PRIMARY KEY,
    id_empresa        INT NOT NULL,               -- clínica, colegio, etc.
    nombre            VARCHAR(200) NOT NULL,
    descripcion       TEXT,
    fecha_inicio      DATE NOT NULL,
    fecha_fin         DATE NOT NULL,
    aplica_membresia  BOOLEAN DEFAULT FALSE,      -- si aplica o no
    estado            VARCHAR(20) DEFAULT 'ACTIVO'  -- ACTIVO, FINALIZADO, PENDIENTE
);

-- Relación opcional: campaña ↔ membresía
CREATE TABLE campania_membresia (
    id_campania_membresia BIGSERIAL PRIMARY KEY,
    id_campania           BIGINT NOT NULL REFERENCES campania(id_campania),
    id_membresia          BIGINT NOT NULL REFERENCES membresia(id_membresia),
    descuento_porcentaje   NUMERIC(5,2),    -- ej: 20.00 %
    precio_especial        NUMERIC(12,2),   -- o precio fijo promocional
    observacion            TEXT
);



-- Campaña independiente (no asociada a membresía)
INSERT INTO campania (id_empresa, nombre, descripcion, fecha_inicio, fecha_fin, aplica_membresia)
VALUES (1007, 'Campaña de Vacunación Influenza', 'Descuento especial en vacuna contra influenza', 
        '2025-04-01', '2025-05-15', FALSE);

-- Campaña asociada a una membresía (ej: chequeo anual)
INSERT INTO campania (id_empresa, nombre, descripcion, fecha_inicio, fecha_fin, aplica_membresia)
VALUES (1007, 'Campaña Preventiva Octubre Rosa', 'Chequeo anual con descuento por prevención cáncer de mama',
        '2025-10-01', '2025-10-31', TRUE);

-- Relacionar campaña con membresía existente
INSERT INTO campania_membresia (id_campania, id_membresia, descuento_porcentaje)
VALUES (2, 5, 20.00);   -- campaña 2 aplica 20% descuento en membresía 5





-- ============================================================================
-- TABLA: proyectos_detalle
-- ============================================================================
DROP TABLE IF EXISTS proyectos_detalle CASCADE;
CREATE TABLE proyectos_detalle (
    id_proyecto        		SERIAL      	NOT NULL PRIMARY KEY,
    id_empresa				INT				NOT NULL,
    centro_costo_id    		BIGINT         NOT NULL REFERENCES centro_costo(id_centro_costo) ON DELETE CASCADE,
    tipo_proyecto      		VARCHAR(30)    NOT NULL CHECK (tipo_proyecto IN ('INFRAESTRUCTURA','TECNOLOGIA','EQUIPAMIENTO','CAPACITACION','MEJORA_PROCESOS','INVESTIGACION','OTROS')),
    estado             		VARCHAR(20)    NOT NULL DEFAULT 'PLANIFICACION' CHECK (estado IN ('PLANIFICACION','APROBADO','EN_EJECUCION','SUSPENDIDO','TERMINADO','CERRADO','CANCELADO')),
    fecha_inicio       		DATE,
    fecha_fin_planificada 	DATE,
    fecha_fin_real       	DATE,
    porcentaje_avance    	DECIMAL(5,2)   DEFAULT 0,
    observaciones        	TEXT
);

--
COMMENT ON TABLE proyectos_detalle IS 'Tabla de detalle para proyectos asociados a centros de costo tipo PROYECTO.';
COMMENT ON COLUMN proyectos_detalle.id_proyecto IS 'Identificador único del proyecto.';
COMMENT ON COLUMN proyectos_detalle.centro_costo_id IS 'Referencia al centro de costo al que pertenece el proyecto.';
COMMENT ON COLUMN proyectos_detalle.tipo_proyecto IS 'Clasificación del proyecto: INFRAESTRUCTURA, TECNOLOGIA, EQUIPAMIENTO, CAPACITACION, MEJORA_PROCESOS, INVESTIGACION u OTROS.';
COMMENT ON COLUMN proyectos_detalle.estado IS 'Estado actual del proyecto: PLANIFICACION, APROBADO, EN_EJECUCION, SUSPENDIDO, TERMINADO, CERRADO o CANCELADO.';
COMMENT ON COLUMN proyectos_detalle.fecha_inicio IS 'Fecha de inicio del proyecto.';
COMMENT ON COLUMN proyectos_detalle.fecha_fin_planificada IS 'Fecha planificada de finalización.';
COMMENT ON COLUMN proyectos_detalle.fecha_fin_real IS 'Fecha real de finalización.';
COMMENT ON COLUMN proyectos_detalle.porcentaje_avance IS 'Porcentaje de avance del proyecto.';
COMMENT ON COLUMN proyectos_detalle.observaciones IS 'Observaciones o notas adicionales del proyecto.';

-- PROYECTOS
/*
INSERT INTO proyectos_detalle (centro_costo_id, tipo_proyecto, estado, fecha_inicio, fecha_fin_planificada, porcentaje_avance)
VALUES
(5, 'INFRAESTRUCTURA', 'EN_EJECUCION', '2024-01-15', '2024-12-31', 45.50),  -- Pabellón EDU
(10, 'EQUIPAMIENTO', 'PLANIFICACION', NULL, '2024-10-31', 0.00),           -- Equipo SAL
(15, 'TECNOLOGIA', 'APROBADO', '2024-03-01', '2024-08-30', 0.00);          -- ERP COM
*/








-- ==========================================================
-- TABLA DE MEMBRESÍAS GENERICAS
-- ==========================================================
DROP TABLE IF EXISTS membresia CASCADE;
CREATE TABLE membresia (
    id_membresia     BIGSERIAL PRIMARY KEY,
    id_empresa       BIGINT NOT NULL,   -- referencia al negocio (colegio, academia, clínica, etc.)
    anio             INT NOT NULL,      -- año de vigencia
    id_nivel1        VARCHAR(100),      -- categoría principal (ej: primaria, preventivo, culturismo, SaaS-Retail)
    id_nivel2        VARCHAR(100),      -- subnivel (ej: tercer grado, premium, semestral, facturación_elec)
    id_nivel3        VARCHAR(100),      -- sección/subcategoría (ej: sección A, familia 4, fin de semana, erp_lite)
    id_turno         VARCHAR(50),       -- turno/acceso (ej: mañana, tarde, full, 24/7, no_aplica)
    duracion_meses   INT NOT NULL,      -- duración en meses
    auto_renovacion  BOOLEAN DEFAULT FALSE
);

-- ==========================================================
-- INSERTS DE EJEMPLO SEGÚN NEGOCIO
-- ==========================================================

-- Colegio (id_empresa=1004)
INSERT INTO membresia (id_empresa, anio, id_nivel1, id_nivel2, id_nivel3, id_turno, duracion_meses, auto_renovacion)
VALUES 
(1004, 2025, 'Primaria', 'Tercer grado', 'Seccion A', 'Mañana', 10, FALSE);

-- Academia (id_empresa=1005)
INSERT INTO membresia (id_empresa, anio, id_nivel1, id_nivel2, id_nivel3, id_turno, duracion_meses, auto_renovacion)
VALUES 
(1005, 2025, 'Primera selección', 'Grado único', 'Ciencias', 'Tarde', 3, FALSE);

-- Gimnasio (id_empresa=1009)
INSERT INTO membresia (id_empresa, anio, id_nivel1, id_nivel2, id_nivel3, id_turno, duracion_meses, auto_renovacion)
VALUES 
(1009, 2025, 'Culturismo', 'Semestral', 'Fin de semana', 'Variado', 6, FALSE);

-- SaaS (id_empresa=1001)
INSERT INTO membresia (id_empresa, anio, id_nivel1, id_nivel2, id_nivel3, id_turno, duracion_meses, auto_renovacion)
VALUES 
(1001, 2025, 'Retail', 'Facturacion_Elec', 'Mensual', 'No_aplica', 1, TRUE),
(1001, 2025, 'Propio', 'ERP_Lite', 'Anual', 'No_aplica', 12, TRUE);

-- Clínica (id_empresa=1007)
INSERT INTO membresia (id_empresa, anio, id_nivel1, id_nivel2, id_nivel3, id_turno, duracion_meses, auto_renovacion)
VALUES
(1007, 2025, 'Preventivo', 'Básico', 'Individual', 'Mañana', 12, FALSE),
(1007, 2025, 'General', 'Estándar', 'Pareja', 'Completo', 12, TRUE),
(1007, 2025, 'Especializado', 'Premium', 'Familia 4', '24/7', 12, TRUE),
(1007, 2025, 'Corporativo', 'Ejecutivo', 'Empresa <50', 'Completo', 12, TRUE);



select * from membresia;


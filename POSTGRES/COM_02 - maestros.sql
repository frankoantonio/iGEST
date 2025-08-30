-- ============================================================================
-- TABLA: producto_categoria
-- ============================================================================
DROP TABLE IF EXISTS producto_categoria;
CREATE TABLE producto_categoria (
	id_prod_cat		BIGSERIAL 		NOT NULL PRIMARY KEY,
	id_padre		BIGINT 			NULL,
	id_empresa      INT          	NOT NULL,
	cod_interno     VARCHAR(25)  	NOT NULL,
	nom_categoria	VARCHAR(100) 	NOT NULL,
    orden           INT          	NOT NULL,
    nivel			INT          	NOT NULL,
    final			BOOLEAN       	NOT NULL,
    descripcion		VARCHAR(100) 	NOT NULL,
    id_clase_sunat   BIGINT       	NULL REFERENCES producto_sunat(id_prod_sunat) ON DELETE RESTRICT ON UPDATE CASCADE
);
--
COMMENT ON TABLE producto_categoria IS 'Categorización interna de bienes o servicios.';
COMMENT ON COLUMN producto_categoria.id_prod_cat IS 'Identificador autoincremental.';
COMMENT ON COLUMN producto_categoria.id_padre IS 'Identificador padre.';
COMMENT ON COLUMN producto_categoria.id_empresa IS 'Identificador de empresa.';
COMMENT ON COLUMN producto_categoria.cod_interno IS 'Código interno de la categoría.';
COMMENT ON COLUMN producto_categoria.nom_categoria IS 'Nombre de la categoría interna.';
COMMENT ON COLUMN producto_categoria.orden IS 'Orden de visualización.';
COMMENT ON COLUMN producto_categoria.nivel IS 'Nivel de categorización.';
COMMENT ON COLUMN producto_categoria.final IS 'Sí es el último nivel.';
COMMENT ON COLUMN producto_categoria.descripcion IS 'Comentario relacionado al registro.';
COMMENT ON COLUMN producto_categoria.id_clase_sunat IS 'Referencia a la CLASE del catálogo SUNAT.';
--
INSERT INTO producto_categoria (id_padre, id_empresa, cod_interno, nom_categoria, orden, nivel, final, descripcion, id_clase_sunat) 
VALUES 
(NULL, 1001, 'TEC', 'Tecnología y Equipos Electrónicos'	,  1, 1, TRUE, 'Computadoras, impresoras, routers, proyectores, etc.'	, NULL),
(NULL, 1001, 'SOF', 'Software y Licencias'				,  2, 1, TRUE, 'Sistemas operativos, software contable, licencias SaaS'	, NULL),
(NULL, 1001, 'WEB', 'Hosting y Servicios en la Nube'	,  3, 1, TRUE, 'Hosting, dominios, AWS, Google Cloud, etc.', NULL),
(NULL, 1001, 'MOB', 'Mobiliario y Oficina'				,  4, 1, TRUE, 'Escritorios, sillas, archivadores, estaciones de trabajo', NULL),
(NULL, 1001, 'HER', 'Herramientas y Equipos'			,  5, 1, TRUE, 'Taladros, herramientas eléctricas o manuales, maquinaria básica', NULL),
(NULL, 1001, 'SUM', 'Suministros Generales'				,  6, 1, TRUE, 'Útiles, papelería, consumibles no duraderos', NULL),
(NULL, 1001, 'LIM', 'Limpieza e Higiene'				,  7, 1, TRUE, 'Detergentes, guantes, papel higiénico, desinfectantes', NULL),
(NULL, 1001, 'SEG', 'Seguridad y Protección'			,  8, 1, TRUE, 'EPP, cámaras, extintores, kits de seguridad', NULL),
(NULL, 1001, 'VEH', 'Vehículos y Transporte'			,  9, 1, TRUE, 'Vehículos, repuestos, servicios de transporte', NULL),
(NULL, 1001, 'CON', 'Construcción e Infraestructura'	, 10, 1, TRUE, 'Materiales, alquiler de maquinaria, servicios de construcción', NULL),
(NULL, 1001, 'ALI', 'Alimentos y Bebidas'				, 11, 1, TRUE, 'Agua, café, snacks, catering', NULL),
(NULL, 1001, 'EDU', 'Educación y Capacitación'			, 12, 1, TRUE, 'Cursos, seminarios, talleres, plataformas educativas', NULL),
(NULL, 1001, 'SAL', 'Salud y Bienestar'					, 13, 1, TRUE, 'Exámenes médicos, seguros, sillas ergonómicas', NULL),
(NULL, 1001, 'SER', 'Servicios Profesionales/Generales'	, 14, 1, TRUE, 'Consultoría, mantenimiento, servicios varios', NULL),
(NULL, 1001, 'PUB', 'Publicidad y Marketing'			, 15, 1, TRUE, 'Campañas digitales, impresos, diseño, community management', NULL);


-- ============================================================================
-- TABLA: producto_categoria
-- ============================================================================
DROP TABLE IF EXISTS producto_categoria;
CREATE TABLE producto_categoria (
	id_prod_cat		BIGSERIAL 		NOT NULL PRIMARY KEY,
	id_padre		BIGINT 			    NULL REFERENCES producto_categoria(id_prod_cat),
	id_empresa      INT          	NOT NULL,
	cod_interno     VARCHAR(10)  	NOT NULL,
	nom_categoria	VARCHAR(100) 	NOT NULL,
    orden           INT          	NOT NULL,
    nivel			INT          	NOT NULL,
    final			BOOLEAN       	NOT NULL,
    obs				VARCHAR(100) 	NOT NULL,
    id_clase_sunat   BIGINT       	NULL REFERENCES producto_sunat(id_prod_sunat) ON DELETE RESTRICT ON UPDATE CASCADE
);
--
COMMENT ON TABLE producto_categoria IS 'Categorización interna de bienes o servicios.';
COMMENT ON COLUMN producto_categoria.id_prod_cat IS 'Identificador autoincremental.';
COMMENT ON COLUMN producto_categoria.id_prod_cat IS 'Identificador padre.';
COMMENT ON COLUMN producto_categoria.id_empresa IS 'Identificador de la empresa.';
COMMENT ON COLUMN producto_categoria.cod_interno IS 'Código interno de la categoría.';
COMMENT ON COLUMN producto_categoria.nom_categoria IS 'Nombre de la categoría interna.';
COMMENT ON COLUMN producto_categoria.orden IS 'Orden de visualización.';
COMMENT ON COLUMN producto_categoria.nivel IS 'Nivel de categorización.';
COMMENT ON COLUMN producto_categoria.final IS 'Sí es el último nivel.';
COMMENT ON COLUMN producto_categoria.obs IS 'Comentario relacionado al registro.';
COMMENT ON COLUMN producto_categoria.id_clase_sunat IS 'Referencia a la CLASE del catálogo SUNAT.';
--
INSERT INTO producto_categoria (nom_categoria, cod_interno, orden, id_empresa, id_clase_sunat) 
VALUES  

( 1,  'SISTEMAS',                              'SIS', 1, 1001,  1),
( 2,  'WEB HOSTING',                           'WEB', 2, 1001,  2),
( 3,  'TECNOLOGÍA Y ELECTRÓNICA',              'TEC', 3, 1001,  3),
( 4,  'SEGURIDAD Y ACCESO',                    'SEG', 4, 1001,  3),
( 5,  'BIENES. SUMINISTROS. HERRAMIENTAS.',    'BIE', 5, 1001,  3),
( 6,  'SERVICIOS DIVERSOS',                    'SER', 6, 1001,  3),
( 7,  'MUEBLE. INMUEBLE. MAQUINARIA. EQUIPO',  'MAQ', 7, 1001,  3),

( 8,  'UNIFORME ESCOLAR',                      'UNF', 1, 1002,  3),
( 9,  'BUZO ESCOLAR',                          'BUZ', 2, 1002,  3),
(10,  'LIBROS',                                'LIB', 3, 1002,  3),
(11,  'PLAN LECTOR',                           'PLE', 4, 1002,  3),
(12,  'BIENES. SUMINISTROS. HERRAMIENTAS.',    'BIE', 5, 1002,  3),
(13,  'SERVICIOS DIVERSOS',                    'SER', 6, 1002,  3),
(14,  'MUEBLE. INMUEBLE. MAQUINARIA. EQUIPO',  'MAQ', 7, 1002,  3),

(15,  'LIBROS',                                'LIB', 1, 1003,  3),
(16,  'PLAN LECTOR',                           'PLE', 2, 1003,  3),
(17,  'BIENES. SUMINISTROS. HERRAMIENTAS.',    'BIE', 3, 1003,  3),
(18,  'SERVICIOS DIVERSOS',                    'SER', 4, 1003,  3),
(19,  'MUEBLE. INMUEBLE. MAQUINARIA. EQUIPO',  'MAQ', 5, 1003,  3),

(20,  'SERVICIOS GIMNASIO',                    'GIM', 1, 1004,  3),
(21,  'ARTÍCULOS DIVERSOS',                    'ART', 2, 1004,  3),
(22,  'BIENES. SUMINISTROS. HERRAMIENTAS.',    'BIE', 3, 1004,  3),
(23,  'SERVICIOS DIVERSOS',                    'SER', 4, 1004,  3),
(24,  'MUEBLE. INMUEBLE. MAQUINARIA. EQUIPO',  'MAQ', 5, 1004,  3),

(25,  'ALIMENTOS. BEBIDAS',                    'ALI', 1, 1005,  3),
(26,  'LIMPIEZA. HIGIENE. SEGURIDAD. SALUD',   'LIM', 2, 1005,  3),
(27,  'MUEBLES. DECORACIÓN',                  'MUE', 3, 1005,  3),
(28,  'TECNOLOGÍA. ELECTRÓNICA',              'TEC', 4, 1005,  3),
(29,  'ÚTILES. ACCESORIOS DE OFICINA',        'OFI', 5, 1005,  3),
(30,  'HERRAMIENTAS. UTENSILIOS',             'HER', 6, 1005,  3),
(31,  'SUMINISTROS DIVERSOS',                 'SUM', 3, 1005,  3),
(32,  'SERVICIOS DIVERSOS',                   'SER', 4, 1005,  3),
(33,  'INMUEBLE. MAQUINARIA. EQUIPO',         'MAQ', 5, 1005,  3),

(34,  'SERVICIOS EDUCATIVOS',                 'EDU', 1, 1005,  3),
(35,  'OTROS SERVICIOS EDUCATIVOS',           'OSE', 2, 1005,  3),
(36,  'OTROS INGRESOS OPERATIVOS',            'OIN', 3, 1005,  3),

(37,  'SERVICIOS EDUCATIVOS',                 'EDU', 1, 1005,  3),
(38,  'OTROS SERVICIOS EDUCATIVOS',           'OSE', 2, 1005,  3),
(39,  'OTROS INGRESOS OPERATIVOS',            'OIN', 3, 1005,  3),

(40,  'ALQUILERES POR HORA',                  'ALQ', 1, 1005,  3),
(41,  'OTROS INGRESOS OPERATIVOS',            'OIO', 2, 1005,  3),

(42,  'AUTOS, CAMIONETAS, VANS',              'AUT', 1, 1006,  3),
(43,  'CAMIONES, BUSES',                      'CAM', 2, 1006,  3),
(44,  'MAQUINARIA PESADA',                    'MAQ', 3, 1006,  3),
(45,  'REPUESTOS Y/O LUBRICANTES',            'REP', 4, 1006,  3),
(46,  'BIENES. SUMINISTROS. HERRAMIENTAS.',    'BIE', 5, 1



----------------------------------------------------------------------------------------------------------------------------------------
--producto_categoria--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS producto_categoria CASCADE;
CREATE TABLE producto_categoria (
    id_prod_cat         BIGSERIAL 		PRIMARY KEY,
    
    codigo_unspsc       VARCHAR(8) 		UNIQUE NOT NULL,
    nivel               SMALLINT NOT NULL CHECK (nivel BETWEEN 1 AND 4),
    nombre_producto     VARCHAR(100) 	NOT NULL,
    descripcion         TEXT,
    categoria_padre_id  INTEGER REFERENCES categorias_unspsc(id),
    
    
    segmento            VARCHAR(2)  	NOT NULL,
    familia             VARCHAR(2) 		NOT NULL,
    clase               VARCHAR(2) 		NOT NULL,
    producto            VARCHAR(2) 		NOT NULL,
    nombre_segmento     VARCHAR(100) 	NOT NULL,
    nombre_familia      VARCHAR(100) 	NOT NULL,
    nombre_clase        VARCHAR(100) 	NOT NULL,
    
    
    
    codigo_interno      VARCHAR(20),
    activo              BOOLEAN DEFAULT TRUE,
    fecha_creacion      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--
COMMENT ON TABLE categorias_unspsc IS 'Categorías de productos según estándar UNSPSC.';
COMMENT ON COLUMN categorias_unspsc.codigo_unspsc IS 'Código de 8 dígitos UNSPSC.';
COMMENT ON COLUMN categorias_unspsc.nivel IS '1=Segmento, 2=Familia, 3=Clase, 4=Producto.';
--
CREATE INDEX idx_categorias_unspsc_codigo ON categorias_unspsc(codigo_unspsc);
CREATE INDEX idx_categorias_unspsc_segmento ON categorias_unspsc(segmento);
CREATE INDEX idx_categorias_unspsc_padre ON categorias_unspsc(categoria_padre_id);
CREATE INDEX idx_categorias_unspsc_nivel ON categorias_unspsc(nivel);



----------------------------------------------------------------------------------------------------------------------------------------
--empresa--------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
--DROP TABLE IF EXISTS empresa CASCADE;
--CREATE TABLE empresa (
--    id_empresa          SERIAL PRIMARY KEY,
--    codigo_empresa      VARCHAR(20) UNIQUE NOT NULL,
--    razon_social        VARCHAR(250) NOT NULL,
--    nombre_comercial    VARCHAR(200),
--    ruc                 VARCHAR(11) UNIQUE NOT NULL,
--    activo              BOOLEAN DEFAULT TRUE,
--    fecha_creacion      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
--);
----
--COMMENT ON TABLE empresa IS 'Empresas del sistema.';
--COMMENT ON COLUMN empresa.codigo_empresa IS 'Código interno de la empresa.';
--COMMENT ON COLUMN empresa.razon_social IS 'Razón social de la empresa.';
--COMMENT ON COLUMN empresa.ruc IS 'RUC de la empresa.';

----------------------------------------------------------------------------------------------------------------------------------------
--sede-----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS sede CASCADE;
CREATE TABLE sede (
    id_sede             SERIAL PRIMARY KEY,
    id_empresa          INTEGER NOT NULL REFERENCES empresa(id_empresa),
    codigo_sede         VARCHAR(20) NOT NULL,
    nombre_sede         VARCHAR(200) NOT NULL,
    sede_padre_id       INTEGER REFERENCES sede(id_sede),
    nivel_jerarquia     INTEGER DEFAULT 1,
    direccion           VARCHAR(300),
    activo              BOOLEAN DEFAULT TRUE,
    fecha_creacion      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_empresa, codigo_sede)
);
--
COMMENT ON TABLE sede IS 'Sedes de las empresas con estructura jerárquica.';
COMMENT ON COLUMN sede.sede_padre_id IS 'Sede padre para jerarquía multinivel.';
COMMENT ON COLUMN sede.nivel_jerarquia IS 'Nivel en la jerarquía (1=raíz).';
--
CREATE INDEX idx_sede_empresa ON sede(id_empresa);
CREATE INDEX idx_sede_padre ON sede(sede_padre_id);
CREATE INDEX idx_sede_jerarquia ON sede(nivel_jerarquia);

----------------------------------------------------------------------------------------------------------------------------------------
--catalogo_productos--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS catalogo_productos CASCADE;
CREATE TABLE catalogo_productos (
    id_producto                 SERIAL PRIMARY KEY,
    codigo_interno              VARCHAR(50) NOT NULL,
    codigo_barras               VARCHAR(50),
    codigo_sunat                VARCHAR(8),
    nombre                      VARCHAR(250) NOT NULL,
    descripcion_corta           VARCHAR(500),
    descripcion_larga           TEXT,
    categoria_unspsc_id         INTEGER NOT NULL REFERENCES categorias_unspsc(id),
    tipo_producto               VARCHAR(20) DEFAULT 'PRODUCTO' CHECK (tipo_producto IN ('PRODUCTO', 'SERVICIO')),
    tipo_inventario             VARCHAR(20) DEFAULT 'INVENTARIABLE' CHECK (tipo_inventario IN ('INVENTARIABLE', 'NO_INVENTARIABLE', 'CONSUMIBLE')),
    permitir_venta              BOOLEAN DEFAULT TRUE,
    permitir_compra             BOOLEAN DEFAULT TRUE,
    permitir_patrimonio         BOOLEAN DEFAULT FALSE,
    permitir_consumo            BOOLEAN DEFAULT TRUE,
    precio_venta_defecto        NUMERIC(12,2),
    precio_compra_defecto       NUMERIC(12,2),
    margen_ganancia_defecto     NUMERIC(5,2),
    gestionar_stock             BOOLEAN DEFAULT TRUE,
    stock_critico               NUMERIC(10,2) DEFAULT 0,
    ubicacion_almacen           VARCHAR(50),
    unidad_medida_sunat         VARCHAR(5) DEFAULT 'NIU',
    unidad_medida_comercial     VARCHAR(20),
    stock_minimo                NUMERIC(10,2) DEFAULT 0,
    stock_maximo                NUMERIC(10,2) DEFAULT 0,
    punto_reorden               NUMERIC(10,2) DEFAULT 0,
    requiere_lote               BOOLEAN DEFAULT FALSE,
    requiere_vencimiento        BOOLEAN DEFAULT FALSE,
    requiere_serie              BOOLEAN DEFAULT FALSE,
    afecto_igv                  BOOLEAN DEFAULT TRUE,
    tipo_igv_sunat              SMALLINT DEFAULT 1,
    porcentaje_igv              NUMERIC(5,2) DEFAULT 18.00,
    es_activo_fijo              BOOLEAN DEFAULT FALSE,
    vida_util_anos              INTEGER,
    porcentaje_depreciacion     NUMERIC(5,2),
    cuenta_contable_activo      VARCHAR(20),
    cuenta_contable_gasto       VARCHAR(20),
    activo                      BOOLEAN DEFAULT TRUE,
    requiere_autorizacion       BOOLEAN DEFAULT FALSE,
    producto_controlado         BOOLEAN DEFAULT FALSE,
    usuario_creacion            INTEGER,
    fecha_creacion              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_actualizacion       INTEGER,
    fecha_actualizacion         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--
COMMENT ON TABLE catalogo_productos IS 'Catálogo general de productos para compra, venta y patrimonio.';
COMMENT ON COLUMN catalogo_productos.codigo_interno IS 'Código interno único del producto.';
COMMENT ON COLUMN catalogo_productos.tipo_producto IS 'PRODUCTO o SERVICIO.';
COMMENT ON COLUMN catalogo_productos.tipo_inventario IS 'Tipo de manejo de inventario.';
--
CREATE INDEX idx_catalogo_productos_codigo ON catalogo_productos(codigo_interno);
CREATE INDEX idx_catalogo_productos_barras ON catalogo_productos(codigo_barras);
CREATE INDEX idx_catalogo_productos_categoria ON catalogo_productos(categoria_unspsc_id);
CREATE INDEX idx_catalogo_productos_tipo ON catalogo_productos(tipo_producto);
CREATE INDEX idx_catalogo_productos_activo ON catalogo_productos(activo);

----------------------------------------------------------------------------------------------------------------------------------------
--producto_empresa----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS producto_empresa CASCADE;
CREATE TABLE producto_empresa (
    id                      SERIAL PRIMARY KEY,
    id_producto             INTEGER NOT NULL REFERENCES catalogo_productos(id_producto),
    id_empresa              INTEGER NOT NULL REFERENCES empresa(id_empresa),
    codigo_interno_empresa  VARCHAR(50),
    activo                  BOOLEAN DEFAULT TRUE,
    fecha_creacion          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_producto, id_empresa)
);
--
COMMENT ON TABLE producto_empresa IS 'Relación de productos habilitados por empresa.';
COMMENT ON COLUMN producto_empresa.codigo_interno_empresa IS 'Código específico del producto en la empresa.';
--
CREATE INDEX idx_producto_empresa_prod ON producto_empresa(id_producto);
CREATE INDEX idx_producto_empresa_emp ON producto_empresa(id_empresa);

----------------------------------------------------------------------------------------------------------------------------------------
--lista_precios_tipo--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS lista_precios_tipo CASCADE;
CREATE TABLE lista_precios_tipo (
    id_tipo                 SERIAL PRIMARY KEY,
    nombre                  VARCHAR(100) NOT NULL,
    descripcion             TEXT,
    es_default              BOOLEAN DEFAULT FALSE,
    activo                  BOOLEAN DEFAULT TRUE
);
--
COMMENT ON TABLE lista_precios_tipo IS 'Tipos de listas de precios (Normal, Mayorista, VIP, etc.).';
--
INSERT INTO lista_precios_tipo (nombre, descripcion, es_default, activo)
VALUES 
('GENERAL', 'Lista de precios general', true, true),
('MAYORISTA', 'Lista de precios para mayoristas', false, true),
('VIP', 'Lista de precios para clientes VIP', false, true);

----------------------------------------------------------------------------------------------------------------------------------------
--lista_precios-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS lista_precios CASCADE;
CREATE TABLE lista_precios (
    id                  SERIAL PRIMARY KEY,
    id_producto         INTEGER NOT NULL REFERENCES catalogo_productos(id_producto),
    id_empresa          INTEGER NOT NULL REFERENCES empresa(id_empresa),
    id_sede             INTEGER REFERENCES sede(id_sede),
    id_tipo_precio      INTEGER NOT NULL REFERENCES lista_precios_tipo(id_tipo),
    precio              NUMERIC(12,2) NOT NULL,
    moneda              VARCHAR(3) DEFAULT 'PEN',
    vigente_desde       DATE DEFAULT CURRENT_DATE,
    vigente_hasta       DATE,
    activo              BOOLEAN DEFAULT TRUE,
    fecha_creacion      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--
COMMENT ON TABLE lista_precios IS 'Precios de productos por empresa y sede.';
COMMENT ON COLUMN lista_precios.id_sede IS 'Si es NULL, aplica para toda la empresa. Si tiene valor, aplica para esa sede específica.';
--
CREATE INDEX idx_lista_precios_producto ON lista_precios(id_producto);
CREATE INDEX idx_lista_precios_empresa ON lista_precios(id_empresa);
CREATE INDEX idx_lista_precios_sede ON lista_precios(id_sede);
CREATE INDEX idx_lista_precios_vigencia ON lista_precios(vigente_desde, vigente_hasta);
CREATE UNIQUE INDEX idx_lista_precios_unique ON lista_precios(id_producto, id_empresa, COALESCE(id_sede, 0), id_tipo_precio, vigente_desde);

----------------------------------------------------------------------------------------------------------------------------------------
--campana-------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS campana CASCADE;
CREATE TABLE campana (
    id_campana          SERIAL PRIMARY KEY,
    id_empresa          INTEGER NOT NULL REFERENCES empresa(id_empresa),
    id_sede             INTEGER REFERENCES sede(id_sede),
    nombre              VARCHAR(200) NOT NULL,
    descripcion         TEXT,
    vigente_desde       DATE NOT NULL,
    vigente_hasta       DATE NOT NULL,
    activo              BOOLEAN DEFAULT TRUE,
    fecha_creacion      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--
COMMENT ON TABLE campana IS 'Campañas de precios especiales.';
COMMENT ON COLUMN campana.id_sede IS 'Si es NULL, aplica para toda la empresa.';
--
CREATE INDEX idx_campana_empresa ON campana(id_empresa);
CREATE INDEX idx_campana_sede ON campana(id_sede);
CREATE INDEX idx_campana_vigencia ON campana(vigente_desde, vigente_hasta);

----------------------------------------------------------------------------------------------------------------------------------------
--campana_precio------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS campana_precio CASCADE;
CREATE TABLE campana_precio (
    id                  SERIAL PRIMARY KEY,
    id_campana          INTEGER NOT NULL REFERENCES campana(id_campana),
    id_producto         INTEGER NOT NULL REFERENCES catalogo_productos(id_producto),
    id_tipo_precio      INTEGER NOT NULL REFERENCES lista_precios_tipo(id_tipo),
    precio              NUMERIC(12,2) NOT NULL,
    moneda              VARCHAR(3) DEFAULT 'PEN',
    activo              BOOLEAN DEFAULT TRUE,
    fecha_creacion      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_campana, id_producto, id_tipo_precio)
);
--
COMMENT ON TABLE campana_precio IS 'Precios específicos por campaña.';
--
CREATE INDEX idx_campana_precio_campana ON campana_precio(id_campana);
CREATE INDEX idx_campana_precio_producto ON campana_precio(id_producto);

----------------------------------------------------------------------------------------------------------------------------------------
--promocion_tipo------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS promocion_tipo CASCADE;
CREATE TABLE promocion_tipo (
    id_tipo             SERIAL PRIMARY KEY,
    nombre              VARCHAR(50) NOT NULL,
    descripcion         TEXT,
    activo              BOOLEAN DEFAULT TRUE
);
--
COMMENT ON TABLE promocion_tipo IS 'Tipos de promociones disponibles.';
--
INSERT INTO promocion_tipo (nombre, descripcion, activo)
VALUES 
('PORCENTAJE', 'Descuento porcentual', true),
('MONTO_FIJO', 'Descuento de monto fijo', true),
('COMBO_MISMO_PRODUCTO', 'Combo del mismo producto (2x1, 3x2, etc.)', true),
('COMBO_MISMO_PRECIO', 'Combo por mismo precio diferentes productos', true),
('BONIFICACION_MISMO', 'Bonificación del mismo producto', true),
('BONIFICACION_OTRO', 'Bonificación de otro producto', true);

----------------------------------------------------------------------------------------------------------------------------------------
--promocion-----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS promocion CASCADE;
CREATE TABLE promocion (
    id_promocion        SERIAL PRIMARY KEY,
    id_empresa          INTEGER NOT NULL REFERENCES empresa(id_empresa),
    id_sede             INTEGER REFERENCES sede(id_sede),
    id_tipo_promocion   INTEGER NOT NULL REFERENCES promocion_tipo(id_tipo),
    nombre              VARCHAR(200) NOT NULL,
    descripcion         TEXT,
    vigente_desde       DATE NOT NULL,
    vigente_hasta       DATE NOT NULL,
    activo              BOOLEAN DEFAULT TRUE,
    fecha_creacion      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--
COMMENT ON TABLE promocion IS 'Promociones por empresa y sede.';
COMMENT ON COLUMN promocion.id_sede IS 'Si es NULL, aplica para toda la empresa.';
--
CREATE INDEX idx_promocion_empresa ON promocion(id_empresa);
CREATE INDEX idx_promocion_sede ON promocion(id_sede);
CREATE INDEX idx_promocion_tipo ON promocion(id_tipo_promocion);
CREATE INDEX idx_promocion_vigencia ON promocion(vigente_desde, vigente_hasta);

----------------------------------------------------------------------------------------------------------------------------------------
--promocion_detalle---------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS promocion_detalle CASCADE;
CREATE TABLE promocion_detalle (
    id                      SERIAL PRIMARY KEY,
    id_promocion            INTEGER NOT NULL REFERENCES promocion(id_promocion),
    id_producto_aplicable   INTEGER NOT NULL REFERENCES catalogo_productos(id_producto),
    id_producto_bonificado  INTEGER REFERENCES catalogo_productos(id_producto),
    cantidad_requerida      INTEGER DEFAULT 1,
    cantidad_bonificada     INTEGER DEFAULT 0,
    descuento_porcentaje    NUMERIC(5,2),
    descuento_monto         NUMERIC(12,2),
    precio_fijo_combo       NUMERIC(12,2),
    activo                  BOOLEAN DEFAULT TRUE,
    fecha_creacion          TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--
COMMENT ON TABLE promocion_detalle IS 'Detalle de las promociones con productos aplicables y bonificados.';
COMMENT ON COLUMN promocion_detalle.id_producto_aplicable IS 'Producto al que se aplica la promoción.';
COMMENT ON COLUMN promocion_detalle.id_producto_bonificado IS 'Producto bonificado (puede ser diferente al aplicable).';
COMMENT ON COLUMN promocion_detalle.precio_fijo_combo IS 'Precio fijo para combos de mismo precio.';
--
CREATE INDEX idx_promocion_detalle_promocion ON promocion_detalle(id_promocion);
CREATE INDEX idx_promocion_detalle_producto_apl ON promocion_detalle(id_producto_aplicable);
CREATE INDEX idx_promocion_detalle_producto_bon ON promocion_detalle(id_producto_bonificado);

----------------------------------------------------------------------------------------------------------------------------------------
--producto_transacciones_tipos----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS producto_transacciones_tipos CASCADE;
CREATE TABLE producto_transacciones_tipos (
    id                      SERIAL PRIMARY KEY,
    id_producto             INTEGER NOT NULL REFERENCES catalogo_productos(id_producto),
    tipo_transaccion        VARCHAR(20) NOT NULL CHECK (tipo_transaccion IN ('COMPRA', 'VENTA', 'PATRIMONIO', 'CONSUMO', 'PRODUCCION')),
    activo                  BOOLEAN DEFAULT TRUE,
    codigo_especifico       VARCHAR(50),
    descripcion_uso         VARCHAR(200),
    precio_referencia       NUMERIC(12,2),
    moneda                  VARCHAR(3) DEFAULT 'PEN',
    incluye_igv             BOOLEAN DEFAULT TRUE,
    unidad_medida           VARCHAR(10),
    factor_conversion       NUMERIC(10,6) DEFAULT 1,
    stock_minimo            NUMERIC(10,2) DEFAULT 0,
    stock_maximo            NUMERIC(10,2) DEFAULT 0,
    cuenta_contable_debe    VARCHAR(20),
    cuenta_contable_haber   VARCHAR(20),
    centro_costo_defecto    VARCHAR(20),
    tipo_igv_sunat          SMALLINT DEFAULT 1,
    codigo_sunat_especifico VARCHAR(8),
    genera_activo_fijo      BOOLEAN DEFAULT FALSE,
    vida_util_estimada      INTEGER,
    metodo_depreciacion     VARCHAR(20) DEFAULT 'LINEAL' CHECK (metodo_depreciacion IN ('LINEAL', 'ACELERADA', 'UNIDADES')),
    valor_residual_pct      NUMERIC(5,2) DEFAULT 0,
    proveedor_preferido_id  INTEGER,
    tiempo_entrega_dias     INTEGER,
    cantidad_minima_pedido  NUMERIC(10,2) DEFAULT 1,
    canal_venta_defecto     VARCHAR(50),
    permite_descuento       BOOLEAN DEFAULT TRUE,
    descuento_maximo_pct    NUMERIC(5,2) DEFAULT 0,
    fecha_creacion          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_creacion        INTEGER,
    UNIQUE(id_producto, tipo_transaccion)
);
--
COMMENT ON TABLE producto_transacciones_tipos IS 'Configuración específica de productos por tipo de transacción.';
--
CREATE INDEX idx_producto_transacciones_producto ON producto_transacciones_tipos(id_producto);
CREATE INDEX idx_producto_transacciones_tipo ON producto_transacciones_tipos(tipo_transaccion);

----------------------------------------------------------------------------------------------------------------------------------------
--FUNCIONES DE SOPORTE------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

-- Función para obtener precio efectivo considerando jerarquía de sedes y campañas
CREATE OR REPLACE FUNCTION obtener_precio_efectivo(
    p_id_producto INTEGER,
    p_id_empresa INTEGER,
    p_id_sede INTEGER DEFAULT NULL,
    p_id_tipo_precio INTEGER DEFAULT 1,
    p_fecha DATE DEFAULT CURRENT_DATE
) RETURNS NUMERIC(12,2) AS $$
DECLARE
    v_precio NUMERIC(12,2);
    v_sede_actual INTEGER;
BEGIN
    -- 1. Buscar precio de campaña vigente (prioridad más alta)
    SELECT cp.precio INTO v_precio
    FROM campana_precio cp
    INNER JOIN campana c ON cp.id_campana = c.id_campana
    WHERE cp.id_producto = p_id_producto
      AND c.id_empresa = p_id_empresa
      AND (c.id_sede = p_id_sede OR (c.id_sede IS NULL AND p_id_sede IS NOT NULL))
      AND cp.id_tipo_precio = p_id_tipo_precio
      AND c.vigente_desde <= p_fecha
      AND c.vigente_hasta >= p_fecha
      AND c.activo = TRUE
      AND cp.activo = TRUE
    ORDER BY c.id_sede NULLS LAST
    LIMIT 1;
    
    IF v_precio IS NOT NULL THEN
        RETURN v_precio;
    END IF;
    
    -- 2. Buscar precio en lista normal, considerando jerarquía de sedes
    v_sede_actual := p_id_sede;
    
    WHILE v_sede_actual IS NOT NULL LOOP
        SELECT lp.precio INTO v_precio
        FROM lista_precios lp
        WHERE lp.id_producto = p_id_producto
          AND lp.id_empresa = p_id_empresa
          AND lp.id_sede = v_sede_actual
          AND lp.id_tipo_precio = p_id_tipo_precio
          AND (lp.vigente_desde <= p_fecha)
          AND (lp.vigente_hasta IS NULL OR lp.vigente_hasta >= p_fecha)
          AND lp.activo = TRUE;
        
        IF v_precio IS NOT NULL THEN
            RETURN v_precio;
        END IF;
        
        -- Subir un nivel en la jerarquía
        SELECT sede_padre_id INTO v_sede_actual
        FROM sede
        WHERE id_sede = v_sede_actual;
    END LOOP;
    
    -- 3. Buscar precio a nivel empresa (sin sede específica)
    SELECT lp.precio INTO v_precio
    FROM lista_precios lp
    WHERE lp.id_producto = p_id_producto
      AND lp.id_empresa = p_id_empresa
      AND lp.id_sede IS NULL
      AND lp.id_tipo_precio = p_id_tipo_precio
      AND (lp.vigente_desde <= p_fecha)
      AND (lp.vigente_hasta IS NULL OR lp.vigente_hasta >= p_fecha)
      AND lp.activo = TRUE;
    
    IF v_precio IS NOT NULL THEN
        RETURN v_precio;
    END IF;
    
    -- 4. Precio por defecto del producto
    SELECT precio_venta_defecto INTO v_precio
    FROM catalogo_productos
    WHERE id_producto = p_id_producto;
    
    RETURN COALESCE(v_precio, 0);
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION obtener_precio_efectivo IS 'Obtiene el precio efectivo considerando campañas, jerarquía de sedes y lista de precios.';

----------------------------------------------------------------------------------------------------------------------------------------
--TRIGGERS PARA ACTUALIZACIÓN DE TIMESTAMPS---------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

-- Función para actualizar timestamp
CREATE OR REPLACE FUNCTION actualizar_fecha_modificacion()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_actualizacion = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Aplicar triggers a las tablas principales
CREATE TRIGGER trigger_categorias_unspsc_update BEFORE UPDATE ON categorias_unspsc FOR EACH ROW EXECUTE FUNCTION actualizar_fecha_modificacion();
CREATE TRIGGER trigger_catalogo_productos_update BEFORE UPDATE ON catalogo_productos FOR EACH ROW EXECUTE FUNCTION actualizar_fecha_modificacion();
CREATE TRIGGER trigger_lista_precios_update BEFORE UPDATE ON lista_precios FOR EACH ROW EXECUTE FUNCTION actualizar_fecha_modificacion();
CREATE TRIGGER trigger_campana_update BEFORE UPDATE ON campana FOR EACH ROW EXECUTE FUNCTION actualizar_fecha_modificacion();
CREATE TRIGGER trigger_promocion_update BEFORE UPDATE ON promocion FOR EACH ROW EXECUTE FUNCTION actualizar_fecha_modificacion();
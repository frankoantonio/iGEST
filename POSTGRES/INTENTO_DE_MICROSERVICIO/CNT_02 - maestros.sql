-- ============================================================================
-- TABLA: cuenta_contable
-- ============================================================================
DROP TABLE IF EXISTS cuenta_contable CASCADE;
CREATE TABLE cuenta_contable (
    id_cuenta               SERIAL          NOT NULL PRIMARY KEY,
    id_padre                INT             NULL REFERENCES cuenta_contable(id_cuenta),
    anio                    INT             NOT NULL CHECK (anio>=2020 AND anio<=2100),
    grupo					VARCHAR(20)     NOT NULL CHECK (grupo IN ('ACTIVO','PASIVO + PATRIMONIO','')),
    nivel                   INT             NOT NULL,
    orden                   INT             NOT NULL,
    activo                  BOOLEAN         NOT NULL DEFAULT TRUE,
    codigo                  VARCHAR(20)     NOT NULL,
    nombre                  VARCHAR(200)    NOT NULL,
    es_titular              BOOLEAN         NOT NULL,
	tipo_cuenta             VARCHAR(20)     NOT NULL CHECK (tipo_cuenta IN ('ACTIVO','PASIVO','PATRIMONIO','INGRESOS','GASTOS','ORDEN')),
    naturaleza              VARCHAR(20)     NOT NULL CHECK (naturaleza IN ('DEUDORA','ACREEDORA')),
    estado_financiero       VARCHAR(20)     NOT NULL CHECK (estado_financiero IN ('BALANCE','RESULTADOS','ORDEN','PATRIMONIO')),
    tipo_flujo              VARCHAR(20)     NOT NULL CHECK (tipo_flujo IN ('OPERACION','INVERSION','FINANCIAMIENTO','NO_APLICA')),    
    fe_registra             TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fe_modifica             TIMESTAMP       NULL,
    UNIQUE (anio, codigo)
);
--
CREATE INDEX ON cuenta_contable(id_padre);
CREATE INDEX ON cuenta_contable(tipo_cuenta,orden);
CREATE INDEX ON cuenta_contable(naturaleza);
CREATE INDEX ON cuenta_contable(estado_financiero);
CREATE INDEX ON cuenta_contable(tipo_flujo);
--
COMMENT ON TABLE cuenta_contable IS 'Tabla del Plan Contable General.';
COMMENT ON COLUMN cuenta_contable.id_cuenta IS 'Identificador de la cuenta contable.';
COMMENT ON COLUMN cuenta_contable.id_padre IS 'Referencia a la cuenta padre para estructura jerárquica, NULL para cuentas nivel 1.';
COMMENT ON COLUMN cuenta_contable.anio IS 'Año en que se aprobó la cuenta.';
COMMENT ON COLUMN cuenta_contable.grupo IS 'Grupo principal de la cuenta: ACTIVO, PASIVO + PATRIMONIO.';
COMMENT ON COLUMN cuenta_contable.nivel IS 'Nivel jerárquico: 1=Elemento, 2=Rubro, 3=Cuenta, 4=Subcuenta, 5=Auxiliar.';
COMMENT ON COLUMN cuenta_contable.orden IS 'Secuencia numérica para ordenamiento.';
COMMENT ON COLUMN cuenta_contable.activo IS 'TRUE=Cuenta habilitada para uso, FALSE=Cuenta dada de baja o inactiva.';
COMMENT ON COLUMN cuenta_contable.codigo IS 'Código contable único (ej: 1, 10, 101, 1011, 101101).';
COMMENT ON COLUMN cuenta_contable.nombre IS 'Denominación oficial de la cuenta contable (ej: Caja, Bancos, Efectivo).';
COMMENT ON COLUMN cuenta_contable.es_titular IS 'TRUE=Cuenta de movimiento (acepta asientos contables), FALSE=Solo agrupación.';
COMMENT ON COLUMN cuenta_contable.tipo_cuenta IS 'Clasificación principal: ACTIVO, PASIVO, PATRIMONIO, INGRESOS, GASTOS, ORDEN.';
COMMENT ON COLUMN cuenta_contable.naturaleza IS 'Naturaleza contable: DEUDORA (aumenta al debe), ACREEDORA (aumenta al haber).';
COMMENT ON COLUMN cuenta_contable.estado_financiero IS 'Estado financiero donde se presenta: BALANCE, RESULTADOS, ORDEN, PATRIMONIO.';
COMMENT ON COLUMN cuenta_contable.tipo_flujo IS 'Clasificación para flujo de efectivo (NIC 7): OPERACION, INVERSION, FINANCIAMIENTO, NO_APLICA.';
COMMENT ON COLUMN cuenta_contable.fe_registra IS 'Fecha de registro de la cuenta.';
COMMENT ON COLUMN cuenta_contable.fe_modifica IS 'Última fecha de modificación.';
-- ===============================================================
-- NIVEL 1
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
(NULL, 2020, 'ACTIVO', 1, 1000, '1', 'ACTIVO DISPONIBLE Y EXIGIBLE', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
(NULL, 2020, 'ACTIVO', 1, 2000, '2', 'ACTIVO REALIZABLE', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
(NULL, 2020, 'ACTIVO', 1, 3000, '3', 'ACTIVO INMOVILIZADO', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
(NULL, 2020, 'PASIVO + PATRIMONIO', 1, 4000, '4', 'PASIVO', FALSE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'NO_APLICA'),
(NULL, 2020, 'PASIVO + PATRIMONIO', 1, 5000, '5', 'PATRIMONIO NETO', FALSE, 'PATRIMONIO', 'ACREEDORA', 'BALANCE', 'NO_APLICA'),
(NULL, 2020, '', 1, 6000, '6', 'GASTOS POR NATURALEZA', FALSE, 'GASTOS', 'DEUDORA', 'RESULTADOS', 'NO_APLICA'),
(NULL, 2020, '', 1, 7000, '7', 'INGRESOS POR NATURALEZA', FALSE, 'INGRESOS', 'ACREEDORA', 'RESULTADOS', 'NO_APLICA'),
(NULL, 2020, '', 1, 8000, '8', 'SALDOS INTERMEDIARIOS DE GESTIÓN Y CIERRE', FALSE, 'ORDEN', 'DEUDORA', 'RESULTADOS', 'NO_APLICA'),
(NULL, 2020, '', 1, 9000, '9', 'CONTABILIDAD ANALÍTICA DE EXPLOTACIÓN: COSTOS DE PRODUCCIÓN Y GASTOS POR FUNCIÓN', FALSE, 'ORDEN', 'DEUDORA', 'RESULTADOS', 'NO_APLICA'),
(NULL, 2020, '', 1, 10000, '0', 'CUENTAS DE ORDEN', FALSE, 'ORDEN', 'DEUDORA', 'ORDEN', 'NO_APLICA');
-- ===============================================================
-- NIVEL 2: Rubros bajo Elemento 1 - ACTIVO DISPONIBLE Y EXIGIBLE
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
(1, 2020, 'ACTIVO', 2, 1100, '10', 'EFECTIVO Y EQUIVALENTES DE EFECTIVO', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
(1, 2020, 'ACTIVO', 2, 1200, '11', 'INVERSIONES FINANCIERAS', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION'),
(1, 2020, 'ACTIVO', 2, 1300, '12', 'CUENTAS POR COBRAR COMERCIALES', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
(1, 2020, 'ACTIVO', 2, 1400, '13', 'OTRAS CUENTAS POR COBRAR', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
(1, 2020, 'ACTIVO', 2, 1500, '14', 'INVENTARIOS', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
(1, 2020, 'ACTIVO', 2, 1600, '15', 'ACTIVOS BIOLÓGICOS', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
(1, 2020, 'ACTIVO', 2, 1700, '16', 'ACTIVOS INTANGIBLES', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
(1, 2020, 'ACTIVO', 2, 1800, '17', 'PROPIEDAD, PLANTA Y EQUIPO', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
(1, 2020, 'ACTIVO', 2, 1900, '18', 'OTROS ACTIVOS NO CORRIENTES', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA');
-- ===============================================================
-- NIVEL 3: Rubros bajo Elemento 1 - ACTIVO DISPONIBLE Y EXIGIBLE
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='10' AND anio=2020), 2020, 'ACTIVO', 3, 1110, '101', 'Caja', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='10' AND anio=2020), 2020, 'ACTIVO', 3, 1120, '102', 'Bancos', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='10' AND anio=2020), 2020, 'ACTIVO', 3, 1130, '103', 'Depósitos a la vista', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='10' AND anio=2020), 2020, 'ACTIVO', 3, 1140, '104', 'Otros equivalentes de efectivo', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='11' AND anio=2020), 2020, 'ACTIVO', 3, 1210, '110', 'Inversiones en valores negociables', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='11' AND anio=2020), 2020, 'ACTIVO', 3, 1220, '111', 'Inversiones en instrumentos financieros', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='11' AND anio=2020), 2020, 'ACTIVO', 3, 1230, '112', 'Inversiones en instrumentos de deuda', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='11' AND anio=2020), 2020, 'ACTIVO', 3, 1240, '113', 'Inversiones en instrumentos de patrimonio', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='12' AND anio=2020), 2020, 'ACTIVO', 3, 1310, '120', 'Clientes', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='12' AND anio=2020), 2020, 'ACTIVO', 3, 1320, '121', 'Cuentas por cobrar a clientes nacionales', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='12' AND anio=2020), 2020, 'ACTIVO', 3, 1330, '122', 'Cuentas por cobrar a clientes extranjeros', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='12' AND anio=2020), 2020, 'ACTIVO', 3, 1340, '123', 'Cuentas por cobrar a entidades relacionadas', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='13' AND anio=2020), 2020, 'ACTIVO', 3, 1410, '130', 'Cuentas por cobrar a personal', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='13' AND anio=2020), 2020, 'ACTIVO', 3, 1420, '131', 'Cuentas por cobrar a accionistas', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='13' AND anio=2020), 2020, 'ACTIVO', 3, 1430, '132', 'Cuentas por cobrar a proveedores', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='13' AND anio=2020), 2020, 'ACTIVO', 3, 1440, '133', 'Otras cuentas por cobrar diversas', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='14' AND anio=2020), 2020, 'ACTIVO', 3, 1510, '140', 'Materia prima', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='14' AND anio=2020), 2020, 'ACTIVO', 3, 1520, '141', 'Productos en proceso', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='14' AND anio=2020), 2020, 'ACTIVO', 3, 1530, '142', 'Productos terminados', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='14' AND anio=2020), 2020, 'ACTIVO', 3, 1540, '143', 'Mercaderías', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='15' AND anio=2020), 2020, 'ACTIVO', 3, 1610, '150', 'Ganado', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='15' AND anio=2020), 2020, 'ACTIVO', 3, 1620, '151', 'Plantaciones', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='15' AND anio=2020), 2020, 'ACTIVO', 3, 1630, '152', 'Otros activos biológicos', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='16' AND anio=2020), 2020, 'ACTIVO', 3, 1710, '160', 'Propiedad intelectual', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='16' AND anio=2020), 2020, 'ACTIVO', 3, 1720, '161', 'Derechos de autor', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='16' AND anio=2020), 2020, 'ACTIVO', 3, 1730, '162', 'Patentes', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='16' AND anio=2020), 2020, 'ACTIVO', 3, 1740, '163', 'Marcas', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='17' AND anio=2020), 2020, 'ACTIVO', 3, 1810, '170', 'Terrenos', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='17' AND anio=2020), 2020, 'ACTIVO', 3, 1820, '171', 'Edificaciones', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='17' AND anio=2020), 2020, 'ACTIVO', 3, 1830, '172', 'Maquinaria', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='17' AND anio=2020), 2020, 'ACTIVO', 3, 1840, '173', 'Mobiliario y equipo', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='18' AND anio=2020), 2020, 'ACTIVO', 3, 1910, '180', 'Inversiones en asociadas y otras participaciones', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='18' AND anio=2020), 2020, 'ACTIVO', 3, 1920, '181', 'Activos por impuestos diferidos', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='18' AND anio=2020), 2020, 'ACTIVO', 3, 1930, '182', 'Otros activos no corrientes', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA');
-- ===============================================================
-- NIVEL 2: Rubros bajo Elemento 2 - ACTIVO REALIZABLE
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo)
VALUES
(2, 2020, 'ACTIVO', 2, 2100, '20', 'CUENTAS POR COBRAR A CORTO PLAZO', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
(2, 2020, 'ACTIVO', 2, 2200, '21', 'INVERSIONES FINANCIERAS A MEDIANO PLAZO', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION'),
(2, 2020, 'ACTIVO', 2, 2300, '22', 'CUENTAS POR COBRAR A LARGO PLAZO', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
(2, 2020, 'ACTIVO', 2, 2400, '23', 'OTROS ACTIVOS REALIZABLES', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION');
-- ===============================================================
-- NIVEL 3: Rubros bajo Elemento 2 - ACTIVO REALIZABLE
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo)
VALUES
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='20' AND anio=2020), 2020, 'ACTIVO', 3, 2110, '200', 'Clientes a corto plazo', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='20' AND anio=2020), 2020, 'ACTIVO', 3, 2120, '201', 'Cuentas por cobrar a empleados', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='20' AND anio=2020), 2020, 'ACTIVO', 3, 2130, '202', 'Cuentas por cobrar a accionistas', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='21' AND anio=2020), 2020, 'ACTIVO', 3, 2210, '210', 'Inversiones en valores no negociables', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='21' AND anio=2020), 2020, 'ACTIVO', 3, 2220, '211', 'Depósitos a plazo', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='22' AND anio=2020), 2020, 'ACTIVO', 3, 2310, '220', 'Cuentas por cobrar a clientes a largo plazo', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='22' AND anio=2020), 2020, 'ACTIVO', 3, 2320, '221', 'Cuentas por cobrar a empleados a largo plazo', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='22' AND anio=2020), 2020, 'ACTIVO', 3, 2330, '222', 'Cuentas por cobrar a accionistas a largo plazo', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='23' AND anio=2020), 2020, 'ACTIVO', 3, 2410, '230', 'Anticipos a proveedores', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='23' AND anio=2020), 2020, 'ACTIVO', 3, 2420, '231', 'Gastos pagados por anticipado', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='23' AND anio=2020), 2020, 'ACTIVO', 3, 2430, '232', 'Otros activos realizables', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'OPERACION');
-- ===============================================================
-- NIVEL 2: Rubros bajo Elemento 3 - ACTIVO INMOVILIZADO
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
(3, 2020, 'ACTIVO', 2, 3100, '30', 'PROPIEDAD, PLANTA Y EQUIPO', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
(3, 2020, 'ACTIVO', 2, 3200, '31', 'ACTIVOS INTANGIBLES NO CORRIENTES', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
(3, 2020, 'ACTIVO', 2, 3300, '32', 'OTROS ACTIVOS INMOVILIZADOS', FALSE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA');
-- ===============================================================
-- NIVEL 3: Rubros bajo Elemento 3 - ACTIVO INMOVILIZADO
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='30' AND anio=2020), 2020, 'ACTIVO', 3, 3110, '300', 'Terrenos', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='30' AND anio=2020), 2020, 'ACTIVO', 3, 3120, '301', 'Edificaciones', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='30' AND anio=2020), 2020, 'ACTIVO', 3, 3130, '302', 'Maquinaria', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='30' AND anio=2020), 2020, 'ACTIVO', 3, 3140, '303', 'Mobiliario y equipo', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='30' AND anio=2020), 2020, 'ACTIVO', 3, 3150, '304', 'Equipos de transporte', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='31' AND anio=2020), 2020, 'ACTIVO', 3, 3210, '310', 'Propiedad intelectual', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='31' AND anio=2020), 2020, 'ACTIVO', 3, 3220, '311', 'Derechos de autor', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='31' AND anio=2020), 2020, 'ACTIVO', 3, 3230, '312', 'Patentes', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='31' AND anio=2020), 2020, 'ACTIVO', 3, 3240, '313', 'Marcas', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='32' AND anio=2020), 2020, 'ACTIVO', 3, 3310, '320', 'Depósitos en garantía', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='32' AND anio=2020), 2020, 'ACTIVO', 3, 3320, '321', 'Préstamos a largo plazo', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'INVERSION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='32' AND anio=2020), 2020, 'ACTIVO', 3, 3330, '322', 'Otros activos inmovilizados', TRUE, 'ACTIVO', 'DEUDORA', 'BALANCE', 'NO_APLICA');
-- ===============================================================
-- NIVEL 2: Rubros bajo Elemento 4 - PASIVO
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
(4, 2020, 'PASIVO + PATRIMONIO', 2, 4100, '40', 'PASIVO CORRIENTE', FALSE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'OPERACION'),
(4, 2020, 'PASIVO + PATRIMONIO', 2, 4200, '41', 'PASIVO NO CORRIENTE', FALSE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'INVERSION');
-- ===============================================================
-- NIVEL 3: Rubros bajo Elemento 4 - PASIVO
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='40' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 4110, '400', 'Proveedores', TRUE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='40' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 4120, '401', 'Documentos por pagar', TRUE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='40' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 4130, '402', 'Obligaciones laborales', TRUE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='40' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 4140, '403', 'Obligaciones tributarias', TRUE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='40' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 4150, '404', 'Otros pasivos corrientes', TRUE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='41' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 4210, '410', 'Préstamos y obligaciones financieras a largo plazo', TRUE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'INVERSION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='41' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 4220, '411', 'Provisiones a largo plazo', TRUE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='41' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 4230, '412', 'Obligaciones laborales a largo plazo', TRUE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='41' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 4240, '413', 'Otros pasivos no corrientes', TRUE, 'PASIVO', 'ACREEDORA', 'BALANCE', 'OPERACION');
-- ===============================================================
-- NIVEL 2: Rubros bajo Elemento 5 - PATRIMONIO NETO
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
(5, 2020, 'PASIVO + PATRIMONIO', 2, 5100, '50', 'CAPITAL SOCIAL', FALSE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
(5, 2020, 'PASIVO + PATRIMONIO', 2, 5200, '51', 'RESULTADOS ACUMULADOS', FALSE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
(5, 2020, 'PASIVO + PATRIMONIO', 2, 5300, '52', 'RESERVAS', FALSE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
(5, 2020, 'PASIVO + PATRIMONIO', 2, 5400, '53', 'OTROS COMPONENTES DEL PATRIMONIO', FALSE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA');
-- ===============================================================
-- NIVEL 3: Rubros bajo Elemento 5 - PATRIMONIO NETO
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='50' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 5110, '500', 'Capital suscrito', TRUE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='50' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 5120, '501', 'Capital pagado', TRUE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='51' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 5210, '510', 'Utilidades retenidas', TRUE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='51' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 5220, '511', 'Pérdidas acumuladas', TRUE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='52' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 5310, '520', 'Reserva legal', TRUE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='52' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 5320, '521', 'Reserva estatutaria', TRUE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='52' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 5330, '522', 'Otras reservas', TRUE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='53' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 5410, '530', 'Aportes para futuros aumentos de capital', TRUE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='53' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 5420, '531', 'Resultados por revaluación', TRUE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='53' AND anio=2020), 2020, 'PASIVO + PATRIMONIO', 3, 5430, '532', 'Otros resultados integrales', TRUE, 'PATRIMONIO', 'ACREEDORA', 'PATRIMONIO', 'NO_APLICA');
-- ===============================================================
-- NIVEL 2: Rubros bajo Elemento 6 - GASTOS POR NATURALEZA
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
(6, 2020, '', 2, 6100, '60', 'GASTOS OPERATIVOS', FALSE, 'GASTOS', 'DEUDORA', 'RESULTADOS', 'OPERACION'),
(6, 2020, '', 2, 6200, '61', 'GASTOS FINANCIEROS', FALSE, 'GASTOS', 'DEUDORA', 'RESULTADOS', 'OPERACION'),
(6, 2020, '', 2, 6300, '62', 'GASTOS EXTRAORDINARIOS', FALSE, 'GASTOS', 'DEUDORA', 'RESULTADOS', 'OPERACION');
-- ===============================================================
-- NIVEL 3: Rubros bajo Elemento 6 - GASTOS POR NATURALEZA
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='60' AND anio=2020), 2020, '', 3, 6110, '600', 'Sueldos y salarios', TRUE, 'GASTOS', 'DEUDORA', 'RESULTADOS', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='60' AND anio=2020), 2020, '', 3, 6120, '601', 'Servicios prestados por terceros', TRUE, 'GASTOS', 'DEUDORA', 'RESULTADOS', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='60' AND anio=2020), 2020, '', 3, 6130, '602', 'Depreciación y amortización', TRUE, 'GASTOS', 'DEUDORA', 'RESULTADOS', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='61' AND anio=2020), 2020, '', 3, 6210, '610', 'Intereses pagados', TRUE, 'GASTOS', 'DEUDORA', 'RESULTADOS', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='62' AND anio=2020), 2020, '', 3, 6310, '620', 'Pérdidas por siniestros', TRUE, 'GASTOS', 'DEUDORA', 'RESULTADOS', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='62' AND anio=2020), 2020, '', 3, 6320, '621', 'Otros gastos extraordinarios', TRUE, 'GASTOS', 'DEUDORA', 'RESULTADOS', 'OPERACION');
-- ===============================================================
-- NIVEL 2: Rubros bajo Elemento 7 - INGRESOS POR NATURALEZA
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
(7, 2020, '', 2, 7100, '70', 'INGRESOS OPERATIVOS', FALSE, 'INGRESOS', 'ACREEDORA', 'RESULTADOS', 'OPERACION'),
(7, 2020, '', 2, 7200, '71', 'INGRESOS FINANCIEROS', FALSE, 'INGRESOS', 'ACREEDORA', 'RESULTADOS', 'OPERACION'),
(7, 2020, '', 2, 7300, '72', 'INGRESOS EXTRAORDINARIOS', FALSE, 'INGRESOS', 'ACREEDORA', 'RESULTADOS', 'OPERACION');
-- ===============================================================
-- NIVEL 3: Rubros bajo Elemento 7 - INGRESOS POR NATURALEZA
-- ===============================================================
INSERT INTO cuenta_contable (id_padre, anio, grupo, nivel, orden, codigo, nombre, es_titular, tipo_cuenta, naturaleza, estado_financiero, tipo_flujo) VALUES
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='70' AND anio=2020), 2020, '', 3, 7110, '700', 'Ventas de bienes', TRUE, 'INGRESOS', 'ACREEDORA', 'RESULTADOS', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='70' AND anio=2020), 2020, '', 3, 7120, '701', 'Prestación de servicios', TRUE, 'INGRESOS', 'ACREEDORA', 'RESULTADOS', 'OPERACION'), 
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='71' AND anio=2020), 2020, '', 3, 7210, '710', 'Intereses ganados', TRUE, 'INGRESOS', 'ACREEDORA', 'RESULTADOS', 'OPERACION'),
--
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='72' AND anio=2020), 2020, '', 3, 7310, '720', 'Ganancias por siniestros', TRUE, 'INGRESOS', 'ACREEDORA', 'RESULTADOS', 'OPERACION'),
((SELECT id_cuenta FROM cuenta_contable WHERE codigo='72' AND anio=2020), 2020, '', 3, 7320, '721', 'Otros ingresos extraordinarios', TRUE, 'INGRESOS', 'ACREEDORA', 'RESULTADOS', 'OPERACION');

select * from cuenta_contable cc ;


-- ============================================================================
-- TABLA: cuenta_contable_empresa
-- ============================================================================
DROP TABLE IF EXISTS cuenta_contable_empresa CASCADE;
CREATE TABLE cuenta_contable_empresa (
    id_cuenta_empresa       SERIAL          NOT NULL PRIMARY KEY,
    id_empresa              INT             NOT NULL, 
    id_cuenta               INT             NOT NULL REFERENCES cuenta_contable(id_cuenta),
    activo                  BOOLEAN         NOT NULL DEFAULT TRUE,
    fe_registra             TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fe_modifica             TIMESTAMP       NULL,
    UNIQUE (id_empresa, id_cuenta)
);
--
CREATE INDEX ON cuenta_contable_empresa(id_empresa);
CREATE INDEX ON cuenta_contable_empresa(id_cuenta);
--
COMMENT ON TABLE cuenta_contable_empresa IS 'Tabla que relaciona las cuentas contables con una empresa.';
COMMENT ON COLUMN cuenta_contable_empresa.id_cuenta_empresa IS 'Identificador de entidad.';
COMMENT ON COLUMN cuenta_contable_empresa.id_empresa IS 'Identificador de empresa [empresa].';
COMMENT ON COLUMN cuenta_contable_empresa.id_cuenta IS 'Identificador de cuenta [cuenta_contable].';
COMMENT ON COLUMN cuenta_contable_empresa.activo IS 'TRUE=Cuenta habilitada para uso en la empresa, FALSE=Cuenta deshabilitada.';
COMMENT ON COLUMN cuenta_contable_empresa.fe_registra IS 'Fecha de registro.';
COMMENT ON COLUMN cuenta_contable_empresa.fe_modifica IS 'Última fecha de modificación.';
--
INSERT INTO cuenta_contable_empresa (id_empresa, id_cuenta, activo)
SELECT 1004, id_cuenta, activo
FROM cuenta_contable;

select * from cuenta_contable_empresa cce ;


-- ============================================================================
-- VISTA: vw_cuenta_contable_empresa
-- ============================================================================
DROP VIEW IF EXISTS vw_cuenta_contable_empresa;
CREATE VIEW vw_cuenta_contable_empresa AS
SELECT
    e.id_cuenta_empresa,
    e.id_empresa,
    e.id_cuenta,
    c.codigo,
    c.nombre,
    e.activo,
    e.fe_registra,
    e.fe_modifica
FROM cuenta_contable_empresa e
JOIN cuenta_contable c ON c.id_cuenta = e.id_cuenta;

select * from vw_cuenta_contable_empresa;




-- SISTEMA INTEGRAL DE TRANSACCIONES CONTABLES
-- Tabla para Sistema de Transacciones Contables
-- PostgreSQL

CREATE TABLE transacciones_tipos (
    id SERIAL PRIMARY KEY,
    codigo_sistema VARCHAR(3) NOT NULL,
    nombre_sistema VARCHAR(50) NOT NULL,
    codigo_transaccion VARCHAR(6) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NOT NULL,
    tipo_flujo VARCHAR(20) NOT NULL CHECK (tipo_flujo IN ('OPERACION', 'INVERSION', 'FINANCIAMIENTO', 'NO_APLICA')),
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Índices para optimizar consultas
    CONSTRAINT uk_codigo_transaccion UNIQUE (codigo_transaccion),
    CONSTRAINT chk_codigo_sistema CHECK (codigo_sistema IN ('COM', 'LGT', 'PER', 'FIN', 'CNT'))
);

-- Índices adicionales para mejor performance
CREATE INDEX idx_transacciones_sistema ON transacciones_tipos(codigo_sistema);
CREATE INDEX idx_transacciones_tipo_flujo ON transacciones_tipos(tipo_flujo);
CREATE INDEX idx_transacciones_activo ON transacciones_tipos(activo);

-- Trigger para actualizar fecha_actualizacion automáticamente
CREATE OR REPLACE FUNCTION actualizar_fecha_modificacion()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_actualizacion = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_actualizar_fecha_transacciones
    BEFORE UPDATE ON transacciones_tipos
    FOR EACH ROW
    EXECUTE FUNCTION actualizar_fecha_modificacion();

-- Comentarios en la tabla y campos
COMMENT ON TABLE transacciones_tipos IS 'Catálogo de tipos de transacciones contables por módulos empresariales';
COMMENT ON COLUMN transacciones_tipos.codigo_sistema IS 'Código del sistema/módulo (COM, LGT, PER, FIN, CNT)';
COMMENT ON COLUMN transacciones_tipos.nombre_sistema IS 'Nombre completo del sistema';
COMMENT ON COLUMN transacciones_tipos.codigo_transaccion IS 'Código único de la transacción (ej: COM001)';
COMMENT ON COLUMN transacciones_tipos.descripcion IS 'Descripción detallada de la transacción';
COMMENT ON COLUMN transacciones_tipos.tipo_flujo IS 'Clasificación para flujo de efectivo';
COMMENT ON COLUMN transacciones_tipos.activo IS 'Indica si la transacción está habilitada';


-- Tabla: transacciones_tipos o similar
-- Estructura: (codigo_sistema, nombre_sistema, codigo_transaccion, descripcion, tipo_flujo, activo)

INSERT INTO transacciones_tipos (codigo_sistema, nombre_sistema, codigo_transaccion, descripcion, tipo_flujo, activo) VALUES

-- ========================================
-- SISTEMA COMERCIAL (COM) - Gestión de Ventas y Servicios
-- ========================================
('COM', 'SISTEMA COMERCIAL', 'COM001', 'Registro de ventas al contado', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM002', 'Registro de ventas a crédito', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM003', 'Devoluciones de ventas', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM004', 'Notas de crédito por ventas', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM005', 'Notas de débito por ventas', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM006', 'Descuentos comerciales', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM007', 'Facturación de servicios', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM008', 'Comisiones por ventas', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM009', 'Bonificaciones y descuentos por volumen', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM010', 'Fletes y gastos de entrega', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM011', 'Garantías de productos', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM012', 'Promociones y marketing', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM013', 'Cobranza dudosa específica', 'OPERACION', TRUE),

-- ========================================
-- SISTEMA LOGÍSTICO (LGT) - Gestión de Compras e Inventarios
-- ========================================

-- Operaciones de Compras
('LGT', 'SISTEMA LOGÍSTICO', 'LGT001', 'Compra de mercaderías al contado', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT002', 'Compra de mercaderías a crédito', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT003', 'Recepción de inventario', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT004', 'Devoluciones a proveedores', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT005', 'Notas de crédito por compras', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT006', 'Notas de débito por compras', 'OPERACION', TRUE),

-- Gestión de Inventarios
('LGT', 'SISTEMA LOGÍSTICO', 'LGT007', 'Ajustes de inventario (faltantes)', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT008', 'Ajustes de inventario (sobrantes)', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT009', 'Traslados internos de inventario', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT010', 'Gastos de transporte y logística', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT011', 'Mermas y deterioros', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT012', 'Inventarios de control', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT013', 'Obsolescencia de inventario', 'OPERACION', TRUE),

-- Servicios y Mantenimiento
('LGT', 'SISTEMA LOGÍSTICO', 'LGT014', 'Mantenimiento de equipos', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT015', 'Servicios de terceros (logística)', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT016', 'Almacenaje y custodia', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT017', 'Embalaje y empaquetado', 'OPERACION', TRUE),

-- ========================================
-- SISTEMA TALENTO HUMANO (PER) - Gestión de Personal
-- ========================================

-- Remuneraciones y Beneficios
('PER', 'SISTEMA TALENTO HUMANO', 'PER001', 'Pago de sueldos y salarios', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER002', 'Pago de remuneraciones adicionales', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER003', 'Provisión de beneficios sociales', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER004', 'Retenciones de impuestos y aportes', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER005', 'Liquidaciones por despido', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER006', 'Bonos e incentivos', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER007', 'Vacaciones del personal', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER008', 'Gratificaciones', 'OPERACION', TRUE),

-- Servicios al Personal
('PER', 'SISTEMA TALENTO HUMANO', 'PER009', 'Préstamos al personal', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER010', 'Adelantos de remuneraciones', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER011', 'Control de tardanzas y faltas', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER012', 'Capacitación y desarrollo', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER013', 'Seguros de vida y salud del personal', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER014', 'Movilidad y viáticos', 'OPERACION', TRUE),
('PER', 'SISTEMA TALENTO HUMANO', 'PER015', 'Uniformes y equipos de protección', 'OPERACION', TRUE),

-- ========================================
-- SISTEMA FINANCIERO (FIN) - Gestión Financiera y Patrimonial
-- ========================================

-- Operaciones de Tesorería
('FIN', 'SISTEMA FINANCIERO', 'FIN001', 'Cobro de clientes', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN002', 'Pago a proveedores', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN003', 'Pago de tributos', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN010', 'Transferencias internas entre cuentas', 'NO_APLICA', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN011', 'Comisiones bancarias', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN012', 'Pagos menores (caja chica)', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN013', 'Conciliaciones bancarias', 'OPERACION', TRUE),

-- Financiamiento y Préstamos
('FIN', 'SISTEMA FINANCIERO', 'FIN004', 'Préstamos bancarios recibidos', 'FINANCIAMIENTO', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN005', 'Amortización de préstamos', 'FINANCIAMIENTO', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN006', 'Pago de intereses bancarios', 'FINANCIAMIENTO', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN014', 'Préstamos de accionistas', 'FINANCIAMIENTO', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN015', 'Préstamos a terceros', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN016', 'Intereses ganados', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN017', 'Intereses pagados', 'OPERACION', TRUE),

-- Inversiones y Patrimonio
('FIN', 'SISTEMA FINANCIERO', 'FIN007', 'Inversiones financieras', 'INVERSION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN008', 'Rendimientos de inversiones', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN009', 'Ajustes por diferencia de cambio', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN018', 'Aportes de accionistas', 'FINANCIAMIENTO', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN019', 'Distribución de dividendos', 'FINANCIAMIENTO', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN020', 'Reducción de capital', 'FINANCIAMIENTO', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN021', 'Capitalización de utilidades', 'FINANCIAMIENTO', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN022', 'Reservas legales', 'NO_APLICA', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN023', 'Prima de emisión de acciones', 'FINANCIAMIENTO', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN024', 'Dividendos recibidos', 'OPERACION', TRUE),

-- ========================================
-- SISTEMA CONTABLE (CNT) - Gestión Contable y Administrativa
-- ========================================

-- Activos y Depreciaciones
('CNT', 'SISTEMA CONTABLE', 'CNT001', 'Compra de activo fijo', 'INVERSION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT002', 'Venta de activo fijo', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT003', 'Depreciación de activos fijos', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT004', 'Amortización de intangibles', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT013', 'Registro de activos (inventario patrimonial)', 'NO_APLICA', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT014', 'Deterioro de activos', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT015', 'Revaluación de activos', 'INVERSION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT025', 'Ajustes por revaluación', 'NO_APLICA', TRUE),

-- Provisiones y Ajustes
('CNT', 'SISTEMA CONTABLE', 'CNT005', 'Provisión para cuentas incobrables', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT006', 'Provisión de gastos', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT007', 'Corrección de errores contables', 'NO_APLICA', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT008', 'Ajustes por redondeo', 'NO_APLICA', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT016', 'Provisión para contingencias', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT017', 'Provisión para impuestos', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT026', 'Ajustes de ejercicios anteriores', 'NO_APLICA', TRUE),

-- Gastos Administrativos
('CNT', 'SISTEMA CONTABLE', 'CNT018', 'Gastos administrativos generales', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT019', 'Servicios públicos (luz, agua, teléfono)', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT020', 'Seguros diversos', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT021', 'Alquileres pagados', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT022', 'Gastos legales y notariales', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT023', 'Control interno y auditoría', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT024', 'Consultoría y asesorías', 'OPERACION', TRUE),

-- Operaciones de Cierre y Control
('CNT', 'SISTEMA CONTABLE', 'CNT009', 'Cierre de cuentas de resultados', 'NO_APLICA', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT010', 'Determinación de resultados', 'NO_APLICA', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT011', 'Asientos de apertura', 'NO_APLICA', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT012', 'Reclasificaciones contables', 'NO_APLICA', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT027', 'Reportes regulatorios', 'NO_APLICA', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT028', 'Evaluación de riesgos contables', 'NO_APLICA', TRUE);

select * from transacciones_tipos;
-- ========================================
-- QUERIES DE CONSULTA ÚTILES
-- ========================================

-- Ver todas las transacciones por sistema
-- SELECT codigo_sistema, COUNT(*) as total_transacciones 
-- FROM transacciones_tipos 
-- WHERE activo = TRUE 
-- GROUP BY codigo_sistema 
-- ORDER BY codigo_sistema;

-- Ver transacciones por tipo de flujo
-- SELECT tipo_flujo, COUNT(*) as total_transacciones 
-- FROM transacciones_tipos 
-- WHERE activo = TRUE 
-- GROUP BY tipo_flujo 
-- ORDER BY tipo_flujo;

-- Listar todas las transacciones de un sistema específico
-- SELECT codigo_transaccion, descripcion, tipo_flujo 
-- FROM transacciones_tipos 
-- WHERE codigo_sistema = 'COM' AND activo = TRUE 
-- ORDER BY codigo_transaccion;







-- SISTEMA INTEGRAL DE TRIBUTOS
-- Manejo completo de IGV, Percepciones, Retenciones, Detracciones

-- =============================================
-- 1. CATÁLOGO DE TRIBUTOS
-- =============================================
CREATE TABLE catalogo_tributos (
    id SERIAL PRIMARY KEY,
    codigo_tributo VARCHAR(10) NOT NULL UNIQUE,
    nombre_tributo VARCHAR(100) NOT NULL,
    tipo_tributo VARCHAR(20) NOT NULL CHECK (tipo_tributo IN ('IGV', 'PERCEPCION', 'RETENCION', 'DETRACCION', 'ISC', 'OTROS')),
    tasa_porcentaje DECIMAL(5,4) NOT NULL, -- 18.0000 para IGV
    cuenta_contable_acreedor VARCHAR(20), -- Para pasivos
    cuenta_contable_deudor VARCHAR(20),   -- Para activos
    codigo_sunat VARCHAR(10),
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_vigencia_desde DATE NOT NULL,
    fecha_vigencia_hasta DATE,
    
    FOREIGN KEY (cuenta_contable_acreedor) REFERENCES plan_cuentas(codigo_cuenta),
    FOREIGN KEY (cuenta_contable_deudor) REFERENCES plan_cuentas(codigo_cuenta)
);

-- Datos iniciales de tributos en Perú
INSERT INTO catalogo_tributos (codigo_tributo, nombre_tributo, tipo_tributo, tasa_porcentaje, cuenta_contable_acreedor, cuenta_contable_deudor, codigo_sunat, fecha_vigencia_desde) VALUES
('IGV18', 'Impuesto General a las Ventas', 'IGV', 18.0000, '40111', '40111', '1000', '2011-03-01'),
('PER02', 'Percepción Venta Interna 2%', 'PERCEPCION', 2.0000, '40172', '16442', '2001', '2019-01-01'),
('RET03', 'Retención Servicios 3%', 'RETENCION', 3.0000, '40173', '16443', '2017', '2019-01-01'),
('DET04', 'Detracción Servicios 4%', 'DETRACCION', 4.0000, '40174', '16441', '9002', '2019-01-01'),
('DET12', 'Detracción Recursos Hidrobiológicos 15%', 'DETRACCION', 15.0000, '40174', '16441', '9001', '2019-01-01');

-- =============================================
-- 2. AMPLIAR TRANSACCIONES CON TRIBUTOS
-- =============================================
-- Agregar nuevas transacciones específicas para tributos

INSERT INTO transacciones_tipos (codigo_sistema, nombre_sistema, codigo_transaccion, descripcion, tipo_flujo, activo) VALUES

-- SISTEMA COMERCIAL - Tributos en Ventas
('COM', 'SISTEMA COMERCIAL', 'COM014', 'Aplicación de percepciones en ventas', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM015', 'Cobranza con retención aplicada', 'OPERACION', TRUE),
('COM', 'SISTEMA COMERCIAL', 'COM016', 'Ventas con detracción', 'OPERACION', TRUE),

-- SISTEMA LOGÍSTICO - Tributos en Compras  
('LGT', 'SISTEMA LOGÍSTICO', 'LGT018', 'Compras con percepción recibida', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT019', 'Pago con retención aplicada', 'OPERACION', TRUE),
('LGT', 'SISTEMA LOGÍSTICO', 'LGT020', 'Compras con detracción', 'OPERACION', TRUE),

-- SISTEMA FINANCIERO - Pagos de Tributos
('FIN', 'SISTEMA FINANCIERO', 'FIN025', 'Pago de IGV mensual', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN026', 'Pago de percepciones retenidas', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN027', 'Pago de retenciones efectuadas', 'OPERACION', TRUE),
('FIN', 'SISTEMA FINANCIERO', 'FIN028', 'Liberación de detracciones', 'OPERACION', TRUE),

-- SISTEMA CONTABLE - Provisiones y Ajustes Tributarios
('CNT', 'SISTEMA CONTABLE', 'CNT029', 'Provisión mensual de IGV', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT030', 'Regularización de tributos', 'OPERACION', TRUE),
('CNT', 'SISTEMA CONTABLE', 'CNT031', 'Ajustes por diferencias tributarias', 'OPERACION', TRUE);

-- =============================================
-- 3. DETALLE DE TRIBUTOS POR TRANSACCIÓN
-- =============================================
CREATE TABLE transacciones_tributos (
    id SERIAL PRIMARY KEY,
    asiento_id INTEGER NOT NULL,
    codigo_tributo VARCHAR(10) NOT NULL,
    base_imponible DECIMAL(15,2) NOT NULL,
    monto_tributo DECIMAL(15,2) NOT NULL,
    tasa_aplicada DECIMAL(5,4) NOT NULL,
    documento_sustento VARCHAR(50),
    fecha_aplicacion DATE NOT NULL,
    
    FOREIGN KEY (asiento_id) REFERENCES asientos_contables(id) ON DELETE CASCADE,
    FOREIGN KEY (codigo_tributo) REFERENCES catalogo_tributos(codigo_tributo)
);

-- =============================================
-- 4. PLANTILLAS CONTABLES CON TRIBUTOS
-- =============================================

-- Ejemplo: COM001 - Venta al contado CON IGV
INSERT INTO plantillas_contables (codigo_transaccion, secuencia, codigo_cuenta, tipo_movimiento, es_obligatorio, descripcion_detalle) VALUES
('COM001', 1, '10111', 'DEBE', TRUE, 'Caja y Bancos - Cobranza'),
('COM001', 2, '70111', 'HABER', TRUE, 'Ventas Gravadas'),  
('COM001', 3, '40111', 'HABER', TRUE, 'IGV por Pagar');

-- Ejemplo: COM014 - Venta con percepción
INSERT INTO plantillas_contables (codigo_transaccion, secuencia, codigo_cuenta, tipo_movimiento, es_obligatorio, descripcion_detalle) VALUES
('COM014', 1, '12111', 'DEBE', TRUE, 'Cuentas por Cobrar Comerciales'),
('COM014', 2, '70111', 'HABER', TRUE, 'Ventas Gravadas'),
('COM014', 3, '40111', 'HABER', TRUE, 'IGV por Pagar'),
('COM014', 4, '10111', 'DEBE', TRUE, 'Caja - Percepción cobrada'),
('COM014', 5, '40172', 'HABER', TRUE, 'Percepciones por Entregar');

-- Ejemplo: LGT018 - Compra con percepción
INSERT INTO plantillas_contables (codigo_transaccion, secuencia, codigo_cuenta, tipo_movimiento, es_obligatorio, descripcion_detalle) VALUES
('LGT018', 1, '60111', 'DEBE', TRUE, 'Compras Gravadas'),
('LGT018', 2, '40111', 'DEBE', TRUE, 'IGV - Crédito Fiscal'),
('LGT018', 3, '16442', 'DEBE', TRUE, 'Percepciones Pagadas por Adelantado'),
('LGT018', 4, '42111', 'HABER', TRUE, 'Cuentas por Pagar Comerciales'),
('LGT018', 5, '10111', 'HABER', TRUE, 'Caja - Percepción adicional pagada');

-- Ejemplo: FIN025 - Pago mensual de IGV
INSERT INTO plantillas_contables (codigo_transaccion, secuencia, codigo_cuenta, tipo_movimiento, es_obligatorio, descripcion_detalle) VALUES
('FIN025', 1, '40111', 'DEBE', TRUE, 'IGV por Pagar'),
('FIN025', 2, '16442', 'DEBE', TRUE, 'Percepciones a favor (si aplica)'),
('FIN025', 3, '10111', 'HABER', TRUE, 'Caja y Bancos - Pago SUNAT');

-- =============================================
-- 5. VISTAS PARA CONTROL TRIBUTARIO
-- =============================================

-- Vista de IGV por período
CREATE VIEW v_resumen_igv AS
SELECT 
    DATE_TRUNC('month', a.fecha_asiento) as periodo,
    SUM(CASE WHEN m.codigo_cuenta = '40111' AND m.tipo_movimiento = 'HABER' THEN m.monto ELSE 0 END) as igv_ventas,
    SUM(CASE WHEN m.codigo_cuenta = '40111' AND m.tipo_movimiento = 'DEBE' THEN m.monto ELSE 0 END) as igv_compras,
    SUM(CASE WHEN m.codigo_cuenta = '40111' AND m.tipo_movimiento = 'HABER' THEN m.monto ELSE 0 END) -
    SUM(CASE WHEN m.codigo_cuenta = '40111' AND m.tipo_movimiento = 'DEBE' THEN m.monto ELSE 0 END) as igv_por_pagar
FROM asientos_contables a
JOIN movimientos_contables m ON a.id = m.asiento_id
WHERE a.estado = 'APROBADO'
  AND m.codigo_cuenta = '40111'
GROUP BY DATE_TRUNC('month', a.fecha_asiento)
ORDER BY periodo;

-- Vista de percepciones pendientes
CREATE VIEW v_percepciones_pendientes AS
SELECT 
    DATE_TRUNC('month', a.fecha_asiento) as periodo,
    SUM(CASE WHEN m.codigo_cuenta = '40172' AND m.tipo_movimiento = 'HABER' THEN m.monto ELSE 0 END) as percepciones_por_entregar,
    SUM(CASE WHEN m.codigo_cuenta = '16442' AND m.tipo_movimiento = 'DEBE' THEN m.monto ELSE 0 END) as percepciones_pagadas
FROM asientos_contables a
JOIN movimientos_contables m ON a.id = m.asiento_id
WHERE a.estado = 'APROBADO'
  AND m.codigo_cuenta IN ('40172', '16442')
GROUP BY DATE_TRUNC('month', a.fecha_asiento)
ORDER BY periodo;

-- =============================================
-- 6. FUNCIONES PARA CÁLCULOS AUTOMÁTICOS
-- =============================================

-- Función para calcular IGV
CREATE OR REPLACE FUNCTION calcular_igv(monto_base DECIMAL, incluye_igv BOOLEAN DEFAULT FALSE)
RETURNS TABLE(base_imponible DECIMAL, igv DECIMAL, total DECIMAL) AS $$
BEGIN
    IF incluye_igv THEN
        -- El monto incluye IGV, hay que separarlo
        RETURN QUERY SELECT 
            ROUND(monto_base / 1.18, 2) as base_imponible,
            ROUND(monto_base - (monto_base / 1.18), 2) as igv,
            monto_base as total;
    ELSE
        -- El monto no incluye IGV, hay que agregarlo  
        RETURN QUERY SELECT
            monto_base as base_imponible,
            ROUND(monto_base * 0.18, 2) as igv,
            ROUND(monto_base * 1.18, 2) as total;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- ÍNDICES
-- =============================================
CREATE INDEX idx_tributos_asiento ON transacciones_tributos(asiento_id);
CREATE INDEX idx_tributos_codigo ON transacciones_tributos(codigo_tributo);
CREATE INDEX idx_tributos_fecha ON transacciones_tributos(fecha_aplicacion);

-- =============================================
-- COMENTARIOS
-- =============================================
COMMENT ON TABLE catalogo_tributos IS 'Catálogo maestro de todos los tributos (IGV, percepciones, retenciones, etc.)';
COMMENT ON TABLE transacciones_tributos IS 'Detalle de tributos aplicados en cada transacción contable';
COMMENT ON COLUMN catalogo_tributos.tasa_porcentaje IS 'Tasa del tributo en porcentaje (18.0000 para IGV del 18%)';







-- NOMENCLATURA CONTABLE ESTÁNDAR
-- Usando terminología más clara y profesional

-- =============================================
-- ASIENTOS CONTABLES (Cabecera del asiento)
-- =============================================
CREATE TABLE asientos_contables (
    id SERIAL PRIMARY KEY,
    numero_asiento VARCHAR(20) NOT NULL UNIQUE,
    codigo_transaccion VARCHAR(6) NOT NULL,
    fecha_asiento DATE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    glosa VARCHAR(500) NOT NULL,
    referencia VARCHAR(100),
    documento_origen VARCHAR(50), -- Factura, recibo, etc.
    total_debe DECIMAL(15,2) NOT NULL DEFAULT 0,
    total_haber DECIMAL(15,2) NOT NULL DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'PENDIENTE' CHECK (estado IN ('PENDIENTE', 'APROBADO', 'ANULADO')),
    periodo_contable VARCHAR(7) NOT NULL, -- YYYY-MM
    usuario_creacion VARCHAR(50),
    usuario_aprobacion VARCHAR(50),
    fecha_aprobacion TIMESTAMP,
    
    FOREIGN KEY (codigo_transaccion) REFERENCES transacciones_tipos(codigo_transaccion)
);

-- =============================================
-- MOVIMIENTOS CONTABLES (Detalle por cuenta)
-- =============================================
CREATE TABLE movimientos_contables (
    id SERIAL PRIMARY KEY,
    asiento_id INTEGER NOT NULL,
    codigo_cuenta VARCHAR(20) NOT NULL,
    tipo_movimiento VARCHAR(10) NOT NULL CHECK (tipo_movimiento IN ('DEBE', 'HABER')),
    monto DECIMAL(15,2) NOT NULL CHECK (monto > 0),
    glosa_detalle VARCHAR(300),
    centro_costo VARCHAR(10),
    proyecto VARCHAR(20),
    documento_referencia VARCHAR(50),
    fecha_vencimiento DATE, -- Para cuentas por cobrar/pagar
    
    FOREIGN KEY (asiento_id) REFERENCES asientos_contables(id) ON DELETE CASCADE,
    FOREIGN KEY (codigo_cuenta) REFERENCES plan_cuentas(codigo_cuenta)
);

-- =============================================
-- EJEMPLO DE ASIENTO CONTABLE COMPLETO
-- =============================================
-- Venta al contado por S/ 118.00 (IGV incluido)

/*
-- 1. Cabecera del asiento
INSERT INTO asientos_contables (numero_asiento, codigo_transaccion, fecha_asiento, glosa, documento_origen, total_debe, total_haber, periodo_contable) 
VALUES ('AST-2025-001', 'COM001', '2025-01-15', 'Venta al contado según Factura 001-0001234', 'FAC-001-0001234', 118.00, 118.00, '2025-01');

-- 2. Movimientos del asiento
INSERT INTO movimientos_contables (asiento_id, codigo_cuenta, tipo_movimiento, monto, glosa_detalle) VALUES
(1, '101.01', 'DEBE', 118.00, 'Caja - Cobranza al contado'),
(1, '401.01', 'HABER', 100.00, 'Ventas - Productos gravados'),
(1, '201.18.01', 'HABER', 18.00, 'IGV por pagar');
*/

-- =============================================
-- CONSTRAINT PARA VALIDAR BALANCE
-- =============================================
-- Función para validar que DEBE = HABER
CREATE OR REPLACE FUNCTION validar_balance_asiento()
RETURNS TRIGGER AS $$
DECLARE
    total_debe DECIMAL(15,2);
    total_haber DECIMAL(15,2);
BEGIN
    -- Calcular totales del asiento
    SELECT 
        COALESCE(SUM(CASE WHEN tipo_movimiento = 'DEBE' THEN monto ELSE 0 END), 0),
        COALESCE(SUM(CASE WHEN tipo_movimiento = 'HABER' THEN monto ELSE 0 END), 0)
    INTO total_debe, total_haber
    FROM movimientos_contables 
    WHERE asiento_id = COALESCE(NEW.asiento_id, OLD.asiento_id);
    
    -- Actualizar totales en la cabecera
    UPDATE asientos_contables 
    SET total_debe = total_debe, total_haber = total_haber
    WHERE id = COALESCE(NEW.asiento_id, OLD.asiento_id);
    
    -- Validar balance (opcional - descomenta para validación estricta)
    -- IF total_debe != total_haber THEN
    --     RAISE EXCEPTION 'El asiento no está balanceado: Debe = %, Haber = %', total_debe, total_haber;
    -- END IF;
    
    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

-- Trigger para validar balance automáticamente
CREATE TRIGGER trigger_balance_asiento
    AFTER INSERT OR UPDATE OR DELETE ON movimientos_contables
    FOR EACH ROW
    EXECUTE FUNCTION validar_balance_asiento();

-- =============================================
-- VISTAS ÚTILES
-- =============================================

-- Vista de asientos con balance
CREATE VIEW v_asientos_balance AS
SELECT 
    a.numero_asiento,
    a.fecha_asiento,
    t.descripcion as tipo_transaccion,
    a.glosa,
    a.total_debe,
    a.total_haber,
    (a.total_debe - a.total_haber) as diferencia,
    CASE 
        WHEN a.total_debe = a.total_haber THEN 'BALANCEADO'
        ELSE 'DESBALANCEADO'
    END as estado_balance,
    a.estado
FROM asientos_contables a
JOIN transacciones_tipos t ON a.codigo_transaccion = t.codigo_transaccion;

-- Vista del libro diario
CREATE VIEW v_libro_diario AS
SELECT 
    a.numero_asiento,
    a.fecha_asiento,
    a.glosa,
    m.codigo_cuenta,
    c.nombre_cuenta,
    m.tipo_movimiento,
    m.monto,
    m.glosa_detalle,
    a.documento_origen
FROM asientos_contables a
JOIN movimientos_contables m ON a.id = m.asiento_id
JOIN plan_cuentas c ON m.codigo_cuenta = c.codigo_cuenta
WHERE a.estado = 'APROBADO'
ORDER BY a.fecha_asiento, a.numero_asiento, m.id;

-- =============================================
-- ÍNDICES
-- =============================================
CREATE INDEX idx_asientos_fecha ON asientos_contables(fecha_asiento);
CREATE INDEX idx_asientos_periodo ON asientos_contables(periodo_contable);
CREATE INDEX idx_movimientos_cuenta ON movimientos_contables(codigo_cuenta);
CREATE INDEX idx_movimientos_asiento ON movimientos_contables(asiento_id);

-- =============================================
-- COMENTARIOS
-- =============================================
COMMENT ON TABLE asientos_contables IS 'Cabecera de los asientos contables - equivale al comprobante contable';
COMMENT ON TABLE movimientos_contables IS 'Detalle de movimientos por cuenta contable - equivale a las líneas del asiento';
COMMENT ON COLUMN asientos_contables.numero_asiento IS 'Número único del asiento contable (ej: AST-2025-001)';
COMMENT ON COLUMN movimientos_contables.tipo_movimiento IS 'DEBE o HABER según la naturaleza del movimiento';










--
--INSERT INTO subtipo_operacion (id_subtipo_operacion, id_tipo_operacion, nombre, descripcion) VALUES
--(1, 4, 'Depreciación', 'Reconocimiento periódico del desgaste de activos'),
--(2, 4, 'Provisión de gastos', 'Registro de obligaciones aún no pagadas'),
--(3, 4, 'Provisión de incobrables', 'Estimación de cuentas por cobrar que no se cobrarán'),
--(4, 4, 'Diferencia de cambio', 'Ajustes por variación de tipo de cambio'),
--(5, 4, 'Corrección de errores', 'Rectificación de registros anteriores'),
--(6, 4, 'Redondeos', 'Ajustes por diferencias de decimales'),
--(7, 4, 'Cierre de ingresos', 'Traspaso de cuentas de ingresos al resultado'),
--(8, 4, 'Cierre de gastos', 'Traspaso de cuentas de gastos al resultado'),
--(9, 4, 'Resultado del ejercicio', 'Determinación de utilidad o pérdida al cierre');
--
--


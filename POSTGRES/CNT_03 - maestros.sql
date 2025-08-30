-- CENTRO DE COSTOS Y ESTRUCTURA ORGANIZACIONAL 
-- CENTRO DE COSTOS Y ESTRUCTURA ORGANIZACIONAL 
-- CENTRO DE COSTOS Y ESTRUCTURA ORGANIZACIONAL 
-- CENTRO DE COSTOS Y ESTRUCTURA ORGANIZACIONAL 
-- CENTRO DE COSTOS Y ESTRUCTURA ORGANIZACIONAL 
-- CENTRO DE COSTOS Y ESTRUCTURA ORGANIZACIONAL 
-- CENTRO DE COSTOS Y ESTRUCTURA ORGANIZACIONAL 
-- CENTRO DE COSTOS Y ESTRUCTURA ORGANIZACIONAL 
-- CENTRO DE COSTOS Y ESTRUCTURA ORGANIZACIONAL 
-- CENTRO DE COSTOS Y ESTRUCTURA ORGANIZACIONAL 




-- TABLA DE ESTRUCTURA ORGANIZACIONAL
CREATE TABLE estructura_organizacional (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    nivel ENUM('DIRECTORIO', 'GERENCIA', 'JEFATURA', 'COORDINACION', 'SUPERVISION', 'OPERATIVO') NOT NULL,
    area_funcional VARCHAR(50), -- Educación, Administración, Finanzas, etc.
    jefe_id INT, -- Referencia al superior jerárquico
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (jefe_id) REFERENCES estructura_organizacional(id)
);

-- TABLA DE EMPLEADOS/PERSONAL
CREATE TABLE personal (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    puesto_id INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (puesto_id) REFERENCES estructura_organizacional(id)
);

-- TABLA DE RELACIÓN: ESTRUCTURA ORGANIZACIONAL vs CENTROS DE COSTO
CREATE TABLE org_centro_costo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    puesto_org_id INT NOT NULL, -- Referencia a estructura_organizacional
    centro_costo_id INT NOT NULL, -- Referencia a centros_costo
    tipo_relacion ENUM('RESPONSABLE', 'PARTICIPANTE', 'COLABORADOR') NOT NULL,
    porcentaje_asignacion DECIMAL(5,2) DEFAULT 100.00, -- Para distribución de costos
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (puesto_org_id) REFERENCES estructura_organizacional(id),
    FOREIGN KEY (centro_costo_id) REFERENCES centros_costo(id)
);

-- DATOS DE EJEMPLO - ESTRUCTURA ORGANIZACIONAL EMPRESA EDUCATIVA
INSERT INTO estructura_organizacional (codigo, nombre, nivel, area_funcional, jefe_id) VALUES
-- NIVEL DIRECTORIO
('ORG-DIR-001', 'Directorio General', 'DIRECTORIO', 'DIRECCION', NULL),

-- NIVEL GERENCIA
('ORG-GER-001', 'Gerencia General', 'GERENCIA', 'DIRECCION', 1),
('ORG-GER-002', 'Gerencia Académica', 'GERENCIA', 'EDUCACION', 2),
('ORG-GER-003', 'Gerencia Administrativa', 'GERENCIA', 'ADMINISTRACION', 2),

-- NIVEL JEFATURA - ACADÉMICO
('ORG-JEF-001', 'Dirección Inicial', 'JEFATURA', 'EDUCACION', 3),
('ORG-JEF-002', 'Dirección Primaria', 'JEFATURA', 'EDUCACION', 3),
('ORG-JEF-003', 'Dirección Secundaria', 'JEFATURA', 'EDUCACION', 3),

-- NIVEL JEFATURA - ADMINISTRATIVO
('ORG-JEF-004', 'Jefatura Finanzas', 'JEFATURA', 'FINANZAS', 4),
('ORG-JEF-005', 'Jefatura RRHH', 'JEFATURA', 'RRHH', 4),
('ORG-JEF-006', 'Jefatura Marketing', 'JEFATURA', 'MARKETING', 4),

-- NIVEL COORDINACIÓN
('ORG-COO-001', 'Coordinación Verano Inicial', 'COORDINACION', 'EDUCACION', 5),
('ORG-COO-002', 'Coordinación Verano Primaria', 'COORDINACION', 'EDUCACION', 6),
('ORG-COO-003', 'Coordinación Verano Secundaria', 'COORDINACION', 'EDUCACION', 7),

-- NIVEL OPERATIVO
('ORG-OPE-001', 'Docentes Inicial', 'OPERATIVO', 'EDUCACION', 5),
('ORG-OPE-002', 'Docentes Primaria', 'OPERATIVO', 'EDUCACION', 6),
('ORG-OPE-003', 'Docentes Secundaria', 'OPERATIVO', 'EDUCACION', 7),
('ORG-OPE-004', 'Personal Administrativo', 'OPERATIVO', 'ADMINISTRACION', 4);

-- DATOS DE EJEMPLO - ESTRUCTURA ORGANIZACIONAL CLÍNICA
INSERT INTO estructura_organizacional (codigo, nombre, nivel, area_funcional, jefe_id) VALUES
-- CLÍNICA
('CLI-DIR-001', 'Directorio Médico', 'DIRECTORIO', 'DIRECCION', NULL),
('CLI-GER-001', 'Gerencia General', 'GERENCIA', 'DIRECCION', 17),
('CLI-GER-002', 'Gerencia Médica', 'GERENCIA', 'MEDICA', 18),
('CLI-GER-003', 'Gerencia Administrativa', 'GERENCIA', 'ADMINISTRACION', 18),

('CLI-JEF-001', 'Jefatura Consulta Externa', 'JEFATURA', 'MEDICA', 19),
('CLI-JEF-002', 'Jefatura Hospitalización', 'JEFATURA', 'MEDICA', 19),
('CLI-JEF-003', 'Jefatura Cirugía', 'JEFATURA', 'MEDICA', 19),
('CLI-JEF-004', 'Jefatura Laboratorio', 'JEFATURA', 'MEDICA', 19),
('CLI-JEF-005', 'Jefatura Farmacia', 'JEFATURA', 'MEDICA', 19),

('CLI-MED-001', 'Médicos Generales', 'OPERATIVO', 'MEDICA', 21),
('CLI-MED-002', 'Médicos Especialistas', 'OPERATIVO', 'MEDICA', 21),
('CLI-ENF-001', 'Personal Enfermería', 'OPERATIVO', 'MEDICA', 22),
('CLI-TEC-001', 'Técnicos Laboratorio', 'OPERATIVO', 'MEDICA', 24);

-- RELACIONES ESTRUCTURA ORGANIZACIONAL vs CENTROS DE COSTO

-- Para Empresa Educativa (asumiendo IDs de centros de costo del ejemplo anterior)
INSERT INTO org_centro_costo (puesto_org_id, centro_costo_id, tipo_relacion, porcentaje_asignacion, fecha_inicio) VALUES
-- Dirección Inicial responsable de centros inicial regular y verano
(5, 1, 'RESPONSABLE', 100.00, '2024-01-01'), -- Inicial Regular
(5, 2, 'RESPONSABLE', 100.00, '2024-01-01'), -- Inicial Verano
(11, 2, 'RESPONSABLE', 100.00, '2024-01-01'), -- Coordinador Verano Inicial

-- Dirección Primaria
(6, 3, 'RESPONSABLE', 100.00, '2024-01-01'), -- Primaria Regular
(6, 4, 'RESPONSABLE', 100.00, '2024-01-01'), -- Primaria Verano
(12, 4, 'RESPONSABLE', 100.00, '2024-01-01'), -- Coordinador Verano Primaria

-- Docentes participan en múltiples centros
(14, 1, 'PARTICIPANTE', 80.00, '2024-01-01'), -- Docentes Inicial en Regular
(14, 2, 'PARTICIPANTE', 20.00, '2024-01-01'), -- Docentes Inicial en Verano

-- Jefaturas administrativas
(8, 7, 'RESPONSABLE', 100.00, '2024-01-01'), -- Finanzas
(9, 9, 'RESPONSABLE', 100.00, '2024-01-01'), -- RRHH
(10, 10, 'RESPONSABLE', 100.00, '2024-01-01'); -- Marketing

-- CONSULTAS ÚTILES

-- Ver la estructura jerárquica con sus centros de costo asignados
SELECT 
    eo.nivel,
    eo.nombre as puesto,
    eo.area_funcional,
    cc.codigo as centro_codigo,
    cc.nombre as centro_nombre,
    occ.tipo_relacion,
    occ.porcentaje_asignacion
FROM estructura_organizacional eo
LEFT JOIN org_centro_costo occ ON eo.id = occ.puesto_org_id AND occ.activo = TRUE
LEFT JOIN centros_costo cc ON occ.centro_costo_id = cc.id
WHERE eo.activo = TRUE
ORDER BY eo.nivel, eo.area_funcional, eo.nombre;

-- Ver personal asignado a centros de costo
SELECT 
    p.nombres + ' ' + p.apellidos as empleado,
    eo.nombre as puesto,
    cc.codigo as centro_codigo,
    cc.nombre as centro_nombre,
    occ.porcentaje_asignacion
FROM personal p
JOIN estructura_organizacional eo ON p.puesto_id = eo.id
LEFT JOIN org_centro_costo occ ON eo.id = occ.puesto_org_id AND occ.activo = TRUE
LEFT JOIN centros_costo cc ON occ.centro_costo_id = cc.id
WHERE p.activo = TRUE AND eo.activo = TRUE;

-- Centros de costo sin responsable organizacional asignado
SELECT cc.codigo, cc.nombre, cc.tipo_centro
FROM centros_costo cc
LEFT JOIN org_centro_costo occ ON cc.id = occ.centro_costo_id 
    AND occ.tipo_relacion = 'RESPONSABLE' 
    AND occ.activo = TRUE
WHERE occ.id IS NULL AND cc.activo = TRUE;

-- Distribución de costos de personal por centro
SELECT 
    cc.codigo,
    cc.nombre,
    COUNT(DISTINCT p.id) as total_personas,
    SUM(occ.porcentaje_asignacion) as porcentaje_total_asignado
FROM centros_costo cc
JOIN org_centro_costo occ ON cc.id = occ.centro_costo_id
JOIN estructura_organizacional eo ON occ.puesto_org_id = eo.id
JOIN personal p ON eo.id = p.puesto_id
WHERE cc.activo = TRUE AND occ.activo = TRUE AND p.activo = TRUE
GROUP BY cc.id, cc.codigo, cc.nombre;
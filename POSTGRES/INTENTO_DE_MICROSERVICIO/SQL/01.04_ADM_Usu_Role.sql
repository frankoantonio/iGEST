/*
----------------------------------------------------------------------------------------------------------------------------------------
--usuario_rol---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.usuario_rol;
create table gen.usuario_rol (
	id_usuario_rol		serial 		not null primary key,
	id_usuario	 		bigint 		not null,
	id_negocio			int			not null,
	id_sistema			char(3)		not null,
	id_rol				int			NOT null,	
	activo				boolean		not null,
	lectura				bool 		not null,
	CONSTRAINT usuario_rol_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT usuario_rol_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES gen.rol(id_rol) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action
);
--
COMMENT ON TABLE gen.usuario_rol IS 'Roles por usuario'; 
COMMENT ON COLUMN gen.usuario_rol.activo IS 'Indica si el rol esta habilitado para utilizarse';
COMMENT ON COLUMN gen.usuario_rol.lectura IS 'Indica si la opción será de solo lectura';
--
INSERT INTO gen.usuario_rol (id_usuario, id_negocio, id_sistema, id_rol, activo, lectura) 
values
-- YSST-fbarzola
( 1,  10001, 'GEN',	1000, true , false),	-- generico
( 1,  10001, 'GEN',	1100, true , false),
( 1,  10001, 'GEN',	1900, true , false),
( 1,  10001, 'COM',	2000, true , false),	-- comercial
( 1,  10001, 'COM',	2100, true , false),
( 1,  10001, 'COM',	2200, true , false),
( 1,  10001, 'COM',	2300, true , false),
( 1,  10001, 'COM',	2400, true , false),
( 1,  10001, 'COM',	2500, true , false),   
( 1,  10001, 'COM',	2900, true , false),
( 1,  10001, 'LGT',	3000, true , false),	-- logistico
( 1,  10001, 'LGT',	3100, true , false),
( 1,  10001, 'LGT',	3200, true , false),
( 1,  10001, 'LGT',	3300, true , false),
( 1,  10001, 'LGT',	3400, true , false),
( 1,  10001, 'LGT',	3900, true , false),
( 1,  10001, 'LAB',	4000, true , false),	-- laboral
( 1,  10001, 'LAB',	4100, true , false),
( 1,  10001, 'LAB',	4200, true , false),
( 1,  10001, 'LAB',	4300, true , false),
( 1,  10001, 'LAB',	4900, true , false),
( 1,  10001, 'FIN',	5000, true , false),	-- financiero
( 1,  10001, 'FIN',	5100, true , false),
( 1,  10001, 'FIN',	5200, true , false),
( 1,  10001, 'FIN',	5300, true , false),
( 1,  10001, 'FIN',	5400, true , false),
( 1,  10001, 'FIN',	5900, true , false),
-- YSST-ssalazar
( 2,  10001, 'GEN',	1000, true , false),	-- generico
( 2,  10001, 'GEN',	1100, true , false),
( 2,  10001, 'COM',	2000, true , true ),	-- comercial
( 2,  10001, 'COM',	2100, true , true ),
( 2,  10001, 'COM',	2200, true , true ),
( 2,  10001, 'COM',	2300, true , true ),
( 2,  10001, 'COM',	2400, true , true ),
( 2,  10001, 'COM',	2500, true , true ),   
( 2,  10001, 'COM',	2900, true , true ),
( 2,  10001, 'LGT',	3000, true , true ),	-- logistico
( 2,  10001, 'LGT',	3100, true , true ),
( 2,  10001, 'LGT',	3200, true , true ),
( 2,  10001, 'LGT',	3300, true , true ),
( 2,  10001, 'LGT',	3400, true , true ),
( 2,  10001, 'LGT',	3900, true , true ),
( 2,  10001, 'LAB',	4000, true , true ),	-- laboral
( 2,  10001, 'LAB',	4100, true , true ),
( 2,  10001, 'LAB',	4200, true , true ),
( 2,  10001, 'LAB',	4300, true , true ),
( 2,  10001, 'LAB',	4900, true , true ),
( 2,  10001, 'FIN',	5000, true , true ),	-- financiero
( 2,  10001, 'FIN',	5100, true , true ),
( 2,  10001, 'FIN',	5200, true , true ),
( 2,  10001, 'FIN',	5300, true , true ),
( 2,  10001, 'FIN',	5400, true , true ),
( 2,  10001, 'FIN',	5900, true , true ),

-- BAZAR-fbarzola
(11,  10002, 'GEN',	1000, true , false),	-- generico
(11,  10002, 'GEN',	1100, true , false),
(11,  10002, 'COM',	2000, true , false),	-- comercial
(11,  10002, 'COM',	2100, true , false),
(11,  10002, 'COM',	2200, true , false),
(11,  10002, 'COM',	2300, true , false),
(11,  10002, 'COM',	2400, true , false),
(11,  10002, 'COM',	2500, true , false),   
(11,  10002, 'COM',	2900, true , false),
-- BAZAR-ssalazar
(12,  10002, 'GEN',	1000, true , false),	-- generico
(12,  10002, 'GEN',	1100, true , false),
(12,  10002, 'COM',	2000, true , false),	-- comercial
(12,  10002, 'COM',	2100, true , false),
(12,  10002, 'COM',	2200, true , false),
(12,  10002, 'COM',	2300, true , false),
(12,  10002, 'COM',	2400, true , false),
(12,  10002, 'COM',	2500, true , false),   
(12,  10002, 'COM',	2900, true , false),
-- BAZAR-ysinche
(13,  10002, 'GEN',	1000, true , false),	-- generico
(13,  10002, 'GEN',	1100, true , false),
(13,  10002, 'COM',	2000, true , false),	-- comercial
(13,  10002, 'COM',	2100, true , false),
(13,  10002, 'COM',	2200, true , false),

-- EDITORIAL-fbarzola
(14,  10003, 'GEN',	1000, true , false),	-- generico
(14,  10003, 'GEN',	1100, true , false),
(14,  10003, 'COM',	2000, true , false),	-- comercial
(14,  10003, 'COM',	2100, true , false),
(14,  10003, 'COM',	2200, true , false),
(14,  10003, 'COM',	2300, true , false),
(14,  10003, 'COM',	2400, true , false),
(14,  10003, 'COM',	2500, true , false),   
(14,  10003, 'COM',	2900, true , false),
-- EDITORIAL-ssalazar
(15,  10003, 'GEN',	1000, true , false),	-- generico
(15,  10003, 'GEN',	1100, true , false),
(15,  10003, 'COM',	2000, true , false),	-- comercial
(15,  10003, 'COM',	2100, true , false),
(15,  10003, 'COM',	2200, true , false),
(15,  10003, 'COM',	2300, true , false),
(15,  10003, 'COM',	2400, true , false),
(15,  10003, 'COM',	2500, true , false),   
(15,  10003, 'COM',	2900, true , false),
-- EDITORIAL-ysinche
(16,  10003, 'GEN',	1000, true , false),	-- generico
(16,  10003, 'GEN',	1100, true , false),
(16,  10003, 'COM',	2000, true , false),	-- comercial
(16,  10003, 'COM',	2100, true , false),
(16,  10003, 'COM',	2200, true , false),

-- GYM-fbarzola
(17,  10004, 'GEN',	1000, true , false),	-- generico
(17,  10004, 'GEN',	1100, true , false),
(17,  10004, 'COM',	2000, true , false),	-- comercial
(17,  10004, 'COM',	2100, true , false),
(17,  10004, 'COM',	2200, true , false),
(17,  10004, 'COM',	2300, true , false),
(17,  10004, 'COM',	2400, true , false),
(17,  10004, 'COM',	2500, true , false),   
(17,  10004, 'COM',	2900, true , false),
-- GYM-ssalazar
(18,  10004, 'GEN',	1000, true , false),	-- generico
(18,  10004, 'GEN',	1100, true , false),
(18,  10004, 'COM',	2000, true , false),	-- comercial
(18,  10004, 'COM',	2100, true , false),
(18,  10004, 'COM',	2200, true , false),
(18,  10004, 'COM',	2300, true , false),
(18,  10004, 'COM',	2400, true , false),
(18,  10004, 'COM',	2500, true , false),   
(18,  10004, 'COM',	2900, true , false),
-- GYM-ysinche
(19,  10004, 'GEN',	1000, true , false),	-- generico
(19,  10004, 'GEN',	1100, true , false),
(19,  10004, 'COM',	2000, true , false),	-- comercial
(19,  10004, 'COM',	2100, true , false),
(19,  10004, 'COM',	2200, true , false),


-- SJB-fbarzola
(20,  10005, 'GEN',	1000, true , false),	-- generico
(20,  10005, 'GEN',	1100, true , false),
(20,  10005, 'COM',	2000, true , false),	-- comercial
(20,  10005, 'COM',	2100, true , false),
(20,  10005, 'COM',	2200, true , false),
(20,  10005, 'COM',	2300, true , false),
(20,  10005, 'COM',	2400, true , false),
(20,  10005, 'COM',	2500, true , false),   
(20,  10005, 'COM',	2900, true , false),
(20,  10005, 'LGT',	3000, true , false),	-- logistico
(20,  10005, 'LGT',	3100, true , false),
(20,  10005, 'LGT',	3200, true , false),
(20,  10005, 'LGT',	3300, true , false),
(20,  10005, 'LGT',	3400, true , false),
(20,  10005, 'LGT',	3900, true , false),
(20,  10005, 'LAB',	4000, true , false),	-- laboral
(20,  10005, 'LAB',	4100, true , false),
(20,  10005, 'LAB',	4200, true , false),
(20,  10005, 'LAB',	4300, true , false),
(20,  10005, 'LAB',	4900, true , false),
(20,  10005, 'FIN',	5000, true , false),	-- financiero
(20,  10005, 'FIN',	5100, true , false),
(20,  10005, 'FIN',	5200, true , false),
(20,  10005, 'FIN',	5300, true , false),
(20,  10005, 'FIN',	5400, true , false),
(20,  10005, 'FIN',	5900, true , false),
(20,  10005, 'ACD',	6000, true , false),	-- academico
(20,  10005, 'ACD',	6010, true , false),
(20,  10005, 'ACD',	6020, true , false),
(20,  10005, 'ACD',	6030, true , false),
(20,  10005, 'ACD',	6040, true , false),
(20,  10005, 'ACD',	6050, true , false),
(20,  10005, 'ACD',	6060, true , false),
(20,  10005, 'ACD',	6900, true , false),
-- SANFER-fbarzola
(20,  10006, 'GEN',	1000, true , false),	-- generico
(20,  10006, 'GEN',	1100, true , false),
(20,  10006, 'COM',	2000, true , false),	-- comercial
(20,  10006, 'COM',	2100, true , false),
(20,  10006, 'COM',	2200, true , false),
(20,  10006, 'COM',	2300, true , false),
(20,  10006, 'COM',	2400, true , false),
(20,  10006, 'COM',	2500, true , false),   
(20,  10006, 'COM',	2900, true , false),
(20,  10006, 'LGT',	3000, true , false),	-- logistico
(20,  10006, 'LGT',	3100, true , false),
(20,  10006, 'LGT',	3200, true , false),
(20,  10006, 'LGT',	3300, true , false),
(20,  10006, 'LGT',	3400, true , false),
(20,  10006, 'LGT',	3900, true , false),
(20,  10006, 'LAB',	4000, true , false),	-- laboral
(20,  10006, 'LAB',	4100, true , false),
(20,  10006, 'LAB',	4200, true , false),
(20,  10006, 'LAB',	4300, true , false),
(20,  10006, 'LAB',	4900, true , false),
(20,  10006, 'FIN',	5000, true , false),	-- financiero
(20,  10006, 'FIN',	5100, true , false),
(20,  10006, 'FIN',	5200, true , false),
(20,  10006, 'FIN',	5300, true , false),
(20,  10006, 'FIN',	5400, true , false),
(20,  10006, 'FIN',	5900, true , false),
(20,  10006, 'ACD',	6500, true , false),	-- academico
(20,  10006, 'ACD',	6510, true , false),
(20,  10006, 'ACD',	6520, true , false),
(20,  10006, 'ACD',	6950, true , false),
-- POLID-fbarzola
(20,  10007, 'GEN',	1000, true , false),	-- generico
(20,  10007, 'GEN',	1100, true , false),
(20,  10007, 'COM',	2000, true , false),	-- comercial
(20,  10007, 'COM',	2100, true , false),
(20,  10007, 'COM',	2200, true , false),
(20,  10007, 'COM',	2300, true , false),
(20,  10007, 'COM',	2400, true , false),
(20,  10007, 'COM',	2500, true , false),   
(20,  10007, 'COM',	2900, true , false),
(20,  10007, 'LGT',	3000, true , false),	-- logistico
(20,  10007, 'LGT',	3100, true , false),
(20,  10007, 'LGT',	3200, true , false),
(20,  10007, 'LGT',	3300, true , false),
(20,  10007, 'LGT',	3400, true , false),
(20,  10007, 'LGT',	3900, true , false),
(20,  10007, 'LAB',	4000, true , false),	-- laboral
(20,  10007, 'LAB',	4100, true , false),
(20,  10007, 'LAB',	4200, true , false),
(20,  10007, 'LAB',	4300, true , false),
(20,  10007, 'LAB',	4900, true , false),
(20,  10007, 'FIN',	5000, true , false),	-- financiero
(20,  10007, 'FIN',	5100, true , false),
(20,  10007, 'FIN',	5200, true , false),
(20,  10007, 'FIN',	5300, true , false),
(20,  10007, 'FIN',	5400, true , false),
(20,  10007, 'FIN',	5900, true , false),

-- SJB-ssalazar
(21,  10005, 'GEN',	1000, true , false),	-- generico
(21,  10005, 'GEN',	1100, true , false),
(21,  10005, 'COM',	2000, true , false),	-- comercial
(21,  10005, 'COM',	2100, true , false),
(21,  10005, 'COM',	2200, true , false),
(21,  10005, 'COM',	2300, true , false),
(21,  10005, 'COM',	2400, true , false),
(21,  10005, 'COM',	2500, true , false),   
(21,  10005, 'COM',	2900, true , false),
(21,  10005, 'LGT',	3000, true , false),	-- logistico
(21,  10005, 'LGT',	3100, true , false),
(21,  10005, 'LGT',	3200, true , false),
(21,  10005, 'LGT',	3300, true , false),
(21,  10005, 'LGT',	3400, true , false),
(21,  10005, 'LGT',	3900, true , false),
(21,  10005, 'LAB',	4000, true , false),	-- laboral
(21,  10005, 'LAB',	4100, true , false),
(21,  10005, 'LAB',	4200, true , false),
(21,  10005, 'LAB',	4300, true , false),
(21,  10005, 'LAB',	4900, true , false),
(21,  10005, 'FIN',	5000, true , false),	-- financiero
(21,  10005, 'FIN',	5100, true , false),
(21,  10005, 'FIN',	5200, true , false),
(21,  10005, 'FIN',	5300, true , false),
(21,  10005, 'FIN',	5400, true , false),
(21,  10005, 'FIN',	5900, true , false),
(21,  10005, 'ACD',	6000, true , false),	-- academico
(21,  10005, 'ACD',	6010, true , false),
(21,  10005, 'ACD',	6020, true , false),
(21,  10005, 'ACD',	6030, true , false),
(21,  10005, 'ACD',	6040, true , false),
(21,  10005, 'ACD',	6050, true , false),
(21,  10005, 'ACD',	6060, true , false),
(21,  10005, 'ACD',	6900, true , false),
-- SANFER-ssalazar
(21,  10006, 'GEN',	1000, true , false),	-- generico
(21,  10006, 'GEN',	1100, true , false),
(21,  10006, 'COM',	2000, true , false),	-- comercial
(21,  10006, 'COM',	2100, true , false),
(21,  10006, 'COM',	2200, true , false),
(21,  10006, 'COM',	2300, true , false),
(21,  10006, 'COM',	2400, true , false),
(21,  10006, 'COM',	2500, true , false),   
(21,  10006, 'COM',	2900, true , false),
(21,  10006, 'LGT',	3000, true , false),	-- logistico
(21,  10006, 'LGT',	3100, true , false),
(21,  10006, 'LGT',	3200, true , false),
(21,  10006, 'LGT',	3300, true , false),
(21,  10006, 'LGT',	3400, true , false),
(21,  10006, 'LGT',	3900, true , false),
(21,  10006, 'LAB',	4000, true , false),	-- laboral
(21,  10006, 'LAB',	4100, true , false),
(21,  10006, 'LAB',	4200, true , false),
(21,  10006, 'LAB',	4300, true , false),
(21,  10006, 'LAB',	4900, true , false),
(21,  10006, 'FIN',	5000, true , false),	-- financiero
(21,  10006, 'FIN',	5100, true , false),
(21,  10006, 'FIN',	5200, true , false),
(21,  10006, 'FIN',	5300, true , false),
(21,  10006, 'FIN',	5400, true , false),
(21,  10006, 'FIN',	5900, true , false),
(21,  10006, 'ACD',	6500, true , false),	-- academico
(21,  10006, 'ACD',	6510, true , false),
(21,  10006, 'ACD',	6520, true , false),
(21,  10006, 'ACD',	6950, true , false),
-- POLID-ssalazar
(21,  10007, 'GEN',	1000, true , false),	-- generico
(21,  10007, 'GEN',	1100, true , false),
(21,  10007, 'GEN',	1900, true , false),
(21,  10007, 'COM',	2000, true , false),	-- comercial
(21,  10007, 'COM',	2100, true , false),
(21,  10007, 'COM',	2200, true , false),
(21,  10007, 'COM',	2300, true , false),
(21,  10007, 'COM',	2400, true , false),
(21,  10007, 'COM',	2500, true , false),   
(21,  10007, 'COM',	2900, true , false),
(21,  10007, 'LGT',	3000, true , false),	-- logistico
(21,  10007, 'LGT',	3100, true , false),
(21,  10007, 'LGT',	3200, true , false),
(21,  10007, 'LGT',	3300, true , false),
(21,  10007, 'LGT',	3400, true , false),
(21,  10007, 'LGT',	3900, true , false),
(21,  10007, 'LAB',	4000, true , false),	-- laboral
(21,  10007, 'LAB',	4100, true , false),
(21,  10007, 'LAB',	4200, true , false),
(21,  10007, 'LAB',	4300, true , false),
(21,  10007, 'LAB',	4900, true , false),
(21,  10007, 'FIN',	5000, true , false),	-- financiero
(21,  10007, 'FIN',	5100, true , false),
(21,  10007, 'FIN',	5200, true , false),
(21,  10007, 'FIN',	5300, true , false),
(21,  10007, 'FIN',	5400, true , false),
(21,  10007, 'FIN',	5900, true , false);


*/










--QUE SISTEMAS VAN EN CADA SEDE ooooooooooooooooo QUE USUARIOS TIENEN HABILITADOS ROLES/SISTEMAS EN SEDES 
	-- QUE USUARIOS USARAN EL SISTEMA EN CADA SEDE
	--SI NO ESTA DEFINIDO EL SISTEMA EN UNA SEDE, ENTONCES NO SE HABILITARA AL USUARIO EN ESA SEDE
	
	       
	-- LOS USUARIOS SE DEFINE UN PERFIL/ROL EN UNA SEDE, ESTARIA ABIERTO PARA DEFINIR CUALQUIER ROL EN CUALQUIER SEDE
	--FBO OLIVARES CAJERO EN HUANCAYO
	--FBO OLIVARES CAJERO EN JAUAB 
	--FBO OLIVARES CAJERO EN PAMPAS
----------------------------------------------------------------------------------------------------------------------------------------
--adm_negocio_sede_sistema--------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
/*
drop table if exists adm_negocio_sede_sistema; --no IRIRA no IRIA
CREATE TABLE adm_negocio_sede_sistema (
	id_neg_sede_sis		serial		NOT null PRIMARY KEY,
	id_negocio_sede		int			NOT NULL,
	id_sistema			char(3)		NOT NULL,
	activo				bool		not null,
	CONSTRAINT negocio_sede_sistema_id_negocio_sede_fkey FOREIGN KEY (id_negocio_sede) REFERENCES adm_negocio_sede(id_negocio_sede) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT negocio_sede_sistema_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES adm_sistema(id_sistema) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
INSERT INTO adm_negocio_sede_sistema (id_negocio_sede, id_sistema, activo) 
VALUES  (1, 'GEN', true),   
        (1, 'COM', true),
        (6, 'GEN', true),
        (6, 'COM', true),
        (6, 'LGT', true);
*/

       
--INSERT INTO adm_negocio_sede_sistema (id_negocio, id_sede, activo_sede, id_sistema, activo_sistema) 
--VALUES  (10005, 7, true, 'GEN', true), (10005, 8, true, 'GEN', true);



 
       



--=====================================================================================================================================================
--=====================================================================================================================================================
--=====================================================================================================================================================



--LAS SEDES DONDE TRABJARA SERIA AL LOGUEARSE O AL MOMENTO DE BRIT SUS CAJA, SU FONDO FIJO, SU SONA REGION, ???????????
/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.negocio_sede_sistema_usuario------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.negocio_sede_sistema_usuario;
CREATE TABLE gen.negocio_sede_sistema_usuario (
	id_neg_sede_sis_usu	serial		NOT null PRIMARY KEY,
	--id_neg_sede_sis		int			NOT NULL,	
	id_negocio			int			not null,
	id_sede				int			not null,
	id_sistema			char(3)		NOT NULL,
	id_usuario			bigint		not null,
	id_rol				int			not null,
	activo				bool		not null--,
	--CONSTRAINT negocio_sede_sistema_usuario_id_neg_sede_sis_fkey FOREIGN KEY (id_neg_sede_sis) REFERENCES gen.negocio_sede_sistema(id_neg_sede_sis) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	--CONSTRAINT negocio_sede_sistema_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES gen.usuario(id_usuario) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--ALTER SEQUENCE gen.negocio_sede_sistema_usuario_id_neg_sede_sis_usu_seq RESTART WITH 31;
--
COMMENT ON TABLE gen.negocio_sede_sistema_usuario IS 'Roles que tiene asignado un usuario por sede y negocio.'; 
COMMENT ON COLUMN gen.negocio_sede_sistema_usuario.id_neg_sede_sis_usu IS 'Identificador único';
--
INSERT INTO gen.negocio_sede_sistema_usuario (id_negocio, id_sede, id_sistema, id_usuario, id_rol, activo) 
VALUES 
(10005,  6  ,  'GEN' , 20 , 1000  , true ),	
(10005,  7  ,  'GEN' , 20 , 1100  , true ),	
(10005,  8  ,  'GEN' , 20 , 1900  , true ),	
(10005,  9  ,  'GEN' , 20 , 2000  , true ),	
(10005, 10  ,  'GEN' , 20 , 2100  , true ),	
(10005, 11  ,  'GEN' , 20 , 2200  , true ),	
(10005, 12  ,  'GEN' , 20 , 2300  , true ),	
(10005, 13  ,  'GEN' , 20 , 2400  , true ),	
(10005, 14  ,  'GEN' , 20 , 2500  , true ),

(10005,  6  ,  'COM' , 20 , 1000  , true ),	
(10005,  7  ,  'COM' , 20 , 1100  , true ),	
(10005,  8  ,  'COM' , 20 , 1900  , true ),	
(10005,  9  ,  'COM' , 20 , 2000  , true ),	
(10005, 10  ,  'COM' , 20 , 2100  , true ),	
(10005, 11  ,  'COM' , 20 , 2200  , true ),	
(10005, 12  ,  'COM' , 20 , 2300  , true ),	
(10005, 13  ,  'COM' , 20 , 2400  , true ),	
(10005, 14  ,  'COM' , 20 , 2500  , true );
*/	

/*
SELECT DISTINCT B.id_sede, nom_sede, dir_sede, id_distrito, id_empresa, oficial, cod_sunat, ruta_fe, token_fe 
FROM gen.negocio_sede_sistema_usuario A 
	INNER JOIN gen.sede B ON (A.id_sede=B.id_sede) 
WHERE A.id_usuario = 20;
*/









/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.ubicacion-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.ubicacion; 
create table gen.ubicacion ( 
	id_ubicacion		serial			not null primary key, 
	id_empresa			int				not null, 
	id_negocio			char(6)			not null,
	id_sede				int				NOT NULL,
	id_tipo_ubicacion	int				NOT NULL,
	nombre				varchar(50)		NOT NULL,	
	otro1				varchar(50)		NOT NULL,	--PARA: puntos_venta (almacenes asociados); series (tipo_comprobante);
	otro2				varchar(50)		NOT NULL,	--PARA: puntos_venta (campañas vigente); series (numero_comprobante); caja_banco_boveda_ff (moneda);
	activo				bool			NOT NULL
);
-- 
insert into gen.ubicacion (id_empresa, id_negocio, id_sede, id_tipo_ubicacion, nombre, otro1, otro2, activo) 
values 
(1001, 10001, 1, 153 , 'ALMACEN GENERAL'				, ''				,  ''			  ,true ),	
(1001, 10001, 1, 150 , 'PUNTO DE VENTA ZONA CENTRO'		, 'id_alm1;idalm2'	,  'camp1;camp2'  ,true ),	
(1001, 10001, 1, 151 , 'F001'							, '03'				,  '150'		  ,false), --PUEDE FACTUURAR SIN NOTA PEDIDO, PONIENDO O NO EL ID DEL VENDEDOR
(1001, 10001, 1, 151 , 'FE01'							, '01'				,  '24589'		  ,true ),
(1001, 10001, 1, 151 , 'FC01'							, '07'				,  '17'			  ,true ),
(1001, 10001, 1, 151 , 'HYO.2018'						, 'NP'				,  '2018.0000001' ,true ),
(1001, 10001, 1, 151 , 'HYO.2019'						, 'INSC'			,  '2020.0000001' ,true ),
(1001, 10001, 1, 152 , 'HY1.CAJ01'						, ''				,  'SOL'		  ,true ),
(1001, 10001, 1, 155 , 'INTERBANK CTA. AHORROS SOLES'	, ''				,  'SOL'		  ,true ),
                                                                                              
(1002, 10002, 2, 153 , 'ALMACEN GENERAL'				, ''				,  ''			  ,true ),	
(1002, 10002, 2, 150 , 'PUNTO DE VENTA ZONA CENTRO'		, 'id_alm01'		,  'no campañs'	  ,true ),
(1002, 10002, 2, 151 , 'BE01'							, '03'				,  '150'		  ,true ),
(1002, 10002, 2, 151 , 'BE02'							, '03'				,  '150'		  ,true ),
(1002, 10002, 2, 151 , 'FE01'							, '01'				,  '150'		  ,true ),
(1002, 10002, 2, 151 , 'FE02'							, '01'				,  '150'		  ,true ),
(1002, 10002, 2, 151 , 'BC01'							, '07'				,  '150'		  ,true ),
(1002, 10002, 2, 151 , 'BC02'							, '07'				,  '150'		  ,true ),
(1002, 10002, 2, 151 , 'FC01'							, '07'				,  '150'		  ,true ),
(1002, 10002, 2, 151 , 'FC02'							, '07'				,  '150'		  ,true ),
(1002, 10002, 2, 151 , 'FE01'							, '01'				,  '24589'		  ,true ),
(1002, 10002, 2, 152 , 'HY1.CAJ01'						, ''				,  'SOL'		  ,true ),
(1002, 10002, 2, 156 , 'HY1.BOVEDA'						, ''				,  'SOL'		  ,true ),
(1002, 10002, 2, 155 , 'BBVA CTA. AHORROS SOLES'		, ''				,  'SOL'		  ,true ),
                                                                                              
(1003, 10003, 3, 153 , 'ALMACEN GENERAL'				, ''				,  ''			  ,true ),	
(1003, 10003, 3, 150 , 'PUNTO DE VENTA ZONA CENTRO'		, 'id_alm01'		,  'no campañs'	  ,true ),
(1003, 10003, 3, 151 , 'BE01'							, '03'				,  '150'		  ,true ),
(1003, 10003, 3, 151 , 'FE01'							, '01'				,  '150'		  ,true ),
(1003, 10003, 3, 151 , 'BC01'							, '07'				,  '150'		  ,true ),
(1003, 10003, 3, 151 , 'FC01'							, '07'				,  '150'		  ,true ),
(1001, 10001, 1, 152 , 'HY1.CAJ01'						, ''				,  'SOL'		  ,true ),
(1003, 10003, 3, 156 , 'HY1.BOVEDA'						, ''				,  'SOL'		  ,true ),
(1003, 10003, 3, 155 , 'BBVA CTA. AHORROS SOLES'		, ''				,  'SOL'		  ,true ),
                                                                                              
(1004, 10004, 4, 153 , 'ALMACEN GENERAL'				, ''				,  ''			  ,true ),	
(1004, 10004, 4, 150 , 'PUNTO DE VENTA ZONA CENTRO'		, 'id_alm01'		,  'no campañs'	  ,true ),
(1004, 10004, 4, 151 , 'BE01'							, '03'				,  '150'		  ,true ),
(1004, 10004, 4, 151 , 'FE01'							, '01'				,  '150'		  ,true ),
(1004, 10004, 4, 151 , 'BC01'							, '07'				,  '150'		  ,true ),
(1004, 10004, 4, 151 , 'FC01'							, '07'				,  '150'		  ,true ),
(1004, 10004, 4, 152 , 'HY1.CAJ01'						, ''				,  'SOL'		  ,true ),
(1004, 10004, 4, 156 , 'HY1.BOVEDA'						, ''				,  'SOL'		  ,true ),
(1004, 10004, 4, 155 , 'BBVA CTA. AHORROS SOLES'		, ''				,  'SOL'		  ,true ),
                                                                                              
(1005, 10005, 5, 153 , 'ALMACEN GENERAL'				, ''				,  ''			  ,true ),
(1005, 10005, 5, 150 , 'PUNTO DE VENTA HYO'				, 'id_alm01'		,  'ini;pri;sec'  ,true ),
(1005, 10005, 5, 151 , 'BC21'							, '03'				,  '150'		  ,true ),
(1005, 10005, 5, 151 , 'BC22'							, '03'				,  '150'		  ,true ),
(1005, 10005, 5, 151 , 'BC23'							, '03'				,  '150'		  ,true ),
(1005, 10005, 5, 151 , 'FC21'							, '01'				,  '150'		  ,true ),
(1005, 10005, 5, 151 , 'FC22'							, '01'				,  '150'		  ,true ),
(1005, 10005, 5, 151 , 'FC23'							, '01'				,  '150'		  ,true ),
(1005, 10005, 5, 151 , 'BC21'							, '07'				,  '150'		  ,true ),
(1005, 10005, 5, 151 , 'FC21'							, '07'				,  '150'		  ,true ),
(1005, 10005, 5, 152 , 'HY1.CAJ01'						, ''				,  'SOL'		  ,true ),
(1005, 10005, 5, 156 , 'HY1.BOVEDA-COLE'				, ''				,  'SOL'		  ,true ),
(1005, 10005, 5, 155 , 'BBVA CTA. AHORROS SOLES'		, ''				,  'SOL'		  ,true ),
                                                                                              
(1005, 10006, 5, 153 , 'ALMACEN GENERAL ACAEMIA'		, ''				,  ''			  ,true ),
(1005, 10006, 5, 150 , 'PUNTO DE VENTA HYO'				, 'id_alm01'		,  'sem;se2;ps1'  ,true ),
(1005, 10006, 5, 151 , 'BA21'							, '03'				,  '150'		  ,true ),
(1005, 10006, 5, 151 , 'BA22'							, '03'				,  '150'		  ,true ),
(1005, 10006, 5, 151 , 'BA23'							, '03'				,  '150'		  ,true ),
(1005, 10006, 5, 151 , 'FA24'							, '01'				,  '150'		  ,true ),
(1005, 10006, 5, 151 , 'FA25'							, '01'				,  '150'		  ,true ),
(1005, 10006, 5, 151 , 'FA21'							, '01'				,  '150'		  ,true ),
(1005, 10006, 5, 151 , 'BA21'							, '07'				,  '150'		  ,true ),
(1005, 10006, 5, 151 , 'FA21'							, '07'				,  '150'		  ,true ),
(1005, 10006, 5, 152 , 'HY1.CAJ01'						, ''				,  'SOL'		  ,true ),
(1005, 10006, 5, 152 , 'HY1.CAJ02'						, ''				,  'SOL'		  ,true ),
(1005, 10006, 5, 152 , 'HY1.CAJ03'						, ''				,  'SOL'		  ,true ),
(1005, 10006, 5, 152 , 'HY1.CAJ04'						, ''				,  'SOL'		  ,true ),
(1005, 10006, 5, 152 , 'HY1.CAJ05'						, ''				,  'SOL'		  ,true ),
(1005, 10006, 5, 156 , 'HY1.BOVEDA-ACAD'				, ''				,  'SOL'		  ,true ),
(1005, 10006, 5, 155 , 'BBVA CTA. AHORROS SOLES'		, ''				,  'SOL'		  ,true ),
                                                                                              
(1005, 10007, 5, 153 , 'ALMACEN GENERAL POLIDEPORT'		, ''				,  ''			  ,true ),
(1005, 10007, 5, 150 , 'PUNTO DE VENTA HYO'				, 'id_alm01'		,  'sem;se2;ps1'  ,true ),
(1005, 10007, 5, 151 , 'FC21'							, '01'				,  '150'		  ,true ),
(1005, 10007, 5, 151 , 'BC21'							, '03'				,  '150'		  ,true ),
(1005, 10007, 5, 151 , 'BX21'							, '07'				,  '150'		  ,true ),
(1005, 10007, 5, 151 , 'FX21'							, '07'				,  '150'		  ,true ),
(1005, 10007, 5, 152 , 'HY1.CAJ01'						, ''				,  'SOL'		  ,true ),
(1005, 10007, 5, 156 , 'HY1.BOVEDA-ACAD'				, ''				,  'SOL'		  ,true ),
(1005, 10007, 5, 155 , 'BBVA CTA. AHORROS SOLES'		, ''				,  'SOL'		  ,true ),
                                                                                              
(1006, 10008, 4, 153 , 'PILCO.ALM.GENERAL'				, ''				,  ''			  ,true),	-- motors 1 PTO VENTA POR VENDEDOR
(1006, 10008, 5, 153 , 'SPEDR.ALM.GENERAL'				, ''				,  ''			  ,true),
(1006, 10008, 6, 153 , 'PQIND.ALM.GENERAL'				, ''				,  ''			  ,true),			
(1006, 10008, 4, 150 , 'PILCO.PUNTO VENTA 1'			, 'alm1'			,  'camp1'		  ,true),
(1006, 10008, 5, 150 , 'SPEDR.PUNTO VENTA 1'			, 'alm2'			,  'camp2'		  ,true),
(1006, 10008, 6, 150 , 'PQIND.PUNTO VENTA 1'			, 'alm3'			,  'camp3'		  ,true),
(1006, 10008, 6, 150 , 'PQIND.PUNTO VENTA 2'			, 'alm3'			,  'camp3'		  ,true),
(1006, 10008, 6, 150 , 'PQIND.PUNTO VENTA 3'			, 'alm3'			,  'camp3'		  ,true),
(1006, 10008, 6, 150 , 'PQIND.PUNTO VENTA 4'			, 'alm3'			,  'camp3'		  ,true),
(1006, 10008, 6, 150 , 'PQIND.PUNTO VENTA 5'			, 'alm3'			,  'camp3'		  ,true),
(1006, 10008, 4, 151 , 'F001'	   						, ''				,  '123'		  ,true),
(1006, 10008, 4, 151 , 'B001'	   						, ''				,  '123'		  ,true),
(1006, 10008, 4, 151 , 'FC01'       					, ''				,  '123'		  ,true),
(1006, 10008, 4, 151 , 'BC01'       					, ''				,  '123'		  ,true),
(1006, 10008, 5, 151 , 'F002'	   						, ''				,  '123'		  ,true),
(1006, 10008, 5, 151 , 'B002'	   						, ''				,  '123'		  ,true),
(1006, 10008, 5, 151 , 'FC02'       					, ''				,  '123'		  ,true),
(1006, 10008, 5, 151 , 'BC02'       					, ''				,  '123'		  ,true),
(1006, 10008, 6, 151 , 'F003'	   						, ''				,  '123'		  ,true),
(1006, 10008, 6, 151 , 'B003'	   						, ''				,  '123'		  ,true),
(1006, 10008, 6, 151 , 'FC03'       					, ''				,  '123'		  ,true),
(1006, 10008, 6, 151 , 'BC03'       					, ''				,  '123'		  ,true),
(1006, 10008, 4, 152 , 'PILCO.CAJA01'					, ''				,  'SOL'		  ,true), 
(1006, 10008, 5, 152 , 'SPEDR.CAJA01'					, ''				,  'SOL'		  ,true), 
(1006, 10008, 6, 152 , 'PQIND.CAJA01'					, ''				,  'SOL'		  ,true);
*/


/*
----------------------------------------------------------------------------------------------------------------------------------------
--gen.usuario_rol_ubicacion-------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists gen.usuario_rol_ubicacion; 
create table gen.usuario_rol_ubicacion ( 
	id_usu_rol_ubic	serial			not null primary key,
	id_usuario_rol	int				not null,
	id_ubicacion	int				not null,
	id_usuario		bigint			not null,
	activo			bool			NOT null,
	CONSTRAINT usuario_rol_ubicacion_id_usuario_rol_fkey FOREIGN KEY (id_usuario_rol) REFERENCES gen.usuario_rol(id_usuario_rol) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT usuario_rol_ubicacion_id_ubicacion_fkey FOREIGN KEY (id_ubicacion) REFERENCES gen.ubicacion(id_ubicacion) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action
);
--
insert into gen.usuario_rol_ubicacion (id_usuario_rol, id_ubicacion, id_usuario, activo)
values 
(   4,    2,  1, true),--VTA
(   5,    3,  1, true),--FAC
(   5,    4,  1, true),
(   5,    5,  1, true),
(   5,    6,  1, true),
(   5,    7,  1, true),
(   6,    8,  1, true);--CAJA

*/






/*
select c.id_negocio, c.id_tipo_negocio, c.nom_negocio, c.principal, c.activo, c.productos, c.id_empresa 
from gen.usuario_rol a
	inner join gen.negocio_sistema b on (a.id_negocio_sistema=b.id_negocio_sistema)
	inner join gen.negocio c on (b.id_negocio=C.id_negocio)
where a.activo=true and b.activo=true and c.activo=true and a.id_usuario=1
*/


--select * from gen.usuario
--select * from gen.sede
--select * from gen.distrito
--VARGEN
--MONTO MAXIMO PARA NO EXIGIR DNI O RUC U OTRO DOC   => 699.99
/*
( 150, 'EFECTIVO'										, 	''					, 	'1'		,	'TI.PAGO'	,   1, true ,	'COM'),	--Anexo2 SUNAT T16.TipoPago
( 151, 'DEPÓSITO EN CUENTA'								, 	''					, 	'2'		,	'TI.PAGO'	,   2, true ,	'COM'),
( 152, 'TARJETA DÉBITO/CRÉDITO'							, 	''					, 	'2'		,	'TI.PAGO'	,   5, true ,	'COM'),
( 153, 'TRANSFERENCIA INTERBANCARIA'					, 	''					, 	'2'		,	'TI.PAGO'	,   4, true ,	'COM'),
( 154, 'CHEQUE'											, 	''					, 	'6'		,	'TI.PAGO'	,   3, true ,	'COM'),
( 155, 'OTROS'											, 	''					, 	'3'		,	'TI.PAGO'	,   6, false,	'COM');



AL PONER ALQUILER, VERIFICAR QUE EL CONCEPTO ESTA MARCADO COMO UN BIEN QUE SE PUEDE CONTROLAR POR DIAS Y HORAS
Y MOSTRAR FORMULARIO PARA SELECCIONAR LOS BIENES DISPONIBLES Y ESTABLECER LOS DIAS Y HORAS DE ALQUILER
 */
 






/*

--CAMBIAR POR AMBIENTE CAMBIAR POR AMBIENTE CAMBIAR POR AMBIENTECAMBIAR POR AMBIENTE
----------------------------------------------------------------------------------------------------------------------------------------
--adm_ambiente-----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists adm_ambiente;
create table adm_ambiente (
	id_ambiente		serial			NOT NULL PRIMARY KEY,	
	id_negocio		int				not null,
	id_tipo_amb		int				not null,
	sigla			varchar(10) 	not null,	
	nom_ambiente	varchar(100) 	not null,	
	activo			bool		 	not null,
	id_sede			int 			not null,
	bloque			varchar(50)		not null,
	piso			varchar(50)		not null
);

insert into adm_ambiente (id_negocio, id_tipo_amb, sigla, nom_ambiente, activo, id_sede, bloque, piso)
values
(10005, 9999 , 'LB1AU001'  , 'AUDITORIO 01' 			, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'LB1AU002'  , 'AUDITORIO 02' 			, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'LB1LB001'  , 'LABORATORIO COMPUTO'		, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'LB1SA001'  , 'SALON MATEMATICA'			, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'LB1SA002'  , 'SALON MATEMATICA'			, true, 7777 , '' , 'Primero'),

(10005, 9999 , 'CZ1OF101'  , 'INFORMES' 				, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF102'  , 'TESORERÍA' 				, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF103'  , 'RECURSOS HUMANOS'			, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF104'  , 'FINANZAS'					, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF105'  , 'GERENCIA ADMINISTRATIVA'	, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF106'  , 'SECRETARÍA'				, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF107'  , 'GERENCIA EDUCATIVA'		, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF106'  , 'GERENCIA GENERAL'			, true, 7777 , '' , 'Primero'),

(10005, 9999 , 'CZ1OF201'  , 'ASUNTOS ACADÉMICOS'		, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF202'  , 'CONTABILIDAD'				, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF203'  , 'SALA DE JUNTAS'			, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF204'  , 'SALA AUXILIAR'			, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF205'  , 'CALIDAD EDUCATIVA'		, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF301'  , 'SISTEMAS'					, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF302'  , 'DIAGRAMACIÓN'				, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1OF303'  , 'ALMACÉN'					, true, 7777 , '' , 'Primero'),

(10005, 9999 , 'CZ1SA101'  , 'SALÓN 101'				, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1SA102'  , 'SALÓN 102'				, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1SA201'  , 'SALÓN 103'				, true, 7777 , '' , 'Primero'),
(10005, 9999 , 'CZ1SA201'  , 'SALÓN 104'				, true, 7777 , '' , 'Primero');
	--is_caja				--ingresos, egresos   PERO dentro de un area se configuraria las cajas
	--is_almacen			--si en esa sede se encuentra algun almacen PERO el ambiene dentro de una sede determina si es almacem
	--is_academico		    -- os amvinetess dentro de una sde determinaran si es academivo (salones), comercial(oficinas, cajas, tesoeris),

select * from adm_ambiente;
*/

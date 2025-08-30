---------------------------------------------------------------------------------------------------------------------------------------
--lab.trab_clase------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists lab.trab_clase; 
CREATE TABLE lab.trab_clase (
	id_trab_clase		serial			NOT null primary key,
	id_empresa			int				NOT NULL,
	id_tipo_cat_trab	int				NOT NULL,
	cat_trab			varchar(10) 	NOT NULL,
	id_tipo_tip_trab	int 			NOT NULL,
	tip_trab			varchar(10)		NOT NULL,
	id_tipo_ce_costo	int				NOT NULL,
	ce_costo			varchar(10)		NOT NULL,
	nom_trab_clase		varchar(50)		NOT NULL,
	activo 				bool			not null,
	orden				int				not null
);
--
INSERT INTO lab.trab_clase (id_empresa, id_tipo_cat_trab, cat_trab, id_tipo_tip_trab, tip_trab, id_tipo_ce_costo,  ce_costo, nom_trab_clase, activo, orden) 
VALUES 
( 1005, 600, 'ACC' , 638 , 'ACCI' , 673 , '---' , 'ACCIONISTA'				, true  ,  1 ),
( 1005, 601, 'DIR' , 639 , 'DIRE' , 673 , '---' , 'MIEMBRO DE DIRECTORIO'	, true  ,  2 ),
( 1005, 602, 'EJE' , 610 , 'EJEC' , 670 , 'ADM' , 'GERENCIA'				, true  ,  3 ),
( 1005, 602, 'EJE' , 610 , 'EJEC' , 671 , 'PRO' , 'GERENCIA'				, true  ,  4 ),
( 1005, 602, 'EJE' , 610 , 'EJEC' , 672 , 'VTA' , 'GERENCIA'				, true  ,  5 ),
( 1005, 603, 'EMP' , 611 , 'EMPL' , 670 , 'ADM' , 'JEFATURA'				, true  ,  6 ),
( 1005, 603, 'EMP' , 611 , 'EMPL' , 671 , 'PRO' , 'JEFATURA'				, true  ,  7 ),
( 1005, 603, 'EMP' , 611 , 'EMPL' , 672 , 'VTA' , 'JEFATURA'				, true  ,  8 ),
( 1005, 603, 'EMP' , 611 , 'EMPL' , 670 , 'ADM' , 'ADMINISTRATIVO'			, true  ,  9 ),
( 1005, 603, 'EMP' , 611 , 'EMPL' , 671 , 'PRO' , 'ADMINISTRATIVO'			, true  ,  10),
( 1005, 603, 'EMP' , 611 , 'EMPL' , 672 , 'VTA' , 'ADMINISTRATIVO'			, true  ,  11),
( 1005, 603, 'EMP' , 611 , 'EMPL' , 671 , 'PRO' , 'DIRECCIÓN'				, true  ,  12),	--en otra tabla se asignara la unidad_de_produccion
( 1005, 603, 'EMP' , 611 , 'EMPL' , 671 , 'PRO' , 'COORDINACIÓN'			, true  ,  13),	--idem
( 1005, 603, 'EMP' , 611 , 'EMPL' , 671 , 'PRO' , 'AUXILIAR'				, true  ,  14),  --idem
( 1005, 603, 'EMP' , 611 , 'EMPL' , 671 , 'PRO' , 'DOCENTE'					, true  ,  15),  --idem
( 1005, 604, 'OBR' , 612 , 'OBRE' , 670 , 'ADM' , 'MANT. SEG. Y CHOFER'		, true  ,  16),
( 1005, 604, 'OBR' , 612 , 'OBRE' , 671 , 'PRO' , 'MANT. SEG. Y CHOFER'		, true  ,  17),
( 1005, 604, 'OBR' , 612 , 'OBRE' , 672 , 'VTA' , 'MANT. SEG. Y CHOFER'		, true  ,  18),
( 1005, 604, 'OBR' , 612 , 'OBRE' , 670 , 'ADM' , 'SERVICIO'				, true  ,  19),
( 1005, 604, 'OBR' , 612 , 'OBRE' , 671 , 'PRO' , 'SERVICIO'				, true  ,  20),
( 1005, 604, 'OBR' , 612 , 'OBRE' , 672 , 'VTA' , 'SERVICIO'				, true  ,  21),
( 1005, 605, 'TER' , 640 , 'TERC' , 672 , 'ADM' , 'ASESORÍA PROFESIONAL'	, true  ,  22),
( 1005, 605, 'TER' , 640 , 'TERC' , 672 , 'PRO' , 'ASESORÍA PROFESIONAL'	, true  ,  23),
( 1005, 605, 'TER' , 640 , 'TERC' , 672 , 'VTA' , 'ASESORÍA PROFESIONAL'	, true  ,  24),
( 1005, 605, 'TER' , 640 , 'TERC' , 672 , 'ADM' , 'APOYO EXTERNO'			, true  ,  25),
( 1005, 605, 'TER' , 640 , 'TERC' , 672 , 'PRO' , 'APOYO EXTERNO'			, true  ,  26),
( 1005, 605, 'TER' , 640 , 'TERC' , 672 , 'VTA' , 'APOYO EXTERNO'			, true  ,  27);

--select * from lab.trab_clase





--#### BORRAR BORRAR BORRAR BORRAR ##########-----
--#### BORRAR BORRAR BORRAR BORRAR ##########-----
--#### BORRAR BORRAR BORRAR BORRAR ##########-----
--#### BORRAR BORRAR BORRAR BORRAR ##########-----
--#### BORRAR BORRAR BORRAR BORRAR ##########-----
----------------------------------------------------------------------------------------------------------------------------------------
--gen.fn_institucion_estudio_count_uso--------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
/*
DROP FUNCTION IF EXISTS gen.fn_institucion_estudio_count_uso; 
CREATE FUNCTION gen.fn_institucion_estudio_count_uso (_id_inst_est int) RETURNS int AS $$
BEGIN

	RETURN  
	 (select count(id_inst_est) from lab.trabajador where  id_inst_est = _id_inst_est)
	 + 
	 (select count(id_inst_est) from lab.trabajador where  id_inst_est = 9999);		--poner otras entidades, como alumno_cole y alumno_acad

END;
$$ LANGUAGE plpgsql;
*/

--select gen.fn_institucion_estudio_count_uso(5)






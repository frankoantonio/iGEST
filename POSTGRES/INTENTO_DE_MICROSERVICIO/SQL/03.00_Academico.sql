----------------------------------------------------------------------------------------------------------------------------------------
--acd.area_prof-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists acd.area_prof;
create table acd.area_prof (
	id_area_prof		serial			NOT NULL PRIMARY KEY,
	id_negocio			int	 			not null,
	nom_area_prof		varchar(50) 	not null,
	id_tipo_grupo_est	int 			not null,
	activo				boolean			not null,
	orden				int				not null
);
--
INSERT INTO acd.area_prof (id_area_prof, id_negocio, nom_area_prof, id_tipo_grupo_est, activo, orden)
values (0,   -1, '<SIN INDICAR>'		, 1029, true , 0 );
--
INSERT INTO acd.area_prof (id_negocio, nom_area_prof, id_tipo_grupo_est, activo, orden)
values 
(10006, 'ÁREA I'			, 1020, true , 1  ),
(10006, 'ÁREA II'			, 1020, true , 2  ),
(10006, 'ÁREA III'			, 1021, true , 3  ),
(10006, 'ÁREA IV'			, 1021, true , 4  ),
(10006, 'ÁREA V'			, 1020, true , 5  ),
(10006, 'ESFUERZO FÍSICO'	, 1022, true , 6  ),
(10006, 'CONOCIMIENTOS'		, 1023, true , 7  ),
(10006, 'ÚNICO'				, 1024, true , 8  ),
(10006, 'GRUPO 01'			, 1025, true , 9  ),
(10006, 'GRUPO 02'			, 1025, true , 10 ),
(10006, 'GRUPO 03'			, 1025, true , 11 ),
(10006, 'GRUPO 04'			, 1025, true , 12 ),
(10006, 'GRUPO 05'			, 1025, true , 13 ),
(10006, 'GRUPO 06'			, 1025, true , 14 ),
(10006, 'GRUPO 07'			, 1025, true , 15 ),
(10006, 'GRUPO 08'			, 1025, true , 16 ),
(10006, 'GRUPO 09'			, 1025, true , 17 ),
(10006, 'GRUPO 10'			, 1025, true , 18 );

select * from acd.area_prof;


--AL MATRICULARLOS DIFERENCIAR SI EL GRAD/SECCION ES DE EBR OFICIAL O SOLO PREPARACION PREUNIVERSITARIA O REFORZAMIENTO ACADEMICO
--TAMBIEN INDICAR SI UN GRADO/SECCION TENDRA EVALUACION TIPO PREUNIVERSITARIO
--EN LA TABLA ÁREAS TAMBIN PONER LOS CURSOS INDICAR SI SON DE EBR O DE ACADEMIA U OTRO 

----------------------------------------------------------------------------------------------------------------------------------------
--acd.nivel_edu-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists acd.nivel_edu;
create table acd.nivel_edu (
	id_niv_edu		  	int				NOT NULL PRIMARY KEY, -- es el mismo codigo de la tabla prod_proy id_prod_proy
	id_negocio			int				not null,		
	id_tipo_niv_educ 	int 			not null,	--x,y,z INI,PRI,SEC
	--id_prod_proy		int				not null,
	nom_niv_edu		  	varchar(150) 	not null,	
	postula			  	bool 			not null,	--para solicitar la carrera y area profesional al que postula
	orden			  	int 			not null,	
	activo			  	bool	 		not null,
	CONSTRAINT nivel_edu_id_niv_edu_fkey FOREIGN KEY (id_niv_edu) REFERENCES com.producto_proyecto (id_prod_proy) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
INSERT INTO acd.nivel_edu (id_niv_edu, id_negocio, id_tipo_niv_educ, nom_niv_edu, postula, orden, activo) --id_prod_proy
values 
--(  4,  10004 ,  1000,  4,  'ESC. FUTBOL'		, false, 1 , true ),
	
( 5, 10005 ,  1001, 'INICIAL'					, false, 1 , true ),
( 6, 10005 ,  1002, 'PRIMARIA'					, false, 2 , true ),
( 7, 10005 ,  1003, 'SECUNDARIA'				, false, 3 , true ),
					
( 9, 10006 ,  1000, 'INTENSIVO'					, true , 1 , true ),
(10, 10006 ,  1000, 'PRIMERA SELECCIÓN'			, true , 2 , true ),
(11, 10006 ,  1000, 'SEMESTRAL'					, true , 3 , true ),
(12, 10006 ,  1000, 'REPASO'					, true , 4 , true ),
(13, 10006 ,  1000, 'CICLADO INICIAL'			, false, 5 , true ),
(14, 10006 ,  1000, 'CICLADO PRIMARIA'			, false, 6 , true ),
(15, 10006 ,  1000, 'CICLADO SECUNDARIA'		, false, 7 , true ),
(16, 10006 ,  1000, 'CICLADO ANUAL'				, false, 8 , true ),
(17, 10006 ,  1000, 'REFORZAMIENTO ACADÉMICO'	, false, 9 , true ),
(18, 10006 ,  1000, 'TALLERES'					, false,10 , false);


select * from acd.nivel_edu ne ;


----------------------------------------------------------------------------------------------------------------------------------------
--acd.grado-----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists acd.grado;
create table acd.grado (
	id_grado		serial			NOT NULL PRIMARY KEY,
	id_negocio		int	 			not null,
	num_grado		int			 	not null,
	nom_grado		varchar(50) 	not null,	
	id_grado_sgte	int 			not null,
	id_niv_edu		int				not null,	
	activo			boolean			not null,	
	id_area_prof	int				not null,
	CONSTRAINT grado_id_niv_edu_fkey FOREIGN KEY (id_niv_edu) REFERENCES acd.nivel_edu(id_niv_edu) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT grado_id_area_prof_fkey FOREIGN KEY (id_area_prof) REFERENCES acd.area_prof(id_area_prof) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
INSERT INTO acd.grado (id_negocio, num_grado, nom_grado, id_grado_sgte, id_niv_edu, activo, id_area_prof)
values 
(10005 ,  3, '3 AÑOS'			,  2 ,  5 , true ,    0 ),
(10005 ,  4, '4 AÑOS'			,  3 ,  5 , true ,    0 ),
(10005 ,  5, '5 AÑOS'			,  4 ,  5 , true ,    0 ),
(10005 ,  1, 'PRIMERO'			,  5 ,  6 , true ,    0 ),
(10005 ,  2, 'SEGUNDO'			,  6 ,  6 , true ,    0 ),
(10005 ,  3, 'TERCERO'			,  7 ,  6 , true ,    0 ),
(10005 ,  4, 'CUARTO'			,  8 ,  6 , true ,    0 ),
(10005 ,  5, 'QUINTO'			,  9 ,  6 , true ,    0 ),
(10005 ,  6, 'SEXTO'			, 10 ,  6 , true ,    0 ),
(10005 ,  1, 'PRIMERO'			, 11 ,  7 , true ,    0 ),
(10005 ,  2, 'SEGUNDO'			, 12 ,  7 , true ,    0 ),
(10005 ,  3, 'TERCERO'			, 13 ,  7 , true ,    0 ),
(10005 ,  4, 'CUARTO'			, 14 ,  7 , true ,    0 ),
(10005 ,  5, 'QUINTO'			, -1 ,  7 , true ,    0 ),

(10006 ,  0, 'ÁREA I'	     	, -1 ,  9 , true ,    1 ),
(10006 ,  0, 'ÁREA II'	     	, -1 ,  9 , true ,    2 ),
(10006 ,  0, 'ÁREA III'	     	, -1 ,  9 , true ,    3 ),
(10006 ,  0, 'ÁREA IV'	     	, -1 ,  9 , true ,    4 ),
(10006 ,  0, 'ÁREA V'	     	, -1 ,  9 , true ,    5 ),
(10006 ,  0, 'ÁREA I'	     	, -1 , 10 , true ,    1 ),
(10006 ,  0, 'ÁREA II'	     	, -1 , 10 , true ,    2 ),
(10006 ,  0, 'ÁREA III'	     	, -1 , 10 , true ,    3 ),
(10006 ,  0, 'ÁREA IV'	     	, -1 , 10 , true ,    4 ),
(10006 ,  0, 'ÁREA V'	     	, -1 , 10 , true ,    5 ),
(10006 ,  0, 'ÁREA I'	     	, -1 , 11 , true ,    1 ),
(10006 ,  0, 'ÁREA II'	     	, -1 , 11 , true ,    2 ),
(10006 ,  0, 'ÁREA III'	     	, -1 , 11 , true ,    3 ),
(10006 ,  0, 'ÁREA IV'	     	, -1 , 11 , true ,    4 ),
(10006 ,  0, 'ÁREA V'	     	, -1 , 11 , true ,    5 ),
(10006 ,  0, 'ÁREA I'	     	, -1 , 12 , true ,    1 ),
(10006 ,  0, 'ÁREA II'	     	, -1 , 12 , true ,    2 ),
(10006 ,  0, 'ÁREA III'	     	, -1 , 12 , true ,    3 ),
(10006 ,  0, 'ÁREA IV'	     	, -1 , 12 , true ,    4 ),
(10006 ,  0, 'ÁREA V'	     	, -1 , 12 , true ,    5 ),
									   
(10006 ,  3, '3 AÑOS'			, -1 , 13 , false,    0 ),
(10006 ,  4, '4 AÑOS'			, -1 , 13 , false,    0 ),
(10006 ,  5, '5 AÑOS'			, -1 , 13 , true ,    0 ),
(10006 ,  1, 'PRIMERO'			, -1 , 14 , true ,    0 ),
(10006 ,  2, 'SEGUNDO'			, -1 , 14 , true ,    0 ),
(10006 ,  3, 'TERCERO'			, -1 , 14 , true ,    0 ),
(10006 ,  4, 'CUARTO'			, -1 , 14 , true ,    0 ),
(10006 ,  5, 'QUINTO'			, -1 , 14 , true ,    0 ),
(10006 ,  6, 'SEXTO'			, -1 , 14 , true ,    0 ),
(10006 ,  1, 'PRIMERO'			, -1 , 15 , true ,    0 ),
(10006 ,  2, 'SEGUNDO'			, -1 , 15 , true ,    0 ),
(10006 ,  3, 'TERCERO'			, -1 , 15 , true ,    0 ),
(10006 ,  4, 'CUARTO'			, -1 , 15 , true ,    0 ),
(10006 ,  5, 'QUINTO'			, -1 , 15 , true ,    0 ),			  
(10006 ,  1, 'CICLO 1'			, -1 , 16 , true ,    0 ),
(10006 ,  2, 'CICLO 2'			, -1 , 16 , true ,    0 ),
(10006 ,  3, 'CICLO 3'			, -1 , 16 , true ,    0 ),
(10006 ,  4, 'CICLO 4'			, -1 , 16 , true ,    0 ),
(10006 ,  5, 'CICLO 5'			, -1 , 16 , true ,    0 ),
(10006 ,  6, 'CICLO 6'			, -1 , 16 , true ,    0 ),
(10006 ,  7, 'CICLO 7'			, -1 , 16 , true ,    0 ),
(10006 ,  8, 'CICLO 8'			, -1 , 16 , true ,    0 ),
(10006 , 22, 'PRI. 2DO'			, -1 , 17 , true ,    0 ),
(10006 , 26, 'PRI. 6TO'			, -1 , 17 , true ,    0 ),
(10006 , 31, 'SEC. 1RO'			, -1 , 17 , true ,    0 ),
(10006 , 35, 'SEC. 5TO'			, -1 , 17 , true ,    0 ),

(10006 ,  1, 'NIVEL 1'			, -1 , 18 , true ,    0 ),
(10006 ,  2, 'NIVEL 2'			, -1 , 18 , true ,    0 ),
(10006 ,  3, 'NIVEL 3'			, -1 , 18 , true ,    0 );

select * from acd.grado g ;

----------------------------------------------------------------------------------------------------------------------------------------
--acd.carrera_prof----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists acd.carrera_prof;
create table acd.carrera_prof (
	id_carr_prof		serial			NOT NULL PRIMARY KEY,
	id_negocio			int	 			not null,
	nom_carr_prof		varchar(75) 	not null,
	id_area_prof		int 			not null,
	orden 				int 			not null,
	visible				bool			not null,
	CONSTRAINT carrera_prof_id_area_prof_fkey FOREIGN KEY (id_area_prof) REFERENCES acd.area_prof(id_area_prof) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
--
INSERT INTO acd.carrera_prof (id_carr_prof, id_negocio, nom_carr_prof, id_area_prof, orden, visible)
values (0, -1, '<SIN CARRERA PROF.>'                   	,  0  ,11, true );
--
INSERT INTO acd.carrera_prof (id_negocio, nom_carr_prof, id_area_prof, orden, visible)
values 
(10006, 'ENFERMERÍA'                                	,  1  , 1, true ),
(10006, 'MEDICINA HUMANA'                           	,  1  , 2, true ),
(10006, 'FARMACIA'                                  	,  1  , 3, true ),
(10006, 'OBSTETRICIA'                               	,  1  , 4, true ),
(10006, 'ODONTOLOGÍA'                               	,  1  , 5, true ),
(10006, 'TECNOLOGÍA MÉDICA'                         	,  1  , 6, true ),
(10006, '<SIN INDICAR A-I>'                         	,  1  , 7, true ), 
(10006, 'ARQUITECTURA'                              	,  2  , 1, true ),
(10006, 'ING. CIVIL'                                	,  2  , 2, true ),
(10006, 'ING. DE MINAS'                             	,  2  , 3, true ),
(10006, 'ING. DE SISTEMAS'                          	,  2  , 4, true ),
(10006, 'ING. ELÉCTRICA Y ELECTRÓNICA'               	,  2  , 5, true ),
(10006, 'ING. MECÁNICA'                             	,  2  , 6, true ),
(10006, 'ING. METALÚRGICA Y DE MATERIALES'          	,  2  , 7, true ),
(10006, 'ING. QUÍMICA'                              	,  2  , 8, true ),
(10006, 'ING. QUÍMICA INDUSTRIAL'                   	,  2  , 9, true ),
(10006, 'ING. QUÍMICA AMBIENTAL'                    	,  2  ,10, true ),
(10006, 'ING. QUÍMICA DEL GAS NATURAL Y ENERGÍA'		,  2  ,11, true ),
(10006, 'MECATRÓNICA'									,  2  ,12, true ),
(10006, '<SIN INDICAR A-II>'                        	,  2  ,13, true ),														 
(10006, 'ADMINISTRACIÓN'                				,  3  , 1, true ),
(10006, 'CONTABILIDAD'                                 	,  3  , 2, true ),
(10006, 'ECONOMÍA'                                     	,  3  , 3, true ),
(10006, '<SIN INDICAR A-III>'                          	,  3  , 4, true ),														 
(10006, 'ANTROPOLOGÍA'                               	,  4  , 1, true ),
(10006, 'CIENCIAS DE LA COMUNICACIÓN'                	,  4  , 2, true ),
(10006, 'EDUCACION INICIAL'                          	,  4  , 3, true ),
(10006, 'EDUCACIÓN PRIMARIA'                           	,  4  , 4, true ),
(10006, 'EDUCACIÓN SECUNDARIA'             				,  4  , 5, true ),
(10006, 'SOCIOLOGÍA'                                 	,  4  , 6, true ),
(10006, 'TRABAJO SOCIAL'                             	,  4  , 7, true ),
(10006, 'DERECHO'                                    	,  4  , 8, true ),
(10006, 'FUERZAS POLICIALES'                            ,  4  , 9, true ),
(10006, 'FUERZAS ARMADAS'                            	,  4  ,10, true ),
(10006, 'PSICOLOGÍA'                                 	,  4  ,11, true ),
(10006, '<SIN INDICAR A-IV>'                         	,  4  ,12, true ),														 
(10006, 'AGRONOMÍA'                                  	,  5  , 1, true ),
(10006, 'CIENCIAS FORESTALES Y DEL AMBIENTE'			,  5  , 2, true ),
(10006, 'ING. EN INDUSTRIAS ALIMENTARIAS'            	,  5  , 3, true ),
(10006, 'ZOOTECNIA'                                  	,  5  , 4, true ),
(10006, 'ING. AGROINDUSTRIAL'                        	,  5  , 5, true ),
(10006, 'HOTELERÍA Y TURISMO'                        	,  5  , 6, true ),
(10006, 'ING. FORESTAL'                       			,  5  , 7, true ),
(10006, '<SIN INDICAR A-V>'                          	,  5  , 8, true ),														 
(10006, 'ESFUERZO FÍSICO'		                     	,  6  , 1, true ),
(10006, 'CONOCIMIENTOS'                        			,  7  , 2, true ),
(10006, 'ÚNICO'                         				,  8  , 3, true ),
(10006, 'GRUPO 01'			                        	,  9  , 1, true ),
(10006, 'GRUPO 02'			                        	, 10  , 2, true ),
(10006, 'GRUPO 03'			                        	, 11  , 3, true ),
(10006, 'GRUPO 04'			                        	, 12  , 4, true ),
(10006, 'GRUPO 05'			                        	, 13  , 5, true ),
(10006, 'GRUPO 06'			                        	, 14  , 6, true ),
(10006, 'GRUPO 07'			                        	, 15  , 7, true ),
(10006, 'GRUPO 08'			                        	, 16  , 8, true ),
(10006, 'GRUPO 09'			                        	, 17  , 9, true ),
(10006, 'GRUPO 10'			                        	, 18  ,10, true );


select * from acd.carrera_prof ;


----------------------------------------------------------------------------------------------------------------------------------------
--acd.seccion---------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
drop table if exists acd.seccion;
create table acd.seccion (
	id_seccion			bigserial			NOT NULL PRIMARY KEY,
	id_negocio			int 			not null,
	id_campania			int 			not null,
	id_niv_edu			int				not null,
	id_grado			int 			not null,
	id_tip_turno		int 			not null,	--tipo_turno [TI_TURNO-]
	nom_seccion			varchar(100) 	not null,
	id_ambiente			int 			not null,
	num_vacante			int 			not null,
	activo				bool			not null,	
	nom_corto			varchar(5)		not null,
	nom_grupo1			varchar(50)     not null,
	nom_grupo2			varchar(50)     not null,
	nom_grado			varchar(30)     not null,
	nom_niv_edu			varchar(30)     not null,
	CONSTRAINT seccion_id_grado_fkey FOREIGN KEY (id_grado) REFERENCES acd.grado(id_grado) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT seccion_id_ambiente_fkey FOREIGN KEY (id_ambiente) REFERENCES gen.ambiente(id_ambiente) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action,
	CONSTRAINT seccion_id_campania_fkey FOREIGN KEY (id_campania) REFERENCES com.campania(id_campania) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO action
);

insert into acd.seccion (id_negocio, id_campania, id_niv_edu, id_grado, id_tip_turno, nom_seccion, id_ambiente, num_vacante, activo, nom_corto, nom_grupo1, nom_grupo2, nom_grado, nom_niv_edu)
values
(10005,  8, 5, 1, 390, 'COOPERADORES'		, 1, 20, true, 'A', '', '' , '3 AÑOS' , 'INCIAL 2020'),
(10005,  8, 5, 1, 390, 'SOLIDARIDAD'		, 1, 20, true, 'B', '', '' , '3 AÑOS' , 'INCIAL 2020'),
(10005,  8, 5, 2, 390, 'CONSTRUCTORES'		, 1, 20, true, 'A', '', '' , '4 AÑOS' , 'INCIAL 2020'),
(10005,  8, 5, 2, 390, 'LABORIOSIDAD'		, 1, 20, true, 'B', '', '' , '4 AÑOS' , 'INCIAL 2020'),
(10005,  8, 5, 3, 390, 'RESPETO'			, 1, 20, true, 'A', '', '' , '5 AÑOS' , 'INCIAL 2020'),
(10005,  8, 5, 3, 390, 'RESPONSABILIDAD'	, 1, 20, true, 'B', '', '' , '5 AÑOS' , 'INCIAL 2020'),

(10005,  9, 6, 4, 390, 'CONSTRUCTORES 1'	, 1, 20, true, 'A', '', '' , 'PRIMERO' , 'PRIMARIA 2020'),
(10005,  9, 6, 4, 390, 'SOLIDARIDAD 1'		, 1, 20, true, 'B', '', '' , 'PRIMERO' , 'PRIMARIA 2020'),
(10005,  9, 6, 5, 390, 'CONSTRUCTORES 2'	, 1, 20, true, 'A', '', '' , 'SEGUNDO' , 'PRIMARIA 2020'),
(10005,  9, 6, 5, 390, 'LABORIOSIDAD 2'		, 1, 20, true, 'B', '', '' , 'SEGUNDO' , 'PRIMARIA 2020'),
(10005,  9, 6, 6, 390, 'RESPETO 3'			, 1, 20, true, 'A', '', '' , 'TERCERO' , 'PRIMARIA 2020'),
(10005,  9, 6, 6, 390, 'RESPONSABILIDAD 3'	, 1, 20, true, 'B', '', '' , 'TERCERO' , 'PRIMARIA 2020'),
(10005,  9, 6, 7, 390, 'CONSTRUCTORES 4'	, 1, 20, true, 'A', '', '' , 'CUARTO'  , 'PRIMARIA 2020'),
(10005,  9, 6, 7, 390, 'SOLIDARIDAD 4'		, 1, 20, true, 'B', '', '' , 'CUARTO'  , 'PRIMARIA 2020'),
(10005,  9, 6, 8, 390, 'CONSTRUCTORES 5'	, 1, 20, true, 'A', '', '' , 'QUINTO'  , 'PRIMARIA 2020'),
(10005,  9, 6, 8, 390, 'LABORIOSIDAD 5'		, 1, 20, true, 'B', '', '' , 'QUINTO'  , 'PRIMARIA 2020'),
(10005,  9, 6, 9, 390, 'RESPETO 6'			, 1, 20, true, 'A', '', '' , 'SEXTO'   , 'PRIMARIA 2020'),
(10005,  9, 6, 9, 390, 'RESPONSABILIDAD 6'	, 1, 20, true, 'B', '', '' , 'SEXTO'   , 'PRIMARIA 2020'),

(10005, 10, 7,10, 390, 'ALBERT EINSTEN'		, 1, 20, true, 'A', '', '' , 'PRIMERO' , 'SECUNDARIA 2020'),
(10005, 10, 7,10, 390, 'ISAAC NEWTON'		, 1, 20, true, 'B', '', '' , 'PRIMERO' , 'SECUNDARIA 2020'),
(10005, 10, 7,11, 390, 'LEONARDO DA VINCI'	, 1, 20, true, 'A', '', '' , 'SEGUNDO' , 'SECUNDARIA 2020'),
(10005, 10, 7,11, 390, 'MIGUEL ANGEL'		, 1, 20, true, 'B', '', '' , 'SEGUNDO' , 'SECUNDARIA 2020'),
(10005, 10, 7,12, 390, 'YURI GAGARIN'		, 1, 20, true, 'A', '', '' , 'TERCERO' , 'SECUNDARIA 2020'),
(10005, 10, 7,12, 390, 'NEIL ARMSTRONG'		, 1, 20, true, 'B', '', '' , 'TERCERO' , 'SECUNDARIA 2020'),
(10005, 10, 7,13, 390, 'PABLO NERUDA'		, 1, 20, true, 'A', '', '' , 'CUARTO'  , 'SECUNDARIA 2020'),
(10005, 10, 7,13, 390, 'GABRIELA MISTRAL'	, 1, 20, true, 'B', '', '' , 'CUARTO'  , 'SECUNDARIA 2020'),
(10005, 10, 7,14, 390, 'JUAN PABLO II'		, 1, 20, true, 'A', '', '' , 'QUINTO'  , 'SECUNDARIA 2020'),
(10005, 10, 7,14, 390, 'TERESA DE CALCUTA'	, 1, 20, true, 'B', '', '' , 'QUINTO'  , 'SECUNDARIA 2020'),

--

(10005, 11, 5, 1, 391, 'COOPERADORES'		, 1, 20, true, 'A', '', '' , '3 AÑOS' , 'INCIAL 2021'),
(10005, 11, 5, 1, 391, 'SOLIDARIDAD'		, 1, 20, true, 'B', '', '' , '3 AÑOS' , 'INCIAL 2021'),
(10005, 11, 5, 2, 391, 'CONSTRUCTORES'		, 1, 20, true, 'A', '', '' , '4 AÑOS' , 'INCIAL 2021'),
(10005, 11, 5, 2, 391, 'LABORIOSIDAD'		, 1, 20, true, 'B', '', '' , '4 AÑOS' , 'INCIAL 2021'),
(10005, 11, 5, 3, 391, 'RESPETO'			, 1, 20, true, 'A', '', '' , '5 AÑOS' , 'INCIAL 2021'),
(10005, 11, 5, 3, 391, 'RESPONSABILIDAD'	, 1, 20, true, 'B', '', '' , '5 AÑOS' , 'INCIAL 2021'),
                                                                         
(10005, 12, 6, 4, 392, 'CONSTRUCTORES 1'	, 1, 20, true, 'A', '', '' , 'PRIMERO' , 'PRIMARIA 2021'),
(10005, 12, 6, 4, 392, 'SOLIDARIDAD 1'		, 1, 20, true, 'B', '', '' , 'PRIMERO' , 'PRIMARIA 2021'),
(10005, 12, 6, 5, 392, 'CONSTRUCTORES 2'	, 1, 20, true, 'A', '', '' , 'SEGUNDO' , 'PRIMARIA 2021'),
(10005, 12, 6, 5, 392, 'LABORIOSIDAD 2'		, 1, 20, true, 'B', '', '' , 'SEGUNDO' , 'PRIMARIA 2021'),
(10005, 12, 6, 6, 392, 'RESPETO 3'			, 1, 20, true, 'A', '', '' , 'TERCERO' , 'PRIMARIA 2021'),
(10005, 12, 6, 6, 392, 'RESPONSABILIDAD 3'	, 1, 20, true, 'B', '', '' , 'TERCERO' , 'PRIMARIA 2021'),
(10005, 12, 6, 7, 392, 'CONSTRUCTORES 4'	, 1, 20, true, 'A', '', '' , 'CUARTO'  , 'PRIMARIA 2021'),
(10005, 12, 6, 7, 392, 'SOLIDARIDAD 4'		, 1, 20, true, 'B', '', '' , 'CUARTO'  , 'PRIMARIA 2021'),
(10005, 12, 6, 8, 392, 'CONSTRUCTORES 5'	, 1, 20, true, 'A', '', '' , 'QUINTO'  , 'PRIMARIA 2021'),
(10005, 12, 6, 8, 392, 'LABORIOSIDAD 5'		, 1, 20, true, 'B', '', '' , 'QUINTO'  , 'PRIMARIA 2021'),
(10005, 12, 6, 9, 392, 'RESPETO 6'			, 1, 20, true, 'A', '', '' , 'SEXTO'   , 'PRIMARIA 2021'),
(10005, 12, 6, 9, 392, 'RESPONSABILIDAD 6'	, 1, 20, true, 'B', '', '' , 'SEXTO'   , 'PRIMARIA 2021'),
                                                                         
(10005, 13, 7,10, 393, 'ALBERT EINSTEN'		, 1, 20, true, 'A', '', '' , 'PRIMERO' , 'SECUNDARIA 2021'),
(10005, 13, 7,10, 393, 'ISAAC NEWTON'		, 1, 20, true, 'B', '', '' , 'PRIMERO' , 'SECUNDARIA 2021'),
(10005, 13, 7,11, 393, 'LEONARDO DA VINCI'	, 1, 20, true, 'A', '', '' , 'SEGUNDO' , 'SECUNDARIA 2021'),
(10005, 13, 7,11, 393, 'MIGUEL ANGEL'		, 1, 20, true, 'B', '', '' , 'SEGUNDO' , 'SECUNDARIA 2021'),
(10005, 13, 7,12, 393, 'YURI GAGARIN'		, 1, 20, true, 'A', '', '' , 'TERCERO' , 'SECUNDARIA 2021'),
(10005, 13, 7,12, 393, 'NEIL ARMSTRONG'		, 1, 20, true, 'B', '', '' , 'TERCERO' , 'SECUNDARIA 2021'),
(10005, 13, 7,13, 393, 'PABLO NERUDA'		, 1, 20, true, 'A', '', '' , 'CUARTO'  , 'SECUNDARIA 2021'),
(10005, 13, 7,13, 393, 'GABRIELA MISTRAL'	, 1, 20, true, 'B', '', '' , 'CUARTO'  , 'SECUNDARIA 2021'),
(10005, 13, 7,14, 393, 'JUAN PABLO II'		, 1, 20, true, 'A', '', '' , 'QUINTO'  , 'SECUNDARIA 2021'),
(10005, 13, 7,14, 393, 'TERESA DE CALCUTA'	, 1, 20, true, 'B', '', '' , 'QUINTO'  , 'SECUNDARIA 2021'),

(10006, 29,11,25, 392, 'SALON A1'	 		, 1, 20, true, 'A', '', '' , 'CIENCIAS I' , 'SEMESTRAL X'),
(10006, 29,11,26, 392, 'SALON A2'			, 1, 20, true, 'B', '', '' , 'CIENCIAS I' , 'SEMESTRAL X'),
(10006, 29,11,27, 392, 'SALON A3'			, 1, 20, true, 'A', '', '' , 'CIENCIAS I' , 'SEMESTRAL X'),
(10006, 29,11,28, 392, 'SALON A4'			, 1, 20, true, 'B', '', '' , 'CIENCIAS I' , 'SEMESTRAL X'),
(10006, 29,11,29, 392, 'SALON A5-1'			, 1, 20, true, 'A', '', '' , 'CIENCIAS I' , 'SEMESTRAL X'),
(10006, 29,11,29, 392, 'SALON A5-2'			, 1, 20, true, 'B', '', '' , 'CIENCIAS I' , 'SEMESTRAL X');
















--CERRADO PARA EVALS, IRIA EN LOS BIMESTRES
--EN CAMPAÑA PONER SI EN ESA CAMPAÑA SE VA COBRAR, SIVA SER GRATIS, SI EL PAGO SERÁ EN BLOQUE DE TODOS LOS INSCRITOS COMO CASO CHINALCO
--EN COMERCIAL PERMITIR EMITIR UNA SOLA FACTURA DE VARIOS ALUMNOS INSCRITOS. EN EL CASO QUE UNA EMPRESA PAGUE LOS SERVISIOS
--DE VARIOS ALLUMMNOS. COMO POR EJEMPLO MUNICIPALIDAD DE EL TAMBO, EMPRESA CHINALCO




/*
--TABLAS SIGEAF * TABLAS SIGEAF * TABLAS SIGEAF
select * from  [dbo].[ACDTActDesNinio]		--salud
select * from  [dbo].[ACDTTipoParto]
select * from  [dbo].[ACDTTipoConMed]
select * from  [dbo].[ACDTContMedico]

select * from  [dbo].[ACDTArea]				--evals
select * from  [dbo].[ACDTCarreraProf]
select * from  [dbo].[ACDTCurso]
select * from  [dbo].[ACDTCriterio]
select * from  [dbo].[ACDTTipoCriterio]
--
select * from  [dbo].[ACDTPerEvalInt]
select * from  [dbo].[ACDTPerEvalMin]
select * from  [dbo].[ACDTPerEvaluacion]
select * from  [dbo].[ACDTEquivalencia]

select * from  [dbo].[ACDTModalidad]
select * from  [dbo].[ACDTTipoTraslado]
select * from  [dbo].[ACDTEspecialidad]

select * from  [dbo].[ACDTEstadoAsistencia]
select * from  [dbo].[ACDTSocioEconomico]
select * from  [dbo].[ACDTTipCodConducta]
select * from  [dbo].[ACDTAtencionDerivado]
select * from  [dbo].[ACDTAtencionMotivo]

select * from  [dbo].[ACDTTipoCriterio_BACK]	--NO VA 

*/




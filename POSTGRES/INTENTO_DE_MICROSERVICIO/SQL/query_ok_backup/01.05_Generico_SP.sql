--------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION gen.tipo_all()
 RETURNS SETOF gen.tipo
 LANGUAGE plpgsql
AS $function$ 
BEGIN
	RETURN QUERY
	select id_tipo, nom_tipo, nom_corto, cod_oficial, grupo, long_valor, orden, activo
	from gen.tipo 
	where activo=true 
	order by grupo, orden;
end;
$function$;

--------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION gen.pais_all()
 RETURNS SETOF gen.pais
 LANGUAGE plpgsql
AS $function$ 
BEGIN
	RETURN QUERY
	select id_pais, nom_pais, activo, orden
	from gen.pais
	order by orden;
end;
$function$;

--------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION gen.departamento_all()
 RETURNS SETOF gen.departamento
 LANGUAGE plpgsql
AS $function$ 
BEGIN
	RETURN QUERY
	select id_dpto, id_pais, nom_dpto 
	from gen.departamento;
end;
$function$;

--------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION gen.provincia_all()
 RETURNS SETOF gen.provincia
 LANGUAGE plpgsql
AS $function$ 
BEGIN
		RETURN QUERY
		select id_prov, id_dpto, nom_prov 
		from gen.provincia;
end;
$function$;

--------------------------------------------------------------------------------------------------------------------

--CREATE OR REPLACE FUNCTION gen.distrito_all()
-- RETURNS SETOF gen.distrito
-- LANGUAGE plpgsql
--AS $function$ 
--BEGIN
--		RETURN QUERY
--		select id_dist, id_prov, nom_dist, latitud, longitud 
--		from gen.distrito;		
--end;
--$function$;

--------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION gen.distrito_byprov(p_idprov character)
 RETURNS SETOF gen.distrito
 LANGUAGE plpgsql
AS $function$ 
BEGIN
		RETURN QUERY
		select A.id_dist, A.id_prov, A.nom_dist, A.latitud, A.longitud 
		from gen.distrito A
		where A.id_prov=p_idprov
		order by A.id_dist;			
end;
$function$;

--------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION gen.distrito_byid(p_iddist character)
 RETURNS SETOF gen.distrito
 LANGUAGE plpgsql
AS $function$ 
BEGIN
		RETURN QUERY
		select A.id_dist, A.id_prov, A.nom_dist, A.latitud, A.longitud --(A.nom_dist || ', ' || B.nom_prov || ', ' || C.nom_dpto)::varchar full_name 
		from gen.distrito A
		where A.id_dist=p_iddist;
end;
$function$;













/***********************************************************************************************************************************************************
 Objetivo	:	Lista de empresas por grupo empresarial
 Autor		:	Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695				
  			select * from gen.empresa__sel_by_grp_emp_sp(101)
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.empresa__sel_by_grp_emp_sp(_id_grp_emp int)
--RETURNS SETOF gen.empresa
--AS $$ 
--BEGIN
--
--	RETURN QUERY
--	SELECT id_empresa, nom_empresa, num_ruc, direccion, telefonos, alias, activo, id_empresa, id_sec_emp, id_tip_emp
--	FROM gen.empresa
--	WHERE id_empresa=_id_grp_emp AND activo=true
--	ORDER BY nom_empresa;
--	
--END 
--$$ LANGUAGE PLPGSQL;


/***********************************************************************************************************************************************************
 Objetivo	:	Buscar personas por nombres(1), documento de identidad(2), código de sistema(3)
 Autor		:	Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695
  			select * from gen.persona__sel_by_find_sp(103, 1, 'a a a')
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.persona__sel_by_find_sp(_id_grp_emp INT, _find_tipo INT, _find VARCHAR)
--RETURNS SETOF gen.persona
--AS $$
--BEGIN
--
--	_find := REPLACE(_find,'%','*');	-- comodines, anularlos
--	_find := REPLACE(_find,' ','%');	-- espacios en blanco, volver comodin
--
--	IF _find_tipo = 1 THEN
--		RETURN QUERY
--		SELECT id_persona, id_empresa, per_jur, num_dni, paterno, materno, nombres, alias, sigla, tel_fijo, fax, movil, mail, id_grp_san, id_genero, id_est_civil, id_niv_inst, editable
--		FROM gen.persona 
--		WHERE id_empresa=_id_grp_emp AND  
--		     (unaccent(paterno ||' '|| materno ||' '|| nombres) ILIKE unaccent('%' || _find || '%')
--			OR
--		       unaccent(nombres ||' '|| paterno ||' '|| materno) ILIKE unaccent('%' || _find || '%')
--			OR
--		       unaccent(alias ||' '|| sigla) ILIKE unaccent('%' || _find || '%')
--		      )
--		ORDER BY paterno ||' '|| materno ||' '|| nombres ||' '|| alias ||' '|| sigla;	
--	ELSIF _find_tipo = 2 THEN
--		RETURN QUERY
--		SELECT id_persona, id_empresa, per_jur, num_dni, paterno, materno, nombres, alias, sigla, tel_fijo, fax, movil, mail, id_grp_san, id_genero, id_est_civil, id_niv_inst, editable
--		FROM gen.persona
--		WHERE id_empresa=_id_grp_emp AND num_dni=_find;
--	ELSIF _find_tipo = 3 THEN
--		RETURN QUERY
--		SELECT id_persona, id_empresa, per_jur, num_dni, paterno, materno, nombres, alias, sigla, tel_fijo, fax, movil, mail, id_grp_san, id_genero, id_est_civil, id_niv_inst, editable
--		FROM gen.persona
--		WHERE id_empresa=_id_grp_emp AND id_persona=_find::integer;
--	END IF;
--
--END
--$$ LANGUAGE PLPGSQL;


/***********************************************************************************************************************************************************
 Objetivo	:	Lista de locales de una empresa
 Autor		:	Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695
  			select * from gen.empresa_local__sel_by_emp_sp(1002)
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.empresa_local__sel_by_emp_sp(_id_empresa int)
--RETURNS TABLE (id_local int, id_empresa int, nom_local varchar, direccion varchar, id_dist char, id_empresa int, activo boolean, obs varchar, full_ugeo text)
--AS $$ 
--BEGIN
--
--	RETURN QUERY
--	SELECT A.id_local, A.id_empresa, A.nom_local, A.direccion, A.id_dist, B.id_empresa, B.activo, B.obs, C.nom_prov||'/'||D.nom_dpto AS full_ugeo
--	FROM gen.local A
--	     INNER JOIN gen.empresa_local B ON (A.id_local=B.id_local)
--	     INNER JOIN gen.provincia C ON (left(A.id_dist,4)=C.id_prov)
--	     INNER JOIN gen.departamento D ON (C.id_dpto=D.id_dpto)
--	WHERE B.id_empresa=_id_empresa AND B.activo=true;
--
--END 
--$$ LANGUAGE PLPGSQL;


/***********************************************************************************************************************************************************
 Objetivo	:	Grupos sanguineo
 Autor		:	Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695				
  			select * from gen.GrupoSang_SelAll()
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.gruposang_selall()
--RETURNS SETOF gen.grupo_sang
--AS $$ 
--BEGIN
--
--	RETURN QUERY
--	SELECT id_grp_san, nom_grp_san
--	FROM gen.grupo_sang;
--
--END 
--$$ LANGUAGE PLPGSQL;


/***********************************************************************************************************************************************************
 Objetivo	:	Géneros
 Autor		:	Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695	
  			select * from gen.genero__sel_all_sp()	
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.genero__sel_all_sp()
--RETURNS SETOF gen.genero
--AS
--$$
--BEGIN
--
--	RETURN QUERY
--	SELECT id_genero, nom_genero
--	FROM gen.genero;
--
--END		
--$$ LANGUAGE PLPGSQL;


/***********************************************************************************************************************************************************
 Objetivo	: Estado civil
 Autor		: Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695	
  		  select * from gen.est_civil__sel_all_sp()	
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.est_civil__sel_all_sp()
--RETURNS SETOF gen.est_civil
--AS
--$$
--BEGIN
--
--	RETURN QUERY
--	SELECT id_est_civil, nom_est_civil
--	FROM gen.estado_civil;
--
--END		
--$$ LANGUAGE PLPGSQL;


/***********************************************************************************************************************************************************
 Objetivo	: Nivel de instrucción
 Autor		: Franklin Barzola Olivares - frankoantonio@gmail.com - 987779695	
  		  select * from gen.niv_instruccion__sel_all_sp()	
 ***********************************************************************************************************************************************************/
--CREATE OR REPLACE FUNCTION gen.niv_instruccion__sel_all_sp()
--RETURNS SETOF gen.niv_instruccion
--AS
--$$
--BEGIN
--
--	RETURN QUERY
--	SELECT id_niv_inst, nom_niv_inst
--	FROM gen.nivel_instruccion;
--
--END		
--$$ LANGUAGE PLPGSQL;





-- select * from gen.empresa_local
-- select * from seg.usuario_local
-- SELECT *--A.*, B.activo, B.obs 
-- FROM gen.local A
--      INNER JOIN seg.usuario_local B ON (A.id_local=B.id_local)
--      INNER JOIN gen.provincia C ON (left(A.id_dist,4)=C.id_prov)
--      INNER JOIN gen.departamento D ON (C.id_dpto=D.id_dpto)     
-- WHERE B.id_empresa=101 AND B.id_usuario=1 AND B.activo=true
-- ORDER BY 6,1
-- 
--      //boolean defaultUser;    // para indicar predeterminado del usuario --> NO SIRVE, porque esta a nivel de empresa y se requiere que este a nivel de usuario
-- 
--     //-- aparte la lista de locales, el usuario escogerá un local, y solo trabajara con un local a la vez
-- 
-- 
--     
-- 
-- SELECT A.id_local, id_empresa, nom_local, direccion, id_dist, nom_prov||'/'||nom_dpto as ugeo, id_empresa, activo, obs
-- FROM gen.local A
--      INNER JOIN gen.local_emp B on (A.id_local=B.id_local)
--      INNER JOIN gen.provincia C on (SUBSTRING(A.id_dist,1,4)=C.id_prov)
--      INNER JOIN gen.departamento D on (C.id_dpto=D.id_dpto)
-- where id_empresa=1009
-- 
-- select *, substring(nom_dpto,1,3) from gen.departamento 




--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION gen.tipo_all()
 RETURNS SETOF gen.tipo
 LANGUAGE plpgsql
AS $function$ 
BEGIN
	RETURN QUERY
	select id_tipo, nom_tipo, nom_corto, cod_oficial, grupo, long_valor, orden, activo 
	from gen.tipo 
	where activo=true 
	order by grupo, orden ;
end;
$function$;
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION gen.pais_all()
 RETURNS SETOF gen.pais
 LANGUAGE plpgsql
AS $function$ 
BEGIN
		RETURN QUERY
		select id_pais, nom_pais, activo, orden 
		from gen.pais
		order by orden;
end;
$function$;
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION gen.departamento_all()
 RETURNS SETOF gen.departamento
 LANGUAGE plpgsql
AS $function$ 
BEGIN
		RETURN QUERY
		select id_dpto, id_pais, nom_dpto
		from gen.departamento;
end;
$function$;
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION gen.provincia_all()
 RETURNS SETOF gen.provincia
 LANGUAGE plpgsql
AS $function$ 
BEGIN
		RETURN QUERY
		select id_prov, id_dpto, nom_prov
		from gen.provincia;
end;
$function$;
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--CREATE OR REPLACE FUNCTION gen.distrito_byid(p_iddist character)
-- RETURNS SETOF gen.distrito
-- LANGUAGE plpgsql
--AS $function$ 
--BEGIN
--		RETURN QUERY
--		select A.id_dist, A.id_prov, A.nom_dist, A.latitud, A.longitud --(A.nom_dist || ', ' || B.nom_prov || ', ' || C.nom_dpto)::varchar full_name 
--		from gen.distrito A
--		where A.id_dist=p_iddist;
--end;
--$function$;
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--CREATE OR REPLACE FUNCTION gen.distrito_byprov(p_idprov character)
-- RETURNS SETOF gen.distrito
-- LANGUAGE plpgsql
--AS $function$ 
--BEGIN
--		RETURN QUERY
--		select A.id_dist, A.id_prov, A.nom_dist, A.latitud, A.longitud 
--		from gen.distrito A
--		where A.id_prov=p_idprov
--		order by A.id_dist;			
--end;
--$function$;
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION gen.distrito_all()
 RETURNS SETOF gen.distrito
 LANGUAGE plpgsql
AS $function$ 
BEGIN
		RETURN QUERY 
		select A.id_dist, A.id_prov, A.nom_dist, A.latitud, A.longitud 
		from gen.distrito A
		order by A.id_dist; 
end;
$function$;
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION gen.direccion_byid(p_id_direccion int)
 RETURNS SETOF gen.direccion
 LANGUAGE plpgsql
AS $function$ 
BEGIN
	RETURN QUERY
	select id_direccion, id_tivia, nom_tivia, domicilio, id_tizona, nom_tizona, nom_zona, referencia, latitud, longitud, id_dist
	from gen.direccion
	where id_direccion=p_id_direccion;
end;
$function$;
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION gen.direccion_save(p_id_direccion int, p_id_tivia char, p_nom_tivia varchar, p_domicilio varchar, p_id_tizona char, p_nom_tizona char, p_nom_zona varchar, p_referencia varchar, p_latitud varchar, p_longitud varchar, p_id_dist char)
 RETURNS int
AS $$ 
declare 
	p_id_return int;
begin 
	
	if (p_id_direccion = -1) then
		insert into gen.direccion (id_tivia, nom_tivia, domicilio, id_tizona, nom_tizona, nom_zona, referencia, latitud, longitud, id_dist)
		values (p_id_tivia, p_nom_tivia, p_domicilio, p_id_tizona, p_nom_tizona, p_nom_zona, p_referencia, p_latitud, p_longitud, p_id_dist)
		returning id_direccion into p_id_return; 
		return p_id_return;
	else 	
		update gen.direccion
		set id_tivia=p_id_tivia,
			nom_tivia=p_nom_tivia,
			domicilio=p_domicilio,
			id_tizona=p_id_tizona,
			nom_tizona=p_nom_tizona,
			nom_zona=p_nom_zona,
			referencia=p_referencia,
			latitud=p_latitud,
			longitud=p_longitud,
			id_dist=p_id_dist
		where id_direccion=p_id_direccion;
		return p_id_direccion;	
	end if;
end;
$$
LANGUAGE plpgsql;
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
select gen.direccion_save(2, '000111', 'PJ.', 'VICTOR HUGO N° 159', '111222', 'URB.', 'GONZALES', 'POR LOS MORMONES', '-343434', '-3434', '120110');
select * from gen.direccion_byid(2)
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------







--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------




/***********************************************************************************************************************************************************
 Objetivo	:	Recupera persona en base a su identificador		
  				select * from gen.persona_byid_sp (2)
***********************************************************************************************************************************************************/
CREATE OR REPLACE FUNCTION gen.persona_byid_sp(p_id_persona int)

returns table (id_persona int, id_tipersona char, id_tigenero char, nombres varchar, paterno varchar, materno varchar, sigla varchar, 
	doc_ident varchar, fijo varchar, movil varchar, correo varchar, id_tigrpsan char, validado boolean, id_usuval int, 
	nom_tipopersona varchar, nom_genero varchar, nom_grpsan varchar) 
	
AS $$ 
BEGIN

		RETURN QUERY
		select  A.id_persona, A.id_tipersona, A.id_tigenero, A.nombres, A.paterno, A.materno, A.sigla, A.doc_ident, A.fijo, A.movil, A.correo, 
			A.id_tigrpsan, A.validado, A.id_usuval, B.nom_tipo nom_tipopersona, C.nom_tipo nom_genero, D.nom_tipo nom_grpsan 
		from gen.persona A 
			inner join gen.tipo B on (A.id_tipersona=B.id_tipo) 
			inner join gen.tipo C on (A.id_tigenero=C.id_tipo) 
			inner join gen.tipo D on (A.id_tigrpsan=D.id_tipo)
		where A.id_persona = p_id_persona;

end;
$$ LANGUAGE PLPGSQL;



/***********************************************************************************************************************************************************
 Objetivo	:	Lista de personas por identificador, documento de identidad, o nombres
  				select * from gen.persona_byfind_sp(1, 1)
  				select * from gen.persona_byfind_sp(2, 1040110805)
  				select * from gen.persona_byfind_sp(3, '')
***********************************************************************************************************************************************************/
CREATE OR REPLACE FUNCTION gen.persona_byfind_sp(p_ix_find int, p_contenido varchar)

returns table (id_persona int, id_tipersona char, id_tigenero char, nombres varchar, paterno varchar, materno varchar, sigla varchar, 
	doc_ident varchar, fijo varchar, movil varchar, correo varchar, id_tigrpsan char, validado boolean, id_usuval int, 
	nom_tipopersona varchar, nom_genero varchar, nom_grpsan varchar) 
	
AS $$ 
BEGIN
	-- identificador de sistema
	if(p_ix_find=1) then
		RETURN QUERY
		select A.id_persona, A.id_tipersona, A.id_tigenero, A.nombres, A.paterno, A.materno, A.sigla, A.doc_ident, A.fijo, A.movil, A.correo, 
			A.id_tigrpsan, A.validado, A.id_usuval, B.nom_tipo nom_tipopersona, C.nom_tipo nom_genero, D.nom_tipo nom_grpsan 
		from gen.persona A 
			inner join gen.tipo B on (A.id_tipersona=B.id_tipo) 
			inner join gen.tipo C on (A.id_tigenero=C.id_tipo) 
			inner join gen.tipo D on (A.id_tigrpsan=D.id_tipo)
		where A.id_persona = p_contenido::integer;
	-- documento de identidad		
	elsif(p_ix_find=2) then	
		RETURN QUERY
		select A.id_persona, A.id_tipersona, A.id_tigenero, A.nombres, A.paterno, A.materno, A.sigla, A.doc_ident, A.fijo, A.movil, A.correo, 
			A.id_tigrpsan, A.validado, A.id_usuval, B.nom_tipo nom_tipopersona, C.nom_tipo nom_genero, D.nom_tipo nom_grpsan
		from gen.persona A 
			inner join gen.tipo B on (A.id_tipersona=B.id_tipo) 
			inner join gen.tipo C on (A.id_tigenero=C.id_tipo) 
			inner join gen.tipo D on (A.id_tigrpsan=D.id_tipo)
		where A.doc_ident LIKE '%' || p_contenido || '%' ; 
	-- nombres o razon social		
	elsif(p_ix_find=3) then
		p_contenido := REPLACE(p_contenido,'%','*');	-- comodines, anularlos
		p_contenido := REPLACE(p_contenido,' ','%');	-- espacios en blanco, volver comodin
		RETURN QUERY 
		select A.id_persona, A.id_tipersona, A.id_tigenero, A.nombres, A.paterno, A.materno, A.sigla, A.doc_ident, A.fijo, A.movil, A.correo, 
			A.id_tigrpsan, A.validado, A.id_usuval, B.nom_tipo nom_tipopersona, C.nom_tipo nom_genero, D.nom_tipo nom_grpsan 
		from gen.persona A 
			inner join gen.tipo B on (A.id_tipersona=B.id_tipo) 
			inner join gen.tipo C on (A.id_tigenero=C.id_tipo) 
			inner join gen.tipo D on (A.id_tigrpsan=D.id_tipo)
		where (	A.paterno ||' '|| A.materno ||' '|| A.nombres ILIKE ('%' || p_contenido || '%')
					OR
		  		A.nombres ||' '|| A.paterno ||' '|| A.materno ILIKE ('%' || p_contenido || '%')
		      );
	-- alias o sigla		
	elsif(p_ix_find=4) then
		RETURN QUERY 
		select A.id_persona, A.id_tipersona, A.id_tigenero, A.nombres, A.paterno, A.materno, A.sigla, A.doc_ident, A.fijo, A.movil, A.correo, 
			A.id_tigrpsan, A.validado, A.id_usuval, B.nom_tipo nom_tipopersona, C.nom_tipo nom_genero, D.nom_tipo nom_grpsan 
		from gen.persona A 
			inner join gen.tipo B on (A.id_tipersona=B.id_tipo) 
			inner join gen.tipo C on (A.id_tigenero=C.id_tipo) 
			inner join gen.tipo D on (A.id_tigrpsan=D.id_tipo)
		where A.sigla ilike '%' || p_contenido || '%' ; 
	end if;
	
end;
$$ LANGUAGE PLPGSQL;

--select * from gen.persona_byfind(2, '40110805');
--select * from gen.persona








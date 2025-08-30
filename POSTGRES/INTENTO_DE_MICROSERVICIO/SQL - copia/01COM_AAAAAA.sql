/*
 PROBLEMAS CON LA CODIFICACIÓN DE CARACTERES DE ESTE IDE
 Ir a la opción "Ventanas" / "Preferencias"
 En el cuadro seleccionar la opción "General" / "Espacio de trabajo"
 En el panel, en la parte inferior, en "Códificación de archivos de texto" seleccionar "Otros" "UTF-8"
*/



/*ESQUEMAS*/

CREATE SCHEMA adm;
CREATE SCHEMA com;
CREATE SCHEMA lgt;
CREATE SCHEMA per;
CREATE SCHEMA fin;
CREATE SCHEMA cnt;
CREATE SCHEMA col;
CREATE SCHEMA aca;
CREATE SCHEMA med;
CREATE SCHEMA bka;



/*
  	UNACCENT
	RUTA DEL ARCHIVO:	C:\Program Files\PostgreSQL\10\share\tsearch_data\unaccent.rules
*/
CREATE EXTENSION unaccent;
SELECT unaccent('Hôtel');
SELECT unaccent('unaccent', 'Hôtel');


----------------------------------------------------------------------------------------------------------------------------------------
--fn_my_unaccent------------------------------------------------------------------------------------------------------------------------
--Función pública, hace que no se diferencien las tildes  
--Considerar la mayúsculas y minúsculas 
----------------------------------------------------------------------------------------------------------------------------------------
DROP FUNCTION if exists fn_my_unaccent;
CREATE FUNCTION fn_my_unaccent(text) 
RETURNS text
LANGUAGE sql IMMUTABLE STRICT AS
	'SELECT unaccent($1)';
  --'SELECT unaccent(upper($1))';

--Ejemplo
select fn_my_unaccent('Felíz Año Nuevo')



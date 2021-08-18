-- --------------------------------------------------------
--      		Consultas NETFLIX DATABASE
--			 Edward Brito Diaz  --2019-0823--
-- --------------------------------------------------------



-- --------------------------------------------------------
-- 1. De todos los shows que se estrenaron en el año 2021, determinar: la menor y mayor valoración, la media aritmética general 
--de todas las valoraciones (indicando solo dos cifras significativas), y el total de shows publicados en este año 2021.
-- --------------------------------------------------------

--VALORACION_MAXIMA
SELECT
	ID_CATALOGO,
    TITULO,
    FECHA_ESTRENO,
    DURACION_CAPS,
    MAX(IMDB_VALORACION) AS VALORACION_MAXIMA
FROM
	CATALOGO
    WHERE  FECHA_ESTRENO BETWEEN '2021-01-01' AND '2021-12-31'

--VALORACION_MINIMA
SELECT
	ID_CATALOGO,
    TITULO,
    FECHA_ESTRENO,
    DURACION_CAPS,
    MIN(IMDB_VALORACION) AS VALORACION_MINIMA
FROM
	CATALOGO
    WHERE  FECHA_ESTRENO BETWEEN '2021-01-01' AND '2021-12-31'

--MEDIA_ARITMETICA
SELECT
	ID_CATALOGO,
    TITULO,
    FECHA_ESTRENO,
    DURACION_CAPS,
    	ROUND(AVG(IMDB_VALORACION),2) AS MEDIA_ARITMETICA
FROM
	CATALOGO
    WHERE  FECHA_ESTRENO BETWEEN '2021-01-01' AND '2021-12-31'


--TOTAL DE SHOW
SELECT
   	COUNT(FECHA_ESTRENO) AS SHOWS_PUBLICADOS_2021
FROM
	CATALOGO
WHERE  
	FECHA_ESTRENO 
BETWEEN 
	'2021-01-01' 
AND 
	'2021-12-31'
ORDER BY
	FECHA_ESTRENO


-- --------------------------------------------------------
--2. El catálogo de series y películas posee una cantidad de 183 tuplas para el año 2020. De esos
--datos encontrados: determinar la cantidad de producciones y el promedio general por mes
--(indicando solo dos cifras significativas) de los shows que fueron lanzados durante el año
--2020. Adicional a esto, buscar también, el show que mayor valoración tuvo por c/mes y buscar
--el que tuvo menor valoración (indicar el imbd_valoracion para c/caso).
--Columnas esperadas: mes, cant_shows, promedio_gral, show_mejor_valorado, imdb_1, show_menor_valorado, imdb_2.
-- --------------------------------------------------------



-- --------------------------------------------------------
--3. Calcular en términos porcentuales el índice de los géneros: Thriller, Mystery y Horror. En base
--a estos resultados, extraer los dos primeros shows de c/género y su valoración, e identificar
--la cantidad de idiomas en que se encuentran disponibles estos shows.
--Columnas esperadas: genero, índice, show_1, imdb_1, cant_idiomas_1, show_2, imdb_2, cant_idiomas_2.
-- --------------------------------------------------------




--4  La base de datos facilitada (Netflix_database) posee estrenos de al menos los últimos 8 años. En base a esto,
-- diseña una consulta SQL que responda a los siguientes criterios:

-- --------------------------------------------------------
-- A) Extraer los años en donde existe al menos un estreno lanzado por Netflix
-- --------------------------------------------------------
SELECT 
	YEAR(FECHA_ESTRENO) AS AÑOS_ESTRENO
FROM 
	CATALOGO;


  -- --------------------------------------------------------  
-- B) Determinar la cantidad de producciones (shows) lanzadas por año.
-- --------------------------------------------------------
SELECT
	YEAR(FECHA_ESTRENO) AS AÑOS_ESTRENO,
   	COUNT(FECHA_ESTRENO) AS SHOWS_PUBLICADOS_2021
FROM
	CATALOGO
WHERE  
	FECHA_ESTRENO 

GROUP BY
	AÑOS_ESTRENO


  -- --------------------------------------------------------  
-- C) Determinar el promedio general de todas las valoraciones por año de todos los estrenos
-- --------------------------------------------------------
SELECT
	AVG(IMDB_VALORACION),
    YEAR(FECHA_ESTRENO) AS ANOS_ESTRENO
FROM
	CATALOGO
GROUP BY
	ANOS_ESTRENO;



-- --------------------------------------------------------    
--D)  Obtener el show mayor valorado y la valoración que obtuvo en dicho año
-- --------------------------------------------------------
SELECT
	ID_CATALOGO,
    TITULO,
    FECHA_ESTRENO,
    DURACION_CAPS,
    MAX(IMDB_VALORACION) AS VALORACION
FROM
	CATALOGO;


  -- --------------------------------------------------------  
--E)  Obtener el show menor valorado y la valoración que obtuvo en dicho año.
-- --------------------------------------------------------
SELECT
	ID_CATALOGO,
    TITULO,
    FECHA_ESTRENO,
    DURACION_CAPS,
    MIN(IMDB_VALORACION) AS VALORACION
FROM
	CATALOGO;


-- --------------------------------------------------------
--F)  Determinar la cantidad única de idiomas en que fueron lanzadas las producciones en dicho año.
-- --------------------------------------------------------
SELECT
		I.NOMBRE,
		YEAR(C.FECHA_ESTRENO) AS ANOS_ESTRENO
FROM
	CATALOGO AS C
		INNER JOIN
	CATALOGO_IDIOMA AS CI ON C.ID_CATALOGO = CI.ID_CATALOGO
		INNER JOIN
	IDIOMAS AS I ON CI.ID_IDIOMA = I.ID_IDIOMA
GROUP BY
	ANOS_ESTRENO


-- --------------------------------------------------------
-- G)  Determinar la cantidad única de géneros correspondientes a los estrenos de dicho año. 
--Columnas esperadas: año, cantidad_producciones, promedio_general, minimo_promedio, maximo_promedio, 
--show_mayor_valorado, show_menor_valorado, cantidad_idiomas_distintos, cantidad_generos_distintos.
-- --------------------------------------------------------

SELECT
		G.NOMBRE ,
		YEAR(C.FECHA_ESTRENO) AS ANOS_ESTRENO,
        COUNT(C.FECHA_ESTRENO) AS CANTIDAD_PRODUCIONES,
		ROUND(AVG(IMDB_VALORACION),2) AS PROMEDIO_GENERAL,
        MIN(IMDB_VALORACION) AS PROMEDIO_MINIMO,
        MAX(IMDB_VALORACION) AS PROMEDIO_MAXIMO,
        COUNT(CI.ID_IDIOMA) AS CANTIDAD_IDIOMAS_DISTINTOS,
         COUNT(CG.ID_GENERO) AS CANTIDAD_GENEROS_DISTINTOS

FROM
	CATALOGO AS C
		INNER JOIN
	CATALOGO_GENERO AS CG ON C.ID_CATALOGO = CG.ID_CATALOGO
		INNER JOIN
	GENEROS AS G ON CG.ID_CATALOGO = G.ID_GENERO
    		INNER JOIN
	CATALOGO_IDIOMA AS CI ON C.ID_CATALOGO = CI.ID_CATALOGO
		INNER JOIN
	IDIOMAS AS I ON CI.ID_IDIOMA = I.ID_IDIOMA
GROUP BY
	ANOS_ESTRENO


-- SHOW_MENOR_VALORADO
SELECT
		G.NOMBRE ,
        YEAR(C.FECHA_ESTRENO) AS ANOS_ESTRENO,
        MIN(C.IMDB_VALORACION) AS SHOWS_MENOR_VALORADO
FROM
	CATALOGO AS C
		INNER JOIN
	CATALOGO_GENERO AS CG ON C.ID_CATALOGO = CG.ID_CATALOGO
		INNER JOIN
	GENEROS AS G ON CG.ID_CATALOGO = G.ID_GENERO


-- SHOW_MAYOR_VALORADO
SELECT
		G.NOMBRE ,
        YEAR(C.FECHA_ESTRENO) AS ANOS_ESTRENO,
        MAX(C.IMDB_VALORACION) AS SHOWS_MAYOR_VALORADO
FROM
	CATALOGO AS C
		INNER JOIN
	CATALOGO_GENERO AS CG ON C.ID_CATALOGO = CG.ID_CATALOGO
		INNER JOIN
	GENEROS AS G ON CG.ID_CATALOGO = G.ID_GENERO


-- --------------------------------------------------------
--5. Determinar la tasa porcentual de idiomas asociados a los distintos estrenos lanzados por Netflix.
-- Además, buscar el show mayor valorado por cada idioma encontrado, y determinar la cantidad única de
-- idiomas asociados que posee dicho show. Columnas esperadas: idioma, tasa_porcentual, show_mayor_valorado, cant_idiomas.
-- --------------------------------------------------------






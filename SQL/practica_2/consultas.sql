-- --------------------------------------------------------
--                   Consultas requeridas
-- --------------------------------------------------------

--
-- 1.	Visitas de reclusos que no han sido aceptadas: indicar los motivos. 
--

-- --------------------------------------------------------

---					Las tres formas me funcionan ---
--1ra forma
SELECT 
	id_prisionero AS id_prisionero ,
	motivo  AS Motivo_de_reclusos_con_visitas_no_aceptadas 
FROM 
	`verificar_visitas` 
WHERE 
	motivo !='Puede recibir visita.';

--2da forma
SELECT 
	id_prisionero AS id_prisionero ,
	motivo  AS Motivo_de_reclusos_con_visitas_no_aceptadas 
FROM 
	`verificar_visitas` 
WHERE 
	id_peleas;

--3ra forma
SELECT 
	id_prisionero AS id_prisionero ,
	motivo  AS Motivo_de_reclusos_con_visitas_no_aceptadas 
FROM 
	`verificar_visitas` 
WHERE 	
	id_peleas IS NOT null;




--
-- 2.	Obtener un listado de los reclusos que al menos han tenido una pelea (o han sido participantes): 
--       de c/recluso, obtener la cantidad de peleas en donde ha sido uno de los autores y la cantidad de peleas 
--        en donde han sido participantes. 
--

-- --------------------------------------------------------
SELECT
	p.nombre AS Nombre, 
	COUNT(i.id_prisionero) AS Autores,
    COUNT(i.id_prisionero_heridos) AS Participantes_Heridos, 
    COUNT(i.id_prisionero_muerto) AS Muertos 
FROM
	incidencias AS i
INNER JOIN 
    prisionero AS p on i.id_incidencias = p.id_prisionero 
GROUP BY 
    i.id_prisionero;

--
-- 3.	Obtener un listado de la cantidad de bajas de reclusos que ha tenido la cárcel anualmente producto a las peleas. 
--

-- --------------------------------------------------------

--1ra forma
SELECT 
	fecha_pelea AS Muertes_anual,
    id_prisionero_muerto AS Prisionero_Muerto
FROM 
`incidencias`	
WHERE  
 fecha_pelea 
	BETWEEN '2021-01-01 00:00:00'  AND '2021-12-31 11:59:59' 
 and id_prisionero_muerto IS NOT NULL  ;

 --2da forma
SELECT 
	fecha_pelea AS Muertes_anual,
    id_prisionero_muerto AS Prisionero_Muerto
FROM
	 `incidencias`	
WHERE  
	 fecha_pelea 
	BETWEEN '2021-01-01 00:00:00'  AND '2021-12-31 11:59:59' 
 	and id_prisionero_muerto;

--
-- 4.	Identificar los reclusos que han recibido atención médica producto a graves lesiones provocadas por peleas. 
--

-- --------------------------------------------------------
SELECT 
	id_prisionero AS Pricionero_con_lessiones_graves, 
	lesiones_graves AS Lessiones_Graves 
FROM 
	`chequeo_medico_pelea` 
WHERE 
	lesiones_graves is NOT null;




--
--5.	Extraer un listado de todos los lugares en donde ha ocurrido al menos una pelea. Ordenar los datos de manera 
--      descendentes por la cantidad de peleas encontradas. 
--

-- --------------------------------------------------------
SELECT
	 lugar_pelea AS lugares_en_donde_ha_ocurrido_al_menos_una_pelea
FROM 
	`incidencias` 
ORDER BY 
	lugar_pelea 
	DESC;


--
--	6.	De los lugares en donde ha ocurrido al menos una pelea, extraer las armas u objetos utilizados en estas y determinar
--          la cantidad de veces que se ha utilizado el mismo objeto en las peleas. 
--

-- --------------------------------------------------------
SELECT 
	arma_o_objetos AS  Arma_u_Objecto,
    COUNT(arma_o_objetos) As Cantidad_de_veces
 FROM 
 	`incidencias` 
 GROUP BY 
 	arma_o_objetos
  	ORDER BY 2
   	DESC ;



--
--  7.	Extraer la cantidad de reclusos que han resultado heridos y fallecidos producto a una pelea. 
--

-- --------------------------------------------------------

SELECT 
	COUNT(id_prisionero_heridos) AS Cantidad_de_prisioneros_heridos, 
	COUNT(id_prisionero_muerto) AS Cantidad_de_prisioneros_muertos
FROM 
	incidencias;




--
--  8.	Perfil criminal dado un recluso determinado.
--

-- --------------------------------------------------------

--- Perfil de un criminal especifico 
SELECT 
	*
FROM 	
	`historial`
WHERE 	
	id_prisionero = '1';


--- Perfil de todos los criminales
SELECT p.nombre AS Nombre_prisionero,
	h.id_historial AS id_Historial,
    h.id_chequeo AS Chequeo_medico,
    h.id_chequeo_peleas AS Chequeo_medico_pelea,
    h.id_condena_anteriores AS Condena_anteriores,
    h.crimenes_cometido AS Crimenes_cometidos

FROM 
	prisionero AS p
INNER JOIN 
	historial AS h ON h.id_historial = p.id_prisionero
    GROUP BY
    2 ASC;



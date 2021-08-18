-- --------------------------------------------------------
--      		Consultas COVID-19 INDIA
--			 Edward Brito Diaz  --2019-0823--
-- --------------------------------------------------------


-- --------------------------------------------------------
-- 1. De todos los estados de La India mostrar: los casos totales, activos, de alta, fallecimientos, y 
--calcular la tasa porcentual de los casos activos, de altas y fallecimientos (indicando solo dos cifras significativas). 
--fórmula: tasa_porcentual = (porción / casos_totales) * 100
-- --------------------------------------------------------
SELECT
	ESTADO,
	ROUND(((CASOS_ACTIVOS / CASOS_TOTALES) *100),2) AS TASA_PORCENTUAL_ACTIVOS,
    ROUND(((CASOS_DE_ALTA / CASOS_TOTALES) *100),2) AS TASA_POERCENTUAL_ALTA,
    ROUND(((FALLECIMIENTOS / CASOS_TOTALES) * 100),2) AS TASA_PORCENTUAL_FALLECIDO
FROM
	COVID19

-- --------------------------------------------------------
-- 2. Hasta el momento, los tres primeros estados que poseen más casos activos de Covid-19 en La
-- India son Kerala (125,535 casos), Maharashtra (106,809 casos) y Karnataka (29,314 casos). 
--Conociendo estos datos, ¿cuáles son los siguientes 5 estados que poseen mayor cantidad de casos activos?
-- --------------------------------------------------------
SELECT
	*
FROM
	COVID19
GROUP BY
	CASOS_ACTIVOS
    DESC
LIMIT 3,8 


-- --------------------------------------------------------
--3. Encontrar los 10 primeros estados que poseen mayor cantidad de casos totales. De estos datos resultantes indicar
-- cuales han sido los 5 estados que mejor han manejado la pandemia de Covid-19 con respecto a los fallecimientos: extraer
-- el nombre del estado, casos totales, fallecimientos y la tasa porcentual de los fallecimientos.
-- --------------------------------------------------------

SELECT 
	ESTADO,
    CASOS_TOTALES
FROM 
	COVID19
GROUP BY
	CASOS_TOTALES DESC
LIMIT 10 



SELECT 
	ESTADO,
    CASOS_TOTALES,
    FALLECIMIENTOS,
    ROUND(((FALLECIMIENTOS / CASOS_TOTALES) * 100),2) AS TASA_PORCENTUAL_FALLECIDO
FROM 
	COVID19
WHERE 
	FALLECIMIENTOS
GROUP BY
	FALLECIMIENTOS ASC
LIMIT 5




-- -------------------------------------------------------- 
--4. De los primeros 5 estados que poseen menor cantidad de casos activos, calcular la tasa porcentual
-- (indicando solo dos cifras significativas) de los casos de alta y ordenarlos de manera ascendente.
-- --------------------------------------------------------
SELECT
	ESTADO,
    ROUND(((CASOS_ACTIVOS / CASOS_TOTALES) *100),2) AS TASA_PORCENTUAL_ACTIVOS
FROM
	COVID19
GROUP BY
	casos_activos 
    ASC 
LIMIT 5




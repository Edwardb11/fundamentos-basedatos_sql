-- --------------------------------------------------------
--                   Consultas Aerolinea
-- --------------------------------------------------------


--
-- 1.  Muestra  las personas del Vuelo 1 que tengan el apellido Diaz
--
-- --------------------------------------------------------

SELECT 
	PA.ID_PASAJERO,
    PA.NOMBRE,
    PA.APELLIDO,
    P.ID_VUELO
FROM 
	PASAJE AS P 
		INNER JOIN
	PASAJERO AS PA ON PA.ID_PASAJERO = P.ID_PASAJERO
		INNER JOIN
	VUELO AS V ON V.ID_VUELO = P.ID_VUELO
WHERE
	PA.apellido="Diaz" AND V.ID_VUELO = 1;
-- --------------------------------------------------------


--
-- 2.	Muestra los vuelos que estan entre una fecha y otra
--
-- --------------------------------------------------------

SELECT *
FROM 
	VUELO
WHERE 
	FECHA_Y_HORA BETWEEN '2021-07-31' AND '2021-08-01';
-- --------------------------------------------------------



--
-- 3.    Cuales pasajeros aún  no tienen pasajes comprados, mostrar toda la información de dicho pasajero?   
--
-- --------------------------------------------------------
SELECT
*
FROM 
	PASAJERO  as PA
    
    WHERE NOT EXISTS (
  SELECT
        	P.id_pasajero
        FROM
        	PASAJE as P
        WHERE PA.ID_PASAJERO =P.ID_PASAJERO
    )

-- --------------------------------------------------------


--
-- 4.   Identificar cuantos pasajeros corresponden a la misma dirección

--
-- --------------------------------------------------------

SELECT 
	COUNT(ID_PASAJERO), 
    DIRECCION 
FROM 
	PASAJERO 
GROUP BY 
	DIRECCION
ORDER BY 1 DESC;
-- --------------------------------------------------------



--
-- 5.	identificar los precios que son mayor a $200. 
--
-- --------------------------------------------------------
SELECT 
	ID_VUELO,
    ID_PASAJERO,
    PRECIO 
FROM 
    PASAJE 
WHERE 
	PRECIO>300;


-- --------------------------------------------------------

--
-- 6.	Muestra los pasajero que tienen vuelos en primera clase del vuelo 1
--
-- --------------------------------------------------------
SELECT 
	PA.ID_PASAJERO,
    PA.NOMBRE,
    P.ID_VUELO,
    P.ASIENTO,
    P.CLASE,
    V.ID_VUELO,
    V.FECHA_Y_HORA,
    V.ORIGEN,
    V.DESTINO
FROM 
	PASAJE AS P 
		INNER JOIN
	PASAJERO AS PA ON PA.ID_PASAJERO = P.ID_PASAJERO
		INNER JOIN
	VUELO AS V ON V.ID_VUELO = P.ID_VUELO
WHERE
	P.CLASE IN ('PRIMERA CLASE') AND V.ID_VUELO = 1;
    
-- --------------------------------------------------------

--
-- 7.   Muestra el personal que su cargo sea piloto o copiloto
--
-- --------------------------------------------------------
SELECT 
	P.ID_PERSONAL,
	P.NOMBRE,
    C.TIPO
FROM 
	PERSONAL AS P 
		INNER JOIN 
	TRIPULACION AS T ON P.ID_PERSONAL = T.ID_PERSONAL
		INNER JOIN
	CARGO AS C ON C.ID_CARGO = P.CARGO
WHERE 
	C.TIPO IN ('PILOTO','COPILOTO');
-- --------------------------------------------------------


--
--8.   Muestra  aviones que no tengan vuelos registrados
--
-- --------------------------------------------------------

SELECT 
	COUNT(A.MATRICULA) as Avion_sin_vuelo,
    A.MATRICULA
FROM
AVION as A
WHERE 
	NOT EXISTS (
        SELECT
        	1
        FROM
        	VUELO as V
        WHERE A.MATRICULA =V.MATRICULA
    )



-- --------------------------------------------------------


--
-- 9.	Cual vuelo tiene mas pasajero mostrar en orden descente los primeros 10 
--
-- --------------------------------------------------------

SELECT 
	COUNT(PA.ID_PASAJERO),
    PA.ID_VUELO
FROM 
 	PASAJE AS PA
GROUP BY 
	PA.ID_VUELO 
ORDER BY 
	1  DESC
    LIMIT 10

-- --------------------------------------------------------



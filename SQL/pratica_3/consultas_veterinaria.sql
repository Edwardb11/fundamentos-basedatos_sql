-- --------------------------------------------------------
--                   Consultas requeridas
-- --------------------------------------------------------

-----------------------------------------------------------

-- --------------------------------------------------------
--               Edward Brito Diaz 2019-0823
-- --------------------------------------------------------


--
-- 1. Mascotas que se encuentran adoptadas.
--
-- --------------------------------------------------------
SELECT 
	id_mascota AS CLAVE_UNICA, 
    nombre AS Nombre  
FROM 
	mascotas 
WHERE 
   id_mascota 
    IN 
   ( 
    SELECT 
   id_mascota 
   FROM 
    cliente_mascota 
	WHERE estado_adopcion = 'A'
)

--
-- 2. Mascotas que no poseen ninguna adopción activa.
--
-- --------------------------------------------------------
SELECT 
	id_mascota, 	
    estado_adopcion 
FROM 
	`cliente_mascota`
WHERE 
	estado_adopcion !='A';


--
--3. Razas que no poseen mascotas asociadas.
--
-- --------------------------------------------------------

SELECT 
	r.id_raza AS Clave_Unica,
	r.descripcion Nombre_raza 
FROM 
	razas AS r
WHERE  
	NOT  EXISTS 
    ( SELECT 
     	id_mascota 
      FROM 
     	mascotas  as m 
      WHERE 
    	r.id_raza = m.id_raza
    )


--
--4. Encontrar la cantidad de adopciones que ha tenido la mascota llamada «Coquito».
--
-- --------------------------------------------------------
SELECT 
	COUNT(cm.estado_adopcion) AS Cantidad_apdociones
FROM 
	cliente_mascota AS cm
    
WHERE 
	id_mascota = '3';


--
--5. ¿Cuántas vacunas se le ha aplicado a «Maizito»?
--
-- --------------------------------------------------------
SELECT 
	id_mascota AS Clave_mascota,
    COUNT(id_mascota_vacuna) AS Cantidad_vacunas  
FROM 
	mascota_vacuna 
WHERE 
	id_mascota = 5;


--
--6. ¿Cuántas vacunas le faltan por aplicar a «Pitch»?
--
-- --------------------------------------------------------

SELECT
	c.nombre AS Nombre,
    c.id_mascota AS Clave_Unica,
	COUNT(v.para_gato) AS Vacunas_Faltantes
FROM 
	vacunas as v 
INNER JOIN
	mascotas c ON v.id_vacuna = c.id_mascota
WHERE
	id_vacuna
 	IN
    (
        SELECT
     		id_mascota
        FROM  
        	mascota_vacuna 
        WHERE 
        	id_mascota = 6)
--
--7. ¿Cuál es la provincia que mayor adopciones tiene asociada?
--
-- --------------------------------------------------------
SELECT
	p.nombre AS Nombre_Provincia,
	COUNT(1) AS Cantidad_Adopciones 
FROM
	provincias AS p
    	INNER JOIN
	clientes AS c ON c.id_provincia = p.id_provincia
		INNER JOIN
	cliente_mascota AS cm ON cm.id_cliente = c.id_cliente

GROUP BY
	p.nombre
ORDER BY
	Cantidad_Adopciones DESC
LIMIT 
	1
;



--
--8. Cliente que más adopciones ha realizado.
--
-- --------------------------------------------------------
SELECT
	c.nombre AS Nombre,
	COUNT(1) Adopciones
FROM
	clientes AS c
 
INNER JOIN
	cliente_mascota cm ON c.id_cliente = cm.id_cliente
WHERE 
	cm.estado_adopcion ='A'
GROUP BY
	c.nombre
ORDER BY
	Adopciones DESC 
    
LIMIT 1;

--
--9. Cliente con más adopciones canceladas.
--
-- --------------------------------------------------------
SELECT
	c.nombre AS Nombre,
	COUNT(1) Cancelaciones
FROM
	clientes AS c
 
INNER JOIN
	cliente_mascota cm ON c.id_cliente = cm.id_cliente
WHERE 
	cm.estado_adopcion ='C'
GROUP BY
	c.nombre
ORDER BY
	Cancelaciones DESC 
    
LIMIT 1;

--
--10. ¿Cuál raza tiene más mascotas registradas en la base de datos?
--
-- --------------------------------------------------------
SELECT
	r.descripcion AS Nombre_raza,
	COUNT(1) Cantidad
FROM
	razas AS r
 
INNER JOIN
	mascotas m ON r.id_raza = m.id_raza

GROUP BY
	r.descripcion
ORDER BY
	Cantidad DESC 
    
LIMIT 1;



--
--11. ¿Cuál mascota ha tenido mayores incidencias reportadas?
--
-- --------------------------------------------------------

SELECT
	c.nombre,    
    i.id_mascota as Clave_Mascota ,
	COUNT(1) as total_de_incidencias 

FROM
	incidencias AS i
INNER JOIN
	mascotas c ON i.id_mascota = c.id_mascota
GROUP BY 
	c.nombre
ORDER BY 
	 total_de_incidencias
	DESC LIMIT 1
--
--12. ¿Cuántas mascotas se han encontrado en el mismo mes que se ha reportado la
--incidencia?
--
-- --------------------------------------------------------
SELECT   
	MONTHNAME(fecha_registro)  AS Mes ,
    COUNT(1) AS  mascotas_encontradas
FROM 
	incidencias  
WHERE 
	MONTH(fecha_registro) =  MONTH(fecha_recuperado)


--
--13. ¿A cuántas mascotas les hace falta la vacuna de la rabia?
--
-- --------------------------------------------------------

SELECT
	m.id_mascota,
    m.nombre
FROM 
	mascotas as m
WHERE 
	NOT EXISTS 
    (SELECT 
     	*
     FROM 
     	mascota_vacuna as mv,
     	vacunas as v
	WHERE
     	m.id_mascota = mv.id_mascota 
     		AND
     	mv.id_vacuna = v.id_vacuna 
     		AND 
     	v.nombre = 'Rabia' );

		 --Dato
		 --Para verificar que si funciona  puedes cambiarle el nombre a la vacuna 'Rabia' y probar con una que no se le haya puesto
		 -- a algun animal y veras que te arroja los que faltan por dicha vacuna.



--
--14. Mascota desaparecida con mayor recompensa, pero aún no ha sido encontrada.
--
-- --------------------------------------------------------
SELECT
	c.nombre,    
    i.id_mascota as Clave_Mascota ,
	COUNT(1) as total_de_incidencias ,
    MAX( recompensa ) AS Mayor_recompensa

FROM
	incidencias AS i
INNER JOIN
	mascotas c ON i.id_mascota = c.id_mascota
    
    WHERE fecha_recuperado IS NULL

GROUP BY 
	c.nombre
ORDER BY 
	 Mayor_recompensa
	DESC LIMIT 1


--
--15. Mes (sin importar el año) que más incidencias de mascotas han sido reportadas.
--
-- --------------------------------------------------------


SELECT   
	MONTHNAME(i.fecha_registro) as Mes,
	COUNT(1) as Cantidad_incidencias
FROM 
	incidencias   as i
WHERE 
	MONTH(fecha_registro) 
GROUP BY 
	MONTHNAME(i.fecha_registro)
ORDER BY
	Cantidad_incidencias DESC 
LIMIT
1;
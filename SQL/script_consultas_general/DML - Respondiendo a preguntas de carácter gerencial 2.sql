/* *************************************** */
/*	LENGUAJE DE CONSULTA ESTRUCTURADA (SQL) */
/*	--------------------------------------- */
/*            BASE DE DATOS I              */ 
/* Lenguaje de Manipulación de Datos (DML) */
/*     Instructor: Luis Miguel R. Bido     */
/* --------------------------------------- */

-- Respondiendo preguntas de carácter gerencial --

-- 1. Las 5 ciudades con el índice más alto de personas que sufren de alguna patología --
SELECT
	c.nombre AS ciudad,
	COUNT(1) AS cantidad
FROM
	ciudades AS c
		INNER JOIN
	pacientes AS p ON c.id_ciudad = p.id_ciudad
		INNER JOIN
	paciente_patologia AS pp ON p.id_paciente = pp.id_paciente
GROUP BY
	c.nombre
ORDER BY
	cantidad DESC
LIMIT
	5
;

-- 2. Obtener un listado de aquellos pacientes que poseen más de dos patologías --
SELECT
	CONCAT_WS(' ', p.nombre, p.apellido) AS nombre_completo,
	COUNT(1) AS recurrencia
FROM
	pacientes AS p
		INNER JOIN
	paciente_patologia AS pp ON p.id_paciente = pp.id_paciente
GROUP BY
	CONCAT_WS(' ', p.nombre, p.apellido)
HAVING
	COUNT(1) > 2
ORDER BY
	recurrencia ASC
;

--                                       NOT EXISTS
-- 3. Identificar aquellos pacientes que no poseen ninguna patología --
SELECT
	CONCAT_WS(' ', p.nombre, p.apellido) AS nombre_completo
FROM
	pacientes AS p
WHERE
	NOT EXISTS
	(
		SELECT
			1
		FROM
			paciente_patologia AS pp
		WHERE
			p.id_paciente = pp.id_paciente
	)
;

-- 4. Determinar la cantidad de incidencias reportadas por grado --
-- Realizada por Héctor

-- 5. Determinar cuáles ciudades [nunca] han reportado una incidencia de grado 3 --
SELECT
	c.nombre AS ciudad
FROM
	ciudades AS c
WHERE
	NOT EXISTS
	(
		SELECT
			1
		FROM
			incidencias AS i
				INNER JOIN
			pacientes AS p ON i.id_paciente = p.id_paciente
		WHERE
			c.id_ciudad = p.id_ciudad
				AND i.grado = 3
	)
;

-- 6. Extraer los índices de pacientes por género y ciudad: expresar en porcentaje el valor correspondiente --
SELECT
	c.nombre AS ciudad,
	CASE
		WHEN p.genero = 'M' THEN 'Masculino'
		WHEN p.genero = 'F' THEN 'Femenino'
		ELSE p.genero
	END AS genero,
	/*COUNT(1) AS cantidad,
	(SELECT COUNT(1) FROM paciente_patologia) AS total,*/
	CONCAT(
		FORMAT(
			((COUNT(1) / (SELECT COUNT(1) FROM paciente_patologia)) * 100),
			2
		),
		'%'
	) AS division
FROM
	pacientes AS p
		INNER JOIN
	ciudades AS c ON p.id_ciudad = c.id_ciudad
		INNER JOIN
	paciente_patologia AS pp ON pp.id_paciente = p.id_paciente
GROUP BY
	c.nombre,
	p.genero
;



SELECT
	c.nombre AS ciudad,
	p.genero,
	CONCAT(FORMAT((COUNT(1) / MAX(r.total)) * 100, 2), '%') AS cantidad
FROM
	pacientes AS p
		INNER JOIN
	ciudades AS c ON p.id_ciudad = c.id_ciudad
		INNER JOIN
	paciente_patologia AS pp ON pp.id_paciente = p.id_paciente
		INNER JOIN
	(
		SELECT
			COUNT(1) AS total
		FROM
			paciente_patologia
	) AS r
GROUP BY
	c.nombre,
	p.genero
;

-- 7. Obtener una relación de aquellos pacientes que poseen alguna patología y que tienen una edad menor que 25 años --
/*
    YEAR(NOW())
    MONTH(NOW())
    DAY(NOW())
    ---------------
    DAYNAME(NOW())
    DAYMONTH(NOW())
*/
SELECT
	CONCAT_WS(' ', p.nombre, p.apellido) AS paciente,
	pt.nombre AS enfermedad,
	(YEAR(NOW()) - YEAR(p.fecha_nacimiento)) AS edad
FROM
	pacientes AS p
		INNER JOIN
	paciente_patologia AS pp ON p.id_paciente = pp.id_paciente
		INNER JOIN
	patologias AS pt ON pp.id_patologia = pt.id_patologia
WHERE
	(YEAR(NOW()) - YEAR(p.fecha_nacimiento)) < 25
ORDER BY
	edad ASC
;

-- 8. Cantidad de incidencias reportadas por mes --

--    COUNT(id_incidencias)       GROUP BY
-- 9. Cantidad de incidencias por ciudad, mes y grado, donde la cant. de incidencias reportadas sea mayor o igual a 2--
-- Datos sin agrupar --
SELECT
	c.nombre AS ciudad,
	MONTHNAME(i.fecha_registro) AS mes,
	-- COUNT(1) AS cantidad,
	i.grado
FROM
	incidencias AS i
		INNER JOIN
	pacientes AS p ON i.id_paciente = p.id_paciente
		INNER JOIN
	ciudades AS c ON p.id_ciudad = c.id_ciudad
ORDER BY
	c.nombre,
	i.grado
/*GROUP BY
	c.nombre,
	MONTHNAME(i.fecha_registro),
	i.grado
HAVING
	COUNT(1) >= 2*/
;

-- Consulta final --
SELECT
	c.nombre AS ciudad,
	MONTHNAME(i.fecha_registro) AS mes,
	COUNT(1) AS cantidad,
	i.grado
FROM
	incidencias AS i
		INNER JOIN
	pacientes AS p ON i.id_paciente = p.id_paciente
		INNER JOIN
	ciudades AS c ON p.id_ciudad = c.id_ciudad
GROUP BY
	c.nombre,
	MONTHNAME(i.fecha_registro),
	i.grado
HAVING
	COUNT(1) >= 2
;

-- 10. Patologías registradas que aún no poseen ningún paciente asociado --

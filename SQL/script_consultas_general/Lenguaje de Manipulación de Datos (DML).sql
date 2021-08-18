/* *************************************** */
/*	LENGUAJE DE CONSULTA ESTRUCTURADA (SQL) */
/*	--------------------------------------- */
/*            BASE DE DATOS I              */ 
/* Lenguaje de Manipulación de Datos (DML) */
/*     Instructor: Luis Miguel R. Bido     */
/* --------------------------------------- */

/* [PLUS]: Integridad Referencial */

-- *RESTRICT
-- CASCADE
-- SET NULL
-- *NO ACTION

CREATE DATABASE integridad;

USE integridad;

-- estructura para la entidad clientes --
CREATE TABLE clientes
(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL
);


-- estructura para la entidad facturas --
CREATE TABLE facturas
(
	id_factura INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT,
	monto_factura FLOAT NOT NULL,
	CONSTRAINT `fk1` FOREIGN KEY (id_cliente)
		REFERENCES clientes (id_cliente)
		ON DELETE SET NULL
		ON UPDATE SET NULL
);

-- estructura para la entidad cxc --
CREATE TABLE cxc
(
	id_cxc INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT,
	monto_pendiente FLOAT,
	CONSTRAINT `fk2` FOREIGN KEY (id_cliente)
		REFERENCES clientes (id_cliente) -- RESTRICT | NO ACTION
);

/*
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE clientes;
SET FOREIGN_KEY_CHECKS = 1;
*/

ALTER TABLE facturas
DROP FOREIGN KEY `fk1`;

ALTER TABLE facturas
ADD CONSTRAINT `fk1` FOREIGN KEY (id_cliente)
	REFERENCES clientes (id_cliente)
		ON DELETE CASCADE
		ON UPDATE CASCADE
;


ALTER TABLE cxc
DROP FOREIGN KEY `fk2`;

ALTER TABLE cxc
ADD CONSTRAINT `fk2` FOREIGN KEY (id_cliente)
	REFERENCES clientes (id_cliente)
		ON DELETE SET NULL
		ON UPDATE SET NULL
;

/*
INSERT INTO
	clientes (nombre)
VALUES
	('Julio Enrique'),
	('Luz Mariel'),
	('Enmanuel Ruíz'),
	('José Daniel'),
	('Héctor José')
;

INSERT INTO
	facturas (id_cliente, monto_factura)
VALUES
	(1, 1500),
	(2, 800),
	(3, 1200),
	(4, 8900),
	(5, 20000),
	(1, 780),
	(2, 500)
;


INSERT INTO
	cxc (id_cliente, monto_pendiente)
VALUES
	(1, 1500),
	(2, 800),
	(3, 1200)
;
*/


DELETE FROM
	clientes
WHERE
	id_cliente = 3
;

UPDATE
	clientes
SET
	id_cliente = 150
WHERE
	id_cliente = 1
;

SELECT
	*
FROM
	clientes
;

SELECT
	*
FROM
	facturas
;

SELECT
	*
FROM
	cxc
;


/* 1. Sentencia GROUP BY y Funciones de agrupamiento */

-- COUNT, SUM, AVG, MIN & MAX --
SELECT
	COUNT(*),
	COUNT(1),
	COUNT(p.id_paciente)
FROM
	pacientes AS p
;

SELECT
	COUNT(1) AS cuenta,
	AVG(id_paciente) AS promedio,
	SUM(id_paciente) AS suma,
	MIN(id_paciente) AS minimo_id,
	MAX((id_paciente + 10)) AS maximo_id
FROM
	pacientes AS p
;


-- Utilizando la sentencia GROUP BY --
SELECT
	nombre,
	COUNT(1) AS cantidad
FROM
	pacientes AS p
GROUP BY
	nombre
ORDER BY
	2 DESC
;


/* 2. Cláusula HAVING */
SELECT
	nombre,
	COUNT(1) AS cantidad
FROM
	pacientes AS p
GROUP BY
	nombre
HAVING
	COUNT(1) = 1
;


/* 3. Joins */

-- INNER JOIN --
SELECT
	c.nombre AS ciudad,
	CASE p.genero
		WHEN 'M' THEN 'Masculino'
		WHEN 'F' THEN 'Femenino'
	END AS genero,
	COUNT(1) AS cant_paciente_x_ciudad
FROM
	pacientes AS p
		INNER JOIN
	ciudades AS c ON p.id_ciudad = c.id_ciudad
GROUP BY
	c.nombre,
	p.genero
ORDER BY
	2 ASC
;


SELECT
	c.nombre AS ciudad,
	CASE p.genero
		WHEN 'M' THEN 'Masculino'
		WHEN 'F' THEN 'Femenino'
	END AS genero,
	COUNT(1) AS cant_paciente_x_ciudad
FROM
	pacientes AS p,
	ciudades AS c
WHERE
	p.id_ciudad = c.id_ciudad
GROUP BY
	c.nombre,
	p.genero
ORDER BY
	2 ASC
;


-- Ejemplo de sub-consulta --
SELECT
	SUM(d.cant_paciente_x_ciudad) AS total_paciente
FROM
	(
		SELECT
			c.nombre AS ciudad,
			COUNT(1) AS cant_paciente_x_ciudad
		FROM
			pacientes AS p
				INNER JOIN
			ciudades AS c ON p.id_ciudad = c.id_ciudad
		GROUP BY
			c.nombre
	) AS d
;

-- LEFT JOIN --
SELECT
	*
FROM
	ciudades AS c
		LEFT JOIN
	pacientes AS p ON c.id_ciudad = p.id_ciudad
;

-- RIGHT JOIN --
SELECT
	*
FROM
	ciudades AS c
		RIGHT JOIN
	pacientes AS p ON c.id_ciudad = p.id_ciudad
;

-- FULL JOIN --
SELECT
	*
FROM
	ciudades AS c
		LEFT JOIN
	pacientes AS p ON c.id_ciudad = p.id_ciudad

UNION

SELECT
	*
FROM
	ciudades AS c
		RIGHT JOIN
	pacientes AS p ON c.id_ciudad = p.id_ciudad
;

/* 4. Subconsultas */

-- Con los operadores lógicos: [NOT] IN, [NOT] EXISTS --

-- Cuál(es) ciudad(es) no poseen pacientes asociados --
SELECT
	c.nombre AS ciudad
FROM
	ciudades AS c
WHERE
	EXISTS
	(
		SELECT
			1
		FROM
			pacientes AS p
		WHERE
			p.id_ciudad = c.id_ciudad
	)
;

-- Los pacientes con ciudad id [1, 4] --
SELECT
	*
FROM
	pacientes AS p
WHERE
	p.id_ciudad IN (
		SELECT
			id_ciudad
		FROM
			ciudades
		WHERE
			id_ciudad <= 4
	)
;

SELECT
	*
FROM
	pacientes AS p
WHERE
	p.id_ciudad IN (1, 2, 3, 4)
;

-- Creando nuevas tablas a partir de un resultSet --
SELECT
	p1.paciente,
	p1.genero,
	c.nombre AS ciudad
FROM
	(
		SELECT
			p.id_paciente,
			p.id_ciudad,
			CONCAT_WS(' ', p.nombre, p.apellido) AS paciente,
			CASE p.genero
				WHEN 'M' THEN 'Masculino'
				ELSE 'Femenino'
			END AS genero
		FROM
			pacientes AS p
	) AS p1
		INNER JOIN
	ciudades AS c ON p1.id_ciudad = c.id_ciudad
;

-- Consultas escalares dentro de la sentencia SELECT --
SELECT
	*,
	(SELECT CONCAT_WS('-', id_ciudad, nombre) FROM ciudades WHERE id_ciudad = p.id_ciudad) AS ciudad
FROM
	pacientes AS p
;
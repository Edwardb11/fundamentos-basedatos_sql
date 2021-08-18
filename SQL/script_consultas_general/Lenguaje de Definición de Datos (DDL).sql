/* *************************************** */
/*	LENGUAJE DE CONSULTA ESTRUCTURADA (SQL) */
/*	--------------------------------------- */
/*            BASE DE DATOS I              */ 
/*   Lenguaje de Definición de Datos (DDL) */
/*     Instructor: Luis Miguel R. Bido     */
/* --------------------------------------- */

/* ------------------------------------------------- */
/*   1. Sentencias: CREATE, DROP, ALTER & TRUNCATE   */
/* ------------------------------------------------- */
CREATE DATABASE clase_ddl;

-- Borra una base de datos con todos sus objetos --
DROP DATABASE clase_ddl;

-- Selecciona una base de datos para el espacio de trabajo --
USE clase_ddl;

-- Creando la tabla personas --
CREATE TABLE personas
(
	id_persona INT NOT NULL,
	nombre VARCHAR(75) NOT NULL,
	apellido VARCHAR(75) NOT NULL,
	edad INT
);

-- Comando para mostrar todas la entidades de una base de datos determinada --
SHOW TABLES;

-- Comando para mostrar la estructura de una entidad --
DESCRIBE personas;

-- Resetea toda la estructura de la tabla borrando así todo su contenido (datos) de forma física --
TRUNCATE personas;

-- Modificando la estructura de la tabla personas --
ALTER TABLE personas
DROP edad;

ALTER TABLE personas
ADD edad INT;

ALTER TABLE personas
MODIFY COLUMN edad INT;


/* -------------------------------------- */
/*         2. Restricciones SQL           */
/* -------------------------------------- */

-- Agregando la restricción "NOT NULL" --
ALTER TABLE personas
MODIFY COLUMN edad INT NOT NULL;

-- Borrando la restricción "NOT NULL" --
ALTER TABLE personas
MODIFY COLUMN edad INT NULL;

-- Agregando la restricción "UNIQUE" --
ALTER TABLE personas
ADD CONSTRAINT `personas_unq_id_persona` UNIQUE(id_persona);

-- Borrando la restricción "UNIQUE" --
ALTER TABLE personas
DROP INDEX `personas_unq_id_persona`;

-- Agregando la restricción "UNIQUE" a más de un atributo de la tabla --
ALTER TABLE personas
ADD CONSTRAINT `personas_unq_nombre_apellido` UNIQUE(nombre, apellido);

-- Borrando la restricción "UNIQUE" --
ALTER TABLE personas
DROP INDEX `personas_unq_nombre_apellido`;

-- Agregando la restricción "UNIQUE" --
ALTER TABLE personas
ADD CONSTRAINT `personas_unq_nombre` UNIQUE(nombre);

ALTER TABLE personas
ADD CONSTRAINT `personas_unq_apellido` UNIQUE(apellido);

-- Borrando la restricción "NOT NULL" --
ALTER TABLE personas
DROP INDEX `personas_unq_nombre`;

ALTER TABLE personas
DROP INDEX `personas_unq_apellido`;

-- Agregando la restricción "PRIMARY KEY" --
ALTER TABLE personas
ADD CONSTRAINT `personas_pk_id_persona` PRIMARY KEY(id_persona);

-- Borrando la restricción "PRIMARY KEY" --
ALTER TABLE personas
DROP PRIMARY KEY;

-- Comando que nos muestra todos los índices de una entidad determinada --
SHOW INDEXES FROM personas;


-- Creando la tabla ciudades --
CREATE TABLE ciudades
(
	id_ciudad INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(255) NOT NULL
);

-- Agregando la restricción "PRIMARY KEY" --
ALTER TABLE personas
ADD CONSTRAINT `personas_pk_id_persona` PRIMARY KEY(id_persona);

-- Agregando el valor "AUTO_INCREMENT" --
ALTER TABLE personas
MODIFY id_persona INT NOT NULL AUTO_INCREMENT;

-- Agregando la restricción "NOT NULL" --
ALTER TABLE personas
MODIFY COLUMN edad INT NOT NULL;

-- Agregando una nueva columna a la entidad personas --
ALTER TABLE personas
ADD id_ciudad INT NOT NULL;

-- Agregando la restricción "FOREIGN KEY" --
ALTER TABLE personas
ADD CONSTRAINT `personas_fk_id_ciudad`
FOREIGN KEY (id_ciudad) REFERENCES ciudades (id_ciudad);

-- Borrando la restricción "FOREIGN KEY" --
ALTER TABLE personas
DROP FOREIGN KEY `personas_fk_id_ciudad`;

-- Agregando la restricción "DEFAULT" --
ALTER TABLE personas
ALTER edad SET DEFAULT 18;

-- Agregando nuevo atributo a la tabla persona con las restricciones: "NOT NULL" y "DEFAULT" --
ALTER TABLE personas
ADD fecha_registro DATETIME NOT NULL DEFAULT NOW();

-- [OjO]: buscar la solución (a mí no me funcionó, xd)
CREATE INDEX `personas_idx_edad` personas(edad);

-- Borrando el valor de "AUTO_INCREMENT" --
ALTER TABLE ciudades
MODIFY id_ciudad INT NOT NULL;
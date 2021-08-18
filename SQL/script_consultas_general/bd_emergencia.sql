-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para emergencia
CREATE DATABASE IF NOT EXISTS `emergencia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `emergencia`;

-- Volcando estructura para tabla emergencia.grados
CREATE TABLE IF NOT EXISTS `grados` (
  `id_grado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla emergencia.grados: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `grados` DISABLE KEYS */;
INSERT INTO `grados` (`id_grado`, `nombre`, `descripcion`) VALUES
	(1, 'Grado menor', 'personas con cortadas muy ligeras, dolor de cabeza...'),
	(2, 'Grado medio', 'ersonas  que  han  sufrido  golpes y caidas...'),
	(3, 'Grado mayor', 'Personas  que  han  sufrido  algún ataque...');
/*!40000 ALTER TABLE `grados` ENABLE KEYS */;

-- Volcando estructura para tabla emergencia.incidencias
CREATE TABLE IF NOT EXISTS `incidencias` (
  `id_incidencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_incidencia`),
  KEY `incidencias_fk_id_paciente` (`id_paciente`),
  KEY `incidencias_fk_id_grado` (`id_grado`),
  CONSTRAINT `incidencias_fk_id_grado` FOREIGN KEY (`id_grado`) REFERENCES `grados` (`id_grado`),
  CONSTRAINT `incidencias_fk_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla emergencia.incidencias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `incidencias` DISABLE KEYS */;
INSERT INTO `incidencias` (`id_incidencia`, `id_paciente`, `id_grado`, `fecha_registro`) VALUES
	(1, 2, 1, '2021-06-11 20:54:28'),
	(2, 4, 2, '2021-06-11 20:54:37'),
	(3, 5, 1, '2021-06-11 20:54:45'),
	(4, 3, 1, '2021-06-11 20:54:55'),
	(5, 3, 1, '2021-06-11 20:55:05');
/*!40000 ALTER TABLE `incidencias` ENABLE KEYS */;

-- Volcando estructura para tabla emergencia.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(75) NOT NULL,
  `segundo_nombre` varchar(75) NOT NULL,
  `primer_apellido` varchar(75) NOT NULL,
  `segundo_apellido` varchar(75) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla emergencia.pacientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` (`id_paciente`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `direccion`, `fecha_nacimiento`, `fecha_registro`) VALUES
	(1, 'Luis', 'Miguel', 'Rodriguez', 'Bido', 'La Vega, Rep. Dom.', '1996-10-04', '2021-06-11 20:47:03'),
	(2, 'José', 'Peralta', 'Reinoso', 'Tapia', 'Santiago, Rep. Dom.', '1985-10-01', '2021-06-11 20:47:31'),
	(3, 'Juan', 'Miguel', 'Rodriguez', 'Perez', 'Santo Domingo, Rep. Dom., calle 123, los mangos', '1994-01-25', '2021-06-11 20:48:11'),
	(4, 'Mariana', 'de Jesús', 'Almonte', 'Rosario', 'El Seibo, calle #5, casa 30', '1990-07-20', '2021-06-11 20:48:56'),
	(5, 'Miranda', 'Daniela', 'del Fino', 'Sanchez', 'Residencial 5 estrellas, ubicación 123456', '1987-02-18', '2021-06-11 20:49:59'),
	(6, 'Lucia', 'Maria', 'Sanchez', 'Bruno', 'Localidad no identificada...', '1995-09-01', '2021-06-11 20:50:51');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;

-- Volcando estructura para tabla emergencia.paciente_patologia
CREATE TABLE IF NOT EXISTS `paciente_patologia` (
  `id_paciente` int(11) NOT NULL,
  `id_patologia` int(11) NOT NULL,
  `id_paciente_patologia` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_paciente_patologia`),
  KEY `paciente_patologia_fk_id_paciente` (`id_paciente`),
  KEY `paciente_patologia_fk_id_patologia` (`id_patologia`),
  CONSTRAINT `paciente_patologia_fk_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  CONSTRAINT `paciente_patologia_fk_id_patologia` FOREIGN KEY (`id_patologia`) REFERENCES `patologias` (`id_patologia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla emergencia.paciente_patologia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente_patologia` DISABLE KEYS */;
INSERT INTO `paciente_patologia` (`id_paciente`, `id_patologia`, `id_paciente_patologia`) VALUES
	(6, 4, 1),
	(4, 1, 2),
	(5, 4, 3),
	(3, 1, 4),
	(6, 2, 5),
	(3, 3, 6);
/*!40000 ALTER TABLE `paciente_patologia` ENABLE KEYS */;

-- Volcando estructura para tabla emergencia.patologias
CREATE TABLE IF NOT EXISTS `patologias` (
  `id_patologia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_patologia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla emergencia.patologias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `patologias` DISABLE KEYS */;
INSERT INTO `patologias` (`id_patologia`, `nombre`) VALUES
	(1, 'Hipertenseión'),
	(2, 'Problemas circulatorios'),
	(3, 'Diabetis'),
	(4, 'Enfermedad de los riñones'),
	(5, 'Problemas cardiacos');
/*!40000 ALTER TABLE `patologias` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

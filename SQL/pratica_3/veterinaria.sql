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


-- Volcando estructura de base de datos para veterinaria
CREATE DATABASE IF NOT EXISTS `veterinaria` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `veterinaria`;

-- Volcando estructura para tabla veterinaria.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_provincia` int(11) NOT NULL,
  `nombre` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `genero` enum('M','F') COLLATE utf8_unicode_ci NOT NULL COMMENT '''M'' => Masculino | ''F'' => Femenino',
  `cedula` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `clientes_fk_id_provincia` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla veterinaria.clientes: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id_cliente`, `id_provincia`, `nombre`, `apellido`, `genero`, `cedula`, `fecha_nacimiento`) VALUES
	(1, 1, 'Luis', 'Miguel', 'M', '40278963240', '1996-10-04'),
	(2, 1, 'Lorenni', 'Isabel', 'F', '40278256489', '1997-12-01'),
	(3, 1, 'Sonia', 'María', 'F', '40256987123', '1990-05-20'),
	(4, 2, 'Miguel', 'David', 'M', '40268795420', '1996-02-14'),
	(5, 5, 'Julio', 'Ángel', 'M', '0478965412', '1970-12-08'),
	(6, 4, 'Evaristo', 'Ariel', 'M', '04789654870', '1996-02-14'),
	(7, 2, 'Anny', 'Valdez', 'F', '40284135478', '1997-05-12'),
	(8, 3, 'María', 'Medina', 'F', '04758120364', '1988-10-01'),
	(9, 2, 'Vanessa', 'Robles', 'F', '40230014578', '1996-04-12'),
	(10, 7, 'Julio', 'Delgado', 'M', '40232001478', '1996-07-25'),
	(11, 3, 'Randy', 'Diloné', 'M', '40298746325', '1996-04-22'),
	(12, 6, 'Cristian', 'Gómez', 'M', '40200580647', '1996-08-24'),
	(13, 5, 'Luis', 'José', 'M', '40235789850', '1992-06-18');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla veterinaria.cliente_mascota
CREATE TABLE IF NOT EXISTS `cliente_mascota` (
  `id_cliente_mascota` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_mascota` int(11) NOT NULL,
  `estado_adopcion` enum('A','C') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A' COMMENT '''A'' => la adopción se encuentra activa | ''C'' => la adopción ha sido cancelada',
  `fecha_adopcion` date NOT NULL,
  `fecha_cancelacion` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente_mascota`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_mascota` (`id_mascota`),
  CONSTRAINT `cliente_mascota_fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `cliente_mascota_fk_id_mascota` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla veterinaria.cliente_mascota: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente_mascota` DISABLE KEYS */;
INSERT INTO `cliente_mascota` (`id_cliente_mascota`, `id_cliente`, `id_mascota`, `estado_adopcion`, `fecha_adopcion`, `fecha_cancelacion`) VALUES
	(1, 1, 1, 'C', '2018-01-15', '2019-01-10'),
	(2, 1, 6, 'A', '2019-10-01', NULL),
	(3, 2, 2, 'C', '2018-03-26', '2019-02-19'),
	(4, 2, 5, 'A', '2019-04-24', NULL),
	(5, 7, 15, 'A', '2019-07-21', NULL),
	(6, 12, 4, 'A', '2020-09-17', NULL),
	(7, 6, 13, 'A', '2020-08-14', NULL),
	(8, 3, 11, 'A', '2020-10-07', NULL),
	(9, 9, 8, 'A', '2020-10-22', NULL),
	(10, 3, 10, 'A', '2018-07-22', NULL),
	(11, 11, 9, 'A', '2020-09-01', NULL),
	(12, 4, 3, 'C', '2018-05-18', '2019-07-25'),
	(13, 5, 3, 'A', '2020-08-29', NULL),
	(14, 8, 12, 'A', '2020-10-05', '2020-10-29'),
	(15, 10, 9, 'C', '2018-01-01', '2018-12-02'),
	(16, 11, 15, 'C', '2019-01-30', '2019-05-01'),
	(17, 9, 9, 'C', '2019-03-23', '2019-05-28');
/*!40000 ALTER TABLE `cliente_mascota` ENABLE KEYS */;

-- Volcando estructura para tabla veterinaria.incidencias
CREATE TABLE IF NOT EXISTS `incidencias` (
  `id_incidencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_mascota` int(11) NOT NULL,
  `recompensa` float DEFAULT NULL COMMENT 'recompensa para la persona que encuentre a la mascota',
  `fecha_recuperado` date DEFAULT NULL COMMENT 'fecha en que se encontró la mascota',
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_incidencia`),
  KEY `incidencias_fk_id_mascota` (`id_mascota`),
  CONSTRAINT `incidencias_fk_id_mascota` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla veterinaria.incidencias: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `incidencias` DISABLE KEYS */;
INSERT INTO `incidencias` (`id_incidencia`, `id_mascota`, `recompensa`, `fecha_recuperado`, `fecha_registro`) VALUES
	(1, 2, 3500, NULL, '2018-09-21'),
	(2, 5, 5000, NULL, '2020-09-25'),
	(3, 3, NULL, '2020-11-29', '2019-10-21'),
	(4, 9, NULL, '2020-10-01', '2020-07-13'),
	(5, 1, 7000, NULL, '2019-01-01'),
	(6, 12, NULL, '2020-09-01', '2020-10-10'),
	(7, 10, NULL, '2020-01-10', '2019-12-01'),
	(8, 10, NULL, '2019-02-15', '2019-07-19'),
	(9, 14, 4500, NULL, '2020-09-05'),
	(10, 6, 6500, NULL, '2020-03-19');
/*!40000 ALTER TABLE `incidencias` ENABLE KEYS */;

-- Volcando estructura para tabla veterinaria.mascotas
CREATE TABLE IF NOT EXISTS `mascotas` (
  `id_mascota` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_mascota` int(11) NOT NULL,
  `id_raza` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'nombre de la mascota',
  `peso` float NOT NULL COMMENT 'peso expresado en kilogramos',
  `edad` smallint(6) NOT NULL COMMENT 'edad expresada en años',
  `genero` enum('M','F') COLLATE utf8_unicode_ci NOT NULL COMMENT '''M'' => Masculino | ''F'' => Femenino',
  PRIMARY KEY (`id_mascota`),
  KEY `id_tipo_mascota` (`id_tipo_mascota`),
  KEY `id_raza` (`id_raza`),
  CONSTRAINT `mascotas_fk_id_raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id_raza`),
  CONSTRAINT `mascotas_fk_id_tipo_mascota` FOREIGN KEY (`id_tipo_mascota`) REFERENCES `tipo_mascota` (`id_tipo_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla veterinaria.mascotas: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` (`id_mascota`, `id_tipo_mascota`, `id_raza`, `nombre`, `peso`, `edad`, `genero`) VALUES
	(1, 2, 2, 'Grisoudhat', 3, 2, 'F'),
	(2, 2, 1, 'Blankutin', 4, 3, 'M'),
	(3, 1, 10, 'Coquito', 6, 5, 'M'),
	(4, 1, 9, 'Cosito', 5.5, 7, 'M'),
	(5, 2, 1, 'Maizito', 3.5, 3, 'M'),
	(6, 2, 7, 'Pitch', 4, 3, 'M'),
	(7, 2, 5, 'Alaskha', 3.8, 5, 'F'),
	(8, 2, 6, 'Habalyna', 3.2, 3, 'F'),
	(9, 2, 7, 'Sr. Visitante', 4, 5, 'M'),
	(10, 2, 6, 'Phiny', 3.5, 5, 'M'),
	(11, 2, 3, 'Bakín', 0.5, 0, 'M'),
	(12, 1, 11, 'Yombi', 5, 3, 'M'),
	(13, 1, 14, 'Niko', 2.5, 2, 'M'),
	(14, 1, 15, 'Shispa', 3.5, 3, 'F'),
	(15, 1, 13, 'Máx', 5, 8, 'M');
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;

-- Volcando estructura para tabla veterinaria.mascota_vacuna
CREATE TABLE IF NOT EXISTS `mascota_vacuna` (
  `id_mascota_vacuna` int(11) NOT NULL AUTO_INCREMENT,
  `id_mascota` int(11) NOT NULL,
  `id_vacuna` int(11) NOT NULL,
  PRIMARY KEY (`id_mascota_vacuna`),
  KEY `id_mascota` (`id_mascota`),
  KEY `id_vacuna` (`id_vacuna`),
  CONSTRAINT `mascota_vacuna_fk_id_mascota` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  CONSTRAINT `mascota_vacuna_fk_id_vacuna` FOREIGN KEY (`id_vacuna`) REFERENCES `vacunas` (`id_vacuna`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla veterinaria.mascota_vacuna: ~60 rows (aproximadamente)
/*!40000 ALTER TABLE `mascota_vacuna` DISABLE KEYS */;
INSERT INTO `mascota_vacuna` (`id_mascota_vacuna`, `id_mascota`, `id_vacuna`) VALUES
	(1, 7, 4),
	(2, 11, 4),
	(3, 1, 4),
	(4, 2, 4),
	(5, 3, 4),
	(6, 4, 4),
	(7, 5, 4),
	(8, 6, 4),
	(9, 8, 4),
	(10, 9, 4),
	(11, 10, 4),
	(12, 12, 4),
	(13, 13, 4),
	(14, 14, 4),
	(15, 15, 4),
	(16, 1, 2),
	(17, 2, 1),
	(18, 5, 3),
	(19, 6, 2),
	(20, 8, 1),
	(21, 9, 3),
	(22, 10, 2),
	(23, 11, 2),
	(24, 7, 3),
	(25, 1, 3),
	(26, 2, 2),
	(27, 5, 1),
	(28, 6, 3),
	(29, 8, 2),
	(30, 11, 3),
	(31, 11, 1),
	(32, 3, 5),
	(33, 4, 6),
	(34, 12, 7),
	(35, 13, 8),
	(36, 14, 9),
	(37, 15, 10),
	(38, 3, 11),
	(39, 4, 10),
	(40, 12, 9),
	(41, 13, 7),
	(42, 14, 6),
	(43, 15, 5),
	(44, 14, 5),
	(45, 14, 7),
	(46, 14, 8),
	(47, 14, 10),
	(48, 14, 11),
	(49, 3, 6),
	(50, 3, 7),
	(51, 3, 8),
	(52, 3, 10),
	(53, 3, 9),
	(54, 12, 6),
	(55, 12, 5),
	(56, 12, 8),
	(57, 12, 10),
	(58, 12, 11),
	(59, 4, 7),
	(60, 4, 8);
/*!40000 ALTER TABLE `mascota_vacuna` ENABLE KEYS */;

-- Volcando estructura para tabla veterinaria.provincias
CREATE TABLE IF NOT EXISTS `provincias` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla veterinaria.provincias: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` (`id_provincia`, `nombre`) VALUES
	(1, 'La Vega'),
	(2, 'Santiago'),
	(3, 'Santo Domingo'),
	(4, 'La Romana'),
	(5, 'La Altagracia'),
	(6, 'Samaná'),
	(7, 'Azua');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;

-- Volcando estructura para tabla veterinaria.razas
CREATE TABLE IF NOT EXISTS `razas` (
  `id_raza` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_raza`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla veterinaria.razas: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `razas` DISABLE KEYS */;
INSERT INTO `razas` (`id_raza`, `descripcion`) VALUES
	(1, 'Angora'),
	(2, 'Bombay'),
	(3, 'Exótico'),
	(4, 'Gato común'),
	(5, 'Korat'),
	(6, 'Persa'),
	(7, 'Toyger'),
	(8, 'Bergamasco'),
	(9, 'Billy'),
	(10, 'Bóxer'),
	(11, 'Braco húngaro'),
	(12, 'Bulldog francés'),
	(13, 'Caniche'),
	(14, 'Chihuahua'),
	(15, 'Chow Chow');
/*!40000 ALTER TABLE `razas` ENABLE KEYS */;

-- Volcando estructura para tabla veterinaria.tipo_mascota
CREATE TABLE IF NOT EXISTS `tipo_mascota` (
  `id_tipo_mascota` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla veterinaria.tipo_mascota: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_mascota` DISABLE KEYS */;
INSERT INTO `tipo_mascota` (`id_tipo_mascota`, `descripcion`) VALUES
	(1, 'Perro'),
	(2, 'Gato'),
	(3, 'Peces'),
	(4, 'Pájaros');
/*!40000 ALTER TABLE `tipo_mascota` ENABLE KEYS */;

-- Volcando estructura para tabla veterinaria.vacunas
CREATE TABLE IF NOT EXISTS `vacunas` (
  `id_vacuna` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `para_perro` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''1'' => si la mascota aplica para perros | ''0'' si no aplica',
  `para_gato` tinyint(1) NOT NULL DEFAULT '0' COMMENT '''1'' => si la mascota aplica para gatos | ''0'' si no aplica',
  PRIMARY KEY (`id_vacuna`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla veterinaria.vacunas: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `vacunas` DISABLE KEYS */;
INSERT INTO `vacunas` (`id_vacuna`, `nombre`, `para_perro`, `para_gato`) VALUES
	(1, 'Rinotraqueitis', 0, 1),
	(2, 'Calcivirus', 0, 1),
	(3, 'Leucemia', 0, 1),
	(4, 'Rabia', 1, 1),
	(5, 'Coronavirus', 1, 0),
	(6, 'Leptospirosis', 1, 0),
	(7, 'Parainfluencia', 1, 0),
	(8, 'Bordetellosis', 1, 0),
	(9, 'Parvovirus', 1, 0),
	(10, 'Hepatitis canina', 1, 0),
	(11, 'Distemper', 1, 0);
/*!40000 ALTER TABLE `vacunas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

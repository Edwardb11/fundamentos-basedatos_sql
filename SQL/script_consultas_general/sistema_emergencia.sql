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


-- Volcando estructura de base de datos para sistema_emergencia
CREATE DATABASE IF NOT EXISTS `sistema_emergencia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sistema_emergencia`;

-- Volcando estructura para tabla sistema_emergencia.ciudades
CREATE TABLE IF NOT EXISTS `ciudades` (
  `id_ciudad` smallint(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `estado` enum('A','I') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_emergencia.ciudades: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` (`id_ciudad`, `nombre`, `estado`) VALUES
	(1, 'La Vega', 'A'),
	(2, 'Santiago', 'A'),
	(3, 'Santo Domingo', 'A'),
	(4, 'Moca', 'A'),
	(5, 'Jarabacoa', 'A'),
	(6, 'Boca Chica', 'A'),
	(7, 'La Romana', 'A'),
	(8, 'Puerto Plata', 'A'),
	(9, 'No va a salir', 'A');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_emergencia.incidencias
CREATE TABLE IF NOT EXISTS `incidencias` (
  `id_incidencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  `grado` enum('1','2','3') NOT NULL DEFAULT '1',
  `estado` enum('A','I') NOT NULL DEFAULT 'A',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_incidencia`),
  KEY `incidencias_fk_id_paciente` (`id_paciente`),
  CONSTRAINT `incidencias_fk_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_emergencia.incidencias: ~74 rows (aproximadamente)
/*!40000 ALTER TABLE `incidencias` DISABLE KEYS */;
INSERT INTO `incidencias` (`id_incidencia`, `id_paciente`, `grado`, `estado`, `fecha_registro`) VALUES
	(1, 42, '2', 'A', '2020-08-01 00:00:00'),
	(2, 42, '1', 'A', '2020-09-14 00:00:00'),
	(3, 44, '3', 'A', '2020-08-01 00:00:00'),
	(4, 44, '2', 'A', '2020-09-14 00:00:00'),
	(5, 45, '1', 'A', '2020-08-01 00:00:00'),
	(6, 61, '2', 'A', '2020-09-14 00:00:00'),
	(7, 62, '3', 'A', '2020-08-01 00:00:00'),
	(8, 62, '2', 'A', '2020-09-14 00:00:00'),
	(9, 65, '2', 'A', '2020-08-20 00:00:00'),
	(10, 66, '1', 'A', '2020-10-01 00:00:00'),
	(11, 67, '1', 'A', '2020-08-20 00:00:00'),
	(12, 68, '3', 'A', '2020-10-01 00:00:00'),
	(13, 69, '3', 'A', '2020-10-20 00:00:00'),
	(14, 70, '1', 'A', '2020-08-01 00:00:00'),
	(15, 70, '2', 'A', '2020-10-01 00:00:00'),
	(16, 19, '3', 'A', '2020-08-20 00:00:00'),
	(17, 20, '3', 'A', '2020-09-01 00:00:00'),
	(18, 21, '1', 'A', '2020-09-23 00:00:00'),
	(19, 22, '2', 'A', '2020-09-01 00:00:00'),
	(20, 23, '3', 'A', '2020-09-23 00:00:00'),
	(21, 24, '2', 'A', '2020-09-01 00:00:00'),
	(22, 25, '2', 'A', '2020-07-23 00:00:00'),
	(23, 25, '1', 'A', '2020-08-01 00:00:00'),
	(24, 26, '1', 'A', '2020-07-23 00:00:00'),
	(25, 27, '3', 'A', '2020-08-01 00:00:00'),
	(26, 28, '1', 'A', '2020-07-01 00:00:00'),
	(27, 29, '2', 'A', '2020-08-23 00:00:00'),
	(28, 30, '3', 'A', '2020-07-01 00:00:00'),
	(29, 31, '2', 'A', '2020-08-01 00:00:00'),
	(30, 32, '1', 'A', '2020-07-22 00:00:00'),
	(31, 33, '3', 'A', '2020-07-01 00:00:00'),
	(32, 50, '2', 'A', '2020-08-22 00:00:00'),
	(33, 51, '1', 'A', '2020-09-01 00:00:00'),
	(34, 53, '3', 'A', '2020-08-22 00:00:00'),
	(35, 55, '3', 'A', '2020-09-01 00:00:00'),
	(36, 100, '1', 'A', '2020-09-22 00:00:00'),
	(37, 99, '2', 'A', '2020-09-11 00:00:00'),
	(38, 98, '2', 'A', '2020-08-23 00:00:00'),
	(39, 97, '2', 'A', '2020-09-11 00:00:00'),
	(40, 97, '1', 'A', '2020-08-01 00:00:00'),
	(41, 56, '3', 'A', '2020-10-24 00:00:00'),
	(42, 76, '2', 'A', '2020-10-24 00:00:00'),
	(43, 1, '1', 'A', '2020-08-24 00:00:00'),
	(44, 2, '1', 'A', '2020-10-19 00:00:00'),
	(45, 3, '1', 'A', '2020-10-01 00:00:00'),
	(46, 4, '2', 'A', '2020-10-19 00:00:00'),
	(47, 5, '2', 'A', '2020-09-01 00:00:00'),
	(48, 6, '1', 'A', '2020-08-19 00:00:00'),
	(49, 7, '3', 'A', '2020-08-19 00:00:00'),
	(50, 8, '3', 'A', '2020-09-01 00:00:00'),
	(51, 9, '2', 'A', '2020-08-01 00:00:00'),
	(52, 10, '1', 'A', '2020-09-11 00:00:00'),
	(53, 11, '2', 'A', '2020-08-01 00:00:00'),
	(54, 12, '1', 'A', '2020-09-11 00:00:00'),
	(55, 13, '3', 'A', '2020-08-01 00:00:00'),
	(56, 14, '3', 'A', '2020-09-11 00:00:00'),
	(57, 15, '1', 'A', '2020-09-11 00:00:00'),
	(58, 16, '3', 'A', '2020-08-01 00:00:00'),
	(59, 17, '2', 'A', '2020-09-07 00:00:00'),
	(60, 18, '1', 'A', '2020-08-01 00:00:00'),
	(61, 80, '3', 'A', '2020-09-07 00:00:00'),
	(62, 98, '1', 'A', '2020-08-01 00:00:00'),
	(63, 40, '2', 'A', '2020-09-07 00:00:00'),
	(64, 41, '3', 'A', '2020-08-01 00:00:00'),
	(65, 71, '2', 'A', '2020-09-07 00:00:00'),
	(66, 71, '1', 'A', '2020-08-01 00:00:00'),
	(67, 71, '2', 'A', '2020-09-12 00:00:00'),
	(68, 72, '1', 'A', '2020-08-12 00:00:00'),
	(69, 72, '1', 'A', '2020-09-01 00:00:00'),
	(70, 72, '2', 'A', '2020-10-12 00:00:00'),
	(71, 75, '3', 'A', '2020-08-01 00:00:00'),
	(72, 100, '2', 'A', '2020-10-25 00:00:00'),
	(73, 100, '3', 'A', '2020-10-25 00:00:00'),
	(74, 100, '3', 'A', '2020-10-25 00:00:00');
/*!40000 ALTER TABLE `incidencias` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_emergencia.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `id_ciudad` smallint(6) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `apellido` varchar(75) NOT NULL,
  `genero` enum('M','F') NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` enum('A','I') NOT NULL DEFAULT 'A',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paciente`),
  KEY `pacientes_fk_id_ciudad` (`id_ciudad`),
  CONSTRAINT `pacientes_fk_id_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_emergencia.pacientes: ~100 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` (`id_paciente`, `id_ciudad`, `nombre`, `apellido`, `genero`, `fecha_nacimiento`, `estado`, `fecha_registro`) VALUES
	(1, 2, 'Minny', 'Hollingsbee', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(2, 1, 'Holly-anne', 'Janaud', 'F', '1997-01-10', 'A', '2020-11-29 15:43:55'),
	(3, 3, 'Antonio', 'Ogelbe', 'M', '1996-10-04', 'A', '2020-11-29 15:43:55'),
	(4, 4, 'Denney', 'Petruk', 'M', '1978-12-31', 'A', '2020-11-29 15:43:55'),
	(5, 5, 'Valaree', 'Nolder', 'F', '1998-09-25', 'A', '2020-11-29 15:43:55'),
	(6, 8, 'Nerita', 'Petrasso', 'F', '1998-08-24', 'A', '2020-11-29 15:43:55'),
	(7, 5, 'Trixy', 'Gwinn', 'F', '1970-05-05', 'A', '2020-11-29 15:43:55'),
	(8, 6, 'Nicholle', 'Clarycott', 'F', '1980-03-27', 'A', '2020-11-29 15:43:55'),
	(9, 8, 'Ginny', 'Abrahams', 'F', '1989-07-26', 'A', '2020-11-29 15:43:55'),
	(10, 6, 'Merl', 'Sidden', 'F', '1997-05-30', 'A', '2020-11-29 15:43:55'),
	(11, 2, 'Sile', 'Tebbutt', 'F', '1989-04-06', 'A', '2020-11-29 15:43:55'),
	(12, 1, 'Holmes', 'Karpenko', 'M', '1987-08-28', 'A', '2020-11-29 15:43:55'),
	(13, 2, 'Demetra', 'Grealey', 'F', '1990-10-20', 'A', '2020-11-29 15:43:55'),
	(14, 3, 'Rhonda', 'Ilyin', 'F', '1994-03-10', 'A', '2020-11-29 15:43:55'),
	(15, 4, 'Elisabet', 'Quarterman', 'F', '1997-12-01', 'A', '2020-11-29 15:43:55'),
	(16, 5, 'Karel', 'Ciotto', 'F', '1995-11-04', 'A', '2020-11-29 15:43:55'),
	(17, 6, 'Jennee', 'Cana', 'F', '1992-11-10', 'A', '2020-11-29 15:43:55'),
	(18, 7, 'Quinlan', 'Gerin', 'M', '1998-03-15', 'A', '2020-11-29 15:43:55'),
	(19, 8, 'Kile', 'Tyrie', 'M', '1998-12-01', 'A', '2020-11-29 15:43:55'),
	(20, 2, 'Torry', 'Fehely', 'M', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(21, 4, 'Inger', 'Spraggon', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(22, 5, 'Dmitri', 'Grzelak', 'M', '1998-12-01', 'A', '2020-11-29 15:43:55'),
	(23, 6, 'Georgeanna', 'Winham', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(24, 7, 'Thatcher', 'McCaffery', 'M', '1990-12-01', 'A', '2020-11-29 15:43:55'),
	(25, 8, 'Guillemette', 'Budik', 'F', '1998-12-01', 'A', '2020-11-29 15:43:55'),
	(26, 2, 'Tova', 'Margeram', 'F', '1990-12-01', 'A', '2020-11-29 15:43:55'),
	(27, 1, 'Hildegaard', 'Chretien', 'F', '1998-10-01', 'A', '2020-11-29 15:43:55'),
	(28, 3, 'Francklin', 'L\' Estrange', 'M', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(29, 3, 'Shanda', 'Garmon', 'F', '1998-11-01', 'A', '2020-11-29 15:43:55'),
	(30, 4, 'Analise', 'Relton', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(31, 5, 'Libbey', 'Etheredge', 'F', '1998-10-01', 'A', '2020-11-29 15:43:55'),
	(32, 3, 'Allsun', 'Downe', 'F', '1998-11-01', 'A', '2020-11-29 15:43:55'),
	(33, 5, 'Cyrille', 'Shambrook', 'M', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(34, 6, 'Bride', 'Esparza', 'F', '1987-11-01', 'A', '2020-11-29 15:43:55'),
	(35, 7, 'Ingeberg', 'Marley', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(36, 1, 'Baxy', 'Capaldi', 'M', '1987-11-01', 'A', '2020-11-29 15:43:55'),
	(37, 2, 'Alexis', 'Grelik', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(38, 6, 'Briant', 'Reames', 'M', '1987-11-01', 'A', '2020-11-29 15:43:55'),
	(39, 7, 'Cynthia', 'MacKibbon', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(40, 3, 'Trixi', 'Squirrell', 'F', '1987-03-01', 'A', '2020-11-29 15:43:55'),
	(41, 4, 'Filip', 'Fewlass', 'M', '1990-03-01', 'A', '2020-11-29 15:43:55'),
	(42, 6, 'Ari', 'Haddon', 'M', '1990-03-01', 'A', '2020-11-29 15:43:55'),
	(43, 7, 'Jeff', 'Hurt', 'M', '1997-03-01', 'A', '2020-11-29 15:43:55'),
	(44, 1, 'Hans', 'Zanussii', 'M', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(45, 1, 'Lainey', 'Kirwin', 'F', '1997-10-01', 'A', '2020-11-29 15:43:55'),
	(46, 3, 'Northrop', 'Cantrell', 'M', '1997-10-01', 'A', '2020-11-29 15:43:55'),
	(47, 4, 'Trevor', 'Egar', 'M', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(48, 3, 'Cissiee', 'MacCambridge', 'F', '1997-08-01', 'A', '2020-11-29 15:43:55'),
	(49, 5, 'Tillie', 'Parrett', 'F', '1990-08-01', 'A', '2020-11-29 15:43:55'),
	(50, 6, 'Conroy', 'Lowle', 'M', '1994-08-01', 'A', '2020-11-29 15:43:55'),
	(51, 7, 'Morganica', 'Pulfer', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(52, 8, 'Isadore', 'Glencrash', 'M', '1994-10-01', 'A', '2020-11-29 15:43:55'),
	(53, 2, 'Juli', 'Senussi', 'F', '1994-08-01', 'A', '2020-11-29 15:43:55'),
	(54, 3, 'Marlow', 'Upson', 'M', '1990-08-01', 'A', '2020-11-29 15:43:55'),
	(55, 3, 'Francois', 'Clemmett', 'M', '1994-10-01', 'A', '2020-11-29 15:43:55'),
	(56, 4, 'Bret', 'Cogle', 'M', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(57, 4, 'Burton', 'Ainslee', 'M', '1999-07-01', 'A', '2020-11-29 15:43:55'),
	(58, 5, 'Tabatha', 'Firebrace', 'F', '1990-07-01', 'A', '2020-11-29 15:43:55'),
	(59, 5, 'Jasen', 'Maggiore', 'M', '1999-07-01', 'A', '2020-11-29 15:43:55'),
	(60, 6, 'Tammie', 'Henbury', 'M', '1990-07-01', 'A', '2020-11-29 15:43:55'),
	(61, 7, 'Channa', 'Iacomini', 'F', '1999-07-01', 'A', '2020-11-29 15:43:55'),
	(62, 8, 'Humfried', 'Vandenhoff', 'M', '1999-10-01', 'A', '2020-11-29 15:43:55'),
	(63, 5, 'Berry', 'Tran', 'F', '1990-05-01', 'A', '2020-11-29 15:43:55'),
	(64, 2, 'Baryram', 'Trimbey', 'M', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(65, 1, 'Inger', 'Laybourn', 'F', '1988-05-01', 'A', '2020-11-29 15:43:55'),
	(66, 2, 'Rhody', 'Jankovsky', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(67, 5, 'Rikki', 'Heistermann', 'M', '1988-05-01', 'A', '2020-11-29 15:43:55'),
	(68, 6, 'Vincenty', 'Skey', 'M', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(69, 8, 'Kettie', 'Gosney', 'F', '1988-05-01', 'A', '2020-11-29 15:43:55'),
	(70, 7, 'Mignonne', 'Buncom', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(71, 5, 'Aluino', 'Fitzpatrick', 'M', '1990-05-01', 'A', '2020-11-29 15:43:55'),
	(72, 3, 'Ashla', 'Danilewicz', 'F', '1988-05-01', 'A', '2020-11-29 15:43:55'),
	(73, 2, 'Rosanne', 'Toomer', 'F', '1990-10-15', 'A', '2020-11-29 15:43:55'),
	(74, 1, 'Fanchon', 'Jobbins', 'F', '1990-10-15', 'A', '2020-11-29 15:43:55'),
	(75, 3, 'Melosa', 'Oakly', 'F', '1988-10-15', 'A', '2020-11-29 15:43:55'),
	(76, 4, 'Jorry', 'Redbourn', 'F', '1990-10-15', 'A', '2020-11-29 15:43:55'),
	(77, 5, 'Nickolaus', 'Estevez', 'M', '2000-02-22', 'A', '2020-11-29 15:43:55'),
	(78, 6, 'Jillayne', 'Howgill', 'F', '1990-10-15', 'A', '2020-11-29 15:43:55'),
	(79, 7, 'Cassey', 'Blenkinsopp', 'F', '1990-02-22', 'A', '2020-11-29 15:43:55'),
	(80, 4, 'Harley', 'Marxsen', 'F', '2000-02-22', 'A', '2020-11-29 15:43:55'),
	(81, 3, 'Ab', 'Drewry', 'M', '1990-10-15', 'A', '2020-11-29 15:43:55'),
	(82, 4, 'Lauralee', 'Veal', 'F', '2000-10-15', 'A', '2020-11-29 15:43:55'),
	(83, 6, 'Gare', 'Duckering', 'M', '1990-02-22', 'A', '2020-11-29 15:43:55'),
	(84, 7, 'Ortensia', 'Cokly', 'F', '1990-10-15', 'A', '2020-11-29 15:43:55'),
	(85, 2, 'Antin', 'Klulicek', 'M', '2000-02-22', 'A', '2020-11-29 15:43:55'),
	(86, 1, 'Agnese', 'Gronaller', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(87, 4, 'Lannie', 'McGeown', 'M', '1995-06-01', 'A', '2020-11-29 15:43:55'),
	(88, 6, 'Germaine', 'Portwain', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(89, 7, 'Byron', 'Coucher', 'M', '1990-06-01', 'A', '2020-11-29 15:43:55'),
	(90, 7, 'Beryl', 'Slowey', 'F', '1995-12-25', 'A', '2020-11-29 15:43:55'),
	(91, 8, 'Tami', 'Abramowitz', 'F', '1990-12-25', 'A', '2020-11-29 15:43:55'),
	(92, 2, 'Bordie', 'Bilton', 'M', '1995-06-01', 'A', '2020-11-29 15:43:55'),
	(93, 3, 'Felic', 'Risborough', 'M', '1990-12-25', 'A', '2020-11-29 15:43:55'),
	(94, 5, 'Camel', 'Brastead', 'F', '1990-06-01', 'A', '2020-11-29 15:43:55'),
	(95, 7, 'Mavis', 'Swigger', 'F', '1995-12-25', 'A', '2020-11-29 15:43:55'),
	(96, 8, 'Greta', 'Ezele', 'F', '1990-12-25', 'A', '2020-11-29 15:43:55'),
	(97, 5, 'Jenn', 'Grzesiak', 'F', '1995-06-01', 'A', '2020-11-29 15:43:55'),
	(98, 2, 'Hewet', 'Parker', 'M', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(99, 3, 'Jordana', 'Topham', 'F', '1990-10-01', 'A', '2020-11-29 15:43:55'),
	(100, 7, 'Arri', 'Vockings', 'M', '1998-01-14', 'A', '2020-11-29 15:43:55');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_emergencia.paciente_patologia
CREATE TABLE IF NOT EXISTS `paciente_patologia` (
  `id_paciente_patologia` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  `id_patologia` int(11) NOT NULL,
  PRIMARY KEY (`id_paciente_patologia`),
  KEY `paciente_patologia_fk_id_paciente` (`id_paciente`),
  KEY `paciente_patologia_fk_id_patologia` (`id_patologia`),
  CONSTRAINT `paciente_patologia_fk_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `paciente_patologia_fk_id_patologia` FOREIGN KEY (`id_patologia`) REFERENCES `patologias` (`id_patologia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_emergencia.paciente_patologia: ~74 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente_patologia` DISABLE KEYS */;
INSERT INTO `paciente_patologia` (`id_paciente_patologia`, `id_paciente`, `id_patologia`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 1),
	(4, 4, 2),
	(5, 5, 2),
	(6, 6, 1),
	(7, 7, 3),
	(8, 8, 3),
	(9, 9, 2),
	(10, 10, 4),
	(11, 11, 2),
	(12, 12, 1),
	(13, 13, 3),
	(14, 14, 3),
	(15, 15, 4),
	(16, 16, 5),
	(17, 17, 5),
	(18, 18, 5),
	(19, 19, 6),
	(20, 20, 7),
	(21, 21, 1),
	(22, 22, 2),
	(23, 23, 3),
	(24, 24, 4),
	(25, 25, 8),
	(26, 25, 7),
	(27, 26, 6),
	(28, 27, 5),
	(29, 28, 4),
	(30, 29, 4),
	(31, 30, 4),
	(32, 31, 6),
	(33, 32, 6),
	(34, 33, 7),
	(35, 50, 8),
	(36, 51, 1),
	(37, 53, 2),
	(38, 55, 3),
	(39, 100, 4),
	(40, 99, 5),
	(41, 98, 6),
	(42, 97, 7),
	(43, 97, 8),
	(44, 56, 3),
	(45, 76, 4),
	(46, 80, 5),
	(47, 98, 6),
	(48, 40, 6),
	(49, 41, 3),
	(50, 42, 4),
	(51, 42, 5),
	(52, 44, 6),
	(53, 44, 3),
	(54, 45, 1),
	(55, 61, 2),
	(56, 62, 3),
	(57, 62, 6),
	(58, 65, 8),
	(59, 66, 8),
	(60, 67, 8),
	(61, 68, 8),
	(62, 69, 4),
	(63, 70, 5),
	(64, 70, 6),
	(65, 71, 7),
	(66, 71, 8),
	(67, 71, 2),
	(68, 72, 1),
	(69, 72, 1),
	(70, 72, 2),
	(71, 75, 3),
	(72, 100, 2),
	(73, 100, 5),
	(74, 100, 8);
/*!40000 ALTER TABLE `paciente_patologia` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_emergencia.patologias
CREATE TABLE IF NOT EXISTS `patologias` (
  `id_patologia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `estado` enum('A','I') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_patologia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sistema_emergencia.patologias: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `patologias` DISABLE KEYS */;
INSERT INTO `patologias` (`id_patologia`, `nombre`, `estado`) VALUES
	(1, 'Ébola', 'A'),
	(2, 'Covid-19', 'A'),
	(3, 'Dengue', 'A'),
	(4, 'Gripe', 'A'),
	(5, 'Varicela', 'A'),
	(6, 'Saranpión', 'A'),
	(7, 'Cáncer', 'A'),
	(8, 'Hepatitis', 'A');
/*!40000 ALTER TABLE `patologias` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

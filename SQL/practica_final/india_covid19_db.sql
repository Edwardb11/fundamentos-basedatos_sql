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


-- Volcando estructura de base de datos para india_covid19
CREATE DATABASE IF NOT EXISTS `india_covid19` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `india_covid19`;

-- Volcando estructura para tabla india_covid19.covid19
CREATE TABLE IF NOT EXISTS `covid19` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `casos_totales` int(11) NOT NULL,
  `casos_activos` int(11) NOT NULL,
  `casos_de_alta` int(11) NOT NULL COMMENT 'Corresponde a las personas que han superado el Covid-19 en La India.',
  `fallecimientos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla india_covid19.covid19: ~36 rows (aproximadamente)
/*!40000 ALTER TABLE `covid19` DISABLE KEYS */;
INSERT INTO `covid19` (`id`, `estado`, `casos_totales`, `casos_activos`, `casos_de_alta`, `fallecimientos`) VALUES
	(1, 'Maharashtra', 6214190, 106809, 5980350, 127031),
	(2, 'Kerala', 3160937, 125535, 3020052, 15350),
	(3, 'Karnataka', 2883947, 29314, 2818476, 36157),
	(4, 'Tamil Nadu', 2535402, 27897, 2473781, 33724),
	(5, 'Andhra Pradesh', 1940096, 24708, 1902256, 13132),
	(6, 'Uttar Pradesh', 1707847, 1262, 1683866, 22719),
	(7, 'West Bengal', 1518181, 13111, 1487071, 17999),
	(8, 'Delhi', 1435529, 592, 1409910, 25027),
	(9, 'Chhattisgarh', 999853, 3719, 982638, 13496),
	(10, 'Odisha', 954326, 18850, 930418, 5058),
	(11, 'Rajasthan', 953360, 472, 943938, 8950),
	(12, 'Gujarat', 824497, 493, 813928, 10076),
	(13, 'Madhya Pradesh', 791658, 219, 780927, 10512),
	(14, 'Haryana', 769539, 817, 759123, 9599),
	(15, 'Bihar', 723945, 725, 713591, 9629),
	(16, 'Telengana', 636627, 9824, 623044, 3759),
	(17, 'Punjab', 598334, 1046, 581055, 16233),
	(18, 'Assam', 547283, 17815, 524469, 4999),
	(19, 'Jharkhand', 346681, 327, 341234, 5120),
	(20, 'Uttarakhand', 341452, 623, 333473, 7356),
	(21, 'Jammu and Kashmir', 319901, 1919, 313618, 4364),
	(22, 'Himachal Pradesh', 204391, 1007, 199877, 3507),
	(23, 'Goa', 169740, 1562, 165067, 3111),
	(24, 'Puducherry', 119703, 1124, 116801, 1778),
	(25, 'Manipur', 84822, 9676, 73770, 1376),
	(26, 'Tripura', 73901, 4314, 68859, 728),
	(27, 'Chandigarh', 61889, 50, 61030, 809),
	(28, 'Meghalaya', 57388, 3979, 52464, 945),
	(29, 'Arunachal Pradesh', 42820, 4211, 38407, 202),
	(30, 'Mizoram', 27488, 6003, 21363, 122),
	(31, 'Nagaland', 26682, 1149, 25005, 528),
	(32, 'Sikkim', 23392, 2308, 20760, 324),
	(33, 'Ladakh', 20257, 103, 19948, 206),
	(34, 'Dadra and Nagar Haveli and Daman and Diu', 10597, 18, 10575, 4),
	(35, 'Lakshadweep', 10064, 68, 9947, 49),
	(36, 'Andaman and Nicobar', 7510, 16, 7365, 129);
/*!40000 ALTER TABLE `covid19` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-08-2021 a las 18:23:58
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aerolinea_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion`
--

CREATE TABLE `avion` (
  `matricula` varchar(30) NOT NULL,
  `fabricante` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `capacidad` int(255) NOT NULL,
  `horas_de_vuelo_recorridas` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `avion`
--

INSERT INTO `avion` (`matricula`, `fabricante`, `modelo`, `capacidad`, `horas_de_vuelo_recorridas`) VALUES
('A220', 'Airbus', 'JetBlue', 200, 20),
('AIRBUS-A321', 'Airbus', 'JetBlue', 200, 0),
('AIRBUS-A380', 'Airbus', 'JetBlue', 853, 50),
('CON029', 'Boeing 767-300ER', 'Condor', 200, 100),
('MD-80', 'McDonnell', 'Douglas', 200, 50),
('N265AK', 'Boeing ', '737 NG / Max MSN 62682', 100, 40),
('NT78JJ', 'Boeing', 'boeing 747 ', 400, 20),
('RY0091', 'RYANAIR', 'RYANAIR-091999', 200, 10),
('RY1192', 'RYANAIR', 'RYANAIR-119200913', 200, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `tipo`) VALUES
(1, 'Piloto'),
(2, 'Oficial'),
(3, 'Azafata'),
(4, 'Copiloto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasaje`
--

CREATE TABLE `pasaje` (
  `id_vuelo` int(11) NOT NULL,
  `id_pasajero` int(11) NOT NULL,
  `asiento` varchar(20) NOT NULL COMMENT 'P => Primera Clase | S => Segunda Clase | T => Tercera Clase',
  `clase` varchar(100) NOT NULL COMMENT 'Primera Clase | Segunda Clase | Tercera Clase ',
  `precio` int(255) NOT NULL COMMENT 'USD $'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pasaje`
--

INSERT INTO `pasaje` (`id_vuelo`, `id_pasajero`, `asiento`, `clase`, `precio`) VALUES
(1, 1, 'P10', 'Primera Clase', 400),
(1, 2, 'S11', 'Segunda Clase', 300),
(1, 3, 'P03', 'Primera Clase', 400),
(1, 4, 'T40', 'Tercera Clase', 200),
(1, 5, 'T30', 'Tercera Clase', 200),
(2, 6, 'P01', 'Primera Clase', 500),
(2, 7, 'P02', 'Primera Clase', 500),
(2, 8, 'T40', 'Tercera Clase', 300),
(2, 9, 'S10', 'Segunda Clase', 400),
(2, 10, 'S11', 'Segunda Clase', 400),
(2, 11, 'P05', 'Primera Clase', 500),
(3, 14, 'P07', 'Primera Clase', 500),
(7, 14, 'T44', 'Tercera Clase', 300),
(3, 15, 'P10', 'Primera Clase', 400),
(3, 16, 'P11', 'Primera Clase ', 500),
(3, 17, 'S32', 'Segunda Clase', 300),
(3, 18, 'T54', 'Tercera Clase', 200),
(4, 7, 'S31', 'Segunda Clase', 300),
(4, 8, 'P11', 'Primera Clase ', 500),
(4, 9, 'T55', 'Tercera Clase', 200),
(4, 10, 'P1', 'Primera Clase', 500),
(4, 11, 'S29', 'Segunda Clase ', 300),
(5, 19, 'P3', 'Primera Clase', 500),
(5, 20, 'T66', 'Tercera Clase', 200),
(5, 21, 'S23', 'Segunda Clase', 300),
(5, 22, 'P8', 'Primera Clase', 400),
(5, 23, 'P12', 'Primera Clase', 500),
(6, 26, 'T70', 'Tercera Clase', 200),
(6, 27, 'P3', 'Primera Clase', 500),
(6, 28, 'S35', 'Segunda Clase', 300),
(6, 29, 'P5', 'Primera Clase', 500),
(6, 30, 'T46', 'Tercera Clase', 200),
(7, 6, 'S32', 'Segunda Clase', 300),
(7, 13, 'P2', 'Primera Clase', 500),
(8, 7, 'S30', 'Segunda Clase', 300),
(8, 1, 'T53', 'Tercera Clase', 200),
(8, 15, 'S31', 'Segunda Clase', 300),
(8, 6, 'T51', 'Tercera Clase', 200),
(9, 3, 'P11', 'Primera Clase', 500),
(9, 13, 'S01', 'Segunda Clase', 300),
(9, 24, 'P1', 'Primera Clase', 500),
(9, 18, 'P5', 'Primera Clase', 500),
(10, 1, 'P1', 'Primera Clase', 500),
(10, 2, 'P2', 'Primera Clase', 500),
(10, 5, 'T46', 'Tercera Clase', 200),
(10, 30, 'S27', 'Segunda Clase', 300),
(11, 14, 'P1', 'Primera Clase', 500),
(11, 23, 'P5', 'Primera Clase', 500),
(11, 16, 'P11', 'Primera Clase', 500),
(11, 26, 'T56', 'Tercera Clase', 200),
(11, 3, 'T50', 'Tercera Clase', 200),
(11, 9, 'T77', 'Tercera Clase', 200),
(12, 28, 'T46', 'Tercera Clase', 200),
(12, 10, 'P11', 'Primera Clase', 500),
(12, 29, 'T80', 'Tercera Clase', 200),
(12, 8, 'S33', 'Segunda Clase', 300),
(13, 15, 'P1', 'Primera Clase', 500),
(13, 16, 'S32', 'Segunda Clase', 300),
(13, 22, 'T46', 'Tercera Clase', 200),
(13, 2, 'P5', 'Primera Clase', 500),
(14, 5, 'P1', 'Primera Clase', 500),
(14, 3, 'T46', 'Tercera Clase', 200),
(14, 11, 'S38', 'Segunda Clase', 300),
(14, 6, 'T52', 'Tercera Clase', 200),
(15, 2, 'P1', 'Primera Clase', 500),
(15, 25, 'S32', 'Segunda Clase', 300),
(15, 17, 'T88', 'Tercera Clase', 200),
(15, 30, 'T46', 'Segunda Clase', 300),
(16, 23, 'T55', 'Tercera Clase', 200),
(16, 9, 'S36', 'Segunda Clase', 300),
(16, 22, 'P5', 'Primera Clase', 500),
(16, 13, 'T76', 'Tercera Clase', 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajero`
--

CREATE TABLE `pasajero` (
  `id_pasajero` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `cedula` varchar(80) NOT NULL,
  `direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pasajero`
--

INSERT INTO `pasajero` (`id_pasajero`, `nombre`, `apellido`, `cedula`, `direccion`) VALUES
(1, 'Edward', 'Brito Diaz', '30910-00918290-1', 'La Vega'),
(2, 'Yessica Maria', 'Villavizar Hernandez', '402-0091391-09', 'La Vega'),
(3, 'Deivi', 'Abreu', '402-001939-11', 'Cutupu, la vega'),
(4, 'Roberto', 'Diaz', '304-10394193-11', 'Mao'),
(5, 'Franklin', 'Brito', '402-03984929-1', 'Azua'),
(6, 'Maria', 'Abreu', '402-294829-12', 'Barahona'),
(7, 'Juana', 'Curiel', '402-0923849-11', 'Moca'),
(8, 'Wilvania', 'Basora', '402-19491094-11', 'Moca'),
(9, 'Liza', 'Veras', '402-1929834-1', 'Barahona'),
(10, 'Yera', 'Veras', '402-193930-11', 'La Vega'),
(11, 'Jordan', 'Lane', '491093-29304', 'La Vega'),
(12, 'Jose Ramon', 'Diaz', '409-193813-11', 'Moca'),
(13, 'Aulino', 'Ramon', '402-029430184-21', 'La Vega'),
(14, 'Yessica', 'Martinez', '402-018933918-01', 'La Vega'),
(15, 'Joel', 'Paulino', '402-2234455-6', 'Maimon'),
(16, 'Deborah', 'Mendez', '402-1342879-4', 'La Vega'),
(17, 'Jose ', 'Bueno', '402-4567871-9', 'Santiago'),
(18, 'Luis', 'Hernandez', '402-1246834-6', 'Santo Domingo'),
(19, 'Ysabel', 'Garcia', '402-1234563-2', 'Cotui'),
(20, 'Amelia', 'Ceballo', '402-1456789-3', 'Santiago'),
(21, 'Paola ', 'Rubiera', '402-3251234-7', 'Moca'),
(22, 'Denisse ', 'Nuñez ', '402-2367892-1', 'La Vega'),
(23, 'Brianna', 'Coste', '402-1133567-0', 'Puerto Plata'),
(24, 'Nixon', 'Gutierrez', '402-9876541-3', 'La Vega'),
(25, 'Teresa', 'Bueno', '402-5634211-3', 'La Vega'),
(26, 'Rionald', 'Paulino', '047-1234544-2', 'Moca'),
(27, 'Monserat', 'Paulino', '047-1234221-0', 'Santiago'),
(28, 'Dayanira', 'Peña', '047-5678451-5', 'La Vega'),
(29, 'Scarlet', 'Reynoso', '042-0987642-0', 'La Vega'),
(30, 'Ysabel', 'Fernández', '047-1323764-1', 'Puerto Plata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `cargo` int(11) NOT NULL COMMENT '1 => Piloto  | 2 => Oficial  |  3 => Azafata  | 4 => Copiloto  '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `nombre`, `apellido`, `cargo`) VALUES
(6, 'Jose Ramon', 'Betances', 1),
(7, 'Francina', 'Brito', 3),
(8, 'Christopther ', 'Castillo', 2),
(9, 'Wilvan', 'Paulino', 1),
(10, 'Jose Roberto', 'Diaz', 2),
(11, 'Angelica', 'Ramirez', 3),
(12, 'Ramon  Orlando', 'Brito', 4),
(13, 'Saul', 'Garcia', 4),
(14, 'Jose Miguel', 'Brito', 1),
(15, 'Luis', 'Cepeda', 2),
(16, 'Ramiro', 'Diaz', 4),
(17, 'Vera', 'Solis', 3),
(18, 'Fausto', 'Solis', 1),
(19, 'Pedro', 'Solis', 2),
(20, 'Juan', 'Solis', 4),
(21, 'Liza', 'Mora', 3),
(22, 'Isidro', 'Diaz', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tripulacion`
--

CREATE TABLE `tripulacion` (
  `id_personal` int(11) NOT NULL,
  `matricula` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tripulacion`
--

INSERT INTO `tripulacion` (`id_personal`, `matricula`) VALUES
(6, 'NT78JJ'),
(7, 'NT78JJ'),
(8, 'NT78JJ'),
(12, 'NT78JJ'),
(9, 'AIRBUS-A380'),
(10, 'AIRBUS-A380'),
(11, 'AIRBUS-A380'),
(13, 'AIRBUS-A380'),
(14, 'AIRBUS-A321'),
(15, 'AIRBUS-A321'),
(16, 'AIRBUS-A321'),
(17, 'AIRBUS-A321'),
(18, 'MD-80'),
(19, 'MD-80'),
(20, 'MD-80'),
(21, 'MD-80'),
(6, 'A220'),
(17, 'A220'),
(10, 'A220'),
(16, 'A220'),
(11, 'N265AK'),
(8, 'N265AK'),
(20, 'N265AK'),
(14, 'N265AK'),
(11, 'RY0091'),
(22, 'RY0091'),
(20, 'RY0091'),
(15, 'RY0091'),
(19, 'RY1192'),
(7, 'RY1192'),
(6, 'RY1192'),
(11, 'RY1192'),
(20, 'RY1192'),
(10, 'RY1192');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE `vuelo` (
  `id_vuelo` int(11) NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  `origen` varchar(125) NOT NULL,
  `destino` varchar(125) NOT NULL,
  `matricula` varchar(30) NOT NULL,
  `horas_de_vuelo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vuelo`
--

INSERT INTO `vuelo` (`id_vuelo`, `fecha_y_hora`, `origen`, `destino`, `matricula`, `horas_de_vuelo`) VALUES
(1, '2021-07-20 18:00:00', 'Aeropuerto Internacional del Cibao', 'Miami International Airport', 'NT78JJ', '4'),
(2, '2021-07-31 14:00:00', 'Aeropuerto Internacional de Las Américas José Francisco Peña Gomez', 'John F. Kennedy International Airport', 'AIRBUS-A380', '4'),
(3, '2021-07-24 11:00:00', 'Chicago Midway International Airport', 'Miami International Airport', 'A220', '4'),
(4, '2021-08-02 21:00:00', 'John F. Kennedy International Airport', 'Aeropuerto Internacional de Las Américas José Francisco Peña Gomez', 'AIRBUS-A380', '4'),
(5, '2021-08-12 11:15:43', 'Aeropuerto Internacional del Cibao', 'Valladolid Airport', 'MD-80', '6'),
(6, '2021-08-12 23:59:59', 'Valladolid Airport', 'Aeropuerto Internacional del Cibao', 'MD-80', '6'),
(7, '2021-08-03 20:21:00', 'Miami International Airport', 'Chicago Midway International Airport', 'A220', '4'),
(8, '2021-07-22 19:00:00', 'Miami International Airport', 'Aeropuerto Internacional del Cibao', 'NT78JJ', '4'),
(9, '2021-08-10 18:00:00', 'Aeropuerto Internacional del Cibao', 'John F. Kennedy International Airport', 'AIRBUS-A321', '5'),
(10, '2021-08-16 11:00:00', 'John F. Kennedy International Airport', 'Aeropuerto Internacional del Cibao', 'AIRBUS-A321', '5'),
(11, '2021-08-23 11:00:00', 'Valladolid Airport', 'Aeropuerto Internacional de Las Américas José Francisco Peña Gomez', 'N265AK', '8'),
(12, '2021-08-27 11:00:00', 'Aeropuerto Internacional de Las Américas José Francisco Peña Gomez', 'Valladolid Airport', 'N265AK', '8'),
(13, '2021-08-25 11:28:59', 'Miami International Airport', 'Valladolid Airport', 'RY0091', '7'),
(14, '2021-08-31 11:28:59', 'Valladolid Airport', 'Miami International Airport', 'RY0091', '7'),
(15, '2021-08-05 06:00:00', 'Chicago Midway International Airport', 'Aeropuerto internacional de Puerto Rico', 'RY1192', '10'),
(16, '2021-08-12 11:00:00', 'Aeropuerto internacional de Puerto Rico', 'Chicago Midway International Airport', 'RY1192', '10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD KEY `id_vuelo_fk` (`id_vuelo`),
  ADD KEY `id_pasajero_fk` (`id_pasajero`);

--
-- Indices de la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD PRIMARY KEY (`id_pasajero`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`),
  ADD KEY `cargo_fk` (`cargo`);

--
-- Indices de la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  ADD KEY `id_personal_fk` (`id_personal`),
  ADD KEY `matricula_fk` (`matricula`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`id_vuelo`),
  ADD KEY `matricula_fk_vuelo` (`matricula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pasajero`
--
ALTER TABLE `pasajero`
  MODIFY `id_pasajero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  MODIFY `id_vuelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD CONSTRAINT `id_pasajero_fk` FOREIGN KEY (`id_pasajero`) REFERENCES `pasajero` (`id_pasajero`),
  ADD CONSTRAINT `id_vuelo_fk` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelo` (`id_vuelo`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `cargo_fk` FOREIGN KEY (`cargo`) REFERENCES `cargo` (`id_cargo`);

--
-- Filtros para la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  ADD CONSTRAINT `id_personal_fk` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`),
  ADD CONSTRAINT `matricula_fk` FOREIGN KEY (`matricula`) REFERENCES `avion` (`matricula`);

--
-- Filtros para la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `matricula_fk_vuelo` FOREIGN KEY (`matricula`) REFERENCES `avion` (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

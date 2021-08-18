-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-07-2021 a las 18:23:09
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
-- Base de datos: `prisionero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimentos`
--

CREATE TABLE `alimentos` (
  `id_alimentos` int(11) NOT NULL,
  `tipo_alimento` varchar(255) NOT NULL,
  `fecha_vencimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alimentos`
--

INSERT INTO `alimentos` (`id_alimentos`, `tipo_alimento`, `fecha_vencimiento`) VALUES
(1, 'Comida dominicana(La bandera)', '2021-07-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chequeo_medico`
--

CREATE TABLE `chequeo_medico` (
  `id_chequeo` int(11) NOT NULL,
  `id_prisionero` int(255) NOT NULL,
  `chequeo_diarios` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `chequeo_medico`
--

INSERT INTO `chequeo_medico` (`id_chequeo`, `id_prisionero`, `chequeo_diarios`) VALUES
(1, 1, 'Salud excelente '),
(2, 2, 'Dolor de cabeza'),
(3, 3, 'Salud excelente'),
(4, 4, 'pequeñas cortadas'),
(5, 5, 'Excelente bien'),
(6, 6, 'Bien'),
(7, 7, 'Salud buena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chequeo_medico_pelea`
--

CREATE TABLE `chequeo_medico_pelea` (
  `id_chequeo_peleas` int(11) NOT NULL,
  `id_prisionero` int(255) NOT NULL,
  `id_peleas` int(255) NOT NULL,
  `lesiones_graves` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `chequeo_medico_pelea`
--

INSERT INTO `chequeo_medico_pelea` (`id_chequeo_peleas`, `id_prisionero`, `id_peleas`, `lesiones_graves`) VALUES
(1, 4, 1, NULL),
(2, 3, 2, NULL),
(3, 4, 3, NULL),
(5, 3, 4, 'Rotura de brazo'),
(6, 6, 5, 'Asfixiamiento (Muerte)'),
(7, 7, 6, 'Desnucado'),
(8, 4, 6, 'Fuertes golpes en la cabeza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condena_anteriores`
--

CREATE TABLE `condena_anteriores` (
  `id_condenas_anteriores` int(11) NOT NULL,
  `id_prisionero` int(255) NOT NULL,
  `id_exonerado` int(255) DEFAULT NULL,
  `crimenes_cometido` varchar(255) NOT NULL,
  `motivo_condena` varchar(255) NOT NULL,
  `tiempo_condena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `condena_anteriores`
--

INSERT INTO `condena_anteriores` (`id_condenas_anteriores`, `id_prisionero`, `id_exonerado`, `crimenes_cometido`, `motivo_condena`, `tiempo_condena`) VALUES
(1, 1, NULL, 'Intento de asesinato ', 'Intento de asesinato a su esposa', '2 años'),
(2, 2, 1, 'Atraco', 'Robo de billetera', '1 años'),
(3, 3, NULL, 'Intento de asesinato ', 'Intento de asesinato a su amigo', '2 años');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exonerado`
--

CREATE TABLE `exonerado` (
  `id_exonerado` int(11) NOT NULL,
  `id_prisionero` int(255) NOT NULL,
  `motivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `exonerado`
--

INSERT INTO `exonerado` (`id_exonerado`, `id_prisionero`, `motivo`) VALUES
(1, 2, 'Buena conducta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL,
  `id_prisionero` int(255) NOT NULL,
  `id_chequeo` int(255) NOT NULL,
  `id_chequeo_peleas` int(255) DEFAULT NULL,
  `id_condena_anteriores` int(255) DEFAULT NULL,
  `crimenes_cometido` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id_historial`, `id_prisionero`, `id_chequeo`, `id_chequeo_peleas`, `id_condena_anteriores`, `crimenes_cometido`) VALUES
(1, 1, 1, NULL, 1, 'Robo de motor'),
(2, 2, 2, NULL, 2, 'Atraco un banco'),
(3, 3, 3, 2, 3, 'Pelea callejera'),
(4, 4, 4, 1, NULL, 'Robo'),
(5, 5, 5, NULL, NULL, 'Pelea callejera'),
(6, 6, 6, 6, NULL, 'Violacion '),
(7, 7, 7, 7, NULL, 'Asesinato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias`
--

CREATE TABLE `incidencias` (
  `id_incidencias` int(11) NOT NULL,
  `id_prisionero` int(255) NOT NULL,
  `id_prisionero_heridos` int(255) DEFAULT NULL,
  `id_prisionero_muerto` int(11) DEFAULT NULL,
  `lugar_pelea` varchar(255) NOT NULL,
  `fecha_pelea` datetime NOT NULL,
  `arma_o_objetos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `incidencias`
--

INSERT INTO `incidencias` (`id_incidencias`, `id_prisionero`, `id_prisionero_heridos`, `id_prisionero_muerto`, `lugar_pelea`, `fecha_pelea`, `arma_o_objetos`) VALUES
(1, 1, 4, NULL, 'Comedor', '2021-07-14 12:23:36', 'Plato'),
(2, 2, 3, NULL, 'Comedor', '2021-07-21 12:24:10', 'Manos'),
(3, 3, 4, NULL, 'Comedor', '2020-10-14 12:24:39', 'Plato'),
(4, 4, 3, NULL, 'Habitación', '2021-07-28 12:25:06', 'Almohada'),
(5, 1, NULL, 6, 'Habitación ', '2021-07-14 09:15:48', 'Almohada'),
(6, 1, 4, 7, 'Pasillo', '2021-07-20 09:31:17', 'Plato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peleas`
--

CREATE TABLE `peleas` (
  `id_peleas` int(11) NOT NULL,
  `id_prisionero` int(255) NOT NULL,
  `id_incidencias` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peleas`
--

INSERT INTO `peleas` (`id_peleas`, `id_prisionero`, `id_incidencias`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 1, 5),
(6, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prisionero`
--

CREATE TABLE `prisionero` (
  `id_prisionero` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `apodos` varchar(255) NOT NULL,
  `localidades_vividas` varchar(255) NOT NULL,
  `niveles_estudio` varchar(255) NOT NULL,
  `donde_estudio` varchar(255) NOT NULL,
  `trabajos_anteriores` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prisionero`
--

INSERT INTO `prisionero` (`id_prisionero`, `nombre`, `apellido`, `fecha_nacimiento`, `sexo`, `apodos`, `localidades_vividas`, `niveles_estudio`, `donde_estudio`, `trabajos_anteriores`) VALUES
(1, 'Juan Alberto', 'Castillo', '2001-07-11', 'Masculino', 'El pope', 'La Vega', 'Secundario', 'CEMAS', 'Herreria'),
(2, 'Edward', 'Brito Diaz', '2001-07-11', 'Masculino', 'El paco', 'Cutupu', 'Universidad', 'UCATECI', 'Ninguno'),
(3, 'Franklin', 'Brito', '2000-07-12', 'Masculino', 'Popeye', 'Azua', 'Secondario', 'Azua higt school ', 'Plomero'),
(4, 'Francisco Alberto', 'Abreu', '2021-07-19', 'Masculino', 'el pachi', 'Azua', 'Universidad ', 'UAPA', 'Induveca'),
(5, 'Enmanuel ', 'Cruz', '2001-07-06', 'Masculino', 'Popi', 'La Vega', 'Secondario', 'Eugenio', 'LaVegaTech'),
(6, 'Harold', 'Cruz', '2000-07-12', 'Masculino', 'El capote', 'La Vega,San Francisco,Jose de la matas', 'Universidad', 'UCATECI', 'Construcción '),
(7, 'Robinson', 'Cruceza', '2000-07-06', 'Masculino', 'Frente', 'Cutupu', 'Secundario', 'CEMAS', 'Colmado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservar_visitas`
--

CREATE TABLE `reservar_visitas` (
  `id_persona_reservada` int(11) NOT NULL,
  `id_prisionero` int(255) NOT NULL,
  `id_verificar_visitas` int(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `locación` varchar(255) NOT NULL,
  `relacion_con_prisionero` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reservar_visitas`
--

INSERT INTO `reservar_visitas` (`id_persona_reservada`, `id_prisionero`, `id_verificar_visitas`, `nombre`, `apellido`, `sexo`, `locación`, `relacion_con_prisionero`) VALUES
(1, 1, 1, 'Rosa', 'Diaz', 'femenino', 'La Vega', 'Madre'),
(2, 5, 5, 'Frank', 'Diaz', 'Masculino', 'Azua', 'Amigo'),
(3, 2, 2, 'Laura', 'Mora', 'femenino', 'La Vega', 'Amiga'),
(4, 3, 3, 'Rosa', 'Iriz Brito', 'femenino', 'La Vega', 'Esposa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificar_visitas`
--

CREATE TABLE `verificar_visitas` (
  `id_verificar_visitas` int(11) NOT NULL,
  `id_prisionero` int(255) NOT NULL,
  `id_peleas` int(255) DEFAULT NULL,
  `motivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `verificar_visitas`
--

INSERT INTO `verificar_visitas` (`id_verificar_visitas`, `id_prisionero`, `id_peleas`, `motivo`) VALUES
(1, 1, 1, 'Ha peleado agresor'),
(2, 2, 2, 'Ha peleado agresor'),
(3, 3, 3, 'Ha peleado agresor  y sido víctima de otras peleas'),
(4, 4, 4, 'Ha peleado agresor y sido víctima de otras peleas'),
(5, 5, NULL, 'Puede recibir visita.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id_visitas` int(11) NOT NULL,
  `id_prisionero` int(255) NOT NULL,
  `id_verificar_visita` int(255) NOT NULL,
  `id_persona_reservada` int(255) NOT NULL,
  `id_alimentos` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`id_visitas`, `id_prisionero`, `id_verificar_visita`, `id_persona_reservada`, `id_alimentos`) VALUES
(1, 1, 1, 1, NULL),
(2, 5, 5, 2, 1),
(3, 2, 2, 3, NULL),
(4, 3, 3, 4, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimentos`
--
ALTER TABLE `alimentos`
  ADD PRIMARY KEY (`id_alimentos`);

--
-- Indices de la tabla `chequeo_medico`
--
ALTER TABLE `chequeo_medico`
  ADD PRIMARY KEY (`id_chequeo`),
  ADD KEY `chequeo_del_id_prisionero` (`id_prisionero`);

--
-- Indices de la tabla `chequeo_medico_pelea`
--
ALTER TABLE `chequeo_medico_pelea`
  ADD PRIMARY KEY (`id_chequeo_peleas`),
  ADD KEY `chequeo_de_id_prisionero_por_pelea` (`id_prisionero`),
  ADD KEY `ver_si_ha_peleado_el_id` (`id_peleas`);

--
-- Indices de la tabla `condena_anteriores`
--
ALTER TABLE `condena_anteriores`
  ADD PRIMARY KEY (`id_condenas_anteriores`),
  ADD KEY `id_prisionero_condena_anteriores` (`id_prisionero`),
  ADD KEY `id_exonerado_condena_anterior` (`id_exonerado`);

--
-- Indices de la tabla `exonerado`
--
ALTER TABLE `exonerado`
  ADD PRIMARY KEY (`id_exonerado`),
  ADD KEY `id_prisionero_exonerado` (`id_prisionero`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_prisionero` (`id_prisionero`),
  ADD KEY `id_condena_anteriores` (`id_condena_anteriores`),
  ADD KEY `chequeo_diario_id_prisionero` (`id_chequeo`),
  ADD KEY `id_chequeo_peleas_del_id_prisionero` (`id_chequeo_peleas`);

--
-- Indices de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD PRIMARY KEY (`id_incidencias`),
  ADD KEY `ver_todas_incidencias_del_id_prisionero` (`id_prisionero`),
  ADD KEY `id_prisionero_fallecidos_producto_peleas` (`id_prisionero_muerto`),
  ADD KEY `id_prisionero_heridos_producto_peleas` (`id_prisionero_heridos`);

--
-- Indices de la tabla `peleas`
--
ALTER TABLE `peleas`
  ADD PRIMARY KEY (`id_peleas`),
  ADD KEY `peleas_id_prisionero` (`id_prisionero`),
  ADD KEY `incidencias_involucrado` (`id_incidencias`);

--
-- Indices de la tabla `prisionero`
--
ALTER TABLE `prisionero`
  ADD PRIMARY KEY (`id_prisionero`);

--
-- Indices de la tabla `reservar_visitas`
--
ALTER TABLE `reservar_visitas`
  ADD PRIMARY KEY (`id_persona_reservada`),
  ADD KEY `id_prisionero_a_ver` (`id_prisionero`),
  ADD KEY `id_verificar_visitas_para_aceptar_o_No` (`id_verificar_visitas`);

--
-- Indices de la tabla `verificar_visitas`
--
ALTER TABLE `verificar_visitas`
  ADD PRIMARY KEY (`id_verificar_visitas`),
  ADD KEY `_prisionero-avisitar_id_prisionero` (`id_prisionero`),
  ADD KEY `ver_si_ha_peleado` (`id_peleas`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id_visitas`),
  ADD KEY `visitas_al_id_prisionero` (`id_prisionero`),
  ADD KEY `id_persona_reservada_para_visitar` (`id_persona_reservada`),
  ADD KEY `id_alimentos_que_lleva_visita` (`id_alimentos`),
  ADD KEY `id_verificar_visitas` (`id_verificar_visita`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alimentos`
--
ALTER TABLE `alimentos`
  MODIFY `id_alimentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `chequeo_medico`
--
ALTER TABLE `chequeo_medico`
  MODIFY `id_chequeo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `chequeo_medico_pelea`
--
ALTER TABLE `chequeo_medico_pelea`
  MODIFY `id_chequeo_peleas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `condena_anteriores`
--
ALTER TABLE `condena_anteriores`
  MODIFY `id_condenas_anteriores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `exonerado`
--
ALTER TABLE `exonerado`
  MODIFY `id_exonerado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  MODIFY `id_incidencias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `peleas`
--
ALTER TABLE `peleas`
  MODIFY `id_peleas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `prisionero`
--
ALTER TABLE `prisionero`
  MODIFY `id_prisionero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `reservar_visitas`
--
ALTER TABLE `reservar_visitas`
  MODIFY `id_persona_reservada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `verificar_visitas`
--
ALTER TABLE `verificar_visitas`
  MODIFY `id_verificar_visitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id_visitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chequeo_medico`
--
ALTER TABLE `chequeo_medico`
  ADD CONSTRAINT `chequeo_del_id_prisionero` FOREIGN KEY (`id_prisionero`) REFERENCES `prisionero` (`id_prisionero`);

--
-- Filtros para la tabla `chequeo_medico_pelea`
--
ALTER TABLE `chequeo_medico_pelea`
  ADD CONSTRAINT `chequeo_de_id_prisionero_por_pelea` FOREIGN KEY (`id_prisionero`) REFERENCES `prisionero` (`id_prisionero`),
  ADD CONSTRAINT `ver_si_ha_peleado_el_id` FOREIGN KEY (`id_peleas`) REFERENCES `peleas` (`id_peleas`);

--
-- Filtros para la tabla `condena_anteriores`
--
ALTER TABLE `condena_anteriores`
  ADD CONSTRAINT `id_exonerado_condena_anterior` FOREIGN KEY (`id_exonerado`) REFERENCES `exonerado` (`id_exonerado`),
  ADD CONSTRAINT `id_prisionero_condena_anteriores` FOREIGN KEY (`id_prisionero`) REFERENCES `prisionero` (`id_prisionero`);

--
-- Filtros para la tabla `exonerado`
--
ALTER TABLE `exonerado`
  ADD CONSTRAINT `id_prisionero_exonerado` FOREIGN KEY (`id_prisionero`) REFERENCES `prisionero` (`id_prisionero`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `chequeo_diario_id_prisionero` FOREIGN KEY (`id_chequeo`) REFERENCES `chequeo_medico` (`id_chequeo`),
  ADD CONSTRAINT `id_chequeo_peleas_del_id_prisionero` FOREIGN KEY (`id_chequeo_peleas`) REFERENCES `chequeo_medico_pelea` (`id_chequeo_peleas`),
  ADD CONSTRAINT `id_condena_anteriores` FOREIGN KEY (`id_condena_anteriores`) REFERENCES `condena_anteriores` (`id_condenas_anteriores`),
  ADD CONSTRAINT `id_prisionero` FOREIGN KEY (`id_prisionero`) REFERENCES `prisionero` (`id_prisionero`);

--
-- Filtros para la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD CONSTRAINT `id_prisionero_fallecidos_producto_peleas` FOREIGN KEY (`id_prisionero_muerto`) REFERENCES `prisionero` (`id_prisionero`),
  ADD CONSTRAINT `id_prisionero_heridos_producto_peleas` FOREIGN KEY (`id_prisionero_heridos`) REFERENCES `prisionero` (`id_prisionero`),
  ADD CONSTRAINT `ver_todas_incidencias_del_id_prisionero` FOREIGN KEY (`id_prisionero`) REFERENCES `prisionero` (`id_prisionero`);

--
-- Filtros para la tabla `peleas`
--
ALTER TABLE `peleas`
  ADD CONSTRAINT `incidencias_involucrado` FOREIGN KEY (`id_incidencias`) REFERENCES `incidencias` (`id_incidencias`),
  ADD CONSTRAINT `peleas_id_prisionero` FOREIGN KEY (`id_prisionero`) REFERENCES `prisionero` (`id_prisionero`);

--
-- Filtros para la tabla `reservar_visitas`
--
ALTER TABLE `reservar_visitas`
  ADD CONSTRAINT `id_prisionero_a_ver` FOREIGN KEY (`id_prisionero`) REFERENCES `prisionero` (`id_prisionero`),
  ADD CONSTRAINT `id_verificar_visitas_para_aceptar_o_No` FOREIGN KEY (`id_verificar_visitas`) REFERENCES `verificar_visitas` (`id_verificar_visitas`);

--
-- Filtros para la tabla `verificar_visitas`
--
ALTER TABLE `verificar_visitas`
  ADD CONSTRAINT `_prisionero-avisitar_id_prisionero` FOREIGN KEY (`id_prisionero`) REFERENCES `prisionero` (`id_prisionero`),
  ADD CONSTRAINT `ver_si_ha_peleado` FOREIGN KEY (`id_peleas`) REFERENCES `peleas` (`id_peleas`);

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `id_alimentos_que_lleva_visita` FOREIGN KEY (`id_alimentos`) REFERENCES `alimentos` (`id_alimentos`),
  ADD CONSTRAINT `id_persona_reservada_para_visitar` FOREIGN KEY (`id_persona_reservada`) REFERENCES `reservar_visitas` (`id_persona_reservada`),
  ADD CONSTRAINT `id_verificar_visitas` FOREIGN KEY (`id_verificar_visita`) REFERENCES `verificar_visitas` (`id_verificar_visitas`),
  ADD CONSTRAINT `visitas_al_id_prisionero` FOREIGN KEY (`id_prisionero`) REFERENCES `prisionero` (`id_prisionero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

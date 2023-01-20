-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-01-2023 a las 21:21:59
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `notas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` int NOT NULL,
  `nombres` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `nombres`) VALUES
(1, 'Abimael fernandez ventura'),
(2, 'Carlos cajas Matias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencias`
--

CREATE TABLE `competencias` (
  `id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `competencias`
--

INSERT INTO `competencias` (`id`, `nombre`) VALUES
(1, 'Competencia 1'),
(2, 'Competencia 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int NOT NULL,
  `valor` char(2) DEFAULT NULL,
  `alumno_id` int NOT NULL,
  `competencias_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `valor`, `alumno_id`, `competencias_id`) VALUES
(1, '15', 1, 1),
(2, '14', 1, 1),
(3, '20', 1, 1),
(4, '14', 1, 2),
(5, '16', 1, 2),
(6, '17', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promedio`
--

CREATE TABLE `promedio` (
  `id` int NOT NULL,
  `valor` char(2) DEFAULT NULL,
  `alumno_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `promedio`
--

INSERT INTO `promedio` (`id`, `valor`, `alumno_id`) VALUES
(1, '12', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subpromedio`
--

CREATE TABLE `subpromedio` (
  `id` int NOT NULL,
  `valor` char(2) DEFAULT NULL,
  `alumno_id` int NOT NULL,
  `competencias_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `subpromedio`
--

INSERT INTO `subpromedio` (`id`, `valor`, `alumno_id`, `competencias_id`) VALUES
(1, '12', 1, 1),
(2, '12', 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `competencias`
--
ALTER TABLE `competencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notas_alumno_idx` (`alumno_id`),
  ADD KEY `fk_notas_competencias1_idx` (`competencias_id`);

--
-- Indices de la tabla `promedio`
--
ALTER TABLE `promedio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_promedio_alumno1_idx` (`alumno_id`);

--
-- Indices de la tabla `subpromedio`
--
ALTER TABLE `subpromedio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_subpromedio_alumno1_idx` (`alumno_id`),
  ADD KEY `fk_subpromedio_competencias1_idx` (`competencias_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `competencias`
--
ALTER TABLE `competencias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `promedio`
--
ALTER TABLE `promedio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `subpromedio`
--
ALTER TABLE `subpromedio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_notas_alumno` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`),
  ADD CONSTRAINT `fk_notas_competencias1` FOREIGN KEY (`competencias_id`) REFERENCES `competencias` (`id`);

--
-- Filtros para la tabla `promedio`
--
ALTER TABLE `promedio`
  ADD CONSTRAINT `fk_promedio_alumno1` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`);

--
-- Filtros para la tabla `subpromedio`
--
ALTER TABLE `subpromedio`
  ADD CONSTRAINT `fk_subpromedio_alumno1` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`),
  ADD CONSTRAINT `fk_subpromedio_competencias1` FOREIGN KEY (`competencias_id`) REFERENCES `competencias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

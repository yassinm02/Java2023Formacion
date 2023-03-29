-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2023 a las 16:24:56
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Hola

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercicio3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `dpto_cod` int(5) NOT NULL,
  `nombre_dpto` varchar(30) NOT NULL,
  `dpto_padre` int(5) DEFAULT NULL,
  `presupuesto` int(11) NOT NULL,
  `pres_actual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`dpto_cod`, `nombre_dpto`, `dpto_padre`, `presupuesto`, `pres_actual`) VALUES
(10000, 'Recursos Humanos', NULL, 10000, NULL),
(10001, 'Ventas', NULL, 15000, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `dni` int(8) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `apellido1` varchar(15) DEFAULT NULL,
  `apellido2` varchar(15) DEFAULT NULL,
  `direcc1` varchar(40) DEFAULT NULL,
  `direcc2` varchar(20) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `provincia` varchar(20) DEFAULT NULL,
  `cod_postal` varchar(5) DEFAULT NULL,
  `sexo` enum('H','M') DEFAULT NULL,
  `fecha_nac` varchar(15) DEFAULT NULL,
  `valoracion` enum('10','9','8','7','6','5','4','3','2','1') NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`dni`, `nombre`, `apellido1`, `apellido2`, `direcc1`, `direcc2`, `ciudad`, `provincia`, `cod_postal`, `sexo`, `fecha_nac`, `valoracion`) VALUES
(86534, 'Angel', NULL, NULL, NULL, NULL, 'Malaga', NULL, NULL, NULL, NULL, '5'),
(222333, 'Lucia', 'Ortega', 'Plus', NULL, NULL, NULL, NULL, NULL, '', NULL, '6'),
(237584, 'Sofia', 'Lozano', NULL, NULL, NULL, 'Castellon', NULL, NULL, 'M', NULL, '6'),
(353453, 'Elena', 'Navarro', NULL, NULL, NULL, 'Castellon', NULL, NULL, 'M', NULL, '6'),
(5346242, 'Pedro', 'Lopez', NULL, NULL, NULL, 'Leon', NULL, NULL, 'H', NULL, '6'),
(11111111, 'Maria', 'Perez', NULL, NULL, NULL, NULL, NULL, NULL, 'M', '1996-03-07', '6'),
(12345678, 'Juan', 'Garcia', NULL, NULL, NULL, NULL, NULL, NULL, 'H', '1996-03-07', '6'),
(98765432, 'Pablo', 'Martin', NULL, NULL, NULL, NULL, NULL, NULL, 'H', NULL, '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudios`
--

CREATE TABLE `estudios` (
  `empleado_dni` int(8) NOT NULL,
  `universidad` int(5) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `grado` varchar(3) NOT NULL,
  `especialidad` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudios`
--

INSERT INTO `estudios` (`empleado_dni`, `universidad`, `año`, `grado`, `especialidad`) VALUES
(222333, 10003, NULL, '', NULL),
(11111111, 10003, 2020, '', 'Teleco'),
(12345678, 10000, 2002, '', 'Ingeniería Mecánica'),
(98765432, 10000, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_laboral`
--

CREATE TABLE `historial_laboral` (
  `empleado_dni` int(8) NOT NULL,
  `trabajo_cod` int(5) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `dpto_cod` int(5) DEFAULT NULL,
  `supervisor_dni` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_laboral`
--

INSERT INTO `historial_laboral` (`empleado_dni`, `trabajo_cod`, `fecha_inicio`, `fecha_fin`, `dpto_cod`, `supervisor_dni`) VALUES
(11111111, 10001, '2022-05-18', '2023-03-02', 10000, 12345678),
(12345678, 10000, '2022-11-10', NULL, 10000, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_salarial`
--

CREATE TABLE `historial_salarial` (
  `empleado_dni` int(8) NOT NULL,
  `salario` int(11) NOT NULL,
  `fecha_comienzo` date NOT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_salarial`
--

INSERT INTO `historial_salarial` (`empleado_dni`, `salario`, `fecha_comienzo`, `fecha_fin`) VALUES
(11111111, 25000, '2022-06-07', NULL),
(12345678, 22000, '2022-10-05', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_universitaria`
--

CREATE TABLE `informacion_universitaria` (
  `NombreAapellidos` varchar(42) DEFAULT NULL,
  `Universidad` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion_universitaria`
--

INSERT INTO `informacion_universitaria` (`NombreAapellidos`, `Universidad`) VALUES
('Lucia Ortega Plus', 10003),
('Sofia Lozano ', NULL),
('Elena Navarro ', NULL),
('Pedro Lopez ', NULL),
('Maria Perez ', 10003),
('Juan Garcia ', 10000),
('Pablo Martin ', 10000);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `nombre_empleados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `nombre_empleados` (
`Name_exp_1` varchar(42)
);

-- --------------------------------------------------------
-- Hola

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `trabajo_cod` int(5) NOT NULL,
  `nombre_trab` varchar(20) NOT NULL,
  `salario_min` int(2) NOT NULL,
  `salario_max` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trabajos`
--

INSERT INTO `trabajos` (`trabajo_cod`, `nombre_trab`, `salario_min`, `salario_max`) VALUES
(10000, 'Profesor', 22, 30),
(10001, 'Conserje', 20, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidades`
--

CREATE TABLE `universidades` (
  `univ_cod` int(5) NOT NULL,
  `nombre_univ` varchar(25) NOT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `municipio` varchar(2) DEFAULT NULL,
  `cod_postal` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `universidades`
--

INSERT INTO `universidades` (`univ_cod`, `nombre_univ`, `ciudad`, `municipio`, `cod_postal`) VALUES
(10001, 'UV', 'Valencia', 'VC', '46000');

-- --------------------------------------------------------

--
-- Estructura para la vista `nombre_empleados`
--
DROP TABLE IF EXISTS `nombre_empleados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nombre_empleados`  AS SELECT concat(`e`.`nombre`,' ',coalesce(`e`.`apellido1`,''),' ',coalesce(`e`.`apellido2`,'')) AS `Name_exp_1` FROM `empleados` AS `e` WHERE `e`.`ciudad` like 'Malaga''Malaga'  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`dpto_cod`),
  ADD UNIQUE KEY `nombre_dpto` (`nombre_dpto`),
  ADD KEY `dpto_padre` (`dpto_padre`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `estudios`
--
ALTER TABLE `estudios`
  ADD PRIMARY KEY (`empleado_dni`,`grado`);

--
-- Indices de la tabla `historial_laboral`
--
ALTER TABLE `historial_laboral`
  ADD PRIMARY KEY (`empleado_dni`,`trabajo_cod`,`fecha_inicio`),
  ADD KEY `trabajo_cod` (`trabajo_cod`),
  ADD KEY `dpto_cod` (`dpto_cod`),
  ADD KEY `supervisor_dni` (`supervisor_dni`);

--
-- Indices de la tabla `historial_salarial`
--
ALTER TABLE `historial_salarial`
  ADD PRIMARY KEY (`empleado_dni`,`fecha_comienzo`);

--
-- Indices de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD PRIMARY KEY (`trabajo_cod`),
  ADD UNIQUE KEY `nombre_trab` (`nombre_trab`);

--
-- Indices de la tabla `universidades`
--
ALTER TABLE `universidades`
  ADD PRIMARY KEY (`univ_cod`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`dpto_padre`) REFERENCES `departamentos` (`dpto_cod`);

--
-- Filtros para la tabla `estudios`
--
ALTER TABLE `estudios`
  ADD CONSTRAINT `estudios_ibfk_1` FOREIGN KEY (`empleado_dni`) REFERENCES `empleados` (`dni`);

--
-- Filtros para la tabla `historial_laboral`
--
ALTER TABLE `historial_laboral`
  ADD CONSTRAINT `historial_laboral_ibfk_1` FOREIGN KEY (`empleado_dni`) REFERENCES `empleados` (`dni`),
  ADD CONSTRAINT `historial_laboral_ibfk_2` FOREIGN KEY (`trabajo_cod`) REFERENCES `trabajos` (`trabajo_cod`),
  ADD CONSTRAINT `historial_laboral_ibfk_3` FOREIGN KEY (`dpto_cod`) REFERENCES `departamentos` (`dpto_cod`),
  ADD CONSTRAINT `historial_laboral_ibfk_4` FOREIGN KEY (`supervisor_dni`) REFERENCES `empleados` (`dni`);

--
-- Filtros para la tabla `historial_salarial`
--
ALTER TABLE `historial_salarial`
  ADD CONSTRAINT `historial_salarial_ibfk_1` FOREIGN KEY (`empleado_dni`) REFERENCES `empleados` (`dni`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

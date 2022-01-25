-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-01-2022 a las 18:47:37
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `repositorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicaciones`
--

CREATE TABLE `aplicaciones` (
  `ID_APLICACION` bigint(20) NOT NULL,
  `RESPONSABLE` bigint(20) DEFAULT NULL,
  `ID_PRUEBA` bigint(20) DEFAULT NULL,
  `APLICADOR` bigint(20) DEFAULT NULL,
  `FOLIO` varchar(9) DEFAULT NULL,
  `APLICADA` datetime DEFAULT NULL,
  `FIRMA` varchar(5) DEFAULT NULL,
  `VERSION` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aplicaciones`
--

INSERT INTO `aplicaciones` (`ID_APLICACION`, `RESPONSABLE`, `ID_PRUEBA`, `APLICADOR`, `FOLIO`, `APLICADA`, `FIRMA`, `VERSION`) VALUES
(1, 5, 1, 5, 'F1', '2021-10-20 09:21:35', 'ABC', '1.0'),
(2, 2, 3, 2, 'F3', '2021-11-06 09:21:35', 'YYY', '1.2'),
(3, 2, 1, 1, 'F2', '2021-10-21 09:21:35', 'ABC', '1'),
(5, 3, 1, 3, 'F2', '2021-10-22 09:21:35', 'ABC', '1'),
(7, 3, 3, 3, 'F2', '2021-10-22 09:21:35', 'ABC', '1'),
(8, 3, 5, 3, 'F2', '2021-10-22 09:21:35', 'ABC', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pruebas`
--

CREATE TABLE `pruebas` (
  `ID_PRUEBA` bigint(20) NOT NULL,
  `PRUEBA` varchar(50) DEFAULT NULL,
  `DESCRIPCION` varchar(99) DEFAULT NULL,
  `TIPODEPRUEBA` varchar(99) DEFAULT NULL,
  `MODULO` varchar(99) DEFAULT NULL,
  `ELABORA` bigint(20) DEFAULT NULL,
  `AUTORIZA` bigint(20) DEFAULT NULL,
  `AUROTIZADA` datetime DEFAULT NULL,
  `REQUISITOS` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pruebas`
--

INSERT INTO `pruebas` (`ID_PRUEBA`, `PRUEBA`, `DESCRIPCION`, `TIPODEPRUEBA`, `MODULO`, `ELABORA`, `AUTORIZA`, `AUROTIZADA`, `REQUISITOS`) VALUES
(1, 'UNITARIA PROGRAMADOR', 'VERIFICAR FUNCIONAMIENTO DE CRUD CLIENTES', 'UNITARIA', 'CLIENTES', 4, 1, '2021-10-19 15:58:00', 'EL PROGRAMADOR DEBE ENTREGAR EL CODIGO FUENTE AL TESTER'),
(3, 'UNITARIA D', 'VERIFICAR FUNCIONAMIENTO DE CRUD CLIENTES', 'UNITARIA', 'CLIENTES', 4, 1, '2021-10-19 03:58:00', 'EL PROGRAMADOR DEBE ENTREGAR EL CODIGO FUENTE AL TESTER'),
(5, 'UNITARIA DISENADOR', 'VERIFICAR FUNCIONAMIENTO DE CRUD CLIENTES', 'UNITARIA', 'CLIENTES', 4, 1, '2021-10-10 03:58:00', 'EL PROGRAMADOR DEBE ENTREGAR EL CODIGO FUENTE AL TESTER'),
(6, 'UNITARIA ANALISTA', 'VERIFICAR FUNCIONAMIENTO DE CRUD CLIENTES', 'UNITARIA', 'CLIENTES', 4, 1, '2021-10-10 03:58:00', 'EL PROGRAMADOR DEBE ENTREGAR EL CODIGO FUENTE AL TESTER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `ID_RESULTADO` bigint(20) NOT NULL,
  `RESULTADO` varchar(40) DEFAULT NULL,
  `ID_APLICACION` bigint(20) DEFAULT NULL,
  `DATO` varchar(80) DEFAULT NULL,
  `ESPERANDO` varchar(80) DEFAULT NULL,
  `ENTREGADA` datetime DEFAULT NULL,
  `RECIBIDO` bigint(20) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `resultados`
--

INSERT INTO `resultados` (`ID_RESULTADO`, `RESULTADO`, `ID_APLICACION`, `DATO`, `ESPERANDO`, `ENTREGADA`, `RECIBIDO`, `ESTADO`) VALUES
(1, 'Falta validar id clien', 1, 'SE ACEPTAN SOLO NUMEROS', 'NO PERMITE LETRAS NO SIGNOS', '2021-10-20 14:35:22', 4, 1),
(2, 'R2', 2, 'D2', 'E2', '2021-10-10 12:12:12', 4, 1),
(3, 'R3', 1, 'D3', 'E3', '2021-10-10 12:12:12', 4, 1),
(4, 'R4', 3, 'D4', 'E4', '2021-10-30 22:35:09', 4, 1),
(6, 'R5', 3, 'D5', 'E5', '2021-10-30 22:36:09', 4, 1),
(7, 'R6', 3, 'D6', 'E6', '2021-10-30 22:37:09', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIO` bigint(20) NOT NULL,
  `USUARIO` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CUENTA` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CLAVE` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ROL` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `USUARIO`, `CUENTA`, `CLAVE`, `ROL`) VALUES
(1, 'González Luis', 'COORDINADOR', '202cb962ac59075b964b07152d234b70', 'C'),
(2, 'Beltrán Javier', 'ANALISTA', '202cb962ac59075b964b07152d234b70', 'A'),
(3, 'Alvarez Ana', 'DISEÑADOR', '202cb962ac59075b964b07152d234b70', 'D'),
(4, 'Rodríguez José', 'PROGRAMADOR', '202cb962ac59075b964b07152d234b70', 'P'),
(5, 'Ibarra Josefína', 'TESTER', '202cb962ac59075b964b07152d234b70', 'T'),
(6, 'Ramírez Carlos', 'DOCUMENTADOR', '202cb962ac59075b964b07152d234b70', 'W'),
(8, 'Raso Andrés', 'DISEÑADOR', '202cb962ac59075b964b07152d234b70', 'D');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplicaciones`
--
ALTER TABLE `aplicaciones`
  ADD PRIMARY KEY (`ID_APLICACION`);

--
-- Indices de la tabla `pruebas`
--
ALTER TABLE `pruebas`
  ADD PRIMARY KEY (`ID_PRUEBA`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`ID_RESULTADO`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicaciones`
--
ALTER TABLE `aplicaciones`
  MODIFY `ID_APLICACION` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pruebas`
--
ALTER TABLE `pruebas`
  MODIFY `ID_PRUEBA` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `ID_RESULTADO` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIO` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-03-2025 a las 16:22:58
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tfg_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `balas`
--

DROP TABLE IF EXISTS `balas`;
CREATE TABLE IF NOT EXISTS `balas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `daño` int DEFAULT NULL,
  `penetracion` int DEFAULT NULL,
  `frag_percent` decimal(5,2) DEFAULT NULL,
  `retroceso` decimal(5,2) DEFAULT NULL,
  `precision_bala` decimal(5,2) DEFAULT NULL,
  `distanciaEf` varchar(20) DEFAULT NULL,
  `distanciaMax` varchar(20) DEFAULT NULL,
  `velocidad` varchar(20) DEFAULT NULL,
  `tier_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `balas`
--

INSERT INTO `balas` (`id`, `nombre`, `daño`, `penetracion`, `frag_percent`, `retroceso`, `precision_bala`, `distanciaEf`, `distanciaMax`, `velocidad`, `tier_id`) VALUES
(1, '5.25MM BUCKSHOT', 8, 1, 0.00, 0.00, 0.00, '108', '9', '330', 3),
(2, '8.5MM MAGNUM BUCKSHOT', 8, 2, 0.00, 115.00, -15.00, '80', '116', '385', 3),
(3, '6.5MM EXPRESS BUCKSHOT', 9, 3, 0.00, 0.00, 15.00, '71', 'NUNCA', '430', 3),
(4, '7MM BUCKSHOT', 8, 3, 0.00, 0.00, 0.00, '39', '3', '415', 3),
(5, 'PIRANHA', 10, 24, 0.00, 0.00, -5.00, '-', '-', '310', 6),
(6, 'FLECHETTE', 8, 31, 0.00, 0.00, -10.00, '>1KM', 'Never', '320', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `balas_clases`
--

DROP TABLE IF EXISTS `balas_clases`;
CREATE TABLE IF NOT EXISTS `balas_clases` (
  `bala_id` int NOT NULL,
  `clase_id` int NOT NULL,
  PRIMARY KEY (`bala_id`,`clase_id`),
  KEY `clase_id` (`clase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `balas_clases`
--

INSERT INTO `balas_clases` (`bala_id`, `clase_id`) VALUES
(1, 1),
(2, 2),
(3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

DROP TABLE IF EXISTS `clases`;
CREATE TABLE IF NOT EXISTS `clases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Clase1` varchar(50) DEFAULT NULL,
  `Clase2` varchar(50) DEFAULT NULL,
  `Clase3` varchar(50) DEFAULT NULL,
  `Clase4` varchar(50) DEFAULT NULL,
  `Clase5` varchar(50) DEFAULT NULL,
  `Clase6` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`id`, `Clase1`, `Clase2`, `Clase3`, `Clase4`, `Clase5`, `Clase6`) VALUES
(2, 'Escopeta', 'Blindada', 'Baja Velocidad', 'Militar', 'Común', 'Liviana'),
(3, 'Rifle', 'Alta Velocidad', 'Media Velocidad', 'Policial', 'Rara', 'Media'),
(4, 'Subfusil', 'Explosiva', 'Alta Velocidad', 'Personalizada', 'Épica', 'Pesada'),
(5, 'Pistola', 'Incendiaria', 'Supersónica', 'Civil', 'Legendaria', 'Antiblindaje'),
(6, 'Ametralladora', 'Hollow Point', 'Explosiva', 'Militar', 'Única', 'Especial'),
(7, 'Francotirador', 'Penetrante', 'Experimental', 'Táctica', 'Legendaria', 'Experimental');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eficacia_clases`
--

DROP TABLE IF EXISTS `eficacia_clases`;
CREATE TABLE IF NOT EXISTS `eficacia_clases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bala_id` int NOT NULL,
  `clase` int NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bala_id` (`bala_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `eficacia_clases`
--

INSERT INTO `eficacia_clases` (`id`, `bala_id`, `clase`, `valor`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 3),
(3, 1, 3, 3),
(4, 1, 4, 3),
(5, 1, 5, 3),
(6, 1, 6, 3),
(7, 2, 1, 3),
(8, 2, 2, 3),
(9, 2, 3, 3),
(10, 2, 4, 3),
(11, 2, 5, 3),
(12, 2, 6, 3),
(13, 3, 1, 3),
(14, 3, 2, 3),
(15, 3, 3, 3),
(16, 3, 4, 3),
(17, 3, 5, 3),
(18, 3, 6, 3),
(19, 4, 1, 3),
(20, 4, 2, 3),
(21, 4, 3, 3),
(22, 4, 4, 3),
(23, 4, 5, 3),
(24, 4, 6, 3),
(25, 5, 1, 6),
(26, 5, 2, 6),
(27, 5, 3, 6),
(28, 5, 4, 5),
(29, 5, 5, 4),
(30, 5, 6, 4),
(31, 6, 1, 6),
(32, 6, 2, 6),
(33, 6, 3, 6),
(34, 6, 4, 5),
(35, 6, 5, 5),
(36, 6, 6, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` enum('sin loguear','logueado','administrador') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre_rol`) VALUES
(1, 'sin loguear'),
(2, 'logueado'),
(3, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiers`
--

DROP TABLE IF EXISTS `tiers`;
CREATE TABLE IF NOT EXISTS `tiers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nivel` int NOT NULL,
  `efectividad` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tiers`
--

INSERT INTO `tiers` (`id`, `nivel`, `efectividad`, `descripcion`) VALUES
(12, 4, 'Eficaz', 'Buena penetración con probabilidad media-alta de éxito'),
(11, 3, 'Ligeramente eficaz', 'Daño moderado a armadura, mejora con impacto repetido'),
(10, 2, 'Solo Magdump', 'Tiene una probabilidad muy baja o nula al principio'),
(9, 1, 'Es posible pero...', 'No puede penetrar o comienza con una probabilidad muy baja'),
(8, 0, 'Inútil', 'No puede penetrar en una cantidad razonable de golpes'),
(13, 5, 'Muy eficaz', 'Alta probabilidad de penetración y daño significativo'),
(14, 6, 'Ignora armadura', 'Alto daño y penetración superior al 80% de las veces');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_rol` (`id_rol`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `correo`, `contraseña`, `id_rol`) VALUES
(1, 'Dalvila', 'Vilaquintanadaniel@gmail.com', '$2y$10$cdclwvd14WlNKfHdN9WDkOtj4kvBn.EluWh2.goOK.TK4yQySkcKK', 2),
(2, 'ivan', 'ivan@gmail.com', '$2y$10$4hZ.5ShBXgJdmveEYCrWXOZTU7pM7/7aUa7QVoUSM.efnJ7VVQuaC', 2),
(3, 'VLAD', 'VLADLACHUPA@GMAIL.COM', '$2y$10$vkz3VHYS2x5k5VMGobq4lObmawrwauHOWLXarWUU.sHlDRWV/mRoy', 2),
(11, 'manolo', 'manolo@gmail.com', '$2y$10$v7ZbiPu1iKELAjBrUm.OkuoFY5QYT294q.2tTC2YpchiQVgSDIvl2', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

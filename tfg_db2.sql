-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 20-05-2025 a las 20:52:57
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tfg_db2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auriculares`
--

DROP TABLE IF EXISTS `auriculares`;
CREATE TABLE IF NOT EXISTS `auriculares` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auriculares`
--

INSERT INTO `auriculares` (`id`, `nombre`, `descripcion`, `imagen`) VALUES
(1, 'ComTac IV', 'Auriculares tácticos con reducción activa de ruido y comunicación integrada.', '../IMAGENES/Auris/ComTac4.webp'),
(2, 'Earmor M32', 'Auriculares con cancelación activa de ruido y conexión para radio.', '../IMAGENES/Auris/Earmorm32image.webp'),
(3, 'GSSH-01', 'Auriculares militares básicos con protección auditiva activa.', '../IMAGENES/Auris/GSSH01.webp'),
(4, 'Sordin Supreme Pro', 'Protección auditiva de alta gama con sonido ambiental mejorado.', '../IMAGENES/Auris/SordinImage.webp'),
(5, 'Peltor Tactical Sport', 'Auriculares con gran claridad de sonido y protección auditiva.', '../IMAGENES/Auris/PeltorTacticalSport.webp'),
(6, 'Peltor ComTac II', 'Versión avanzada con mejor aislamiento y comunicación.', '../IMAGENES/Auris/Peltor_ComTac_2_headset.webp'),
(7, 'Walker XCEL 500BT', 'Auriculares con conectividad Bluetooth y controles digitales.', '../IMAGENES/Auris/excel.jpg'),
(8, 'Walker Razor Digital', 'Modelo delgado con amplificación de sonido ambiente.', '../IMAGENES/Auris/WalkerRazorDigital.webp'),
(9, 'RAC Headset', 'Auriculares RAC de uso militar profesional.', '../IMAGENES/Auris/Racheadsetimage.webp'),
(10, 'XCEL 500BT (versión alternativa)', 'Otra variante del Walker XCEL con diseño similar.', '../IMAGENES/Auris/excel.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municiones`
--

DROP TABLE IF EXISTS `municiones`;
CREATE TABLE IF NOT EXISTS `municiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `danio` int DEFAULT NULL,
  `penetracion` int DEFAULT NULL,
  `frag` varchar(10) DEFAULT NULL,
  `retroceso` varchar(10) DEFAULT NULL,
  `precision` varchar(10) DEFAULT NULL,
  `distancia_efectiva` varchar(20) DEFAULT NULL,
  `distancia_max` varchar(20) DEFAULT NULL,
  `velocidad` int DEFAULT NULL,
  `tier` varchar(10) DEFAULT NULL,
  `tipo_municion` varchar(50) DEFAULT 'general',
  `clase1` tinyint DEFAULT NULL,
  `clase2` tinyint DEFAULT NULL,
  `clase3` tinyint DEFAULT NULL,
  `clase4` tinyint DEFAULT NULL,
  `clase5` tinyint DEFAULT NULL,
  `clase6` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `municiones`
--

INSERT INTO `municiones` (`id`, `nombre`, `danio`, `penetracion`, `frag`, `retroceso`, `precision`, `distancia_efectiva`, `distancia_max`, `velocidad`, `tier`, `tipo_municion`, `clase1`, `clase2`, `clase3`, `clase4`, `clase5`, `clase6`) VALUES
(1, '5.25MM BUCKSHOT', NULL, 1, '0%', NULL, NULL, '108', '9', 330, NULL, '12 Gauge Shot', 3, 3, 3, 3, 3, 3),
(2, '8.5MM MAGNUM BUCKSHOT', NULL, 2, '0%', '115 ▲', '-15% ▼', '80', '116', 385, NULL, '12 Gauge Shot', 3, 3, 3, 3, 3, 3),
(3, '6.5MM EXPRESS BUCKSHOT', NULL, 3, '0%', NULL, '15% ▲', '71', 'NUNCA', 430, NULL, '12 Gauge Shot', 3, 3, 3, 3, 3, 3),
(4, '7MM BUCKSHOT', NULL, 3, '0%', NULL, NULL, '39', '3', 415, NULL, '12 Gauge Shot', 3, 3, 3, 3, 3, 3),
(5, 'PIRANHA', NULL, 24, '0%', '-5%', NULL, '-', '-', 310, NULL, '12 Gauge Shot', 6, 6, 5, 4, 4, 4),
(6, 'FLECHETTE', NULL, 31, '0%', '-10% ▼', NULL, '>1KM', 'Never', 320, NULL, '12 Gauge Shot', 6, 6, 6, 5, 5, 5),
(7, 'RIP', 265, 2, '100%', '35 ▲', '80% ▲', '188', '>1KM', 410, NULL, '12 Gauge Slugs', 0, 0, 0, 0, 0, 0),
(8, 'SUPERFORMANCE HP SLUG', 220, 5, '39%', '-15 ▼', '170% ▲', '344', '>1KM', 390, NULL, '12 Gauge Slugs', 0, 0, 0, 0, 0, 0),
(9, 'GRIZZLY 40 SLUG', 190, 12, '12%', '20 ▲', '80% ▲', '840', '>1KM', 390, NULL, '12 Gauge Slugs', 6, 2, 0, 0, 0, 0),
(10, 'COPPER SABOT HP SLUG', 206, 14, '38%', '12 ▲', '150% ▲', '305', '>1KM', 442, NULL, '12 Gauge Slugs', 6, 3, 1, 0, 0, 0),
(11, 'LEAD SLUG', 167, 15, '20%', '10 ▲', '120% ▲', '487', '>1KM', 370, NULL, '12 Gauge Slugs', 6, 4, 2, 0, 0, 0),
(12, 'DUAL SABOT SLUG', 2, 17, '10%', '15 ▲', '110% ▲', '251', '>1KM', 415, NULL, '12 Gauge Slugs', 6, 5, 3, 0, 0, 0),
(13, 'POLEVA-3\" SLUG', 140, 17, '10%', '-15 ▼', '115% ▲', '516', '>1KM', 390, NULL, '12 Gauge Slugs', 6, 5, 3, 0, 0, 0),
(14, 'FTX CUSTOM LITE SLUG', 183, 18, '20%', '-25 ▼', '135% ▲', '181', '>1KM', 390, NULL, '12 Gauge Slugs', 6, 5, 3, 0, 0, 0),
(15, 'POLEVA-6U\" SLUG', 140, 20, '10%', '-10 ▼', '115% ▲', '480', '>1KM', 430, NULL, '12 Gauge Slugs', 6, 6, 4, 0, 0, 0),
(16, 'MAKESHIFT .50 BMG SLUG', 197, 26, '9%', '3 ▲', NULL, '>1KM', '>1KM', 410, NULL, '12 Gauge Slugs', 6, 6, 5, 2, 0, 0),
(17, 'AP-20 ARMOR-PIERCING SLUG', 164, 37, '3%', '50 ▲', '80% ▲', '905', '>1KM', 510, NULL, '12 Gauge Slugs', 6, 6, 6, 5, 4, 3),
(18, '5.6MM BUCKSHOT', 8, 1, '0%', '-10 ▲', '-10% ▼', '124', 'Never', 340, NULL, '20 GAUGE', 3, 3, 3, 3, 3, 3),
(19, '6.2MM BUCKSHOT', 8, 2, '0%', '10 ▲', '-10% ▼', '124', 'NEVER', 410, NULL, '20 GAUGE', 3, 3, 3, 3, 3, 3),
(20, '6.5MM EXPRESS BUCKSHOT', 9, 3, '0%', NULL, '15% ▲', '71', 'NUNCA', 430, NULL, '20 GAUGE', 3, 3, 3, 3, 3, 3),
(21, '7.5MM BUCKSHOT', 8, 3, '0%', NULL, NULL, '100', 'NEVER', 475, NULL, '20 GAUGE', 3, 3, 3, 3, 3, 3),
(22, '7.3MM BUCKSHOT', 8, 3, '0%', NULL, NULL, '181', 'NEVER', 474, NULL, '20 GAUGE', 6, 6, 4, 4, 4, 4),
(23, 'DEVASTATOR SLUG', 198, 5, '100%', '30 ▲', '125% ▲', '109', '>1KM', 405, NULL, '20 GAUGE', 1, 0, 0, 0, 0, 0),
(24, 'POLEVA-3\" SLUG', 120, 14, '20%', '-15 ▼', '115% ▲', '517', '>1KM', 425, NULL, '20 GAUGE', 6, 2, 0, 0, 0, 0),
(25, 'STAR SLUG', 154, 16, '10%', '5 ▲', '135% ▲', '416', '>1KM', 410, NULL, '20 GAUGE', 6, 3, 1, 0, 0, 0),
(26, 'POLEVA-6U\" SLUG', 135, 17, '15%', '10 ▲', '110% ▲', '438', '>1KM', 445, NULL, '20 GAUGE', 6, 5, 3, 0, 0, 0),
(27, 'ZVEZDA FLASHBANG ROUND', 0, 0, '20%', NULL, NULL, NULL, NULL, NULL, NULL, '23x75mm', 0, 0, 0, 0, 0, 0),
(28, 'SHRAPNEL-25 BUCKSHOT', 8, 10, '0%', '10 ▲', NULL, '83', '>1KM', 375, NULL, '23x75mm', 6, 4, 3, 3, 3, 3),
(29, 'SHRAPNEL-10 BUCKSHOT', 8, 11, '0%', NULL, NULL, '106', '>1KM', 270, NULL, '23x75mm', 6, 4, 3, 3, 3, 3),
(30, 'BARRIKADA SLUG', 192, 39, '20%', '25 ▲', '-5% ▼', '974', '>1KM', 420, NULL, '23x75mm', 6, 6, 6, 4, 4, 4),
(31, 'P GZH', 50, 5, '10%', '8 ▲', NULL, '64', '>1KM', 317, NULL, '9x18mm', 3, 0, 0, 0, 0, 0),
(32, 'PSV', 61, 5, '45%', '-10 ▼', NULL, '73', '>1KM', 308, NULL, '9x18mm', 3, 0, 0, 0, 0, 0),
(33, 'RG028 GZH', 67, 5, '45%', NULL, NULL, '62', '>1KM', 308, NULL, '9x18mm', 3, 0, 0, 0, 0, 0),
(34, 'PSO GZH', 59, 6, '10%', '10 ▲', NULL, '69', '>1KM', 320, NULL, '9x18mm', 3, 1, 0, 0, 0, 0),
(35, 'PST GZH', 50, 8, '10%', '5 ▲', NULL, '60', '>1KM', 317, NULL, '9x18mm', 3, 2, 0, 0, 0, 0),
(36, 'BZHT GZH', 58, 10, '5%', '5 ▲', NULL, '59', '>1KM', 317, NULL, '9x18mm', 6, 3, 1, 0, 0, 0),
(37, 'PSTM GZH', 58, 13, '5%', '5 ▲', NULL, '51', '>1KM', 317, NULL, '9x18mm', 6, 5, 2, 0, 0, 0),
(38, 'PBM GZH', 40, 25, '10%', '15 ▲', NULL, '63', '>1KM', 317, NULL, '9x18mm', 6, 6, 4, 2, 0, 0),
(39, 'LRNPC', 66, 5, '45%', NULL, NULL, '60', '>1KM', 430, NULL, '7.62x25mm', 3, 0, 0, 0, 0, 0),
(40, 'LRN', 66, 6, '10%', NULL, NULL, '65', '>1KM', 430, NULL, '7.62x25mm', 3, 1, 0, 0, 0, 0),
(41, 'FMJ43', 65, 8, '10%', NULL, NULL, '63', '>1KM', 430, NULL, '7.62x25mm', 3, 2, 0, 0, 0, 0),
(42, 'AKBS', 58, 9, '10%', NULL, NULL, '60', '>1KM', 430, NULL, '7.62x25mm', 3, 2, 1, 0, 0, 0),
(43, 'PST GZH', 50, 10, '5%', NULL, NULL, '59', '>1KM', 430, NULL, '7.62x25mm', 6, 3, 1, 0, 0, 0),
(44, 'PT GZH', 50, 12, '10%', NULL, NULL, '55', '>1KM', 430, NULL, '7.62x25mm', 6, 4, 2, 0, 0, 0),
(45, 'PPE GZH', 50, 15, '5%', NULL, NULL, '58', '>1KM', 430, NULL, '7.62x25mm', 6, 6, 4, 1, 0, 0),
(46, 'PBP GZH', 42, 30, '5%', NULL, NULL, '60', '>1KM', 430, NULL, '7.62x25mm', 6, 6, 5, 3, 1, 0),
(47, 'QUAKEMAKER', 85, 8, '100%', '15 ▲', '5% ▲', '105', '>1KM', 366, NULL, '9x19mm', 3, 2, 0, 0, 0, 0),
(48, 'RIP', 102, 3, '100%', '20 ▲', '30% ▲', '124', '>1KM', 370, NULL, '9x19mm', 3, 0, 0, 0, 0, 0),
(49, 'LUGER CCI', 70, 10, '70%', '15 ▲', '10% ▲', '152', '>1KM', 370, NULL, '9x19mm', 3, 3, 1, 0, 0, 0),
(50, 'MHP', 70, 13, '100%', '20 ▲', '10% ▲', '150', '>1KM', 365, NULL, '9x19mm', 3, 4, 2, 0, 0, 0),
(51, 'GREEN TRACER', 59, 18, '5%', '10 ▲', '5% ▲', '130', '>1KM', 370, NULL, '9x19mm', 6, 5, 3, 0, 0, 0),
(52, 'PSO GZH', 54, 18, '5%', '5 ▲', NULL, '100', '>1KM', 370, NULL, '9x19mm', 6, 5, 3, 0, 0, 0),
(53, 'AP 6.3', 52, 30, '5%', '10 ▲', NULL, '130', '>1KM', 400, NULL, '9x19mm', 6, 6, 6, 2, 0, 0),
(54, 'PST GZH', 54, 20, '5%', NULL, NULL, '110', '>1KM', 375, NULL, '9x19mm', 6, 5, 4, 1, 0, 0),
(55, '7N31', 52, 39, '5%', '15 ▲', NULL, '140', '>1KM', 430, NULL, '9x19mm', 6, 6, 6, 4, 2, 0),
(56, 'JHP', 85, 3, '100%', '20 ▲', '25% ▲', '126', '>1KM', 320, NULL, '.45 ACP', 3, 0, 0, 0, 0, 0),
(57, 'HYDRA-SHOK', 74, 9, '75%', '15 ▲', '20% ▲', '146', '>1KM', 320, NULL, '.45 ACP', 3, 2, 1, 0, 0, 0),
(58, 'MATCH FMJ', 70, 12, '5%', '10 ▲', NULL, '130', '>1KM', 350, NULL, '.45 ACP', 6, 3, 2, 0, 0, 0),
(59, 'ACP', 70, 14, '5%', NULL, NULL, '110', '>1KM', 330, NULL, '.45 ACP', 6, 4, 2, 0, 0, 0),
(60, 'LASERMATCH FMJ', 68, 15, '5%', '5 ▲', NULL, '120', '>1KM', 330, NULL, '.45 ACP', 6, 5, 3, 0, 0, 0),
(61, 'RIP', 100, 6, '100%', '20 ▲', '30% ▲', '138', '>1KM', 320, NULL, '.45 ACP', 3, 1, 0, 0, 0, 0),
(62, 'AP', 62, 38, '5%', '10 ▲', NULL, '140', '>1KM', 355, NULL, '.45 ACP', 6, 6, 5, 3, 1, 0),
(63, 'PE GZH', 80, 15, '35%', '-5 ▼', NULL, '194', '452', 415, NULL, '9x21mm', 6, 2, 0, 0, 0, 0),
(64, 'P GZH', 65, 18, '30%', '-3 ▼', NULL, '453', '776', 413, NULL, '9x21mm', 6, 3, 0, 0, 0, 0),
(65, 'PS GZH', 65, 18, '30%', '-3 ▼', NULL, '453', '776', 413, NULL, '9x21mm', 6, 3, 0, 0, 0, 0),
(66, '7U4', 47, 27, '25%', NULL, NULL, NULL, NULL, 300, NULL, '9x21mm', 6, 6, 5, 3, 1, 0),
(67, 'BT GZH', 49, 32, '20%', '5 ▲', '-5% ▼', '292', '>1KM', 410, NULL, '9x21mm', 6, 6, 6, 4, 3, 1),
(68, '7N42', 45, 38, '10%', '10 ▲', '-3% ▼', NULL, NULL, 400, NULL, '9x21mm', 6, 6, 6, 6, 4, 3),
(69, 'Geksa', 110, 13, '17%', NULL, NULL, '412', '673', 545, NULL, '.366 TKM', 6, 5, 3, 0, 0, 0),
(70, 'FMJ', 98, 20, '10%', NULL, NULL, '607', '1KM', 730, NULL, '.366 TKM', 6, 6, 4, 1, 0, 0),
(71, 'EKO', 73, 28, '22%', NULL, NULL, '683', '1KM', 730, NULL, '.366 TKM', 6, 6, 5, 2, 0, 0),
(72, 'AP-M', 90, 42, '12%', NULL, NULL, '983', '>1KM', 730, NULL, '.366 TKM', 6, 6, 6, 5, 3, 1),
(73, 'SOFT POINT', 108, 12, '20%', '-29', '27%', NULL, NULL, 455, NULL, '.357 Magnum', 6, 1, 0, 0, 0, 0),
(74, 'HP', 99, 18, '60%', '15', '15%', NULL, NULL, 481, NULL, '.357 Magnum', 6, 3, 0, 0, 0, 0),
(75, 'JHP', 88, 24, '60%', '8', '15%', NULL, NULL, 425, NULL, '.357 Magnum', 6, 6, 2, 0, 0, 0),
(76, 'FMJ', 70, 35, '1%', '12', NULL, NULL, NULL, 385, NULL, '.357 Magnum', 6, 6, 6, 2, 1, 0),
(77, 'R37.F', 98, 8, '100%', NULL, NULL, '100', '>1KM', 729, NULL, '5.7x28mm', 4, 0, 0, 0, 0, 0),
(78, 'SS198LF', 70, 17, '80%', NULL, NULL, '326', '>1KM', 792, NULL, '5.7x28mm', 6, 4, 1, 0, 0, 0),
(79, 'R37.X', 81, 11, '70%', NULL, NULL, '100', '>1KM', 724, NULL, '5.7x28mm', 6, 1, 1, 0, 0, 0),
(80, 'SS197SR', 62, 25, '50%', NULL, NULL, '401', '>1KM', 594, NULL, '5.7x28mm', 6, 1, 4, 1, 0, 0),
(81, 'L191 (TRACER)', 53, 33, '20%', '-4%', NULL, '358', '>1KM', 922, NULL, '5.7x28mm', 6, 6, 6, 3, 2, 2),
(82, 'SB193', 59, 27, '20%', '-15', '5%', '>1KM', '>1KM', 299, NULL, '5.7x28mm', 6, 6, 5, 2, 1, 0),
(83, 'SS190', 49, 37, '20%', NULL, NULL, '325', '463', 715, NULL, '5.7x28mm', 6, 6, 6, 5, 4, 3),
(84, 'ACTION SX', 65, 18, '50%', NULL, NULL, '245', '>1KM', 690, NULL, '4.6x30mm', 6, 5, 1, 0, 0, 0),
(85, 'SUBSONIC SX', 52, 23, '20%', '-22 ▼', '10% ▲', '>1KM', '>1KM', 290, NULL, '4.6x30mm', 6, 6, 3, 0, 0, 0),
(86, 'JSP SX', 46, 32, '30%', NULL, NULL, NULL, NULL, 579, NULL, '4.6x30mm', 6, 6, 6, 4, 2, 1),
(87, 'FMJ SX', 43, 40, '20%', NULL, NULL, '367', '189', 620, NULL, '4.6x30mm', 6, 6, 6, 4, 3, 1),
(88, 'AP SX', 35, 53, '10%', '10 ▲', NULL, '198', 'Never', 680, NULL, '4.6x30mm', 6, 6, 6, 6, 6, 5),
(89, 'FMJ', 75, 17, '30%', '-5 ▼', '5% ▲', '>1KM', '>1KM', 330, NULL, '9x39mm', 6, 5, 2, 0, 0, 0),
(90, 'SP-5 GS', 71, 28, '20%', NULL, NULL, '>1KM', '>1KM', 290, NULL, '9x39mm', 6, 6, 5, 2, 1, 0),
(91, 'SPP GS', 68, 35, '20%', '7 ▲', '10% ▲', '887', '>1KM', 310, NULL, '9x39mm', 6, 6, 5, 3, 2, 2),
(92, 'PAB-9 GS', 62, 43, '10%', '10 ▲', '-15% ▼', '>1KM', '>1KM', 320, NULL, '9x39mm', 6, 6, 6, 5, 4, 4),
(93, 'SP-6 GS', 60, 48, '10%', '5 ▲', NULL, '>1KM', '>1KM', 305, NULL, '9x39mm', 6, 6, 6, 5, 5, 5),
(94, 'BP GS', 58, 54, '10%', '15 ▲', '10% ▲', '>1KM', '>1KM', 295, NULL, '9x39mm', 6, 6, 6, 6, 6, 5),
(95, 'TKM GEKSA', 110, 14, '45%', NULL, NULL, '484', '>1KM', 550, NULL, '.366 TKM', 6, 3, 0, 0, 0, 0),
(96, 'TKM FMJ', 98, 23, '25%', '10 ▲', NULL, '363', '>1KM', 580, NULL, '.366 TKM', 6, 6, 4, 1, 0, 0),
(97, 'TKM EKO', 73, 30, '20%', '-15 ▼', '-10% ▼', '184', '>1KM', 770, NULL, '.366 TKM', 6, 6, 3, 1, 0, 0),
(98, 'TKM AP-M', 90, 42, '1%', '35 ▲', '-28% ▼', '633', '>1KM', 602, NULL, '.366 TKM', 6, 6, 6, 6, 5, 4),
(99, 'HP', 76, 9, '35%', '-3 ▼', NULL, '368', '>1KM', 884, NULL, '5.45x39mm', 5, 0, 0, 0, 0, 0),
(100, 'PRS GS', 70, 13, '30%', '-5 ▼', NULL, '392', '>1KM', 866, NULL, '5.45x39mm', 6, 1, 0, 0, 0, 0),
(101, 'SP', 65, 15, '45%', '-5 ▼', '10% ▲', '364', '>1KM', 873, NULL, '5.45x39mm', 6, 2, 0, 0, 0, 0),
(102, 'US GS', 63, 17, '10%', '-15 ▼', NULL, '>1KM', '>1KM', 303, NULL, '5.45x39mm', 6, 5, 1, 0, 0, 0),
(103, 'T GS', 57, 20, '16%', '-5% ▼', NULL, '331', '>1KM', 883, NULL, '5.45x39mm', 6, 6, 2, 0, 0, 0),
(104, 'FMJ', 55, 24, '25%', NULL, NULL, '400', '>1KM', 883, NULL, '5.45x39mm', 6, 6, 3, 2, 0, 0),
(105, 'PS GS', 53, 28, '40%', NULL, NULL, '352', '466', 890, NULL, '5.45x39mm', 6, 6, 5, 3, 1, 0),
(106, 'PP GS', 50, 34, '17%', '3 ▲', NULL, '388', '>1KM', 890, NULL, '5.45x39mm', 6, 6, 6, 4, 1, 0),
(107, 'BT GS', 48, 37, '16%', '5 ▲', '-2% ▼', '310', '>1KM', 890, NULL, '5.45x39mm', 6, 6, 6, 5, 2, 0),
(108, '7N40', 42, 39, '10%', '-10 ▼', '50% ▲', '388', '>1KM', 915, NULL, '5.45x39mm', 6, 6, 6, 6, 3, 0),
(109, 'BP GS', 46, 45, '16%', '7 ▲', '-3% ▼', '378', '>1KM', 890, NULL, '5.45x39mm', 6, 6, 6, 6, 5, 4),
(110, 'BS GS', 43, 54, '17%', '10 ▲', '-3% ▼', '363', '179', 830, NULL, '5.45x39mm', 6, 6, 6, 6, 6, 5),
(111, 'PPBS GS \"IGOLNIK\"', 37, 62, '2%', '15 ▲', NULL, '430', '85', 905, NULL, '5.45x39mm', 6, 6, 6, 6, 6, 6),
(112, 'WARMAGEDDON', 88, 3, '90%', '10 ▲', '10% ▲', '525', '>1KM', 936, NULL, '5.56x45mm', 6, 0, 0, 0, 0, 0),
(113, 'HP', 79, 7, '70%', NULL, NULL, '327', '>1KM', 947, NULL, '5.56x45mm', 4, 0, 0, 0, 0, 0),
(114, 'MK 255 MOD 0 (RRLP)', 72, 11, '3%', NULL, NULL, '525', '>1KM', 936, NULL, '5.56x45mm', 6, 1, 0, 0, 0, 0),
(115, 'M856', 64, 18, '33%', '-2 ▼', '-2% ▼', '358', '975', 874, NULL, '5.56x45mm', 6, 5, 1, 0, 0, 0),
(116, 'M855', 57, 31, '40%', NULL, NULL, '358', '464', 922, NULL, '5.56x45mm', 6, 6, 5, 3, 2, 0),
(117, 'MK 318 MOD 0 (SOST)', 55, 33, '35%', '3 ▲', '2% ▲', '409', '>1KM', 902, NULL, '5.56x45mm', 6, 6, 6, 4, 2, 1),
(118, 'M856A1', 52, 38, '42%', '4 ▲', '-4% ▼', '424', '594', 940, NULL, '5.56x45mm', 6, 6, 6, 6, 3, 2),
(119, 'M855A1', 49, 44, '44%', '6 ▲', '-5% ▼', '366', '352', 945, NULL, '5.56x45mm', 6, 6, 6, 6, 5, 4),
(120, 'M995', 53, 42, '42%', '8 ▲', '-7% ▼', '325', '149', 1013, NULL, '5.56x45mm', 6, 6, 6, 6, 6, 5),
(121, 'SSA AP', 38, 57, '20%', '6 ▲', '-9% ▼', '325', '29', 1013, NULL, '5.56x45mm', 6, 6, 6, 6, 6, 5),
(122, 'HP', 87, 15, '40%', '5 ▲', '-5% ▼', '382', '>1KM', 754, NULL, '7.62x39mm', 6, 4, 1, 0, 0, 0),
(123, 'SP', 68, 20, '35%', '-5 ▼', NULL, '772', '>1KM', 772, NULL, '7.62x39mm', 6, 6, 2, 0, 0, 0),
(124, 'FMJ', 63, 26, '30%', '-2 ▼', NULL, '775', '>1KM', 775, NULL, '7.62x39mm', 6, 6, 4, 1, 0, 0),
(125, 'US GZH', 56, 29, '8%', '-30 ▼', '5% ▲', '>1KM', '>1KM', 300, NULL, '7.62x39mm', 6, 6, 5, 3, 1, 0),
(126, 'T-45M1 GZH', 64, 30, '12%', '-6 ▼', '-4% ▼', '314', '>1KM', 720, NULL, '7.62x39mm', 6, 6, 6, 3, 1, 0),
(127, 'PS GZH', 57, 35, '20%', NULL, NULL, '393', '>1KM', 700, NULL, '7.62x39mm', 6, 6, 6, 4, 2, 1),
(128, 'PP', 55, 41, '15%', '5 ▲', '-1% ▼', '387', '>1KM', 732, NULL, '7.62x39mm', 6, 6, 6, 5, 3, 2),
(129, 'BP GZH', 47, 47, '12%', '7 ▲', '-3% ▼', '387', '>1KM', 730, NULL, '7.62x39mm', 6, 6, 6, 6, 5, 3),
(130, 'MAI AP', 47, 58, '5%', '10 ▲', '-5% ▼', '387', '405', 730, NULL, '7.62x39mm', 6, 6, 6, 6, 6, 5),
(131, 'BLACKOUT WHISPER', 90, 14, '35%', '-5 ▼', '5% ▼', '490', '>1KM', 853, NULL, '.300 blk', 6, 4, 2, 1, 0, 0),
(132, 'BLACKOUT V-MAX', 72, 20, '25%', '-10 ▲', '30% ▲', '466', '>1KM', 723, NULL, '.300 blk', 6, 6, 4, 3, 1, 0),
(133, 'BLACKOUT BCP FMJ', 60, 30, '30%', NULL, NULL, '563', '>1KM', 605, NULL, '.300 blk', 6, 6, 3, 2, 2, 0),
(134, 'BLACKOUT M62 TRACER', 54, 36, '20%', '1 ▲', NULL, '>1KM', '>1KM', 442, NULL, '.300 blk', 6, 6, 5, 4, 4, 2),
(135, 'BLACKOUT CBJ', 58, 43, '15%', '5 ▲', NULL, NULL, '>1KM', 725, NULL, '.300 blk', 6, 6, 6, 4, 4, 3),
(136, 'BBLACKOUT AP', 51, 48, '30%', '3 ▲', NULL, '522', '>1KM', 635, NULL, '.300 blk', 6, 6, 6, 6, 5, 4),
(137, 'SIG FMJ', 80, 36, '18%', NULL, NULL, NULL, '>', 899, NULL, '6.8x51mm', 6, 6, 6, 5, 4, 2),
(138, 'SIG HYBRID', 72, 47, '12%', '10 ▲', '3% ▲', NULL, '>', 914, NULL, '6.8x51mm', 6, 6, 6, 6, 5, 5),
(139, 'ULTRA NOSLER', 107, 15, '70%', '-5 ▼', '10% ▲', '536', '>1KM', 822, NULL, '7.62x51mm', 6, 4, 0, 0, 0, 0),
(140, 'TCW SP', 87, 30, '35%', '-3 ▼', '-2% ▼', '543', '>1KM', 808, NULL, '7.62x51mm', 6, 6, 6, 3, 2, 0),
(141, 'BCP FMJ', 83, 35, '20%', '-7 ▼', NULL, '584', '>1KM', 840, NULL, '7.62x51mm', 6, 6, 6, 4, 3, 2),
(142, 'M80', 80, 41, '17%', NULL, NULL, '483', '>1KM', 833, NULL, '7.62x51mm', 6, 6, 6, 5, 5, 4),
(143, 'M62 TRACER', 79, 44, '14%', '-1 ▲', '-6% ▼', '462', '>1KM', 816, NULL, '7.62x51mm', 6, 6, 6, 6, 6, 5),
(144, 'M61', 70, 64, '13%', '10 ▲', '3% ▲', '506', '>1KM', 849, NULL, '7.62x51mm', 6, 6, 6, 6, 6, 6),
(145, 'M993', 67, 70, '13%', '8 ▲', '5% ▲', '445', '>1KM', 910, NULL, '7.62x51mm', 6, 6, 6, 6, 6, 6),
(146, 'HP BT (TRACER)', 102, 23, '40%', NULL, NULL, NULL, NULL, 807, NULL, '7.62x54R', 6, 6, 3, 1, 0, 0),
(147, 'SP BT (TRACER)', 92, 27, '24%', NULL, NULL, NULL, NULL, 703, NULL, '7.62x54R', 6, 6, 5, 4, 2, 1),
(148, 'FMJ', 84, 33, '20%', NULL, NULL, NULL, NULL, 760, NULL, '7.62x54R', 6, 6, 6, 5, 3, 2),
(149, 'T-46M GZH', 82, 41, '18%', '-5 ▼', '-1% ▼', '406', '>1KM', 800, NULL, '7.62x54R', 6, 6, 6, 6, 4, 3),
(150, 'LPS GZH', 81, 42, '18%', NULL, NULL, '492', '>1KM', 865, NULL, '7.62x54R', 6, 6, 6, 6, 5, 4),
(151, 'PS GZH', 84, 45, '8%', '8 ▲', '10% ▲', '510', '>1KM', 875, NULL, '7.62x54R', 6, 6, 6, 6, 5, 5),
(152, 'BT GZH', 78, 55, '8%', '-2% ▼', NULL, '491', '>1KM', 875, NULL, '7.62x54R', 6, 6, 6, 6, 6, 6),
(153, 'BT GZH', 78, 55, '8%', '-4 ▼', '-2% ▼', '491', '>1KM', 875, NULL, '7.62x54R', 6, 6, 6, 6, 6, 6),
(154, 'SNB GZH', 75, 62, '8%', '-10 ▲', '-2% ▼', '510', '>1KM', 875, NULL, '7.62x54R', 6, 6, 6, 6, 6, 6),
(155, 'BS GS', 72, 70, '8%', NULL, NULL, '597', '>1KM', 785, NULL, '7.62x54R', 6, 6, 6, 6, 6, 6),
(156, 'PS12A', 165, 10, '70%', '-12 ▼', '-15% ▼', '439', '>1KM', 290, NULL, '12.7x55mm', 6, 0, 0, 0, 0, 0),
(157, 'PS12', 115, 28, '30%', '10 ▲', NULL, NULL, '>1KM', 285, NULL, '12.7x55mm', 6, 6, 5, 2, 1, 0),
(158, 'PS12B', 102, 46, '30%', '15 ▲', NULL, '719', '>1KM', 300, NULL, '12.7x55mm', 6, 6, 6, 6, 5, 4),
(159, 'TAC-X', 196, 18, '50%', '5 ▲', '10% ▲', '716', '>1KM', 880, NULL, '.338 Lapua Magnum', 6, 5, 3, 1, 0, 0),
(160, 'UCW', 142, 32, '60%', '-5 ▼', NULL, '702', '>1KM', 849, NULL, '.338 Lapua Magnum', 6, 6, 5, 4, 2, 0),
(161, 'FMJ', 122, 47, '20%', NULL, NULL, '733', '>1KM', 900, NULL, '.338 Lapua Magnum', 6, 6, 6, 6, 5, 5),
(162, 'AP', 115, 79, '13%', '10 ▲', NULL, '696', '>1KM', 849, NULL, '.338 Lapua Magnum', 6, 6, 6, 6, 6, 6),
(163, '30MM GRENADE', 199, 1, '0%', NULL, NULL, NULL, '>', NULL, NULL, 'Mounted Weapons', 0, 0, 0, 0, 0, 0),
(164, '12.7X108MM', 182, 88, '17%', NULL, NULL, '891', '>1KM', NULL, NULL, 'Mounted Weapons', 6, 6, 6, 6, 6, 6),
(165, '12.7X108MM TRACER', 199, 80, '17%', NULL, NULL, '446', '>1KM', NULL, NULL, 'Mounted Weapons', 6, 6, 6, 6, 6, 6),
(166, '40MM BUCKSHOT GRENADE', 160, 5, '0%', NULL, NULL, '994', '>1KM', NULL, NULL, 'Mounted Weapons', 5, 3, 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tier_municion`
--

DROP TABLE IF EXISTS `tier_municion`;
CREATE TABLE IF NOT EXISTS `tier_municion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tier` int NOT NULL,
  `efectividad` varchar(100) DEFAULT NULL,
  `disparos_detencion` varchar(100) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tier_municion`
--

INSERT INTO `tier_municion` (`id`, `tier`, `efectividad`, `disparos_detencion`, `descripcion`) VALUES
(1, 0, 'Inútil', '20+ balas', 'No puede penetrar en una cantidad razonable de golpes'),
(2, 1, 'Es posible pero...', 'De 13 a 20 balas', 'No puede penetrar en una cantidad razonable de golpes, o comienza con una probabilidad muy baja y apenas aumenta'),
(3, 2, 'Solo Magdump', 'De 9 a 13 balas', 'Tiene una probabilidad muy baja o nula al principio y gana probabilidad muy lentamente'),
(4, 3, 'Ligeramente eficaz', 'De 5 a 9 balas', 'Tiene una probabilidad muy baja o nula al principio y gana probabilidad lentamente, o daña rápidamente la armadura hasta que penetra'),
(5, 4, 'Eficaz', 'De 3 a 5 balas', 'Comienza con una probabilidad de penetración baja-media, pero aumenta rápidamente'),
(6, 5, 'Muy eficaz', 'De 1 a 3 balas', 'Penetra un gran porcentaje de las veces inicialmente, a menudo llegando rápidamente al >90%'),
(7, 6, 'Básicamente ignora', 'De 1 a 2 balas', 'Penetra inicialmente el 80% de las veces');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `email`, `password_hash`, `fecha_registro`) VALUES
(9, 'manolo', 'manolo@gmail.com', '$2y$10$7Gc86SjkHERkEtN15LO9NuCteSfTJYC3a1OYFO4pHt1TvtAaGcUPC', '2025-05-04 15:54:19'),
(8, 'Saul', 'saul@gmail.com', '$2y$10$3qnk6pPlWT3GwtuvJJB.W.AuhzLyQeaABupxuyLH4rBVe4D7bdio.', '2025-05-04 15:14:30'),
(7, 'Mario', 'mario@gmail.com', '$2y$10$rpfuwLO0nxSB46cgMzR1XuSgnV9pI9z/X/Z1RcQYuJ0ogNCC1ot6K', '2025-05-04 12:27:36'),
(6, 'Ivan', 'ivan@gmail.com', '$2y$10$Rg.xUKwq/FKHzQdtfXUOX.XeEflxoMbJBnfKndRUYMKdWE1AOOAV6', '2025-05-03 15:00:59');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

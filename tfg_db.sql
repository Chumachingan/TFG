-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-03-2025 a las 18:25:32
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
  `tipo` varchar(50) NOT NULL DEFAULT 'General',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `balas`
--

INSERT INTO `balas` (`id`, `nombre`, `daño`, `penetracion`, `frag_percent`, `retroceso`, `precision_bala`, `distanciaEf`, `distanciaMax`, `velocidad`, `tier_id`, `tipo`) VALUES
(10, '7MM BUCKSHOT', 8, 3, 0.00, 0.00, 0.00, '39', '3', '415', 3, '12 Gauge Shot'),
(9, '6.5MM EXPRESS BUCKSHOT', 9, 3, 0.00, 0.00, 15.00, '71', 'NUNCA', '430', 3, '12 Gauge Shot'),
(8, '8.5MM MAGNUM BUCKSHOT', 8, 2, 0.00, 115.00, -15.00, '80', '116', '385', 3, '12 Gauge Shot'),
(7, '5.25MM BUCKSHOT', 8, 1, 0.00, 0.00, 0.00, '108', '9', '330', 3, '12 Gauge Shot'),
(11, 'PIRANHA', 10, 24, 0.00, 0.00, -5.00, '-', '-', '310', 6, '12 Gauge Shot'),
(12, 'FLECHETTE', 8, 31, 0.00, 0.00, -10.00, '>1KM', 'Never', '320', 6, '12 Gauge Shot'),
(13, 'RIP', 265, 2, 100.00, 35.00, 80.00, '188', '>1KM', '410', 0, '12 Gauge Slugs'),
(14, 'SUPERFORMANCE HP SLUG', 220, 5, 39.00, -15.00, 170.00, '344', '>1KM', '390', 0, '12 Gauge Slugs'),
(15, 'GRIZZLY 40 SLUG', 190, 12, 12.00, 20.00, 80.00, '840', '>1KM', '390', 6, '12 Gauge Slugs'),
(16, 'COPPER SABOT HP SLUG', 206, 14, 38.00, 10.00, 150.00, '305', '>1KM', '442', 6, '12 Gauge Slugs'),
(17, 'LEAD SLUG', 167, 15, 20.00, 0.00, 120.00, '487', '>1KM', '370', 6, '12 Gauge Slugs'),
(18, 'DUAL SABOT SLUG', 2, 17, 10.00, 15.00, 110.00, '251', '>1KM', '415', 6, '12 Gauge Slugs'),
(19, 'POLEVA-3\" SLUG', 140, 17, 20.00, -15.00, 100.00, '406', '>1KM', '410', 6, '12 Gauge Slugs'),
(20, 'FTX CUSTOM LITE SLUG', 183, 20, 10.00, -25.00, 135.00, '498', '>1KM', '480', 6, '12 Gauge Slugs'),
(21, 'POLEVA-6U\" SLUG', 150, 20, 15.00, -10.00, 115.00, '181', '>1KM', '430', 6, '12 Gauge Slugs'),
(22, 'MAKESHIFT .50 BMG SLUG', 197, 26, 5.00, 25.00, 90.00, '>1KM', '>1KM', '410', 6, '12 Gauge Slugs'),
(23, 'AP-20 ARMOR-PIERCING SLUG', 164, 37, 3.00, 50.00, 80.00, '905', '>1KM', '510', 6, '12 Gauge Slugs'),
(24, '5.6MM BUCKSHOT', 8, 1, 0.00, 10.00, -10.00, '124', 'Never', '340', 3, '20 GAUGE'),
(25, '6.2MM BUCKSHOT', 8, 2, 0.00, 10.00, -10.00, '124', 'NEVER', '410', 3, '20 GAUGE'),
(26, '6.5MM EXPRESS BUCKSHOT', 9, 3, 0.00, 0.00, 15.00, '71', 'NUNCA', '430', 3, '20 GAUGE'),
(27, '7.5MM BUCKSHOT', 8, 3, 0.00, 0.00, 0.00, '100', 'NEVER', '475', 3, '20 GAUGE'),
(28, '7.3MM BUCKSHOT', 8, 3, 0.00, 0.00, 0.00, '181', 'NEVER', '474', 6, '20 GAUGE'),
(29, 'DEVASTATOR SLUG', 198, 5, 100.00, 30.00, 125.00, '109', '>1KM', '405', 1, '20 GAUGE'),
(30, 'POLEVA-3\" SLUG', 120, 14, 20.00, -15.00, 110.00, '517', '>1KM', '425', 6, '20 GAUGE'),
(31, 'STAR SLUG', 154, 16, 10.00, 5.00, 130.00, '416', '>1KM', '415', 6, '20 GAUGE'),
(32, 'POLEVA-6U\" SLUG', 135, 17, 15.00, -10.00, 110.00, '438', '>1KM', '445', 6, '20 GAUGE'),
(33, 'ZVEZDA FLASHBANG ROUND', 0, 0, 20.00, 0.00, 0.00, '', '', '', 0, '23x75mm'),
(34, 'SHRAPNEL-25 BUCKSHOT', 8, 10, 0.00, 10.00, 20.00, '83', '>1KM', '375', 6, '23x75mm'),
(35, 'SHRAPNEL-10 BUCKSHOT', 8, 11, 0.00, 0.00, 0.00, '106', '>1KM', '270', 6, '23x75mm'),
(36, 'BARRIKADA SLUG', 192, 39, 20.00, 25.00, -5.00, '974', '>1KM', '420', 6, '23x75mm'),
(37, 'PM SP8 GZH', 67, 1, 60.00, 0.00, 0.00, '412', '>1KM', '250', 0, '9x18mm'),
(38, 'PM SP7 GZH', 77, 2, 2.00, 0.00, 0.00, '229', '>1KM', '420', 0, '9x18mm'),
(39, 'PM PSV', 69, 3, 40.00, 0.00, 0.00, '606', '>1KM', '280', 0, '9x18mm'),
(40, 'PM P GZH', 50, 5, 25.00, 0.00, 0.00, '478', '638', '302', 2, '9x18mm'),
(41, 'PM PSO GZH', 54, 5, 35.00, 0.00, 10.00, '459', '818', '315', 2, '9x18mm'),
(42, 'PM PS GS PPO', 55, 6, 25.00, 0.00, 0.00, '467', '>1KM', '330', 3, '9x18mm'),
(43, 'PM PRS GS', 58, 6, 30.00, 0.00, 0.00, '478', '>1KM', '302', 3, '9x18mm'),
(44, 'PM PPE GZH', 61, 7, 17.00, 0.00, 0.00, '438', '>1KM', '297', 4, '9x18mm'),
(45, 'PM PPT GZH', 59, 8, 20.00, -7.00, -5.00, '495', '>1KM', '301', 5, '9x18mm'),
(46, 'PM PST GZH', 50, 12, 20.00, 0.00, 0.00, '462', '615', '298', 6, '9x18mm'),
(47, 'PM RG028 GZH', 65, 12, 2.00, 0.00, 0.00, '476', '>1KM', '330', 6, '9x18mm'),
(48, 'PM BZHT GZH', 53, 18, 17.00, 0.00, 0.00, '303', '511', '325', 6, '9x18mm'),
(49, 'PMM PSTM GZH', 58, 24, 17.00, 5.00, 0.00, '322', '919', '420', 6, '9x18mm'),
(50, 'PM PBM GZH', 40, 28, 16.00, 4.00, 0.00, '133', '26', '519', 6, '9x18mm'),
(51, 'TT LRNPC', 66, 7, 35.00, -10.00, 10.00, '457', '>1KM', '385', 5, '7.62x25mm'),
(52, 'TT LRN', 64, 8, 35.00, -5.00, 5.00, '579', '>1KM', '375', 5, '7.62x25mm'),
(53, 'TT FMJ43', 60, 11, 25.00, 0.00, 0.00, '175', '595', '427', 6, '7.62x25mm'),
(54, 'TT P GL', 58, 14, 25.00, 0.00, 0.00, '411', '>1KM', '430', 6, '7.62x25mm'),
(55, 'TT PT GZH', 55, 18, 17.00, 0.00, -10.00, '426', '966', '415', 6, '7.62x25mm'),
(56, 'TT PST GZH', 50, 25, 20.00, 0.00, 0.00, '408', '615', '430', 6, '7.62x25mm'),
(57, 'RIP', 102, 2, 100.00, 5.00, 10.00, '290', '>1KM', '381', 0, '9x19mm'),
(58, 'TT LRN', 64, 8, 35.00, -5.00, 5.00, '579', '>1KM', '375', 5, '9x19mm'),
(59, 'QUAKEMAKER', 85, 8, 10.00, 10.00, 10.00, '725', '>1KM', '290', 6, '9x19mm'),
(60, 'PSO GZH', 59, 10, 25.00, 0.00, 0.00, '575', '>1KM', '340', 6, '9x19mm'),
(61, 'LUGER CCI', 70, 10, 25.00, 0.00, 0.00, '441', '>1KM', '420', 6, '9x19mm'),
(62, 'M882', 56, 18, 20.00, 0.00, 0.00, '', '', '385', 6, '9x19mm'),
(63, 'PST GZH', 54, 20, 15.00, 0.00, 0.00, '194', '452', '457', 6, '9x19mm'),
(64, 'AP 6.3', 52, 30, 5.00, 0.00, 0.00, '443', '776', '392', 6, '9x19mm'),
(65, 'PBP GZH', 52, 39, 5.00, 5.00, 5.00, '92', '220', '560', 6, '9x19mm'),
(66, 'ACP RIP', 130, 3, 100.00, 0.00, -5.00, '290', '>1KM', '293', 1, '.45'),
(67, 'ACP HYDRA-SHOK', 100, 13, 50.00, 0.00, 0.00, '725', '>1KM', '274', 6, '.45'),
(68, 'ACP LASERMATCH FMJ', 70, 19, 1.00, 0.00, 10.00, '575', '>1KM', '290', 6, '.45'),
(69, 'ACP MATCH FMJ', 72, 25, 1.00, 0.00, 0.00, '441', '>1KM', '340', 6, '.45'),
(70, 'ACP AP', 66, 38, 1.00, 7.00, -5.00, '428', '>1KM', '299', 6, '.45'),
(71, 'PE GZH', 80, 15, 35.00, -5.00, 0.00, '194', '452', '415', 6, '9x21mm'),
(72, 'P GZH', 65, 18, 30.00, -3.00, 0.00, '453', '776', '413', 6, '9x21mm'),
(73, 'PS GZH', 65, 18, 30.00, -3.00, 0.00, '453', '776', '413', 6, '9x21mm'),
(74, '7U4', 47, 27, 25.00, 0.00, 0.00, '', '', '300', 6, '9x21mm'),
(75, 'BT GZH', 49, 32, 20.00, 5.00, -5.00, '292', '>1KM', '410', 6, '9x21mm'),
(76, '7N42', 45, 38, 10.00, 10.00, -3.00, '', '', '400', 6, '9x21mm'),
(77, 'ACP RIP', 130, 3, 100.00, 0.00, -5.00, '290', '>1KM', '293', 1, '.45'),
(78, 'ACP HYDRA-SHOK', 100, 13, 50.00, 0.00, 0.00, '725', '>1KM', '274', 6, '.45'),
(79, 'ACP LASERMATCH FMJ', 70, 19, 1.00, 0.00, 10.00, '575', '>1KM', '290', 6, '.45'),
(80, 'ACP MATCH FMJ', 72, 25, 1.00, 0.00, 0.00, '441', '>1KM', '340', 6, '.45'),
(81, 'ACP AP', 66, 38, 1.00, 7.00, -5.00, '428', '>1KM', '299', 6, '.45'),
(82, 'SOFT POINT', 108, 12, 20.00, -29.00, 27.00, '', '', '455', 6, '.357 Magnum'),
(83, 'HP', 99, 18, 60.00, 15.00, 15.00, '', '', '481', 6, '.357 Magnum'),
(84, 'JHP', 88, 24, 60.00, 8.00, 15.00, '', '', '425', 6, '.357 Magnum'),
(85, 'FMJ', 70, 35, 1.00, 12.00, 0.00, '', '', '385', 6, '.357 Magnum'),
(86, 'R37.F', 98, 8, 100.00, 0.00, 0.00, '100', '>1KM', '729', 4, '5.7x28'),
(87, 'SS198LF', 70, 17, 80.00, 0.00, 0.00, '326', '>1KM', '792', 6, '5.7x28'),
(88, 'R37.X', 81, 11, 70.00, 0.00, 0.00, '100', '>1KM', '724', 6, '5.7x28'),
(89, 'SS197SR', 62, 25, 50.00, 0.00, 0.00, '401', '>1KM', '594', 6, '5.7x28'),
(90, 'L191 (TRACER)', 53, 33, 20.00, 0.00, -4.00, '358', '>1KM', '922', 6, '5.7x28'),
(91, 'SB193', 59, 27, 20.00, -15.00, 5.00, '>1KM', '>1KM', '299', 6, '5.7x28'),
(92, 'SS190', 49, 37, 20.00, 0.00, 0.00, '325', '463', '715', 6, '5.7x28'),
(93, 'ACTION SX', 65, 18, 50.00, 0.00, 0.00, '245', '>1KM', '690', 6, '4.6x30'),
(94, 'SUBSONIC SX', 52, 23, 20.00, -22.00, 10.00, '>1KM', '>1KM', '290', 6, '4.6x30'),
(95, 'JSP SX', 46, 32, 30.00, 0.00, 0.00, '', '', '579', 6, '4.6x30'),
(96, 'FMJ SX', 43, 40, 20.00, 0.00, 0.00, '367', '189', '620', 6, '4.6x30'),
(97, 'AP SX', 35, 53, 10.00, 10.00, 0.00, '198', 'Never', '680', 6, '4.6x30'),
(98, 'FMJ', 75, 17, 30.00, -5.00, 5.00, '', '>1KM', '330', 6, '9x39mm'),
(99, 'SP-5 GS', 71, 28, 20.00, 0.00, 0.00, '>1KM', '>1KM', '290', 6, '9x39mm'),
(100, 'SPP GS', 68, 35, 20.00, 7.00, 10.00, '887', '>1KM', '310', 6, '9x39mm'),
(101, 'PAB-9 GS', 62, 43, 10.00, 10.00, -15.00, '>1KM', '>1KM', '320', 6, '9x39mm'),
(102, 'SP-6 GS', 60, 48, 10.00, 5.00, 0.00, '>1KM', '>1KM', '305', 6, '9x39mm'),
(103, 'BP GS', 58, 54, 10.00, 15.00, 10.00, '>1KM', '>1KM', '295', 6, '9x39mm'),
(104, 'TKM GEKSA', 110, 14, 45.00, 0.00, 0.00, '484', '>1KM', '550', 6, '.366'),
(105, 'TKM FMJ', 98, 23, 25.00, 10.00, 0.00, '363', '>1KM', '580', 6, '.366'),
(106, 'TKM EKO', 73, 30, 20.00, -15.00, -10.00, '184', '>1KM', '770', 6, '.366'),
(107, 'TKM AP-M', 90, 42, 1.00, 35.00, -28.00, '633', '>1KM', '602', 6, '.366'),
(108, 'HP', 76, 9, 35.00, -3.00, 0.00, '368', '>1KM', '884', 5, '5.45x39mm'),
(109, 'PRS GS', 70, 13, 30.00, -5.00, 0.00, '392', '>1KM', '866', 6, '5.45x39mm'),
(110, 'SP', 65, 15, 45.00, -5.00, 10.00, '364', '>1KM', '873', 6, '5.45x39mm'),
(111, 'US GS', 63, 17, 10.00, -15.00, 0.00, '>1KM', '>1KM', '303', 6, '5.45x39mm'),
(112, 'T GS', 57, 20, 16.00, 0.00, -5.00, '331', '>1KM', '883', 6, '5.45x39mm'),
(113, 'FMJ', 55, 24, 25.00, 0.00, 0.00, '400', '>1KM', '884', 6, '5.45x39mm'),
(114, 'PS GS', 53, 28, 40.00, 0.00, 0.00, '352', '466', '890', 6, '5.45x39mm'),
(115, 'PP GS', 50, 34, 17.00, 3.00, 0.00, '382', '420', '886', 6, '5.45x39mm'),
(116, 'BT GS', 48, 37, 16.00, 5.00, -2.00, '310', '252', '880', 6, '5.45x39mm'),
(117, '7N40', 52, 42, 2.00, -10.00, 50.00, '388', '633', '915', 6, '5.45x39mm'),
(118, 'BP GS', 46, 45, 16.00, 7.00, -3.00, '378', '455', '890', 6, '5.45x39mm'),
(119, 'BS GS', 43, 54, 17.00, 10.00, -3.00, '363', '179', '830', 6, '5.45x39mm'),
(120, 'PPBS GS \"IGOLNIK\"', 37, 62, 2.00, 15.00, 0.00, '430', '85', '905', 6, '5.45x39mm'),
(121, 'WARMAGEDDON', 88, 3, 90.00, 10.00, 10.00, '525', '>1KM', '936', 6, '5.56x45mm'),
(122, 'HP', 79, 7, 70.00, 0.00, 0.00, '327', '>1KM', '947', 4, '5.56x45mm'),
(123, 'MK 255 MOD 0 (RRLP)', 72, 11, 3.00, 0.00, 0.00, '525', '>1KM', '936', 6, '5.56x45mm'),
(124, 'M856', 64, 18, 33.00, -2.00, -2.00, '358', '975', '874', 6, '5.56x45mm'),
(125, 'M855', 57, 31, 40.00, 0.00, 0.00, '358', '464', '922', 6, '5.56x45mm'),
(126, 'MK 318 MOD 0 (SOST)', 55, 33, 35.00, 3.00, 2.00, '409', '>1KM', '902', 6, '5.56x45mm'),
(127, 'M856A1', 52, 38, 42.00, 4.00, -4.00, '424', '594', '940', 6, '5.56x45mm'),
(128, 'M855A1', 49, 44, 44.00, 5.00, -5.00, '366', '352', '945', 6, '5.56x45mm'),
(129, 'M995', 42, 53, 42.00, 8.00, -7.00, '325', '149', '1013', 6, '5.56x45mm'),
(130, 'SSA AP', 38, 57, 20.00, 6.00, -9.00, '325', '29', '1013', 6, '5.56x45mm'),
(131, 'HP', 87, 15, 40.00, 5.00, -5.00, '382', '>1KM', '754', 6, '7.62x39mm'),
(132, 'SP', 68, 20, 35.00, -5.00, 0.00, '', '', '772', 6, '7.62x39mm'),
(133, 'FMJ', 63, 26, 30.00, -2.00, 0.00, '', '', '775', 6, '7.62x39mm'),
(134, 'US GZH', 56, 29, 8.00, -30.00, 5.00, '>1KM', '>1KM', '300', 6, '7.62x39mm'),
(135, 'T-45M1 GZH', 64, 30, 12.00, -6.00, -4.00, '314', '>1KM', '720', 6, '7.62x39mm'),
(136, 'PS GZH', 57, 35, 20.00, 0.00, 0.00, '393', '>1KM', '700', 6, '7.62x39mm'),
(137, 'PP', 55, 41, 15.00, 5.00, -1.00, '', '', '732', 6, '7.62x39mm'),
(138, 'BP GZH', 58, 47, 12.00, 7.00, -3.00, '387', '>1KM', '730', 6, '7.62x39mm'),
(139, 'MAI AP', 47, 58, 5.00, 10.00, -5.00, '387', '405', '730', 6, '7.62x39mm'),
(140, 'BLACKOUT WHISPER', 90, 14, 35.00, -5.00, 5.00, '490', '>1KM', '853', 6, '.300 blk'),
(141, 'BLACKOUT V-MAX', 72, 20, 25.00, -10.00, 30.00, '466', '>1KM', '723', 6, '.300 blk'),
(142, 'BLACKOUT BCP FMJ', 60, 30, 30.00, 0.00, 0.00, '563', '>1KM', '605', 6, '.300 blk'),
(143, 'BLACKOUT M62 TRACER', 54, 36, 20.00, 1.00, 0.00, '>1KM', '>1KM', '442', 6, '.300 blk'),
(144, 'BLACKOUT CBJ', 58, 43, 15.00, 5.00, 0.00, '', '', '725', 6, '.300 blk'),
(145, 'BLACKOUT AP', 51, 48, 30.00, 3.00, 0.00, '522', '>1KM', '635', 6, '.300 blk'),
(146, 'SIG FMJ', 80, 36, 18.00, 0.00, 0.00, '', '>', '899', 6, '6.8x51mm'),
(147, 'SIG HYBRID', 72, 47, 12.00, 10.00, 3.00, '', '>', '914', 6, '6.8x51mm'),
(148, 'ULTRA NOSLER', 107, 15, 70.00, -5.00, 10.00, '536', '>1KM', '822', 6, '7.62x51mm'),
(149, 'TCW SP', 87, 30, 35.00, -3.00, -2.00, '543', '>1KM', '808', 6, '7.62x51mm'),
(150, 'BCP FMJ', 83, 35, 20.00, 0.00, -7.00, '584', '>1KM', '840', 6, '7.62x51mm'),
(151, 'M80', 80, 41, 17.00, 0.00, 0.00, '483', '>1KM', '833', 6, '7.62x51mm'),
(152, 'M62 TRACER', 79, 44, 14.00, -1.00, -6.00, '462', '>1KM', '816', 6, '7.62x51mm'),
(153, 'M61', 70, 64, 13.00, 10.00, 3.00, '506', '>1KM', '849', 6, '7.62x51mm'),
(154, 'M993', 67, 70, 13.00, 8.00, 5.00, '445', '>1KM', '910', 6, '7.62x51mm'),
(155, 'HP BT (TRACER)', 102, 23, 40.00, 0.00, 0.00, '', '', '807', 6, '7.62x54R'),
(156, 'SP BT (TRACER)', 92, 27, 24.00, 0.00, 0.00, '', '', '703', 6, '7.62x54R'),
(157, 'FMJ', 84, 33, 20.00, 0.00, 0.00, '', '', '760', 6, '7.62x54R'),
(158, 'T-46M GZH', 82, 41, 18.00, -5.00, -1.00, '406', '>1KM', '800', 6, '7.62x54R'),
(159, 'LPS GZH', 81, 42, 18.00, 0.00, -5.00, '492', '>1KM', '865', 6, '7.62x54R'),
(160, 'PS GZH', 84, 45, 8.00, 8.00, 10.00, '510', '>1KM', '875', 6, '7.62x54R'),
(161, 'BT GZH', 78, 55, 8.00, -4.00, -2.00, '491', '>1KM', '875', 6, '7.62x54R'),
(162, 'SNB GZH', 75, 62, 8.00, 10.00, -2.00, '510', '>1KM', '875', 6, '7.62x54R'),
(163, 'BS GS', 72, 70, 8.00, 0.00, 0.00, '597', '>1KM', '785', 6, '7.62x54R'),
(164, 'PS12A', 165, 10, 70.00, -12.00, -15.00, '439', '>1KM', '290', 6, '12.7x55mm'),
(165, 'PS12', 115, 28, 30.00, 0.00, 10.00, '>1KM', '>1KM', '285', 6, '12.7x55mm'),
(166, 'PS12B', 102, 46, 30.00, 15.00, 0.00, '719', '>1KM', '300', 6, '12.7x55mm'),
(167, 'TAC-X', 196, 18, 50.00, 5.00, 10.00, '716', '>1KM', '880', 6, '.338 Lapua Magnum'),
(168, 'UCW', 142, 32, 60.00, 0.00, -5.00, '702', '>1KM', '849', 6, '.338 Lapua Magnum'),
(169, 'FMJ', 122, 47, 20.00, 0.00, 0.00, '733', '>1KM', '900', 6, '.338 Lapua Magnum'),
(170, 'AP', 115, 79, 13.00, 10.00, 0.00, '696', '>1KM', '849', 6, '.338 Lapua Magnum'),
(171, '30MM GRENADE', 199, 1, 0.00, 0.00, 0.00, '', '>', '', 0, 'Mounted Weapons'),
(172, '12.7X108MM', 182, 88, 17.00, 0.00, 0.00, '891', '>1KM', '', 6, 'Mounted Weapons'),
(173, '12.7X108MM TRACER', 199, 80, 17.00, 0.00, 0.00, '446', '>1KM', '', 6, 'Mounted Weapons'),
(174, '40MM BUCKSHOT GRENADE', 160, 5, 0.00, 0.00, 0.00, '994', '>1KM', '', 5, 'Mounted Weapons');

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

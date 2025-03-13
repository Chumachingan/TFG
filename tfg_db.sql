-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-03-2025 a las 13:37:03
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
  `nombre` varchar(50) NOT NULL,
  `daño` int NOT NULL,
  `distanciaMax` decimal(5,2) NOT NULL,
  `distanciaEf` decimal(5,2) NOT NULL,
  `precision_bala` decimal(5,2) NOT NULL,
  `penetracion` decimal(5,2) NOT NULL,
  `retroceso` decimal(5,2) NOT NULL,
  `frag_percent` decimal(5,2) NOT NULL,
  `tier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tier_id` (`tier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `balas`
--

INSERT INTO `balas` (`id`, `nombre`, `daño`, `distanciaMax`, `distanciaEf`, `precision_bala`, `penetracion`, `retroceso`, `frag_percent`, `tier_id`) VALUES
(1, '5.25MM BUCKSHOT', 8, 9.00, 108.00, 0.00, 1.00, 0.00, 0.00, 3),
(2, '8.5MM MAGNUM BUCKSHOT', 8, 116.00, 80.00, -15.00, 2.00, 115.00, 0.00, 3),
(3, '6.5MM EXPRESS BUCKSHOT', 9, 0.00, 71.00, 15.00, 3.00, 0.00, 0.00, 3),
(4, '7MM BUCKSHOT', 8, 3.00, 39.00, 0.00, 3.00, 0.00, 0.00, 3),
(5, 'PIRANHA', 10, 0.00, 0.00, -5.00, 24.00, 0.00, 0.00, 6),
(6, 'FLECHETTE', 8, 0.00, 0.00, -10.00, 31.00, 0.00, 0.00, 6),
(7, 'RIP', 265, 999.99, 188.00, 80.00, 2.00, 35.00, 100.00, 0),
(8, 'SUPERFORMANCE HP SLUG', 220, 999.99, 344.00, 170.00, 5.00, -15.00, 39.00, 0),
(9, 'GRIZZLY 40 SLUG', 190, 999.99, 840.00, 80.00, 12.00, 20.00, 12.00, 6),
(10, 'COPPER SABOT HP SLUG', 206, 999.99, 305.00, 150.00, 14.00, 10.00, 38.00, 6),
(11, 'LEAD SLUG', 167, 999.99, 487.00, 120.00, 15.00, 0.00, 20.00, 6),
(12, 'DUAL SABOT SLUG', 85, 999.99, 251.00, 110.00, 17.00, 15.00, 10.00, 6),
(13, 'POLEVA-3\" SLUG', 140, 999.99, 406.00, 100.00, 17.00, -15.00, 20.00, 6),
(14, 'FTX CUSTOM LITE SLUG', 183, 999.99, 498.00, 135.00, 20.00, -25.00, 10.00, 6),
(15, 'POLEVA-6U\" SLUG', 150, 999.99, 181.00, 115.00, 20.00, -10.00, 15.00, 6),
(16, 'MAKESHIFT .50 BMG SLUG', 197, 999.99, 999.99, 90.00, 26.00, 25.00, 5.00, 6),
(17, 'AP-20 ARMOR-PIERCING SLUG', 164, 999.99, 905.00, 80.00, 37.00, 50.00, 3.00, 6),
(18, '5.6MM BUCKSHOT', 26, 0.00, 124.00, -10.00, 1.00, 10.00, 0.00, 3),
(19, '6.2MM BUCKSHOT', 22, 0.00, 124.00, -10.00, 2.00, 10.00, 0.00, 3),
(20, '6.5MM EXPRESS BUCKSHOT', 35, 0.00, 71.00, 15.00, 3.00, 0.00, 0.00, 3),
(21, '7.5MM BUCKSHOT', 25, 0.00, 100.00, 0.00, 3.00, 0.00, 0.00, 3),
(22, '7.3MM BUCKSHOT', 25, 0.00, 181.00, 0.00, 3.00, 0.00, 0.00, 6),
(23, 'DEVASTATOR SLUG', 198, 999.99, 109.00, 125.00, 5.00, 30.00, 100.00, 1),
(24, 'POLEVA-3\" SLUG', 120, 999.99, 517.00, 110.00, 14.00, -15.00, 20.00, 6),
(25, 'STAR SLUG', 154, 999.99, 416.00, 130.00, 16.00, 5.00, 10.00, 6),
(26, 'POLEVA-6U\" SLUG', 135, 999.99, 438.00, 110.00, 17.00, -10.00, 15.00, 6),
(27, 'ZVEZDA FLASHBANG ROUND', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 20.00, 0),
(28, 'SHRAPNEL-25 BUCKSHOT', 78, 999.99, 83.00, 20.00, 10.00, 10.00, 0.00, 6),
(29, 'SHRAPNEL-10 BUCKSHOT', 87, 999.99, 106.00, 0.00, 11.00, 0.00, 0.00, 6),
(30, 'BARRIKADA SLUG', 192, 999.99, 974.00, -5.00, 39.00, 25.00, 20.00, 6),
(31, 'PM SP8 GZH', 67, 999.99, 412.00, 0.00, 1.00, 0.00, 60.00, 0),
(32, 'PM SP7 GZH', 77, 999.99, 229.00, 0.00, 2.00, 0.00, 2.00, 0),
(33, 'PM PSV', 69, 999.99, 606.00, 0.00, 3.00, 0.00, 40.00, 0),
(34, 'PM P GZH', 50, 638.00, 478.00, 0.00, 5.00, 0.00, 25.00, 2),
(35, 'PM PSO GZH', 54, 818.00, 459.00, 10.00, 5.00, 0.00, 35.00, 2),
(36, 'PM PS GS PPO', 55, 999.99, 467.00, 0.00, 6.00, 0.00, 25.00, 3),
(37, 'PM PRS GS', 58, 999.99, 478.00, 0.00, 6.00, 0.00, 30.00, 3),
(38, 'PM PPE GZH', 61, 999.99, 438.00, 0.00, 7.00, 0.00, 17.00, 4),
(39, 'PM PPT GZH', 59, 999.99, 495.00, -5.00, 8.00, -7.00, 20.00, 5),
(40, 'PM PST GZH', 50, 615.00, 462.00, 0.00, 12.00, 0.00, 20.00, 6),
(41, 'PM RG028 GZH', 65, 999.99, 476.00, 0.00, 12.00, 0.00, 2.00, 6),
(42, 'PM BZHT GZH', 53, 511.00, 303.00, 0.00, 18.00, 0.00, 17.00, 6),
(43, 'PMM PSTM GZH', 58, 919.00, 322.00, 0.00, 24.00, 5.00, 17.00, 6),
(44, 'PM PBM GZH', 40, 26.00, 133.00, 0.00, 28.00, 4.00, 16.00, 6),
(45, 'TT LRNPC', 66, 999.99, 457.00, 10.00, 7.00, -10.00, 35.00, 5),
(46, 'TT LRN', 64, 999.99, 579.00, 5.00, 8.00, -5.00, 35.00, 5),
(47, 'TT FMJ43', 60, 595.00, 175.00, 0.00, 11.00, 0.00, 25.00, 6),
(48, 'TT P GL', 58, 999.99, 411.00, 0.00, 14.00, 0.00, 25.00, 6),
(49, 'TT PT GZH', 55, 966.00, 426.00, -10.00, 18.00, 0.00, 17.00, 6),
(50, 'TT PST GZH', 50, 615.00, 408.00, 0.00, 25.00, 0.00, 20.00, 6),
(51, 'RIP', 102, 999.99, 290.00, 10.00, 2.00, -5.00, 100.00, 0),
(52, 'TT LRN', 64, 999.99, 579.00, 5.00, 8.00, -5.00, 35.00, 5),
(53, 'QUAKEMAKER', 85, 999.99, 725.00, 10.00, 8.00, 10.00, 10.00, 6),
(54, 'PSO GZH', 59, 999.99, 575.00, 0.00, 10.00, 0.00, 25.00, 6),
(55, 'LUGER CCI', 70, 999.99, 441.00, 0.00, 10.00, 0.00, 25.00, 6),
(56, 'M882', 56, 0.00, 0.00, 0.00, 18.00, 0.00, 20.00, 6),
(57, 'PST GZH', 54, 452.00, 194.00, 0.00, 20.00, 0.00, 15.00, 6),
(58, 'AP 6.3', 52, 776.00, 443.00, 0.00, 30.00, 0.00, 5.00, 6),
(59, 'PBP GZH', 52, 220.00, 92.00, -5.00, 39.00, 5.00, 5.00, 6),
(60, 'ACP RIP', 130, 999.99, 290.00, -5.00, 3.00, 0.00, 100.00, 1),
(61, 'ACP HYDRA-SHOK', 100, 999.99, 725.00, 0.00, 13.00, 0.00, 50.00, 6),
(62, 'ACP LASERMATCH FMJ', 70, 999.99, 575.00, 10.00, 19.00, 0.00, 1.00, 6),
(63, 'ACP MATCH FMJ', 72, 999.99, 441.00, 0.00, 25.00, 0.00, 1.00, 6),
(64, 'ACP AP', 66, 999.99, 428.00, -5.00, 38.00, 7.00, 1.00, 6),
(65, 'PE GZH', 80, 452.00, 194.00, 0.00, 15.00, -5.00, 35.00, 6),
(66, 'P GZH', 65, 776.00, 453.00, 0.00, 18.00, -3.00, 30.00, 6),
(67, 'PS GZH', 65, 776.00, 453.00, 0.00, 18.00, -3.00, 30.00, 6),
(68, '7U4', 47, 0.00, 0.00, 0.00, 27.00, 0.00, 25.00, 6),
(69, 'BT GZH', 49, 999.99, 292.00, -5.00, 32.00, 5.00, 20.00, 6),
(70, '7N42', 45, 0.00, 0.00, -3.00, 38.00, 10.00, 10.00, 6),
(71, 'ACP RIP', 130, 999.99, 290.00, -5.00, 3.00, 0.00, 100.00, 1),
(72, 'ACP HYDRA-SHOK', 100, 999.99, 725.00, 0.00, 13.00, 0.00, 50.00, 6),
(73, 'ACP LASERMATCH FMJ', 70, 999.99, 575.00, 10.00, 19.00, 0.00, 1.00, 6),
(74, 'ACP MATCH FMJ', 72, 999.99, 441.00, 0.00, 25.00, 0.00, 1.00, 6),
(75, 'ACP AP', 66, 999.99, 428.00, -5.00, 38.00, 7.00, 1.00, 6),
(76, 'SOFT POINT', 108, 0.00, 0.00, 27.00, 12.00, -29.00, 20.00, 6),
(77, 'HP', 99, 0.00, 0.00, 15.00, 18.00, -15.00, 60.00, 6),
(78, 'JHP', 88, 0.00, 0.00, 15.00, 24.00, -8.00, 60.00, 6),
(79, 'FMJ', 70, 0.00, 0.00, 0.00, 35.00, 12.00, 1.00, 6),
(80, 'R37.F', 98, 999.99, 100.00, 0.00, 8.00, 0.00, 100.00, 4),
(81, 'SS198LF', 70, 999.99, 326.00, 0.00, 17.00, 0.00, 80.00, 6),
(82, 'R37.X', 81, 999.99, 100.00, 0.00, 11.00, 0.00, 70.00, 6),
(83, 'SS197SR', 62, 999.99, 401.00, 0.00, 25.00, 0.00, 50.00, 6),
(84, 'L191 (TRACER)', 53, 999.99, 358.00, -4.00, 33.00, 0.00, 20.00, 6),
(85, 'SB193', 59, 999.99, 0.00, 5.00, 27.00, -15.00, 20.00, 6),
(86, 'SS190', 49, 463.00, 325.00, 0.00, 37.00, 0.00, 20.00, 6),
(87, 'ACTION SX', 65, 999.99, 245.00, 0.00, 18.00, 0.00, 50.00, 6),
(88, 'SUBSONIC SX', 52, 999.99, 0.00, 10.00, 23.00, -22.00, 20.00, 6),
(89, 'JSP SX', 46, 0.00, 0.00, 0.00, 32.00, 0.00, 30.00, 6),
(90, 'FMJ SX', 43, 189.00, 367.00, 0.00, 40.00, 0.00, 20.00, 6),
(91, 'AP SX', 35, 0.00, 198.00, 0.00, 53.00, 10.00, 10.00, 6),
(92, 'FMJ', 75, 999.99, 0.00, 5.00, 17.00, -5.00, 30.00, 6),
(93, 'SP-5 GS', 71, 999.99, 0.00, 0.00, 28.00, 0.00, 20.00, 6),
(94, 'SPP GS', 68, 999.99, 887.00, 10.00, 35.00, 7.00, 20.00, 6),
(95, 'PAB-9 GS', 62, 999.99, 0.00, -15.00, 43.00, 10.00, 10.00, 6),
(96, 'SP-6 GS', 60, 999.99, 0.00, 0.00, 48.00, 5.00, 10.00, 6),
(97, 'BP GS', 58, 999.99, 0.00, 10.00, 54.00, 15.00, 10.00, 6),
(98, 'TKM GEKSA', 110, 999.99, 484.00, 0.00, 14.00, 0.00, 45.00, 6),
(99, 'TKM FMJ', 98, 999.99, 363.00, 0.00, 23.00, 10.00, 25.00, 6),
(100, 'TKM EKO', 73, 999.99, 184.00, -10.00, 30.00, -15.00, 20.00, 6),
(101, 'TKM AP-M', 90, 999.99, 633.00, -28.00, 42.00, 35.00, 1.00, 6),
(102, 'HP', 76, 999.99, 368.00, 0.00, 9.00, -3.00, 35.00, 5),
(103, 'PRS GS', 70, 999.99, 392.00, 0.00, 13.00, -5.00, 30.00, 6),
(104, 'SP', 65, 999.99, 364.00, 10.00, 15.00, -5.00, 45.00, 6),
(105, 'US GS', 63, 999.99, 0.00, 0.00, 17.00, -15.00, 10.00, 6),
(106, 'T GS', 57, 999.99, 331.00, -5.00, 20.00, 0.00, 16.00, 6),
(107, 'FMJ', 55, 999.99, 400.00, 0.00, 24.00, 0.00, 25.00, 6),
(108, 'PS GS', 53, 466.00, 352.00, 0.00, 28.00, 0.00, 40.00, 6),
(109, 'PP GS', 50, 420.00, 382.00, 0.00, 34.00, 3.00, 17.00, 6),
(110, 'BT GS', 48, 252.00, 310.00, -2.00, 37.00, 5.00, 16.00, 6),
(111, '7N40', 52, 633.00, 388.00, 50.00, 42.00, -10.00, 2.00, 6),
(112, 'BP GS', 46, 455.00, 378.00, -3.00, 45.00, 7.00, 16.00, 6),
(113, 'BS GS', 43, 179.00, 363.00, -3.00, 54.00, 10.00, 17.00, 6),
(114, 'PPBS GS \"IGOLNIK\"', 37, 85.00, 430.00, 0.00, 62.00, 15.00, 2.00, 6),
(115, 'WARMAGEDDON', 88, 999.99, 525.00, 10.00, 3.00, 10.00, 90.00, 6),
(116, 'HP', 79, 999.99, 327.00, 0.00, 7.00, 0.00, 70.00, 4),
(117, 'MK 255 MOD 0 (RRLP)', 72, 999.99, 525.00, 0.00, 11.00, 0.00, 3.00, 6),
(118, 'M856', 64, 975.00, 358.00, -2.00, 18.00, -2.00, 33.00, 6),
(119, 'M855', 57, 464.00, 358.00, 0.00, 31.00, 0.00, 40.00, 6),
(120, 'MK 318 MOD 0 (SOST)', 55, 999.99, 409.00, 2.00, 33.00, 3.00, 35.00, 6),
(121, 'M856A1', 52, 594.00, 424.00, -4.00, 38.00, 4.00, 42.00, 6),
(122, 'M855A1', 49, 352.00, 366.00, -5.00, 44.00, 5.00, 44.00, 6),
(123, 'M995', 42, 149.00, 325.00, -7.00, 53.00, 8.00, 42.00, 6),
(124, 'SSA AP', 38, 29.00, 325.00, -9.00, 57.00, 6.00, 20.00, 6),
(125, 'HP', 87, 999.99, 382.00, -5.00, 15.00, 5.00, 40.00, 6),
(126, 'SP', 68, 999.99, 0.00, 0.00, 20.00, -5.00, 35.00, 6),
(127, 'FMJ', 63, 999.99, 0.00, 0.00, 26.00, -2.00, 30.00, 6),
(128, 'US GZH', 56, 999.99, 0.00, 5.00, 29.00, -30.00, 8.00, 6),
(129, 'T-45M1 GZH', 64, 999.99, 314.00, -4.00, 30.00, -6.00, 12.00, 6),
(130, 'PS GZH', 57, 999.99, 393.00, 0.00, 35.00, 0.00, 20.00, 6),
(131, 'PP', 55, 999.99, 0.00, -1.00, 41.00, 5.00, 15.00, 6),
(132, 'BP GZH', 58, 999.99, 387.00, -3.00, 47.00, 7.00, 12.00, 6),
(133, 'MAI AP', 47, 405.00, 387.00, -5.00, 58.00, 10.00, 5.00, 6),
(134, 'BLACKOUT WHISPER', 90, 999.99, 490.00, 5.00, 14.00, -5.00, 35.00, 6),
(135, 'BLACKOUT V-MAX', 72, 999.99, 466.00, 30.00, 20.00, -10.00, 25.00, 6),
(136, 'BLACKOUT BCP FMJ', 60, 999.99, 563.00, 0.00, 30.00, 0.00, 30.00, 6),
(137, 'BLACKOUT M62 TRACER', 54, 999.99, 0.00, 0.00, 36.00, 1.00, 20.00, 6),
(138, 'BLACKOUT CBJ', 58, 0.00, 0.00, 0.00, 43.00, 5.00, 15.00, 6),
(139, 'BLACKOUT AP', 51, 999.99, 522.00, 0.00, 48.00, 3.00, 30.00, 6),
(140, 'SIG FMJ', 80, 0.00, 0.00, 0.00, 36.00, 0.00, 18.00, 6),
(141, 'SIG HYBRID', 72, 0.00, 0.00, 3.00, 47.00, 10.00, 12.00, 6),
(142, 'ULTRA NOSLER', 107, 999.99, 536.00, 10.00, 15.00, -5.00, 70.00, 6),
(143, 'TCW SP', 87, 999.99, 543.00, -2.00, 30.00, -3.00, 35.00, 6),
(144, 'BCP FMJ', 83, 999.99, 584.00, -7.00, 35.00, 0.00, 20.00, 6),
(145, 'M80', 80, 999.99, 483.00, 0.00, 41.00, 0.00, 17.00, 6),
(146, 'M62 TRACER', 79, 999.99, 462.00, -6.00, 44.00, -1.00, 14.00, 6),
(147, 'M61', 70, 999.99, 506.00, 3.00, 64.00, 10.00, 13.00, 6),
(148, 'M993', 67, 999.99, 445.00, 5.00, 70.00, 8.00, 13.00, 6),
(149, 'HP BT (TRACER)', 102, 0.00, 0.00, 0.00, 23.00, 0.00, 40.00, 6),
(150, 'SP BT (TRACER)', 92, 0.00, 0.00, 0.00, 27.00, 0.00, 24.00, 6),
(151, 'FMJ', 84, 0.00, 0.00, 0.00, 33.00, 0.00, 20.00, 6),
(152, 'T-46M GZH', 82, 999.99, 406.00, -1.00, 41.00, -5.00, 18.00, 6),
(153, 'LPS GZH', 81, 999.99, 492.00, -5.00, 42.00, 0.00, 18.00, 6),
(154, 'PS GZH', 84, 999.99, 510.00, 10.00, 45.00, 8.00, 8.00, 6),
(155, 'BT GZH', 78, 999.99, 491.00, -2.00, 55.00, -4.00, 8.00, 6),
(156, 'SNB GZH', 75, 999.99, 510.00, -2.00, 62.00, 10.00, 8.00, 6),
(157, 'BS GS', 72, 999.99, 597.00, 0.00, 70.00, 0.00, 8.00, 6),
(158, 'TAC-X', 196, 999.99, 716.00, 10.00, 18.00, 5.00, 50.00, 6),
(159, 'UCW', 142, 999.99, 702.00, -5.00, 32.00, 0.00, 60.00, 6),
(160, 'FMJ', 122, 999.99, 733.00, 0.00, 47.00, 0.00, 20.00, 6),
(161, 'AP', 115, 999.99, 696.00, 0.00, 79.00, 10.00, 13.00, 6),
(162, '30MM GRENADE', 199, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0),
(163, '12.7X108MM', 182, 999.99, 891.00, 0.00, 88.00, 0.00, 17.00, 6),
(164, '12.7X108MM TRACER', 199, 999.99, 446.00, 0.00, 80.00, 0.00, 17.00, 6),
(165, '40MM BUCKSHOT GRENADE', 160, 999.99, 994.00, 0.00, 5.00, 0.00, 0.00, 5),
(166, 'TAC-X', 196, 999.99, 716.00, 10.00, 18.00, 5.00, 50.00, 6),
(167, 'UCW', 142, 999.99, 702.00, -5.00, 32.00, 0.00, 60.00, 6),
(168, 'FMJ', 122, 999.99, 733.00, 0.00, 47.00, 0.00, 20.00, 6),
(169, 'AP', 115, 999.99, 696.00, 0.00, 79.00, 10.00, 13.00, 6);

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
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 4),
(5, 5),
(5, 6),
(6, 5),
(6, 6);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `DisparoD` varchar(50) NOT NULL,
  `Tier` varchar(50) NOT NULL,
  `Efectividad` text NOT NULL,
  `Descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

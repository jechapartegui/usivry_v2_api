-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: xnydyfvjecha.mysql.db
-- Generation Time: Sep 08, 2023 at 10:09 AM
-- Server version: 5.7.42-log
-- PHP Version: 8.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xnydyfvjecha`
--
CREATE DATABASE IF NOT EXISTS `xnydyfvjecha` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `xnydyfvjecha`;

-- --------------------------------------------------------

--
-- Table structure for table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registration_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `compte`
--

INSERT INTO `compte` (`id`, `login`, `password`, `registration_date`) VALUES
(2, 'nora.youcefi@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(3, 'lorrainefaure@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(4, 'sabbarnabe@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(5, 'laurine.annon@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(6, 'Emiliefairet@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(7, 'camille.clmt94@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(8, 'jolalko@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(9, 'clementine.ripault@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(10, 'geraldigne@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(11, 'cthiltges@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(12, 'sdliberafr@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(13, 'nine143@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(14, 'nahema.pvh@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(15, 'meidi.lakrout@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(16, 'leadorion@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(17, 'v.tezier@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(18, 'gaaile@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(19, 'mauud.br@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(20, 'alice.desindes@sncf.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(21, 'Jess8billard@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(22, 'elka.weibel13@gmail.com', 'ef26835d7ed32ff01a45f727dc9e04b1e2e536687572aabf52ee14b1d6ac1a7e', '2023-08-04'),
(23, 'Laurie.lprte@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(24, 'marie.elmkhanter@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(25, 'arnaudtournaire@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(26, 'Samy.zakki@outlook.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(27, 'jechapartegui@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(28, 'noraayad@msn.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(29, 'antoine.fiel@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(30, 'charlene.julienne@free.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(31, 'raoul.jo@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(32, 'weinland.liza@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(33, 'ddlegac@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(34, 'mathieubench@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(35, 'charline.s.fourie@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(36, 'maxime.mouliney@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(37, 'tokokam@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(38, 'david.bounleng@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(39, 'yvon@ncdecor.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(40, 'doudychkaya@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(41, 'duartelucie3@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(42, 'francois.taillebrest@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(43, 'melanie.trouv@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(44, 'ellisosndo@me.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(45, 'chezlich-roller@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(46, 'marc.revilloud@laposte.net', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(47, 'maryhenry566@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(48, 'florian_pr@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(49, 'ninabonomo@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(50, 'marie.alloing@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(51, 'nicolaa94100@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(52, 'Griveaujohanna@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(53, 'n.vuillerme@live.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(54, 'noemiecrozat@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(55, 'webexplorer8@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(56, 'alcolei.aurore@sfr.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(57, 'cj.caroujel@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(58, 'angelero32@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(59, 'arthur_aubertin@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(60, 'maryloupetot@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(61, 'camille.legouez1@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(62, 'Marionservier@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(63, 'aurelien.josse@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(64, 'Guilhem.marrannes@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(65, 'aureliekuan@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(66, 'andrea228@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(67, 'ch.dignat@outlook.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(68, 'nicolas.gr.contact@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(69, 'lucillehuart@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(70, 'gisselbrecht_e@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(71, 'clairy.mylene@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(72, 'bouvetmichael94@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(73, 'absabatier@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(74, 'sugar.rush@silvere.net', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(75, 'eleonorebernal@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(76, 'agathe.arghyris@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(77, 'yoann.copinet@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(78, 'nolwenn.mespoulede@rocketmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(79, 'olivedc94@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(80, 'cigolottiaudrey@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(81, 'fabricethai@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(82, 'capucine.daguet@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(83, 'cecile-tea@wanadoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(84, 'ocotto@live.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(85, 'alexandre.alauzet@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(86, 'bakhti.sarra94@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(87, 'juanjin@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(88, 'lea.ledoux14@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(89, 'fannywinden@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(90, 'assia_berrabah@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(91, 'mathilde.grivel@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(92, 'do-lecomte@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(93, 'francois@presset.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(94, 'vivian.nkemba@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(95, 'marieleroy9@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(96, 'manon.lafaye.archi@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(97, 'Sardineallo@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(98, 'e.zoubir@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(99, 'laurene.zyskind@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(100, 'angelique.khaber@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(101, 'nailikg@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(102, 'caroline.tronquart@orange.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(103, 'vivianeguichen@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(104, 'ykahina06@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(105, 'ducray.nicolas@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(106, 'benjamin.turquier@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(107, 'elodie.eyang@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(108, 'alize.saintandre@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(109, 'nevenavuckovica@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(110, 'sophie.pelletier971@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(111, 'florian.rappaport@gadz.org', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(112, 'camillefuger@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(113, 'guilbertgaelle@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(114, 'rmn.wrnvngs@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(115, 'tavanimaha@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(116, 'elentavernier@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(117, 'lydia.cekovic@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(118, 'murarety@outlook.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(119, 'nbossu@netscape.net', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(120, 'anne.lantier1@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(121, 'hasna.pillot@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(122, 'emilie.enouf@aliceadsl.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(123, 'Aprisciel@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(124, 'matthieu.thielleux@laposte.net', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04'),
(125, 'zahirhanaizi@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-09-07'),
(126, 'Priam-boulay@orange.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-09-07'),
(127, 'yorosidibe@outlook.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-09-07'),
(128, 'ellissondo@me.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-09-07');

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

CREATE TABLE `cours` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `jour_semaine` varchar(20) NOT NULL,
  `heure` varchar(10) NOT NULL,
  `duree` int(11) NOT NULL,
  `prof_principal_id` int(11) NOT NULL,
  `lieu_id` int(11) NOT NULL,
  `age_requis` int(11) NOT NULL,
  `age_maximum` int(11) DEFAULT NULL,
  `niveau_requis` enum('débutant','intermédiaire','avancé') NOT NULL,
  `saison_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cours`
--

INSERT INTO `cours` (`id`, `nom`, `jour_semaine`, `heure`, `duree`, `prof_principal_id`, `lieu_id`, `age_requis`, `age_maximum`, `niveau_requis`, `saison_id`) VALUES
(1, 'Adultes - RollerSoccer', 'mercredi', '19:00', 90, 31, 2, 14, NULL, 'intermédiaire', 1),
(3, 'Enfants - Initiation', 'dimanche', '14:00', 80, 31, 1, 4, NULL, 'débutant', 1),
(4, 'Enfants - Activités : Multiglisse', 'dimanche', '16:00', 80, 31, 1, 8, NULL, 'intermédiaire', 1),
(5, 'Adultes - Rollers', 'dimanche', '14:30', 90, 31, 1, 16, NULL, 'débutant', 1),
(6, 'Enfants - RollerSoccer', 'dimanche', '17:00', 90, 31, 1, 8, NULL, 'intermédiaire', 1),
(7, 'Enfants - Roller Street', 'dimanche', '15:30', 90, 31, 1, 8, NULL, 'intermédiaire', 1),
(8, 'Adultes - RollBall', 'mercredi', '20:30', 90, 24, 2, 14, NULL, 'intermédiaire', 1),
(9, 'Adultes - RollerSoccer', 'mercredi', '19:00', 90, 31, 2, 14, NULL, 'intermédiaire', 2),
(10, 'Enfants - Initiation', 'dimanche', '14:00', 80, 151, 1, 4, NULL, 'débutant', 2),
(11, 'Enfants - Activités : Multiglisse', 'dimanche', '16:00', 80, 150, 1, 8, NULL, 'intermédiaire', 2),
(12, 'Adultes - Rollers', 'dimanche', '14:30', 90, 150, 1, 16, NULL, 'débutant', 2),
(13, 'Enfants - RollerSoccer', 'dimanche', '17:00', 90, 151, 1, 8, NULL, 'intermédiaire', 2),
(14, 'Enfants - Roller Street', 'dimanche', '15:30', 90, 151, 1, 8, NULL, 'intermédiaire', 2),
(15, 'Adultes - RollBall', 'mercredi', '20:30', 90, 24, 2, 14, NULL, 'intermédiaire', 2),
(16, 'Adultes - Roller Derby - Lundi', 'lundi', '20:00', 150, 74, 2, 18, NULL, 'débutant', 2),
(17, 'Adultes - Roller Derby - Lundi', 'jeudi', '20:00', 150, 74, 3, 18, NULL, 'intermédiaire', 2),
(18, 'Adultes - Roller Derby Samedi', 'samedi', '10:00', 120, 74, 3, 18, NULL, 'intermédiaire', 2);

-- --------------------------------------------------------

--
-- Table structure for table `inscription`
--

CREATE TABLE `inscription` (
  `id` int(11) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `seance_id` int(11) NOT NULL,
  `date_inscription` date NOT NULL,
  `statut` enum('présent','absent') DEFAULT NULL,
  `statut_seance` enum('présent','absent') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inscription`
--

INSERT INTO `inscription` (`id`, `rider_id`, `seance_id`, `date_inscription`, `statut`, `statut_seance`) VALUES
(2, 30, 4, '2023-08-18', 'présent', NULL),
(4, 31, 3, '2023-08-18', 'absent', NULL),
(5, 116, 6, '2023-09-04', NULL, 'absent'),
(6, 23, 6, '2023-09-07', 'absent', NULL),
(7, 23, 7, '2023-09-07', 'présent', NULL),
(8, 30, 12, '2023-09-07', 'présent', NULL),
(9, 31, 9, '2023-09-07', 'présent', NULL),
(10, 31, 10, '2023-09-07', 'présent', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inscription_saison`
--

CREATE TABLE `inscription_saison` (
  `rider_id` int(11) NOT NULL,
  `saison_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inscription_saison`
--

INSERT INTO `inscription_saison` (`rider_id`, `saison_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(42, 2),
(35, 2),
(31, 2),
(30, 2),
(24, 2),
(23, 2),
(18, 2),
(14, 2),
(47, 2),
(74, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 2),
(104, 2),
(105, 2),
(106, 2),
(115, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lieu`
--

CREATE TABLE `lieu` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lieu`
--

INSERT INTO `lieu` (`id`, `nom`, `adresse`) VALUES
(1, 'Halle Gosnat', '30 Rue Amédée Huon, 94200 Ivry-sur-Seine'),
(2, 'Gymnase Dulcie September', '8, rue Jean-Jacques Rousseau 94200 Ivry-sur-Seine'),
(3, 'TEP Louis Braille', '24 Rue Louis Braille, 75012 Paris');

-- --------------------------------------------------------

--
-- Table structure for table `riders`
--

CREATE TABLE `riders` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `niveau` enum('débutant','intermédiaire','avancé') NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `compte` int(11) NOT NULL,
  `essai_restant` int(11) DEFAULT '0',
  `est_prof` tinyint(1) DEFAULT '0',
  `est_admin` tinyint(1) DEFAULT '0',
  `telephone` varchar(50) NOT NULL,
  `personne_prevenir` varchar(100) NOT NULL,
  `telephone_personne_prevenir` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `riders`
--

INSERT INTO `riders` (`id`, `nom`, `prenom`, `date_naissance`, `sexe`, `niveau`, `adresse`, `compte`, `essai_restant`, `est_prof`, `est_admin`, `telephone`, `personne_prevenir`, `telephone_personne_prevenir`) VALUES
(1, 'YOUCEFI', 'Nora', '1992-02-24', '0', 'débutant', '11 Rue Simone de Beauvoir 93100 Montreuil', 2, 0, 0, 0, '0672979942', 'BRAZILLE Morgane', '0663556544  '),
(2, 'Faure', 'Lorraine', '1988-10-07', '0', 'débutant', '76 avenue du président Wilson 93100 Montreuil', 3, 0, 0, 0, '0678687742', 'Colin Catherine', '0679280722  '),
(3, 'Barnabé', 'Lise', '2014-11-20', '0', 'débutant', '40 bis rue André Visage 94400 Vitry sur Seine', 4, 0, 0, 0, '0623554478', 'Barnabé Sabrina', '0623554478 0610809534'),
(4, 'Barnabé', 'Sabrina', '1984-06-10', '0', 'débutant', '40 bis rue André Visage 94400 Vitry sur Seine', 4, 0, 0, 0, '0623554478', 'Barnabé Julien', '0610809534  '),
(5, 'Annon', 'Laurine', '1997-09-19', '0', 'débutant', '163 Avenue Jean Jaurès 75019 Paris', 5, 0, 0, 0, '0612619307', 'Moulo Orlane', '0781158249  '),
(6, 'Fairet', 'Emilie', '1980-05-25', '0', 'débutant', '65 rue servan 75011 Paris', 6, 0, 0, 0, '0761095977', 'Morio Joris ou Caroline', '0683897797 0680987780'),
(7, 'CLEMENT', 'Camille', '1992-01-13', '0', 'débutant', '3 rue Westermeyer 94200 Ivry sur seine', 7, 0, 0, 0, '0640199500', 'CLEMENT Marie-Pierre', '0674732936  '),
(8, 'beldjilali', 'liam', '2016-06-23', '0', 'débutant', '23 av gambetta 94400 Vitry-sur-Seine', 8, 0, 0, 0, '0651289017', 'lalko joanna', '0651289017 0615692839'),
(9, 'lalko-beldjilali', 'joanna', '1980-02-29', '0', 'débutant', '23 av gambetta 94400 Vitry-sur-Seine', 8, 0, 0, 0, '0651289017', 'beldjilali riad', '0615692839  '),
(10, 'RIPAULT', 'Clémentine', '1993-08-05', '0', 'débutant', '28 Rue Marcelin Berthelot 94140 Alfortville', 9, 0, 0, 0, '0602689351', 'RIPAULT Solange', '0682356100  '),
(11, 'FRANCK', 'Geraldine', '1983-05-02', '0', 'débutant', '141 rue des pyrénées 75020 PARIS', 10, 0, 0, 0, '0684179773', 'SILVESTRI Lauriane', '0609208053  '),
(12, 'Thiltges', 'Charlie', '1994-04-10', '0', 'débutant', '75 Rue Marat, Bat B2, 3e étage à gauche 94200 Ivry-sur-Seine', 11, 0, 0, 0, '0677656271', 'Weinland Liza', '0609827661  '),
(13, 'Dalla-Libera', 'Sami', '1980-08-21', '0', 'débutant', '70 boulevard de Bellechasse 94100 Saint Maur des Fosses', 12, 0, 0, 0, '0607647571', 'Pacreau Caroline', '07 69 11 34 15  '),
(14, 'Omnès Le Lamer', 'Virginie', '1975-04-03', '0', 'intermédiaire', '19 rue Louis Fablet 94200 Ivry sur Seine', 13, 0, 0, 1, '0695113506', 'Le Lamer Arnaud', '0687285346  '),
(15, 'Pham-Van-Hué', 'Nahéma', '1998-02-19', '0', 'débutant', '15 Rue de Montreuil 75011 Paris', 14, 0, 0, 0, '0668204929', 'Moreno Catherine', '0643948001  '),
(16, 'LAKROUT', 'Meidi', '1979-06-09', '0', 'débutant', '81 quai boissy d\'anglas, D2 78380 bougival', 15, 0, 0, 0, '+33615052947', 'SULOWSKI Céline', '0685723934  '),
(17, 'Dorion', 'Léa', '1991-02-10', '0', 'débutant', '110 rue de Stalingrad 93100 Montreuil', 16, 0, 0, 0, '0668611665', 'Phlippoteau Marjorie', '0650303058  '),
(18, 'Tezier', 'Valentine', '1989-08-15', '0', 'intermédiaire', '165 Avenue Henri Ginoux 92120 Montrouge', 17, 0, 0, 0, '0668439399', 'Bellut Sébastien', '0663070249  '),
(19, 'Lennon', 'Gaëlle', '1977-05-21', '0', 'débutant', '175 rue Marcel Hartmann 94200 Ivry-sur-Seine', 18, 0, 0, 0, '0663745733', 'Bernon Yann', '0661993831  '),
(20, 'BRIER', 'Maud', '2001-07-11', '0', 'intermédiaire', '35 avenue des Gobelins 75013 Paris', 19, 0, 0, 0, '0750806929', 'Brier Camille', '0649726661  '),
(21, 'Desindes ', 'Alice', '1977-10-28', '0', 'intermédiaire', '36 rue de Lancry 60200 Compiègne', 20, 0, 0, 0, '0619730234', 'Dronchon David', '0687567831  '),
(22, 'Billard', 'Jessica', '1996-11-01', '0', 'avancé', '5 avenue pierre brasseur 95490 Vauréal', 21, 0, 0, 0, '0658589893', 'Billard Charles', '+33 7 64 17 55 08  '),
(23, 'Weibel', 'Elka', '1995-12-12', '0', 'avancé', '34 rue Emile Zola 94140 Alfortville', 22, 0, 0, 0, '0631851682', 'Rossignole Julien', '0681792731  '),
(24, 'Laporte', 'Laurie', '1997-02-27', '0', 'avancé', '16 esplanade des frères lumière 95220 Herblay', 23, 0, 1, 1, 'LAPORTE Pascal (père)', 'LAPORTE Pascal (père)', '0621980048  '),
(25, 'Elmkhanter', 'Marie', '1995-05-20', '0', 'débutant', '24 rue de l\'aubrac 75012 Paris', 24, 0, 0, 0, '+33608743283', 'Elmkhanter Nadine', '0614730489  '),
(26, 'lixon', 'sophie', '1977-08-02', '0', 'débutant', '10 RUE LOUIS FABLET 94200 IVRY SUR SEINE', 25, 0, 0, 0, '0603673174', 'tournaire arnaud', '0663036216  '),
(27, 'tournaire', 'swann', '2012-08-24', '0', 'intermédiaire', '10 RUE LOUIS FABLET 94200 IVRY SUR SEINE', 25, 0, 0, 0, '0663036216', 'Lixon Sophie', '0603673174 0663036216'),
(28, 'tournaire', 'sasha', '2012-06-26', '0', 'débutant', '10 RUE LOUIS FABLETS 94200 IVRY SUR SEINE', 25, 0, 0, 0, '0603673174', 'tournaire arnaud', '0663036216 0603673174'),
(29, 'Zakki', 'Samy', '1998-10-14', '01', 'avancé', '1, allée des morelles 91360 Epinay sur orge', 26, 0, 0, 0, '0633782236', 'Zakki Nour-eddine', '0673868940 0619519511'),
(30, 'Chapartegui', 'Clémentine', '2017-11-21', '0', 'intermédiaire', '21, rue Pasteur 94200 Ivry-sur-Seine', 27, 0, 0, 0, 'NGUYEN PHUC Cécile', 'NGUYEN PHUC Cécile', '0652699085  '),
(31, 'Chapartegui', 'Jean-Emmanuel', '1986-06-25', '1', 'avancé', '21, rue Pasteur 94200 Ivry-sur-Seine', 27, 0, 1, 1, '0669403738', 'NGUYEN PHUC Huy Duyen', '0652699085  '),
(32, 'DJEDDA', 'Fares', '2015-02-17', '1', 'intermédiaire', '179 boulevard de stalingrad 94200 IVRY SUR SEINE', 28, 0, 0, 0, '0782592780', 'DJEDDA Mourad DJEDDA Nora', '0618295822 0782592780'),
(33, 'Fiel', 'Antoine', '1990-08-28', '1', 'avancé', '20 Rue Bénard 75014 PARIS 14', 29, 0, 0, 0, '+33612621523', 'Fiel Viviane', '0685192988  '),
(34, 'Julienne', 'Charlène', '1986-07-28', '0', 'débutant', '5 avenue de Longjumeau 91360 Villemoisson sur orge', 30, 0, 0, 0, '0682876704', 'Delon Christophe', '0679964872  '),
(35, 'Joseph', 'Raoul', '1987-09-01', '1', 'avancé', '105 Boulevard Victor Hugo 92110 Clichy', 31, 0, 0, 0, '+33614166018', 'Brédat Patrick', '0616134944  '),
(36, 'Weinland', 'Liza', '1993-07-02', '0', 'débutant', '75 B2 rue Marat 94200 Ivry Sur Seine', 32, 0, 0, 0, '0609827661', 'Thiltges Charlie', '0677656271  '),
(37, 'LE GAC', 'Anne-Audrey', '1988-11-13', '0', 'débutant', '2C Avenue de la Chesnaie, 91230 MONTGERON', 33, 0, 0, 0, '0761461650', 'Milesi Nicolas', '0681578472  '),
(38, 'BEN ICHOU - LEPRINCE', 'SAUL', '2017-01-06', '1', 'avancé', '43 RUE DES FRERES BLAIS 94200 IVRY SUR SEINE', 34, 0, 0, 0, '0626454992', 'CHLOE LEPRINCE MATHIEU BEN ICHOU', '0665523836 0626454992'),
(39, 'BEN ICHOU - LEPRINCE', 'ISMAEL', '2013-07-31', '0', 'débutant', '43 RUE DES FRERES BLAIS 94200 IVRY SUR SEINE', 34, 0, 0, 0, '0626454992', 'CHLOE LEPRINCE MATHIEU BEN ICHOU', '0665523836 0626454992'),
(40, 'Soubielle-Fourie', 'Charline', '1998-11-15', '0', 'débutant', '16 rue Guyton de Morveau 75013 Paris', 35, 0, 0, 0, '0629172773', 'Soubielle-Fourie Charline', '0617060860 0609103737'),
(41, 'Mouliney', 'Maxime', '1991-11-04', '0', 'débutant', '12A rue des dorés 91360 Épinay-sur-Orge', 36, 0, 0, 0, '0629748314', 'Eyang Élodie', '06 08 47 14 50  '),
(42, 'Kamtchueng', 'Toko', '1987-01-14', '0', 'débutant', '14 rue Manin 75019 Paris', 37, 0, 1, 1, '0642010973', 'Kamtchueng Toko', '0642010973  '),
(43, 'Bounleng', 'David', '1985-06-30', '0', 'débutant', '2 avenue saint-maurice du Valais 94410 Saint-maurice', 38, 0, 0, 1, '0612165244', 'Bounleng Joël', '0612870497  '),
(44, 'AUSSET', 'Margot', '2012-06-27', '0', 'débutant', '23 rue Jean-Jacques ROUSSEAU 94200 Ivry sur seine', 39, 0, 0, 0, '0769839694', 'BENARD Yvon', '0685563266  '),
(45, 'Hernando', 'Malik', '2010-04-25', '0', 'débutant', '56 rue du Fort 94400 Vitry sur seine', 40, 0, 0, 0, '0649825469', 'Bennani / Hernando Dounia / Jessy', '0649825469 0623114903'),
(46, 'Duarte', 'Lucie', '1990-02-28', '0', 'débutant', '12 rue du docteur goujon 75012 Paris', 41, 0, 0, 0, '0687117510', 'Duarte Marc', '0614612543  '),
(47, 'Taillebrest', 'François', '1985-03-07', '0', 'débutant', '30 rue saint Claude 93190 Livry-Gargan', 42, 0, 1, 0, 'Taillebrest Elisabeth / Loïc', 'Taillebrest Elisabeth / Loïc', '0344499807 0676632646'),
(48, 'Trouvé ', 'Mélanie ', '1996-04-03', '0', 'débutant', '251 avenue Daumesnil 75012 Paris', 43, 0, 0, 0, '0659921206', 'Azémar Léo', '0633168315  '),
(49, 'RIFAFUD', 'CELIA', '1973-07-16', '0', 'débutant', '75 BIS AVENUE DANIELLE CASANOVA 94200 IVRY SUR SEINE', 44, 0, 0, 0, '0608217585', 'CASTRO ANDREA', '0677133399  '),
(50, 'Tripault', 'Fabrice', '1978-10-04', '0', 'débutant', '34 rue de Picpus 75012 PARIS', 45, 0, 0, 0, '0662078978', 'Tripault Marie-Rose', '0612392868  '),
(51, 'Revilloud', 'Marc', '1986-06-25', '0', 'débutant', '34 rue auguste demmler 92340 Bourg la reine', 46, 0, 0, 0, '0689616028', 'Suissa Myriam', '0682351487  '),
(52, 'henry', 'mary', '1986-09-29', '0', 'débutant', '40 Rue Marat 94200 Ivry Sur Seine', 47, 0, 0, 0, '0760586746', 'henry Annick', '0660501557  '),
(53, 'LACOMBE LAROCHE', 'Gabriel', '2013-05-10', '0', 'débutant', '43 rue Jules Lagaisse - Esc A 94400 Vitry-sur-Seine', 48, 0, 0, 0, '0627949246', 'LACOMBE Florian', '0627949246 0627247774'),
(54, 'Eschenauer', 'Zeli', '2012-02-08', '0', 'débutant', '20 rue Pierre Rigaud 94200 Ivry sue Seine', 49, 0, 0, 0, '0619925885', 'Bonomo Nina', '0619925885 0607694973'),
(55, 'Alloing', 'Marie ', '1992-01-10', '0', 'débutant', '2 bis rue de la révolution 92400 Ivry-sur-seine', 50, 0, 0, 0, '0645048560', 'Alloing Ourdia', '0676747830  '),
(56, 'Lemaire', 'Nicolas', '1991-08-10', '0', 'débutant', '8 rue jules Edouard Voisembert 92130 Issy Les Moulineaux', 51, 0, 0, 0, '0782085648', 'Allain Mathilde', '0646876826  '),
(57, 'Griveau', 'Johanna', '1988-06-15', '0', 'débutant', '9 rue Pierre et Marie curie 94200 Ivry sur seine', 52, 0, 0, 0, '0671414589', 'Griveau Griveau', 'Griveau  '),
(58, 'vuillerme', 'nicolas', '1994-06-06', '0', 'débutant', '8 rue marie benoist 75012 PARIS', 53, 0, 0, 0, '0626964655', 'Gesquiere Hortense', '0667467089  '),
(59, 'Crozat', 'Noemie', '1998-09-03', '0', 'débutant', '1 rue Léon 75018 Paris', 54, 0, 0, 0, '0652929904', 'Dehais Etienne', '+33647553237  '),
(60, 'Bocos', 'Sebastien ', '1981-06-15', '0', 'débutant', '107 rue Bobillot 75013 Paris', 55, 0, 0, 0, '0786184002', 'Babeau Camille', '0664873882  '),
(61, 'Alcolei', 'Aurore', '1992-11-27', '0', 'débutant', '15 rue Paul Bert 94200 Ivry-Sur-Seine', 56, 0, 0, 0, '0686695750', 'Alcolei Françoise', '0683665541  '),
(62, 'Caroujel', 'Clement-jeremy', '1987-06-08', '0', 'débutant', '85 Rue Carnot 92300 Levallois Perret', 57, 0, 0, 0, '0614713208', 'BIREAUD Jennifer', '+33 6 69 27 47 24  '),
(63, 'Rougelin', 'Angèle ', '1999-08-15', '0', 'débutant', '96 Rue de Paris 92190 Meudon', 58, 0, 0, 0, '+33647767756', 'Ribault Mathilde', '0629553894  '),
(64, 'Aubertin', 'Arthur', '1990-02-27', '0', 'débutant', '2 bis rue de la révolution 94200 IVRY SUR SEINE', 59, 0, 0, 0, '0684902268', 'Alloing Marie', '06 45 04 85 60  '),
(65, 'Petot', 'Marylou', '1993-11-14', '0', 'débutant', '5 boulevard Davout 75020 PARIS', 60, 0, 0, 0, '+33618404987', 'Joly Clémence', '+33 6 78 92 47 57  '),
(66, 'Le Gouez', 'Mélanie', '1996-11-22', '0', 'débutant', '186 avenue Jean Jaures 75019 Paris', 61, 0, 0, 0, '0664748514', 'Berny Madeleine', '0678801656  '),
(67, 'Servier', 'Marion', '1986-12-12', '0', 'débutant', '4 rue Victor Hugo 93100 Montreuil', 62, 0, 0, 0, '0675028432', 'Grandgenevre Vincent', '0687629158  '),
(68, 'Josse', 'Aurélien ', '1980-09-30', '0', 'débutant', '19 RUE Périer 92120 MONTROUGE', 63, 0, 0, 0, '0628463884', 'Fourn Ornella', '0629844710  '),
(69, 'Marrannes', 'Guilhem', '1980-07-13', '0', 'débutant', '10 rue santerre 75012 paris', 64, 0, 0, 0, '0667561721', 'Ly Annie', '0664880220  '),
(70, 'Kuan', 'Aurélie ', '1984-11-28', '0', 'débutant', '91 rue Pierre Brossolette 92500 Rueil-Malmaison', 65, 0, 0, 0, '0623400212', 'Brandibat Mathieu', '0617394512  '),
(71, 'Johnson', 'Victoria', '2018-05-07', '0', 'débutant', '10 avenue Spinoza 94200 Ivry sur seine', 66, 0, 0, 0, '0618251220', 'Johnson William', '0618251220 0618251220'),
(72, 'Johnson', 'Emmy', '2013-09-10', '0', 'débutant', '10 avenue Spinoza 94200 Ivry sur seine', 66, 0, 0, 0, '0618251220', 'Johnson William', '0618251220 0618251220'),
(73, 'Johnson', 'Paris', '2011-04-02', '0', 'débutant', '10 avenue Spinoza 94200 Ivry sur seine', 66, 0, 0, 0, '0618251220', 'Johnson William', '0622033692 0618251220'),
(74, 'Boubou', ' ', '2000-06-21', '0', 'avancé', '13 rue Mirabeau 94200 Ivry sur Seine', 67, 0, 1, 1, 'Dignat Caroline Dignat Bruno', 'Dignat Caroline Dignat Bruno', '0698894703 0615365522'),
(75, 'Grond', 'Nicolas', '1984-06-14', '0', 'débutant', '35 rue du général Faidherbe 94130 NOGENT SUR MARNE', 68, 0, 0, 0, '0681406587', 'Izquierdo Natalia', '0682639174  '),
(76, 'HUART', 'Lucille', '1997-03-01', '0', 'débutant', '4, rue du Docteur Tuffier 75013 PARIS', 69, 0, 0, 0, '0610147204', 'SERO Mildred', '0603600637 0622107339'),
(77, 'Gisselbrecht', 'erwan', '1977-05-08', '0', 'débutant', '11, Rue des Aqueducs 94250 Gentilly', 70, 0, 0, 0, '0619055872', 'Heuze Vourch Nathalie', '0681721252  '),
(78, 'PLESIMOND CLAIRY', 'MATTHEW', '2012-04-22', '0', 'débutant', '40 RUE MARAT, BAT 1 - 5EME ETAGE - APT 152 94200 IVRY SUR SEINE', 71, 0, 0, 0, '0669029167', 'CLAIRY MYLENE', '069029167 0684111463'),
(79, 'CLAIRY', 'MYLENE', '1986-04-22', '0', 'débutant', '40 RUE MARAT, BAT 1 - 5EME ETAGE - APT 152 94200 IVRY SUR SEINE', 71, 0, 0, 0, '0669029167', 'PLESIMOND JEAN EVANS', '0684111463 0778112724'),
(80, 'Bouvet', 'Michaël', '1991-03-26', '0', 'débutant', '33 Rue du Commandant René Mouchotte 75014 Paris', 72, 0, 0, 0, '0661381160', 'BOUVET Philippe', '0661784917  '),
(81, 'Sabatier', 'Zelie', '2015-09-29', '0', 'débutant', '12 rue Georgette rostaing 94200 Ivry sur seine', 73, 0, 0, 0, '0620406508', 'Sabatier Arnaud', '0620406508 0699257979'),
(82, 'Chagnot', 'Silvère', '1971-09-09', '0', 'débutant', '7 Rue Victor Letalle 75020 Paris', 74, 0, 0, 0, '0628225843', 'Lalande Isabelle', '‭06 65 00 75 11‬ ‭06 10 75 10 70‬'),
(83, 'Bernal', 'Eléonore', '1983-12-01', '0', 'débutant', '95, rue Compans 75019 Paris', 75, 0, 0, 0, '0671601237', 'CLÉMENT Frédéric', '0769861774  '),
(84, 'Arghyris', 'Agathe', '1993-12-16', '0', 'débutant', '6 rue de l\'affiche rouge 94200 Ivry-sur-Seine', 76, 0, 0, 0, '0680505890', 'Charvet Amandine', '0632025384  '),
(85, 'Copinet', 'Yoann', '1979-04-04', '0', 'débutant', '7 bis rue du general faidherbe 94130 Nogent sur marne', 77, 0, 0, 0, '0610091131', 'Copinet Nicole', '0686167834  '),
(86, 'Mespoulède', 'Nolwenn', '1992-12-14', '0', 'débutant', '33 bis, avenue Augustin Dumont 92240 Malakoff', 78, 0, 0, 0, '0601711606', 'Sebaa Ryadh (aka l\'humain)', '0666355001  '),
(87, 'DE CARVALHO', 'OLIVIER', '1974-09-27', '0', 'débutant', '29 rue Louise Aglaé Cretté 94400 Vitry sur seine', 79, 0, 0, 0, '0621405988', 'TAVERNIER ELEN', '0611896861  '),
(88, 'Cigolotti', 'Audrey', '1996-04-10', '0', 'débutant', '4 rue de Navarre 75005 Paris', 80, 0, 0, 0, '0788406075', 'Laure Cigolotti', '0478575423  '),
(89, 'THAI', 'Julien', '2013-05-07', '0', 'débutant', '63 A BLD DE STALINGRAD, Apt A31 94400 Vitry sur seine', 81, 0, 0, 0, '0628350543', 'THAI FABRICE', '0628350543 0628076135'),
(90, 'Daguet', 'Capucine', '1994-10-26', '0', 'débutant', '7 rue Marceau 93100 Montreuil', 82, 0, 0, 0, '0666375768', 'Granjon Guillaume', '+33676161560  '),
(91, 'LEBLOND', 'EMILIE', '2016-03-17', '0', 'débutant', '50 RUE PIERRE ET MARIE CURIE 94200 Ivry Sur Seine', 83, 0, 0, 0, '0621668592', 'TEA Cécile (mère)', '0621668592 0645717495 (père)'),
(92, 'COTTO', 'Alice', '2016-07-08', '0', 'débutant', '35 RUE MARCEL LAMANT 94200 IVRY SUR SEINE', 84, 0, 0, 0, '0663259608', 'COTTO OLIVIER', '0663259608 0620513096'),
(93, 'alauzet', 'alexandre', '1979-01-16', '0', 'débutant', '22 rue Bizet 94200 IVRY SUR SEINE', 85, 0, 0, 0, '0650281566', 'Alauzet Laetitia', '0613380823  '),
(94, 'Bakhti', 'Dounia ines', '2014-06-17', '0', 'débutant', '4 Pl. du Général de Gaulle 94200 Ivry-sur-Seine', 86, 0, 0, 0, '0769555188', 'bakhti sarra', '0769555188 0665978963'),
(95, 'ye', 'jiamei', '2017-05-10', '0', 'débutant', '63 rue gabriel péri 94200 ivry sur seine', 87, 0, 0, 0, '0667230101', 'jin juan', '0667230101  '),
(96, 'JIN', 'JUAN', '1985-06-28', '0', 'débutant', '63 rue gabriel péri 94200 ivry sur seine', 87, 0, 0, 0, '0667230101', 'HU YAOFANG', '0761383595  '),
(97, 'Ledoux', 'Léa', '1998-12-13', '0', 'débutant', '49 rue Gabriel Lamé 75012 Paris', 88, 0, 0, 0, '0641762034', 'Ledoux Marianne', '0609402925 0659740475'),
(98, 'Viain', 'Zélie', '2016-04-03', '0', 'débutant', '30 Rue Brongniart 94600 Choisy-le-Roi', 89, 0, 0, 0, '0652944489', 'Windenberger Fanny', '0652944489 0685022853'),
(99, 'Viain', 'Léon', '2013-10-29', '0', 'débutant', '30 Rue Brongniart 94600 Choisy-le-Roi', 89, 0, 0, 0, '0652944489', 'Windenberger Fanny', '0652944489 0685022853'),
(100, 'Viain', 'Francis', '1973-06-10', '0', 'débutant', '30 Rue Brongniart 94600 Choisy-le-Roi', 89, 0, 0, 1, '0685022853', 'Windenberger Fanny', '0652944489  '),
(101, 'Windenberger', 'Fanny', '1985-05-26', '0', 'débutant', '30 rue Brongniart 94600 CHOISY LE ROI', 89, 0, 0, 0, '+33652944489', 'Viain Francis', '0685022853  '),
(102, 'berrabah', 'Sofia', '2013-08-08', '0', 'débutant', '7 rue blaqui 94200 Ivry sur seine', 90, 0, 0, 0, '0676365607', 'Medjoubi Assia', '06 76 36 56 07 06 98 86 04 76'),
(103, 'Medjoubi', 'Camila', '2012-05-20', '0', 'débutant', '7 rue blaqui 94200 Ivry sur seine', 90, 0, 0, 0, '0676365607', 'Medjoubi Assia', '06 76 36 56 07 06 98 86 04 76'),
(104, 'Le Lamer', 'Bérénice', '2015-07-15', '0', 'débutant', '19 rue Louis Fablet 94200 Ivry sur Seine', 13, 0, 0, 0, '0695113506', 'Omnès Le Lamer Virginie', '0695113506 0687285346'),
(105, 'Grivel', 'Eloïse', '2014-03-08', '0', 'débutant', '175 rue Marcel Hartmann 94200 IVRY SUR SEINE', 91, 0, 0, 0, '+33681223435', 'Grivel Mathilde ou Gaëtan', '0681223435 0607668189'),
(106, 'Grivel', 'Mathilde', '1981-08-18', '0', 'débutant', '175 rue Marcel Hartmann 94200 IVRY SUR SEINE', 91, 0, 0, 1, '+33681223435', 'Grivel Gaëtan', '0607668189  '),
(107, 'Foucault', 'camille', '2013-05-07', '0', 'débutant', '185 rue marcel hartmann 94200 IVRY SUR SEINE', 92, 0, 0, 0, '0666343036', 'lecomte dorothée', '06 66 34 30 36 06 89 23 92 79'),
(108, 'Presset', 'Ilse', '2016-08-12', '0', 'débutant', '181 rue Marcel Hartmann 94200 Ivry sur Seine', 93, 0, 0, 0, '0621305417', 'Presset François', '0621305417 0603849225'),
(109, 'Nkemba', 'Goy', '2014-10-26', '0', 'débutant', '65 boullevard  Hyppolyte Marques 94200 Ivry sur seine', 94, 0, 0, 0, '0642434133', 'Nkemba Vivian', '0642434133  '),
(110, 'Marchon', 'Ulysse ', '2013-09-03', '0', 'débutant', '35 rue saint just 94200 Ivry-sur-Seine', 95, 0, 0, 0, '0609693832', 'Leroy Marie', '0609693832 +33 6 61 16 27 53'),
(111, 'Shata', 'Salah', '2015-08-18', '0', 'débutant', '28 avenue Henri Barbusse 94200 Ivry-sur-Seine', 96, 0, 0, 0, '0636369558', 'Lafaye Manon', '0636369558  '),
(112, 'Shata', 'Moustafa', '2017-05-05', '0', 'débutant', '28 avenue Henri Barbusse 94200 Ivry-sur-Seine', 96, 0, 0, 0, '0636369558', 'Lafaye Manon', '0636369558  '),
(113, 'Dobler Trinh Dinh', 'Helena', '2015-12-08', '0', 'débutant', '77 av de Verdun 94200 Ivry-sur-Seine', 97, 0, 0, 0, '0650579535', 'Dobler Sandrine Dobler Danièle', '0650579535 0676635220'),
(114, 'Dobler', 'Sandrine', '1978-05-10', '0', 'débutant', '77 av de Verdun 94200 Ivry-sur-Seine', 97, 0, 0, 0, '0650579535', 'Dobler Danièle Cizeau Thibault', '0676635220 0680131101'),
(115, 'Elamraoui', 'Zoubir', '1977-03-08', '0', 'débutant', '4 allée Chanteclair 94200 Ivry sur seine', 98, 0, 0, 0, '0688080986', 'Basty Léa', '0671156765  '),
(116, 'zyskind', 'Laurène', '1996-04-17', '0', 'débutant', '201 rue de Charenton 75012 Paris', 99, 0, 0, 0, '0635423505', 'Zyskind Isabelle', '0619926826  '),
(117, 'Khaber', 'Naila', '2022-04-15', '0', 'débutant', '11 avenue de verdun 94200 94200 - IVRY SUR SEINE', 100, 0, 0, 0, '0750514043', 'Khaber Angelique', '07 50 51 40 43 0750514825'),
(118, 'Garnier', 'Kilian', '1983-08-05', '0', 'débutant', '7 Rue Léon Blum 94600 CHOISY LE ROI', 101, 0, 0, 0, '+33634465104', 'Audierne Pierre', '+33 7 82 36 64 28  '),
(119, 'Hette-Tronquart', 'Edmée', '2015-04-17', '0', 'débutant', '31, rue Raspail 94200 Ivry-sur-Seine', 102, 0, 0, 0, '0670592003', 'Hette-Tronquart Caroline', '0670592003 0674439749'),
(120, 'guichen', 'Mael', '2014-02-04', '0', 'débutant', '7 rue eugene varlin 94400 VITRY SUR SEINE', 103, 0, 0, 0, '0669454934', 'guichen viviane', '0669454934 0650634649'),
(121, 'Abadou ', 'Massiva', '2010-09-18', '0', 'débutant', '39, rue Camille blanc 94400 Vitry-sur-Seine', 104, 0, 0, 0, '0651383303', 'Abadou Kahina', '0651383303  '),
(122, 'Ducray', 'Nicolas', '1981-03-03', '0', 'débutant', '40 rue de Torcy 75018 Paris', 105, 0, 0, 0, '0665112265', 'Ducray Isabelle', '0663783539  '),
(123, 'Turquier', 'Sybile', '2016-01-27', '0', 'débutant', '5 sentier des Malicots 94200 Ivry sur Seine', 106, 0, 0, 0, '0626650611', 'Rodriguez Marie', '0688683829  '),
(124, 'Turquier', 'Matilda', '2012-06-14', '0', 'débutant', '5 sentier des Malicots 94200 Ivry sur Seine', 106, 0, 0, 0, '0626650611', 'Rodriguez Marie', '0688683829  '),
(125, 'Turquier', 'Benjamin', '1980-02-14', '0', 'débutant', '5 sentier des Malicots 94200 Ivry sur seine', 106, 0, 0, 0, '0626650611', 'Rodriguez Marie', '0688683829  '),
(126, 'EYANG', 'ELODIE', '1992-04-02', '0', 'débutant', '6 RUE HOCHE APT 73 91260 JUVISY SUR ORGE', 107, 0, 0, 0, '0608471450', 'MOULINEY MAXIME', '0629748314  '),
(127, 'Saint-André', 'Alizé', '1993-09-01', '0', 'débutant', '55 boulevard Soult 75012 Paris', 108, 0, 0, 0, '0677336474', 'Carnaille Kevin', '6 10 65 82 49  '),
(128, 'Panjak', 'Liza', '2015-11-16', '0', 'débutant', '6 Villa Nieuport 75013 Paris', 109, 0, 0, 0, '0772595539', 'Panjak Nevena', '0782595539 0661005660'),
(129, 'Pelletier', 'Sophie', '1994-04-19', '0', 'débutant', '14, rue roger salengro 94270 Le kremlin bicetre', 110, 0, 0, 0, '0678444198', 'Messalti Abel', '0765784434  '),
(130, 'Rappaport', 'Florian', '1989-05-07', '0', 'débutant', '10 rue des islettes 75018 Paris', 111, 0, 0, 0, '0632075959', 'Driot Julia', '0783800442  '),
(131, 'fuger', 'camille', '1975-03-25', '0', 'débutant', '101 avenue paul doumer 92500 rueil malmaison', 112, 0, 0, 0, '0610795255', 'fenouil fred', '0633140673  '),
(132, 'Guilbert', 'Gaëlle', '1997-09-10', '0', 'débutant', '43 rue marcellin berthelot 93160 noisy le grand', 113, 0, 0, 0, '0780349131', 'Guilbert Maeva', '0611298254  '),
(133, 'Warnuvongs--Bonaventure', 'Maëlys', '2008-11-29', '0', 'débutant', '18 rue Gaston Monmousseau 94200 Ivry-sur-seine', 114, 0, 0, 0, '0660760078', 'Warnuvongs Romain', '0617300232 0675437478'),
(134, 'Tavani', 'Elias', '2014-03-01', '0', 'débutant', '3 avenue du Générale Leclerc 94200 Ivry sur Seine', 115, 0, 0, 0, '0650883775', 'Tavani Maha', '0650883775 0667201521'),
(135, 'Arete', 'Quentin', '2010-11-25', '0', 'débutant', '29 rue Louise Aglaë cretté 94400 Vitry sur seine', 116, 0, 0, 0, '0689116861', 'Tavernier Elen', '0689116861 0621405988'),
(136, 'De carvalho', 'Emma', '2005-12-27', '0', 'débutant', '29 rue Louise Aglaë cretté 94400 Vitry sur seine', 116, 0, 0, 0, '0621405988', 'De carvalho Olivier', '0621405988 0689116861'),
(137, 'CETKOVIC', 'LENA', '2010-10-04', '0', 'débutant', '150 RUE MARCEL HARTMANN 94200 IVRY SUR SEINE', 117, 0, 0, 0, '0786580979', 'CETKOVIC LYDIA', '0786580979 0645365793'),
(138, 'MURA', 'Elliot', '2016-06-18', '0', 'débutant', '7 Allée Mulâtresse Solitude 94200 IVRY SUR SEINE', 118, 0, 0, 0, '0617558000', 'MURA Anthony', '0617558000 0622485781'),
(139, 'Bossu', 'Nicolas', '1975-01-10', '0', 'débutant', '36 rue de la Tranchée 93100 MONTREUIL', 119, 0, 0, 0, '0661868648', 'PAIRE Nathalie', '0673309086  '),
(140, 'Paire', 'Nathalie', '1982-06-04', '0', 'débutant', '36 rue de la Tranchée 93100 MONTREUIL', 119, 0, 0, 0, '0673309086', 'BOSSU Nicolas', '0661868648  '),
(141, 'LANTIER', 'Antoine', '2012-08-24', '0', 'débutant', '51 rue Maurice Gunsbourg 94200 IVRY SUR SEINE', 120, 0, 0, 0, '0661147199', 'LANTIER Anne', '0661147199 0680074604'),
(142, 'LANTIER', 'Clément', '2009-11-21', '0', 'débutant', '51 rue Maurice Gunsbourg 94200 Ivry sur Seine', 120, 0, 0, 0, '0661147199', 'LANTIER Anne', '0661147199 068007464'),
(143, 'PILLOT', 'LEO', '2011-09-13', '0', 'débutant', '29 RUE MARCEL LAMANT 94200 IVRY SUR SEINE', 121, 0, 0, 0, '0686838573', 'PILLOT LUDOVIC', '0686838573 0651121622'),
(144, 'LECLERC', 'Sally', '2015-10-19', '0', 'débutant', '4 bis rue de la Révolution 94200 IVRY SUR SEINE', 122, 0, 0, 0, '06 50 98 19 50', 'ENOUF Emilie', '06 50 98 19 50  '),
(145, 'Dallou', 'Axel', '1985-12-30', '0', 'débutant', '96 bis Boulevard Paul Vaillant Couturier 94200 Ivry-Sur-Seine', 123, 0, 0, 0, '0662960116', 'Marques Priscilia', '0620428478  '),
(146, 'Marques', 'Priscilia', '1985-01-22', '0', 'débutant', '96 bis Boulevard Paul Vaillant Couturier 94200 Ivry-sur-Seine', 123, 0, 0, 0, '0620428478', 'Dallou Axel', '066296016  '),
(147, 'Dallou Marques', 'Suzanne', '2016-05-29', '0', 'débutant', '96 bis Boulevard Paul Vaillant Couturier 94200 Ivry-sur-Seine', 123, 0, 0, 0, '0662960116', 'Dallou Axel', '0662960116 0620428478'),
(148, 'Thielleux', 'Matthieu', '1987-12-12', '0', 'débutant', '4 rue Claude Pernes 93110 Rosny Sous Bois', 124, 0, 0, 0, '+33664179319', 'Bonnerot Laurence', '+33688317436  '),
(149, 'Hanaizi', 'Zahir', '1990-03-19', '1', 'avancé', '70 RUE GEORGE GOSMAT\n94200 IVRY-SUR-SEINE', 125, 0, 1, 0, '06 74 82 11 26', 'A voir', '06 74 82 11 26'),
(150, 'Boulay', 'Priam', '2000-12-22', '0', 'avancé', 'TBD', 126, 0, 1, 0, '+33 7 83 41 01 85', 'TBD', '+33 7 83 41 01 85'),
(151, 'Sidibe', 'Yoro', '1996-03-16', '0', 'avancé', '61 RUE DES PIROGUES DE BERCY\n75012 PARIS 12', 127, 0, 1, 0, '06 58 17 68 96', 'TBD', '06 58 17 68 96'),
(152, 'Riffaud', 'Celia', '1973-07-17', '0', 'débutant', '75avenue Danielle Casanova 94200 ivry sur seine', 128, 2, 0, 0, '0608217585', 'mehdi', '06 08 42 56 02');

-- --------------------------------------------------------

--
-- Table structure for table `saison`
--

CREATE TABLE `saison` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `saison`
--

INSERT INTO `saison` (`id`, `nom`, `active`) VALUES
(1, '2022-2023', 0),
(2, '2023-2024', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seance`
--

CREATE TABLE `seance` (
  `seance_id` int(11) NOT NULL,
  `cours` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `date_seance` date NOT NULL,
  `heure_debut` varchar(10) NOT NULL,
  `duree_cours` int(11) NOT NULL,
  `lieu_id` int(11) NOT NULL,
  `statut` enum('prévue','réalisée','annulée') NOT NULL,
  `age_requis` int(11) NOT NULL,
  `age_maximum` int(11) NOT NULL DEFAULT '99',
  `niveau_requis` enum('débutant','intermédiaire','avancé') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seance`
--

INSERT INTO `seance` (`seance_id`, `cours`, `libelle`, `date_seance`, `heure_debut`, `duree_cours`, `lieu_id`, `statut`, `age_requis`, `age_maximum`, `niveau_requis`) VALUES
(1, 1, NULL, '2023-08-12', '15:34', 90, 1, 'prévue', 0, 0, 'débutant'),
(2, 1, NULL, '2023-08-12', '14:39', 90, 2, 'prévue', 0, 0, 'débutant'),
(3, 1, 'Adultes - RollerSoccer', '2023-08-25', '19:00', 90, 2, 'prévue', 14, 99, 'intermédiaire'),
(4, 3, NULL, '2023-08-17', '15:50', 75, 1, 'prévue', 4, 0, 'débutant'),
(5, 3, NULL, '2023-08-25', '15:50', 75, 1, 'prévue', 4, 0, 'débutant'),
(6, 8, 'Adultes - RollBall', '2023-09-13', '20:30', 90, 2, 'prévue', 14, 99, 'intermédiaire'),
(7, 1, 'Adultes - RollerSoccer', '2023-09-13', '19:00', 90, 2, 'prévue', 14, 99, 'intermédiaire'),
(8, 16, 'Adultes - Roller Derby', '2023-09-11', '20:00', 120, 2, 'prévue', 18, 99, 'débutant'),
(9, 9, 'Adultes - RollerSoccer', '2023-09-13', '19:00', 90, 2, 'prévue', 14, 99, 'intermédiaire'),
(10, 15, 'Adultes - RollBall', '2023-09-13', '20:30', 90, 2, 'prévue', 14, 99, 'intermédiaire'),
(11, 17, 'Adultes - Roller Derby - Jeudi', '2023-09-07', '20:00', 150, 3, 'prévue', 18, 99, 'intermédiaire'),
(12, 10, 'Enfants - Initiation', '2023-09-17', '14:00', 80, 1, 'prévue', 4, 99, 'débutant'),
(13, 14, 'Enfants - Roller Street', '2023-09-17', '15:30', 90, 1, 'prévue', 8, 99, 'intermédiaire'),
(14, 11, 'Enfants - Activités : Multiglisse', '2023-09-17', '16:00', 80, 1, 'prévue', 8, 99, 'intermédiaire'),
(15, 12, 'Adultes - Rollers', '2023-09-17', '14:30', 90, 1, 'prévue', 16, 99, 'débutant'),
(16, 13, 'Enfants - RollerSoccer', '2023-09-17', '17:00', 90, 1, 'prévue', 8, 99, 'intermédiaire');

-- --------------------------------------------------------

--
-- Table structure for table `seance_professeur`
--

CREATE TABLE `seance_professeur` (
  `seance_id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  `statut` enum('présent','présent confirmé','absent','absent confirmé') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seance_professeur`
--

INSERT INTO `seance_professeur` (`seance_id`, `professeur_id`, `statut`) VALUES
(1, 31, 'présent'),
(1, 42, 'présent'),
(2, 42, 'présent'),
(3, 42, 'présent'),
(4, 31, 'présent'),
(4, 42, 'présent'),
(5, 31, 'présent'),
(7, 42, 'présent'),
(6, 24, 'présent'),
(7, 31, 'présent'),
(3, 31, 'présent'),
(8, 74, 'présent'),
(9, 31, 'présent'),
(9, 42, 'présent'),
(10, 24, 'présent'),
(11, 74, 'présent'),
(12, 149, 'présent'),
(12, 151, 'présent'),
(13, 149, 'présent'),
(13, 151, 'présent'),
(14, 150, 'présent'),
(15, 150, 'présent'),
(16, 31, 'présent'),
(16, 151, 'présent');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prof_principal_id` (`prof_principal_id`);

--
-- Indexes for table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personne_id` (`rider_id`),
  ADD KEY `seance_id` (`seance_id`);

--
-- Indexes for table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riders`
--
ALTER TABLE `riders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saison`
--
ALTER TABLE `saison`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`seance_id`),
  ADD KEY `cours_id` (`cours`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lieu`
--
ALTER TABLE `lieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `riders`
--
ALTER TABLE `riders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `saison`
--
ALTER TABLE `saison`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seance`
--
ALTER TABLE `seance`
  MODIFY `seance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

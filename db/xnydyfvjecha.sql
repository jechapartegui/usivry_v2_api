-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : xnydyfvjecha.mysql.db
-- Généré le : dim. 29 oct. 2023 à 11:32
-- Version du serveur : 5.7.42-log
-- Version de PHP : 8.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `xnydyfvjecha`
--

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registration_date` date NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `login`, `password`, `registration_date`, `mail_active`) VALUES
(2, 'nora.youcefi@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(3, 'lorrainefaure@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(4, 'sabbarnabe@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(5, 'laurine.annon@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(6, 'Emiliefairet@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(7, 'camille.clmt94@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(8, 'jolalko@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(9, 'clementine.ripault@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(10, 'geraldigne@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(11, 'cthiltges@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(12, 'sdliberafr@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(13, 'nine143@hotmail.com', '632096c46e888670aedb718978712eda52de411db528d25ffec4132b6f61716c', '2023-08-04', 1),
(14, 'nahema.pvh@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(15, 'meidi.lakrout@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(16, 'leadorion@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(17, 'v.tezier@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(18, 'gaaile@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(19, 'mauud.br@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(20, 'alice.desindes@sncf.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(21, 'Jess8billard@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(22, 'elka.weibel13@gmail.com', 'ef26835d7ed32ff01a45f727dc9e04b1e2e536687572aabf52ee14b1d6ac1a7e', '2023-08-04', 1),
(23, 'Laurie.lprte@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(24, 'marie.elmkhanter@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(25, 'arnaudtournaire@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(26, 'Samy.zakki@outlook.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(27, 'jechapartegui@gmail.com', 'e64f5e4dcc3457faf4e829f18e3bc1fbbec5221f5a6ddb8f754110a05ac294d3', '2023-08-04', 1),
(28, 'noraayad@msn.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(29, 'antoine.fiel@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(30, 'charlene.julienne@free.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(31, 'raoul.jo@gmail.com', 'd1763725ed30b45e1bf0cc95b06a05bda2e7668fbf072250fb92fd0dc418a4c2', '2023-08-04', 0),
(32, 'weinland.liza@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(33, 'ddlegac@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(34, 'mathieubench@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(35, 'charline.s.fourie@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(36, 'maxime.mouliney@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(37, 'tokokam@yahoo.fr', '4ced13f897bb3480ede856aae214fcf7e4f14681dd267abf4651ff4e31f65b94', '2023-08-04', 1),
(38, 'david.bounleng@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(39, 'yvon@ncdecor.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(40, 'doudychkaya@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(41, 'duartelucie3@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(42, 'francois.taillebrest@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(43, 'melanie.trouv@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(44, 'ellisosndo@me.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(45, 'chezlich-roller@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(46, 'marc.revilloud@laposte.net', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(47, 'maryhenry566@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(48, 'florian_pr@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(49, 'ninabonomo@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(50, 'marie.alloing@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(51, 'nicolaa94100@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(52, 'Griveaujohanna@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(53, 'n.vuillerme@live.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(54, 'noemiecrozat@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(55, 'webexplorer8@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(56, 'alcolei.aurore@sfr.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(57, 'cj.caroujel@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(58, 'angelero32@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(59, 'arthur_aubertin@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(60, 'maryloupetot@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(61, 'camille.legouez1@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(62, 'Marionservier@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(63, 'aurelien.josse@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(64, 'Guilhem.marrannes@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(65, 'aureliekuan@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(66, 'andrea228@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(67, 'ch.dignat@outlook.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(68, 'nicolas.gr.contact@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(69, 'lucillehuart@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(70, 'gisselbrecht_e@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(71, 'clairy.mylene@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(72, 'bouvetmichael94@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(73, 'absabatier@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(74, 'sugar.rush@silvere.net', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(75, 'eleonorebernal@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(76, 'agathe.arghyris@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(77, 'yoann.copinet@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(78, 'nolwenn.mespoulede@rocketmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(79, 'olivedc94@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(80, 'cigolottiaudrey@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(81, 'fabricethai@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(82, 'capucine.daguet@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(83, 'cecile-tea@wanadoo.fr', 'c2e3ee68aa78d5194fb7f161841457ac00e5851369c0ced31905d274fe5e4350', '2023-08-04', 1),
(84, 'ocotto@live.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(85, 'alexandre.alauzet@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(86, 'bakhti.sarra94@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(87, 'juanjin@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(88, 'lea.ledoux14@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(89, 'fannywinden@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(90, 'assia_berrabah@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(91, 'mathilde.grivel@gmail.com', '9da95e413c94b968c3dd337da14d090258f2384fcdb2589c7a1989b23c3b566e', '2023-08-04', 1),
(92, 'do-lecomte@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(93, 'francois@presset.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(94, 'vivian.nkemba@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(95, 'marieleroy9@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(96, 'manon.lafaye.archi@gmail.com', 'bab0200e464923b636b4ea2dce2e3a635d1ca14af84bde1b41b74022412c2d75', '2023-08-04', 1),
(97, 'Sardineallo@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(98, 'e.zoubir@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(99, 'laurene.zyskind@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(100, 'angelique.khaber@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(101, 'nailikg@gmail.com', '7283a51d86ab64d70441f25314dc39d844cf84f6d362c9b2d5e9c6efe9e9440e', '2023-08-04', 1),
(102, 'caroline.tronquart@orange.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(103, 'vivianeguichen@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(104, 'ykahina06@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(105, 'ducray.nicolas@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(106, 'benjamin.turquier@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(107, 'elodie.eyang@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(108, 'alize.saintandre@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(109, 'nevenavuckovica@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(110, 'sophie.pelletier971@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(111, 'florian.rappaport@gadz.org', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(112, 'camillefuger@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 0),
(113, 'guilbertgaelle@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(114, 'rmn.wrnvngs@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(115, 'tavanimaha@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(116, 'elentavernier@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(117, 'lydia.cekovic@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(118, 'murarety@outlook.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(119, 'nbossu@netscape.net', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(120, 'anne.lantier1@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(121, 'hasna.pillot@yahoo.fr', '481ca6bb8db35fa957d1929286d47fae730a3d27210d6ca8b2c64ad899ad0b38', '2023-08-04', 1),
(122, 'emilie.enouf@aliceadsl.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(123, 'Aprisciel@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(124, 'matthieu.thielleux@laposte.net', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-08-04', 1),
(125, 'zahirhanaizi@gmail.com', '7adc698e468d6453ef651fb2585b4e7a8af06b2d102c67510248ae7a9b714ae5', '2023-09-07', 1),
(126, 'Priam-boulay@orange.fr', '8e6243ccb0f8e45ab007c173d6deb8ef4fe895d4e003cad5cdb37cc65389164b', '2023-09-07', 1),
(127, 'yorosidibe@outlook.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-09-07', 1),
(128, 'ellissondo@me.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-09-07', 1),
(129, 'michau.evelaure@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-09-08', 1),
(130, 'h.robledogruel.15@eigsi.fr', '775a1f24b68f5d458b39b26d919eab8b4c7ce2ff9eec795dcca96b22eef8c6df', '2023-09-11', 0),
(131, 'mlaillier@yahoo.fr', '0aca340adc246190fb1cb16aa2f1adab808fd8b34604065bb155b8a387041acf', '2023-09-11', 1),
(132, 'fny.lefebvre@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 0),
(133, 'camille.blavy@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 0),
(134, 'sovanna94@free.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(135, 'ekullab@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(136, 'Npaire@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 0),
(137, 'Eric_goudreau@yahoo.ca', '24ef9111511ae57cb6c8b90144cc802a41a905515b6874f7262b59714603aa6b', '2023-10-06', 1),
(138, 'acviret@gmail.com', '65409f0166fc06e9cce13b27354e6cc13b8b544dc6b652617010b81a9dea69e2', '2023-10-06', 1),
(139, 'Jabou.sarah@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(140, 'besse.morgane@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 0),
(141, 'hananhsainihajji@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(142, 'zeghmihakim@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(143, 'Joemia.b@laposte.net', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(144, 'fviain@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(145, 'fouz1@msn.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(146, 'romaintord@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(147, 'elodiesegor94@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(148, 'aminata.haidara@yahoo.fr', 'fc5b0ae72d8529aad48231cc01b760c2009be8387e4fe6e320823b2a56cc1928', '2023-10-06', 1),
(149, 'boulle.marion@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(150, 'terzieva.zhenya@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(151, 'magalie.labidi@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(152, 'doce.y.pico@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(153, 'fannybensimon9@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(154, 'Soraia_ines@live.com.pt', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(155, 'annelaure.tichet@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(156, 'lisa.durand5@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 0),
(157, 'castano.nathalia@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(158, 'felipe.ceferino@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(159, 'orestie@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(160, 'bibynette@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(161, 'asmaa_oubis@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(162, 'Ktmala1@hotmail.com', '3750d0dda89b3be32f47ab57def095ff8d3e608d566ebc79a63f7da601ae2fbe', '2023-10-06', 1),
(163, 'sisourat.nicolas@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(164, 'fatou471@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(165, 'weberfranck@hotmail.fr', '6627c82773201830acea9c5354317591505e2def58d2a73ed302464e80de69a6', '2023-10-06', 1),
(166, 'dubbbbb@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(167, 'arthur.zavaro@gadz.org', '35a4da163d0ab7023eba54de178ac90cc586bdfa9a6ebde8e3c515c0d21f919d', '2023-10-06', 0),
(168, 'miralles.yuna@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(169, 'S.K.ALICIA@OUTLOOK.FR', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(170, 'Bahraoui@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(171, 'ninamaka86@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(172, 'ninon.daguenet@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(173, 'mlmelchior@protonmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(174, 'foudils@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(175, 'raphou84@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 0),
(176, 'mmiklas68@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(177, 'amandinequenel@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(178, 'doubdel@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(179, 'lana.beevi@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(180, 'rouzautmarie@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 1),
(181, 'victoria.yanes@cegetel.net', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-06', 0),
(182, 'wendolyn.trogneux@sciencespo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-07', 0),
(183, 'gbeaa@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-07', 1),
(189, 'rebecca.deprez@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-08', 1),
(190, 'Mhouguet@dms-ascenseurs.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-08', 1),
(187, 'julie.senkow@wanadoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-07', 1),
(188, 'jajananou@hotmail.fr', '03e1c3f664bee120bd52238f4cd5d3ee511806cd5736ed9cb37b2dfa28a6a005', '2023-10-08', 1),
(191, 'natatefo94@hotmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-08', 1),
(192, 'stephanie.hurtadogil2407@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-08', 1),
(193, 'meghiref.karima@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-08', 1),
(194, 'isa4belle@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-10', 1),
(195, 'cherifaguerfi@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-10', 1),
(196, 'djibiole@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-10', 1),
(197, 'adrien.princet@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-15', 1),
(198, 'moriceerika@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-15', 0),
(199, 'mezzins@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-15', 0),
(200, 'sarahjosserand@gmail.com', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-15', 0),
(201, 'antoniopinto3@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-15', 1),
(202, 'Lauresedivina@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-24', 1),
(203, 'orianne-ld@hotmail.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-24', 0),
(204, 'sophilix@yahoo.fr', '1d3dc74dffb44ef6576a771af32d3b3b99ac9c554b1bf698b86a3c0fbf7d8619', '2023-10-24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `cours`
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
  `niveau_requis` set('débutant','intermédiaire','avancé') NOT NULL,
  `saison_id` int(11) NOT NULL,
  `place_maximum` int(11) DEFAULT NULL,
  `convocation_nominative` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `nom`, `jour_semaine`, `heure`, `duree`, `prof_principal_id`, `lieu_id`, `age_requis`, `age_maximum`, `niveau_requis`, `saison_id`, `place_maximum`, `convocation_nominative`) VALUES
(1, 'Adultes - RollerSoccer', 'mercredi', '19:00', 90, 31, 2, 14, NULL, 'intermédiaire', 1, NULL, 0),
(3, 'Enfants - Initiation', 'dimanche', '14:00', 80, 31, 1, 4, NULL, 'débutant', 1, NULL, 0),
(4, 'Enfants - Activités : Multiglisse', 'dimanche', '16:00', 80, 31, 1, 8, NULL, 'intermédiaire', 1, NULL, 0),
(5, 'Adultes - Rollers', 'dimanche', '14:30', 90, 31, 1, 16, NULL, 'débutant', 1, NULL, 0),
(6, 'Enfants - RollerSoccer', 'dimanche', '17:00', 90, 31, 1, 8, NULL, 'intermédiaire', 1, NULL, 0),
(7, 'Enfants - Roller Street', 'dimanche', '15:30', 90, 31, 1, 8, NULL, 'intermédiaire', 1, NULL, 0),
(8, 'Adultes - RollBall', 'mercredi', '20:30', 90, 24, 2, 14, NULL, 'intermédiaire', 1, NULL, 0),
(9, 'Adultes - RollerSoccer', 'mercredi', '19:00', 90, 31, 2, 13, NULL, 'intermédiaire,avancé', 2, NULL, 0),
(10, 'Enfants - Initiation', 'dimanche', '14:00', 80, 151, 1, 3, NULL, 'débutant,intermédiaire', 2, NULL, 0),
(11, 'Enfants - Activités : Multiglisse', 'dimanche', '16:00', 80, 150, 1, 6, NULL, 'débutant,intermédiaire,avancé', 2, NULL, 0),
(12, 'Adultes - Rollers', 'dimanche', '14:30', 90, 150, 1, 15, NULL, 'débutant,intermédiaire,avancé', 2, NULL, 0),
(13, 'Enfants - RollerSoccer', 'dimanche', '17:00', 90, 151, 1, 8, NULL, 'intermédiaire,avancé', 2, NULL, 0),
(14, 'Enfants - Roller Street', 'dimanche', '15:30', 90, 151, 1, 8, NULL, 'intermédiaire,avancé', 2, NULL, 0),
(15, 'Adultes - RollBall', 'mercredi', '20:30', 90, 24, 2, 14, NULL, 'intermédiaire,avancé', 2, NULL, 0),
(16, 'Adultes - Roller Derby - Lundi', 'lundi', '20:00', 150, 74, 2, 18, NULL, 'débutant,intermédiaire,avancé', 2, NULL, 0),
(17, 'Adultes - Roller Derby - Jeudi', 'jeudi', '20:00', 150, 74, 3, 18, NULL, 'intermédiaire,avancé', 2, NULL, 0),
(18, 'Adultes - Roller Derby Samedi', 'samedi', '10:00', 120, 74, 3, 18, NULL, 'intermédiaire,avancé', 2, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

CREATE TABLE `groupes` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `saison_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `groupes`
--

INSERT INTO `groupes` (`id`, `nom`, `saison_id`) VALUES
(1, 'RollerSoccer adultes', 2);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
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
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `rider_id`, `seance_id`, `date_inscription`, `statut`, `statut_seance`) VALUES
(2, 30, 4, '2023-08-18', 'présent', NULL),
(4, 31, 3, '2023-08-18', 'absent', NULL),
(5, 116, 6, '2023-09-04', NULL, 'absent'),
(6, 23, 6, '2023-09-07', 'absent', NULL),
(7, 23, 7, '2023-09-07', 'présent', NULL),
(8, 30, 12, '2023-09-07', 'présent', NULL),
(9, 31, 9, '2023-09-07', 'présent', 'présent'),
(10, 31, 10, '2023-09-07', 'présent', 'présent'),
(11, 31, 17, '2023-09-08', 'présent', 'présent'),
(12, 115, 17, '2023-09-08', NULL, 'présent'),
(13, 35, 17, '2023-09-08', NULL, 'présent'),
(14, 42, 17, '2023-09-08', NULL, 'présent'),
(15, 99, 17, '2023-09-08', NULL, 'présent'),
(16, 100, 17, '2023-09-08', NULL, 'présent'),
(17, 151, 17, '2023-09-08', NULL, 'présent'),
(18, 149, 17, '2023-09-08', NULL, 'présent'),
(19, 43, 17, '2023-09-08', NULL, 'présent'),
(20, 43, 9, '2023-09-14', NULL, 'présent'),
(21, 115, 9, '2023-09-14', NULL, 'présent'),
(22, 149, 9, '2023-09-14', NULL, 'absent'),
(23, 35, 9, '2023-09-14', NULL, 'présent'),
(24, 42, 9, '2023-09-14', NULL, 'présent'),
(25, 151, 9, '2023-09-14', NULL, 'absent'),
(26, 100, 9, '2023-09-14', NULL, 'absent'),
(27, 31, 18, '2023-09-20', 'présent', 'présent'),
(28, 31, 19, '2023-09-20', 'présent', 'présent'),
(29, 31, 31, '2023-10-06', 'présent', 'présent'),
(30, 31, 37, '2023-10-06', 'présent', NULL),
(31, 31, 32, '2023-10-06', 'présent', 'présent'),
(32, 31, 38, '2023-10-06', 'présent', NULL),
(33, 30, 28, '2023-10-06', 'présent', 'présent'),
(34, 30, 34, '2023-10-06', 'présent', 'présent'),
(35, 202, 27, '2023-10-06', 'présent', 'présent'),
(36, 202, 33, '2023-10-06', 'présent', 'présent'),
(37, 179, 28, '2023-10-06', 'absent', NULL),
(38, 233, 27, '2023-10-06', 'présent', 'présent'),
(39, 233, 33, '2023-10-06', 'présent', 'présent'),
(40, 105, 28, '2023-10-06', 'absent', NULL),
(41, 179, 29, '2023-10-06', 'absent', NULL),
(42, 18, 32, '2023-10-06', 'présent', 'présent'),
(43, 18, 38, '2023-10-06', 'présent', NULL),
(44, 98, 28, '2023-10-06', 'absent', NULL),
(45, 98, 34, '2023-10-06', 'présent', 'présent'),
(46, 99, 36, '2023-10-06', 'présent', 'présent'),
(47, 99, 35, '2023-10-06', 'présent', 'présent'),
(48, 99, 29, '2023-10-06', 'absent', NULL),
(49, 104, 34, '2023-10-06', 'présent', 'présent'),
(50, 104, 36, '2023-10-06', 'présent', 'présent'),
(51, 104, 30, '2023-10-06', 'présent', 'présent'),
(52, 104, 28, '2023-10-06', 'présent', 'présent'),
(53, 14, 39, '2023-10-06', 'présent', 'présent'),
(54, 14, 38, '2023-10-06', 'absent', NULL),
(55, 31, 39, '2023-10-06', 'absent', NULL),
(56, 31, 40, '2023-10-06', 'absent', NULL),
(57, 105, 27, '2023-10-06', 'absent', NULL),
(58, 105, 30, '2023-10-06', 'absent', 'absent'),
(59, 105, 29, '2023-10-06', 'absent', NULL),
(60, 192, 27, '2023-10-06', 'présent', 'présent'),
(61, 192, 33, '2023-10-06', 'présent', 'présent'),
(62, 106, 39, '2023-10-06', 'absent', NULL),
(63, 193, 27, '2023-10-06', 'présent', 'présent'),
(64, 193, 33, '2023-10-06', 'présent', 'présent'),
(65, 161, 27, '2023-10-06', 'présent', 'présent'),
(66, 161, 28, '2023-10-06', 'présent', 'présent'),
(67, 207, 27, '2023-10-06', 'présent', 'présent'),
(68, 207, 28, '2023-10-06', 'présent', 'présent'),
(69, 208, 27, '2023-10-06', 'présent', 'présent'),
(70, 208, 28, '2023-10-06', 'présent', 'présent'),
(71, 91, 28, '2023-10-06', 'présent', 'présent'),
(72, 91, 34, '2023-10-06', 'absent', NULL),
(73, 91, 27, '2023-10-06', 'absent', NULL),
(74, 91, 33, '2023-10-06', 'absent', NULL),
(75, 114, 39, '2023-10-06', 'présent', 'présent'),
(76, 169, 27, '2023-10-06', 'présent', 'présent'),
(77, 169, 33, '2023-10-06', 'présent', 'présent'),
(78, 169, 28, '2023-10-06', 'absent', NULL),
(79, 169, 34, '2023-10-06', 'absent', NULL),
(80, 195, 27, '2023-10-06', 'présent', 'présent'),
(81, 195, 33, '2023-10-06', 'présent', 'présent'),
(82, 230, 27, '2023-10-06', 'absent', NULL),
(83, 230, 34, '2023-10-06', 'présent', NULL),
(84, 230, 28, '2023-10-06', 'absent', NULL),
(85, 230, 33, '2023-10-06', 'absent', NULL),
(86, 218, 39, '2023-10-06', 'présent', 'présent'),
(87, 218, 40, '2023-10-06', 'présent', 'présent'),
(88, 217, 27, '2023-10-06', 'présent', 'présent'),
(89, 217, 28, '2023-10-06', 'absent', NULL),
(90, 217, 34, '2023-10-06', 'absent', NULL),
(91, 217, 33, '2023-10-06', 'absent', NULL),
(92, 231, 27, '2023-10-06', 'présent', 'présent'),
(93, 231, 33, '2023-10-06', 'présent', 'présent'),
(94, 231, 28, '2023-10-06', 'présent', 'présent'),
(95, 231, 34, '2023-10-06', 'présent', 'absent'),
(96, 232, 27, '2023-10-06', 'présent', 'présent'),
(97, 232, 33, '2023-10-06', 'présent', 'présent'),
(98, 232, 28, '2023-10-06', 'présent', 'présent'),
(99, 232, 34, '2023-10-06', 'présent', 'présent'),
(100, 191, 39, '2023-10-07', 'absent', NULL),
(101, 191, 40, '2023-10-07', 'présent', NULL),
(102, 184, 27, '2023-10-07', 'présent', 'présent'),
(103, 184, 33, '2023-10-07', 'présent', 'présent'),
(104, 185, 27, '2023-10-07', 'présent', 'présent'),
(105, 185, 33, '2023-10-07', 'présent', 'présent'),
(106, 186, 27, '2023-10-07', 'présent', 'présent'),
(107, 186, 33, '2023-10-07', 'présent', 'présent'),
(108, 186, 28, '2023-10-07', 'présent', 'présent'),
(109, 186, 34, '2023-10-07', 'présent', 'présent'),
(110, 177, 27, '2023-10-07', 'présent', 'présent'),
(111, 177, 33, '2023-10-07', 'présent', 'présent'),
(112, 238, 33, '2023-10-07', 'présent', 'présent'),
(113, 238, 27, '2023-10-07', 'présent', 'présent'),
(114, 210, 27, '2023-10-07', 'présent', 'présent'),
(115, 210, 34, '2023-10-07', 'présent', NULL),
(116, 209, 27, '2023-10-07', 'présent', 'présent'),
(117, 209, 33, '2023-10-07', 'présent', 'présent'),
(118, 209, 28, '2023-10-07', 'absent', NULL),
(119, 209, 34, '2023-10-07', 'absent', NULL),
(120, 167, 27, '2023-10-07', 'présent', 'présent'),
(121, 168, 27, '2023-10-07', 'présent', 'présent'),
(122, 223, 27, '2023-10-07', 'présent', 'présent'),
(123, 223, 29, '2023-10-07', 'présent', 'présent'),
(124, 223, 33, '2023-10-07', 'présent', 'présent'),
(125, 223, 35, '2023-10-07', 'présent', 'présent'),
(126, 99, 28, '2023-10-07', 'absent', NULL),
(127, 243, 27, '2023-10-07', 'présent', 'absent'),
(128, 93, 39, '2023-10-07', 'présent', 'présent'),
(129, 244, 39, '2023-10-07', 'présent', 'présent'),
(130, 245, 27, '2023-10-07', 'présent', 'présent'),
(131, 128, 28, '2023-10-08', 'présent', 'présent'),
(132, 128, 34, '2023-10-08', 'présent', 'présent'),
(133, 224, 34, '2023-10-08', 'présent', 'présent'),
(134, 187, 27, '2023-10-08', 'présent', 'présent'),
(135, 203, 27, '2023-10-08', 'présent', 'présent'),
(136, 203, 33, '2023-10-08', 'présent', 'présent'),
(137, 204, 27, '2023-10-08', 'présent', 'présent'),
(138, 204, 33, '2023-10-08', 'présent', 'présent'),
(139, 172, 28, '2023-10-08', 'présent', 'présent'),
(140, 172, 34, '2023-10-08', 'présent', 'présent'),
(141, 234, 27, '2023-10-08', 'présent', 'présent'),
(142, 234, 33, '2023-10-08', 'présent', 'présent'),
(143, 30, 27, '2023-10-08', 'absent', NULL),
(144, 164, 27, '2023-10-08', NULL, 'présent'),
(145, 159, 27, '2023-10-08', NULL, 'présent'),
(146, 165, 27, '2023-10-08', NULL, 'présent'),
(147, 213, 27, '2023-10-08', NULL, 'présent'),
(148, 197, 27, '2023-10-08', NULL, 'présent'),
(149, 198, 27, '2023-10-08', NULL, 'présent'),
(150, 101, 39, '2023-10-08', 'absent', NULL),
(151, 100, 39, '2023-10-08', 'présent', 'présent'),
(152, 215, 27, '2023-10-08', NULL, 'présent'),
(153, 200, 27, '2023-10-08', NULL, 'présent'),
(154, 201, 27, '2023-10-08', NULL, 'présent'),
(155, 181, 27, '2023-10-08', NULL, 'présent'),
(156, 180, 27, '2023-10-08', NULL, 'présent'),
(157, 171, 27, '2023-10-08', NULL, 'présent'),
(158, 229, 27, '2023-10-08', NULL, 'présent'),
(159, 228, 27, '2023-10-08', NULL, 'présent'),
(160, 194, 27, '2023-10-08', NULL, 'présent'),
(161, 212, 28, '2023-10-08', NULL, 'présent'),
(162, 225, 27, '2023-10-08', NULL, 'présent'),
(163, 187, 33, '2023-10-08', 'présent', 'absent'),
(164, 144, 28, '2023-10-08', 'absent', NULL),
(165, 144, 34, '2023-10-08', 'absent', NULL),
(166, 144, 27, '2023-10-08', 'présent', 'présent'),
(167, 200, 28, '2023-10-08', NULL, 'présent'),
(168, 201, 28, '2023-10-08', NULL, 'présent'),
(169, 180, 28, '2023-10-08', NULL, 'présent'),
(170, 181, 28, '2023-10-08', NULL, 'présent'),
(171, 212, 27, '2023-10-08', NULL, 'présent'),
(172, 221, 27, '2023-10-08', NULL, 'présent'),
(173, 253, 27, '2023-10-08', NULL, 'présent'),
(174, 250, 27, '2023-10-08', NULL, 'présent'),
(175, 27, 27, '2023-10-08', NULL, 'présent'),
(176, 28, 27, '2023-10-08', NULL, 'présent'),
(177, 108, 27, '2023-10-08', NULL, 'présent'),
(178, 219, 27, '2023-10-08', NULL, 'présent'),
(179, 199, 39, '2023-10-08', NULL, 'présent'),
(180, 252, 39, '2023-10-08', NULL, 'présent'),
(181, 27, 28, '2023-10-08', NULL, 'présent'),
(182, 250, 28, '2023-10-08', NULL, 'présent'),
(183, 224, 28, '2023-10-08', NULL, 'présent'),
(184, 214, 28, '2023-10-08', NULL, 'présent'),
(185, 205, 28, '2023-10-08', NULL, 'présent'),
(186, 220, 29, '2023-10-08', NULL, 'présent'),
(187, 32, 29, '2023-10-08', NULL, 'présent'),
(188, 104, 29, '2023-10-08', NULL, 'présent'),
(189, 81, 29, '2023-10-08', NULL, 'présent'),
(190, 178, 33, '2023-10-09', 'présent', 'présent'),
(191, 166, 32, '2023-10-09', 'présent', 'présent'),
(192, 166, 38, '2023-10-09', 'présent', NULL),
(193, 166, 40, '2023-10-09', 'absent', NULL),
(194, 166, 31, '2023-10-09', 'absent', NULL),
(195, 166, 37, '2023-10-09', 'absent', NULL),
(196, 143, 36, '2023-10-10', 'présent', 'présent'),
(197, 143, 34, '2023-10-10', 'présent', NULL),
(198, 143, 35, '2023-10-10', 'présent', 'présent'),
(199, 220, 30, '2023-10-10', NULL, 'présent'),
(200, 206, 30, '2023-10-10', NULL, 'présent'),
(201, 32, 30, '2023-10-10', NULL, 'présent'),
(202, 142, 30, '2023-10-10', NULL, 'absent'),
(203, 141, 30, '2023-10-10', NULL, 'absent'),
(204, 143, 30, '2023-10-10', NULL, 'présent'),
(205, 211, 30, '2023-10-10', NULL, 'présent'),
(206, 133, 30, '2023-10-10', NULL, 'présent'),
(207, 30, 30, '2023-10-10', 'présent', NULL),
(208, 30, 30, '2023-10-10', 'présent', NULL),
(209, 30, 30, '2023-10-10', 'présent', 'présent'),
(210, 30, 30, '2023-10-10', 'présent', 'présent'),
(211, 172, 30, '2023-10-10', 'présent', 'présent'),
(212, 172, 30, '2023-10-10', 'présent', 'présent'),
(213, 172, 30, '2023-10-10', 'présent', 'présent'),
(214, 115, 10, '2023-10-10', NULL, 'présent'),
(215, 216, 10, '2023-10-10', NULL, 'présent'),
(216, 18, 10, '2023-10-10', NULL, 'présent'),
(217, 166, 10, '2023-10-10', NULL, 'absent'),
(218, 43, 10, '2023-10-10', NULL, 'absent'),
(219, 35, 10, '2023-10-10', NULL, 'présent'),
(220, 42, 10, '2023-10-10', NULL, 'présent'),
(221, 24, 10, '2023-10-10', NULL, 'présent'),
(222, 151, 10, '2023-10-10', NULL, 'présent'),
(223, 23, 10, '2023-10-10', NULL, 'présent'),
(224, 142, 9, '2023-10-10', NULL, 'présent'),
(225, 43, 19, '2023-10-10', NULL, 'absent'),
(226, 115, 19, '2023-10-10', NULL, 'présent'),
(227, 166, 19, '2023-10-10', NULL, 'absent'),
(228, 149, 19, '2023-10-10', NULL, 'présent'),
(229, 35, 19, '2023-10-10', NULL, 'présent'),
(230, 16, 19, '2023-10-10', NULL, 'présent'),
(231, 24, 19, '2023-10-10', NULL, 'présent'),
(232, 15, 19, '2023-10-10', NULL, 'présent'),
(233, 151, 19, '2023-10-10', NULL, 'absent'),
(234, 18, 19, '2023-10-10', NULL, 'présent'),
(235, 23, 19, '2023-10-10', NULL, 'présent'),
(236, 216, 19, '2023-10-10', NULL, 'présent'),
(237, 115, 18, '2023-10-10', NULL, 'présent'),
(238, 100, 18, '2023-10-10', NULL, 'présent'),
(239, 151, 18, '2023-10-10', NULL, 'présent'),
(240, 42, 18, '2023-10-10', NULL, 'présent'),
(241, 142, 18, '2023-10-10', NULL, 'présent'),
(242, 149, 18, '2023-10-10', NULL, 'présent'),
(243, 35, 18, '2023-10-10', NULL, 'présent'),
(244, 43, 18, '2023-10-10', NULL, 'absent'),
(245, 43, 18, '2023-10-10', NULL, 'présent'),
(246, 19, 39, '2023-10-10', NULL, 'présent'),
(247, 26, 39, '2023-10-10', NULL, 'présent'),
(248, 205, 30, '2023-10-10', 'présent', 'présent'),
(249, 89, 30, '2023-10-10', 'présent', 'présent'),
(250, 23, 32, '2023-10-10', 'présent', 'présent'),
(251, 202, 42, '2023-10-10', 'présent', 'présent'),
(252, 226, 35, '2023-10-10', 'présent', 'présent'),
(253, 226, 44, '2023-10-10', 'présent', 'présent'),
(254, 216, 32, '2023-10-10', 'présent', 'présent'),
(255, 149, 31, '2023-10-11', 'présent', 'présent'),
(256, 149, 32, '2023-10-11', 'présent', 'présent'),
(257, 149, 37, '2023-10-11', 'présent', NULL),
(258, 257, 32, '2023-10-11', 'présent', 'présent'),
(259, 100, 31, '2023-10-11', 'présent', 'présent'),
(260, 100, 40, '2023-10-11', 'absent', NULL),
(261, 101, 40, '2023-10-11', 'présent', 'présent'),
(262, 43, 31, '2023-10-12', NULL, 'présent'),
(263, 142, 31, '2023-10-12', NULL, 'absent'),
(264, 35, 31, '2023-10-12', NULL, 'absent'),
(265, 42, 31, '2023-10-12', NULL, 'présent'),
(266, 18, 31, '2023-10-12', NULL, 'absent'),
(267, 115, 31, '2023-10-12', NULL, 'présent'),
(268, 151, 31, '2023-10-12', NULL, 'absent'),
(269, 135, 31, '2023-10-12', 'présent', NULL),
(270, 135, 31, '2023-10-12', 'présent', 'présent'),
(271, 135, 31, '2023-10-12', 'présent', 'présent'),
(272, 257, 31, '2023-10-12', 'présent', 'présent'),
(273, 43, 32, '2023-10-12', NULL, 'présent'),
(274, 24, 32, '2023-10-12', NULL, 'absent'),
(275, 15, 32, '2023-10-12', NULL, 'présent'),
(276, 35, 32, '2023-10-12', NULL, 'absent'),
(277, 42, 32, '2023-10-12', NULL, 'présent'),
(278, 151, 32, '2023-10-12', NULL, 'absent'),
(279, 115, 32, '2023-10-12', NULL, 'présent'),
(280, 246, 33, '2023-10-13', 'présent', 'présent'),
(281, 247, 33, '2023-10-13', 'présent', 'présent'),
(282, 200, 33, '2023-10-14', 'présent', 'présent'),
(283, 200, 42, '2023-10-14', 'présent', 'présent'),
(284, 201, 33, '2023-10-14', 'présent', 'présent'),
(285, 201, 42, '2023-10-14', 'présent', 'présent'),
(286, 233, 42, '2023-10-14', 'présent', 'présent'),
(287, 14, 40, '2023-10-14', 'présent', 'présent'),
(288, 161, 33, '2023-10-15', 'présent', 'présent'),
(289, 161, 42, '2023-10-15', 'présent', 'absent'),
(290, 207, 33, '2023-10-15', 'présent', 'présent'),
(291, 207, 42, '2023-10-15', 'présent', 'absent'),
(292, 208, 33, '2023-10-15', 'présent', 'présent'),
(293, 208, 34, '2023-10-15', 'présent', 'présent'),
(294, 208, 42, '2023-10-15', 'présent', 'absent'),
(295, 208, 45, '2023-10-15', 'présent', 'présent'),
(296, 105, 33, '2023-10-15', 'absent', NULL),
(297, 105, 34, '2023-10-15', 'présent', 'présent'),
(298, 105, 35, '2023-10-15', 'absent', NULL),
(299, 105, 36, '2023-10-15', 'absent', NULL),
(300, 105, 42, '2023-10-15', 'absent', 'absent'),
(301, 105, 44, '2023-10-15', 'absent', 'absent'),
(302, 105, 45, '2023-10-15', 'absent', NULL),
(303, 106, 40, '2023-10-15', 'présent', 'présent'),
(304, 106, 43, '2023-10-15', 'présent', NULL),
(305, 179, 33, '2023-10-15', 'absent', NULL),
(306, 179, 34, '2023-10-15', 'absent', NULL),
(307, 179, 35, '2023-10-15', 'absent', 'absent'),
(308, 179, 44, '2023-10-15', 'présent', 'présent'),
(309, 179, 36, '2023-10-15', 'absent', NULL),
(310, 179, 37, '2023-10-15', 'absent', NULL),
(311, 179, 42, '2023-10-15', 'absent', 'absent'),
(312, 179, 45, '2023-10-15', 'absent', NULL),
(313, 179, 46, '2023-10-15', 'absent', NULL),
(314, 135, 36, '2023-10-15', 'présent', 'présent'),
(315, 261, 40, '2023-10-15', 'présent', 'présent'),
(316, 262, 33, '2023-10-15', 'absent', NULL),
(317, 112, 33, '2023-10-15', 'absent', NULL),
(318, 261, 43, '2023-10-15', 'présent', 'présent'),
(319, 262, 42, '2023-10-15', 'présent', 'absent'),
(320, 111, 33, '2023-10-15', 'absent', NULL),
(321, 111, 42, '2023-10-15', 'présent', 'absent'),
(322, 112, 42, '2023-10-15', 'présent', 'absent'),
(323, 253, 33, '2023-10-15', 'présent', 'présent'),
(324, 253, 42, '2023-10-15', 'présent', 'présent'),
(325, 215, 33, '2023-10-15', 'présent', 'présent'),
(326, 215, 42, '2023-10-15', 'absent', NULL),
(327, 216, 38, '2023-10-15', 'présent', NULL),
(328, 250, 33, '2023-10-15', 'absent', NULL),
(329, 250, 42, '2023-10-15', 'absent', NULL),
(330, 186, 42, '2023-10-15', 'présent', 'présent'),
(331, 184, 42, '2023-10-15', 'présent', 'présent'),
(332, 185, 42, '2023-10-15', 'présent', 'présent'),
(333, 108, 33, '2023-10-15', 'présent', 'présent'),
(334, 159, 33, '2023-10-15', NULL, 'présent'),
(335, 165, 33, '2023-10-15', NULL, 'présent'),
(336, 164, 33, '2023-10-15', NULL, 'présent'),
(337, 245, 33, '2023-10-15', NULL, 'présent'),
(338, 28, 33, '2023-10-15', NULL, 'présent'),
(339, 27, 33, '2023-10-15', NULL, 'présent'),
(340, 113, 33, '2023-10-15', NULL, 'présent'),
(341, 180, 33, '2023-10-15', NULL, 'présent'),
(342, 181, 33, '2023-10-15', NULL, 'présent'),
(343, 225, 33, '2023-10-15', NULL, 'présent'),
(344, 176, 33, '2023-10-15', NULL, 'présent'),
(345, 236, 33, '2023-10-15', NULL, 'présent'),
(346, 173, 33, '2023-10-15', NULL, 'présent'),
(347, 219, 33, '2023-10-15', NULL, 'présent'),
(348, 174, 33, '2023-10-15', NULL, 'présent'),
(349, 243, 33, '2023-10-15', NULL, 'présent'),
(350, 171, 33, '2023-10-15', NULL, 'présent'),
(351, 248, 33, '2023-10-15', NULL, 'présent'),
(352, 228, 33, '2023-10-15', NULL, 'présent'),
(353, 221, 33, '2023-10-15', NULL, 'présent'),
(354, 222, 33, '2023-10-15', NULL, 'présent'),
(355, 213, 33, '2023-10-15', NULL, 'présent'),
(356, 210, 33, '2023-10-15', NULL, 'présent'),
(357, 251, 33, '2023-10-15', NULL, 'présent'),
(358, 255, 33, '2023-10-15', 'présent', 'présent'),
(359, 256, 33, '2023-10-15', 'présent', 'présent'),
(360, 255, 42, '2023-10-15', 'présent', 'absent'),
(361, 256, 42, '2023-10-15', 'présent', 'absent'),
(362, 150, 40, '2023-10-15', 'présent', 'présent'),
(363, 93, 40, '2023-10-15', NULL, 'présent'),
(364, 19, 40, '2023-10-15', NULL, 'présent'),
(365, 264, 40, '2023-10-15', NULL, 'présent'),
(366, 227, 40, '2023-10-15', NULL, 'présent'),
(367, 114, 40, '2023-10-15', NULL, 'présent'),
(368, 129, 40, '2023-10-15', NULL, 'présent'),
(369, 57, 40, '2023-10-15', NULL, 'présent'),
(370, 100, 37, '2023-10-15', 'présent', NULL),
(371, 174, 34, '2023-10-15', 'présent', NULL),
(372, 174, 34, '2023-10-15', 'présent', NULL),
(373, 174, 34, '2023-10-15', 'présent', NULL),
(374, 174, 34, '2023-10-15', 'présent', NULL),
(375, 174, 34, '2023-10-15', 'présent', NULL),
(376, 174, 34, '2023-10-15', 'présent', NULL),
(377, 174, 34, '2023-10-15', 'présent', NULL),
(378, 174, 34, '2023-10-15', 'présent', 'présent'),
(379, 207, 34, '2023-10-15', 'présent', 'présent'),
(380, 32, 35, '2023-10-15', NULL, 'présent'),
(381, 53, 35, '2023-10-15', NULL, 'présent'),
(382, 89, 35, '2023-10-15', NULL, 'présent'),
(383, 81, 35, '2023-10-15', NULL, 'présent'),
(384, 254, 35, '2023-10-15', NULL, 'absent'),
(385, 135, 35, '2023-10-15', NULL, 'présent'),
(386, 161, 34, '2023-10-15', 'présent', 'présent'),
(387, 27, 34, '2023-10-15', NULL, 'présent'),
(388, 265, 34, '2023-10-15', NULL, 'présent'),
(389, 141, 35, '2023-10-15', NULL, 'présent'),
(390, 142, 35, '2023-10-15', NULL, 'présent'),
(391, 220, 35, '2023-10-15', NULL, 'présent'),
(392, 133, 35, '2023-10-15', NULL, 'présent'),
(393, 180, 34, '2023-10-15', 'présent', 'présent'),
(394, 181, 34, '2023-10-15', 'présent', 'présent'),
(395, 181, 34, '2023-10-15', 'présent', 'présent'),
(396, 201, 34, '2023-10-15', 'présent', 'présent'),
(397, 200, 34, '2023-10-15', 'présent', 'présent'),
(398, 206, 36, '2023-10-15', NULL, 'présent'),
(399, 133, 36, '2023-10-15', NULL, 'présent'),
(400, 89, 36, '2023-10-15', NULL, 'présent'),
(401, 220, 36, '2023-10-15', NULL, 'présent'),
(402, 211, 36, '2023-10-15', NULL, 'présent'),
(403, 142, 36, '2023-10-15', NULL, 'présent'),
(404, 141, 36, '2023-10-15', NULL, 'présent'),
(405, 191, 43, '2023-10-16', 'absent', NULL),
(406, 234, 42, '2023-10-16', 'présent', 'présent'),
(407, 30, 42, '2023-10-16', 'absent', 'absent'),
(408, 30, 45, '2023-10-16', 'absent', NULL),
(409, 30, 46, '2023-10-16', 'absent', NULL),
(410, 30, 36, '2023-10-17', NULL, 'présent'),
(411, 32, 36, '2023-10-17', NULL, 'présent'),
(412, 254, 36, '2023-10-17', NULL, 'présent'),
(413, 205, 36, '2023-10-17', NULL, 'présent'),
(414, 209, 42, '2023-10-17', 'présent', 'présent'),
(415, 209, 49, '2023-10-17', 'présent', NULL),
(416, 202, 49, '2023-10-17', 'présent', NULL),
(417, 246, 42, '2023-10-17', 'présent', 'absent'),
(418, 247, 42, '2023-10-17', 'présent', 'absent'),
(419, 89, 45, '2023-10-17', 'présent', NULL),
(420, 89, 46, '2023-10-17', 'présent', NULL),
(421, 89, 51, '2023-10-17', 'présent', NULL),
(422, 89, 52, '2023-10-17', 'présent', NULL),
(423, 89, 44, '2023-10-17', 'présent', 'absent'),
(424, 31, 47, '2023-10-17', 'absent', NULL),
(425, 31, 48, '2023-10-17', 'absent', NULL),
(426, 257, 37, '2023-10-17', 'présent', NULL),
(427, 257, 38, '2023-10-17', 'présent', NULL),
(428, 91, 45, '2023-10-17', 'absent', NULL),
(429, 91, 51, '2023-10-17', 'présent', NULL),
(430, 91, 42, '2023-10-17', 'absent', NULL),
(431, 91, 49, '2023-10-17', 'absent', NULL),
(432, 91, 46, '2023-10-17', 'absent', NULL),
(433, 91, 52, '2023-10-17', 'absent', NULL),
(434, 42, 37, '2023-10-17', 'présent', NULL),
(435, 42, 38, '2023-10-17', 'présent', NULL),
(436, 23, 37, '2023-10-18', 'absent', NULL),
(437, 23, 38, '2023-10-18', 'présent', NULL),
(438, 23, 48, '2023-10-18', 'présent', NULL),
(439, 213, 42, '2023-10-19', 'présent', 'présent'),
(440, 213, 49, '2023-10-19', 'présent', NULL),
(441, 128, 45, '2023-10-19', 'présent', 'présent'),
(442, 128, 51, '2023-10-19', 'présent', 'présent'),
(443, 238, 42, '2023-10-19', 'présent', 'présent'),
(444, 179, 47, '2023-10-20', 'absent', NULL),
(445, 179, 49, '2023-10-20', 'absent', NULL),
(446, 179, 51, '2023-10-20', 'absent', NULL),
(447, 179, 52, '2023-10-20', 'absent', NULL),
(448, 105, 49, '2023-10-20', 'absent', NULL),
(449, 105, 51, '2023-10-20', 'absent', NULL),
(450, 105, 46, '2023-10-20', 'absent', NULL),
(451, 105, 52, '2023-10-20', 'absent', NULL),
(452, 244, 43, '2023-10-20', 'absent', NULL),
(453, 245, 42, '2023-10-20', 'absent', NULL),
(454, 246, 49, '2023-10-20', 'présent', NULL),
(455, 247, 49, '2023-10-20', 'présent', NULL),
(456, 233, 49, '2023-10-21', 'absent', NULL),
(457, 195, 42, '2023-10-21', 'présent', 'présent'),
(458, 210, 42, '2023-10-21', 'présent', 'présent'),
(459, 193, 42, '2023-10-21', 'présent', 'présent'),
(460, 192, 42, '2023-10-21', 'présent', 'présent'),
(461, 193, 49, '2023-10-21', 'absent', NULL),
(462, 192, 49, '2023-10-21', 'absent', NULL),
(463, 169, 42, '2023-10-21', 'présent', 'absent'),
(464, 169, 49, '2023-10-21', 'présent', NULL),
(465, 203, 42, '2023-10-21', 'présent', 'présent'),
(466, 203, 49, '2023-10-21', 'présent', NULL),
(467, 204, 42, '2023-10-21', 'présent', 'présent'),
(468, 204, 49, '2023-10-21', 'présent', NULL),
(469, 200, 49, '2023-10-21', 'présent', NULL),
(470, 201, 49, '2023-10-21', 'présent', NULL),
(471, 93, 43, '2023-10-22', 'présent', 'présent'),
(472, 243, 42, '2023-10-22', 'présent', 'présent'),
(473, 159, 42, '2023-10-22', 'présent', 'présent'),
(474, 165, 42, '2023-10-22', 'présent', 'présent'),
(475, 164, 42, '2023-10-22', 'présent', 'présent'),
(476, 212, 42, '2023-10-22', NULL, 'présent'),
(477, 236, 42, '2023-10-22', NULL, 'présent'),
(478, 198, 42, '2023-10-22', NULL, 'présent'),
(479, 265, 42, '2023-10-22', NULL, 'présent'),
(480, 190, 44, '2023-10-22', NULL, 'absent'),
(481, 142, 44, '2023-10-22', NULL, 'absent'),
(482, 211, 44, '2023-10-22', NULL, 'absent'),
(483, 208, 51, '2023-10-22', NULL, 'présent'),
(484, 191, 50, '2023-10-23', 'présent', NULL),
(485, 30, 51, '2023-10-24', 'présent', NULL),
(486, 18, 47, '2023-10-24', 'absent', NULL),
(487, 18, 50, '2023-10-24', 'absent', NULL),
(488, 18, 54, '2023-10-24', 'absent', NULL),
(489, 18, 48, '2023-10-24', 'absent', NULL),
(490, 166, 48, '2023-10-24', 'absent', NULL),
(491, 202, 53, '2023-10-24', 'présent', NULL),
(492, 258, 50, '2023-10-25', 'absent', NULL),
(493, 258, 54, '2023-10-25', 'absent', NULL),
(494, 24, 47, '2023-10-25', 'absent', NULL),
(495, 24, 48, '2023-10-25', 'présent', NULL),
(496, 24, 50, '2023-10-25', 'absent', NULL),
(497, 24, 54, '2023-10-25', 'absent', NULL),
(498, 215, 49, '2023-10-25', 'absent', NULL),
(499, 216, 48, '2023-10-25', 'absent', NULL),
(500, 250, 49, '2023-10-25', 'absent', NULL),
(501, 257, 47, '2023-10-25', 'absent', NULL),
(502, 257, 48, '2023-10-25', 'absent', NULL),
(503, 174, 49, '2023-10-27', 'présent', NULL),
(504, 173, 49, '2023-10-27', 'présent', NULL),
(505, 174, 53, '2023-10-27', 'présent', NULL),
(506, 174, 55, '2023-10-27', 'présent', NULL),
(507, 173, 53, '2023-10-27', 'présent', NULL),
(508, 213, 53, '2023-10-27', 'présent', NULL),
(509, 184, 49, '2023-10-27', 'absent', NULL),
(510, 184, 53, '2023-10-27', 'présent', NULL),
(511, 185, 49, '2023-10-27', 'absent', NULL),
(512, 185, 53, '2023-10-27', 'présent', NULL),
(513, 186, 49, '2023-10-27', 'absent', NULL),
(514, 186, 53, '2023-10-27', 'présent', NULL),
(515, 186, 55, '2023-10-27', 'présent', NULL),
(516, 161, 49, '2023-10-27', 'présent', NULL),
(517, 207, 49, '2023-10-27', 'présent', NULL),
(518, 208, 49, '2023-10-27', 'présent', NULL),
(519, 208, 51, '2023-10-27', 'présent', NULL),
(520, 161, 53, '2023-10-27', 'présent', NULL),
(521, 161, 55, '2023-10-27', 'présent', NULL),
(522, 207, 53, '2023-10-27', 'présent', NULL),
(523, 207, 55, '2023-10-27', 'présent', NULL),
(524, 208, 53, '2023-10-27', 'présent', NULL),
(525, 208, 55, '2023-10-27', 'présent', NULL),
(526, 164, 49, '2023-10-29', 'présent', NULL),
(527, 165, 49, '2023-10-29', 'présent', NULL),
(528, 159, 49, '2023-10-29', 'présent', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `inscription_saison`
--

CREATE TABLE `inscription_saison` (
  `rider_id` int(11) NOT NULL,
  `saison_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `inscription_saison`
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
(115, 2),
(43, 2),
(150, 2),
(149, 2),
(151, 2),
(133, 2),
(156, 2),
(130, 2),
(15, 2),
(16, 2),
(157, 2),
(158, 2),
(19, 2),
(159, 2),
(160, 2),
(144, 2),
(131, 2),
(46, 2),
(53, 2),
(17, 2),
(161, 2),
(162, 2),
(237, 2),
(164, 2),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(174, 2),
(240, 2),
(176, 2),
(177, 2),
(178, 2),
(128, 2),
(179, 2),
(180, 2),
(181, 2),
(257, 2),
(238, 2),
(184, 2),
(185, 2),
(186, 2),
(187, 2),
(188, 2),
(189, 2),
(190, 2),
(191, 2),
(192, 2),
(193, 2),
(194, 2),
(195, 2),
(196, 2),
(197, 2),
(198, 2),
(199, 2),
(200, 2),
(201, 2),
(202, 2),
(203, 2),
(204, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(211, 2),
(80, 2),
(212, 2),
(213, 2),
(214, 2),
(91, 2),
(215, 2),
(216, 2),
(217, 2),
(218, 2),
(219, 2),
(141, 2),
(142, 2),
(220, 2),
(221, 2),
(222, 2),
(34, 2),
(223, 2),
(224, 2),
(225, 2),
(226, 2),
(227, 2),
(228, 2),
(229, 2),
(230, 2),
(118, 2),
(231, 2),
(232, 2),
(233, 2),
(81, 2),
(234, 2),
(97, 2),
(70, 2),
(122, 2),
(235, 2),
(6, 2),
(85, 2),
(135, 2),
(113, 2),
(114, 2),
(116, 2),
(127, 2),
(236, 2),
(143, 2),
(246, 2),
(83, 2),
(243, 2),
(244, 2),
(245, 2),
(93, 2),
(247, 2),
(248, 2),
(32, 2),
(108, 2),
(249, 2),
(250, 2),
(251, 2),
(252, 2),
(253, 2),
(27, 2),
(28, 2),
(26, 2),
(76, 2),
(254, 2),
(89, 2),
(255, 2),
(256, 2),
(154, 2),
(65, 2),
(258, 2),
(259, 2),
(260, 2),
(261, 2),
(262, 2),
(111, 2),
(129, 2),
(57, 2),
(263, 2),
(264, 2),
(265, 2),
(266, 2),
(148, 2),
(1, 2),
(86, 2),
(41, 2),
(267, 2),
(36, 2),
(268, 2),
(51, 2),
(123, 2),
(125, 2),
(269, 2);

-- --------------------------------------------------------

--
-- Structure de la table `lien_groupe`
--

CREATE TABLE `lien_groupe` (
  `groupe_id` int(11) NOT NULL,
  `objet_id` int(11) NOT NULL,
  `objet_type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `nom`, `adresse`) VALUES
(1, 'Halle Gosnat', '30 Rue Amédée Huon, 94200 Ivry-sur-Seine'),
(2, 'Gymnase Dulcie September', '8, rue Jean-Jacques Rousseau 94200 Ivry-sur-Seine'),
(3, 'TEP Louis Braille', '24 Rue Louis Braille, 75012 Paris');

-- --------------------------------------------------------

--
-- Structure de la table `rb_buts`
--

CREATE TABLE `rb_buts` (
  `id` int(11) NOT NULL,
  `buteur` int(11) DEFAULT NULL,
  `passeur` int(11) DEFAULT NULL,
  `equipe` int(11) NOT NULL,
  `match_tournoi` int(11) NOT NULL,
  `temps` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rb_match`
--

CREATE TABLE `rb_match` (
  `id` int(11) NOT NULL,
  `equipe_1` int(11) NOT NULL,
  `equipe_2` int(11) NOT NULL,
  `issue` varchar(1) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `lieu` int(11) NOT NULL,
  `heure` varchar(10) NOT NULL,
  `tour` int(11) NOT NULL,
  `mvp_equipe_1` int(11) DEFAULT NULL,
  `mvp_equipe_2` int(11) DEFAULT NULL,
  `arbitre_terrain` varchar(255) NOT NULL,
  `arbitre_chaise` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rb_players`
--

CREATE TABLE `rb_players` (
  `id` int(11) NOT NULL,
  `prenom` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `gardien` tinyint(1) NOT NULL DEFAULT '0',
  `sexe` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rb_teams`
--

CREATE TABLE `rb_teams` (
  `id` int(11) NOT NULL,
  `nom_long` varchar(255) NOT NULL,
  `nom_court` varchar(3) NOT NULL,
  `couleur_1` varchar(10) NOT NULL,
  `couleur_2` varchar(10) NOT NULL,
  `pays` varchar(20) NOT NULL,
  `sexe` tinyint(1) NOT NULL DEFAULT '0',
  `paiement` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `not_enough` tinyint(1) DEFAULT '0',
  `how_many` int(11) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rb_teams`
--

INSERT INTO `rb_teams` (`id`, `nom_long`, `nom_court`, `couleur_1`, `couleur_2`, `pays`, `sexe`, `paiement`, `email`, `phone`, `not_enough`, `how_many`, `contact`) VALUES
(1, 'US Ivry Roller', 'USI', '#ff0000', '#000000', 'France', 1, 0, 'jechapartegui@gmail.com', '+33669403738', 0, 0, 'J-E');

-- --------------------------------------------------------

--
-- Structure de la table `rb_tour`
--

CREATE TABLE `rb_tour` (
  `id` int(11) NOT NULL,
  `sexe` tinyint(1) NOT NULL DEFAULT '0',
  `nom` varchar(255) NOT NULL,
  `ordre` int(11) NOT NULL,
  `niveau` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rb_tour`
--

INSERT INTO `rb_tour` (`id`, `sexe`, `nom`, `ordre`, `niveau`) VALUES
(1, 0, 'Phase de poules - Groupe A / Group Stage - Pool A', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `riders`
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
  `est_prof` tinyint(1) DEFAULT '0',
  `est_admin` tinyint(1) DEFAULT '0',
  `telephone` varchar(50) NOT NULL,
  `personne_prevenir` varchar(100) NOT NULL,
  `telephone_personne_prevenir` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `riders`
--

INSERT INTO `riders` (`id`, `nom`, `prenom`, `date_naissance`, `sexe`, `niveau`, `adresse`, `compte`, `est_prof`, `est_admin`, `telephone`, `personne_prevenir`, `telephone_personne_prevenir`) VALUES
(1, 'YOUCEFI', 'Nora', '1992-02-24', '0', 'débutant', '18 Quai de la Marne   75019 Paris', 2, 0, 0, '  0672979942', '    -    ', '  -  '),
(2, 'Faure', 'Lorraine', '1988-10-07', '0', 'débutant', '76 avenue du président Wilson 93100 Montreuil', 3, 0, 0, '0678687742', 'Colin Catherine', '0679280722  '),
(3, 'Barnabé', 'Lise', '2014-11-20', '0', 'débutant', '40 bis rue André Visage 94400 Vitry sur Seine', 4, 0, 0, '0623554478', 'Barnabé Sabrina', '0623554478 0610809534'),
(4, 'Barnabé', 'Sabrina', '1984-06-10', '0', 'débutant', '40 bis rue André Visage 94400 Vitry sur Seine', 4, 0, 0, '0623554478', 'Barnabé Julien', '0610809534  '),
(5, 'Annon', 'Laurine', '1997-09-19', '0', 'débutant', '163 Avenue Jean Jaurès 75019 Paris', 5, 0, 0, '0612619307', 'Moulo Orlane', '0781158249  '),
(6, 'Fairet', 'Emilie', '1980-05-25', '0', 'intermédiaire', '65 Rue Servan   75011 Paris', 6, 0, 0, '   ', '    -    ', '  -  '),
(7, 'CLEMENT', 'Camille', '1992-01-13', '0', 'débutant', '3 rue Westermeyer 94200 Ivry sur seine', 7, 0, 0, '0640199500', 'CLEMENT Marie-Pierre', '0674732936  '),
(8, 'beldjilali', 'liam', '2016-06-23', '0', 'débutant', '23 av gambetta 94400 Vitry-sur-Seine', 8, 0, 0, '0651289017', 'lalko joanna', '0651289017 0615692839'),
(9, 'lalko-beldjilali', 'joanna', '1980-02-29', '0', 'débutant', '23 av gambetta 94400 Vitry-sur-Seine', 8, 0, 0, '0651289017', 'beldjilali riad', '0615692839  '),
(10, 'RIPAULT', 'Clémentine', '1993-08-05', '0', 'débutant', '28 Rue Marcelin Berthelot 94140 Alfortville', 9, 0, 0, '0602689351', 'RIPAULT Solange', '0682356100  '),
(11, 'FRANCK', 'Geraldine', '1983-05-02', '0', 'débutant', '141 rue des pyrénées 75020 PARIS', 10, 0, 0, '0684179773', 'SILVESTRI Lauriane', '0609208053  '),
(12, 'Thiltges', 'Charlie', '1994-04-10', '0', 'débutant', '75 Rue Marat, Bat B2, 3e étage à gauche 94200 Ivry-sur-Seine', 11, 0, 0, '0677656271', 'Weinland Liza', '0609827661  '),
(13, 'Dalla-Libera', 'Sami', '1980-08-21', '0', 'débutant', '70 boulevard de Bellechasse 94100 Saint Maur des Fosses', 12, 0, 0, '0607647571', 'Pacreau Caroline', '07 69 11 34 15  '),
(14, 'Omnès Le Lamer', 'Virginie', '1975-04-03', '0', 'intermédiaire', '19 Rue Louis Fablet   94200 Ivry sur Seine', 13, 0, 1, '  0695113506', '    -    ', '  -  '),
(15, 'Pham-Van-Hué', 'Nahéma', '1998-02-19', '0', 'avancé', '15 Rue Rue de Montreuil   75011 Paris', 14, 0, 0, '  0668204929', '    -    ', '  -  '),
(16, 'LAKROUT', 'Meidi', '1979-06-09', '1', 'intermédiaire', '81 D2 Quai Boissy d\'Anglas D2 78380 bougival', 15, 0, 0, '0615052947 +33615052947', 'LAKROUT   -    ', '  -  '),
(17, 'Dorion', 'Léa', '1991-02-10', '0', 'intermédiaire', '110 Rue De Stalingrad   93100 Montreuil', 16, 0, 0, '  0668611665', '    -    ', '  -  '),
(18, 'Tezier', 'Valentine', '1989-08-15', '0', 'intermédiaire', '165 Avenue Henri Ginoux   92120 MONTROUGE', 17, 0, 0, '  0668439399', '    -    ', '  -  '),
(19, 'Lennon', 'Gaëlle', '1977-05-21', '0', 'intermédiaire', '175 Rue Marcel Hartmann   94200 Ivry-sur-Seine', 18, 0, 0, '  0663745733', '    -    ', '  -  '),
(20, 'BRIER', 'Maud', '2001-07-11', '0', 'intermédiaire', '35 avenue des Gobelins 75013 Paris', 19, 0, 0, '0750806929', 'Brier Camille', '0649726661  '),
(21, 'Desindes ', 'Alice', '1977-10-28', '0', 'intermédiaire', '36 rue de Lancry 60200 Compiègne', 20, 0, 0, '0619730234', 'Dronchon David', '0687567831  '),
(22, 'Billard', 'Jessica', '1996-11-01', '0', 'avancé', '5 avenue pierre brasseur 95490 Vauréal', 21, 0, 0, '0658589893', 'Billard Charles', '+33 7 64 17 55 08  '),
(23, 'Weibel', 'Elka', '1995-12-12', '0', 'avancé', '34 Rue Emile Zola   94140 Alfortville', 22, 0, 0, '  0631851682', '    -    ', '  -  '),
(24, 'Laporte', 'Laurie', '1997-02-27', '0', 'avancé', '16 Esplanade des frères lumière   95220 Herblay-sur-seine', 23, 1, 1, '  0640113220', '    -    ', '  -  '),
(25, 'Elmkhanter', 'Marie', '1995-05-20', '0', 'débutant', '24 rue de l\'aubrac 75012 Paris', 24, 0, 0, '+33608743283', 'Elmkhanter Nadine', '0614730489  '),
(26, 'lixon', 'sophie', '1977-08-02', '0', 'intermédiaire', '10 RUE LOUIS FABLET 94200 IVRY SUR SEINE', 25, 0, 0, '0603673174', 'tournaire arnaud', '0663036216  '),
(27, 'tournaire', 'swann', '2012-08-24', '0', 'intermédiaire', '7 Rue GEOFFROY SAINT HILAIRE   75005 PARIS', 25, 0, 0, '  0663036216', 'tournaire arnaud -    ', '0663036216 -  '),
(28, 'tournaire', 'sasha', '2012-06-26', '0', 'débutant', '7 Rue GEOFFROY SAINT HILAIRE   75005 PARIS', 25, 0, 0, '  0663036216', 'TOURNAIRE ARNAUD -    ', '0663036216 -  '),
(29, 'Zakki', 'Samy', '1998-10-14', '01', 'avancé', '1, allée des morelles 91360 Epinay sur orge', 26, 0, 0, '0633782236', 'Zakki Nour-eddine', '0673868940 0619519511'),
(30, 'Chapartegui', 'Clémentine', '2017-11-21', '0', 'intermédiaire', '21 Rue Pasteur   94200 Ivry-sur-Seine', 27, 0, 0, '  0669403738', 'CHAPARTEGUI Jean-Emmanuel - NGUYEN PHUC Cécile', '0669403738 - 0652699085'),
(31, 'Chapartegui', 'Jean-Emmanuel', '1986-06-26', '1', 'avancé', '21 Rue Pasteur   94200 Ivry-sur-Seine', 27, 1, 1, '  0669403738', 'NGUYEN PHUC Cécile -    ', '0652699085 -  '),
(32, 'DJEDDA', 'Fares', '2015-02-17', '1', 'intermédiaire', '179 boulevard de stalingrad 94200 IVRY SUR SEINE', 28, 0, 0, '0782592780', 'DJEDDA Mourad DJEDDA Nora', '0618295822 0782592780'),
(33, 'Fiel', 'Antoine', '1990-08-28', '1', 'avancé', '20 Rue Bénard 75014 PARIS 14', 29, 0, 0, '+33612621523', 'Fiel Viviane', '0685192988  '),
(34, 'Julienne', 'Charlène', '1986-07-28', '0', 'intermédiaire', '5 Avenue De Longjumeau   91360 Villemoisson sur orge', 30, 0, 0, '  0682876704', '    -    ', '  -  '),
(35, 'Joseph', 'Raoul', '1987-09-01', '1', 'avancé', '5 bis Rue JOSEPH Raoul   92340 bourg la reine', 31, 0, 0, '0663637568 +33614166018', 'Raoul JOSEPH - Raoul JOSEPH', '+33614166018 - 0663637568'),
(36, 'Weinland', 'Liza', '1993-07-02', '0', 'débutant', '75 Rue MARAT B2 94200 IVRY SUR SEINE', 32, 0, 0, '  0609827661', '    -    ', '  -  '),
(37, 'LE GAC', 'Anne-Audrey', '1988-11-13', '0', 'débutant', '2C Avenue de la Chesnaie, 91230 MONTGERON', 33, 0, 0, '0761461650', 'Milesi Nicolas', '0681578472  '),
(38, 'BEN ICHOU - LEPRINCE', 'SAUL', '2017-01-06', '1', 'avancé', '43 RUE DES FRERES BLAIS 94200 IVRY SUR SEINE', 34, 0, 0, '0626454992', 'CHLOE LEPRINCE MATHIEU BEN ICHOU', '0665523836 0626454992'),
(39, 'BEN ICHOU - LEPRINCE', 'ISMAEL', '2013-07-31', '0', 'débutant', '43 RUE DES FRERES BLAIS 94200 IVRY SUR SEINE', 34, 0, 0, '0626454992', 'CHLOE LEPRINCE MATHIEU BEN ICHOU', '0665523836 0626454992'),
(40, 'Soubielle-Fourie', 'Charline', '1998-11-15', '0', 'débutant', '16 rue Guyton de Morveau 75013 Paris', 35, 0, 0, '0629172773', 'Soubielle-Fourie Charline', '0617060860 0609103737'),
(41, 'Mouliney', 'Maxime', '1991-11-04', '1', 'débutant', '12A Rue Des Dores   91360 Epinay sur orge', 36, 0, 0, '  0629748314', '    -    ', '  -  '),
(42, 'Kamtchueng', 'Toko', '1987-01-14', '1', 'avancé', '83 Avenue d\'Italie   75013 Paris', 37, 1, 1, '  0642010973', '    -    ', '  -  '),
(43, 'Bounleng', 'David', '1985-06-30', '1', 'avancé', '2 Avenue Avenue Saint-Maurice du Valais   94410 Saint-maurice', 38, 0, 1, '  0612165244', '    -    ', '  -  '),
(44, 'AUSSET', 'Margot', '2012-06-27', '0', 'débutant', '23 rue Jean-Jacques ROUSSEAU 94200 Ivry sur seine', 39, 0, 0, '0769839694', 'BENARD Yvon', '0685563266  '),
(45, 'Hernando', 'Malik', '2010-04-25', '0', 'débutant', '56 rue du Fort 94400 Vitry sur seine', 40, 0, 0, '0649825469', 'Bennani / Hernando Dounia / Jessy', '0649825469 0623114903'),
(46, 'Duarte', 'Lucie', '1990-02-28', '0', 'intermédiaire', '12 Rue Du docteur Goujon   75012 Paris', 41, 0, 0, '  0687117510', '    -    ', '  -  '),
(47, 'Taillebrest', 'François', '1985-03-07', '0', 'avancé', '30 rue saint Claude 93190 Livry-Gargan', 42, 1, 0, 'Taillebrest Elisabeth / Loïc', 'Taillebrest Elisabeth / Loïc', '0344499807 0676632646'),
(48, 'Trouvé ', 'Mélanie ', '1996-04-03', '0', 'débutant', '251 avenue Daumesnil 75012 Paris', 43, 0, 0, '0659921206', 'Azémar Léo', '0633168315  '),
(49, 'RIFAFUD', 'CELIA', '1973-07-16', '0', 'débutant', '75 BIS AVENUE DANIELLE CASANOVA 94200 IVRY SUR SEINE', 44, 0, 0, '0608217585', 'CASTRO ANDREA', '0677133399  '),
(50, 'Tripault', 'Fabrice', '1978-10-04', '0', 'débutant', '34 rue de Picpus 75012 PARIS', 45, 0, 0, '0662078978', 'Tripault Marie-Rose', '0612392868  '),
(51, 'Revilloud', 'Marc', '1986-06-25', '1', 'débutant', '34 Rue Auguste demler   92340 Bourg la reine', 46, 0, 0, '  0689616028', '    -    ', '  -  '),
(52, 'henry', 'mary', '1986-09-29', '0', 'débutant', '40 Rue Marat 94200 Ivry Sur Seine', 47, 0, 0, '0760586746', 'henry Annick', '0660501557  '),
(53, 'LACOMBE LAROCHE', 'Gabriel', '2013-05-10', '1', 'intermédiaire', '43 Rue Jules Lagaisse   94400 VITRY-SUR-SEINE', 48, 0, 0, '  0627949246', 'Lacombe Florian - Laroche Amandine', '0627949246 - 0627247774'),
(54, 'Eschenauer', 'Zeli', '2012-02-08', '0', 'débutant', '20 rue Pierre Rigaud 94200 Ivry sue Seine', 49, 0, 0, '0619925885', 'Bonomo Nina', '0619925885 0607694973'),
(55, 'Alloing', 'Marie ', '1992-01-10', '0', 'débutant', '2 bis rue de la révolution 92400 Ivry-sur-seine', 50, 0, 0, '0645048560', 'Alloing Ourdia', '0676747830  '),
(56, 'Lemaire', 'Nicolas', '1991-08-10', '0', 'débutant', '8 rue jules Edouard Voisembert 92130 Issy Les Moulineaux', 51, 0, 0, '0782085648', 'Allain Mathilde', '0646876826  '),
(57, 'Griveau', 'Johanna', '1988-06-15', '0', 'débutant', '9 Rue Pierre et marie curie   94200 Ivry sur seine', 52, 0, 0, '  0671414589', '    -    ', '  -  '),
(58, 'vuillerme', 'nicolas', '1994-06-06', '0', 'débutant', '8 rue marie benoist 75012 PARIS', 53, 0, 0, '0626964655', 'Gesquiere Hortense', '0667467089  '),
(59, 'Crozat', 'Noemie', '1998-09-03', '0', 'débutant', '1 rue Léon 75018 Paris', 54, 0, 0, '0652929904', 'Dehais Etienne', '+33647553237  '),
(60, 'Bocos', 'Sebastien ', '1981-06-15', '0', 'débutant', '107 rue Bobillot 75013 Paris', 55, 0, 0, '0786184002', 'Babeau Camille', '0664873882  '),
(61, 'Alcolei', 'Aurore', '1992-11-27', '0', 'débutant', '15 rue Paul Bert 94200 Ivry-Sur-Seine', 56, 0, 0, '0686695750', 'Alcolei Françoise', '0683665541  '),
(62, 'Caroujel', 'Clement-jeremy', '1987-06-08', '0', 'débutant', '85 Rue Carnot 92300 Levallois Perret', 57, 0, 0, '0614713208', 'BIREAUD Jennifer', '+33 6 69 27 47 24  '),
(63, 'Rougelin', 'Angèle ', '1999-08-15', '0', 'débutant', '96 Rue de Paris 92190 Meudon', 58, 0, 0, '+33647767756', 'Ribault Mathilde', '0629553894  '),
(64, 'Aubertin', 'Arthur', '1990-02-27', '0', 'débutant', '2 bis rue de la révolution 94200 IVRY SUR SEINE', 59, 0, 0, '0684902268', 'Alloing Marie', '06 45 04 85 60  '),
(65, 'Petot', 'Marylou', '1993-11-14', '0', 'débutant', '5 Boulevard Davout   75020 PARIS', 60, 0, 0, '  +33618404987', '    -    ', '  -  '),
(66, 'Le Gouez', 'Mélanie', '1996-11-22', '0', 'débutant', '186 avenue Jean Jaures 75019 Paris', 61, 0, 0, '0664748514', 'Berny Madeleine', '0678801656  '),
(67, 'Servier', 'Marion', '1986-12-12', '0', 'débutant', '4 rue Victor Hugo 93100 Montreuil', 62, 0, 0, '0675028432', 'Grandgenevre Vincent', '0687629158  '),
(68, 'Josse', 'Aurélien ', '1980-09-30', '0', 'débutant', '19 RUE Périer 92120 MONTROUGE', 63, 0, 0, '0628463884', 'Fourn Ornella', '0629844710  '),
(69, 'Marrannes', 'Guilhem', '1980-07-13', '0', 'débutant', '10 rue santerre 75012 paris', 64, 0, 0, '0667561721', 'Ly Annie', '0664880220  '),
(70, 'Kuan', 'Aurélie ', '1984-11-28', '0', 'débutant', '91 Rue Pierre Brossolette   Rueil-Malmaison 92500', 65, 0, 0, '0147495851  ', '    -    ', '  -  '),
(71, 'Johnson', 'Victoria', '2018-05-07', '0', 'débutant', '10 avenue Spinoza 94200 Ivry sur seine', 66, 0, 0, '0618251220', 'Johnson William', '0618251220 0618251220'),
(72, 'Johnson', 'Emmy', '2013-09-10', '0', 'débutant', '10 avenue Spinoza 94200 Ivry sur seine', 66, 0, 0, '0618251220', 'Johnson William', '0618251220 0618251220'),
(73, 'Johnson', 'Paris', '2011-04-02', '0', 'débutant', '10 avenue Spinoza 94200 Ivry sur seine', 66, 0, 0, '0618251220', 'Johnson William', '0622033692 0618251220'),
(74, 'Boubou', ' ', '2000-06-21', '0', 'avancé', '13 rue Mirabeau 94200 Ivry sur Seine', 67, 1, 1, 'Dignat Caroline Dignat Bruno', 'Dignat Caroline Dignat Bruno', '0698894703 0615365522'),
(75, 'Grond', 'Nicolas', '1984-06-14', '0', 'débutant', '35 rue du général Faidherbe 94130 NOGENT SUR MARNE', 68, 0, 0, '0681406587', 'Izquierdo Natalia', '0682639174  '),
(76, 'HUART', 'Lucille', '1997-03-01', '0', 'intermédiaire', '17 Rue de Rungis   75013 PARIS', 69, 0, 0, '  0610147204', '    -    ', '  -  '),
(77, 'Gisselbrecht', 'erwan', '1977-05-08', '0', 'débutant', '11, Rue des Aqueducs 94250 Gentilly', 70, 0, 0, '0619055872', 'Heuze Vourch Nathalie', '0681721252  '),
(78, 'PLESIMOND CLAIRY', 'MATTHEW', '2012-04-22', '0', 'débutant', '40 RUE MARAT, BAT 1 - 5EME ETAGE - APT 152 94200 IVRY SUR SEINE', 71, 0, 0, '0669029167', 'CLAIRY MYLENE', '069029167 0684111463'),
(79, 'CLAIRY', 'MYLENE', '1986-04-22', '0', 'débutant', '40 RUE MARAT, BAT 1 - 5EME ETAGE - APT 152 94200 IVRY SUR SEINE', 71, 0, 0, '0669029167', 'PLESIMOND JEAN EVANS', '0684111463 0778112724'),
(80, 'Bouvet', 'Michaël', '1991-03-26', '1', 'avancé', '33 Rue cdt René Mouchotte   75014 Paris', 72, 0, 0, '   ', '    -    ', '  -  '),
(81, 'Sabatier', 'Zelie', '2015-09-29', '0', 'avancé', '12 Rue Georgette Rosating   94200 Ivry-sur-Seine', 73, 0, 0, '0620406508 0620406508', 'sabatier arnaud - sabatier Marion', '0620406508 - 0699257979'),
(82, 'Chagnot', 'Silvère', '1971-09-09', '0', 'débutant', '7 Rue Victor Letalle 75020 Paris', 74, 0, 0, '0628225843', 'Lalande Isabelle', '‭06 65 00 75 11‬ ‭06 10 75 10 70‬'),
(83, 'Bernal', 'Eléonore', '1983-12-01', '0', 'débutant', '95 Rue Compans   75019 Paris', 75, 0, 0, '  0671601237', '    -    ', '  -  '),
(84, 'Arghyris', 'Agathe', '1993-12-16', '0', 'débutant', '6 rue de l\'affiche rouge 94200 Ivry-sur-Seine', 76, 0, 0, '0680505890', 'Charvet Amandine', '0632025384  '),
(85, 'Copinet', 'Yoann', '1979-04-04', '1', 'intermédiaire', '7 bis Rue du general Faidherbe   94130 Nogent sur Marne', 77, 0, 0, '  0610091131', '    -    ', '  -  '),
(86, 'Mespoulède', 'Nolwenn', '1992-12-14', '0', 'débutant', '7 Rue du Moulin Vert   94400 Vitry-sur-seine', 78, 0, 0, '  0601711606', '    -    ', '  -  '),
(87, 'DE CARVALHO', 'OLIVIER', '1974-09-27', '0', 'débutant', '29 rue Louise Aglaé Cretté 94400 Vitry sur seine', 79, 0, 0, '0621405988', 'TAVERNIER ELEN', '0611896861  '),
(88, 'Cigolotti', 'Audrey', '1996-04-10', '0', 'débutant', '4 rue de Navarre 75005 Paris', 80, 0, 0, '0788406075', 'Laure Cigolotti', '0478575423  '),
(89, 'THAI', 'Julien', '2013-05-07', '1', 'avancé', '63 Boulevard STALINGRAD APT A31 94400 Vitry sur seine', 81, 0, 0, '0145851956 0145851956', 'THAI FABRICE - THAI Xuefei', '0628350543 - 0628076135'),
(90, 'Daguet', 'Capucine', '1994-10-26', '0', 'débutant', '7 rue Marceau 93100 Montreuil', 82, 0, 0, '0666375768', 'Granjon Guillaume', '+33676161560  '),
(91, 'LEBLOND', 'EMILIE', '2016-03-17', '0', 'intermédiaire', '50 Rue Pierre et Marie Curie   Ivry sur Seine 94200', 83, 0, 0, '   ', 'TEA Cécile - LEBLOND Eric', '0621668592 - 0645717495'),
(92, 'COTTO', 'Alice', '2016-07-08', '0', 'débutant', '35 RUE MARCEL LAMANT 94200 IVRY SUR SEINE', 84, 0, 0, '0663259608', 'COTTO OLIVIER', '0663259608 0620513096'),
(93, 'alauzet', 'alexandre', '1979-01-16', '1', 'intermédiaire', '43 Rue Camille Groult   94400 Vitry sur Seine', 85, 0, 0, '  0650281566', '    -    ', '  -  '),
(94, 'Bakhti', 'Dounia ines', '2014-06-17', '0', 'débutant', '4 Pl. du Général de Gaulle 94200 Ivry-sur-Seine', 86, 0, 0, '0769555188', 'bakhti sarra', '0769555188 0665978963'),
(95, 'ye', 'jiamei', '2017-05-10', '0', 'débutant', '63 rue gabriel péri 94200 ivry sur seine', 87, 0, 0, '0667230101', 'jin juan', '0667230101  '),
(96, 'JIN', 'JUAN', '1985-06-28', '0', 'débutant', '63 rue gabriel péri 94200 ivry sur seine', 87, 0, 0, '0667230101', 'HU YAOFANG', '0761383595  '),
(97, 'Ledoux', 'Léa', '1998-12-13', '0', 'intermédiaire', '49 Rue Gabriel Lamé   75012 Paris', 88, 0, 0, '   ', '    -    ', '  -  '),
(98, 'Viain', 'Zélie', '2016-04-03', '0', 'intermédiaire', '30 Rue Brongniart 94600 Choisy-le-Roi', 89, 0, 0, '0685022853 0685022853', 'Windenberger Fanny', '0652944489 0685022853'),
(99, 'Viain', 'Léon', '2013-10-29', '0', 'avancé', '30 Rue Brongniart 94600 Choisy-le-Roi', 89, 0, 0, '0685022853 0685022853', 'Windenberger Fanny', '0652944489 0685022853'),
(100, 'Viain', 'Francis', '1973-06-10', '0', 'intermédiaire', '30 Rue Brongniart 94600 Choisy-le-Roi', 89, 0, 1, '0685022853 0685022853', 'Windenberger Fanny', '0652944489  '),
(101, 'Windenberger', 'Fanny', '1985-05-26', '0', 'intermédiaire', '30 Rue BRONGNIART   94600 CHOISY LE ROI', 89, 0, 0, '+33652944489 +33652944489', 'Windenberger Fanny -    ', '  -  '),
(102, 'berrabah', 'Sofia', '2013-08-08', '0', 'débutant', '7 rue blaqui 94200 Ivry sur seine', 90, 0, 0, '0676365607', 'Medjoubi Assia', '06 76 36 56 07 06 98 86 04 76'),
(103, 'Medjoubi', 'Camila', '2012-05-20', '0', 'débutant', '7 rue blaqui 94200 Ivry sur seine', 90, 0, 0, '0676365607', 'Medjoubi Assia', '06 76 36 56 07 06 98 86 04 76'),
(104, 'Le Lamer', 'Bérénice', '2015-07-15', '0', 'intermédiaire', '19 Rue Louis Fablet   94200 Ivry sur Seine', 13, 0, 0, '  0695113506', 'Omnès Le Lamer Virginie - Le Lamer Arnaud', '0695113506 - 06 87 28 53 46'),
(105, 'Grivel', 'Eloïse', '2014-03-08', '0', 'intermédiaire', '175 Rue Marcel Hartmann   94200 IVRY SUR SEINE', 91, 0, 0, '+33146718894 +33681223435', 'Grivel Mathilde - Grivel Gaëtan', '+33681223435 - +33607668189'),
(106, 'Grivel', 'Mathilde', '1981-08-18', '0', 'intermédiaire', '175 Rue Marcel Hartmann   94200 IVRY SUR SEINE', 91, 0, 1, '+33146718894 +33681223435', 'Grivel Mathilde -    ', '  -  '),
(107, 'Foucault', 'camille', '2013-05-07', '0', 'débutant', '185 rue marcel hartmann 94200 IVRY SUR SEINE', 92, 0, 0, '0666343036', 'lecomte dorothée', '06 66 34 30 36 06 89 23 92 79'),
(108, 'Presset', 'Ilse', '2016-08-12', '0', 'débutant', '181 Rue Marcel Hartmann   94200 Ivry sur Seine', 93, 0, 0, '  0621305417', 'Presset Francois - Huré Audrey', '0621305417 - 0603849225'),
(109, 'Nkemba', 'Goy', '2014-10-26', '0', 'débutant', '65 boullevard  Hyppolyte Marques 94200 Ivry sur seine', 94, 0, 0, '0642434133', 'Nkemba Vivian', '0642434133  '),
(110, 'Marchon', 'Ulysse ', '2013-09-03', '0', 'débutant', '35 rue saint just 94200 Ivry-sur-Seine', 95, 0, 0, '0609693832', 'Leroy Marie', '0609693832 +33 6 61 16 27 53'),
(111, 'Shata', 'Salah', '2015-08-18', '1', 'débutant', '28 Avenue Henri Barbusse   94200 Ivry-sur-Seine', 96, 0, 0, '  0636369558', 'Lafaye Manon -    ', '0636369558 -  '),
(112, 'Shata', 'Moustafa', '2017-05-05', '0', 'débutant', '28 avenue Henri Barbusse 94200 Ivry-sur-Seine', 96, 0, 0, '0636369558', 'Lafaye Manon', '0636369558  '),
(113, 'Dobler Trinh Dinh', 'Helena', '2015-12-08', '0', 'intermédiaire', '77 Avenue de Verdun   94200 IVRY SUR SEINE', 97, 0, 0, '   ', 'Dobler Sandrine - Trinh Dinh Jérémie', '  -  '),
(114, 'Dobler', 'Sandrine', '1978-05-10', '0', 'avancé', '77 Avenue de Verdun   94200 IVRY SUR SEINE', 97, 0, 0, '  0650579535', '    -    ', '  -  '),
(115, 'Elamraoui', 'Zoubir', '1977-03-08', '1', 'intermédiaire', '4 Allée Zoubir ELAMRAOUI chateclair 94200 IVRY SUR SEINE', 98, 0, 0, '0688080986 0688080986', 'ELAMRAOUI Zoubir -    ', '  -  '),
(116, 'zyskind', 'Laurène', '1996-04-17', '0', 'intermédiaire', '201 Rue de Charenton   75012 Paris', 99, 0, 0, '0635423505  ', '    -    ', '  -  '),
(117, 'Khaber', 'Naila', '2022-04-15', '0', 'débutant', '11 avenue de verdun 94200 94200 - IVRY SUR SEINE', 100, 0, 0, '0750514043', 'Khaber Angelique', '07 50 51 40 43 0750514825'),
(118, 'Garnier', 'Kilian', '1983-08-05', '1', 'intermédiaire', '7 Rue Léon Blum   94600 Choisy Le Roi', 101, 0, 0, '   ', '    -    ', '  -  '),
(119, 'Hette-Tronquart', 'Edmée', '2015-04-17', '0', 'débutant', '31, rue Raspail 94200 Ivry-sur-Seine', 102, 0, 0, '0670592003', 'Hette-Tronquart Caroline', '0670592003 0674439749'),
(120, 'guichen', 'Mael', '2014-02-04', '0', 'débutant', '7 rue eugene varlin 94400 VITRY SUR SEINE', 103, 0, 0, '0669454934', 'guichen viviane', '0669454934 0650634649'),
(121, 'Abadou ', 'Massiva', '2010-09-18', '0', 'débutant', '39, rue Camille blanc 94400 Vitry-sur-Seine', 104, 0, 0, '0651383303', 'Abadou Kahina', '0651383303  '),
(122, 'Ducray', 'Nicolas', '1981-03-03', '1', 'intermédiaire', '40 Rue Torcy   75018 Paris', 105, 0, 0, '   ', '    -    ', '  -  '),
(123, 'Turquier', 'Sybile', '2016-01-27', '0', 'débutant', '5 Sentier des Malicots   94200 Ivry sur Seine', 106, 0, 0, '  0626650611', 'Turquier Benjamin - Rodriguez Marie', '0626650611 - 0688683829'),
(124, 'Turquier', 'Matilda', '2012-06-14', '0', 'débutant', '5 sentier des Malicots 94200 Ivry sur Seine', 106, 0, 0, '0626650611', 'Rodriguez Marie', '0688683829  '),
(125, 'Turquier', 'Benjamin', '1980-02-14', '1', 'débutant', '5 Sentier des Malicots   94200 Ivry sur Seine', 106, 0, 0, '  0626650611', '    -    ', '  -  '),
(126, 'EYANG', 'ELODIE', '1992-04-02', '0', 'débutant', '6 RUE HOCHE APT 73 91260 JUVISY SUR ORGE', 107, 0, 0, '0608471450', 'MOULINEY MAXIME', '0629748314  '),
(127, 'Saint-André', 'Alizé', '1993-09-01', '0', 'débutant', '55 Boulevard Soult   75012 Paris', 108, 0, 0, '  0677336474', '    -    ', '  -  '),
(128, 'Panjak', 'Liza', '2015-11-16', '0', 'intermédiaire', '6 Villa Nieuport   75013 Paris', 109, 0, 0, '  0782595539', 'Panjak Nevena - Panjak Milan', '0782595539 - 0661005660'),
(129, 'Pelletier', 'Sophie', '1994-04-19', '0', 'débutant', '14 Rue Roger Salengro   94270 Le kremlin bicetre', 110, 0, 0, '  0678444198', '    -    ', '  -  '),
(130, 'Rappaport', 'Florian', '1989-05-07', '1', 'débutant', '10 Rue des Islettes   75018 Paris', 111, 0, 0, '  0632075959', 'Rappaport Florian -    ', '  -  '),
(131, 'fuger', 'camille', '1975-03-25', '0', 'débutant', '101 Avenue paul Doumer   92500 rueil malmaison', 112, 0, 0, '  0610795255', '    -    ', '  -  '),
(132, 'Guilbert', 'Gaëlle', '1997-09-10', '0', 'débutant', '43 rue marcellin berthelot 93160 noisy le grand', 113, 0, 0, '0780349131', 'Guilbert Maeva', '0611298254  '),
(133, 'Warnuvongs--Bonaventure', 'Maëlys', '2008-11-29', '0', 'avancé', '18 Rue Gaston Monmousseau   94200 Ivry-sur-seine', 114, 0, 0, '  0660760078', 'Warnuvongs Romain - Bonaventure Oriane', '0617300232 - 0675437478'),
(134, 'Tavani', 'Elias', '2014-03-01', '0', 'débutant', '3 avenue du Générale Leclerc 94200 Ivry sur Seine', 115, 0, 0, '0650883775', 'Tavani Maha', '0650883775 0667201521'),
(135, 'Arete', 'Quentin', '2010-11-25', '1', 'avancé', '29 Rue Louise Aglaé cretté   94400 Vitry-sur-Seine', 116, 0, 0, '0145732121  ', 'Tavernier Elen -    ', '0689116861 -  '),
(136, 'De carvalho', 'Emma', '2005-12-27', '0', 'débutant', '29 rue Louise Aglaë cretté 94400 Vitry sur seine', 116, 0, 0, '0621405988', 'De carvalho Olivier', '0621405988 0689116861'),
(137, 'CETKOVIC', 'LENA', '2010-10-04', '0', 'débutant', '150 RUE MARCEL HARTMANN 94200 IVRY SUR SEINE', 117, 0, 0, '0786580979', 'CETKOVIC LYDIA', '0786580979 0645365793'),
(138, 'MURA', 'Elliot', '2016-06-18', '0', 'débutant', '7 Allée Mulâtresse Solitude 94200 IVRY SUR SEINE', 118, 0, 0, '0617558000', 'MURA Anthony', '0617558000 0622485781'),
(139, 'Bossu', 'Nicolas', '1975-01-10', '0', 'débutant', '36 rue de la Tranchée 93100 MONTREUIL', 119, 0, 0, '0661868648', 'PAIRE Nathalie', '0673309086  '),
(140, 'Paire', 'Nathalie', '1982-06-04', '0', 'débutant', '36 rue de la Tranchée 93100 MONTREUIL', 119, 0, 0, '0673309086', 'BOSSU Nicolas', '0661868648  '),
(141, 'LANTIER', 'Antoine', '2012-08-24', '1', 'avancé', '51 Rue Maurice Gunsbourg   94200 Ivry sur seine', 120, 0, 0, '   ', 'Lantier Anne - LANTIER Sébastien', '0661147199 - 0680074604'),
(142, 'LANTIER', 'Clément', '2009-11-21', '1', 'avancé', '51 Rue Maurice Gunsbourg   94200 ivry sur seine', 120, 0, 0, '   ', 'LANTIER Anne - LANTIER Sébastien', '0661147199 - 0680074604'),
(143, 'PILLOT', 'LEO', '2011-09-13', '1', 'avancé', '29 Rue MARCEL LAMANT   94200 IVRY SUR SEINE', 121, 0, 0, '   ', 'PILLOT LUDOVIC - PILLOT HASNA', '0686838573 - 0651121622'),
(144, 'LECLERC', 'Sally', '2015-10-19', '0', 'intermédiaire', '4 bis Rue de la Révolution   94200 IVRY SUR SEINE', 122, 0, 0, '  0650981950', 'ENOUF Emilie - LECLERC Erwan', '0650981950 - 0666334141'),
(145, 'Dallou', 'Axel', '1985-12-30', '0', 'débutant', '96 bis Boulevard Paul Vaillant Couturier 94200 Ivry-Sur-Seine', 123, 0, 0, '0662960116', 'Marques Priscilia', '0620428478  '),
(146, 'Marques', 'Priscilia', '1985-01-22', '0', 'débutant', '96 bis Boulevard Paul Vaillant Couturier 94200 Ivry-sur-Seine', 123, 0, 0, '0620428478', 'Dallou Axel', '066296016  '),
(147, 'Dallou Marques', 'Suzanne', '2016-05-29', '0', 'débutant', '96 bis Boulevard Paul Vaillant Couturier 94200 Ivry-sur-Seine', 123, 0, 0, '0662960116', 'Dallou Axel', '0662960116 0620428478'),
(148, 'Thielleux', 'Matthieu', '1987-12-12', '1', 'débutant', '2 Rue Claude Pernes   93110 Rosny sous bois', 124, 0, 0, '  0664179319', '    -    ', '  -  '),
(149, 'Hanaizi', 'Zahir', '1990-03-19', '1', 'avancé', '70 RUE GEORGE GOSMAT\n94200 IVRY-SUR-SEINE', 125, 1, 0, 'A voir', 'A voir', '06 74 82 11 26'),
(150, 'Boulay', 'Priam', '2000-12-22', '0', 'avancé', 'TBD', 126, 1, 0, 'TBD', 'TBD', '+33 7 83 41 01 85'),
(151, 'Sidibe', 'Yoro', '1996-03-16', '0', 'avancé', '61 RUE DES PIROGUES DE BERCY\n75012 PARIS 12', 127, 1, 0, '06 58 17 68 96', 'TBD', '06 58 17 68 96'),
(152, 'Riffaud', 'Celia', '1973-07-17', '0', 'débutant', '75avenue Danielle Casanova 94200 ivry sur seine', 128, 0, 0, '0608217585', 'mehdi', '06 08 42 56 02'),
(153, 'Saroza MIchau', 'Luwen', '2018-07-07', '1', 'débutant', '24 Voie Lancret', 129, 0, 0, '0649641245', 'Mère', '0649641245'),
(154, 'Robledo-Gruel', 'Hugo', '1991-11-10', '1', 'intermédiaire', 'TBD', 130, 1, 0, '+33 6 15 95 07 96', 'TBD', '+33 6 15 95 07 96'),
(155, 'Laillier', 'Matthieu', '1988-10-13', '1', 'débutant', 'Dans le 16eme', 131, 1, 0, '+33 6 63 00 47 03', 'TBD', '+33 6 63 00 47 03'),
(156, 'Trouvé', 'Mélanie', '1996-04-04', '0', 'débutant', '251 Avenue Daumesnil   75012 PARIS', 43, 0, 0, '+33659921206 0659921206', '    -    ', '  -  '),
(157, 'Lefebvre', 'Fanny', '1995-09-10', '0', 'débutant', '11 Rue des Cinq Diamants   75013 Paris', 132, 0, 0, '  0648375160', '    -    ', '  -  '),
(158, 'blavy', 'camille', '1995-04-05', '0', 'intermédiaire', '68 Rue de meaux   75019 paris', 133, 0, 0, '  0640579480', '    -    ', '  -  '),
(159, 'Voeuk', 'Rachaella', '2019-10-20', '0', 'débutant', '38 Rue Vérollot   94200 Ivry sur seine', 134, 0, 0, '0624081990 0624081990', 'Voeuk Gerard -    ', '  -  '),
(160, 'CLEMENT ', 'Camille', '1992-01-14', '0', 'intermédiaire', '3 Rue Westermeyer   94200 Ivry sur seine', 7, 0, 0, '  0640199500', '    -    ', '  -  '),
(161, 'al Chdid', 'Emma ', '2017-03-09', '0', 'débutant', '1 square Jean Thébaud 75015 Square 1 square Jean Thébaud 75015   75015 paris', 135, 0, 0, '  0636100825', '    -    ', '  -  '),
(162, 'Paire', 'Nathalie', '1982-06-05', '0', 'intermédiaire', '36 Rue Tranchee   93100 Montreuil', 136, 0, 0, '  0673309086', '    -    ', '  -  '),
(237, 'Trogneux', 'Wendolyn', '1997-08-12', '0', 'débutant', '36 Rue rue de picpus   75012 Paris', 182, 0, 0, '  0766555237', '    -    ', '  -  '),
(164, 'Voeuk', 'Viesal olivier', '2014-09-19', '1', 'intermédiaire', '38 Rue Vérollot   94200 Ivry sur seine', 134, 0, 0, '0624081990 0624081990', 'Voeuk Gerard -    ', '  -  '),
(165, 'Voeuk', 'Rachana', '2015-10-08', '0', 'débutant', '38 Rue Vérollot   94200 Ivry sur seine', 134, 0, 0, '0624081990 0624081990', 'Voeuk Gerard - Voeuk Gerard', '  - 0624081990'),
(166, 'Goudreau', 'Eric', '1978-11-23', '1', 'intermédiaire', '3 Quai De la Brise Appartement 2205 94000 Créteil', 137, 0, 0, '  0683414299', '    -    ', '  -  '),
(167, 'VILAYPHONH', 'Léo', '2018-10-11', '1', 'débutant', '25 Rue BAUDIN   94200 IVRY-SUR-SEINE', 138, 0, 0, '  0659605819', 'VILAYPHONH Anne-Claire - VILAYPHONH MARC', '0659605819 - 0659870520'),
(168, 'VILAYPHONH', 'Manon', '2015-01-15', '0', 'débutant', '25 Rue BAUDIN   94200 IVRY-SUR-SEINE', 138, 0, 0, '  0659605819', 'VILAYPHONH Anne-Claire - VILAYPHONH MARC', '0659605819 - 0659870520'),
(169, 'Abichou', 'Alia', '2016-04-23', '0', 'débutant', '8 Voie Olympe de gouges   94200 Ivry sur seine', 139, 0, 0, '0618137754 0618137754', 'Jabou Rimele -    ', '0618137754 -  '),
(170, 'Besse', 'Morgane', '1991-03-26', '0', 'intermédiaire', '25 Rue des envierges   75020 Paris', 140, 0, 0, '  0630148974', '    -    ', '  -  '),
(171, 'Hsaini ', 'Oumayma ', '2013-12-23', '0', 'débutant', '5 Rue Alexis chaussinand   94200 Ivry sur Seine', 141, 0, 0, '0143903355 0628461181', 'Hsaini Hanan - Hsaini Abdel mounaim', '0628461181 - 0628461181'),
(172, 'ZEGHMI', 'Lizia', '2013-12-17', '0', 'débutant', '20 bis Impasse Tellier   94200 Ivry-sur-seine', 142, 0, 0, '  0667357719', 'Zeghmi Hakim - Smadja Laetitia', '0667357719 - 0628067929'),
(173, 'Tremor ', 'Jahna', '2018-10-16', '0', 'débutant', '36 Avenue Henri barbusse   94200 Ivry-sur-Seine', 143, 0, 0, '  0677595553', 'Tremor Joemia - Tremor Joevin', '0677595553 - 0782192420'),
(174, 'Tremor ', 'Jahyla ', '2014-07-26', '0', 'débutant', '36 Avenue Henri barbusse   94200 Ivry sur seine', 143, 0, 0, '  0677595553', 'Tremor Joemia - Tremor Joevin', '0677595553 - 0782192420'),
(257, 'Badji', 'Mamadou', '1988-03-18', '1', 'avancé', '40 avenue Victor Hugo chez Alima Touré  \nMontfermeil 93370 ', 196, 1, 0, '0755201460', '', ''),
(176, 'Prefumo', 'Adele', '2018-03-07', '0', 'débutant', '173 rue marcel hartmann Rue Fouzia Prefumo Bat 4 94200 Ivry sur seine', 145, 0, 0, '0699659959 0699659959', 'Prefumo Fouzia -    ', '  -  '),
(177, 'Rispal Tord', 'William', '2015-08-18', '1', 'débutant', '8 Rue Mozart   94200 Ivry sur Seine', 146, 0, 0, '  0675735942', 'Tord Romain - Rispal Jessica', '0675735942 - 0677761167'),
(178, 'Miranda-Ségor', 'Teeyah ', '2016-01-03', '0', 'débutant', '70 Avenue Georges gosnat Bâtiment i 94200 Ivry sur Seine', 147, 0, 0, '  0673288066', 'SEGOR Elodie -    ', '0673288066 -  '),
(179, 'Grivel', 'Abigaïl', '2010-01-26', '0', 'intermédiaire', '175 Rue Marcel Hartmann   94200 IVRY SUR SEINE', 91, 0, 0, '+33146718894 +33681223435', 'Grivel Mathilde - Grivel Gaëtan', '+33681223435 - +33607668189'),
(180, 'Haidara', 'Rokia ', '2016-09-15', '0', 'intermédiaire', '17 Rue Émile blin Apt A13 94200 Ivry-sur-Seine', 148, 0, 0, '  0613054437', 'Haidara Aminata - Haidara Mariama', '0613054437 - 0618380332'),
(181, 'Haidara', 'Kadia ', '2016-09-15', '0', 'intermédiaire', '17 Rue Émile blin Apt A13 94200 Ivry-sur-Seine', 148, 0, 0, '0033170253833 0613054437', 'Haidara Aminata - Haidara Mariama', '0613054437 - 0618380332'),
(258, 'Princet', 'Adrien', '1993-11-30', '1', 'débutant', '100 Rue Jean legallleu   94200 Ivry-sur-Seine', 197, 0, 0, '  0683469003', '    -    ', '  -  '),
(238, 'RAKROUKI', 'Maryam', '2015-11-25', '0', 'débutant', '203 Avenue Maurice thore   94200 Ivry sur seine', 183, 0, 0, '0612167848 0612167848', 'Rakrouki Beatrice - Rakrouki Yahya', '0612167848 -  '),
(184, 'COULIBALY ', 'Mahdi', '2019-01-31', '1', 'débutant', '36 Avenue Henri Barbusse   94200 Ivry-sur-Seine', 149, 0, 0, '0619975426 0619975426', 'Coulibaly Marion - Coulibaly Namouri', '0619975426 - 0614665688'),
(185, 'Coulibaly', 'Malik', '2016-05-12', '1', 'débutant', '36 Avenue Henri Barbusse   94200 Ivry-sur-Seine', 149, 0, 0, '0619975426 0619975426', 'Coulibaly Marion - Coulibaly Namouri', '0619975426 - 0614665688'),
(186, 'Coulibaly', 'Inaya', '2014-10-16', '0', 'débutant', '36 Avenue Henri Barbusse   94200 Ivry-sur-Seine', 149, 0, 0, '0619975426 0619975426', 'Coulibaly Marion - Coulibaly Namouri', '0619975426 - 0614665688'),
(187, 'RAYNOVA', 'Lora', '2018-10-27', '0', 'débutant', '4 Bis Rue Fouilloux App D23 94200 Ivry-sur-Seine', 150, 0, 0, '  0651125944', 'Terzieva-Raynova Zhenya - Raynov Martin', '0651125944 - 0651414680'),
(188, 'Labidi', 'Shaïnese ', '2013-12-27', '0', 'débutant', '135 Boulevard De Stalingrad Apt 129 94400 Vitry-sur-Seine', 151, 0, 0, '  0659458171', 'Labidi Magalie - Neant Neant', '0659458171 - 0000000000'),
(189, 'Labidi', 'Jadde', '2013-12-27', '0', 'débutant', '235 Boulevard De Stalingrad Apt129 94400 Vitry sur seine', 151, 0, 0, '  0659458172', 'Labidi Magalie - Neant Neant', '0659458171 - 0000000000'),
(190, 'Labidi ', 'Dayanne ', '2010-05-16', '1', 'intermédiaire', '135 Boulevard De Stalingrad Apt 129 94400 Vitry sur seine', 151, 0, 0, '  0659458171', 'Labidi Magalie - Neant Neant', '0659458171 - 0000000000'),
(191, 'Rouffet', 'Melanie ', '1986-02-25', '0', 'débutant', '10 Rue Pierre brossolette   94200 Ivry-sur-Seine', 152, 0, 0, '0634276610 0634276610', 'Rouffet Mélanie -    ', '  -  '),
(192, 'BENSIMON ', 'Elya ', '2019-09-09', '0', 'débutant', '18 Rue Antoine Thomas   94200 Ivry-sur-Seine', 153, 0, 0, '0146727042 0146727042', 'BENSIMON Fanny - BENSIMON Yoni', '0646492325 - 0671845087'),
(193, 'BENSIMON ', 'Lyla', '2017-12-14', '0', 'débutant', '18 Rue Antoine Thomas   94200 Ivry-sur-Seine', 153, 0, 0, '  0146727042', 'BENSIMON Fanny - BENSIMON Yoni', '0646492325 - 0671845087'),
(194, 'Vieira Carreira', 'Matilde', '2015-04-04', '0', 'débutant', '1 Impasse Chanvin   94200 Ivry sur Seine', 154, 0, 0, '  0605683714', 'Santos Vieira Soraia - Carreira Pedro', '0605683714 - 0612801063'),
(195, 'Touré', 'Lia', '2019-11-18', '0', 'débutant', '33 Rue Marceau   94200 Ivry sur seine', 155, 0, 0, '  0153621403', 'Tichet Anne Laure - Touré Charles André', '0662521841 - 0681470910'),
(196, 'DURAND', 'LISA', '1994-05-02', '0', 'intermédiaire', '102 Cours DE VINCENNES   75012 PARIS', 156, 0, 0, '  0633391350', '    -    ', '  -  '),
(197, 'CEFERINO CASTANO ', 'Leandro', '2013-06-16', '1', 'débutant', '50 Rue Molière   94200 IVRY SUR SEINE', 157, 0, 0, '  0610661197', 'CEFERINO RAMIREZ Felipe - CASTANO TABARES Nathalia', '0627374028 - 0610661197'),
(198, 'CEFERINO CASTANO ', 'Alexander', '2015-09-08', '1', 'débutant', '50 Rue Molière   94200 IVRY SUR SEINE', 157, 0, 0, '  0610661197', 'CEFERINO RAMIREZ Felipe - CASTANO TABARES Nathalia', '0627374028 - 0610661197'),
(199, 'CEFERINO RAMIREZ ', 'Felipe ', '1985-10-29', '1', 'débutant', '50 Rue Molière   94200 IVRY SUR SEINE', 158, 0, 0, '  0627374028', '    -    ', '  -  '),
(200, 'Ekra', 'Inaya', '2014-12-27', '0', 'intermédiaire', '39 Rue Ampère   94200 Ivry sur seine', 159, 0, 0, '  0768585624', 'Moutsita Mankou Orestie - Ekra Mothie herve', '0768585624 - 0616595622'),
(201, 'Ekra', 'Layana ', '2016-03-03', '0', 'intermédiaire', '39 Rue Ampère   94200 Ivry sur seine', 159, 0, 0, '  0768585624', 'Moutsita Mankou Orestie - Ekra Mothie herve', '0768585624 - 0616595622'),
(202, 'ADELAIDE', 'NATHAN', '2014-08-27', '1', 'débutant', '37 Rue QUARTIER PARISIEN BAT6 PORTE 301 94200 IVRY SUR SEINE', 160, 0, 0, '  0658405053', 'ADELAIDE SABRINA -    ', '0658405053 -  '),
(203, 'BONNET', 'Kays', '2018-07-19', '1', 'débutant', '9 Rue Robespierre   94200 Ivry-sur-Seine', 161, 0, 0, '  0635221482', 'BONNET Bruno - BONNET Asmaa', '0685078333 - 0635221482'),
(204, 'BONNET', 'Kenzy', '2016-07-21', '1', 'débutant', '9 Rue Robespierre   94200 Ivry-sur-Seine', 161, 0, 0, '  0635221482', 'BONNET Bruno - BONNET Asmaa', '0685078333 - 0635221482'),
(205, 'BEN ICHOU LEPRINCE', 'Saül', '2017-01-07', '1', 'intermédiaire', '43 Rue DES FRERES BLAIS   94200 IVRY SUR SEINE', 34, 0, 0, '0626454992 0626454992', 'BEN ICHOU Mathieu - LEPRINCE CHLOE', '0626454992 - 0665523836'),
(206, 'BEN ICHOU LEPRINCE', 'Ismaël', '2013-08-01', '1', 'intermédiaire', '43 Rue DES FRERES BLAIS   94200 IVRY SUR SEINE', 34, 0, 0, '0626454992 0626454992', 'BEN ICHOU Mathieu - LEPRINCE CHLOE', '0626454992 - 0665523836'),
(207, 'kullab', 'perla', '2017-07-10', '0', 'débutant', '33 Rue ledru rollin   94200 Ivry-sur-Seine', 135, 0, 0, '  0636100825', '    -    ', '  -  '),
(208, 'kullab', 'almas', '2015-08-10', '0', 'intermédiaire', '33 Rue ledru rollin   94200 Ivry sur seine', 135, 0, 0, '  0636100825', 'kullab ezzaldeen -    ', '  -  '),
(209, 'Mahadevan ', 'Sara', '2017-08-31', '0', 'débutant', '100 Rue Hoche   94200 Ivry-sur-Seine', 162, 0, 0, '  0139079011', 'Mahadevan Mangayatkarasi - Mahadevan Karunakaran', '0766364766 - 0651337139'),
(210, 'Touré', 'Joane ', '2015-04-28', '0', 'débutant', '33 Rue Marceau   94200 Ivry sur seine', 155, 0, 0, '0662521841 0662521841', 'Tichet Anne Laure - Touré Charles André', '0662521841 - 0681470910'),
(211, 'SISOURAT', 'Charlie', '2012-08-08', '0', 'intermédiaire', '57 Rue Jean Le Galleu   94200 Ivry Sur Seine', 163, 0, 0, '  0688497919', '    -    ', '  -  '),
(212, 'Diop', 'Hafsa Awa', '2013-01-06', '0', 'débutant', '16 Rue Gaston Monmousseau Bâtiment F 94200 Ivry Sur seine', 164, 0, 0, '   ', 'Seck Fatou -    ', '06 50 79 97 72 -  '),
(213, 'weber', 'medeline', '2015-12-15', '0', 'débutant', '10 Rue louis bertrand   94200 ivry sur seine', 165, 0, 0, '  0666784779', 'weber franck - bordelet noellie', '0666784779 - 0642648047'),
(214, 'de Boisgisson', 'Rita', '2013-06-24', '0', 'intermédiaire', '19 Rue louis fablet   94200 ivry sur seine', 166, 0, 0, '   ', 'de Boisgisson Laurent - de Boisgisson Amandine', '0645830371 - 0686479363'),
(215, 'Zavaro', 'Nina', '2016-06-07', '0', 'débutant', '175 Rue Marcel Hartmann   94200 Ivry-sur-Seine', 167, 0, 0, '0607497282  ', 'Zavaro Arthur - Motte Victoria', '0607497282 - 0662054427'),
(216, 'Zavaro ', 'Arthur ', '1987-03-26', '1', 'intermédiaire', '175 Rue Marcel Hartmann   94200 Ivry-sur-Seine', 167, 0, 0, '  0607497282', '    -    ', '  -  '),
(217, 'Miralles Oudin', 'Isabel ', '2017-12-26', '0', 'débutant', '2 Rue rue Pierre Guignois   94200 Ivry-syr-Seine', 168, 0, 0, '   ', 'Miralles Yuna - Oudin Dorian', '0695054932 - 0652354498'),
(218, 'Miralles', 'Yuna', '1986-03-14', '0', 'débutant', '2 Rue Pierre Guignois batiment 3 94200 Ivry-sur-Seine', 168, 0, 0, '   ', '    -    ', '  -  '),
(219, 'RABHI', 'AMELIA', '2017-03-17', '0', 'débutant', '2 Allée JACQUES LALOE BAT A1 94200 IVRY SUR SEINE', 169, 0, 0, '   ', 'RABHI SOUAD - RABHI ABDELKARIM', '0642387166 - 0679515449'),
(220, 'Bahraoui ', 'Ilyass', '2012-10-06', '1', 'avancé', '3bis Rue René Robin   94200 Ivry sur Seine', 170, 0, 0, '   ', 'Bahraoui Salah-eddine - Chagraoui Lamia', '0661810392 - 0648583800'),
(221, 'Makaya', 'Esther', '2016-02-17', '0', 'débutant', '6 Allée jacques laloe   94200 Ivry', 171, 0, 0, '   ', 'makaya landry - makaya nina', '0658091568 - 0668284703'),
(222, 'Makaya', 'Esdras', '2014-11-01', '1', 'débutant', '6 Allée jacques laloe   94200 Ivry', 171, 0, 0, '   ', 'makaya landry - makaya nina', '0658091568 - 0668284703'),
(223, 'Daguenet Michel', 'Camille', '2012-12-05', '0', 'intermédiaire', '53 Rue Molière   94200 Ivry-sur-Seine', 172, 0, 0, '  0681354479', 'Daguenet Ninon - Michel Laurent', '0681354479 - 0676201853'),
(224, 'Willième', 'Romane', '2015-12-02', '0', 'débutant', '19 Avenue anatole france   94400 Vitry sur seine', 173, 0, 0, '  0675447561', 'Melchior Marie-Laure - Willème Dominique', '0675447561 - 0678955674'),
(225, 'saim', 'camilya ', '2018-08-20', '0', 'débutant', '173 Rue Marcel Hartmann   94200 ivry sur seine', 174, 0, 0, '   ', '    -    ', '  -  '),
(226, 'Tavani', 'Elias', '2014-03-02', '0', 'intermédiaire', '3 Avenue AVENUE DU GENERAL LECLERC BATIMENT B2 94200 IVRY SUR SEINE', 115, 0, 0, '0145351510  ', 'TAVANI MAHA - TAVANI AURELIEN', '0650883775 - 0667201521'),
(227, 'Malderez', 'Raphaële', '1985-12-25', '0', 'intermédiaire', '41 Rue des Favorites   75015 Paris', 175, 0, 0, '   ', '    -    ', '  -  '),
(228, 'Miklas', 'Théo', '2016-05-04', '1', 'débutant', '173 Rue Marcel Hartmann bat 4 94200 Ivry-sur-Seine', 176, 0, 0, '0626596426  ', 'Miklas Michal - Miklas Katarzyna', '0626596426 - 0782308996'),
(229, 'Miklas', 'Lena', '2012-10-31', '0', 'débutant', '173 Rue Marcel Hartmann Bat 4 94200 Ivry-sur-Seine', 176, 0, 0, '   ', 'Miklas Michal - Miklas Katarzyna', '0626596426 - 0782308996'),
(230, 'BOURVIC', 'lola', '2015-07-18', '0', 'débutant', '52 Rue RASPAIL   94200 IVRY SUR SEINE', 177, 0, 0, '0145210095  ', 'QUENEL AMANDINE -    ', '0788521479 -  '),
(231, 'CHARPENTIER DOUBIGNY', 'Aden', '2014-07-31', '1', 'débutant', '36 Rue Raspail   94200 Ivry sur seine', 178, 0, 0, '   ', 'DOUBIGNY Marina - CHARPENTIER Thierry', '0649845127 - 0646661075'),
(232, 'CHARPENTIER DOUBIGNY', 'Elouan', '2012-08-20', '1', 'intermédiaire', '36 Rue raspail   94200 Ivry sur seine', 178, 0, 0, '   ', 'DOUBIGNY Marina - CHARPENTIER Thierry', '0649845127 - 0646661075'),
(233, 'LAMOTTE ', 'Beevi ', '2014-01-11', '0', 'débutant', '9 Rue Lucien Nadaire   94200 IVRY SUR SEINE', 179, 0, 0, '0687786382  ', 'NOOR MOHAMED Alyma - LAMOTTE David', '0687786382 - 0670927744'),
(234, 'Grémont Rouzaut', 'Capucine', '2017-04-02', '0', 'débutant', '10 Rue Louis Bertrand   94200 Ivry-sur-Seine', 180, 0, 0, '   ', 'Rouzaut Marie - Grémont Adrien', '0610298065 - 0665371234'),
(235, 'Yanès', 'Victoria', '1997-09-02', '0', 'intermédiaire', '5 Chemin Du Parc de Charonne   75020 Paris', 181, 0, 0, '   ', '    -    ', '  -  '),
(236, 'Prefumo', 'Ambre', '2013-09-28', '0', 'débutant', '173 Rue Marcel hartmann Bat 4 94200 Ivry sur seine', 145, 0, 0, '  0699659959', 'Prefumo Fouzia - Prefumo Florian', '0699659959 - 0699660390'),
(244, 'Gagnière', 'Julie', '1983-05-06', '0', 'débutant', '120 Avenue Danielle Casanova   94200 Ivry-sur-Seine', 187, 0, 0, '  0650348872', '    -    ', '  -  '),
(245, 'Gagnière', 'Emma', '2016-07-20', '0', 'débutant', '120 Avenue Danielle Casanova   94200 Ivry-sur-Seine', 187, 0, 0, '  0650348872', 'Gagnière Julie - Gagnière Benoit', '0650348872 - 06 58 74 81 81'),
(243, 'ALAUZET', 'LUISA', '2015-08-05', '0', 'débutant', '43 Rue Camille Groult   94400 Vitry Sur Seine', 85, 0, 0, '  0650281566', 'Alauzet Alexandre - Alauzet Laetitia', '0650281566 - 0613380823'),
(246, 'ITTOBANE', 'Lyzia', '2019-03-31', '0', 'débutant', '31 Rue Michelet   94200 IVRY SUR SEINE', 188, 0, 0, '0 0143903355', 'AIT MOUHOUB / ITTOBANE Nassima - ITTOBANE Jaouad', '0623880405 - 0638190158'),
(247, 'ITTOBANE', 'Anélya', '2013-10-07', '0', 'débutant', '31 Rue MICHELET   94200 ivry sur seine', 188, 0, 0, '  0143903355', 'AIT MOUHOUB / ITTOBANE Nassima - ITTOBANE Jaouad', '0623880405 - 0638190158'),
(248, 'Ekissi', 'Abigail', '2015-08-19', '0', 'débutant', '37 Rue René Villars   94200 Ivry-sur-Seine', 189, 0, 0, '0625592957 0625592957', 'Deprez Rébecca - Ekissi Landry', '0625592957 - 0762888762'),
(249, 'ARABI', 'Lia', '2010-12-13', '0', 'débutant', '66 Avenue Jean Jaurès   Vitry-sur-seine 94400', 190, 0, 0, '0651232551 0651232551', 'HOUGUET Mélanie -    ', '0651232551 -  '),
(250, 'Zavaro ', 'Léon ', '2014-05-26', '1', 'débutant', '175 Rue Marcel Hartmann   94200 Ivry-sur-Seine', 167, 0, 0, '  0607497282', 'Zavaro Arthur - Motte Victoria', '0607497282 - 0662054427'),
(251, 'Ospina Ceferino', 'Anais', '2016-12-11', '0', 'débutant', '18 Rue d\'Estienne d\'Orves   94240 l\'haÿ-les-roses', 191, 0, 0, '  0613317986', 'Ceferino Ramirez Leidy Johanna - Hurtado gil Natalia', '0613317986 - 0623486612'),
(252, 'Hurtado ceferino', 'Stéphanie ', '2006-07-24', '0', 'débutant', '18 Rue d\'Estienne   94240 l\'hay les roses', 192, 0, 0, '  0603414198', 'ceferino ramírez leidy - Hurtado gil Natalia', '0613317986 - 0623486612'),
(253, 'Meghiref ', 'Acyl', '2015-03-19', '1', 'débutant', '162 Rue Marcel Hartmann   94200 Ivry-sur-Seine', 193, 0, 0, '  0649869801', 'Meghiref Karima - Meghiref Oussama', '0649869801 - 0649829733'),
(254, 'Quehan', 'Margot', '2011-10-31', '0', 'avancé', '65 Boulevard Hippolyte Marques Batiment 16 94200 Ivry-sur-Seine', 194, 0, 0, '  0623570346', 'HERISSON Isabelle -    ', '0623570346 -  '),
(255, 'Melliti ', 'Safiyah', '2014-11-28', '0', 'débutant', '92 Rue Jules lagaisse   94400 Vitry sur seine', 195, 0, 0, '  0984461808', 'Guerfi Cherifa - Guerfi Chérifa', '0651356135 - 0651838089'),
(256, 'Melliti ', 'Adam', '2017-02-18', '1', 'débutant', '92 Rue Jules lagaisse   94400 Vitry sur seine', 195, 0, 0, '  0984461808', 'Guerfi Chérifa - Guerfi Fatma', '0651356135 - 0651838089'),
(259, 'Morice', 'Erika', '1991-04-26', '0', 'débutant', '8 Avenue Gambetta   94600 Choisy Le Roi', 198, 0, 0, '  0686715319', '    -    ', '  -  '),
(260, 'Noémie', 'CROZAT', '1998-09-04', '0', 'débutant', '1 Rue Léon   75018 Paris', 54, 0, 0, '  0652909904', '    -    ', '  -  '),
(261, 'Lafaye ', 'Manon', '1991-03-17', '0', 'débutant', '28 Avenue Henri Barbusse   94200 Ivry-sur-Seine', 96, 0, 0, '  0636369558', '    -    ', '  -  '),
(262, 'Shata', 'Moustafa ', '2017-05-06', '1', 'débutant', '28 Avenue Henri Barbusse   94200 Ivry-sur-Seine', 96, 0, 0, '  0636369558', 'Lafaye Manon -    ', '0636369558 -  '),
(263, 'Mezzina', 'Greta', '1993-12-16', '0', 'débutant', '22 Rue Pierre Brossolette   94200 Ivry sur seiene', 199, 0, 0, '  0601924771', '    -    ', '  -  '),
(264, 'Josserand', 'Sarah', '1992-04-03', '0', 'débutant', '40 Avenue Pierre Brossolette   92240 Malakoff', 200, 0, 0, '  0771811844', '    -    ', '  -  '),
(265, 'Pereira Pinto', 'Maeva', '2012-06-11', '0', 'intermédiaire', '10 Rue Gaston Monmousseau   94200 Ivry-sur-Seine', 201, 0, 0, '  0664857053', 'Pereira Pinto Antonio -    ', '0664857053 -  '),
(266, 'Nlandu ', 'Khloé-eliana ', '2016-08-09', '0', 'débutant', '11 Promenade Promenée du liegat B702 94200 IVRY SUR SEINE', 202, 0, 0, '+33610312889 +33610312889', 'NLandu Laurese -    ', '0610312889 -  '),
(267, 'Bocos', 'Sébastien', '1981-06-16', '1', 'débutant', '107 Rue Bobillot   75013 Paris', 55, 0, 0, '  0786184002', '    -    ', '  -  '),
(268, 'Lepetit', 'Orianne', '1997-04-15', '0', 'débutant', '11 Rue Jeanne d\'Arc   75013 Paris', 203, 0, 0, '  01 45 86 68 88', '    -    ', '  -  '),
(269, 'lixon', 'sophie', '1977-08-03', '0', 'débutant', '7 Rue GEOFFROY SAINT HILAIRE   75005 PARIS', 204, 0, 0, '  0603673174', '    -    ', '  -  ');

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

CREATE TABLE `saison` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `saison`
--

INSERT INTO `saison` (`id`, `nom`, `active`) VALUES
(1, '2022-2023', 0),
(2, '2023-2024', 1);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
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
  `niveau_requis` set('débutant','intermédiaire','avancé') NOT NULL,
  `place_maximum` int(11) DEFAULT NULL,
  `essai_possible` tinyint(1) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL,
  `info_seance` longtext NOT NULL,
  `convocation_nominative` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`seance_id`, `cours`, `libelle`, `date_seance`, `heure_debut`, `duree_cours`, `lieu_id`, `statut`, `age_requis`, `age_maximum`, `niveau_requis`, `place_maximum`, `essai_possible`, `notes`, `info_seance`, `convocation_nominative`) VALUES
(1, 1, NULL, '2023-08-12', '15:34', 90, 1, 'prévue', 0, 0, 'débutant', NULL, 0, '', '', 0),
(2, 1, NULL, '2023-08-12', '14:39', 90, 2, 'prévue', 0, 0, 'débutant', NULL, 0, '', '', 0),
(3, 1, 'Adultes - RollerSoccer', '2023-08-25', '19:00', 90, 2, 'prévue', 14, 99, 'intermédiaire', NULL, 0, '', '', 0),
(4, 3, NULL, '2023-08-17', '15:50', 75, 1, 'prévue', 4, 0, 'débutant', NULL, 0, '', '', 0),
(5, 3, NULL, '2023-08-25', '15:50', 75, 1, 'prévue', 4, 0, 'débutant', NULL, 0, '', '', 0),
(6, 8, 'Adultes - RollBall', '2023-09-13', '20:30', 90, 2, 'prévue', 14, 99, 'intermédiaire', NULL, 0, '', '', 0),
(7, 1, 'Adultes - RollerSoccer', '2023-09-13', '19:00', 90, 2, 'prévue', 14, 99, 'intermédiaire', NULL, 0, '', '', 0),
(8, 16, 'Adultes - Roller Derby', '2023-09-11', '20:00', 120, 2, 'réalisée', 18, 99, 'intermédiaire', NULL, 0, '', '', 0),
(9, 9, 'Adultes - RollerSoccer', '2023-09-13', '19:00', 90, 2, 'réalisée', 13, 99, 'intermédiaire,avancé', NULL, 0, '+ essai', '', 0),
(10, 15, 'Adultes - RollBall', '2023-09-13', '20:30', 90, 2, 'réalisée', 14, 99, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(11, 17, 'Adultes - Roller Derby - Jeudi', '2023-09-14', '20:00', 150, 3, 'réalisée', 18, 99, 'intermédiaire', NULL, 0, '', '', 0),
(12, 10, 'Enfants - Initiation', '2023-09-17', '14:00', 80, 1, 'réalisée', 4, 18, 'débutant', NULL, 0, '', '', 0),
(13, 14, 'Enfants - Roller Street', '2023-09-17', '15:30', 90, 1, 'réalisée', 8, 18, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(14, 11, 'Enfants - Activités : Multiglisse', '2023-09-17', '16:00', 80, 1, 'réalisée', 8, 18, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(15, 12, 'Adultes - Rollers', '2023-09-17', '14:30', 90, 1, 'réalisée', 16, 99, 'débutant,intermédiaire,avancé', NULL, 0, '', '', 0),
(16, 13, 'Enfants - RollerSoccer', '2023-09-17', '17:00', 90, 1, 'réalisée', 8, 18, 'intermédiaire', NULL, 0, '', '', 0),
(17, 9, 'Adultes - RollerSoccer', '2023-09-06', '20:00', 120, 2, 'réalisée', 8, 99, 'intermédiaire', NULL, 0, '', '', 0),
(18, 9, 'Adultes - RollerSoccer', '2023-09-20', '19:00', 90, 2, 'réalisée', 13, 99, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(19, 15, 'Adultes - RollBall', '2023-09-20', '20:30', 90, 2, 'réalisée', 14, 99, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(20, 17, 'Adultes - Roller Derby - Jeudi', '2023-09-21', '20:00', 150, 3, 'réalisée', 18, 99, 'intermédiaire', NULL, 0, '', '', 0),
(21, 18, 'Adultes - Roller Derby Samedi', '2023-09-23', '10:00', 120, 3, 'réalisée', 18, 99, 'intermédiaire', NULL, 0, '', '', 0),
(22, 10, 'Enfants - Initiation', '2023-09-24', '14:00', 80, 1, 'réalisée', 4, 99, 'débutant,intermédiaire', NULL, 0, '', '', 0),
(23, 12, 'Adultes - Rollers', '2023-09-24', '14:30', 90, 1, 'réalisée', 16, 99, 'débutant,intermédiaire,avancé', NULL, 0, '', '', 0),
(24, 11, 'Enfants - Activités : Multiglisse', '2023-09-24', '16:00', 80, 1, 'réalisée', 8, 99, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(25, 14, 'Enfants - Roller Street', '2023-09-24', '15:30', 90, 1, 'réalisée', 8, 99, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(26, 13, 'Enfants - RollerSoccer', '2023-09-24', '17:00', 90, 1, 'réalisée', 8, 99, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(27, 10, 'Enfants - Initiation', '2023-10-08', '14:00', 80, 1, 'réalisée', 3, 14, 'débutant,intermédiaire', NULL, 0, '', '', 0),
(28, 11, 'Enfants - Activités : Multiglisse ROLLBALL', '2023-10-08', '16:00', 80, 1, 'réalisée', 5, 18, 'débutant,intermédiaire,avancé', NULL, 0, '', 'Séance RollBall', 0),
(29, 14, 'Enfants - Roller Street', '2023-10-08', '15:30', 90, 1, 'réalisée', 8, 18, 'intermédiaire,avancé', NULL, 0, '', 'Semaine prochaine c\'est sortie en skate park', 0),
(30, 13, 'Enfants - RollerSoccer', '2023-10-08', '17:00', 90, 1, 'réalisée', 8, 18, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(31, 9, 'Adultes - RollerSoccer', '2023-10-11', '19:00', 90, 2, 'réalisée', 13, 99, 'intermédiaire,avancé', NULL, 1, '', '', 0),
(32, 15, 'Adultes - RollBall', '2023-10-11', '20:30', 90, 2, 'réalisée', 14, 99, 'intermédiaire,avancé', NULL, 1, '', '', 0),
(33, 10, 'Enfants - Initiation', '2023-10-15', '14:00', 80, 1, 'réalisée', 3, 18, 'débutant,intermédiaire', NULL, 0, 'Blessure Aden (fracture du pouce)', '', 0),
(34, 11, 'Enfants - Activités : Multiglisse', '2023-10-15', '16:00', 80, 1, 'réalisée', 5, 18, 'intermédiaire,avancé', NULL, 0, 'Jayla perla emma layana kadia rokia enaya ekra swaann', 'Programme à définir', 0),
(35, 14, 'Roller Street', '2023-10-15', '15:30', 90, 1, 'réalisée', 8, 18, 'intermédiaire,avancé', 15, 0, 'essai (voir Yoro)', 'Sortie au skate park de Vitry,  n\'hésitez pas à venir nous accompagner!', 0),
(36, 13, 'Enfants - RollerSoccer', '2023-10-15', '17:00', 90, 1, 'réalisée', 5, 18, 'intermédiaire,avancé', NULL, 0, '+ essai Amel', '', 0),
(37, 9, 'Adultes - RollerSoccer', '2023-10-18', '19:00', 90, 2, 'réalisée', 13, 99, 'intermédiaire,avancé', NULL, 1, '', '', 0),
(38, 15, 'Adultes - RollBall', '2023-10-18', '20:30', 90, 2, 'réalisée', 14, 99, 'intermédiaire,avancé', NULL, 1, '', '', 0),
(39, 12, 'Adultes - Rollers', '2023-10-08', '14:30', 90, 1, 'réalisée', 15, 99, 'débutant,intermédiaire,avancé', NULL, 0, '+ essai Pauline / Adrien', '', 0),
(40, 12, 'Adultes - Rollers', '2023-10-15', '14:30', 90, 1, 'réalisée', 15, 99, 'débutant,intermédiaire,avancé', NULL, 0, '', '', 0),
(41, 12, 'Adultes - Rollers', '2023-10-01', '14:30', 90, 1, 'réalisée', 15, 99, 'débutant,intermédiaire,avancé', NULL, 0, '', '', 0),
(42, 10, 'Enfants - Initiation', '2023-10-22', '14:00', 80, 1, 'réalisée', 3, 15, 'débutant,intermédiaire', NULL, 0, '', '', 0),
(43, 12, 'Adultes - Rollers', '2023-10-22', '14:30', 90, 1, 'réalisée', 15, 99, 'débutant,intermédiaire,avancé', NULL, 0, '', '', 0),
(44, 14, 'Enfants - Roller Street', '2023-10-22', '15:30', 90, 1, 'prévue', 8, 18, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(45, 11, 'Enfants - Activités : Multiglisse', '2023-10-22', '16:00', 80, 1, 'prévue', 5, 18, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(46, 13, 'Enfants - RollerSoccer (risque annulation car possible match)', '2023-10-22', '17:00', 90, 1, 'annulée', 5, 18, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(47, 9, 'Adultes - RollerSoccer', '2023-10-25', '19:00', 90, 2, 'prévue', 13, 99, 'intermédiaire,avancé', NULL, 1, '', '', 0),
(48, 15, 'Adultes - RollBall', '2023-10-25', '20:30', 90, 2, 'prévue', 14, 99, 'intermédiaire,avancé', NULL, 1, '', '', 0),
(49, 10, 'Enfants - Initiation', '2023-10-29', '14:00', 80, 1, 'prévue', 3, 15, 'débutant,intermédiaire', NULL, 0, '', '', 0),
(50, 12, 'Adultes - Rollers', '2023-10-29', '14:30', 90, 1, 'prévue', 15, 99, 'débutant,intermédiaire,avancé', NULL, 0, '', '', 0),
(51, 11, 'Enfants - Activités : Multiglisse', '2023-10-29', '16:00', 80, 1, 'prévue', 5, 18, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(52, 13, 'Enfants - RollerSoccer', '2023-10-29', '17:00', 90, 1, 'prévue', 5, 16, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(53, 10, 'Enfants - Initiation', '2023-11-05', '14:00', 80, 1, 'prévue', 3, 15, 'débutant,intermédiaire', NULL, 0, '', '', 0),
(54, 12, 'Adultes - Rollers', '2023-11-05', '14:30', 90, 1, 'prévue', 15, 99, 'débutant,intermédiaire,avancé', NULL, 0, '', '', 0),
(55, 11, 'Enfants - Activités : Multiglisse', '2023-11-05', '16:00', 80, 1, 'prévue', 5, 18, 'débutant,intermédiaire,avancé', NULL, 0, '', '', 0),
(56, 14, 'Enfants - Roller Street', '2023-11-05', '15:30', 90, 1, 'prévue', 8, 18, 'intermédiaire,avancé', NULL, 0, '', '', 0),
(57, 13, 'Enfants - RollerSoccer', '2023-11-05', '17:00', 90, 1, 'prévue', 5, 16, 'intermédiaire,avancé', NULL, 0, '', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `seance_professeur`
--

CREATE TABLE `seance_professeur` (
  `seance_id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `seance_professeur`
--

INSERT INTO `seance_professeur` (`seance_id`, `professeur_id`) VALUES
(1, 31),
(1, 42),
(2, 42),
(3, 42),
(4, 31),
(4, 42),
(5, 31),
(7, 42),
(6, 24),
(7, 31),
(3, 31),
(8, 74),
(9, 31),
(9, 42),
(10, 24),
(11, 74),
(12, 149),
(12, 151),
(13, 149),
(13, 151),
(14, 150),
(15, 150),
(41, 150),
(16, 151),
(17, 31),
(17, 42),
(10, 154),
(42, 257),
(18, 31),
(18, 42),
(19, 24),
(19, 154),
(20, 74),
(21, 74),
(22, 149),
(22, 151),
(23, 150),
(24, 150),
(25, 149),
(25, 151),
(26, 151),
(27, 151),
(27, 47),
(28, 150),
(28, 31),
(29, 151),
(30, 151),
(30, 31),
(31, 31),
(31, 42),
(32, 24),
(32, 154),
(33, 151),
(47, 42),
(34, 150),
(35, 151),
(47, 31),
(36, 151),
(36, 31),
(37, 31),
(37, 42),
(38, 154),
(53, 149),
(39, 150),
(40, 150),
(42, 151),
(42, 149),
(44, 151),
(44, 257),
(45, 150),
(45, 257),
(46, 151),
(46, 31),
(43, 150),
(33, 257),
(34, 257),
(48, 24),
(48, 155),
(48, 154),
(49, 149),
(49, 151),
(49, 257),
(50, 150),
(51, 150),
(51, 257),
(52, 151),
(53, 257),
(53, 151),
(54, 150),
(55, 257),
(55, 150),
(56, 149),
(56, 151),
(57, 151),
(57, 31);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prof_principal_id` (`prof_principal_id`);

--
-- Index pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personne_id` (`rider_id`),
  ADD KEY `seance_id` (`seance_id`);

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rb_buts`
--
ALTER TABLE `rb_buts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rb_match`
--
ALTER TABLE `rb_match`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rb_players`
--
ALTER TABLE `rb_players`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rb_teams`
--
ALTER TABLE `rb_teams`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rb_tour`
--
ALTER TABLE `rb_tour`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `riders`
--
ALTER TABLE `riders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `saison`
--
ALTER TABLE `saison`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`seance_id`),
  ADD KEY `cours_id` (`cours`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=529;

--
-- AUTO_INCREMENT pour la table `lieu`
--
ALTER TABLE `lieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `rb_buts`
--
ALTER TABLE `rb_buts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rb_match`
--
ALTER TABLE `rb_match`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rb_players`
--
ALTER TABLE `rb_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rb_teams`
--
ALTER TABLE `rb_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `rb_tour`
--
ALTER TABLE `rb_tour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `riders`
--
ALTER TABLE `riders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT pour la table `saison`
--
ALTER TABLE `saison`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `seance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

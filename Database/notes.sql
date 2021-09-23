-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 23. Sep 2021 um 18:08
-- Server-Version: 10.4.18-MariaDB
-- PHP-Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `notes`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `value` float NOT NULL,
  `examName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_subject` int(11) NOT NULL,
  `FK_user` int(11) NOT NULL,
  `FK_semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `notes`
--

INSERT INTO `notes` (`id`, `value`, `examName`, `FK_subject`, `FK_user`, `FK_semester`) VALUES
(11, 5.1, 'Prüfung 1', 4, 1, 1),
(12, 5.2, 'Prüfung 2', 4, 1, 1),
(13, 2.8, 'Algebra 1', 6, 1, 1),
(14, 3.12, 'Brüche', 6, 1, 1),
(15, 2.59, 'Lineare Gleichungen', 6, 1, 1),
(16, 5.1, 'Prüfung 1', 1, 1, 1),
(17, 4.4, 'Prüfung 2', 1, 1, 1),
(18, 5.9, 'Prüfung 3', 1, 1, 1),
(19, 3.3, 'Prüfung 1', 2, 1, 1),
(20, 3.4, 'Prüfung 2', 2, 1, 1),
(21, 3.75, 'Mündlichprüfung', 2, 1, 1),
(22, 2.3, 'Voc 1', 3, 1, 1),
(23, 3.85, 'Voc 2', 3, 1, 1),
(24, 3, 'Voc 3', 3, 1, 1),
(25, 3, 'Voc 4', 3, 1, 1),
(26, 4, 'Online Prüfung 1', 5, 1, 1),
(27, 5, 'Französische Revolution & Napoleon', 4, 1, 2),
(28, 4.37, 'Lineare Gleichungssysteme', 6, 1, 2),
(29, 5.2, 'Prüfung 4', 1, 1, 2),
(30, 4.9, 'Prüfung 5', 1, 1, 2),
(31, 5.4, 'Datenmodell implementieren', 7, 1, 1),
(32, 5.3, 'Codierungs-, Kompressions- und Verschlüsselungsverfahren einsetzen', 8, 1, 1),
(37, 4.2, 'LB1', 16, 1, 1),
(38, 4.2, 'LB2', 16, 1, 1),
(39, 5, 'LB1', 23, 1, 1),
(40, 4.2, 'LB2-T1', 23, 1, 1),
(41, 3.7, 'LB2-T2', 23, 1, 1),
(42, 5.1, 'LB2-T3', 23, 1, 1),
(43, 6, 'LB2-T4', 23, 1, 1),
(44, 4.8, 'LB2', 23, 1, 1),
(45, 5.1, 'LB3', 23, 1, 1),
(46, 5, 'Sozialkompetenzen', 23, 1, 1),
(47, 5.5, 'Sozialkompetenzen', 16, 1, 1),
(48, 4.8, 'Prüfung 1', 39, 1, 1),
(49, 4.7, 'Prüfung 2', 39, 1, 1),
(50, 5.2, 'Prüfung 3', 39, 1, 1),
(51, 5.5, 'Kompetenzraster', 43, 1, 1),
(52, 6, 'Abschluss', 11, 1, 1),
(53, 5.5, 'Abschluss', 17, 1, 1),
(54, 5.5, 'Abschluss', 18, 1, 1),
(55, 1.3, 'Französisch Voci 1', 3, 1, 2),
(56, 1.9, 'Französisch Prüfung 1', 2, 1, 2),
(57, 4.25, 'Französisch IDAF', 2, 1, 2),
(58, 4.6, 'BWL Online Prüfung Bewerbungen', 5, 1, 2),
(68, 2, 'Voci 2', 3, 1, 2),
(70, 3.5, 'Quadratische Gleichungen', 6, 1, 2),
(71, 2.7, 'Französisch 3/4', 2, 1, 2),
(76, 2.6, 'Voci 3', 3, 1, 2),
(93, 5.2, 'LB3', 7, 1, 0),
(94, 5.8, 'LB2', 7, 1, 0),
(95, 6, 'LB2', 8, 1, 0),
(96, 5.1, 'LB3', 8, 1, 0),
(97, 6, 'Abschlussprüfung 105', 20, 1, 0),
(99, 4.7, 'Prüfung 2 (CH und Industrialisierung)', 4, 1, 2),
(100, 3.2, 'Prüfung 6', 1, 1, 2),
(103, 4, 'Prüfung 3', 5, 1, 2),
(106, 6, 'Uek-307 Abschlussnote', 54, 1, 2),
(107, 3.8, 'Trigonometrie', 6, 1, 2),
(108, 2, 'Prüfung', 2, 1, 2),
(113, 3.8, 'idk', 4, 22, 2),
(114, 4.6, 'Prüfung 1', 1, 23, 2),
(115, 3.7, 'Prüfung 2', 1, 23, 2),
(116, 4.6, 'Prüfung 3', 1, 23, 2),
(120, 5.3, 'Prüfung 1', 40, 1, 1),
(121, 5.1, 'LB1', 26, 1, 1),
(122, 4.6, 'LB2', 26, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `schoolName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `schools`
--

INSERT INTO `schools` (`id`, `schoolName`) VALUES
(1, 'BMS'),
(2, 'LAP');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `semesters`
--

CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `semesterTag` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `semesters`
--

INSERT INTO `semesters` (`id`, `semesterTag`) VALUES
(0, 'BMS Abschlussnoten'),
(1, 'Sommer 2020 - Winter 2021'),
(2, 'Winter 2021 - Sommer 2021'),
(12, 'Sommer 2021 - Winter 2022');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `session_links`
--

CREATE TABLE `session_links` (
  `id` int(11) NOT NULL,
  `FK_user` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` int(6) NOT NULL,
  `create_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `session_links`
--

INSERT INTO `session_links` (`id`, `FK_user`, `link`, `token`, `create_date`) VALUES
(225, 1, 'cd999e56c354de350c24d4c07f0c1d6c2bda1f506b9cf5ae0a4008bf83ae1a45', 517471, '2021-07-12'),
(226, 1, 'ec5cb8d2a0d11de9adb8de9cb5eba641e9913f644c0a946b52e40f2e235a0942', 737890, '2021-07-12');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stickynotes`
--

CREATE TABLE `stickynotes` (
  `PK_stickynote` int(11) NOT NULL,
  `createtime` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Neue Notiz',
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `stickynotes`
--

INSERT INTO `stickynotes` (`PK_stickynote`, `createtime`, `title`, `value`, `FK_user`) VALUES
(39, '2021-06-30 11:33:18', 'Florianisverydumb', '{\"time\":1625045754309,\"blocks\":[{\"id\":\"RejGuO5Q3_\",\"type\":\"header\",\"data\":{\"text\":\"Hello\",\"level\":2}},{\"id\":\"wqve6dcE6N\",\"type\":\"paragraph\",\"data\":{\"text\":\":)\"}},{\"id\":\"7lObhYpZhm\",\"type\":\"table\",\"data\":{\"content\":[[\"X\",\"\",\"X\"],[\"\",\"X\",\"O\"],[\"O\",\"\",\"\"]]}}],\"version\":\"2.22.1\"}', 22),
(42, '2021-07-08 08:51:40', 'Schulden Mama', '{\"time\":1625732424725,\"blocks\":[{\"id\":\"hi1mlJcAsy\",\"type\":\"header\",\"data\":{\"text\":\"Schulden Mama\",\"level\":2}},{\"id\":\"JT1u7t_w44\",\"type\":\"table\",\"data\":{\"content\":[[\"Helm &amp; Handschuhe\",\"233.33\"],[\"Neue Fussraste\",\"56.14\"],[\"Motorrad\",\"4600\"],[\"Grundkurs\",\"?\"],[\"Verkehrskunde\",\"139\"],[\"Tanken\",\"15\"],[\"1. Versicherungsrechnung\",\"400\"],[\"Total\",\"5’443.47\"]]}}],\"version\":\"2.22.1\"}', 1),
(44, '2021-07-12 16:11:22', 'Test', '{\"time\":1629975409821,\"blocks\":[{\"id\":\"M1R35Hjiqr\",\"type\":\"header\",\"data\":{\"text\":\"Test\",\"level\":2}},{\"id\":\"D6-TfG9Q-S\",\"type\":\"table\",\"data\":{\"withHeadings\":false,\"content\":[[\"d\",\"\"]]}}],\"version\":\"2.22.2\"}', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subjectName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_school` int(11) NOT NULL,
  `additionalTag` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `subjects`
--

INSERT INTO `subjects` (`id`, `subjectName`, `FK_school`, `additionalTag`) VALUES
(1, 'Chemie', 1, NULL),
(2, 'Französisch', 1, NULL),
(3, 'Französisch Vokabeln', 1, NULL),
(4, 'Geschichte', 1, NULL),
(5, 'BWL', 1, NULL),
(6, 'Mathematik', 1, NULL),
(7, 'M104', 2, 'Berufsfachschule Module'),
(8, 'M114', 2, 'Berufsfachschule Module'),
(11, 'M304', 2, 'ÜK Module'),
(12, 'Resultat der Arbeit', 2, 'IPA Abschlussprüfung'),
(13, 'Dokumentation', 2, 'IPA Abschlussprüfung'),
(15, 'Fachgespräch und Präsentation', 2, 'IPA Abschlussprüfung'),
(16, 'M100', 2, 'Berufsfachschule Module'),
(17, 'M305', 2, 'ÜK Module'),
(18, 'M101', 2, 'ÜK Module'),
(19, 'M318', 2, 'ÜK Module'),
(20, 'M105', 2, 'ÜK Module'),
(21, 'M107', 2, 'ÜK Module'),
(22, 'M335', 2, 'ÜK Module'),
(23, 'M117', 2, 'Berufsfachschule Module'),
(24, 'M120', 2, 'Berufsfachschule Module'),
(25, 'M122', 2, 'Berufsfachschule Module'),
(26, 'M123', 2, 'Berufsfachschule Module'),
(27, 'M133', 2, 'Berufsfachschule Module'),
(28, 'M150', 2, 'Berufsfachschule Module'),
(29, 'M151', 2, 'Berufsfachschule Module'),
(30, 'M152', 2, 'Berufsfachschule Module'),
(31, 'M153', 2, 'Berufsfachschule Module'),
(32, 'M183', 2, 'Berufsfachschule Module'),
(33, 'M214', 2, 'Berufsfachschule Module'),
(34, 'M226', 2, 'Berufsfachschule Module'),
(35, 'M242', 2, 'Berufsfachschule Module'),
(36, 'M254', 2, 'Berufsfachschule Module'),
(37, 'M306', 2, 'Berufsfachschule Module'),
(38, 'M326', 2, 'Berufsfachschule Module'),
(39, 'M403', 2, 'Berufsfachschule Module'),
(40, 'M404', 2, 'Berufsfachschule Module'),
(41, 'M411', 2, 'Berufsfachschule Module'),
(42, 'M426', 2, 'Berufsfachschule Module'),
(43, 'M431', 2, 'Berufsfachschule Module'),
(54, 'M307', 2, 'ÜK Module');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `passwordhash` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profilepicture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'defaultpb.jpg',
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_confirmed`, `passwordhash`, `profilepicture`, `admin`) VALUES
(1, 'Florian Gubler', 'gubler.florian@gmx.net', 1, '7527334b5de227445adccbf52e9671178e310e3c8f41a6bda7399fa9aecfd8b6', 'profilepicture_7.jpg', 1),
(21, 'Test User', 'vijanet227@jq600.com', 1, '09d0e941cc7d677ebb635eac989ca3271297dbdfece6398307bf75c0b7efa3e1', 'defaultpb.jpg', 1),
(22, 'Nino Arisona', 'nino@shitmail.me', 1, 'e880f3529ec8d3719b13d2019aa8572a71d8eb7fc911418e0e972b36fe723383', 'profilepicture_5.jpg', 0),
(23, 'Jon Bunjaku', 'bunjakujon123@gmail.com', 0, '060103dee161e268fd1b31abecbf371444364fd9d513f3064398463c159d3f4d', 'profilepicture_6.jpg', 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_subject` (`FK_subject`),
  ADD KEY `FK_semester` (`FK_semester`),
  ADD KEY `FK_user` (`FK_user`);

--
-- Indizes für die Tabelle `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `session_links`
--
ALTER TABLE `session_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_links` (`FK_user`);

--
-- Indizes für die Tabelle `stickynotes`
--
ALTER TABLE `stickynotes`
  ADD PRIMARY KEY (`PK_stickynote`);

--
-- Indizes für die Tabelle `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subjectName` (`subjectName`),
  ADD KEY `FK_school` (`FK_school`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT für Tabelle `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `session_links`
--
ALTER TABLE `session_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT für Tabelle `stickynotes`
--
ALTER TABLE `stickynotes`
  MODIFY `PK_stickynote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT für Tabelle `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`FK_subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`FK_subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `notes_ibfk_3` FOREIGN KEY (`FK_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notes_ibfk_4` FOREIGN KEY (`FK_semester`) REFERENCES `semesters` (`id`),
  ADD CONSTRAINT `notes_ibfk_5` FOREIGN KEY (`FK_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notes_ibfk_6` FOREIGN KEY (`FK_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notes_ibfk_7` FOREIGN KEY (`FK_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notes_ibfk_8` FOREIGN KEY (`FK_user`) REFERENCES `users` (`id`);

--
-- Constraints der Tabelle `session_links`
--
ALTER TABLE `session_links`
  ADD CONSTRAINT `session_links` FOREIGN KEY (`FK_user`) REFERENCES `users` (`id`);

--
-- Constraints der Tabelle `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`FK_school`) REFERENCES `schools` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 31, 2024 at 09:28 AM
-- Server version: 10.3.36-MariaDB-0+deb10u2
-- PHP Version: 7.3.31-1~deb10u5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tai_mole`
--

-- --------------------------------------------------------

--
-- Table structure for table `Actions`
--

CREATE TABLE `Actions` (
  `Id` int(11) NOT NULL,
  `Id_utilisateur` int(11) DEFAULT NULL,
  `Id_article` int(11) DEFAULT NULL,
  `Type_action` varchar(255) NOT NULL,
  `Date_action` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Actions`
--

INSERT INTO `Actions` (`Id`, `Id_utilisateur`, `Id_article`, `Type_action`, `Date_action`) VALUES
(1, 1, 2, 'Ajout', '2024-01-03 08:19:30'),
(2, 2, 1, 'Modificaiton', '2023-12-28 08:22:15'),
(3, 2, 2, 'Suppression', '2024-01-01 08:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `Produits`
--

CREATE TABLE `Produits` (
  `Id` int(11) NOT NULL,
  `Nom_produit` varchar(255) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `Date_ajout` date NOT NULL,
  `Emplacement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Produits`
--

INSERT INTO `Produits` (`Id`, `Nom_produit`, `Quantite`, `Date_ajout`, `Emplacement`) VALUES
(1, 't-shirt', 100, '2024-01-10', 'Rangée 1'),
(2, ' Casquettes', 75, '2024-01-01', 'Rangée 3'),
(3, 'Pull', 25, '2024-01-08', 'Rangée 2');

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `Id` int(11) NOT NULL,
  `Nom_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Utilisateurs`
--

CREATE TABLE `Utilisateurs` (
  `Id` int(11) NOT NULL,
  `Nom_utilisateur` varchar(255) NOT NULL,
  `Mot_de_passe` varchar(255) NOT NULL,
  `Id_Role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`Id`, `Nom_utilisateur`, `Mot_de_passe`, `Id_Role`) VALUES
(1, 'admin', 'admin', NULL),
(2, 'user', 'user', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Actions`
--
ALTER TABLE `Actions`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_utilisateur` (`Id_utilisateur`),
  ADD KEY `Id_article` (`Id_article`);

--
-- Indexes for table `Produits`
--
ALTER TABLE `Produits`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Role` (`Id_Role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Actions`
--
ALTER TABLE `Actions`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Produits`
--
ALTER TABLE `Produits`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Roles`
--
ALTER TABLE `Roles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Actions`
--
ALTER TABLE `Actions`
  ADD CONSTRAINT `Actions_ibfk_1` FOREIGN KEY (`Id_utilisateur`) REFERENCES `Utilisateurs` (`Id`),
  ADD CONSTRAINT `Actions_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `Produits` (`Id`);

--
-- Constraints for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD CONSTRAINT `Utilisateurs_ibfk_1` FOREIGN KEY (`Id_Role`) REFERENCES `Roles` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

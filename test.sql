-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 31 jan. 2024 à 11:20
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test`
--

-- --------------------------------------------------------

--
-- Structure de la table `actions`
--

DROP TABLE IF EXISTS `actions`;
CREATE TABLE IF NOT EXISTS `actions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_utilisateur` int(11) DEFAULT NULL,
  `Id_article` int(11) DEFAULT NULL,
  `Type_action` varchar(255) NOT NULL,
  `Date_action` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `Id_utilisateur` (`Id_utilisateur`),
  KEY `Id_article` (`Id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `actions`
--

INSERT INTO `actions` (`Id`, `Id_utilisateur`, `Id_article`, `Type_action`, `Date_action`) VALUES
(1, 1, 2, '1', '2024-01-03 08:19:30'),
(2, 2, 1, '2', '2023-12-28 08:22:15'),
(3, 2, 2, '3', '2024-01-01 08:23:14');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_produit` varchar(255) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `Date_ajout` date NOT NULL,
  `Emplacement` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`Id`, `Nom_produit`, `Quantite`, `Date_ajout`, `Emplacement`) VALUES
(1, 't-shirt', 100, '2024-01-10', 'Rangée 1'),
(2, ' Casquettes', 75, '2024-01-01', 'Rangée 3'),
(3, 'Pull', 25, '2024-01-08', 'Rangée 2'),
(4, 'alzk', 150, '2024-01-10', 'RangÃ©e 1');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_role` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`Id`, `Nom_role`) VALUES
(1, 'admin'),
(2, 'employer');

-- --------------------------------------------------------

--
-- Structure de la table `type_d_action`
--

DROP TABLE IF EXISTS `type_d_action`;
CREATE TABLE IF NOT EXISTS `type_d_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type_d_action` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_d_action`
--

INSERT INTO `type_d_action` (`ID`, `Type_d_action`) VALUES
(1, 'Ajout'),
(2, 'Retir'),
(3, 'inventaire');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_utilisateur` varchar(255) NOT NULL,
  `Mot_de_passe` varchar(255) NOT NULL,
  `Id_Role` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Role` (`Id_Role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`Id`, `Nom_utilisateur`, `Mot_de_passe`, `Id_Role`) VALUES
(1, 'admin', 'admin', 1),
(2, 'user', 'user', 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `Actions_ibfk_1` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateurs` (`Id`),
  ADD CONSTRAINT `Actions_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `produits` (`Id`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `Utilisateurs_ibfk_1` FOREIGN KEY (`Id_Role`) REFERENCES `roles` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

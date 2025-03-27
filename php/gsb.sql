-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 27 mars 2025 à 12:53
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `idActivite` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `Dates` date DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `lieu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idActivite`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`idActivite`, `description`, `Dates`, `nom`, `lieu`) VALUES
(1, 'Conférence sur la pharmacologie', '2025-03-20', 'PharmaConf 2025', 'Paris'),
(3, 'Séminaire sur les anti-inflammatoires', '2025-04-05', 'InflammaStop', 'Lyon'),
(4, 'Atelier sur les interactions médicamenteuses', '2025-04-10', 'MediInteract', 'Toulouse');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idActivite` varchar(50) NOT NULL,
  `idUtilisateur` varchar(50) NOT NULL,
  `date_inscription` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_inscription` (`idActivite`,`idUtilisateur`),
  KEY `idUtilisateur` (`idUtilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `idActivite`, `idUtilisateur`, `date_inscription`) VALUES
(1, '1', 'USR002', '2025-03-27'),
(2, '3', 'USR002', '2025-03-27'),
(3, '4', 'USR002', '2025-03-27'),
(4, '4', 'USR003', '2025-03-27');

-- --------------------------------------------------------

--
-- Structure de la table `interactions`
--

DROP TABLE IF EXISTS `interactions`;
CREATE TABLE IF NOT EXISTS `interactions` (
  `idMedicament` varchar(50) NOT NULL,
  `idMedicament_1` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMedicament`,`idMedicament_1`),
  KEY `idMedicament_1` (`idMedicament_1`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `interactions`
--

INSERT INTO `interactions` (`idMedicament`, `idMedicament_1`, `nom`) VALUES
('MED001', 'MED002', 'Doliprane et Ibuprofène - Risque d’ulcères'),
('MED002', 'MED003', 'Ibuprofène et Aspirine - Risque accru de saignemen'),
('MED001', 'MED003', 'Doliprane et Aspirine - Interaction mineure');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `idMedicament` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `effets_therapeutiques` varchar(50) DEFAULT NULL,
  `effets_secondaires` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMedicament`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`idMedicament`, `nom`, `description`, `effets_therapeutiques`, `effets_secondaires`) VALUES
('MED001', 'Doliprane', 'Antalgique et antipyrétique', 'Soulage la douleur, fièvre', 'Nausées, éruptions cutanées'),
('MED002', 'Ibuprofène', 'Anti-inflammatoire', 'Réduit inflammation, douleur', 'Troubles gastro-intestinaux'),
('MED003', 'Aspirine', 'Anticoagulant', 'Prévention des AVC', 'Hémorragies, troubles digestifs');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mdp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idUtilisateur`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `nom`, `prenom`, `email`, `mdp`) VALUES
('USR001', 'Dupont', 'Marie', 'marie.dupont@example.com', '1234'),
('USR002', 'Martin', 'Lucas', 'lucas.martin@example.com', '0'),
('USR003', 'Durand', 'Sophie', 'sophie.durand@example.com', '0');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

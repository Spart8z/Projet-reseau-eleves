-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 08 avr. 2024 à 13:53
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `etudaide`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorieservice`
--

CREATE TABLE `categorieservice` (
  `idCategorie` int(11) NOT NULL,
  `nomCategorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `idEtudiant` int(11) NOT NULL,
  `motDePasse` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `dateNaissance` date NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `numeroTelephone` int(11) NOT NULL,
  `etablissementScolaire` varchar(50) NOT NULL,
  `dateInscription` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `proposer`
--

CREATE TABLE `proposer` (
  `idEtudiant` int(11) NOT NULL,
  `idService` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recevoir`
--

CREATE TABLE `recevoir` (
  `idEtudiant` int(11) NOT NULL,
  `idService` int(11) NOT NULL,
  `avis` varchar(50) NOT NULL,
  `evaluation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `idService` int(11) NOT NULL,
  `nomService` varchar(50) NOT NULL,
  `descriptionService` varchar(50) NOT NULL,
  `idCategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorieservice`
--
ALTER TABLE `categorieservice`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`idEtudiant`);

--
-- Index pour la table `proposer`
--
ALTER TABLE `proposer`
  ADD PRIMARY KEY (`idEtudiant`,`idService`),
  ADD KEY `idService` (`idService`);

--
-- Index pour la table `recevoir`
--
ALTER TABLE `recevoir`
  ADD PRIMARY KEY (`idEtudiant`,`idService`),
  ADD KEY `idService` (`idService`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`idService`),
  ADD KEY `idCategorie` (`idCategorie`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `proposer`
--
ALTER TABLE `proposer`
  ADD CONSTRAINT `proposer_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`idEtudiant`),
  ADD CONSTRAINT `proposer_ibfk_2` FOREIGN KEY (`idService`) REFERENCES `services` (`idService`);

--
-- Contraintes pour la table `recevoir`
--
ALTER TABLE `recevoir`
  ADD CONSTRAINT `recevoir_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`idEtudiant`),
  ADD CONSTRAINT `recevoir_ibfk_2` FOREIGN KEY (`idService`) REFERENCES `services` (`idService`);

--
-- Contraintes pour la table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorieservice` (`idCategorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

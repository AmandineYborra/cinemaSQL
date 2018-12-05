-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aime`
--

DROP TABLE IF EXISTS `aime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aime` (
  `spectateur` varchar(45) NOT NULL,
  `titre` varchar(45) NOT NULL,
  PRIMARY KEY (`spectateur`,`titre`),
  KEY `fk_aime_film` (`titre`),
  CONSTRAINT `fk_aime_film` FOREIGN KEY (`titre`) REFERENCES `film` (`titre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aime`
--

LOCK TABLES `aime` WRITE;
/*!40000 ALTER TABLE `aime` DISABLE KEYS */;
/*!40000 ALTER TABLE `aime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `artiste` (
  `nom` varchar(45) NOT NULL,
  `nation` varchar(45) DEFAULT NULL,
  `sexe` char(1) DEFAULT NULL,
  PRIMARY KEY (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artiste`
--

LOCK TABLES `artiste` WRITE;
/*!40000 ALTER TABLE `artiste` DISABLE KEYS */;
/*!40000 ALTER TABLE `artiste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avu`
--

DROP TABLE IF EXISTS `avu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avu` (
  `spectateur` varchar(45) NOT NULL,
  `titre` varchar(45) NOT NULL,
  PRIMARY KEY (`spectateur`,`titre`),
  KEY `fk_avu_film` (`titre`),
  CONSTRAINT `fk_avu_film` FOREIGN KEY (`titre`) REFERENCES `film` (`titre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avu`
--

LOCK TABLES `avu` WRITE;
/*!40000 ALTER TABLE `avu` DISABLE KEYS */;
/*!40000 ALTER TABLE `avu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `film` (
  `titre` varchar(45) NOT NULL,
  `producteur` varchar(45) DEFAULT NULL,
  `realisateur` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`titre`),
  KEY `fk_film_realise` (`realisateur`),
  CONSTRAINT `fk_film_realise` FOREIGN KEY (`realisateur`) REFERENCES `artiste` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joue`
--

DROP TABLE IF EXISTS `joue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `joue` (
  `titre` varchar(45) NOT NULL,
  `acteur` varchar(45) NOT NULL,
  PRIMARY KEY (`titre`,`acteur`),
  KEY `fk_joue_acteur` (`acteur`),
  CONSTRAINT `fk_joue_acteur` FOREIGN KEY (`acteur`) REFERENCES `artiste` (`nom`),
  CONSTRAINT `fk_joue_film` FOREIGN KEY (`titre`) REFERENCES `film` (`titre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joue`
--

LOCK TABLES `joue` WRITE;
/*!40000 ALTER TABLE `joue` DISABLE KEYS */;
/*!40000 ALTER TABLE `joue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seance`
--

DROP TABLE IF EXISTS `seance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seance` (
  `numero` smallint(6) NOT NULL,
  `nomCine` varchar(45) NOT NULL,
  `horaire` time NOT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `nb_salles` tinyint(4) DEFAULT NULL,
  `heure_ouverture` time DEFAULT NULL,
  PRIMARY KEY (`numero`,`nomCine`,`horaire`),
  KEY `fk_seance_titre` (`titre`),
  CONSTRAINT `fk_seance_titre` FOREIGN KEY (`titre`) REFERENCES `film` (`titre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seance`
--

LOCK TABLES `seance` WRITE;
/*!40000 ALTER TABLE `seance` DISABLE KEYS */;
/*!40000 ALTER TABLE `seance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-05 10:25:19

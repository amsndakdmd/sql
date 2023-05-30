-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: web_dev_agencija
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `drzave`
--

DROP TABLE IF EXISTS `drzave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drzave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drzave`
--

LOCK TABLES `drzave` WRITE;
/*!40000 ALTER TABLE `drzave` DISABLE KEYS */;
INSERT INTO `drzave` VALUES (1,'Srbija'),(2,'Hrvatska'),(3,'Bosna i Hercegovina'),(4,'Crna Gora'),(5,'Francuska'),(6,'Nemacka'),(7,'Danska'),(8,'Slovenija'),(9,'Portugal'),(10,'Izrael'),(11,'Kanada'),(12,'Spanija'),(13,'Sjedinene Americke Drzave'),(14,'Brazil'),(15,'Argentina');
/*!40000 ALTER TABLE `drzave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klijenti`
--

DROP TABLE IF EXISTS `klijenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klijenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `drzave_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drzave_id` (`drzave_id`),
  CONSTRAINT `klijenti_ibfk_1` FOREIGN KEY (`drzave_id`) REFERENCES `drzave` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klijenti`
--

LOCK TABLES `klijenti` WRITE;
/*!40000 ALTER TABLE `klijenti` DISABLE KEYS */;
INSERT INTO `klijenti` VALUES (1,'Ema','ema@bluerock.com','+12505550199',11),(2,'Miguel','miguel@proxima.com','+55283721289',14),(3,'Filipe','filipe@deltawav.com','+1527293286',15),(4,'Lucas,','lucas@quantumleap.com','+342827292',12),(5,'Irena','irena@orion.com','+3862648202929',8);
/*!40000 ALTER TABLE `klijenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leveli_zaposlenih`
--

DROP TABLE IF EXISTS `leveli_zaposlenih`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leveli_zaposlenih` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leveli_zaposlenih`
--

LOCK TABLES `leveli_zaposlenih` WRITE;
/*!40000 ALTER TABLE `leveli_zaposlenih` DISABLE KEYS */;
INSERT INTO `leveli_zaposlenih` VALUES (1,'Junior'),(2,'Intermediate'),(3,'Senior');
/*!40000 ALTER TABLE `leveli_zaposlenih` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plate`
--

DROP TABLE IF EXISTS `plate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `plata` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plate`
--

LOCK TABLES `plate` WRITE;
/*!40000 ALTER TABLE `plate` DISABLE KEYS */;
INSERT INTO `plate` VALUES (1,'Newbie',100000),(2,'Legend',1650000),(3,'Champion',272000);
/*!40000 ALTER TABLE `plate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekat_zaposleni`
--

DROP TABLE IF EXISTS `projekat_zaposleni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekat_zaposleni` (
  `projekat_id` int NOT NULL,
  `zaposleni_id` int NOT NULL,
  KEY `projekat_id` (`projekat_id`),
  KEY `zaposleni_id` (`zaposleni_id`),
  CONSTRAINT `projekat_zaposleni_ibfk_1` FOREIGN KEY (`projekat_id`) REFERENCES `projekti` (`id`),
  CONSTRAINT `projekat_zaposleni_ibfk_2` FOREIGN KEY (`zaposleni_id`) REFERENCES `zaposleni` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekat_zaposleni`
--

LOCK TABLES `projekat_zaposleni` WRITE;
/*!40000 ALTER TABLE `projekat_zaposleni` DISABLE KEYS */;
INSERT INTO `projekat_zaposleni` VALUES (1,7),(1,4),(1,9),(1,3),(1,1),(1,5),(2,4),(2,6),(2,8),(2,10),(2,11),(2,2),(3,12),(3,7),(3,10),(3,3),(3,5),(3,2),(4,6),(4,12),(4,10),(4,3),(4,1),(4,5),(5,12),(5,7),(5,3),(5,9),(5,2),(5,11);
/*!40000 ALTER TABLE `projekat_zaposleni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekti`
--

DROP TABLE IF EXISTS `projekti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `pocetak_projekta` date NOT NULL,
  `kraj_projekta` date DEFAULT NULL,
  `vrste_projekta_id` int NOT NULL,
  `klijent_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vrste_projekta_id` (`vrste_projekta_id`),
  KEY `klijent_id` (`klijent_id`),
  CONSTRAINT `projekti_ibfk_1` FOREIGN KEY (`vrste_projekta_id`) REFERENCES `vrste_projekta` (`id`),
  CONSTRAINT `projekti_ibfk_2` FOREIGN KEY (`klijent_id`) REFERENCES `klijenti` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekti`
--

LOCK TABLES `projekti` WRITE;
/*!40000 ALTER TABLE `projekti` DISABLE KEYS */;
INSERT INTO `projekti` VALUES (1,'BlueRock','2021-05-03','2022-04-18',1,1),(2,'Proxima','2022-04-16','2023-02-03',2,2),(3,'DeltaWave','2021-01-28','2022-08-07',3,3),(4,'QuantumLeap','2023-05-02',NULL,2,4),(5,'Orion','2022-09-06','2023-05-08',2,5);
/*!40000 ALTER TABLE `projekti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_zaposlenih`
--

DROP TABLE IF EXISTS `role_zaposlenih`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_zaposlenih` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_zaposlenih`
--

LOCK TABLES `role_zaposlenih` WRITE;
/*!40000 ALTER TABLE `role_zaposlenih` DISABLE KEYS */;
INSERT INTO `role_zaposlenih` VALUES (1,'Front-end Developer'),(2,'Back-end Developer'),(3,'UI/UX Dizajner');
/*!40000 ALTER TABLE `role_zaposlenih` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrste_projekta`
--

DROP TABLE IF EXISTS `vrste_projekta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vrste_projekta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrste_projekta`
--

LOCK TABLES `vrste_projekta` WRITE;
/*!40000 ALTER TABLE `vrste_projekta` DISABLE KEYS */;
INSERT INTO `vrste_projekta` VALUES (1,'Landing Page'),(2,'Web Aplikacija'),(3,'E-commerce');
/*!40000 ALTER TABLE `vrste_projekta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposleni`
--

DROP TABLE IF EXISTS `zaposleni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zaposleni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level_zaposlenog_id` int NOT NULL,
  `rola_zaposlenog_id` int NOT NULL,
  `plata_id` int NOT NULL,
  `drzava_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `level_zaposlenog_id` (`level_zaposlenog_id`),
  KEY `rola_zaposlenog_id` (`rola_zaposlenog_id`),
  KEY `plata_id` (`plata_id`),
  KEY `drzava_id` (`drzava_id`),
  CONSTRAINT `zaposleni_ibfk_1` FOREIGN KEY (`level_zaposlenog_id`) REFERENCES `leveli_zaposlenih` (`id`),
  CONSTRAINT `zaposleni_ibfk_2` FOREIGN KEY (`rola_zaposlenog_id`) REFERENCES `role_zaposlenih` (`id`),
  CONSTRAINT `zaposleni_ibfk_3` FOREIGN KEY (`plata_id`) REFERENCES `plate` (`id`),
  CONSTRAINT `zaposleni_ibfk_4` FOREIGN KEY (`drzava_id`) REFERENCES `drzave` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposleni`
--

LOCK TABLES `zaposleni` WRITE;
/*!40000 ALTER TABLE `zaposleni` DISABLE KEYS */;
INSERT INTO `zaposleni` VALUES (1,'Anna','Durand','annadurand@gmail.com',3,3,3,5),(2,'Lucija','Modric','lucijamodric@gmail.com',2,3,2,2),(3,'Rasmus','Andersen','rasmusandersen@gmail.com',3,2,3,7),(4,'Tomislav','Blazevic','tomislavblazevic@gmail.com',2,1,2,2),(5,'Hamdija','Nezic','hamdijanezic@gmail.com',1,3,1,3),(6,'Oliver','Smith','oliversmith@gmail.com',3,1,3,13),(7,'Gabriel','Bernard','gabrielbernard@gmail.com',1,1,1,5),(8,'Charlotte','Johnson','charlotteohnson@gmail.com',2,2,2,13),(9,'Andrea','Larsen','andrealarsen@gmail.com',1,2,1,7),(10,'Petar','Jovanovic','petarjovanovic@gmail.com',1,2,1,1),(11,'Amina','Ahmic','aminaahmic@gmail.com',2,3,2,3),(12,'Milica','Markovic','milicamarkovic@gmail.com',3,1,3,1),(13,'Elizabeth','Smith','elizabethsmith@gmail.com',2,1,2,13);
/*!40000 ALTER TABLE `zaposleni` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `firstTrigger` BEFORE INSERT ON `zaposleni` FOR EACH ROW SET NEW.ime = capitalize(NEW.ime), NEW.prezime = capitalize(NEW.prezime) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'web_dev_agencija'
--

--
-- Dumping routines for database 'web_dev_agencija'
--
/*!50003 DROP FUNCTION IF EXISTS `capitalize` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `capitalize`(s varchar(255)) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
  declare c int;
  declare x varchar(255);
  declare y varchar(255);
  declare z varchar(255);

  set x = UPPER( SUBSTRING( s, 1, 1));
  set y = SUBSTR( s, 2);
  set c = instr( y, ' ');

  while c > 0
    do
      set z = SUBSTR( y, 1, c);
      set x = CONCAT( x, z);
      set z = UPPER( SUBSTR( y, c+1, 1));
      set x = CONCAT( x, z);
      set y = SUBSTR( y, c+2);
      set c = INSTR( y, ' ');     
  end while;
  set x = CONCAT(x, y);
  return x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jedan_zaposleni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jedan_zaposleni`(IN id INT)
BEGIN
SELECT zaposleni.id , zaposleni.ime, zaposleni.prezime, leveli_zaposlenih.naziv as level, role_zaposlenih.naziv as rola, plate.naziv as 'naziv plate', plate.plata, drzave.naziv as drzava
FROM zaposleni 
INNER JOIN leveli_zaposlenih on zaposleni.level_zaposlenog_id = leveli_zaposlenih.id
INNER JOIN role_zaposlenih on zaposleni.rola_zaposlenog_id = role_zaposlenih.id
INNER JOIN plate on zaposleni.plata_id = plate.id
INNER JOIN drzave on zaposleni.drzava_id = drzave.id
HAVING zaposleni.id = id
ORDER BY zaposleni.id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `svi_zaposleni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `svi_zaposleni`()
BEGIN
SELECT zaposleni.id , zaposleni.ime, zaposleni.prezime, leveli_zaposlenih.naziv as level, role_zaposlenih.naziv as rola, plate.naziv as 'naziv plate', plate.plata, drzave.naziv as drzava
FROM zaposleni 
INNER JOIN leveli_zaposlenih on zaposleni.level_zaposlenog_id = leveli_zaposlenih.id
INNER JOIN role_zaposlenih on zaposleni.rola_zaposlenog_id = role_zaposlenih.id
INNER JOIN plate on zaposleni.plata_id = plate.id
INNER JOIN drzave on zaposleni.drzava_id = drzave.id
ORDER BY zaposleni.id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-30 22:06:02

-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: modul2
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `firms_guidebook`
--

DROP TABLE IF EXISTS `firms_guidebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firms_guidebook` (
  `idfirms_guidebook` int(11) NOT NULL,
  `firm_code` int(11) DEFAULT NULL,
  `firm_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `firm_adress` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `code_edrpou` int(11) DEFAULT NULL,
  PRIMARY KEY (`idfirms_guidebook`),
  KEY `ss` (`firm_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firms_guidebook`
--

LOCK TABLES `firms_guidebook` WRITE;
/*!40000 ALTER TABLE `firms_guidebook` DISABLE KEYS */;
INSERT INTO `firms_guidebook` VALUES (1,1010,'TOV \"Volya\"','m. Lviv, vul. Rahivska, 19/5',35625716),(2,2020,'TzOV \"Lviv-GALS\"','m. Lviv, vul. Kastelivka, 7/5',20673236),(3,3030,'TOV SP \"Rosan\"','m. Lviv, vul. Zelena, 147',55500251),(4,4040,'PP \"Korpus\"','m. Lviv, vul. Vernadskoho, 38/19',78999113);
/*!40000 ALTER TABLE `firms_guidebook` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-04  7:30:50

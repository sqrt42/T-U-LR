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
-- Table structure for table `sales_guts`
--

DROP TABLE IF EXISTS `sales_guts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_guts` (
  `id` int(11) NOT NULL,
  `sales_code` int(11) DEFAULT NULL,
  `product_code` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productcode_idx` (`product_code`),
  KEY `ordernumber_idx` (`sales_code`),
  CONSTRAINT `ordernumber` FOREIGN KEY (`sales_code`) REFERENCES `sales` (`id`),
  CONSTRAINT `productcode` FOREIGN KEY (`product_code`) REFERENCES `products_guidebook` (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_guts`
--

LOCK TABLES `sales_guts` WRITE;
/*!40000 ALTER TABLE `sales_guts` DISABLE KEYS */;
INSERT INTO `sales_guts` VALUES (1,1,22,1),(2,1,33,5),(3,2,44,21),(4,2,55,15),(5,3,66,18),(6,3,33,12),(7,4,44,9),(8,4,55,5),(9,5,66,10),(10,5,22,1),(11,6,33,5),(12,6,44,6),(13,7,55,2),(14,7,66,14),(15,8,22,15),(16,8,33,11),(17,9,44,12),(18,9,55,9),(19,10,66,8),(20,10,22,3),(21,11,33,5),(22,11,44,10),(23,12,55,16),(24,12,66,2);
/*!40000 ALTER TABLE `sales_guts` ENABLE KEYS */;
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

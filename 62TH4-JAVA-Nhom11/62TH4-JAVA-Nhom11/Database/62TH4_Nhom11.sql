-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: dbhotel
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `tb_bill`
--

DROP TABLE IF EXISTS `tb_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_bill` (
  `id` varchar(20) NOT NULL,
  `room_id` varchar(10) NOT NULL,
  `client_id` varchar(10) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime DEFAULT NULL,
  `servicecharge` double DEFAULT NULL,
  `roomcharge` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key_to_client_idx` (`client_id`),
  KEY `key_to_room_idx` (`room_id`),
  CONSTRAINT `key_to_client` FOREIGN KEY (`client_id`) REFERENCES `tb_client` (`id`),
  CONSTRAINT `key_to_room` FOREIGN KEY (`room_id`) REFERENCES `tb_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bill`
--

LOCK TABLES `tb_bill` WRITE;
/*!40000 ALTER TABLE `tb_bill` DISABLE KEYS */;
INSERT INTO `tb_bill` VALUES ('101KH0120221011777','101','KH01','2022-10-09 00:00:00','2022-10-11 00:00:00',NULL,200),('102KH0120221011666','102','KH01','2022-10-11 00:00:00','2022-10-13 00:00:00',NULL,400),('102KH0120221020830','102','KH01','2022-10-10 00:00:00','2022-10-11 00:00:00',53,200),('102KH0120221022261','102','KH01','2022-10-22 00:00:00','2022-10-22 00:00:00',50,200),('202KH0120221020560','202','KH01','2022-10-20 00:00:00','2022-10-20 00:00:00',2,199),('202KH0220221020196','202','KH02','2022-10-09 00:00:00','2022-10-10 00:00:00',149,199),('202KH0220221020689','202','KH02','2022-10-10 00:00:00','2022-10-20 00:00:00',0,1990),('301KH0420221020759','301','KH04','2022-10-01 00:00:00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_client`
--

DROP TABLE IF EXISTS `tb_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_client` (
  `id` varchar(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `num` varchar(45) DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `age` int DEFAULT NULL,
  `ic` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_client`
--

LOCK TABLES `tb_client` WRITE;
/*!40000 ALTER TABLE `tb_client` DISABLE KEYS */;
INSERT INTO `tb_client` VALUES ('KH01','Tom','030011598',1,12,'001001001'),('KH02','Elsa','033222111',0,15,'002002002'),('KH03','Jerry','030003003',1,15,'003003003'),('KH04','Cinderella','0330118877',0,19,'001001002'),('KH05','Nhân','003004005',1,20,'099999999');
/*!40000 ALTER TABLE `tb_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detail_bill`
--

DROP TABLE IF EXISTS `tb_detail_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_detail_bill` (
  `bill_id` varchar(20) NOT NULL,
  `service_id` varchar(10) NOT NULL,
  `quatity` double NOT NULL,
  PRIMARY KEY (`bill_id`,`service_id`),
  KEY `key_to_service_idx` (`service_id`),
  CONSTRAINT `key_to_bill` FOREIGN KEY (`bill_id`) REFERENCES `tb_bill` (`id`),
  CONSTRAINT `key_to_service` FOREIGN KEY (`service_id`) REFERENCES `tb_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detail_bill`
--

LOCK TABLES `tb_detail_bill` WRITE;
/*!40000 ALTER TABLE `tb_detail_bill` DISABLE KEYS */;
INSERT INTO `tb_detail_bill` VALUES ('102KH0120221020830','SV02',2),('102KH0120221020830','SV03',1),('102KH0120221022261','SV03',1),('202KH0120221020560','SV02',1),('202KH0220221020196','SV02',1),('202KH0220221020196','SV03',3),('301KH0420221020759','SV02',5),('301KH0420221020759','SV03',3);
/*!40000 ALTER TABLE `tb_detail_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room`
--

DROP TABLE IF EXISTS `tb_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_room` (
  `id` varchar(10) NOT NULL,
  `roomtype` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room`
--

LOCK TABLES `tb_room` WRITE;
/*!40000 ALTER TABLE `tb_room` DISABLE KEYS */;
INSERT INTO `tb_room` VALUES ('101','Normal',100,1),('102','VIP',200,1),('103','Family room',110,1),('104','Normal',50,1),('201','VIP',199,1),('202','Pair room',199,1),('203','Family room',179,1),('301','Normal',69,0),('302','VIP',299,1),('303','VIP',319,1);
/*!40000 ALTER TABLE `tb_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_service`
--

DROP TABLE IF EXISTS `tb_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_service` (
  `id` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_service`
--

LOCK TABLES `tb_service` WRITE;
/*!40000 ALTER TABLE `tb_service` DISABLE KEYS */;
INSERT INTO `tb_service` VALUES ('SV01','4 seasons pool',5),('SV02','Coca',2),('SV03','Massage',50);
/*!40000 ALTER TABLE `tb_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_staff`
--

DROP TABLE IF EXISTS `tb_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_staff` (
  `id` varchar(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `birthdate` varchar(40) DEFAULT NULL,
  `gender` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_staff`
--

LOCK TABLES `tb_staff` WRITE;
/*!40000 ALTER TABLE `tb_staff` DISABLE KEYS */;
INSERT INTO `tb_staff` VALUES ('NV01','Minh',1000,'20/10/2002',1),('NV02','Nhân',800,'21/10/2002',1),('NV03','Sơn',700,'19/10/2002',1),('NV04','Thư',199,'19/11/2002',0),('NV05','Việt',699,'08/07/1998',1);
/*!40000 ALTER TABLE `tb_staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-22 17:38:09

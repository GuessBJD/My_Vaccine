-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: my_vaccine
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_acc_id` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_acc_id`),
  UNIQUE KEY `admin_acc_id_UNIQUE` (`admin_acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin00','1234');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant`
--

DROP TABLE IF EXISTS `applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant` (
  `applicant_id` int NOT NULL AUTO_INCREMENT,
  `ic` varchar(14) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` tinyint NOT NULL COMMENT '1 = male;\n0 = female;',
  `phone_no` varchar(12) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`applicant_id`),
  UNIQUE KEY `applicant_id_UNIQUE` (`applicant_id`),
  UNIQUE KEY `ic_UNIQUE` (`ic`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant`
--

LOCK TABLES `applicant` WRITE;
/*!40000 ALTER TABLE `applicant` DISABLE KEYS */;
INSERT INTO `applicant` VALUES (1,'830805-DB-4983','Muhamad Asmin Norazim bin Ainol ',1,'016-300-6540','najmi.kietmar@ban.com','No. 2, Jln Galloway 3/1G, Pangsapuri Hartamas, 08333 Langgar, Kedah Darul Aman'),(2,'780822-EF-1159','Nur Hajjah \'Izzah Aminnudin binti Shahfiq',0,'015-963-7379','duithian.sidhu@saifuddin.com','60, Jln 3/88, Sri Flora, 47613 Sepang, Selangor'),(3,'520213-AC-8758','Ngu Aw Suk',0,'014-906-7133','sakirah.bakti@gmail.com','8, Jln 5/96L, PJU43I, 07372 Jitra, Kedah Darul Aman'),(4,'801218-UV-8921','Mohamed Nik Qays Dzullutfi bin Syahrin',1,'019-218-5670','shaun.soo@gmail.com','No. 70, Jalan Kebun Bunga 8B, Taman Selatan, 15813 Dabong, Kelantan Darul Naim'),(5,'491219-AQ-8510','Muhammet Haji Syed Shauqi Mislan',1,'010-333-5675','jemie.tung@mahathevan.info','20, Jalan Mohana Chandran 7, Seksyen 31Q, 01847 Chuping, Perlis'),(6,'160925-WE-2105','Henry Nii Hu Quan',1,'012-620-1531','nithya37@chai.info','No. 28, Jalan 4, Ara Putra, 31475 Sungkai, Perak'),(7,'630202-VF-3338','Amyra binti Hazwan',0,'018-999-2899','amy40@veeran.info','No. J-34-43, Jalan Kinabalu 3M, PJS39C, 89787 Beaufort, Sabah'),(8,'610613-NT-3251','Nur Naurah binti Abad',0,'013-792-0588','veetil.julian@yahoo.com','1, Jalan Cochrane 2/9D, Petaling Dato Harun, 62501 Precinct 12, Putrajaya'),(9,'411213-KD-0561','Ong Jun Shey',0,'015-258-5560','nyeow@gmail.com','988, Jalan Dang Wangi 3/21, Seksyen 2, 94768 Marudi, Sarawak'),(10,'770407-UG-1730','Jagdeep a/l Yosri Arujunan',1,'015-450-8784','marimuthu.arumugam@gmail.com','3, Jalan 1K, Bandar Seri Indah, 02450 Chuping, Perlis Indera Kayangan');
/*!40000 ALTER TABLE `applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant_vacc_status`
--

DROP TABLE IF EXISTS `applicant_vacc_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant_vacc_status` (
  `ic` varchar(14) NOT NULL,
  `name` varchar(45) NOT NULL,
  `1stdose` tinyint unsigned DEFAULT '0' COMMENT '1 = vaccinated;\\n0 = not;',
  `2nddose` tinyint unsigned DEFAULT '0' COMMENT '1 = vaccinated;\\n0 = not;',
  UNIQUE KEY `ic_UNIQUE` (`ic`),
  CONSTRAINT `ic_fk_applicant_vacc_status` FOREIGN KEY (`ic`) REFERENCES `applicant` (`ic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_vacc_status`
--

LOCK TABLES `applicant_vacc_status` WRITE;
/*!40000 ALTER TABLE `applicant_vacc_status` DISABLE KEYS */;
INSERT INTO `applicant_vacc_status` VALUES ('160925-WE-2105','Henry Nii Hu Quan',0,0),('411213-KD-0561','Ong Jun Shey',0,0),('491219-AQ-8510','Muhammet Haji Syed Shauqi Mislan',0,0),('520213-AC-8758','Ngu Aw Suk',0,0),('610613-NT-3251','Nur Naurah binti Abad',0,0),('630202-VF-3338','Amyra binti Hazwan',0,0),('770407-UG-1730','Jagdeep a/l Yosri Arujunan',0,0),('780822-EF-1159','Nur Hajjah \'Izzah Aminnudin binti Shahfiq',0,0),('801218-UV-8921','Mohamed Nik Qays Dzullutfi bin Syahrin',0,0),('830805-DB-4983','Muhamad Asmin Norazim bin Ainol ',1,0);
/*!40000 ALTER TABLE `applicant_vacc_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `ic` varchar(14) NOT NULL,
  `name` varchar(45) NOT NULL,
  `vacc_center` varchar(45) NOT NULL,
  `vacc_choice` varchar(45) NOT NULL,
  `1stdose_date` date DEFAULT NULL,
  `2nddose_date` date DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  UNIQUE KEY `appointment_id_UNIQUE` (`appointment_id`),
  UNIQUE KEY `ic_UNIQUE` (`ic`) /*!80000 INVISIBLE */,
  CONSTRAINT `ic_fk_appointment` FOREIGN KEY (`ic`) REFERENCES `applicant` (`ic`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'830805-DB-4983','Muhamad Asmin Norazim bin Ainol ','KLTC','AstraZeneca','2021-12-12',NULL),(2,'780822-EF-1159','Nur Hajjah \'Izzah Aminnudin binti Shahfiq','KLTC','AstraZeneca','2021-12-12','2021-12-24'),(3,'520213-AC-8758','Ngu Aw Suk','KLTC','AstraZeneca','2021-12-12','2021-12-24'),(4,'801218-UV-8921','Mohamed Nik Qays Dzullutfi bin Syahrin','KLCC','Sinovac','2021-12-24',NULL),(5,'491219-AQ-8510','Muhammet Haji Syed Shauqi Mislan','KLCC','Sinovac','2021-12-24',NULL),(6,'160925-WE-2105','Henry Nii Hu Quan','KLCC','Sinovac','2021-12-28',NULL),(7,'630202-VF-3338','Amyra binti Hazwan','KLCC','Sinovac',NULL,NULL),(8,'610613-NT-3251','Nur Naurah binti Abad','Stadium Bukit Jalil','Pfizer',NULL,NULL),(9,'411213-KD-0561','Ong Jun Shey','Stadium Bukit Jalil','Pfizer',NULL,NULL),(10,'770407-UG-1730','Jagdeep a/l Yosri Arujunan','Stadium Bukit Jalil','Pfizer',NULL,NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacc_center`
--

DROP TABLE IF EXISTS `vacc_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacc_center` (
  `center_id` int NOT NULL AUTO_INCREMENT,
  `center_name` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `district` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`center_id`),
  UNIQUE KEY `center_id_UNIQUE` (`center_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacc_center`
--

LOCK TABLES `vacc_center` WRITE;
/*!40000 ALTER TABLE `vacc_center` DISABLE KEYS */;
INSERT INTO `vacc_center` VALUES (1,'Dewan 2020','Perlis','Kangar','Taman Budaya, 01000 Kangar, Perlis'),(3,'Dewan Seri Melati','Perlis','Kangar','Jalan Bukit Keteri, 02400 Kangar, Perlis'),(4,'Dewan Serbaguna Jawi','Penang','Seberang Perai','Jln Serindit, Taman Desa Jawi, 14200 Sungai Jawi, Pulau Pinang'),(6,'Penang General Hospital','Penang','George Town','Jalan Residensi, 10990 George Town, Pulau Pinang'),(7,'Swettenham Pier Cruise Terminal','Penang','George Town','Georgetown, 10300 George Town, Penang'),(8,'Majlis Perbandaran Sungai Petani','Kedah','Sungai Petani','Menara MPSPK, Jalan Patani, Sungai Petani, 08000 Sungai Petani, Kedah'),(9,'Dewan Mahsuri','Kedah','Kulim','09400 Padang Serai, Kedah'),(10,'Stadium Sultan Abdul Halim ','Kedah','Alor Setar','Jalan Suka Menanti, Kampung Pumpong, 05250 Alor Setar, Kedah 	'),(11,'Hotel Casuarina @ Meru','Perak','Ipoh','No. 1-C, Jalan Meru Casuarina, Bandar Meru Raya, 30020 Ipoh, Perak '),(12,'Hospital Seri Manjung','Perak','Manjung','32040 Seri Manjung, Perak');
/*!40000 ALTER TABLE `vacc_center` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-26 12:44:08

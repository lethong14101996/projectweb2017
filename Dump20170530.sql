-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pro
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `accid` varchar(10) NOT NULL,
  `accname` varchar(20) NOT NULL,
  `accpassword` varchar(100) NOT NULL,
  `accemail` varchar(1000) NOT NULL,
  `accaddress` varchar(1000) DEFAULT NULL,
  `accactivate` varchar(20) NOT NULL,
  `accrole` varchar(20) NOT NULL,
  `accdate` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`accid`),
  UNIQUE KEY `accounts_username_uindex` (`accname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('AD001','admin','0192023a7bbd73250516f069df18b500','admin@emcb.com','HCMIU','ACTIVATED','ADMINISTRATOR','2016-07-01'),('CU001','user','6ad14ba9986e3615423dfca256d04e3f','ecommercebook2016@gmail.com','AMAZON','ACTIVATED','CUSTOMER','2016-07-01'),('ST001','staff','de9bf5643eabf80f4a56fda3bbb84483','staff@emcb.com','ALIBABA','ACTIVATED','STAFF','2016-07-01');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `ID_category` int(11) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  PRIMARY KEY (`ID_category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'laptop'),(2,'moblie'),(3,'Tv');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myproduct`
--

DROP TABLE IF EXISTS `myproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myproduct` (
  `ID_product` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double(8,4) NOT NULL,
  `ID_supplier` int(11) NOT NULL,
  `ID_status` int(11) NOT NULL,
  `ID_category` int(11) NOT NULL,
  PRIMARY KEY (`ID_product`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myproduct`
--

LOCK TABLES `myproduct` WRITE;
/*!40000 ALTER TABLE `myproduct` DISABLE KEYS */;
INSERT INTO `myproduct` VALUES (1,'MACBOOK PRO','MACBOOK PRO',2500.0000,3,1,1),(2,'ACER','ACER',1800.0000,3,2,1),(3,'ACER 2','ACER 2',1500.0000,3,1,1),(4,'SAMSUNG','SAMSUNG',1300.0000,3,2,1),(5,'Iphone 4','Iphone 4',500.0000,1,1,2),(6,'Iphone 5','Iphone 5',600.0000,1,1,2),(7,'Iphone 6','Iphone 6',700.0000,1,1,2),(8,'Bravia ','32 inch',400.0000,1,1,3),(9,'Bravia ','40 inch',300.0000,1,1,3),(10,'LG','32 inch',200.0000,1,1,3),(12,'rog','laptop gaming',700.0000,1,1,1);
/*!40000 ALTER TABLE `myproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ID_order` int(11) NOT NULL AUTO_INCREMENT,
  `accid` varchar(10) NOT NULL,
  `day` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `totalPrice` double(9,4) NOT NULL,
  PRIMARY KEY (`ID_order`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'CU001',24,5,2017,2500.0000),(2,'CU001',24,5,2017,500.0000),(3,'CU001',24,5,2017,700.0000),(4,'CU001',24,5,2017,700.0000),(5,'CU001',24,5,2017,1800.0000),(6,'CU001',24,5,2017,2500.0000),(7,'CU001',24,5,2017,3600.0000),(8,'CU001',24,5,2017,1800.0000),(9,'CU001',24,5,2017,1800.0000),(10,'CU001',24,5,2017,1300.0000),(11,'CU001',24,5,2017,2500.0000),(12,'CU001',24,5,2017,2500.0000),(13,'CU001',24,5,2017,1400.0000),(14,'CU001',24,5,2017,5000.0000);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderproduct` (
  `ID_list` int(11) NOT NULL AUTO_INCREMENT,
  `ID_order` int(11) NOT NULL,
  `ID_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(9,4) NOT NULL,
  `totalPrice` double(9,4) NOT NULL,
  PRIMARY KEY (`ID_list`,`ID_order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
INSERT INTO `orderproduct` VALUES (1,12,1,1,2500.0000,2500.0000),(2,13,7,2,700.0000,1400.0000),(3,14,1,2,2500.0000,5000.0000);
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productid` varchar(10) NOT NULL,
  `productname` varchar(1000) NOT NULL,
  `productprice` double NOT NULL DEFAULT '0',
  `supplierid` varchar(10) NOT NULL,
  `info` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('P001','shoe',120000,'S001',''),('P002','bag',125236,'S001',''),('P003','balo',85265,'S002',''),('P004','nike',8563.5,'S002',''),('P005','rest',85.236,'S003',''),('P006','jewe',800,'S003',''),('P007','croco',500,'S002',''),('P008','chester',300,'S001',''),('P009','rolex',300000,'S003','');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `range`
--

DROP TABLE IF EXISTS `range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `range` (
  `ID_range` int(11) NOT NULL AUTO_INCREMENT,
  `low` int(11) NOT NULL,
  `high` int(11) NOT NULL,
  PRIMARY KEY (`ID_range`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `range`
--

LOCK TABLES `range` WRITE;
/*!40000 ALTER TABLE `range` DISABLE KEYS */;
INSERT INTO `range` VALUES (1,0,3500),(2,0,1000),(3,0,1000),(4,5000,7000);
/*!40000 ALTER TABLE `range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `ID_shoppingCart` int(11) NOT NULL AUTO_INCREMENT,
  `ID_account` int(11) NOT NULL,
  `totalPrice` double(9,4) NOT NULL,
  `month` text NOT NULL,
  `day` text NOT NULL,
  `year` text NOT NULL,
  `ID_list` int(11) NOT NULL,
  PRIMARY KEY (`ID_shoppingCart`,`ID_account`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES (1,1,900.0000,'3','','',0),(2,1,700.0000,'4','','',0),(3,2,10000.0000,'2','','',0),(4,3,6000.0000,'2','','',0),(5,3,7000.0000,'5','','',0),(6,4,500.0000,'2','','',0);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `ID_status` int(11) NOT NULL,
  `status` text NOT NULL,
  `discount` double(2,2) NOT NULL,
  PRIMARY KEY (`ID_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Sale',0.50),(2,'Sold out',0.00),(3,'New Arrival',0.00),(4,'Normal',0.00),(5,'In-Stock',0.00);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `ID_supplier` int(11) NOT NULL,
  `supplier` text NOT NULL,
  PRIMARY KEY (`ID_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Adidas Originals'),(2,'Nike'),(3,'Rick Owens'),(4,'Saint Laurent');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url` (
  `ID_url` int(11) NOT NULL AUTO_INCREMENT,
  `ID_product` int(11) NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`ID_url`,`ID_product`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url`
--

LOCK TABLES `url` WRITE;
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
INSERT INTO `url` VALUES (1,1,'Database\\1\\1.jpg'),(2,1,'.\\Database\\1\\2.jpg'),(3,1,'.\\Database\\1\\3.jpg'),(4,1,'.\\Database\\1\\4.jpg'),(5,2,'.\\Database\\2\\1.jpg'),(6,2,'.\\Database\\2\\2.jpg'),(7,2,'.\\Database\\2\\3.jpg'),(8,2,'.\\Database\\2\\4.jpg'),(9,3,'.\\Database\\3\\1.jpg'),(10,3,'.\\Database\\3\\2.jpg'),(11,3,'.\\Database\\3\\3.jpg'),(12,3,'.\\Database\\3\\4.jpg'),(13,4,'.\\Database\\4\\1.jpg'),(14,4,'.\\Database\\4\\2.jpg'),(15,4,'.\\Database\\4\\3.jpg'),(16,4,'.\\Database\\4\\4.jpg'),(17,5,'.\\Database\\5\\1.jpg'),(18,5,'.\\Database\\5\\2.jpg'),(19,5,'.\\Database\\5\\3.jpg'),(20,5,'.\\Database\\5\\4.jpg'),(21,6,'.\\Database\\6\\1.jpg'),(22,6,'.\\Database\\6\\2.jpg'),(23,6,'.\\Database\\6\\3.jpg'),(24,6,'.\\Database\\6\\4.jpg'),(25,7,'.\\Database\\7\\1.jpg'),(26,7,'.\\Database\\7\\2.jpg'),(27,7,'.\\Database\\7\\3.jpg'),(28,7,'.\\Database\\7\\4.jpg'),(29,8,'.\\Database\\8\\1.jpg'),(30,8,'.\\Database\\8\\2.jpg'),(31,8,'.\\Database\\8\\3.jpg'),(32,8,'.\\Database\\8\\4.jpg'),(33,9,'.\\Database\\9\\1.jpg'),(34,9,'.\\Database\\9\\2.jpg'),(35,9,'.\\Database\\9\\3.jpg'),(36,9,'.\\Database\\9\\4.jpg'),(37,12,'./Database\\AD001\\download.jpg'),(38,12,'./Database\\AD001\\asus-rog-strix-gl753v-nw-g03.jpg'),(39,12,'./Database\\AD001\\f4ceebd023a73dee61f885ffc1a86ae8.jpg'),(40,12,'./Database\\AD001\\images.jpg'),(41,12,'./Database\\AD001\\images.jpg');
/*!40000 ALTER TABLE `url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-30 10:12:25

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Temporary view structure for view `alldrinks`
--

DROP TABLE IF EXISTS `alldrinks`;
/*!50001 DROP VIEW IF EXISTS `alldrinks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `alldrinks` AS SELECT 
 1 AS `ProductName`,
 1 AS `Spirit`,
 1 AS `Made by`,
 1 AS `Alcohol Content`,
 1 AS `Quantity Currently Avalilable`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bestcustomers`
--

DROP TABLE IF EXISTS `bestcustomers`;
/*!50001 DROP VIEW IF EXISTS `bestcustomers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bestcustomers` AS SELECT 
 1 AS `Firstname`,
 1 AS `Money Spent`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Whiskey'),(2,'Beer'),(3,'Red Wine'),(4,'White Wine'),(5,'Vodka'),(6,'Rum'),(7,'Gin'),(8,'NA');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `fk_Inventory_Products_idx` (`ProductID`),
  CONSTRAINT `fk_Inventory_Products` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,41),(2,34),(3,35),(4,33),(5,16),(6,46),(7,46),(8,50),(9,34),(10,47),(11,44),(12,39),(13,45),(14,50),(15,49),(16,46),(17,47),(18,50),(19,40),(20,50),(41,50),(42,50),(43,50),(44,50);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL AUTO_INCREMENT,
  `ApartmentNumber` varchar(45) DEFAULT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `ZipCode` varchar(5) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `Manufacturer` int(11) NOT NULL AUTO_INCREMENT,
  `ManufacturerName` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Manufacturer`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'﻿Johnny Walker','Scotland'),(2,'Chivas Brothers','Scotland'),(3,'Samuel Adams','America'),(4,'Blue Moon Brewing Co.','America'),(5,'Harpoon Brewery','America'),(6,'Percept Wines','America'),(7,'Jacob Creek Wines','Australia'),(8,'Nashik Valley Wine','India'),(9,'Sula Vineyards','India'),(10,'Bacardi','France'),(11,'The Absolut Company','Sweden'),(12,'Diageo','England'),(13,' Mohan Meakin ','India'),(14,' Bombay Spirits Co., Ltd','England'),(15,'James Burrough Ltd','England'),(16,'In-House',NULL);
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlineorderitems`
--

DROP TABLE IF EXISTS `onlineorderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlineorderitems` (
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `CostForProduct` float DEFAULT '0',
  `OnlineOrderId` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`,`OnlineOrderId`),
  KEY `fk_OrderedCart_has_Product_Product1_idx` (`ProductID`),
  KEY `fk_OrderedCart_has_Product_OrderedCart1_idx` (`OnlineOrderId`),
  CONSTRAINT `fk_OrderedCart_has_Product_Product1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlineorderitems`
--

LOCK TABLES `onlineorderitems` WRITE;
/*!40000 ALTER TABLE `onlineorderitems` DISABLE KEYS */;
INSERT INTO `onlineorderitems` VALUES (4,10,429.9,1),(5,1,48.69,2),(8,1,16.99,3),(9,4,43.56,1),(15,1,15.99,3);
/*!40000 ALTER TABLE `onlineorderitems` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER onlinessale_AINS
 AFTER INSERT ON onlineorderitems 
 FOR EACH ROW
   UPDATE inventory
      SET quantity = quantity - NEW.quantity
    WHERE productid = NEW.productid */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger cancelOnlineOrder after delete on onlineorderitems
For Each Row
Begin
update inventory
set quantity = quantity + old.quantity where productid = old.productid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `onlineorders`
--

DROP TABLE IF EXISTS `onlineorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlineorders` (
  `OnlineOrderID` int(11) NOT NULL AUTO_INCREMENT,
  `Amount` float NOT NULL DEFAULT '0',
  `PersonID` int(11) NOT NULL,
  `OrderStatus` varchar(45) DEFAULT NULL,
  `ShippingStatus` varchar(45) DEFAULT NULL,
  `OrderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OnlineOrderID`),
  KEY `fk_OrderedCart_Person1_idx` (`PersonID`),
  CONSTRAINT `fk_OrderedCart_Person1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlineorders`
--

LOCK TABLES `onlineorders` WRITE;
/*!40000 ALTER TABLE `onlineorders` DISABLE KEYS */;
INSERT INTO `onlineorders` VALUES (1,473.46,15,'Completed','Delivered','2017-12-14 07:26:27'),(2,48.69,3,'completed','Ships next day of order','2017-12-14 07:26:27'),(3,32.98,6,'completed','Ships next day of order','2017-12-14 07:26:27');
/*!40000 ALTER TABLE `onlineorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitems` (
  `orderitemid` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (3,12,3,2,41.97),(4,5,4,2,194.76),(5,2,3,3,410.97),(6,9,4,3,43.56),(7,11,3,4,23.97),(8,9,4,4,43.56),(9,5,1,4,48.69),(10,10,3,5,29.97),(11,19,4,5,87.96),(12,5,1,5,48.69),(13,11,3,6,23.97),(14,16,4,6,107.96),(15,5,1,6,48.69),(16,7,3,7,44.97),(17,6,4,7,55.96),(18,5,1,7,48.69),(19,2,1,8,136.99),(20,12,4,8,55.96),(21,5,1,8,48.69),(22,13,1,9,39.99),(23,13,4,9,159.96),(24,5,1,9,48.69),(25,17,3,10,44.97),(26,19,4,10,87.96),(27,5,1,10,48.69),(28,7,3,10,44.97),(29,9,4,10,43.56),(30,5,1,10,48.69);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER sale_AINS
AFTER INSERT ON orderitems 
FOR EACH ROW
  UPDATE inventory
     SET quantity = quantity - NEW.quantity
   WHERE productid = NEW.productid */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger cancelorder after delete on orderitems
for each row
Begin
Update inventory
set quantity = quantity+ old.quantity where productid=old.productid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderAmount` float DEFAULT NULL,
  `PersonID` int(11) NOT NULL,
  `OrderStatus` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`PersonID`),
  KEY `fk_Order_Person1_idx` (`PersonID`),
  CONSTRAINT `fk_Order_Person1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,210.23,3,'Completed'),(2,236.73,5,'Completed'),(3,454.53,8,'Completed'),(4,116.22,4,'Completed'),(5,166.62,4,'Completed'),(6,180.62,4,'Completed'),(7,149.62,14,'Completed'),(8,241.64,4,'Completed'),(9,248.64,6,'Completed'),(10,318.84,20,'Completed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `PersonID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `LastName` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `PhoneNumber` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `EmailID` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Eligible` enum('Verified','Unverified') COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  KEY `fk_Person_Location1_idx` (`LocationID`),
  CONSTRAINT `fk_Person_Location1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (2,'Antonin','Nusche','811-756-0971','anusche0@hugedomains.com',1,'1995-12-17','Unverified'),(3,'Gypsy','Booty','705-505-1058','gbooty1@woothemes.com',2,'1994-10-14','Verified'),(4,'Jany','Viner','267-924-0622','jviner2@symantec.com',3,'1997-10-14','Unverified'),(5,'Clyve','Blanking','994-979-7538','cblanking3@theatlantic.com',4,'1993-10-14','Verified'),(6,'Ashleigh','Hanaby','952-185-9664','ahanaby4@salon.com',5,'1993-01-14','Verified'),(7,'Wittie','Bonhill','919-709-1031','wbonhill5@vk.com',6,'1990-01-14','Verified'),(8,'Lesli','Bugge','912-309-6854','lbugge6@infoseek.co.jp',7,'1990-01-10','Unverified'),(9,'Tilly','Haysom','243-285-9960','thaysom7@businessweek.com',8,'1990-11-10','Verified'),(10,'Casandra','Rama','956-420-7073','crama8@princeton.edu',9,'1998-11-10','Unverified'),(11,'Flossy','Vedstra','437-756-5063','fvedstra9@dailymail.co.uk',10,'1988-11-10','Verified'),(12,'Chrysler','Bligh','786-570-5012','cbligha@blogspot.com',11,'1988-06-10','Verified'),(13,'Charlena','Wasylkiewicz','765-409-9316','cwasylkiewiczb@wired.com',12,'1998-06-10','Verified'),(14,'Wernher','Malloch','230-669-4617','wmallochc@forbes.com',13,'1995-06-17','Unverified'),(15,'Devora','Burnyate','253-807-6835','dburnyated@liveinternet.ru',14,'1998-08-19','Verified'),(16,'Riccardo','Eye','357-343-1607','reyee@home.pl',15,'1995-10-19','Unverified'),(17,'Dame','Tordiffe','299-917-8534','dtordiffef@seesaa.net',16,'1995-11-23','Verified'),(18,'Lyndsay','Phizakarley','276-938-2147','lphizakarleyg@slideshare.net',17,'1992-11-23','Verified'),(19,'Ashleigh','MattiCCI','943-857-5743','amatticcih@huffingtonpost.com',18,'1992-07-23','Verified'),(20,'Sonya','Wace','984-790-6352','swacei@theguardian.com',19,'1992-07-22','Unverified'),(21,'Vincenz','McLanachan','777-211-3665','vmclanachanj@photobucket.com',20,'1992-08-22','Verified');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) DEFAULT NULL,
  `ProductType` enum('Alcoholic','Non-Alcoholic') DEFAULT 'Alcoholic',
  `CategoryId` int(11) NOT NULL,
  `ManufacturerId` int(11) NOT NULL,
  `Price` float NOT NULL,
  `AlcoholContent` float DEFAULT '0',
  PRIMARY KEY (`ProductID`,`CategoryId`,`ManufacturerId`),
  KEY `fk_Products_Category1_idx` (`CategoryId`),
  KEY `fk_Products_Manufacturer1_idx` (`ManufacturerId`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Black Label','Alcoholic',1,1,44.79,40),(2,'Blue Label','Alcoholic',1,1,136.99,42),(3,'Red Label','Alcoholic',1,1,22.79,43),(4,'Chivas Regal','Alcoholic',1,2,42.99,41.2),(5,'Double Black Label','Alcoholic',1,1,48.69,40.4),(6,'Samuel Adams','Alcoholic',2,3,13.99,4.9),(7,'Blue Moon','Alcoholic',2,4,14.99,5.4),(8,'Harpoon IPA','Alcoholic',2,5,16.99,5.9),(9,'Radius Cabarnet','Alcoholic',3,6,10.89,12),(10,'Jacob\'s Creek Shiraz','Alcoholic',3,7,9.99,13.9),(11,'Samara White','Alcoholic',4,8,7.99,14.5),(12,'Sula White Wine','Alcoholic',4,9,13.99,14),(13,'Grey Goose','Alcoholic',5,10,39.99,39),(14,'Absolut','Alcoholic',5,11,21.99,41),(15,'Smirnoff','Alcoholic',5,12,15.99,44),(16,'Old Monk','Alcoholic',6,13,26.99,42.8),(17,'Bacardi White Rum','Alcoholic',6,10,14.99,37.5),(18,'Captain Morgan','Alcoholic',6,12,16.99,41),(19,'Bombay Sapphire','Alcoholic',7,14,21.99,40),(20,'BeeFeater','Alcoholic',7,15,18.99,40.5),(41,'Orange Juice','Non-Alcoholic',8,16,3.99,0),(42,'Soda','Non-Alcoholic',8,16,2.49,0),(43,'Ice-Cream','Non-Alcoholic',8,16,2.99,0),(44,'Ice','Non-Alcoholic',8,16,3.99,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_supplies`
--

DROP TABLE IF EXISTS `product_supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_supplies` (
  `StockSupplyId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `OrderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StockSupplyId`,`ProductID`,`SupplierID`),
  KEY `fk_Products_has_Supplier_Supplier1_idx` (`SupplierID`),
  KEY `fk_Products_has_Supplier_Products1_idx` (`ProductID`),
  CONSTRAINT `fk_Products_has_Supplier_Products1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_has_Supplier_Supplier1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supplies`
--

LOCK TABLES `product_supplies` WRITE;
/*!40000 ALTER TABLE `product_supplies` DISABLE KEYS */;
INSERT INTO `product_supplies` VALUES (1,2,2,4,'2017-12-11 00:24:43'),(2,2,2,41,'2017-12-11 07:32:00');
/*!40000 ALTER TABLE `product_supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment` (
  `ShipmentId` int(11) NOT NULL AUTO_INCREMENT,
  `OnlineOrderId` int(11) NOT NULL,
  `ShipmentName` varchar(45) DEFAULT NULL,
  `LocationID` int(11) NOT NULL,
  `ShipmentStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ShipmentId`),
  KEY `OnlineOrderID_idx` (`OnlineOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,2,'Shipment - Order no-2',2,'Order Issued'),(2,2,'Shipment - Order no-2',2,'Order Issued'),(3,2,'Shipment - Order no-2',2,'Order Issued'),(4,2,'Shipment - Order no-2',2,'Order Issued'),(5,3,'Shipment - Order no-3',5,'Order Issued');
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(45) NOT NULL,
  `DateOfAssociation` date DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Beer Supplier','2015-12-17'),(2,'Whisky Supplier','2017-02-15'),(3,'Vodka Supplier','2014-12-05'),(4,'Red Wine Supplier','2014-10-25'),(5,'White Wine Supplier','2016-09-19'),(6,'Rum Supplier','2016-11-04'),(7,'Gin Supplier','2016-11-04');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `topwhiskey`
--

DROP TABLE IF EXISTS `topwhiskey`;
/*!50001 DROP VIEW IF EXISTS `topwhiskey`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `topwhiskey` AS SELECT 
 1 AS `productname`,
 1 AS `Number Sold`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `checkage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `checkage`( pid int) RETURNS varchar(80) CHARSET utf8
begin

declare message varchar(80);
declare age float;
declare veri varchar (20);
set age:= (Select TIMESTAMPDIFF(YEAR, (select dateofbirth from person where PersonID=12), CURDATE()));
set veri:= (select eligible from person where personid=pid);

if (pid > (select max(personid) from person)) 
then set message = 'Person doesnot exist';
elseif ((age<21) || (veri = 'Unverified')) THEN
set message = 'Cannot Buy';
ELSE
set message ='Person is elgibile';
end if;

return message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addItem`( prodid int, quant int, ordid int)
Begin
if (quant> (select quantity from inventory where productid = prodid)) then 
Select concat('Sorry. Available quantity for selected Product is only ', 
(select quantity from inventory where productid = prodid)) as 'ERROR';
else
Insert into onlineorderitems(productID,quantity,onlineorderid, costForProduct) 
values((select productid from product where productid = prodid), quant, ordid, ((select price from product where productid = prodid) * quant));
End if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addOrderItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addOrderItem`(prodid int , quant int, ordid int)
Begin
if (quant> (select quantity from inventory where productid = prodid)) then 
Select concat('Sorry. Available quantity for selected Product is only ', 
(select quantity from inventory where productid = prodid)) as 'ERROR';
else
Insert into orderitems(productID,quantity,orderid, amount) values((select productid from product where productid = prodid), quant, ordid, ((select price from product where productid = prodid) * quant));
End if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backup_full` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `backup_full`()
block1: BEGIN
	DECLARE tab_name char(50); 
	DECLARE q varchar(1500); 
	DECLARE done INTEGER DEFAULT 0;
	DECLARE cursorBackupTable CURSOR FOR SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE table_schema='mydb'  and table_type='BASE TABLE';
	DROP DATABASE IF EXISTS mydb_backup;
	CREATE DATABASE mydb_backup;
	open cursorBackupTable;
		block2: begin
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 
			cur_loop:Loop
				FETCH cursorBackupTable into tab_name;
					IF done= 1 THEN LEAVE cur_loop;				
					END IF; 
				SET @q=CONCAT('DROP TABLE IF EXISTS mydb_backup.',tab_name);
					PREPARE stmt FROM @q;
					EXECUTE stmt;
					DEALLOCATE PREPARE stmt;
				SET @q=CONCAT('CREATE TABLE mydb_backup.',tab_name,' AS SELECT * FROM mydb.',tab_name,' WHERE 1=1');
					PREPARE stmt FROM @q;
					EXECUTE stmt;
					DEALLOCATE PREPARE stmt;
			END LOOP cur_loop;
		END block2;
	close cursorBackupTable;
END block1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancelOnlineOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancelOnlineOrder`(oid int)
BEGIN
declare message varchar(100);
select shippingstatus from onlineorders where OnlineOrderID = oid into message;
if message = 'Delivered'
then 
Select 'Sorry. Too Late! Order has been Deliverd' as 'Error';
else
delete from onlineorderitems where onlineorderid = oid;
UPDATE onlineorders
SET orderstatus = 'Canceled', Amount =0 where onlineorderid=oid;
END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancelOrder`(oid int)
BEGIN
delete from orderitems where orderid = oid;
UPDATE orders
SET orderstatus = 'Canceled', OrderAmount =0 where orderid=oid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `concludeonlineOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `concludeonlineOrder`(in oid int)
Begin
update onlineorders
set amount =(select sum(costForProduct) from onlineorderitems where onlineorderid = oid), 
orderstatus = 'completed', ShippingStatus='Ships next day of order' where onlineorderid=oid;
insert into shipment (OnlineOrderId,  ShipmentStatus, LocationID, shipmentname) 
values( oid , "Order Issued", 
(select locationid from person where personid = (select personid from onlineorders where onlineorderid=oid)),
concat('Shipment - Order no-',oid));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `concludeorder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `concludeorder`(oid int)
Begin
update orders
set Orderamount =(select sum(amount) from orderitems where orderid = oid) , Orderstatus ='Completed' where orderid=oid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createNewOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createNewOrder`( pid int, out oid int)
begin
insert into orders(personid) values (pid);
select max(orderid) from orders into oid;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createOnlineOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createOnlineOrder`(persID int, out oid int)
begin
declare message varchar(100);
select checkage(persID) into message;
if message = 'Cannot buy'
then 
Select 'Customer underage or unverified';
else
insert into onlineorders(personid) values (persid);
select max(OnlineOrderID) from onlineorders into oid; 
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Shippingdone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Shippingdone`(in oid int)
BEGIN
update shipment
Set Shipmentstatus = 'Shipment Completed' where OnlineOrderId = oid;

update onlineorders
set ShippingStatus = 'Delivered' where OnlineOrderID = oid;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `supplyproducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `supplyproducts`(in sid int, in pid int, in quant int)
begin
insert into product_supplies (productid,supplierID, Quantity) values( pid,sid,quant);

update inventory
set quantity = (Quantity + quant) where productid=pid;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `take_Backup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `take_Backup`()
block1: BEGIN
	DECLARE tab_name char(50); 
	DECLARE q varchar(1500); 
	DECLARE done INTEGER DEFAULT 0;
	DECLARE cursorBackupTable CURSOR FOR SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE table_schema='mydb'  and table_type='BASE TABLE';
	DROP DATABASE IF EXISTS mydb_backup;
	CREATE DATABASE mydb_backup;
	open cursorBackupTable;
		block2: begin
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 
			cur_loop:Loop
				FETCH cursorBackupTable into tab_name;
					IF done= 1 THEN LEAVE cur_loop;				
					END IF; 
				SET @q=CONCAT('DROP TABLE IF EXISTS mydb_backup.',tab_name);
					PREPARE stmt FROM @q;
					EXECUTE stmt;
					DEALLOCATE PREPARE stmt;
				SET @q=CONCAT('CREATE TABLE mydb_backup.',tab_name,' AS SELECT * FROM mydb.',tab_name,' WHERE 1=1');
					PREPARE stmt FROM @q;
					EXECUTE stmt;
					DEALLOCATE PREPARE stmt;
			END LOOP cur_loop;
		END block2;
	close cursorBackupTable;
END block1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `alldrinks`
--

/*!50001 DROP VIEW IF EXISTS `alldrinks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alldrinks` AS select `p`.`ProductName` AS `ProductName`,(select `c`.`CategoryName` from `category` `c` where (`p`.`CategoryId` = `c`.`CategoryId`)) AS `Spirit`,concat((select `m`.`ManufacturerName` from `manufacturer` `m` where (`p`.`ManufacturerId` = `m`.`Manufacturer`)),',',(select `m`.`Country` from `manufacturer` `m` where (`p`.`ManufacturerId` = `m`.`Manufacturer`))) AS `Made by`,concat(`p`.`AlcoholContent`,'%') AS `Alcohol Content`,`i`.`Quantity` AS `Quantity Currently Avalilable` from (`product` `p` join `inventory` `i` on((`p`.`ProductID` = `i`.`ProductID`))) where (`p`.`ProductType` = 'Alcoholic') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bestcustomers`
--

/*!50001 DROP VIEW IF EXISTS `bestcustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bestcustomers` AS select `p`.`FirstName` AS `Firstname`,round(sum(`o`.`OrderAmount`),0) AS `Money Spent` from (`person` `p` join `orders` `o` on((`p`.`PersonID` = `o`.`PersonID`))) where (`o`.`OrderStatus` <> 'Canceled') group by `p`.`FirstName` order by sum(`o`.`OrderAmount`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `topwhiskey`
--

/*!50001 DROP VIEW IF EXISTS `topwhiskey`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topwhiskey` AS select `p`.`ProductName` AS `productname`,sum(`oi`.`quantity`) AS `Number Sold` from ((`orderitems` `oi` join `product` `p` on((`p`.`ProductID` = `oi`.`productid`))) join `category` `c` on((`p`.`CategoryId` = `c`.`CategoryId`))) where (`c`.`CategoryId` = 1) group by `p`.`ProductID` order by sum(`oi`.`quantity`) desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14  5:17:10

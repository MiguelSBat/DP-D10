start transaction;
drop database if exists `acmenewspaper`;
create database `acmenewspaper`;
create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';
use `acmenewspaper`;
grant select, insert, update, delete 
	on `acmenewspaper`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine, 
        alter routine, execute, trigger, show view
    on `acmenewspaper`.* to 'acme-manager'@'%';
-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: AcmeNewspaper
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_cgls5lrufx91ufsyh467spwa3` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (61,0,'ponsavi@acme.org','Paco','656343000','Calle Fontenla, 2','Samper Villagrán',57);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `draftMode` bit(1) NOT NULL,
  `publishMoment` date DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `taboo` bit(1) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_n9l0oa2ioqjbnpvj56txwy75r` (`publishMoment`),
  KEY `UK_6rcu5ngbg90klwheb98n47gja` (`taboo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (65,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo1'),(66,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo2'),(67,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo3'),(68,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo4'),(69,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo5'),(70,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo6'),(71,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo7'),(72,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo8'),(73,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo9'),(74,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo10'),(75,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo11'),(76,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo12'),(77,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo13'),(78,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo14'),(79,0,'\0','2014-01-02','Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo15'),(80,0,'',NULL,'Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo16'),(81,0,'\0',NULL,'Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo17'),(82,0,'\0',NULL,'Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo18'),(83,0,'\0',NULL,'Sumary','\0','texto : Lorem ipsum dolormodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','articulo19');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_pictures`
--

DROP TABLE IF EXISTS `article_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_pictures` (
  `Article_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_slh5rr6y2n4ml5s20v5nlr52g` (`Article_id`),
  CONSTRAINT `FK_slh5rr6y2n4ml5s20v5nlr52g` FOREIGN KEY (`Article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_pictures`
--

LOCK TABLES `article_pictures` WRITE;
/*!40000 ALTER TABLE `article_pictures` DISABLE KEYS */;
INSERT INTO `article_pictures` VALUES (65,'http://imagen.png'),(66,'http://imagen.png'),(67,'http://imagen.png'),(68,'http://imagen.png'),(69,'http://imagen.png'),(70,'http://imagen.png'),(71,'http://imagen.png'),(72,'http://imagen.png'),(73,'http://imagen.png'),(74,'http://imagen.png'),(75,'http://imagen.png'),(76,'http://imagen.png'),(77,'http://imagen.png'),(78,'http://imagen.png'),(79,'http://imagen.png'),(80,'http://imagen.png'),(81,'http://imagen.png'),(82,'http://imagen.png'),(83,'http://imagen.png');
/*!40000 ALTER TABLE `article_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirp`
--

DROP TABLE IF EXISTS `chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirp` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `containsTaboo` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `moment` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_2of1f2nqtpb8g68xintbje7am` (`containsTaboo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirp`
--

LOCK TABLES `chirp` WRITE;
/*!40000 ALTER TABLE `chirp` DISABLE KEYS */;
INSERT INTO `chirp` VALUES (84,0,'','viagra descripcion 1: Loreugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2014-01-02','chirp1'),(85,0,'\0','descripcion 1: Loreugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2014-01-02','chirp2'),(86,0,'\0','descripcion 1: Loreugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2014-01-02','chirp3'),(87,0,'\0','descripcion 1: Loreugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2014-01-02','chirp4'),(88,0,'\0','descripcion 1: Loreugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2014-01-02','chirp5');
/*!40000 ALTER TABLE `chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (89,0);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_taboowords`
--

DROP TABLE IF EXISTS `config_taboowords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_taboowords` (
  `Config_id` int(11) NOT NULL,
  `tabooWords` varchar(255) DEFAULT NULL,
  KEY `FK_6arwpfegkhokwyqva5fdu63xq` (`Config_id`),
  CONSTRAINT `FK_6arwpfegkhokwyqva5fdu63xq` FOREIGN KEY (`Config_id`) REFERENCES `config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_taboowords`
--

LOCK TABLES `config_taboowords` WRITE;
/*!40000 ALTER TABLE `config_taboowords` DISABLE KEYS */;
INSERT INTO `config_taboowords` VALUES (89,'sex'),(89,'sexo'),(89,'viagra'),(89,'cialis');
/*!40000 ALTER TABLE `config_taboowords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcard` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `CVV` int(11) NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `expirationMonth` int(11) NOT NULL,
  `expirationYear` int(11) NOT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
INSERT INTO `creditcard` VALUES (90,0,124,'Visa',10,2020,'Francisco Perez','4532013067246621'),(91,0,124,'Visa',10,2020,'Señor que esta cansado de rellenar el populate','4532013067246621');
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard_newspaper`
--

DROP TABLE IF EXISTS `creditcard_newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcard_newspaper` (
  `CreditCard_id` int(11) NOT NULL,
  `newspapers_id` int(11) NOT NULL,
  KEY `FK_g04p1f61k7h37jfomil8rsv9i` (`newspapers_id`),
  KEY `FK_2mq7ivtemammg3t9j64e36daw` (`CreditCard_id`),
  CONSTRAINT `FK_2mq7ivtemammg3t9j64e36daw` FOREIGN KEY (`CreditCard_id`) REFERENCES `creditcard` (`id`),
  CONSTRAINT `FK_g04p1f61k7h37jfomil8rsv9i` FOREIGN KEY (`newspapers_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard_newspaper`
--

LOCK TABLES `creditcard_newspaper` WRITE;
/*!40000 ALTER TABLE `creditcard_newspaper` DISABLE KEYS */;
INSERT INTO `creditcard_newspaper` VALUES (90,105);
/*!40000 ALTER TABLE `creditcard_newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pwmktpkay2yx7v00mrwmuscl8` (`userAccount_id`),
  CONSTRAINT `FK_pwmktpkay2yx7v00mrwmuscl8` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (92,0,'ponsavi@acme.org','Pepón','656222111','Calle Fontenla, 2','Samper Villagrán',58);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_creditcard`
--

DROP TABLE IF EXISTS `customer_creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_creditcard` (
  `Customer_id` int(11) NOT NULL,
  `creditCard_id` int(11) NOT NULL,
  UNIQUE KEY `UK_trew4puloaajjiyfj763utxjy` (`creditCard_id`),
  KEY `FK_h2ciytevbkctxgx839stph85m` (`Customer_id`),
  CONSTRAINT `FK_h2ciytevbkctxgx839stph85m` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_trew4puloaajjiyfj763utxjy` FOREIGN KEY (`creditCard_id`) REFERENCES `creditcard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_creditcard`
--

LOCK TABLES `customer_creditcard` WRITE;
/*!40000 ALTER TABLE `customer_creditcard` DISABLE KEYS */;
INSERT INTO `customer_creditcard` VALUES (92,90),(92,91);
/*!40000 ALTER TABLE `customer_creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup`
--

DROP TABLE IF EXISTS `followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followup` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `publishMoment` date DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_s5wo0vp1qu4337prqg4ltx79r` (`publishMoment`),
  KEY `FK_aer0q20rslre6418yqlfwmeek` (`article_id`),
  CONSTRAINT `FK_aer0q20rslre6418yqlfwmeek` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup`
--

LOCK TABLES `followup` WRITE;
/*!40000 ALTER TABLE `followup` DISABLE KEYS */;
INSERT INTO `followup` VALUES (93,0,'2014-01-02','sumario','texto1','titulodelfollowup1',65),(94,0,'2014-01-02','sumario','texto1','titulodelfollowup2',66),(95,0,'2014-01-02','sumario','texto1','titulodelfollowup3',67),(96,0,'2014-01-02','sumario','texto1','titulodelfollowup4',68),(97,0,'2014-01-02','sumario','texto1','titulodelfollowup5',69),(98,0,'2014-01-02','sumario','texto1','titulodelfollowup6',70),(99,0,'2014-01-02','sumario','texto1','titulodelfollowup6',75),(100,0,'2014-01-02','sumario','texto1','titulodelfollowup6',76),(101,0,'2014-01-02','sumario','texto1','titulodelfollowup6',77),(102,0,'2014-01-02','sumario','texto1','titulodelfollowup6',78);
/*!40000 ALTER TABLE `followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup_pictures`
--

DROP TABLE IF EXISTS `followup_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followup_pictures` (
  `FollowUp_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_be66suxjlinls1y3yymi3tc0d` (`FollowUp_id`),
  CONSTRAINT `FK_be66suxjlinls1y3yymi3tc0d` FOREIGN KEY (`FollowUp_id`) REFERENCES `followup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup_pictures`
--

LOCK TABLES `followup_pictures` WRITE;
/*!40000 ALTER TABLE `followup_pictures` DISABLE KEYS */;
INSERT INTO `followup_pictures` VALUES (93,'http://imagen.png'),(94,'http://imagen.png'),(95,'http://imagen.png'),(96,'http://imagen.png'),(97,'http://imagen.png'),(98,'http://imagen.png'),(99,'http://imagen.png'),(100,'http://imagen.png'),(101,'http://imagen.png'),(102,'http://imagen.png');
/*!40000 ALTER TABLE `followup_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper`
--

DROP TABLE IF EXISTS `newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `publicationDate` date DEFAULT NULL,
  `publicity` bit(1) DEFAULT NULL,
  `taboo` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_1tf2y7ybe3u3285xf6w2v4mfx` (`taboo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper`
--

LOCK TABLES `newspaper` WRITE;
/*!40000 ALTER TABLE `newspaper` DISABLE KEYS */;
INSERT INTO `newspaper` VALUES (103,0,'descripcion del periodico','https://vignette.wikia.nocookie.net/medabots/images/7/73/Imagen_de_ejemplo.png','2014-01-02','\0','\0','titulo del periodico'),(104,0,'descripcion del periodico','https://vignette.wikia.nocookie.net/medabots/images/7/73/Imagen_de_ejemplo.png','2014-01-02','\0','\0','titulo del periodico 2'),(105,0,'descripcion del periodico','https://vignette.wikia.nocookie.net/medabots/images/7/73/Imagen_de_ejemplo.png','2014-01-02','','\0','Periodico privado'),(106,0,'descripcion del periodico','https://vignette.wikia.nocookie.net/medabots/images/7/73/Imagen_de_ejemplo.png','2014-01-02','\0','\0','Periodico en draft publico'),(107,0,'descripcion del periodico','https://vignette.wikia.nocookie.net/medabots/images/7/73/Imagen_de_ejemplo.png',NULL,'','\0','Periodico en draft privado'),(108,0,'sexo free sex sida dildo dialis aprobado dp','https://vignette.wikia.nocookie.net/medabots/images/7/73/Imagen_de_ejemplo.png',NULL,'\0','','periodico prohibido taboo +18'),(109,0,'descripcion del periodico','https://vignette.wikia.nocookie.net/medabots/images/7/73/Imagen_de_ejemplo.png',NULL,'\0','\0','Periodico en draft publico'),(110,0,'descripcion del periodico','https://vignette.wikia.nocookie.net/medabots/images/7/73/Imagen_de_ejemplo.png','2014-01-02','','\0','Periodico privado2');
/*!40000 ALTER TABLE `newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper_article`
--

DROP TABLE IF EXISTS `newspaper_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper_article` (
  `Newspaper_id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  UNIQUE KEY `UK_b6yh4ur28qo9smnd995jo356g` (`articles_id`),
  KEY `FK_53pw01kjsjxn1ycjlwa1q6j13` (`Newspaper_id`),
  CONSTRAINT `FK_53pw01kjsjxn1ycjlwa1q6j13` FOREIGN KEY (`Newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_b6yh4ur28qo9smnd995jo356g` FOREIGN KEY (`articles_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper_article`
--

LOCK TABLES `newspaper_article` WRITE;
/*!40000 ALTER TABLE `newspaper_article` DISABLE KEYS */;
INSERT INTO `newspaper_article` VALUES (103,65),(103,66),(103,67),(103,68),(103,69),(103,83),(104,70),(104,71),(104,72),(104,73),(104,74),(105,75),(105,76),(105,77),(105,78),(105,79),(109,80),(109,81),(110,82);
/*!40000 ALTER TABLE `newspaper_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o6s94d43co03sx067ili5760c` (`userAccount_id`),
  CONSTRAINT `FK_o6s94d43co03sx067ili5760c` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (62,0,'ponsavi@acme.org','Pepón','656343002','Calle Fontenla, 2','Samper Villagrán',56),(63,0,'user2@mail.com','userName2','656222111','user2PostalAdress','userSurname2',59),(64,0,'user3@mail.com','userName3','656222113','user3PostalAdress','userSurname3',60);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_article`
--

DROP TABLE IF EXISTS `user_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_article` (
  `User_id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  UNIQUE KEY `UK_siug4boflrp0p0dncq76a13wu` (`articles_id`),
  KEY `FK_bkiti988ki4sxkoqc8ro1wnsa` (`User_id`),
  CONSTRAINT `FK_bkiti988ki4sxkoqc8ro1wnsa` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_siug4boflrp0p0dncq76a13wu` FOREIGN KEY (`articles_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_article`
--

LOCK TABLES `user_article` WRITE;
/*!40000 ALTER TABLE `user_article` DISABLE KEYS */;
INSERT INTO `user_article` VALUES (62,65),(62,66),(62,67),(62,68),(62,69),(62,80),(62,81),(62,82),(62,83),(63,70),(63,71),(63,72),(63,73),(63,74),(64,75),(64,76),(64,77),(64,78),(64,79);
/*!40000 ALTER TABLE `user_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_chirp`
--

DROP TABLE IF EXISTS `user_chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_chirp` (
  `User_id` int(11) NOT NULL,
  `chirps_id` int(11) NOT NULL,
  UNIQUE KEY `UK_ls9bn8hbpkktyfahbm4wujrps` (`chirps_id`),
  KEY `FK_8lvf5igmdhhmxc70p7ujd36ym` (`User_id`),
  CONSTRAINT `FK_8lvf5igmdhhmxc70p7ujd36ym` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_ls9bn8hbpkktyfahbm4wujrps` FOREIGN KEY (`chirps_id`) REFERENCES `chirp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_chirp`
--

LOCK TABLES `user_chirp` WRITE;
/*!40000 ALTER TABLE `user_chirp` DISABLE KEYS */;
INSERT INTO `user_chirp` VALUES (62,84),(62,85),(62,86),(63,87),(63,88);
/*!40000 ALTER TABLE `user_chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_followup`
--

DROP TABLE IF EXISTS `user_followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_followup` (
  `User_id` int(11) NOT NULL,
  `followUp_id` int(11) NOT NULL,
  UNIQUE KEY `UK_lfv2rycqwreg4jbq1ajh216cm` (`followUp_id`),
  KEY `FK_d2qpetfkbbkwvy6gqcjm2yowh` (`User_id`),
  CONSTRAINT `FK_d2qpetfkbbkwvy6gqcjm2yowh` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_lfv2rycqwreg4jbq1ajh216cm` FOREIGN KEY (`followUp_id`) REFERENCES `followup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_followup`
--

LOCK TABLES `user_followup` WRITE;
/*!40000 ALTER TABLE `user_followup` DISABLE KEYS */;
INSERT INTO `user_followup` VALUES (62,93),(62,94),(62,95),(62,96),(62,97),(63,98),(64,99),(64,100),(64,101),(64,102);
/*!40000 ALTER TABLE `user_followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newspaper`
--

DROP TABLE IF EXISTS `user_newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_newspaper` (
  `User_id` int(11) NOT NULL,
  `newspapers_id` int(11) NOT NULL,
  UNIQUE KEY `UK_oqhrpkgl440xehybmm713ru36` (`newspapers_id`),
  KEY `FK_24xv3fsqc505dhy1bv4ldnor9` (`User_id`),
  CONSTRAINT `FK_24xv3fsqc505dhy1bv4ldnor9` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_oqhrpkgl440xehybmm713ru36` FOREIGN KEY (`newspapers_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_newspaper`
--

LOCK TABLES `user_newspaper` WRITE;
/*!40000 ALTER TABLE `user_newspaper` DISABLE KEYS */;
INSERT INTO `user_newspaper` VALUES (62,103),(62,106),(62,107),(62,108),(62,109),(63,104),(64,105);
/*!40000 ALTER TABLE `user_newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `User_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  KEY `FK_skc3d47tu4nnp2kx12n5lsiur` (`users_id`),
  KEY `FK_nlnx78x3m38aq2r86t1d5eio1` (`User_id`),
  CONSTRAINT `FK_nlnx78x3m38aq2r86t1d5eio1` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_skc3d47tu4nnp2kx12n5lsiur` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (63,62),(64,62),(64,63);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (56,0,'24c9e15e52afc47c225b757e7bee1f9d','user1'),(57,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(58,0,'ffbc4675f864e0e9aab8bdf7a0437010','customer1'),(59,0,'7e58d63b60197ceb55a1c487989a3720','user2'),(60,0,'92877af70a45fd6a2ed7fe81e1236b78','user3');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (56,'USER'),(57,'ADMIN'),(58,'CUSTOMER'),(59,'USER'),(60,'USER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-12 20:10:13
commit;
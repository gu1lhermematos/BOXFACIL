-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: portabilidade
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.12.04.1

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
-- Table structure for table `controle`
--

DROP TABLE IF EXISTS `controle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controle` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `operadora` text NOT NULL,
  `data` varchar(20) NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `id` (`cod`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controle`
--

LOCK TABLES `controle` WRITE;
/*!40000 ALTER TABLE `controle` DISABLE KEYS */;
/*!40000 ALTER TABLE `controle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nao_portados`
--

DROP TABLE IF EXISTS `nao_portados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nao_portados` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `operadora` varchar(64) NOT NULL,
  `tipo` varchar(64) NOT NULL,
  `prefixo` bigint(7) NOT NULL,
  `rn1` int(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operadora` (`operadora`),
  KEY `tipo` (`tipo`),
  KEY `prefixo` (`prefixo`),
  KEY `rn1` (`rn1`)
) ENGINE=MyISAM AUTO_INCREMENT=86369 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nao_portados`
--

LOCK TABLES `nao_portados` WRITE;
/*!40000 ALTER TABLE `nao_portados` DISABLE KEYS */;
/*!40000 ALTER TABLE `nao_portados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operadoras`
--

DROP TABLE IF EXISTS `operadoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operadoras` (
  `rn1` int(5) NOT NULL,
  `nome` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operadoras`
--

LOCK TABLES `operadoras` WRITE;
/*!40000 ALTER TABLE `operadoras` DISABLE KEYS */;
INSERT INTO `operadoras` VALUES (55101,'TELECALL'),(55102,'LIFE'),(55104,'BAYDENET'),(55105,'T.P.A'),(55106,'AMERICA'),(55109,'MAHA-TEL'),(55110,'ENCANTO'),(55111,'SUPERTV'),(55112,'ALGAR'),(55113,'FONAR'),(55114,'OI'),(55115,'VIVO'),(55117,'TRANSIT'),(55118,'SPIN'),(55120,'GTI'),(55121,'EMBRATEL'),(55122,'ITAVOICE'),(55123,'INTELIG'),(55124,'DIALDATA'),(55125,'GVT'),(55126,'IDT'),(55127,'AEROTECH'),(55128,'VOXBRAS'),(55129,'T-LESTE'),(55131,'OI'),(55132,'CONVERGIA'),(55134,'ETML'),(55135,'EASYTONE'),(55136,'DSLI'),(55137,'GOLDEN'),(55138,'TESA'),(55140,'HOJE'),(55142,'GT'),(55143,'SERCOMTEL'),(55145,'LEVEL'),(55146,'AMIGO'),(55147,'BRITISH'),(55149,'BBS'),(55150,'CAMBRIDGE'),(55151,'VIA'),(55152,'CABO'),(55153,'OSTARA'),(55156,'ENGEVOX'),(55157,'BR'),(55158,'VOITEL'),(55159,'LOCAL'),(55160,'TELECOM'),(55161,'NEXUS'),(55162,'MUNDIVOX'),(55163,'HELLO'),(55165,'REDE'),(55166,'E1'),(55167,'DIRECTCALL'),(55168,'SUPORTE'),(55170,'LOCAWEB'),(55172,'TELECOMDADOS'),(55173,'BRASTEL'),(55174,'TELEFREE'),(55175,'TMAIS'),(55177,'OPçãONET'),(55178,'NORTELPA'),(55179,'OPTION'),(55180,'PLUMIUM'),(55181,'DATORA'),(55185,'ULTRANET'),(55186,'TELETEL'),(55188,'TVN'),(55189,'CONECTA'),(55191,'IPCORP'),(55192,'VIACOM'),(55193,'VIPWAY'),(55194,'SMART'),(55196,'IVATI'),(55198,'LIGUE'),(55199,'ENSITE'),(55200,'PORTO'),(55203,'CIA'),(55205,'AVA'),(55207,'DESKTOP'),(55208,'PONTO'),(55209,'WCS'),(55213,'TRIADE'),(55214,'ORANGE'),(55217,'TERAPAR'),(55217,'VOX'),(55301,'DATORA'),(55302,'PORTO'),(55312,'ALGAR'),(55314,'OI'),(55320,'VIVO'),(55321,'CLARO'),(55323,'TELEFôNICA'),(55331,'OI'),(55337,'UNICEL'),(55341,'TIM'),(55343,'SERCOMTEL'),(55351,'NEXTEL'),(55375,'SUPERCHIP'),(55176,'ADYLNET'),(0,'EPSILON'),(55224,'EPSILON'),(55221,'EPSILON'),(55221,'G'),(55179,'GOIáS'),(55148,'NETSERV'),(0,'OSI'),(55331,'SITECNET'),(55224,'SUL'),(55131,'TELECOM'),(55166,'UNITELCO');
/*!40000 ALTER TABLE `operadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portados`
--

DROP TABLE IF EXISTS `portados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portados` (
  `numero` bigint(11) NOT NULL,
  `rn1` int(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  `op` int(11) NOT NULL,
  KEY `numero` (`numero`),
  KEY `rn1` (`rn1`),
  KEY `op` (`op`),
  KEY `data_hora` (`data_hora`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portados`
--

LOCK TABLES `portados` WRITE;
/*!40000 ALTER TABLE `portados` DISABLE KEYS */;
/*!40000 ALTER TABLE `portados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(1024) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','5d0cbce651d75d723c666ed3ea629ba8');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-18 19:34:03

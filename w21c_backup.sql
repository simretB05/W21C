-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: w21c
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `joined_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_un_name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'username_one','uythgstfre665',NULL),(2,'username_two','hdgdtyeiieop0987',NULL),(3,'username_three','iyuopiyeiieop0987',NULL),(4,'username_four','yuetey6590234opn','2023-06-12'),(6,'username_five','bbvcer4567','2023-06-12'),(7,'username_six','bbgahs546','2023-06-12'),(9,'username_seven','dhhduy897dhdg','2023-06-12'),(10,'username_eight','bvgftr54','2023-06-12'),(11,'username_ten','nbhgy7890oi','2023-06-12'),(14,'username_11','nbvhggfdrtefr567g','2023-06-12'),(16,'username_67','nbvhggfdrtefr567gkkk','2023-06-12'),(25,'newfname','nmbayhgshsh','2023-06-12'),(26,'newfnamee','nmbayhgshshe','2023-06-12'),(27,'newfn','nmbayhgsh','2023-06-12'),(29,'newfnuy','nmbayhgshpoi98','2023-06-12'),(30,'nenve','88889','2023-06-12'),(33,'simret','66789df','2023-06-12'),(34,'simretp','66789dfnnmj','2023-06-12'),(35,'simretpoo','66789dfnnmjoo','2023-06-12'),(44,':username_input',':password_input','2023-06-12');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_un_token` (`token`),
  KEY `login_FK` (`client_id`),
  CONSTRAINT `login_FK` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,1,'nbvvfg543we32456'),(2,4,'n7yyyop0987vb56'),(6,6,'nhhgf6657lok'),(8,9,'nnmiop0987y'),(9,10,'nmjhuy76'),(10,9,'nmjhuy76ooiij'),(11,16,'nmjhuy76ooiijoop'),(12,16,'87opokmkji'),(13,25,'87mnhopokmkji908'),(15,25,'87mnhobb'),(17,26,'87mnhoboob'),(18,27,'bvcfgt6753'),(19,29,'bbbcv53'),(22,29,'bbbcv530090'),(32,30,'bbbcv530090ooii'),(38,33,'bbbvcgdf90'),(40,34,'bbbbxxxbvcgdf90'),(41,35,'bbbbxxxbvnnbbcgdf90'),(43,44,'lllo098');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_FK` (`client_id`),
  CONSTRAINT `post_FK` FOREIGN KEY (`client_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,8,'this is the first content','2023-06-12'),(2,9,'this is the eight content','2023-06-12'),(3,2,'this is the xxxx content','2023-06-12'),(4,1,':content_input','2023-06-12'),(5,38,':content_inputmmmm','2023-06-12'),(6,38,':contentgghhh_inputmmmm','2023-06-12'),(7,38,':contentgghhh_inputmmgghhjjmm','2023-06-12'),(8,38,':contentgghhh_inputmmgghhjjmpppppppppppppppppm','2023-06-12'),(9,40,':cnbbontentgghhh_inputmmgghhjjmpppppppppppppppppm','2023-06-12'),(10,40,':cnbbontentgghhh_inputmmgghhjjmppppppppppppppkkopiupppm','2023-06-12'),(11,41,':cnbbontentgghhh_inputmmgghhjjmppppppppppppppkkopiupppm','2023-06-12'),(12,43,':content_input','2023-06-12'),(13,43,':content_input','2023-06-12'),(14,43,':content_input000000000000hghhhhhhh','2023-06-12');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'w21c'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_new_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_client`( username_input varchar(100),password_input varchar(100))
begin
	insert into client(username,password,joined_on)
    values(username_input,password_input,now());
    select id from client;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_new_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_login`(username_input varchar(100),password_input varchar(100),token_input varchar(100))
begin
	declare client_id int;
    select  id into client_id
    from client
    where username = username_input and password = password_input;
    
    if client_id is not null then
        insert into login (client_id, token)
        values (client_id, token_input );
        
        select   convert(token using 'utf8') as token
        from login inner join client  on client.id=login.client_id ;
    else
        select null as id;
    end if;
   
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_new_post` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_post`(token_input varchar(100),content_input varchar(200))
begin
	declare client_id int;
    select  id into client_id
    from login 
    where token = token_input ;
    
    if client_id is not null then
        insert into post(client_id, content, created_at)
        values (client_id, content_input,now());
       
        select   p.id 
        from post p inner join login l on p.client_id =l.id  ;
       
    else
        select null as id  ;
    end if;
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

-- Dump completed on 2023-06-12 19:41:40

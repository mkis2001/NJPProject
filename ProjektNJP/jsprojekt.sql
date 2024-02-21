/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.32 : Database - jsprojekt
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jsprojekt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `jsprojekt`;

/*Table structure for table `album` */

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `dateOfRelease` date DEFAULT NULL,
  `basePrice` float DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `album` */

insert  into `album`(`id`,`name`,`author`,`genre`,`dateOfRelease`,`basePrice`,`image`) values 
(1665,'novi','novi','novi','2024-02-02',7,'https://f4.bcbits.com/img/a3139023146_16.jpg'),
(3432,'Altar of Decay (EP)','Mortiferum','Doom Death Metal','2018-03-23',6,'https://f4.bcbits.com/img/a3139023146_16.jpg'),
(5021,'To Bathe From The Throat Of Cowardice','Vitriol','Death Metal','2019-09-06',12,'https://f4.bcbits.com/img/a2866546451_16.jpg'),
(5839,'Seven Keys To The Discomfort Of Being','Predatory Void','Sludge Death Metal','2023-04-21',12,'https://www.metal-archives.com/images/1/1/1/5/1115584.jpg?5257'),
(6045,'Formulas Fatal to the Flesh','Morbid Angel','Death Metal','1998-02-24',10,'https://www.spirit-of-metal.com/cover.php?id_album=1082'),
(7048,'Hidden History of the Human Race','Blood Incantation','Death Metal','2019-11-22',12,'https://www.metal-archives.com/images/7/9/8/4/798411.jpg?0822'),
(7911,'The Outer Ones','Revocation','Techincal Death Metal','2018-09-28',12,'https://f4.bcbits.com/img/a0179473372_16.jpg'),
(8130,'Suffer & Become','Vitriol','Death Metal','2024-01-26',12,'https://f4.bcbits.com/img/a0898092350_16.jpg'),
(9045,'Preserved In Torment','Mortiferum','Doom Death Metal','2021-11-05',10,'https://f4.bcbits.com/img/a2023493628_16.jpg'),
(9470,'The Deep Longing for Annihilation','Alluvial','Instrumental Death Metal','2017-01-06',10,'https://www.metal-archives.com/images/6/2/7/7/627777.jpg?3559'),
(9681,'Where Owls Know My Name','Rivers of Nihil','Progressive Death Metal','2018-03-16',12,'https://f4.bcbits.com/img/a2769366830_65');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `itemId` int DEFAULT NULL,
  `typeId` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `id` int NOT NULL,
  `units` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemId` (`itemId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `item` */

insert  into `item`(`itemId`,`typeId`,`price`,`id`,`units`) values 
(6045,2,22,1444,14),
(9681,1,12,1491,NULL),
(9045,1,10,1952,NULL),
(5839,2,26.4,2203,8),
(8130,3,18,2424,17),
(3432,1,6,2513,NULL),
(9470,1,10,3569,NULL),
(6045,1,10,3979,NULL),
(5839,1,12,4179,NULL),
(7911,3,18,4382,15),
(9470,2,22,6248,10),
(7911,2,26.4,6478,24),
(7911,1,12,6950,NULL),
(7048,1,12,7252,NULL),
(7048,2,26.4,7947,9),
(9045,3,15,8343,10),
(5021,2,26.4,8707,17),
(5021,1,12,9333,NULL),
(8130,1,12,9582,NULL),
(9681,3,18,9602,20);

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `itemId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemId` (`itemId`),
  KEY `userId` (`userId`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `transaction` */

insert  into `transaction`(`id`,`itemId`,`userId`,`timestamp`) values 
(18,8707,8,'2024-02-12 17:10:01'),
(19,3979,8,'2024-02-12 17:10:15'),
(20,2203,6,'2024-02-12 17:50:30'),
(21,2424,6,'2024-02-12 17:50:37'),
(22,1952,6,'2024-02-12 17:50:46'),
(23,7947,1,'2024-02-12 18:26:39'),
(24,8707,1,'2024-02-12 20:50:30'),
(25,1444,1,'2024-02-12 20:57:21'),
(26,2424,1,'2024-02-12 20:58:48'),
(27,2203,9,'2024-02-13 09:35:15'),
(28,2424,9,'2024-02-13 09:35:29'),
(29,6478,1,'2024-02-13 09:36:43'),
(30,7424,1,'2024-02-13 09:37:44');

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `priceCoef` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `type` */

insert  into `type`(`id`,`name`,`priceCoef`) values 
(1,'digital',1),
(2,'vinyl',2.2),
(3,'cd',1.5);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varbinary(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` int DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`name`,`email`,`level`,`salt`) values 
(1,'admin','ª∞¯‡ñ€›°í‰‰Åv}\\†¸ûß˜.é˜Á!´ΩnÖ@øÅ?D”çköÁâ˛;·§(v$cÌ¨√\'ÊkÀËsD%','admin','admin@admin',2,'kmgsj/9h6BL9KtsJJ5Ij8sBptr/tv2pTN2Pge9EPM4tKpckT+FEy3ZGRfGILn3gENqf9DwmN5FA5VgKUV2jTeqhTgqp7ZYflzMmeDqVwviilzrdNv7vYIg1wAVHitS3h72zuOcY9goDLnkxyBhOZgcClpQI7oEToC6KcoeBuZno='),
(6,'novi','«ﬂ#„…pöJMøP§ì#hª≠lÊyV˙Ê˝°e»;\'ΩÛWl_≠ûúqõn!.°g˝[≈j∆rªTÿL{','novi','novi@novi',1,'rSg25f+0kKfXb3tD6MPsaKAHx2t3t9AMPDdx0+Gftc0sUJ/0ECkq2kWm7gog8C3BWNUOhx5UWOTAsCyOfbebYFb/Jq/QpZ6keF/QYFIDKMDjcKZAR6ZIqCmcJMCR2Oj9Tc9yYl9fEvINB2fxePLDO/umHjnIEFrf7w+MxPL36aA='),
(8,'user','H/≠≥˘+5»QÈ|úO~Mã§`¯éı⁄(ë∂≥ÀÙˆØÆ[πÑ*9 µ\n/]xç@OÁëAø]°„','user','user@user',1,'mldplf+jwZj0yCutrxJ44kJkwwLomIPVBZd/wrhnQZ7PYQsTl2hQrDZ1Io8j9UaOJaBjkVEqiI7hYA2okCIfCLLAhhTGsm8q+v6VhmFFZahHIJEsv2VxF0TPNH4Vhp5OCZi36lL17nZ3fUY2suz5mdNbOy0nmVct8UuPKamHQsY='),
(9,'matej','∂W∫J>˙5ÛËås‰G°¢ÙsIÀ˝û(®ÚùW„œŒT&#Ínq:\rΩ&ˆj\Z-dÍ3fO—_º\rõ„;è','matej','matej@matej',1,'/fxwQrofcOvnMW+21/ok1j7ZNI7Yl9qyXFgaKMfY+XoVCep/BCDhN0jfE3xHq2n8Rt0YFTlcxkCFNZ4fwhmWmdNjxtFW8ICFwKd+JP1+RwZgKDNbiKrodi7Yu+xFmW8gfTS3H2DPTCqS84Q40K/iQVf94wMQIRT+FnfM3c8plC4=');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

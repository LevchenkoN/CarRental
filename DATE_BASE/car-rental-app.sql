CREATE DATABASE  IF NOT EXISTS `car_db`;
USE `car_db`;

SET NAMES utf8 ;

--
-- login: user@gmail.com
-- password: password
--

DROP TABLE IF EXISTS `car`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `car` (
                       `id` int(11) NOT NULL AUTO_INCREMENT,
                       `brand` varchar(255) DEFAULT NULL,
                       `desciption` varchar(255) DEFAULT NULL,
                       `image_url` varchar(255) DEFAULT NULL,
                       `model` varchar(255) DEFAULT NULL,
                       `price_for_a_day` int(11) DEFAULT NULL,
                       `status` varchar(255) DEFAULT NULL,
                       PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
INSERT INTO `car` VALUES (1,'Volkswagen','
    Тип кузова - Седан.
    Объем двигателя - 2.0 л 150 л.с..
    Тип трансмиссии - Автомат.
    Тип топлива - Дизель','/images/Passat B8.jpg','Passat B8',700,'доступний')
                       ,(2,'Infiniti','
    Тип кузова - Седан.
    Объем двигателя - 3.7 л 333 л.с..
    Тип трансмиссии - Автомат.
    Тип топлива - Бензин.
','/images/Infinity_Q50.jpg','Q50',1500,'доступний')
                       ,(3,'Suzuki','
    Тип кузова - Кроссовер.
    Объем двигателя - 1.0 л 111 л.с..
    Тип трансмиссии - Автомат.
    Тип топлива - Бензин.
','/images/Suzuki_Vitara_NEW.png','Vitara NEW IV',900,'доступний');
UNLOCK TABLES;

--
-- Table structure for table `car_location`
--

DROP TABLE IF EXISTS `car_location`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `car_location` (
                                `location_id` int(11) DEFAULT NULL,
                                `car_id` int(11) NOT NULL,
                                PRIMARY KEY (`car_id`),
                                KEY `FKgttx1yknaay40bvo05p23sxm0` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_location`
--

LOCK TABLES `car_location` WRITE;
INSERT INTO `car_location` VALUES (1,1),(2,2),(3,3);
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
    `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
INSERT INTO `hibernate_sequence` VALUES (11),(11);
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `address` varchar(255) DEFAULT NULL,
                            `city` varchar(255) DEFAULT NULL,
                            `phone_number` int(11) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
INSERT INTO `location` VALUES (1,'вул. Шевченка 47','Київ',036789698)
                            ,(2,'вул. Щорса 3','Чернігів',666777888)
                            ,(3,'вул. Ягідна 33','Дніпро',444333222);

UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `persistent_logins` (
                                     `username` varchar(64) NOT NULL,
                                     `series` varchar(64) NOT NULL,
                                     `token` varchar(64) NOT NULL,
                                     `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                     PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `reservation` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `price` int(11) DEFAULT NULL,
                               `rent_date` datetime DEFAULT NULL,
                               `return_date` datetime DEFAULT NULL,
                               `car_id` int(11) DEFAULT NULL,
                               `rent_location_id` int(11) DEFAULT NULL,
                               `return_location_id` int(11) DEFAULT NULL,
                               `user_id` int(11) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `FKgkmbspv7rljixxoxo1af80lpp` (`car_id`),
                               KEY `FK6mhc4hgjkr5xs1tuhychas63q` (`rent_location_id`),
                               KEY `FK1xocvhpwphxq6vslvhamky20x` (`return_location_id`),
                               KEY `FKm4oimk0l1757o9pwavorj6ljg` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
                        `role_id` int(11) NOT NULL AUTO_INCREMENT,
                        `role` varchar(255) DEFAULT NULL,
                        PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'CLIENT');
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `firstname` varchar(255) NOT NULL,
                        `lastname` varchar(255) NOT NULL,
                        `email` varchar(255) NOT NULL,
                        `password` varchar(255) NOT NULL,
                        `active` int(11) DEFAULT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'user','user','user@gmail.com','$2a$10$BzLhjL1ANF5lDUvWyqgXB.nmTRjUIQkeB3k9EZtWzMI2cM5uZbiy2',1);

UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
                             `user_id` int(11) NOT NULL,
                             `role_id` int(11) NOT NULL,
                             PRIMARY KEY (`user_id`,`role_id`),
                             KEY `user_role_key` (`role_id`),
                             CONSTRAINT `role_userrole` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
                             CONSTRAINT `user_userrole` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
INSERT INTO `user_role` VALUES (1,1);
UNLOCK TABLES;

--
-- Dumping events for database 'car_db'
--


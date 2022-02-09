/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.14-MariaDB : Database - zz_cemetery_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`epiz_31012244_cemetery` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `epiz_31012244_cemetery`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varbinary(100) NOT NULL,
  `account_name` varchar(75) NOT NULL,
  `token` varchar(70) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=234456 DEFAULT CHARSET=utf8mb4;

/*Data for the table `admin` */

insert  into `admin`(`user_id`,`username`,`password`,`account_name`,`token`,`user_type`) values 
(234454,'admin','admin','JMEEDO','tr282SHndskds908HsjsxkITYsds','Admin');

/*Table structure for table `deceased` */

DROP TABLE IF EXISTS `deceased`;

CREATE TABLE `deceased` (
  `deceased_id` int(11) NOT NULL AUTO_INCREMENT,
  `immediate_family_id` int(11) NOT NULL,
  `fullname` varchar(70) NOT NULL,
  `date_of_death` date NOT NULL,
  `date_of_interment` date NOT NULL,
  `date_validity_period` date DEFAULT NULL,
  PRIMARY KEY (`deceased_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `deceased` */

insert  into `deceased`(`deceased_id`,`immediate_family_id`,`fullname`,`date_of_death`,`date_of_interment`,`date_validity_period`) values 
(1,1,'John Doe','2022-01-11','2022-01-15','2022-01-15'),
(2,1,'Dee Doo','2022-01-13','2022-01-20',NULL),
(3,3,'Bang Kay','2022-01-11','2022-01-19',NULL),
(4,4,'Dead Pool','2022-01-25','2022-01-29',NULL),
(5,1,'Dead Pool','2022-01-25','2022-01-31',NULL),
(6,5,'Test Dead','2022-01-25','2022-01-26',NULL),
(7,5,'Noo Noow','2022-01-24','2022-01-31',NULL),
(8,5,'Soo Noow','2022-01-24','2022-01-31',NULL);

/*Table structure for table `facility` */

DROP TABLE IF EXISTS `facility`;

CREATE TABLE `facility` (
  `facility_id` int(11) NOT NULL AUTO_INCREMENT,
  `deceased_id` int(11) DEFAULT NULL,
  `burial_option` varchar(50) DEFAULT NULL,
  `lot_cluster` varchar(50) DEFAULT NULL,
  `block_type_category` varchar(50) DEFAULT NULL,
  `level_layer` varchar(50) DEFAULT NULL,
  `level_number` varchar(50) DEFAULT NULL,
  `lot_number` varchar(50) DEFAULT NULL,
  `has_purchased_lot` varchar(50) DEFAULT NULL,
  `burial_permit_fee` varchar(50) DEFAULT NULL,
  `excavate_and_construction` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `facility` */

insert  into `facility`(`facility_id`,`deceased_id`,`burial_option`,`lot_cluster`,`block_type_category`,`level_layer`,`level_number`,`lot_number`,`has_purchased_lot`,`burial_permit_fee`,`excavate_and_construction`) values 
(4,1,'Burial Ground (9f x 4f)','Lot Cluster A (Mount Moriah)','','','','123','Yes','Yes','Yes');

/*Table structure for table `immediate_family` */

DROP TABLE IF EXISTS `immediate_family`;

CREATE TABLE `immediate_family` (
  `immediate_family_id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_date` date NOT NULL,
  `fullname` varchar(75) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `address` varchar(75) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(70) NOT NULL,
  `remarks` varchar(50) NOT NULL DEFAULT 'Unverified',
  `token` varchar(30) NOT NULL,
  PRIMARY KEY (`immediate_family_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `immediate_family` */

insert  into `immediate_family`(`immediate_family_id`,`registration_date`,`fullname`,`contact_no`,`address`,`username`,`password`,`remarks`,`token`) values 
(1,'2021-12-07','Jane Doe','09087767671','NEW BASAK','user','123456','Verified','KsG4gG3htorz1Y2zqD0ot259K'),
(3,'2022-01-14','Justin Bebe','09087733221','Somewher in Jimenez','a','123456','Unverified','pLVsoFNkeNU6guCRM502iHbYa'),
(4,'2022-01-25','Tourism Office 1','09078889990','NEW BASAK','aa','123456','Unverified','l06bmGHtq5oeeGoN2OBwshAzV'),
(5,'2022-01-25','Carlo 1','09075555755','NEW BASAK','qqq','123456','Verified','If8WekMjNrHAaFM1jkF2XCtBb');

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_paid` date NOT NULL,
  `deceased_id` int(11) NOT NULL,
  `particular` text NOT NULL,
  `amount` double NOT NULL,
  `or_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

/*Data for the table `payments` */

insert  into `payments`(`payment_id`,`date_paid`,`deceased_id`,`particular`,`amount`,`or_number`) values 
(12,'2022-01-14',1,'Burial Permit Fee (500.00)',50500,'4353'),
(30,'2022-01-14',1,'Excavation and Construction of Niche (10000.00)',10000,'43355'),
(31,'2022-01-14',1,'Purchased Burial Lot (50000.00)<br/>',50000,'4522'),
(32,'2022-01-14',1,'Exhumation Fee (1500)<br/>Removal of Cadaver (3000)<br/>',4500,'23434'),
(33,'2022-01-14',1,'Another Cadaver of Immediate Family of the Dead will be buried in the same slot (Cabinet Type Pantheon) (15,000.00)<br/>',15000,'43500');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 5.5.42 : Database - verifiablesemanticsearchingschemeoverencrypteddata
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`verifiablesemanticsearchingschemeoverencrypteddata` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `verifiablesemanticsearchingschemeoverencrypteddata`;

/*Table structure for table `files` */

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `fileid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `rank_` int(50) unsigned DEFAULT NULL,
  `key_` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `keyword` varchar(45) DEFAULT NULL,
  `cat` varchar(45) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `filedata` varchar(50000) DEFAULT NULL,
  PRIMARY KEY (`fileid`,`key_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `files` */

insert  into `files`(`fileid`,`name`,`rank_`,`key_`,`title`,`keyword`,`cat`,`userid`,`filedata`) values 
(1,'ml.txt',4,'2174334','java','mobile','oracle','srinu','machine learning\r\n\r\n	supervised learning\r\n			classfication\r\n\r\n\r\ndata set Loading\r\n\r\nData Preprocessing\r\n-------------------------\r\n	handling null values\r\n	handling duplicate values\r\n	handling categorical values\r\n\r\n\r\nFeature engineering\r\n------------------------\r\n	outlier detection\r\n	feature scaling\r\n	feature selection\r\n\r\n\r\ndata visuviliation\r\n\r\n\r\ntrain test split\r\n\r\nmodel creation (knn,nb,dt,rf,sv,lG,xgboost,adaboost,gradient boosting)\r\ntrain\r\ntest\r\nperformance evaluation (accuracy,precision,recall,f1score,confusion matrix,auc-roc curve)\r\n\r\nmodel saving\r\n\r\nmodel deployment\r\n-----------------------\r\nfont end: html,css,js\r\nserver side: flask');

/*Table structure for table `regpage` */

DROP TABLE IF EXISTS `regpage`;

CREATE TABLE `regpage` (
  `name` varchar(45) NOT NULL DEFAULT '',
  `userid` varchar(45) NOT NULL DEFAULT '',
  `pass` varchar(45) NOT NULL DEFAULT '',
  `mail` varchar(45) NOT NULL DEFAULT '',
  `age` varchar(45) NOT NULL DEFAULT '',
  `loc` varchar(45) NOT NULL DEFAULT '',
  `sex` varchar(45) NOT NULL DEFAULT '',
  `time_` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `utype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `regpage` */

insert  into `regpage`(`name`,`userid`,`pass`,`mail`,`age`,`loc`,`sex`,`time_`,`utype`) values 
('raju','raju','raju','nagasrinu482@gmail.com','10-05-1990','hyderabad','female','2024-04-03 10:27:00','user'),
('srinu','srinu','srinu','nagasrinu482@gmail.com','10-05-1990','hyderabad','male','2024-04-03 10:26:33','owner');

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`id`,`name`,`user`,`filename`,`owner`,`description`) values 
(1,'2174334','raju','ml.txt','srinu','software training'),
(2,'2174334','raju','ml.txt','srinu','Hello');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

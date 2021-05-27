/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.20 : Database - library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- CREATE DATABASE /*!32312 IF NOT EXISTS*/`library` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `library`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `copies` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `books` */

insert  into `books`(`id`,`title`,`copies`) values 
(14,'Game of thrones',1),
(15,'Dungeons and dragons',1);

/*Table structure for table `books_to_return` */

DROP TABLE IF EXISTS `books_to_return`;

CREATE TABLE `books_to_return` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `date_asked` date DEFAULT NULL,
  `givenId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_returned` (`givenId`),
  CONSTRAINT `returned` FOREIGN KEY (`givenId`) REFERENCES `given_books` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `books_to_return` */

/*Table structure for table `given_books` */

DROP TABLE IF EXISTS `given_books`;

CREATE TABLE `given_books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bookId` int NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_con` (`bookId`),
  KEY `user_con` (`userId`),
  CONSTRAINT `book_con` FOREIGN KEY (`bookId`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_con` FOREIGN KEY (`userId`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `given_books` */

insert  into `given_books`(`id`,`bookId`,`userId`) values 
(52,14,2);

/*Table structure for table `pre_register` */

DROP TABLE IF EXISTS `pre_register`;

CREATE TABLE `pre_register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pre_register` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` char(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` char(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`userid`,`username`,`email`,`password`,`role`) values 
(1,'admin','admin@hotmail.com','123','admin'),
(2,'user','user@fake.com','123','user');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

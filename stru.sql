/*
SQLyog Community
MySQL - 5.7.18-log : Database - ect
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`z` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `z`;

/*Table structure for table `objeto` */

DROP TABLE IF EXISTS `objeto`;

CREATE TABLE `objeto` (
  `codigo` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `etiqueta` char(13) NOT NULL,
  `cep` char(8) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `orgao` */

DROP TABLE IF EXISTS `orgao`;

CREATE TABLE `orgao` (
  `mcu` char(8) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sigla` varchar(50) NOT NULL,
  `tipo` char(3) NOT NULL,
  `tipo2` char(2) NOT NULL,
  `uf` char(2) NOT NULL,
  `cod_dr` char(2) NOT NULL,
  `nome_dr` varchar(50) DEFAULT NULL,
  `sigla_dr` varchar(10) DEFAULT NULL,
  `cidade` varchar(50) NOT NULL,
  `cep` char(8) NOT NULL,
  `texto` text NOT NULL,
  PRIMARY KEY (`mcu`),
  KEY `mcu` (`mcu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Procedure structure for procedure `orgaos_seleciona` */

/*!50003 DROP PROCEDURE IF EXISTS  `orgaos_seleciona` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `orgaos_seleciona`(
	vtxt text
)
BEGIN
	select mcu, nome, tipo, cidade, sigla_dr dr, uf, cep
	from orgao
	where match(texto) against(vtxt in boolean mode) and
				nome_dr is not null and
				sigla_dr is not null;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

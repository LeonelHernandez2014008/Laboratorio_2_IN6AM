/*
SQLyog Ultimate v9.63 
MySQL - 5.1.41 : Database - db_appturismo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_appturismo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_appturismo`;

/*Table structure for table `adminsitioturisticos` */

DROP TABLE IF EXISTS `adminsitioturisticos`;

CREATE TABLE `adminsitioturisticos` (
  `id_adminsitioturistico` int(11) NOT NULL AUTO_INCREMENT,
  `id_Usuario` int(11) DEFAULT NULL,
  `id_sitioturistico` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_adminsitioturistico`),
  KEY `id_Usuario` (`id_Usuario`),
  KEY `id_sitioturistico` (`id_sitioturistico`),
  CONSTRAINT `adminsitioturisticos_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `adminsitioturisticos_ibfk_2` FOREIGN KEY (`id_sitioturistico`) REFERENCES `sitioturisticos` (`id_sitioturistico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `adminsitioturisticos` */

/*Table structure for table `alerta` */

DROP TABLE IF EXISTS `alerta`;

CREATE TABLE `alerta` (
  `id_alerta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `id_bitacora` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_alerta`),
  KEY `id_bitacora` (`id_bitacora`),
  CONSTRAINT `alerta_ibfk_1` FOREIGN KEY (`id_bitacora`) REFERENCES `bitacoras` (`id_bitacora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `alerta` */

/*Table structure for table `bitacoras` */

DROP TABLE IF EXISTS `bitacoras`;

CREATE TABLE `bitacoras` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_bitacora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bitacoras` */

/*Table structure for table `hotels` */

DROP TABLE IF EXISTS `hotels`;

CREATE TABLE `hotels` (
  `id_hotel` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `id_tipohotel` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_hotel`),
  KEY `id_tipohotel` (`id_tipohotel`),
  CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`id_tipohotel`) REFERENCES `tipohotels` (`id_tipohotel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hotels` */

/*Table structure for table `mapas` */

DROP TABLE IF EXISTS `mapas`;

CREATE TABLE `mapas` (
  `id_mapa` int(11) NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_mapa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mapas` */

/*Table structure for table `restaurantes` */

DROP TABLE IF EXISTS `restaurantes`;

CREATE TABLE `restaurantes` (
  `id_restaurante` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_restaurante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `restaurantes` */

/*Table structure for table `rols` */

DROP TABLE IF EXISTS `rols`;

CREATE TABLE `rols` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `rols` */

insert  into `rols`(`id_rol`,`rol`,`createdAt`,`updatedAt`) values (1,'Usuario','2016-05-26 18:20:33','2017-03-31 18:20:39');

/*Table structure for table `sitioturisticos` */

DROP TABLE IF EXISTS `sitioturisticos`;

CREATE TABLE `sitioturisticos` (
  `id_sitioturistico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_mapa` int(11) DEFAULT NULL,
  `id_hotel` int(11) DEFAULT NULL,
  `id_restaurante` int(11) DEFAULT NULL,
  `id_alerta` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_sitioturistico`),
  KEY `id_mapa` (`id_mapa`),
  KEY `id_hotel` (`id_hotel`),
  KEY `id_restaurante` (`id_restaurante`),
  KEY `id_alerta` (`id_alerta`),
  CONSTRAINT `sitioturisticos_ibfk_1` FOREIGN KEY (`id_mapa`) REFERENCES `mapas` (`id_mapa`),
  CONSTRAINT `sitioturisticos_ibfk_2` FOREIGN KEY (`id_hotel`) REFERENCES `hotels` (`id_hotel`),
  CONSTRAINT `sitioturisticos_ibfk_3` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurantes` (`id_restaurante`),
  CONSTRAINT `sitioturisticos_ibfk_4` FOREIGN KEY (`id_alerta`) REFERENCES `alerta` (`id_alerta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sitioturisticos` */

/*Table structure for table `tipohotels` */

DROP TABLE IF EXISTS `tipohotels`;

CREATE TABLE `tipohotels` (
  `id_tipohotel` int(11) NOT NULL AUTO_INCREMENT,
  `tipohotel` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_tipohotel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipohotels` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rols` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuario`,`nombre`,`correo`,`contrasena`,`id_rol`,`createdAt`,`updatedAt`) values (1,'Leonel','Lh@gmail.com','123',1,'2016-05-26 18:21:17','2017-03-24 18:21:20');

/* Procedure structure for procedure `sp_autenticarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_autenticarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_autenticarUsuario`(IN _nick varchar(128),in _contrasena varchar(128))
BEGIN
	select nombre,correo,nick from usuario where usuario.`nick`=_nick and usuario.`contraseña`=_contrasena;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listacontactos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listacontactos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listacontactos`(in _idUsuario int)
BEGIN
	SELECT contacto.idContacto,contacto.nombre,contacto.correo,contacto.direccion,contacto.nombre,contacto.telefonoCasa,contacto.telefonoMovil,usuario.nombre AS usuario,usuario.idUsuario FROM contacto 
	LEFT JOIN usuario ON usuario.idUsuario=contacto.idUsuario 
	where usuario.idUsuario=_idUsuario;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_registroUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_registroUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registroUsuario`(IN _nombre varchar(128),IN _correo varchar(128),in _nick varchar(128),_contraseña varchar(128))
BEGIN
	insert into usuario values(null,_nombre,_correo,_nick,_contraseña);
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
SQLyog Community Edition- MySQL GUI v8.04 
MySQL - 5.0.51a-community-nt : Database - cocktails_and_drinks
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`cocktails_and_drinks` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;

USE `cocktails_and_drinks`;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `ID_CLIENTES` int(10) unsigned NOT NULL auto_increment,
  `RAZON_SOCIAL` varchar(45) collate utf8_spanish_ci NOT NULL,
  `CIF` varchar(45) collate utf8_spanish_ci NOT NULL,
  `DIRECCION` varchar(45) collate utf8_spanish_ci NOT NULL,
  `TELEFONO` varchar(45) collate utf8_spanish_ci NOT NULL,
  `EMAIL` varchar(45) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`ID_CLIENTES`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `ID_EMP` int(10) unsigned NOT NULL auto_increment,
  `NOMBRE` varchar(45) collate utf8_spanish_ci NOT NULL,
  `APELLIDOS` varchar(45) collate utf8_spanish_ci NOT NULL,
  `NIF` varchar(45) collate utf8_spanish_ci NOT NULL,
  `EMAIL` varchar(45) collate utf8_spanish_ci NOT NULL,
  `ID_ROL` int(10) unsigned NOT NULL,
  `DIRECCION` varchar(45) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`ID_EMP`),
  KEY `FK_empleados_1` (`ID_ROL`),
  CONSTRAINT `FK_empleados_1` FOREIGN KEY (`ID_ROL`) REFERENCES `roles` (`ID_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Table structure for table `pedidos` */

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `ID_SOLICITUD` int(10) unsigned NOT NULL auto_increment,
  `ID_PEDIDO` int(10) unsigned NOT NULL,
  `ID_CLIENTES` int(10) unsigned NOT NULL,
  `ID_PRODUCTO` int(10) unsigned NOT NULL,
  `PVP` int(10) unsigned NOT NULL,
  `DIRECCION_ENTREGA` varchar(45) collate utf8_spanish_ci NOT NULL,
  `UNIDADES` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID_SOLICITUD`),
  KEY `FK_pedidos_1` (`ID_CLIENTES`),
  KEY `FK_pedidos_2` (`ID_PRODUCTO`),
  CONSTRAINT `FK_pedidos_1` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`),
  CONSTRAINT `FK_pedidos_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `ID_PRODUCTO` int(10) unsigned NOT NULL auto_increment,
  `DENOMINACION` varchar(45) collate utf8_spanish_ci NOT NULL,
  `PVP` int(11) NOT NULL,
  `RATIO` int(11) NOT NULL,
  `P_NETO` int(11) NOT NULL,
  `ID_VINO` int(10) unsigned NOT NULL,
  `EXISTENCIAS` int(11) NOT NULL,
  `ID_TIPO_PROVEEDOR` int(10) unsigned NOT NULL,
  `DENOMINACION_ORIGEN` varchar(45) collate utf8_spanish_ci default NULL,
  PRIMARY KEY  (`ID_PRODUCTO`),
  KEY `FK_productos_1` (`ID_VINO`),
  KEY `FK_productos_2` (`ID_TIPO_PROVEEDOR`),
  CONSTRAINT `FK_productos_1` FOREIGN KEY (`ID_VINO`) REFERENCES `tipos_vinos` (`ID_VINO`),
  CONSTRAINT `FK_productos_2` FOREIGN KEY (`ID_TIPO_PROVEEDOR`) REFERENCES `tipos_proveedores` (`ID_TIPO_PROVEEDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `ID_ROL` int(10) unsigned NOT NULL auto_increment,
  `ROL` varchar(45) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  USING BTREE (`ID_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Table structure for table `tipos_proveedores` */

DROP TABLE IF EXISTS `tipos_proveedores`;

CREATE TABLE `tipos_proveedores` (
  `ID_TIPO_PROVEEDOR` int(10) unsigned NOT NULL auto_increment,
  `TIPO_PROVEEDOR` varchar(45) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  USING BTREE (`ID_TIPO_PROVEEDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Table structure for table `tipos_vinos` */

DROP TABLE IF EXISTS `tipos_vinos`;

CREATE TABLE `tipos_vinos` (
  `ID_VINO` int(10) unsigned NOT NULL auto_increment,
  `CATEGORIA` varchar(45) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`ID_VINO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Table structure for table `envios` */

DROP TABLE IF EXISTS `envios`;

/*!50001 DROP VIEW IF EXISTS `envios` */;
/*!50001 DROP TABLE IF EXISTS `envios` */;

/*!50001 CREATE TABLE `envios` (
  `ID_PEDIDO` int(10) unsigned NOT NULL,
  `ID_CLIENTES` int(10) unsigned NOT NULL,
  `RAZON_SOCIAL` varchar(45) collate utf8_spanish_ci NOT NULL,
  `ID_PRODUCTO` int(10) unsigned NOT NULL,
  `DENOMINACION` varchar(45) collate utf8_spanish_ci NOT NULL,
  `ID_VINO` int(10) unsigned NOT NULL,
  `CATEGORIA` varchar(45) collate utf8_spanish_ci NOT NULL,
  `UNIDADES` int(10) unsigned NOT NULL,
  `PVP` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci */;

/*Table structure for table `inventario` */

DROP TABLE IF EXISTS `inventario`;

/*!50001 DROP VIEW IF EXISTS `inventario` */;
/*!50001 DROP TABLE IF EXISTS `inventario` */;

/*!50001 CREATE TABLE `inventario` (
  `ID_PRODUCTO` int(10) unsigned NOT NULL default '0',
  `DENOMINACION` varchar(45) collate utf8_spanish_ci NOT NULL,
  `CATEGORIA` varchar(45) collate utf8_spanish_ci NOT NULL,
  `TIPO_PROVEEDOR` varchar(45) collate utf8_spanish_ci NOT NULL,
  `EXISTENCIAS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci */;

/*Table structure for table `listado_clientes` */

DROP TABLE IF EXISTS `listado_clientes`;

/*!50001 DROP VIEW IF EXISTS `listado_clientes` */;
/*!50001 DROP TABLE IF EXISTS `listado_clientes` */;

/*!50001 CREATE TABLE `listado_clientes` (
  `ID_CLIENTES` int(10) unsigned NOT NULL default '0',
  `RAZON_SOCIAL` varchar(45) collate utf8_spanish_ci NOT NULL,
  `CIF` varchar(45) collate utf8_spanish_ci NOT NULL,
  `DIRECCION` varchar(45) collate utf8_spanish_ci NOT NULL,
  `TELEFONO` varchar(45) collate utf8_spanish_ci NOT NULL,
  `EMAIL` varchar(45) collate utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci */;

/*Table structure for table `listado_emp` */

DROP TABLE IF EXISTS `listado_emp`;

/*!50001 DROP VIEW IF EXISTS `listado_emp` */;
/*!50001 DROP TABLE IF EXISTS `listado_emp` */;

/*!50001 CREATE TABLE `listado_emp` (
  `ID_EMP` int(10) unsigned NOT NULL default '0',
  `NOMBRE` varchar(45) collate utf8_spanish_ci NOT NULL,
  `APELLIDOS` varchar(45) collate utf8_spanish_ci NOT NULL,
  `NIF` varchar(45) collate utf8_spanish_ci NOT NULL,
  `EMAIL` varchar(45) collate utf8_spanish_ci NOT NULL,
  `ID_ROL` int(10) unsigned NOT NULL,
  `DIRECCION` varchar(45) collate utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci */;

/*Table structure for table `listado_internos` */

DROP TABLE IF EXISTS `listado_internos`;

/*!50001 DROP VIEW IF EXISTS `listado_internos` */;
/*!50001 DROP TABLE IF EXISTS `listado_internos` */;

/*!50001 CREATE TABLE `listado_internos` (
  `ID_PRODUCTO` int(10) unsigned NOT NULL default '0',
  `DENOMINACION` varchar(45) collate utf8_spanish_ci NOT NULL,
  `CATEGORIA` varchar(45) collate utf8_spanish_ci NOT NULL,
  `EXISTENCIAS` int(11) NOT NULL,
  `P_NETO` int(11) NOT NULL,
  `RATIO` int(11) NOT NULL,
  `PVP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci */;

/*Table structure for table `listado_productos` */

DROP TABLE IF EXISTS `listado_productos`;

/*!50001 DROP VIEW IF EXISTS `listado_productos` */;
/*!50001 DROP TABLE IF EXISTS `listado_productos` */;

/*!50001 CREATE TABLE `listado_productos` (
  `ID_PRODUCTO` int(10) unsigned NOT NULL default '0',
  `DENOMINACION` varchar(45) collate utf8_spanish_ci NOT NULL,
  `CATEGORIA` varchar(45) collate utf8_spanish_ci NOT NULL,
  `PVP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci */;

/*Table structure for table `salidas` */

DROP TABLE IF EXISTS `salidas`;

/*!50001 DROP VIEW IF EXISTS `salidas` */;
/*!50001 DROP TABLE IF EXISTS `salidas` */;

/*!50001 CREATE TABLE `salidas` (
  `ID_PRODUCTO` int(10) unsigned NOT NULL default '0',
  `DENOMINACION` varchar(45) collate utf8_spanish_ci NOT NULL,
  `P_NETO` int(11) NOT NULL,
  `ID_VINO` int(10) unsigned NOT NULL,
  `CATEGORIA` varchar(45) collate utf8_spanish_ci NOT NULL,
  `ID_TIPO_PROVEEDOR` int(10) unsigned NOT NULL,
  `TIPO_PROVEEDOR` varchar(45) collate utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci */;

/*View structure for view envios */

/*!50001 DROP TABLE IF EXISTS `envios` */;
/*!50001 DROP VIEW IF EXISTS `envios` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `envios` AS select `pedidos`.`ID_PEDIDO` AS `ID_PEDIDO`,`pedidos`.`ID_CLIENTES` AS `ID_CLIENTES`,`clientes`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,`pedidos`.`ID_PRODUCTO` AS `ID_PRODUCTO`,`productos`.`DENOMINACION` AS `DENOMINACION`,`productos`.`ID_VINO` AS `ID_VINO`,`tipos_vinos`.`CATEGORIA` AS `CATEGORIA`,`pedidos`.`UNIDADES` AS `UNIDADES`,`pedidos`.`PVP` AS `PVP` from (((`pedidos` join `clientes`) join `productos`) join `tipos_vinos`) where ((`pedidos`.`ID_CLIENTES` = `clientes`.`ID_CLIENTES`) and (`pedidos`.`ID_PRODUCTO` = `productos`.`ID_PRODUCTO`) and (`productos`.`ID_VINO` = `tipos_vinos`.`ID_VINO`)) */;

/*View structure for view inventario */

/*!50001 DROP TABLE IF EXISTS `inventario` */;
/*!50001 DROP VIEW IF EXISTS `inventario` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inventario` AS select `productos`.`ID_PRODUCTO` AS `ID_PRODUCTO`,`productos`.`DENOMINACION` AS `DENOMINACION`,`tipos_vinos`.`CATEGORIA` AS `CATEGORIA`,`tipos_proveedores`.`TIPO_PROVEEDOR` AS `TIPO_PROVEEDOR`,`productos`.`EXISTENCIAS` AS `EXISTENCIAS` from ((`productos` join `tipos_vinos`) join `tipos_proveedores`) where ((`productos`.`ID_VINO` = `tipos_vinos`.`ID_VINO`) and (`productos`.`ID_TIPO_PROVEEDOR` = `tipos_proveedores`.`ID_TIPO_PROVEEDOR`)) order by `productos`.`ID_PRODUCTO` */;

/*View structure for view listado_clientes */

/*!50001 DROP TABLE IF EXISTS `listado_clientes` */;
/*!50001 DROP VIEW IF EXISTS `listado_clientes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listado_clientes` AS select `clientes`.`ID_CLIENTES` AS `ID_CLIENTES`,`clientes`.`RAZON_SOCIAL` AS `RAZON_SOCIAL`,`clientes`.`CIF` AS `CIF`,`clientes`.`DIRECCION` AS `DIRECCION`,`clientes`.`TELEFONO` AS `TELEFONO`,`clientes`.`EMAIL` AS `EMAIL` from `clientes` */;

/*View structure for view listado_emp */

/*!50001 DROP TABLE IF EXISTS `listado_emp` */;
/*!50001 DROP VIEW IF EXISTS `listado_emp` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listado_emp` AS select `empleados`.`ID_EMP` AS `ID_EMP`,`empleados`.`NOMBRE` AS `NOMBRE`,`empleados`.`APELLIDOS` AS `APELLIDOS`,`empleados`.`NIF` AS `NIF`,`empleados`.`EMAIL` AS `EMAIL`,`empleados`.`ID_ROL` AS `ID_ROL`,`empleados`.`DIRECCION` AS `DIRECCION` from `empleados` */;

/*View structure for view listado_internos */

/*!50001 DROP TABLE IF EXISTS `listado_internos` */;
/*!50001 DROP VIEW IF EXISTS `listado_internos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listado_internos` AS select `productos`.`ID_PRODUCTO` AS `ID_PRODUCTO`,`productos`.`DENOMINACION` AS `DENOMINACION`,`tipos_vinos`.`CATEGORIA` AS `CATEGORIA`,`productos`.`EXISTENCIAS` AS `EXISTENCIAS`,`productos`.`P_NETO` AS `P_NETO`,`productos`.`RATIO` AS `RATIO`,`productos`.`PVP` AS `PVP` from (`productos` join `tipos_vinos`) where ((`productos`.`ID_TIPO_PROVEEDOR` = 1) and (`productos`.`ID_VINO` = `tipos_vinos`.`ID_VINO`)) */;

/*View structure for view listado_productos */

/*!50001 DROP TABLE IF EXISTS `listado_productos` */;
/*!50001 DROP VIEW IF EXISTS `listado_productos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listado_productos` AS select `productos`.`ID_PRODUCTO` AS `ID_PRODUCTO`,`productos`.`DENOMINACION` AS `DENOMINACION`,`tipos_vinos`.`CATEGORIA` AS `CATEGORIA`,`productos`.`PVP` AS `PVP` from (`productos` join `tipos_vinos`) where (`productos`.`ID_VINO` = `tipos_vinos`.`ID_VINO`) */;

/*View structure for view salidas */

/*!50001 DROP TABLE IF EXISTS `salidas` */;
/*!50001 DROP VIEW IF EXISTS `salidas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `salidas` AS select `productos`.`ID_PRODUCTO` AS `ID_PRODUCTO`,`productos`.`DENOMINACION` AS `DENOMINACION`,`productos`.`P_NETO` AS `P_NETO`,`productos`.`ID_VINO` AS `ID_VINO`,`tipos_vinos`.`CATEGORIA` AS `CATEGORIA`,`productos`.`ID_TIPO_PROVEEDOR` AS `ID_TIPO_PROVEEDOR`,`tipos_proveedores`.`TIPO_PROVEEDOR` AS `TIPO_PROVEEDOR` from ((`productos` join `tipos_vinos`) join `tipos_proveedores`) where ((`productos`.`ID_VINO` = `tipos_vinos`.`ID_VINO`) and (`productos`.`ID_TIPO_PROVEEDOR` = `tipos_proveedores`.`ID_TIPO_PROVEEDOR`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.5.8-MariaDB)
# Base de datos: restaurante
# Tiempo de Generación: 2021-04-04 20:36:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla pedido_producto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pedido_producto`;

CREATE TABLE `pedido_producto` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) unsigned DEFAULT NULL,
  `producto_id` int(11) unsigned DEFAULT NULL,
  `precio` float unsigned zerofill DEFAULT NULL,
  `cantidad` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `pedido_producto` WRITE;
/*!40000 ALTER TABLE `pedido_producto` DISABLE KEYS */;

INSERT INTO `pedido_producto` (`id`, `pedido_id`, `producto_id`, `precio`, `cantidad`)
VALUES
	(1,4,1,000000000500,00000000001),
	(2,4,2,000000001500,00000000001),
	(3,5,1,000000000500,00000000001),
	(4,5,2,000000001500,00000000001);

/*!40000 ALTER TABLE `pedido_producto` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla pedidos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `forma_pago` enum('Efectivo','TC','TD') DEFAULT NULL,
  `estado_pedido` enum('Nuevo','Confirmado','Preparado','Enviado','Entregado','Cancelado') DEFAULT NULL,
  `total` float unsigned zerofill DEFAULT NULL,
  `usuario_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;

INSERT INTO `pedidos` (`id`, `forma_pago`, `estado_pedido`, `total`, `usuario_id`)
VALUES
	(1,'Efectivo','Nuevo',000000002000,123),
	(2,'Efectivo','Nuevo',000000002000,123),
	(3,'Efectivo','Nuevo',000000002000,123),
	(4,'Efectivo','Nuevo',000000002000,123),
	(5,'Efectivo','Confirmado',000000002000,2);

/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla producto_favorito
# ------------------------------------------------------------

DROP TABLE IF EXISTS `producto_favorito`;

CREATE TABLE `producto_favorito` (
  `usuarioId` int(11) NOT NULL,
  `productoId` int(11) NOT NULL,
  PRIMARY KEY (`usuarioId`,`productoId`),
  CONSTRAINT `producto_favorito_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `producto_favorito` WRITE;
/*!40000 ALTER TABLE `producto_favorito` DISABLE KEYS */;

INSERT INTO `producto_favorito` (`usuarioId`, `productoId`)
VALUES
	(18,1),
	(18,2),
	(18,3),
	(19,2),
	(19,4);

/*!40000 ALTER TABLE `producto_favorito` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla productos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `url_foto` varchar(255) DEFAULT NULL,
  `precio` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;

INSERT INTO `productos` (`id`, `nombre`, `url_foto`, `precio`)
VALUES
	(1,'cocacola','https://www.distribuidorasantiago.cl/wp-content/uploads/2020/08/1638-C-COCACOLA-15-LT.jpg',500),
	(2,'hamburguesa','https://www.cocacoladechile.cl/productos/coca-cola/coca-cola-sin-azucar',1500),
	(3,'fideos','https://images.app.goo.gl/7EibVmBgDLfaJg8JA',3000),
	(4,'chocolate','https://images.app.goo.gl/CYWs41Q3Bq8gExe46',600),
	(7,'monstet','https://images.app.goo.gl/CYWs41Q3Bq8gExe46',1800);

/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla Usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Usuario`;

CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(255) NOT NULL,
  `nombre_apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `direccion_envio` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `esAdministrador` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;

INSERT INTO `Usuario` (`id`, `nombre_usuario`, `nombre_apellido`, `email`, `direccion_envio`, `telefono`, `contrasena`, `esAdministrador`)
VALUES
	(2,'kakin','kakin cardenas','kakin@email.com','kakin 123','1234','1234',1),
	(8,'yumeko2','nombre apellido test','test@email.com','calle 123','123','$2a$10$u0Cq.w9XTHpSnMN/3siYduJNV9xKE42RU6/hmYcgAeJA6TT0MaLoq',0),
	(16,'juin','polito mononi','tubellaco@email.com','calle 123',NULL,'$2a$10$GwUkhOWRkPDofQZ8evFMlevtJ8zNvxsDx6EAPOWSQGaIe3D1W4CFG',1),
	(17,'juin','polito mononi','tubellaco@email.com','calle 123',NULL,'$2a$10$dgyoxYdrnYVo9Wjn0/INM.n1Fg/m9IJ2p.laDuA2Mqvc0zLmsKp4.',1),
	(18,'juan','polito mononi','tubellaco@email.com','calle 123',NULL,'$2a$10$f3GMaOUjZzV0tMAZELzsk.inkjzsPgc2Xdjpaocodn4IlwT2cAdq.',0),
	(19,'silvi','polito mononi','tubellaco@email.com','calle 123',NULL,'$2a$10$d5o7h2uhzxVh5e715M7iLewHkXgytuz9sM3EPwvL/qAT3Jm.6Gjg2',1),
	(20,'silvimilvi','polito mononi','silvimilvi@email.com','calle 123',NULL,'$2a$10$kToliys5EA.UlK46QtHqBuK/VWHftr/0orF5VAeID50xNKEMSVcAe',0),
	(21,'silvimilvi','polito mononi','silvimilvi@email.com','calle 123',NULL,'$2a$10$9wnXI9x2D7kPfOOJeExpVOHwDvGKLHjI9krQBu9bRmGDuqGO.r3oi',0),
	(22,'silvimilvi','polito mononi','silvimilvi@email.com','calle 123',NULL,'$2a$10$b.ZKCpc7WbDUgI2qPoGhBu.JatXHceSO7.MKEfYUwBs231DaAbFZW',0);

/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

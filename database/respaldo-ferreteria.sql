-- MySQL dump 10.13  Distrib 8.4.13, for Linux (x86_64)
--
-- Host: localhost    Database: ferreteria
-- ------------------------------------------------------
-- Server version	8.4.13

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
-- Table structure for table `lineas_pedido`
--

DROP TABLE IF EXISTS `lineas_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineas_pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` int NOT NULL,
  `pedido_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj438esy59j3xndcyvc53w7qf7` (`pedido_id`),
  CONSTRAINT `FKj438esy59j3xndcyvc53w7qf7` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas_pedido`
--

LOCK TABLES `lineas_pedido` WRITE;
/*!40000 ALTER TABLE `lineas_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineas_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes_contacto`
--

DROP TABLE IF EXISTS `mensajes_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes_contacto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `asunto` varchar(120) DEFAULT NULL,
  `contenido` varchar(1000) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `leido` bit(1) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes_contacto`
--

LOCK TABLES `mensajes_contacto` WRITE;
/*!40000 ALTER TABLE `mensajes_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajes_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta_categorias`
--

DROP TABLE IF EXISTS `oferta_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta_categorias` (
  `oferta_id` bigint NOT NULL,
  `categoria` varchar(60) DEFAULT NULL,
  KEY `FKkjyleyyefum8g90gpw8djfg2t` (`oferta_id`),
  CONSTRAINT `FKkjyleyyefum8g90gpw8djfg2t` FOREIGN KEY (`oferta_id`) REFERENCES `ofertas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_categorias`
--

LOCK TABLES `oferta_categorias` WRITE;
/*!40000 ALTER TABLE `oferta_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `oferta_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta_productos`
--

DROP TABLE IF EXISTS `oferta_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta_productos` (
  `oferta_id` bigint NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  KEY `FKexh737iighx3bsdaoiwqdgurr` (`oferta_id`),
  CONSTRAINT `FKexh737iighx3bsdaoiwqdgurr` FOREIGN KEY (`oferta_id`) REFERENCES `ofertas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_productos`
--

LOCK TABLES `oferta_productos` WRITE;
/*!40000 ALTER TABLE `oferta_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `oferta_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofertas`
--

DROP TABLE IF EXISTS `ofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofertas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activa` bit(1) NOT NULL,
  `alcance` varchar(12) NOT NULL,
  `color` varchar(9) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `destacada` bit(1) NOT NULL,
  `etiqueta` varchar(30) DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `nombre` varchar(80) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `ofertas_chk_1` CHECK ((`valor` >= 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofertas`
--

LOCK TABLES `ofertas` WRITE;
/*!40000 ALTER TABLE `ofertas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `metodo` varchar(20) NOT NULL,
  `monto` int NOT NULL,
  `pedido_id` varchar(20) NOT NULL,
  `referencia` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKdavos0a2qshm9gu0c36rqpt8g` (`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cliente_correo` varchar(100) NOT NULL,
  `cliente_nombre` varchar(100) NOT NULL,
  `envio` int NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `subtotal` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigo` varchar(20) NOT NULL,
  `categoria` varchar(60) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` int NOT NULL,
  `stock` int NOT NULL,
  `stock_critico` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `productos_chk_1` CHECK ((`precio` >= 0)),
  CONSTRAINT `productos_chk_2` CHECK ((`stock` >= 0)),
  CONSTRAINT `productos_chk_3` CHECK ((`stock_critico` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('EL001','electricidad','Cable de cobre, aislacion 600V.','/img/productos/cable.jpg','Cable Electrico 2.5mm (rollo 20m)',13990,18,4),('HE001','herramientas-electricas','Taladro percutor de doble velocidad con maletin incluido.','/img/productos/taladro.jpg','Taladro Percutor 750W',44990,2,3),('HE002','herramientas-electricas','Amoladora de 820W con proteccion de disco ajustable.','/img/productos/amoladora.jpg','Amoladora Angular 4.5 pulgadas',32990,12,3),('HM001','herramientas-manuales','Martillo de uña con mango de fibra de vidrio antideslizante.','/img/productos/martillo.jpg','Martillo de Uña 16 oz',7990,42,8),('HM002','herramientas-manuales','Set de destornilladores planos y phillips con mango ergonomico.','/img/productos/destornilladores.jpg','Juego de Destornilladores 6 piezas',9990,30,6),('HM003','herramientas-manuales','Llave inglesa de acero al cromo vanadio.','/img/productos/llave-ajustable.jpg','Llave Ajustable 10 pulgadas',6490,25,5),('JA001','jardin-exterior','Manguera reforzada con pistola rociadora.','/img/productos/manguera.jpg','Manguera de Jardin 15 m',11990,20,4),('MC001','materiales-construccion','Cemento Portland de uso general para albañileria.','/img/productos/cemento.jpg','Cemento Gris 25 kg',6890,120,20),('PI001','pinturas-selladores','Latex lavable de alto poder cubriente, terminacion mate.','/img/productos/pintura-latex.jpg','Pintura Latex Interior 1 galon',15990,5,8),('PL001','plomeria','Llave de corte de PVC roscada.','/img/productos/llave-paso.jpg','Llave de Paso PVC 20mm',2990,55,10),('SE001','seguridad','Casco tipo jockey con matraca de ajuste.','/img/productos/casco.jpg','Casco de Seguridad Ajustable',8990,20,5);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `apellidos` varchar(100) NOT NULL,
  `clave_hash` varchar(100) NOT NULL,
  `comuna` varchar(80) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `region` varchar(80) DEFAULT NULL,
  `run` varchar(9) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKcdmw5hxlfj78uf4997i3qyyw5` (`correo`),
  UNIQUE KEY `UKksyidfr5g3rl0b04glr24fxjn` (`run`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'Ferretería Carrasco','$2a$10$m2s.eOZvU0u8NAkdsd02TOJw2FDyKx7YC/htS58bbP9aXGUaDIoMm',NULL,'luis.ferreteria373@gmail.com',NULL,'Administrador',NULL,'145202027','Administrador'),(2,1,'Permisos','$2a$10$RiPu0MxSyUx6JyXh0RrKsOxOXrUEAhxQWr4BrXAT4Olb6EbFPHR6y','Villa Alemana','prueba.permisos.403@gmail.com','Calle Prueba 123','Prueba','Region de Valparaiso','209998882','Cliente');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-19  1:18:29

CREATE DATABASE  IF NOT EXISTS `login_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `login_system`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: login_system
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comunidades`
--

DROP TABLE IF EXISTS `comunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunidades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidades`
--

LOCK TABLES `comunidades` WRITE;
/*!40000 ALTER TABLE `comunidades` DISABLE KEYS */;
INSERT INTO `comunidades` VALUES (1,'utnianos');
/*!40000 ALTER TABLE `comunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades`
--

DROP TABLE IF EXISTS `entidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `tipo` smallint DEFAULT NULL,
  `ubicacion_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgu9okyqag0wrorh55yyye4n57` (`ubicacion_id`),
  CONSTRAINT `FKgu9okyqag0wrorh55yyye4n57` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades`
--

LOCK TABLES `entidades` WRITE;
/*!40000 ALTER TABLE `entidades` DISABLE KEYS */;
INSERT INTO `entidades` VALUES (1,'UTN',1,1);
/*!40000 ALTER TABLE `entidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades_interesados`
--

DROP TABLE IF EXISTS `entidades_interesados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidades_interesados` (
  `entidad_id` bigint NOT NULL,
  `interesados_id` bigint NOT NULL,
  UNIQUE KEY `UK_dgqj7j9vrgtwkjpydl8rtkdx0` (`interesados_id`),
  KEY `FKqw2ie409mtww9tlgnr61dya6w` (`entidad_id`),
  CONSTRAINT `FKhipp2eswas7tgrhckkh813n3u` FOREIGN KEY (`interesados_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKqw2ie409mtww9tlgnr61dya6w` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades_interesados`
--

LOCK TABLES `entidades_interesados` WRITE;
/*!40000 ALTER TABLE `entidades_interesados` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidades_interesados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimientos`
--

DROP TABLE IF EXISTS `establecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establecimientos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `ubicacion_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK72q35sbc615l305d19ld7f3y6` (`ubicacion_id`),
  CONSTRAINT `FK72q35sbc615l305d19ld7f3y6` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientos`
--

LOCK TABLES `establecimientos` WRITE;
/*!40000 ALTER TABLE `establecimientos` DISABLE KEYS */;
INSERT INTO `establecimientos` VALUES (1,'utn -lugano',1);
/*!40000 ALTER TABLE `establecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimientos_interesados`
--

DROP TABLE IF EXISTS `establecimientos_interesados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `establecimientos_interesados` (
  `establecimiento_id` bigint NOT NULL,
  `interesados_id` bigint NOT NULL,
  UNIQUE KEY `UK_hnqubdh1gx7e62kjmvowau494` (`interesados_id`),
  KEY `FKlyedog5ey7jxquhbftmgdssnj` (`establecimiento_id`),
  CONSTRAINT `FKecneufnr410hhua9vdeykujmo` FOREIGN KEY (`interesados_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKlyedog5ey7jxquhbftmgdssnj` FOREIGN KEY (`establecimiento_id`) REFERENCES `establecimientos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientos_interesados`
--

LOCK TABLES `establecimientos_interesados` WRITE;
/*!40000 ALTER TABLE `establecimientos_interesados` DISABLE KEYS */;
/*!40000 ALTER TABLE `establecimientos_interesados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_entidad`
--

DROP TABLE IF EXISTS `estado_entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_entidad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_entidad`
--

LOCK TABLES `estado_entidad` WRITE;
/*!40000 ALTER TABLE `estado_entidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_incidentes`
--

DROP TABLE IF EXISTS `estado_incidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_incidentes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_incidentes`
--

LOCK TABLES `estado_incidentes` WRITE;
/*!40000 ALTER TABLE `estado_incidentes` DISABLE KEYS */;
INSERT INTO `estado_incidentes` VALUES (1,'Iniciado');
/*!40000 ALTER TABLE `estado_incidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidentes`
--

DROP TABLE IF EXISTS `incidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidentes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hora_de_apertura` date NOT NULL,
  `hora_de_cierre` date DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `comunidad_id` bigint NOT NULL,
  `estado_incidente` bigint DEFAULT NULL,
  `servicio` bigint DEFAULT NULL,
  `tipo_incidente` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd5vw8ggt4ewe9f696wet0i9i3` (`comunidad_id`),
  KEY `FKfvldls8priwj65v6l216dsmps` (`estado_incidente`),
  KEY `FKpdp26r60khcat0igq6rpdk8ob` (`servicio`),
  KEY `FK8krwwe5yoiwv0b66dqjxxbd73` (`tipo_incidente`),
  CONSTRAINT `FK8krwwe5yoiwv0b66dqjxxbd73` FOREIGN KEY (`tipo_incidente`) REFERENCES `tipo_incidentes` (`id`),
  CONSTRAINT `FKd5vw8ggt4ewe9f696wet0i9i3` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidades` (`id`),
  CONSTRAINT `FKfvldls8priwj65v6l216dsmps` FOREIGN KEY (`estado_incidente`) REFERENCES `estado_incidentes` (`id`),
  CONSTRAINT `FKpdp26r60khcat0igq6rpdk8ob` FOREIGN KEY (`servicio`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidentes`
--

LOCK TABLES `incidentes` WRITE;
/*!40000 ALTER TABLE `incidentes` DISABLE KEYS */;
INSERT INTO `incidentes` VALUES (1,'2024-02-14',NULL,'asdad',1,1,NULL,1),(2,'2024-02-14',NULL,'asdad',1,1,1,1),(3,'2024-02-14',NULL,'asdad',1,1,1,1),(4,'2024-02-14',NULL,'asdad',1,1,1,1);
/*!40000 ALTER TABLE `incidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizaciones`
--

DROP TABLE IF EXISTS `localizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `padre_id` bigint DEFAULT NULL,
  `tipo_localizacion_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8ln2b1gw9mhv6w557f68f2q5i` (`padre_id`),
  KEY `FKnuf2l8imb74gr6hnt37b1wstc` (`tipo_localizacion_id`),
  CONSTRAINT `FK8ln2b1gw9mhv6w557f68f2q5i` FOREIGN KEY (`padre_id`) REFERENCES `localizaciones` (`id`),
  CONSTRAINT `FKnuf2l8imb74gr6hnt37b1wstc` FOREIGN KEY (`tipo_localizacion_id`) REFERENCES `tipo_localizaciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizaciones`
--

LOCK TABLES `localizaciones` WRITE;
/*!40000 ALTER TABLE `localizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `localizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medio_de_notificacion`
--

DROP TABLE IF EXISTS `medio_de_notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medio_de_notificacion` (
  `tipo` varchar(31) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_persona` bigint NOT NULL,
  `id_medio` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKep97bcnpjl0j4a4as8si4444h` (`id_medio`),
  KEY `FK41wb1y0r163t06qcuajky903y` (`id_persona`),
  CONSTRAINT `FK41wb1y0r163t06qcuajky903y` FOREIGN KEY (`id_persona`) REFERENCES `users` (`id`),
  CONSTRAINT `FKep97bcnpjl0j4a4as8si4444h` FOREIGN KEY (`id_medio`) REFERENCES `medio_de_notificacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medio_de_notificacion`
--

LOCK TABLES `medio_de_notificacion` WRITE;
/*!40000 ALTER TABLE `medio_de_notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `medio_de_notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros`
--

DROP TABLE IF EXISTS `miembros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comunidad_id` bigint NOT NULL,
  `tipo_miembro` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKihmnywv4oigjc6si6gb21bxrm` (`comunidad_id`),
  KEY `FK8hjluqnhhci4n4lryv1fqyko` (`tipo_miembro`),
  KEY `FK8kdu9wprd7wly8hkhxcbqljwg` (`user_id`),
  CONSTRAINT `FK8hjluqnhhci4n4lryv1fqyko` FOREIGN KEY (`tipo_miembro`) REFERENCES `tipo_miembros` (`id`),
  CONSTRAINT `FK8kdu9wprd7wly8hkhxcbqljwg` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKihmnywv4oigjc6si6gb21bxrm` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros`
--

LOCK TABLES `miembros` WRITE;
/*!40000 ALTER TABLE `miembros` DISABLE KEYS */;
INSERT INTO `miembros` VALUES (1,1,1,1),(2,1,1,2);
/*!40000 ALTER TABLE `miembros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion_incidente`
--

DROP TABLE IF EXISTS `notificacion_incidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacion_incidente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `asunto` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `incidente_id` bigint DEFAULT NULL,
  `id_interesado` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8qd5setyl1ws88n5ysbm5m6r4` (`incidente_id`),
  KEY `FK8j566sb5nsrjbgt5okqik2201` (`id_interesado`),
  CONSTRAINT `FK8j566sb5nsrjbgt5okqik2201` FOREIGN KEY (`id_interesado`) REFERENCES `users` (`id`),
  CONSTRAINT `FK8qd5setyl1ws88n5ysbm5m6r4` FOREIGN KEY (`incidente_id`) REFERENCES `incidentes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion_incidente`
--

LOCK TABLES `notificacion_incidente` WRITE;
/*!40000 ALTER TABLE `notificacion_incidente` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacion_incidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USUARIO');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_notificacion`
--

DROP TABLE IF EXISTS `servicio_notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_notificacion` (
  `tipo` varchar(31) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_notificacion`
--

LOCK TABLES `servicio_notificacion` WRITE;
/*!40000 ALTER TABLE `servicio_notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio_notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_notificacion_persona`
--

DROP TABLE IF EXISTS `servicio_notificacion_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_notificacion_persona` (
  `id_persona` bigint NOT NULL,
  `id_servicio` bigint NOT NULL,
  KEY `FK1n74wd1r80w50j1rtmd8edpyh` (`id_servicio`),
  KEY `FK87d4pd009q7m67qe4xovsbw7u` (`id_persona`),
  CONSTRAINT `FK1n74wd1r80w50j1rtmd8edpyh` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_notificacion` (`id`),
  CONSTRAINT `FK87d4pd009q7m67qe4xovsbw7u` FOREIGN KEY (`id_persona`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_notificacion_persona`
--

LOCK TABLES `servicio_notificacion_persona` WRITE;
/*!40000 ALTER TABLE `servicio_notificacion_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio_notificacion_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `es_habitual` bit(1) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo_servicio` bigint DEFAULT NULL,
  `entidad_id` bigint DEFAULT NULL,
  `establecimiento_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKayv3e2wefq6n6j9nrrhxm2aly` (`entidad_id`),
  KEY `FKbrq7a048uajrhqbhrmcq76diu` (`tipo_servicio`),
  KEY `FKo04hkoh4n31m4ricjdfr6dhmd` (`establecimiento_id`),
  CONSTRAINT `FKayv3e2wefq6n6j9nrrhxm2aly` FOREIGN KEY (`entidad_id`) REFERENCES `entidades` (`id`),
  CONSTRAINT `FKbrq7a048uajrhqbhrmcq76diu` FOREIGN KEY (`tipo_servicio`) REFERENCES `tipo_servicios` (`id`),
  CONSTRAINT `FKo04hkoh4n31m4ricjdfr6dhmd` FOREIGN KEY (`establecimiento_id`) REFERENCES `establecimientos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,_binary '','elevador1',1,1,1),(2,_binary '','elevador2',1,1,1);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_incidentes`
--

DROP TABLE IF EXISTS `tipo_incidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_incidentes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_incidentes`
--

LOCK TABLES `tipo_incidentes` WRITE;
/*!40000 ALTER TABLE `tipo_incidentes` DISABLE KEYS */;
INSERT INTO `tipo_incidentes` VALUES (1,'Del bueno');
/*!40000 ALTER TABLE `tipo_incidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_localizaciones`
--

DROP TABLE IF EXISTS `tipo_localizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_localizaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_localizaciones`
--

LOCK TABLES `tipo_localizaciones` WRITE;
/*!40000 ALTER TABLE `tipo_localizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_localizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_miembros`
--

DROP TABLE IF EXISTS `tipo_miembros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_miembros` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_miembros`
--

LOCK TABLES `tipo_miembros` WRITE;
/*!40000 ALTER TABLE `tipo_miembros` DISABLE KEYS */;
INSERT INTO `tipo_miembros` VALUES (1,'observador'),(2,'administrador'),(3,'intereado');
/*!40000 ALTER TABLE `tipo_miembros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicios`
--

DROP TABLE IF EXISTS `tipo_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_servicios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicios`
--

LOCK TABLES `tipo_servicios` WRITE;
/*!40000 ALTER TABLE `tipo_servicios` DISABLE KEYS */;
INSERT INTO `tipo_servicios` VALUES (1,'medio de elevacion'),(2,'banios');
/*!40000 ALTER TABLE `tipo_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_entidad`
--

DROP TABLE IF EXISTS `tipos_entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_entidad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_entidad`
--

LOCK TABLES `tipos_entidad` WRITE;
/*!40000 ALTER TABLE `tipos_entidad` DISABLE KEYS */;
INSERT INTO `tipos_entidad` VALUES (1,'UNIVERSIDAD');
/*!40000 ALTER TABLE `tipos_entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `latitud` int NOT NULL,
  `longitud` int NOT NULL,
  `nombre_ubicacion` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (1,1,1,'lugano','DEPARTAMENTO');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre_ubicacion` varchar(255) DEFAULT NULL,
  `tipo` smallint DEFAULT NULL,
  `numero` varchar(255) NOT NULL,
  `ubicacion_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  KEY `FKlt65d4kpmnl34o5aeusmuh4hs` (`ubicacion_id`),
  CONSTRAINT `FKlt65d4kpmnl34o5aeusmuh4hs` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'example2@gmail.com','sdf sdf','$2a$10$ov1x0sr7CpTF5ePVIcvgheQhimd4Whv/63Inw/20kCNX0GSxLvinq',NULL,NULL,'',NULL),(2,'asdad@gmail.com','adsdas adss','$2a$10$ov1x0sr7CpTF5ePVIcvgheQhimd4Whv/63Inw/20kCNX0GSxLvinq',NULL,NULL,'',NULL),(3,'juanperez@gmail.com','Juan  Perez','$2a$10$NITAnZlhRJmbQk6/JN6Z7enPR5TmT55UHENOUyR.4c4mykwmN8s4K',NULL,NULL,'',NULL),(4,'example2qq@gmail.com','example+1@gmail.com example+1@gmail.com','$2a$2a$10$ov1x0sr7CpTF5ePVIcvgheQhimd4Whv/63Inw/20kCNX0GSxLvinq',NULL,NULL,'11213344456',NULL),(5,'example+2@gmail.com','example+2@gmail.com dos','$2a$10$kt28jy9CS27SxNcDwiFWr.yBsQArQzpeuRogFWKEprdjmVsWJW55e',NULL,NULL,'11213344456',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  KEY `FK2o0jvgh89lemvvo17cbqvdxaa` (`user_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-14  4:17:51

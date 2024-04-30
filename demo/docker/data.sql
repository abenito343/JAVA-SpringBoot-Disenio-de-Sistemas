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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidades`
--

LOCK TABLES `comunidades` WRITE;
/*!40000 ALTER TABLE `comunidades` DISABLE KEYS */;
INSERT INTO `comunidades` VALUES (1,'utnianos'),(2,'mcdonalds');
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
INSERT INTO `entidades` VALUES (1,'UTN',1);
/*!40000 ALTER TABLE `entidades` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientos`
--

LOCK TABLES `establecimientos` WRITE;
/*!40000 ALTER TABLE `establecimientos` DISABLE KEYS */;
INSERT INTO `establecimientos` VALUES (1,'utn - medrano',1),(2,'utn - lugano',2);
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
INSERT INTO `establecimientos_interesados` VALUES (1,1);
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
-- Table structure for table `incidentes`
--

DROP TABLE IF EXISTS `incidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidentes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hora_de_apertura` datetime(6) NOT NULL,
  `hora_de_cierre` datetime(6) DEFAULT NULL,
  `observaciones` varchar(255) NOT NULL,
  `comunidad_id` bigint NOT NULL,
  `servicio` bigint DEFAULT NULL,
  `tipo_incidente` bigint DEFAULT NULL,
  `solucion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd5vw8ggt4ewe9f696wet0i9i3` (`comunidad_id`),
  KEY `FKpdp26r60khcat0igq6rpdk8ob` (`servicio`),
  KEY `FK8krwwe5yoiwv0b66dqjxxbd73` (`tipo_incidente`),
  CONSTRAINT `FK8krwwe5yoiwv0b66dqjxxbd73` FOREIGN KEY (`tipo_incidente`) REFERENCES `tipo_incidentes` (`id`),
  CONSTRAINT `FKd5vw8ggt4ewe9f696wet0i9i3` FOREIGN KEY (`comunidad_id`) REFERENCES `comunidades` (`id`),
  CONSTRAINT `FKpdp26r60khcat0igq6rpdk8ob` FOREIGN KEY (`servicio`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidentes`
--

LOCK TABLES `incidentes` WRITE;
/*!40000 ALTER TABLE `incidentes` DISABLE KEYS */;
INSERT INTO `incidentes` VALUES (1,'2024-02-20 05:40:06.030000','2024-02-22 17:10:55.806000','asdad',1,1,1,NULL),(2,'2024-02-20 06:03:13.568000','2024-02-22 17:18:13.736000','asdad',1,1,1,NULL),(3,'2024-02-20 06:04:09.391000','2024-02-22 17:18:24.727000','asdad',1,1,1,NULL),(4,'2024-02-21 18:36:41.225000','2024-02-22 17:18:23.777000','asdad',1,1,1,NULL),(5,'2024-02-22 17:10:43.623000','2024-02-22 17:18:22.689000','asdad',1,1,1,NULL),(6,'2024-02-22 17:52:04.660000','2024-02-22 17:52:10.053000','asdad',1,1,1,NULL),(7,'2024-02-22 17:52:34.284000',NULL,'asdad',1,1,1,NULL);
/*!40000 ALTER TABLE `incidentes` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros`
--

LOCK TABLES `miembros` WRITE;
/*!40000 ALTER TABLE `miembros` DISABLE KEYS */;
INSERT INTO `miembros` VALUES (5,1,1,1),(6,2,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
  `establecimiento_id` bigint NOT NULL,
  `tipo_servicio` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo04hkoh4n31m4ricjdfr6dhmd` (`establecimiento_id`),
  KEY `FKbrq7a048uajrhqbhrmcq76diu` (`tipo_servicio`),
  CONSTRAINT `FKbrq7a048uajrhqbhrmcq76diu` FOREIGN KEY (`tipo_servicio`) REFERENCES `tipo_servicios` (`id`),
  CONSTRAINT `FKo04hkoh4n31m4ricjdfr6dhmd` FOREIGN KEY (`establecimiento_id`) REFERENCES `establecimientos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,_binary '','ascensor',1,1),(2,_binary '','escalera',1,2);
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
INSERT INTO `tipo_incidentes` VALUES (1,'complicado');
/*!40000 ALTER TABLE `tipo_incidentes` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_miembros`
--

LOCK TABLES `tipo_miembros` WRITE;
/*!40000 ALTER TABLE `tipo_miembros` DISABLE KEYS */;
INSERT INTO `tipo_miembros` VALUES (1,'normal');
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
INSERT INTO `tipo_servicios` VALUES (1,'ascensor'),(2,'escalera');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_entidad`
--

LOCK TABLES `tipos_entidad` WRITE;
/*!40000 ALTER TABLE `tipos_entidad` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (1,1,1,'lugano','DEPARTAMENTO'),(2,2,2,'medrano','DEPARTAMENTO');
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
  `numero` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `establecimiento_interes` bigint DEFAULT NULL,
  `ubicacion_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  KEY `FKj3egnmueyoxw43t8hdkeewyw8` (`establecimiento_interes`),
  KEY `FKlt65d4kpmnl34o5aeusmuh4hs` (`ubicacion_id`),
  CONSTRAINT `FKj3egnmueyoxw43t8hdkeewyw8` FOREIGN KEY (`establecimiento_interes`) REFERENCES `establecimientos` (`id`),
  CONSTRAINT `FKlt65d4kpmnl34o5aeusmuh4hs` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'example2@gmail.com','facundofranco2008+5@gmail.com facundofranco2008+5@gmail.com','+541121841407','$2a$10$zcZDe9T8NR2oRSoVxpdZ6.I2iqL48sO2boiNNwJZHtl.S1Tg5CaK2',NULL,NULL);
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
INSERT INTO `users_roles` VALUES (1,1);
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

-- Dump completed on 2024-02-24  5:07:26

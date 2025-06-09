-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: seremi
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `idActividad` int NOT NULL,
  `nombreActividad` varchar(150) DEFAULT NULL,
  `cantidadPreguntas` int DEFAULT NULL,
  PRIMARY KEY (`idActividad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividades_charlas`
--

DROP TABLE IF EXISTS `actividades_charlas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades_charlas` (
  `idCharla` int NOT NULL,
  `idActividadFK` int NOT NULL,
  PRIMARY KEY (`idCharla`,`idActividadFK`),
  KEY `idActividad_idx` (`idActividadFK`),
  CONSTRAINT `idActividadFK` FOREIGN KEY (`idActividadFK`) REFERENCES `actividades` (`idActividad`),
  CONSTRAINT `idCharla` FOREIGN KEY (`idCharla`) REFERENCES `charlas` (`idCharla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades_charlas`
--

LOCK TABLES `actividades_charlas` WRITE;
/*!40000 ALTER TABLE `actividades_charlas` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividades_charlas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alternativas`
--

DROP TABLE IF EXISTS `alternativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alternativas` (
  `alternativa` varchar(100) NOT NULL,
  `pregunta` varchar(100) NOT NULL,
  `esCorrecta` tinyint DEFAULT NULL,
  PRIMARY KEY (`alternativa`,`pregunta`),
  KEY `pregunta_idx` (`pregunta`),
  CONSTRAINT `pregunta` FOREIGN KEY (`pregunta`) REFERENCES `preguntas` (`pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternativas`
--

LOCK TABLES `alternativas` WRITE;
/*!40000 ALTER TABLE `alternativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `alternativas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charlas`
--

DROP TABLE IF EXISTS `charlas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charlas` (
  `idCharla` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `establecimiento` varchar(45) DEFAULT NULL,
  `region` varchar(60) DEFAULT NULL,
  `comuna` varchar(60) DEFAULT NULL,
  `curso` varchar(45) DEFAULT NULL,
  `asistencia` int DEFAULT NULL,
  `hombres` int DEFAULT NULL,
  `mujeres` int DEFAULT NULL,
  `temario` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`idCharla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charlas`
--

LOCK TABLES `charlas` WRITE;
/*!40000 ALTER TABLE `charlas` DISABLE KEYS */;
/*!40000 ALTER TABLE `charlas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oradores`
--

DROP TABLE IF EXISTS `oradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oradores` (
  `rut` varchar(12) NOT NULL,
  `FK_id_Charla` int NOT NULL,
  PRIMARY KEY (`rut`,`FK_id_Charla`),
  KEY `idCharla_idx` (`FK_id_Charla`),
  CONSTRAINT `FK_id_Charla` FOREIGN KEY (`FK_id_Charla`) REFERENCES `charlas` (`idCharla`),
  CONSTRAINT `rut` FOREIGN KEY (`rut`) REFERENCES `usuarios` (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oradores`
--

LOCK TABLES `oradores` WRITE;
/*!40000 ALTER TABLE `oradores` DISABLE KEYS */;
/*!40000 ALTER TABLE `oradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `pregunta` varchar(100) NOT NULL,
  `idActividad` int NOT NULL,
  PRIMARY KEY (`pregunta`,`idActividad`),
  KEY `idActividad_idx` (`idActividad`),
  CONSTRAINT `idActividad` FOREIGN KEY (`idActividad`) REFERENCES `actividades` (`idActividad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `rut` varchar(12) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `contrasenia` varchar(150) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `comuna` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `terminos` tinyint DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('12345678','john','Pérez','$2b$10$rTKdb/IAitSu.eDtXTuX5uspku2K4MVmvYkB4BkP4x/49AKiDZzH2','juan.perez@mail.com','los rios','Santiago','Calle Falsa 123',1,'usuario'),('20.669.996-5','pedro','Quito','$2b$10$yuCHhWwSBPyoNbkOHBxUQ.AebgYTeJ/sw4OatXwsX/6xBZznekNCq','estebanquito@gmail.com','Region de los Lagos','Puerto Montt','Calle Real 567',1,'admin');
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

-- Dump completed on 2025-06-09  1:58:26

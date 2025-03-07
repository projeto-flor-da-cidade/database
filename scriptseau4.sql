-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projetoseau
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `arquivos_fotos`
--

DROP TABLE IF EXISTS `arquivos_fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arquivos_fotos` (
  `seq_arq` int NOT NULL AUTO_INCREMENT,
  `seq_equi` int NOT NULL,
  `file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`seq_arq`),
  KEY `seq_equi` (`seq_equi`),
  CONSTRAINT `arquivos_fotos_ibfk_1` FOREIGN KEY (`seq_equi`) REFERENCES `equipamento` (`seq_equi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compoem`
--

DROP TABLE IF EXISTS `compoem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compoem` (
  `seq_par` int NOT NULL,
  `seq_tur` int NOT NULL,
  PRIMARY KEY (`seq_par`,`seq_tur`),
  KEY `seq_tur` (`seq_tur`),
  CONSTRAINT `compoem_ibfk_1` FOREIGN KEY (`seq_par`) REFERENCES `participantes` (`seq_par`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compoem_ibfk_2` FOREIGN KEY (`seq_tur`) REFERENCES `turma` (`seq_tur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `seq_curso` int NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(30) NOT NULL,
  `carga_hor` int NOT NULL,
  `ementa_cur` varchar(60) DEFAULT NULL,
  `observ` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`seq_curso`),
  CONSTRAINT `curso_chk_1` CHECK ((`carga_hor` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento` (
  `seq_equi` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `compl` varchar(255) DEFAULT NULL,
  `validacao` varchar(255) DEFAULT NULL,
  `dat_sol` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `observ` varchar(255) DEFAULT NULL,
  `qtd_bancas` int DEFAULT NULL,
  `dat_val` date DEFAULT NULL,
  `horario_abertura` time NOT NULL,
  `horario_fechamento` time NOT NULL,
  `qtd_visitas` int DEFAULT '0',
  `seq_tipo_equ` int NOT NULL,
  `seq_resp` int NOT NULL,
  `photo_local_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seq_equi`),
  KEY `seq_tipo_equ` (`seq_tipo_equ`),
  KEY `seq_resp` (`seq_resp`),
  CONSTRAINT `equipamento_ibfk_1` FOREIGN KEY (`seq_tipo_equ`) REFERENCES `tipo_equ` (`seq_tipo_equ`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equipamento_ibfk_2` FOREIGN KEY (`seq_resp`) REFERENCES `responsavel` (`seq_resp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equipamento_chk_1` CHECK ((`validacao` in (_utf8mb4'S',_utf8mb4'N'))),
  CONSTRAINT `equipamento_chk_2` CHECK ((`qtd_bancas` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interessados`
--

DROP TABLE IF EXISTS `interessados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interessados` (
  `seq_int` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `seq_orga` int NOT NULL,
  PRIMARY KEY (`seq_int`),
  KEY `seq_orga` (`seq_orga`),
  CONSTRAINT `interessados_ibfk_1` FOREIGN KEY (`seq_orga`) REFERENCES `organiza` (`seq_orga`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local` (
  `seq_loc` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `logradouro` varchar(60) NOT NULL,
  `numero` varchar(10) NOT NULL,
  PRIMARY KEY (`seq_loc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logresponsavel`
--

DROP TABLE IF EXISTS `logresponsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logresponsavel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seq_resp` int NOT NULL,
  `acao` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `detalhes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ocorrer`
--

DROP TABLE IF EXISTS `ocorrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocorrer` (
  `seq_loc` int NOT NULL,
  `seq_tur` int NOT NULL,
  PRIMARY KEY (`seq_loc`,`seq_tur`),
  KEY `seq_tur` (`seq_tur`),
  CONSTRAINT `ocorrer_ibfk_1` FOREIGN KEY (`seq_loc`) REFERENCES `local` (`seq_loc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ocorrer_ibfk_2` FOREIGN KEY (`seq_tur`) REFERENCES `turma` (`seq_tur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organiza`
--

DROP TABLE IF EXISTS `organiza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organiza` (
  `seq_orga` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`seq_orga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `participantes`
--

DROP TABLE IF EXISTS `participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantes` (
  `seq_par` int NOT NULL AUTO_INCREMENT,
  `conceito` varchar(10) DEFAULT NULL,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`seq_par`),
  CONSTRAINT `participantes_chk_1` CHECK ((`conceito` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'C',_utf8mb4'D',_utf8mb4'E')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patrocina`
--

DROP TABLE IF EXISTS `patrocina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrocina` (
  `seq_orga` int NOT NULL,
  `seq_equi` int NOT NULL,
  PRIMARY KEY (`seq_orga`,`seq_equi`),
  KEY `seq_equi` (`seq_equi`),
  CONSTRAINT `patrocina_ibfk_1` FOREIGN KEY (`seq_orga`) REFERENCES `organiza` (`seq_orga`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patrocina_ibfk_2` FOREIGN KEY (`seq_equi`) REFERENCES `equipamento` (`seq_equi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `querem`
--

DROP TABLE IF EXISTS `querem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `querem` (
  `seq_int` int NOT NULL,
  `seq_curso` int NOT NULL,
  PRIMARY KEY (`seq_int`,`seq_curso`),
  KEY `seq_curso` (`seq_curso`),
  CONSTRAINT `querem_ibfk_1` FOREIGN KEY (`seq_int`) REFERENCES `interessados` (`seq_int`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `querem_ibfk_2` FOREIGN KEY (`seq_curso`) REFERENCES `curso` (`seq_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `responsavel`
--

DROP TABLE IF EXISTS `responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsavel` (
  `seq_resp` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(60) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `documento` varchar(10) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seq_resp`),
  UNIQUE KEY `documento` (`documento`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico` (
  `seq_tec` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`seq_tec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_equ`
--

DROP TABLE IF EXISTS `tipo_equ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_equ` (
  `seq_tipo_equ` int NOT NULL AUTO_INCREMENT,
  `descr_tipo_equ` varchar(60) NOT NULL,
  PRIMARY KEY (`seq_tipo_equ`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `seq_tur` int NOT NULL AUTO_INCREMENT,
  `qtd_vag` int NOT NULL,
  `horario` time NOT NULL,
  `data_ini` date NOT NULL,
  `data_fin` date NOT NULL,
  `seq_curso` int NOT NULL,
  PRIMARY KEY (`seq_tur`),
  KEY `seq_curso` (`seq_curso`),
  CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`seq_curso`) REFERENCES `curso` (`seq_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `turma_chk_1` CHECK ((`qtd_vag` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cpf` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK7kqluf7wl0oxs7n90fpya03ss` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitas`
--

DROP TABLE IF EXISTS `visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitas` (
  `seq_vis` int NOT NULL AUTO_INCREMENT,
  `data_vis` datetime(6) NOT NULL,
  `observ` varchar(60) DEFAULT NULL,
  `seq_tec` int NOT NULL,
  `seq_equi` int NOT NULL,
  PRIMARY KEY (`seq_vis`),
  KEY `seq_tec` (`seq_tec`),
  KEY `seq_equi` (`seq_equi`),
  CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`seq_tec`) REFERENCES `tecnico` (`seq_tec`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visitas_ibfk_2` FOREIGN KEY (`seq_equi`) REFERENCES `equipamento` (`seq_equi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 10:24:53

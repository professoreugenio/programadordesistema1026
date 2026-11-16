-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: escola_bd
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `alunos_tb`
--

DROP TABLE IF EXISTS `alunos_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos_tb` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `rg` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL,
  PRIMARY KEY (`id_aluno`),
  UNIQUE KEY `rg` (`rg`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos_tb`
--

LOCK TABLES `alunos_tb` WRITE;
/*!40000 ALTER TABLE `alunos_tb` DISABLE KEYS */;
INSERT INTO `alunos_tb` VALUES (1,'Eugênio Márcio','1971-03-07','100000000009','100000000001','Quixeramobim','2026-11-11 18:54:23',0),(2,'João Pedro Silva','2002-03-15','RG100001','CPF100001','Fortaleza','2026-11-11 19:15:38',1),(3,'Maria Eduarda Santos','2001-07-22','RG100002','CPF100002','Maracanaú','2026-11-11 19:15:38',1),(4,'Carlos Henrique Lima','2000-11-10','RG100003','CPF100003','Caucaia','2026-11-11 19:15:38',1),(5,'Ana Paula Oliveira','2003-01-05','RG100004','CPF100004','Pacatuba','2026-11-11 19:15:38',1),(6,'Pedro Lucas Ferreira','1999-09-18','RG100005','CPF100005','Fortaleza','2026-11-11 19:15:38',1),(7,'Juliana Costa','2002-12-30','RG100006','CPF100006','Maranguape','2026-11-11 19:15:38',1),(8,'Rafael Almeida','2001-05-14','RG100007','CPF100007','Maracanaú','2026-11-11 19:15:38',0),(9,'Fernanda Rocha','2004-08-09','RG100008','CPF100008','Fortaleza','2026-11-11 19:15:38',1),(10,'Lucas Gabriel Martins','2000-02-25','RG100009','CPF100009','Caucaia','2026-11-11 19:15:38',1),(11,'Camila Rodrigues','2003-06-17','RG100010','CPF100010','Pacatuba','2026-11-11 19:15:38',0),(12,'Bruno Carvalho','1998-10-03','RG100011','CPF100011','Fortaleza','2026-11-11 19:15:38',1),(13,'Patricia Gomes','2002-04-28','RG100012','CPF100012','Maracanaú','2026-11-11 19:15:38',1),(14,'André Luiz Ribeiro','2001-09-12','RG100013','CPF100013','Maranguape','2026-11-11 19:15:38',1),(15,'Beatriz Fernandes','2004-11-21','RG100014','CPF100014','Fortaleza','2026-11-11 19:15:38',0),(16,'Diego Nascimento','1999-07-07','RG100015','CPF100015','Caucaia','2026-11-11 19:15:38',1),(17,'Larissa Monteiro','2003-03-19','RG100016','CPF100016','Maracanaú','2026-11-11 19:15:38',1),(18,'Felipe Barbosa','2000-12-02','RG100017','CPF100017','Pacatuba','2026-11-11 19:15:38',1),(19,'Amanda Pereira','2002-08-16','RG100018','CPF100018','Fortaleza','2026-11-11 19:15:38',0),(20,'Gustavo Moreira','2001-01-24','RG100019','CPF100019','Maranguape','2026-11-11 19:15:38',1),(21,'Renata Cardoso','2003-05-11','RG100020','CPF100020','Maracanaú','2026-11-11 19:15:38',1);
/*!40000 ALTER TABLE `alunos_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-16 15:53:51

-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para cmas
CREATE DATABASE IF NOT EXISTS `cmas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cmas`;

-- Copiando estrutura para tabela cmas.cadastro_usuarios
CREATE TABLE IF NOT EXISTS `cadastro_usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `nis` varchar(11) DEFAULT NULL,
  `datanasc` date DEFAULT NULL,
  `servicos_programas` blob,
  `endereco` varchar(180) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `categoria` char(1) DEFAULT NULL,
  `doc_rg` varchar(255) DEFAULT NULL,
  `doc_cpf` varchar(255) DEFAULT NULL,
  `doc_nis` varchar(255) DEFAULT NULL,
  `doc_folha` varchar(255) DEFAULT NULL,
  `doc_declaracao_suas` varchar(255) DEFAULT NULL,
  `apresentacao` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.cadastro_usuarios: ~2 rows (aproximadamente)

-- Copiando estrutura para tabela cmas.organizacao
CREATE TABLE IF NOT EXISTS `organizacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_osc` varchar(150) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `numero_cmas` varchar(2) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `fundacao` date DEFAULT NULL,
  `endereco_osc` varchar(150) DEFAULT NULL,
  `nome_representante` varchar(150) DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `doc_rg` varchar(255) DEFAULT NULL,
  `doc_cpf` varchar(255) DEFAULT NULL,
  `doc_comprovante` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `apresentacao` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.organizacao: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela cmas.trabalhador_suas
CREATE TABLE IF NOT EXISTS `trabalhador_suas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `cargo` varchar(150) DEFAULT NULL,
  `tempo_prestacao` varchar(20) DEFAULT NULL,
  `endereco_res` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nome_org` varchar(150) DEFAULT NULL,
  `servicos_programas` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `endereco_instituicao` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `doc_rg` varchar(255) DEFAULT NULL,
  `doc_cpf` varchar(255) DEFAULT NULL,
  `doc_declaracao` varchar(255) DEFAULT NULL,
  `apresentacao` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.trabalhador_suas: ~2 rows (aproximadamente)

-- Copiando estrutura para tabela cmas.votos_osc
CREATE TABLE IF NOT EXISTS `votos_osc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_eleitor` int DEFAULT NULL,
  `id_candidato` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.votos_osc: ~0 rows (aproximadamente)
INSERT INTO `votos_osc` (`id`, `id_eleitor`, `id_candidato`, `data`, `hora`) VALUES
	(7, 7, 7, '2025-03-25', '19:30:00'),
	(8, 7, 6, '2025-03-25', '19:30:00');

-- Copiando estrutura para tabela cmas.votos_suas
CREATE TABLE IF NOT EXISTS `votos_suas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_eleitor` int DEFAULT NULL,
  `id_candidato` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.votos_suas: ~0 rows (aproximadamente)
INSERT INTO `votos_suas` (`id`, `id_eleitor`, `id_candidato`, `data`, `hora`) VALUES
	(3, 9, 8, '2025-03-25', '19:32:00'),
	(4, 9, 9, '2025-03-25', '19:32:00');

-- Copiando estrutura para tabela cmas.votos_usuarios
CREATE TABLE IF NOT EXISTS `votos_usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_eleitor` int DEFAULT NULL,
  `id_candidato` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.votos_usuarios: ~2 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.cadastro_usuarios: ~2 rows (aproximadamente)
INSERT INTO `cadastro_usuarios` (`id`, `nome`, `tipo`, `foto`, `rg`, `cpf`, `nis`, `datanasc`, `servicos_programas`, `endereco`, `telefone`, `email`, `categoria`, `doc_rg`, `doc_cpf`, `doc_nis`, `doc_folha`, `doc_declaracao_suas`) VALUES
	(10, 'Glaison Queiroz', 'E', 'foto_f.jpg1054.jpg', 'm4662097', '69551022653', '23', '1969-10-26', _binary 0x746573746520646f2070726f6772616d61, 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'teste@gmail.com', NULL, 'Glaison Queiroz_documentos/doc1.txt', 'Glaison Queiroz_documentos/doc1 - Copia.txt', 'Glaison Queiroz_documentos/doc1 - Copia (3).txt', 'Glaison Queiroz_documentos/doc1 - Copia (2).txt', NULL),
	(11, 'Amauri de Souza', 'C', 'Design sem nome (12).png9682.png', '4353455', '38468492000', '12', '2001-02-21', _binary 0x74657374652032, 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'arthurgomesosg@gmail.com', NULL, 'Amauri de Souza_documentos/doc1.txt', 'Amauri de Souza_documentos/doc1 - Copia (2).txt', 'Amauri de Souza_documentos/doc1 - Copia (3).txt', 'Amauri de Souza_documentos/doc1 - Copia.txt', NULL);

-- Copiando estrutura para tabela cmas.organizacao
CREATE TABLE IF NOT EXISTS `organizacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_osc` varchar(150) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.trabalhador_suas: ~1 rows (aproximadamente)
INSERT INTO `trabalhador_suas` (`id`, `nome`, `rg`, `tipo`, `foto`, `cpf`, `cargo`, `tempo_prestacao`, `endereco_res`, `nome_org`, `servicos_programas`, `endereco_instituicao`, `telefone`, `email`, `doc_rg`, `doc_cpf`, `doc_declaracao`) VALUES
	(1, 'Glaison Queiroz', 'm4662097', 'E', '9A7E429F-2ABD-44B8-A0A3-941FA210559E.jpeg1036.jpeg', 'Auditor', 'APAE', '69551022653', '', '2 Anos e nove meses', 'teste', 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'arthurgomesosg@gmail.com', 'Glaison Queiroz_documentos/doc1 - Copia (2).txt', 'Glaison Queiroz_documentos/doc1 - Copia (3).txt', 'Glaison Queiroz_documentos/doc1 - Copia.txt');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

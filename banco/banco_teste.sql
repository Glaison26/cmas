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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.cadastro_usuarios: ~6 rows (aproximadamente)
INSERT INTO `cadastro_usuarios` (`id`, `nome`, `tipo`, `foto`, `rg`, `cpf`, `nis`, `datanasc`, `servicos_programas`, `endereco`, `telefone`, `email`, `categoria`, `doc_rg`, `doc_cpf`, `doc_nis`, `doc_folha`, `doc_declaracao_suas`, `apresentacao`) VALUES
	(5, 'Glaison Queiroz', 'E', '', 'm4662097', '69551022653', '23', '2025-03-05', _binary 0x7465737465, 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'arthurgomesosg@gmail.com', NULL, '', '', '', '', NULL, _binary ''),
	(6, 'Thiago Victor Cardoso', 'C', '8A8B50F2-C54B-427E-BA6C-4BCC40897510.jpeg3313.jpeg', 'm4662097', '60327151323', '23', '2025-03-06', _binary 0x7465737465, 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'arthurgomesosg@gmail.com', NULL, 'documentos/Thiago Victor Cardoso_7.jpg9482.jpg', 'documentos/Thiago Victor Cardoso_7.jpg9482.jpg', 'documentos/Thiago Victor Cardoso_7.jpg9482.jpg', 'documentos/Thiago Victor Cardoso_7.jpg9482.jpg', NULL, _binary 0x536f75206f2054686961676f),
	(7, 'Ian Henry Silveira', 'C', '194126340_10216029620773443_1203650921434787519_n.jpg9424.jpg', '4353455', '53654674429', '12', '2025-03-06', _binary 0x7465737465, 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'teste@gmail.com', NULL, 'documentos/Ian Henry Silveira_7.jpg9482.jpg', 'documentos/Ian Henry Silveira_7.jpg9482.jpg', 'documentos/Ian Henry Silveira_7.jpg9482.jpg', 'documentos/Ian Henry Silveira_7.jpg9482.jpg', NULL, _binary 0x657520736f752069616e),
	(8, 'Elias Osvaldo da Costa', 'E', '', '4353455', '82429365286', '4', '2025-03-04', _binary 0x64666764, 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'arthurgomesosg@gmail.com', NULL, '', '', '', '', NULL, _binary ''),
	(9, 'Sueli Tatiane Laura Gomes', 'C', '9A7E429F-2ABD-44B8-A0A3-941FA210559E.jpeg1036.jpeg', '43.045.381-4', '61157016782', '12', '2024-12-05', _binary 0x7465737465, 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'arthurgomesosg@gmail.com', NULL, 'documentos/Sueli Tatiane Laura Gomes_7.jpg9482.jpg', 'documentos/Sueli Tatiane Laura Gomes_7.jpg9482.jpg', 'documentos/Sueli Tatiane Laura Gomes_7.jpg9482.jpg', 'documentos/Sueli Tatiane Laura Gomes_7.jpg9482.jpg', NULL, _binary 0x657520736f752061207375656c79),
	(10, 'Aline Kamilly Caldeira', 'E', '', '4353455', '34875083386', '04', '2025-03-05', _binary 0x73646664, 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'teste@gmail.com', NULL, '', '', '', '', NULL, _binary '');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.organizacao: ~1 rows (aproximadamente)
INSERT INTO `organizacao` (`id`, `nome_osc`, `tipo`, `numero_cmas`, `cnpj`, `fundacao`, `endereco_osc`, `nome_representante`, `rg`, `cpf`, `endereco`, `telefone`, `email`, `doc_rg`, `doc_cpf`, `doc_comprovante`, `foto`, `logo`, `apresentacao`) VALUES
	(8, 'Aline e Manoel Eletrônica Ltda', 'E', '33', '01088710000188', '2025-03-05', 'rua teste', 'Antonio da Silva', 'm4662097', '69551022653', 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'arthurgomesosg@gmail.com', '', '', '', '', '', _binary '');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.trabalhador_suas: ~3 rows (aproximadamente)
INSERT INTO `trabalhador_suas` (`id`, `nome`, `rg`, `tipo`, `foto`, `cpf`, `cargo`, `tempo_prestacao`, `endereco_res`, `nome_org`, `servicos_programas`, `endereco_instituicao`, `telefone`, `email`, `doc_rg`, `doc_cpf`, `doc_declaracao`, `apresentacao`) VALUES
	(10, 'Silvia Daniele Aparecida Morais', '15259331', 'E', '', '09906798610', 'Assistente social ', '5 anos', 'RUA MÁRIO MACHADO, 215, bloco 2, apto 504, Fogo apagou', 'Casa dos direitos humanos ', 'Secretaria executiva ', 'Rua presidente Juscelino Kubitschek, 185, siderúrgica, Sabará ', '(31) 3674-1818', 'casadosconselhos@sabara.mg.gov.br', '', '', '', _binary ''),
	(11, 'Milena Olivia Drumond', '4353455', 'C', '20210904_204130.jpg3343.jpg', '73781842924', 'Auditor', '2 anos', 'Rua das Flores 300 sabara', 'APAE', 'sdfsdf', 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'arthurgomesosg@gmail.com', 'documentos/Milena Olivia Drumond_7.jpg9482.jpg', 'documentos/Milena Olivia Drumond_7.jpg9482.jpg', 'documentos/Milena Olivia Drumond_7.jpg9482.jpg', _binary 0x657520736f75206d696c656e61),
	(12, 'Yuri Victor Joaquim Alves', 'm4662097', 'C', 'A144EBB4-BF95-4DD8-92F2-67C9E25BC058.png5285.png', '45004793689', 'Auditor', '2 anos', 'Rua das Flores 300 sabara', 'APAE', 'teste', 'Rua da Intendencia 316 centro sabara', '(31) 4654-6546', 'arthurgomesosg@gmail.com', 'documentos/Yuri Victor Joaquim Alves_7.jpg9482.jpg', 'documentos/Yuri Victor Joaquim Alves_7.jpg9482.jpg', 'documentos/Yuri Victor Joaquim Alves_7.jpg9482.jpg', _binary 0x657520736f752079757269);

-- Copiando estrutura para tabela cmas.votos_osc
CREATE TABLE IF NOT EXISTS `votos_osc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_eleitor` int DEFAULT NULL,
  `id_candidato` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.votos_osc: ~2 rows (aproximadamente)
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

-- Copiando dados para a tabela cmas.votos_suas: ~2 rows (aproximadamente)
INSERT INTO `votos_suas` (`id`, `id_eleitor`, `id_candidato`, `data`, `hora`) VALUES
	(3, 9, 8, '2025-03-25', '19:32:00'),
	(4, 9, 9, '2025-03-25', '19:32:00'),
	(5, 10, 11, '2025-03-26', '15:02:00'),
	(6, 10, 12, '2025-03-26', '15:02:00');

-- Copiando estrutura para tabela cmas.votos_usuarios
CREATE TABLE IF NOT EXISTS `votos_usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_eleitor` int DEFAULT NULL,
  `id_candidato` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.votos_usuarios: ~6 rows (aproximadamente)
INSERT INTO `votos_usuarios` (`id`, `id_eleitor`, `id_candidato`, `data`, `hora`) VALUES
	(5, 5, 7, '2025-03-26', '14:21:00'),
	(6, 5, 6, '2025-03-26', '14:21:00'),
	(7, 8, 7, '2025-03-26', '14:24:00'),
	(8, 8, 6, '2025-03-26', '14:24:00'),
	(9, 10, 6, '2025-03-26', '14:32:00'),
	(10, 10, 9, '2025-03-26', '14:32:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

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
  `doc_declaracao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apresentacao` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.cadastro_usuarios: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.organizacao: ~8 rows (aproximadamente)
INSERT INTO `organizacao` (`id`, `nome_osc`, `tipo`, `numero_cmas`, `cnpj`, `fundacao`, `endereco_osc`, `nome_representante`, `rg`, `cpf`, `endereco`, `telefone`, `email`, `doc_rg`, `doc_cpf`, `doc_comprovante`, `foto`, `logo`, `apresentacao`) VALUES
	(11, 'GRUPO MELHOR IDADE SERENIDADE', 'E', '01', '09426729000107', '2008-02-20', 'RUA SERRA DO CARAÇA, 88 - B.MORADA DA SERRA-SABARÁ', 'GLAUCIA DE FIGUEIREDO PEREIRA', '15642313649', '15642313649', 'Rua América', '(31) 9918-3984', 'glauciafigueiredo8@gmail.com', 'documentos/GRUPO MELHOR IDADE SERENIDADE_identidade Glaucia.pdf', '', '', '', '', _binary ''),
	(12, 'ASSOCIAÇÃO SÁ CHICA', 'C', '23', '23418017000169', '2007-10-15', 'RUA URIS DA ASSUNÇÃO Nº178 RAVENA SABARA MG', 'MERCES APARECIDA DOS SANTOS', 'MG 2391974', '53356764691', 'RUA JATOBÁ 94 ALTO DO CABRAL SABARÁ MG', '(31) 98769-4519', 'mercesaps@gmail.com', 'documentos/ASSOCIAÇÃO SÁ CHICA_id merces.pdf', 'documentos/ASSOCIAÇÃO SÁ CHICA_id merces.pdf', 'documentos/ASSOCIAÇÃO SÁ CHICA_cnpj.pdf', 'foto merces.jpg', 'logo.png', _binary ''),
	(13, 'Instituto José Geraldo Gonçalves', 'E', '00', '97491427000171', '1985-05-25', 'Rua José Magalhães Barbosa, 301', 'Adriana Paula F. Rodrigues', 'MG 12023493', '05044909661', 'Av. Prefeito Serafim Motta Barros, 150 - Centro', '(31) 3671-5461', 'adriana@lardemariasabara.com.br', 'documentos/Instituto José Geraldo Gonçalves_RG Adriana PDF.pdf', '', '', '', '', _binary ''),
	(14, 'Associação Projeto Vida', 'E', '07', '11263201000106', '2009-08-10', 'Rua do Gaia 320 Bairro Siderurgica Sabara', 'Guilherme Aguiar Eloy', 'MG14063889', '11844318680', 'Rua do Gaia 320 Bairro Siderurgica Sabara', '(31) 3674-1404', 'associacaoprojetovida@hotmail.com', 'documentos/Associação Projeto Vida_Doc Guilherme.pdf', '', '', '', '', _binary ''),
	(15, 'ASSOC BENEF B RETIRO E NEGRO ALVORADA N VISTA N ST INES', 'C', '38', '21854377000188', '1978-06-18', 'Rua Liberdade,216,Alvorada,Sabará', 'Jonathan Junio Marcelino Felicio', '14283952', '07169552612', 'Rua Portugal,625,Nações Unidas,Sabará', '(31) 98258-4072', 'abranes.org@gmail.com', 'documentos/ASSOC BENEF B RETIRO E NEGRO ALVORADA N VISTA N ST INES_CNH-e.pdf (2).pdf', 'documentos/ASSOC BENEF B RETIRO E NEGRO ALVORADA N VISTA N ST INES_CNH-e.pdf (2).pdf', 'documentos/ASSOC BENEF B RETIRO E NEGRO ALVORADA N VISTA N ST INES_Comprovante de Inscrição e de Situação Cadastral.pdf', 'IMG_7661.JPG', 'IMG-20240605-WA0003.jpg', _binary 0x41204173736f636961c3a7c3a36f2042656e65666963656e746520646520426f6d2052657469726f2c2052696f204e6567726f2c20416c766f726164612c204e6f76612056697374612065204e6f766f2053616e746120496ec3aa7320e2809320414252414ec38a532c2066756e6461646120656d203138206465206a756e686f20646520313937382c20c3a920756d6120656e74696461646520636976696c2073656d2066696e73206c756372617469766f732c207265636f6e68656369646120636f6d6f206465207574696c69646164652070c3ba626c69636120657374616475616c20284c6569206ec2ba20373933372f3831292065206d756e69636970616c20284c6569206ec2ba203136382f3833292c207265676973747261646120736f62206f20434e504a2032312e3835342e3337372f303030312d38382e0d0a0d0a5365752074726162616c686f20c3a920766f6c7461646f207061726120612070726f6d6fc3a7c3a36f206461206369646164616e6961206520696e636c7573c3a36f20736f6369616c2c20636f6d20666f636f20656d3a0d0a0d0a436f6d6261746520c3a020666f6d652c20706f6272657a6120652070726f6d6fc3a7c3a36f206461206d6f7261646961206469676e613b0d0a0d0a50726f7465c3a7c3a36f2065206174656e64696d656e746f206120637269616ec3a761732c2061646f6c657363656e7465732c2069646f736f7320652066616dc3ad6c69617320656d2076756c6e65726162696c69646164653b0d0a0d0a41c3a7c3b56573206465207361c3ba64652070726576656e74697661206520617373697374656e6369616c3b0d0a0d0a41706f696f206120706573736f617320636f6d20646566696369c3aa6e636961206520c3a02074657263656972612069646164653b0d0a0d0a446573656e766f6c76696d656e746f2064652070726f6a65746f7320656475636163696f6e6169732c2063756c7475726169732c206573706f727469766f732065206465206c617a65723b0d0a0d0a4361706163697461c3a7c3a36f2070726f66697373696f6e616c2c2067657261c3a7c3a36f20646520656d707265676f20652072656e64613b0d0a0d0a50726f6d6fc3a7c3a36f2064612073757374656e746162696c69646164652065207072657365727661c3a7c3a36f20616d6269656e74616c3b0d0a0d0a52656976696e64696361c3a7c3b5657320656d20c3a172656173206465207472616e73706f7274652065207365677572616ec3a7613b0d0a0d0a41746976696461646573206465207075626c696369646164652c206576656e746f73206520636f6dc3a97263696f20706172612061706f696f20616f732070726f6a65746f7320736f63696169732e0d0a0d0a4120414252414ec38a53206174756120646520666f726d6120696e7465677261646120636f6d206f20706f6465722070c3ba626c69636f206520706172636569726f7320646f20746572636569726f207365746f722c2073656d7072652062757363616e646f206f20646573656e766f6c76696d656e746f2068756d616e6f2c20736f6369616c20652065636f6ec3b46d69636f2064617320636f6d756e696461646573206174656e64696461732e),
	(16, 'ASSOCIAÇÃO FUNDAMENTAL CIDADE FELIZ ', 'E', '08', '06093741000140', '2001-11-15', 'RUA MARIANA, 3001', 'GILMARA ROSA DE AVELAR', 'MG8925330', '02934218627', 'RUA MARIANA, 3001', '(31) 3607-2321', 'sabara.casaazul@gmail.com', 'documentos/ASSOCIAÇÃO FUNDAMENTAL CIDADE FELIZ _2022-12-01 13-12.pdf', '', '', '', '', _binary ''),
	(17, 'Ascomvilas', 'C', '12', '19702851000104', '1978-05-02', 'Rua Abaeté,271,General Carneiro', 'Alexandre Barros de Souza', '3816029', '60932198600', 'Rua Grão Mongol,102, General Carneiro', '(31) 3675-3021', 'alexandrebarroscvt@outlook.com', 'documentos/Ascomvilas_WhatsApp Image 2025-05-09 at 14.20.59.jpeg', 'documentos/Ascomvilas_', 'documentos/Ascomvilas_', 'IMG_20250128_145647_623.webp', '', _binary ''),
	(18, 'centro social vem com a gente', 'C', '35', '36282594000118', '2019-02-11', 'RUA MINAS NOVA 240', 'DANIELLE NERY SANTOS SILVA', '14583860', '07840044638', 'RUA MINAS NOVA 714', '(31) 3191-6160', 'ADM@INSTITUTOAVAG.COM.BR', 'documentos/centro social vem com a gente_CNH PRESIDENTE.pdf', 'documentos/centro social vem com a gente_CNH PRESIDENTE.pdf', 'documentos/centro social vem com a gente_CARTÃO CNPJ.pdf', 'IMG_0573.jpeg', 'IMG_0573.jpeg', _binary '');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.trabalhador_suas: ~22 rows (aproximadamente)
INSERT INTO `trabalhador_suas` (`id`, `nome`, `rg`, `tipo`, `foto`, `cpf`, `cargo`, `tempo_prestacao`, `endereco_res`, `nome_org`, `servicos_programas`, `endereco_instituicao`, `telefone`, `email`, `doc_rg`, `doc_cpf`, `doc_declaracao`, `apresentacao`) VALUES
	(13, 'BLENDALI DE OLIVEIRA DA SILVA DE JESUS', 'MG 2552084', 'E', '', '63589745649', 'MONITORA DE PROJETO ', '01/08/2022', 'RUA HELIODORA, 347', 'ASSOCIAÇÃO FUNDAMENTAL CIDADE FELIZ ', 'PROJETO DO IDOSO - VIDA ATIVA NA TERCEIRA IDADE', 'RUA MARIANA, 3001', '(31) 3607-2321', 'sabara.casaazul@gmail.com', 'documentos/BLENDALI DE OLIVEIRA DA SILVA DE JESUS_IDENTIDADE BLENDA LI.pdf', '', 'documentos/BLENDALI DE OLIVEIRA DA SILVA DE JESUS_INSCRIÇÃO CMAS BLENDALI.pdf', _binary ''),
	(14, 'DEBORA RHEUEL SILVEIRA RODRIGUES', 'MG 23.240.637', 'E', '', '15457128679', 'APOIO ADMINISTRATIVO ', '30/06/2024', 'RUA UBERLANDIA, 146 BAIRRO SAO JOSE ', 'ASSOCIAÇÃO FUNDAMENTAL CIDADE FELIZ ', 'PROJETO DO IDOSO - VIDA ATIVA NA TERCEIRA IDADE E SCFV ', 'RUA MARIANA, 3001', '(31) 3607-2321', 'sabara.casaazul@gmail.com', 'documentos/DEBORA RHEUEL SILVEIRA RODRIGUES_IDENTIDADE DEBORA RHEUEL.pdf', '', 'documentos/DEBORA RHEUEL SILVEIRA RODRIGUES_INSCRIÇÃO CMAS DEBORA.pdf', _binary ''),
	(15, 'FLAVIA RAFAELA GOMES GODDARD', 'MG 11706226', 'E', '', '05047054667', 'COORDENADOR VOL.', '18/09/2019', 'RUA ESPANHA, 486 NACOES UNIDAS SABARA', 'ASSOCIAÇÃO FUNDAMENTAL CIDADE FELIZ ', 'PROJETO DO IDOSO - VIDA ATIVA NA TERCEIRA IDADE, SCFV, CEGONHA E TERMO DE FOMENTO ESTADUAL.  ', 'RUA MARIANA, 3001', '(31) 3607-2321', 'sabara.casaazul@gmail.com', 'documentos/FLAVIA RAFAELA GOMES GODDARD_CNH FLAVIA RAFAELA.pdf', '', 'documentos/FLAVIA RAFAELA GOMES GODDARD_INSCRIÇÃO CMAS FLAVIA.pdf', _binary ''),
	(16, 'ROBERTO DOS SANTOS PIMENTEL', '0879890509', 'E', '', '01863966510', 'GERENTE', '05 MESES', 'RUA DESCALVADO 184S', 'SECRETARIA MUNICIPAL DE DESENVOLVIMENTO SOCIAL', 'Gabinete do Secretário de Desenvolvimento Social\r\nCadastro Único\r\nBanco de A', 'Rua Comendador Viana, 119 Centro', '(31) 3672-7719', 'desenvolvimentosocial@sabara.mg.gov.br', 'documentos/ROBERTO DOS SANTOS PIMENTEL_roberto doc.pdf', '', 'documentos/ROBERTO DOS SANTOS PIMENTEL_roberto insc_0001.pdf', _binary ''),
	(17, 'teste', 'teste', 'C', '', '10978750675', 'teste', 'teste', 'teste', 'teste', 'teste', 'teste', '(33) 3333-3333', 'suporte@sabara.mg.gov.br', 'documentos/teste_errata_edital_cmas_01.2025publicar_assinado.pdf', 'documentos/teste_errata_edital_cmas_01.2025publicar_assinado.pdf', 'documentos/teste_errata_edital_cmas_01.2025publicar_assinado.pdf', _binary 0x7465737465),
	(18, 'CHRISTIANE GOMES MONTEIRO', '14195445', 'C', 'WhatsApp Image 2025-05-09 at 09.38.18.jpeg', '06982299678', 'ASSISTENTE SOCIAL', '17 MESES', 'RUA ATENAS, 284 - ANA LUCUA', 'SECRETARIA MUNICIPAL DE DESENVOLVIMENTO SOCIAL', 'GERENCIA DE AÇÕES SOCIAIS - ALTA COMPLEXIDADE', 'Rua Comendador Viana, 119 Centro', '(31) 3672-7719', 'gerencia.social@sabara.mg.gov.br', 'documentos/CHRISTIANE GOMES MONTEIRO_CNH-e.pdf.pdf', 'documentos/CHRISTIANE GOMES MONTEIRO_CNH-e.pdf.pdf', 'documentos/CHRISTIANE GOMES MONTEIRO_chris insc_0001.pdf', _binary 0x425553434f20434f4e53545255495220434f4e4649414e4341204520434f4c41424f5241c387c3834f205041524120464f5254414c454345522056494e43554c4f53204520425553434152204120444546455341204520412020474152414e544941204445204449524549544f5320444f53205553554152494f5320444120504f4c495449434120444520415353495354454e43494120534f4349414c),
	(19, 'Letícia Maria Machado', '738040', 'E', '', '14394987172', 'Assistente Social', '11 anos', 'Rua Raimundo Agdo Ferreira, 227, Pompéu, Sabará', 'Secretaria Municipal de Desenvolvimento Social', 'Equipe de Gestão do SUAS', 'Rua Comendador Vianna, 119, Centro, Sabará', '(31) 3671-1816', 'monitoramentoeavaliacao@sabara.mg.gov.br', 'documentos/Letícia Maria Machado_Leticia Machado CI e CPF.pdf', '', 'documentos/Letícia Maria Machado_leticia insc_0001.pdf', _binary ''),
	(20, 'Moisés Batista Sacramento', 'MG20784346', 'E', '', '14355046664', 'Oficial Administrativo', '5 meses', 'Rua Ernesto Tognolo, 95, Pousada Santo Antônio, Belo Horizonte/MG', 'Secretaria Municipal de Desenvolvimento Social', 'Proteção Básica', 'Rua Comendador Viana, 119, Centro, Sabará/MG', '(31) 3671-1816', 'protecaobasica@sabara.mg.gov.br', 'documentos/Moisés Batista Sacramento_RG - REQUERENTE Moisés.pdf', '', 'documentos/Moisés Batista Sacramento_Moises.pdf', _binary ''),
	(21, 'Luciane Soares de Miranda Gomes Silva', '13238298', 'E', '', '07580093642', 'Gerente de Ações Sociais/Comissionado.', '05 meses', 'Rua Pau Brasil, 21, Mangabeiras, Sabará.', 'Prefeitura Municipal de Sabará/Secretaria Municipal de Desenvolvimento Social', '', 'Rua Comendador Viana, 119, Centro, Sabará.', '(31) 98822-3871', 'lusoaresgomes@gmail.com', 'documentos/Luciane Soares de Miranda Gomes Silva_CNH Digital.pdf', '', 'documentos/Luciane Soares de Miranda Gomes Silva_Lu.pdf', _binary ''),
	(22, 'VALERIA LOURENÇO OLIVEIRA', '11297139', 'E', '', '04198110603', 'AUXILIAR GESTÃO SUAS', '4 ANOS', 'RUA BELA VISTA,40 - BAIRRO MORRO DA CRUZ', 'GOVERNAMENTAL', 'PROTEÇÃO BÁSICA', 'COMENDADOR VIANA ,319', '(31) 3671-1816', 'protecaobasica@sabaramg.gov.br', 'documentos/VALERIA LOURENÇO OLIVEIRA_valeria.pdf', '', 'documentos/VALERIA LOURENÇO OLIVEIRA_leticia insc_0001-1.pdf', _binary ''),
	(23, 'ROSANGELA MARIA DE OLIVEIRA', '1240996', 'E', '', '34447016672', 'ENTREVISTADORA SOCIAL CADASTRO UNICO', '03 ANOS', 'Largo Nossa Senhora do Ó,  96 - Siderurgica', 'SECRETARIA MUNICIPAL DE DESENVOLVIMENTO SOCIAL', 'ENTTREVISTADORA SOCIAL CADASTRO UNICO PARA PROGRAMAS SOCIAIS DO GOVERNO FEDERAL', 'Rua Comendador Viana, 119 Centro', '(31) 3672-7753', 'bolsa.familia@sabara.mg.gov.br', 'documentos/ROSANGELA MARIA DE OLIVEIRA_Rosangela.pdf', '', 'documentos/ROSANGELA MARIA DE OLIVEIRA_rosangela_0001.pdf', _binary ''),
	(24, 'FABIANA CARLA MARCAL', '44542444', 'E', '', '05586595605', 'ENTREVISTADORA SOCIAL CADASTRO UNICO', '10 anos', 'rua portugal 625 bloco 3 apt 101', 'SECRETARIA MUNICIPAL DE DESENVOLVIMENTO SOCIAL', 'ENTREVISTADORA SOCIAL', 'Rua Comendador Viana, 119 Centro', '(31) 99616-8232', 'fabianacarlamarcal@hotmail.com', 'documentos/FABIANA CARLA MARCAL_fabiana 01.pdf', '', 'documentos/FABIANA CARLA MARCAL_fabiana2.pdf', _binary ''),
	(25, 'Raquel Conrado Ventura', 'M8060710', 'C', '', '03841620612', 'Coordenadora do CRAS  Castanheiras', '7 anos', 'Rua Santana ,36 Roça Grande Sabará', 'Secretaria de Desenvolvimento Social/ CRAS', 'Âmbito da Proteção Básica', 'Rua Catarina de Freitas, 210, Jardim dos Castanheiras, Sabará MG', '(31) 3671-4725', 'cras.castanheiras@sabara.mg.gov.br', 'documentos/Raquel Conrado Ventura_RG Raquel_0001.pdf', 'documentos/Raquel Conrado Ventura_RG Raquel_0001.pdf', 'documentos/Raquel Conrado Ventura_Raquel ficha inscricao_0001.pdf', _binary ''),
	(26, 'Guilherme Soares Donadoni Moura da Silva', 'SP4396647-5', 'C', '', '33433886881', 'Técnico Social ', '4 dias ', 'Rua Conceição Aparecida Augstein ', 'Secretaria de Desenvolvimento Social/ CRAS', 'Âmbito da Proteção Básica', 'Rua Catarina de Freitas, 210, Jardim dos Castanheiras, Sabará MG', '(31) 3671-4725', 'cras.castanheiras@sabara.mg.gov.br', 'documentos/Guilherme Soares Donadoni Moura da Silva_20250509104859418_0003.pdf', 'documentos/Guilherme Soares Donadoni Moura da Silva_20250509104859418_0003.pdf', 'documentos/Guilherme Soares Donadoni Moura da Silva_20250509104859418_0001.pdf', _binary 0x54c3a9636e69636f20536f6369616c202c20437261732043617374616e686569726173202e),
	(27, 'NIVIA FERNANDES DE AGUIAR', 'MG 14180527', 'E', '', '07831383697', 'ASSISTENTE SOCIAL', '4 ANOS', 'RUA LUXEMBURGO, 26', 'Secretaria de Desenvolvimento Social/ CRAS', 'CENTRO DE REFERÊNCIA DA SAUDE MENTAL', 'RUA ', '(31) 3671-4725', 'cras.castanheiras@sabara.mg.gov.br', 'documentos/NIVIA FERNANDES DE AGUIAR_Nivia_0001.pdf', '', 'documentos/NIVIA FERNANDES DE AGUIAR_Nivia_0002.pdf', _binary ''),
	(28, 'DAVID ARAUJO MACHADO', '23357022', 'E', '', '87364972315', 'ASSISTENTE SOCIAL', '9 MESES.', 'RUA CEL. FRANCISCO SARAIVA, 703 CASA 01 - BAIRRO: TEREZA CRISTINA- SAO JOAQUIM DE BICAS- MG', 'ÓRGÃO GOVERNAMENTAL- SECRETARIA DE DESENVOLVIMENTO SOCIAL.', 'Na gestão do Suas -  Na secretaria de desenvolvimento social do município de Sabará-Mg.', 'Rua comendador Viana, 119 centro - Sabará- MG', '(31) 3672-7719', 'protecaobasica@sabara.mg.gov.br', 'documentos/DAVID ARAUJO MACHADO_20250509_141751.jpg', '', 'documentos/DAVID ARAUJO MACHADO_20250509_141733.jpg', _binary ''),
	(29, 'ALINE LUIZA PEREIRA', 'MG 14911623', 'C', '1000481411.jpg', '11172658625', 'Técnico Social Psicólogo ', '5 dias', 'Rua Jovina gomes De souza 1065', 'Cras Roça Grande ', '', 'Rua Catita, 88- Roça Grande ', '(31) 99793-7054', 'linealp@gmail.com', 'documentos/ALINE LUIZA PEREIRA_IMG_20250509_142738.jpg', 'documentos/ALINE LUIZA PEREIRA_IMG_20250509_142738.jpg', 'documentos/ALINE LUIZA PEREIRA_IMG_20250509_142649.jpg', _binary 0x54c3a9636e69636120536f6369616c204352415320526fc3a761204772616e646520),
	(30, 'ANDREIA SOUZA BATISTA', '12587644', 'E', '', '06976046674', 'ENTREVISTADORA SOCIAL CADASTRO UNICO', '04 MESES', 'RUA HENRIQUE ALEXANDRINO, 67  - SAO FRANCISCO', 'SECRETARIA MUNICIPAL DE DESENVOLVIMENTO SOCIAL', 'ENTREVISTADORA SOCIAL', 'Rua Comendador Viana, 119 Centro', '(31) 3672-7753', 'bolsa.familia@sabara.mg.gov.br', 'documentos/ANDREIA SOUZA BATISTA_ANDREIA RG.pdf', '', 'documentos/ANDREIA SOUZA BATISTA_ANDREIA ANEXO VII.pdf', _binary ''),
	(31, 'Priscila Silva Cunha', 'Mg 17557252', 'C', '', '13932840607', 'Coordenação cras ', '5 meses ', 'Rua Carlindo Costa Ferreira n 95 Eymard ', 'Prefeitura ', 'Suas Sabará ', 'Rua catita n 88 Roça Grande - sabara ', '(31) 97567-9661', 'priscilacunha96@hotmail.com', 'documentos/Priscila Silva Cunha_image.jpg', 'documentos/Priscila Silva Cunha_image.jpg', 'documentos/Priscila Silva Cunha_image.jpg', _binary ''),
	(32, 'ELIZABETH EUSEBIA CORNELIO LEMOS DA SILVA', '240181', 'E', '', '20351437649', 'ASSISTENTE SOCIAL', 'ASSISTENTE SOCIAL', 'RUA SONIA, 133-  PRIMEIRO DE MAIO - BELO HORIZONTE', 'SECRETARIA MUNICIPAL DE DESENVOLVIMENTO SOCIAL', 'ASSISTENTE SOCIAL', 'Rua Comendador Viana, 119 Centro', '(31) 3672-7753', 'bolsa.familia@sabara.mg.gov.br', 'documentos/ELIZABETH EUSEBIA CORNELIO LEMOS DA SILVA_Beth Foto Identidade.pdf', '', 'documentos/ELIZABETH EUSEBIA CORNELIO LEMOS DA SILVA_Beth para CMAS.pdf', _binary ''),
	(33, 'Patrícia Faria de Souza Araujo', 'MG17271109', 'E', '', '10084565608', 'Auxiliar Administrativo', '3 MESES', 'Rua Machado Assis,18', 'Secretaria de Desenvolvimento Social/ CRAS Castanheiras ', 'Proteção Básica', 'Rua Catarina de Freitas, 210, Jardim dos Castanheiras, Sabará MG', '(31) 3671-4725', 'patriciafarias1205@gmail.com', 'documentos/Patrícia Faria de Souza Araujo_Patricia RG frente_0001.pdf', '', 'documentos/Patrícia Faria de Souza Araujo_Patricia _0001.pdf', _binary ''),
	(34, 'GLAUCIENE RAMOS SILVA', '5092233', 'E', '', '82375470630', 'ENTREVISTADORA SOCIAL CADASTRO UNICO', '08 anos', 'RUA SAO JOAAO, 122- ESPLANADA - SABARA', 'SECRETARIA MUNICIPAL DE DESENVOLVIMENTO SOCIAL', 'ENTREVISTADORA SOCIAL CADASTRO UNICO', 'Rua Comendador Viana, 119 Centro', '(31) 3672-7719', 'bolsa.familia@sabara.mg.gov.br', 'documentos/GLAUCIENE RAMOS SILVA_Glauciene Ramos RG.pdf', '', 'documentos/GLAUCIENE RAMOS SILVA_GlaucieneRamos termo.pdf', _binary ''),
	(35, 'Lorrane Stefany de Oliveira Vieira', '15288191', 'C', '', '10937670650', 'Entrevistadora social ', '2 anos e 7 meses ', 'Jotinha 136', 'Cadastro único ', 'Cadastro único ', 'Rua comendador Viana 119 centro ', '(31) 99375-3638', 'lorrane.stefany.correia20@gmail.com', 'documentos/Lorrane Stefany de Oliveira Vieira_CNH-e.pdf.pdf', 'documentos/Lorrane Stefany de Oliveira Vieira_CNH-e.pdf.pdf', 'documentos/Lorrane Stefany de Oliveira Vieira_IMG_8859.jpeg', _binary '');

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

-- Copiando estrutura para tabela cmas.votos_suas
CREATE TABLE IF NOT EXISTS `votos_suas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_eleitor` int DEFAULT NULL,
  `id_candidato` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.votos_suas: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela cmas.votos_usuarios
CREATE TABLE IF NOT EXISTS `votos_usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_eleitor` int DEFAULT NULL,
  `id_candidato` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela cmas.votos_usuarios: ~1 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

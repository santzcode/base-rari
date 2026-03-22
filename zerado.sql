-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           12.1.2-MariaDB - MariaDB Server
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.14.0.7169
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para creawork
CREATE DATABASE IF NOT EXISTS `creawork` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `creawork`;

-- Copiando estrutura para tabela creawork.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(50) NOT NULL DEFAULT 0,
  `chars` int(10) NOT NULL DEFAULT 1,
  `gems` int(20) NOT NULL DEFAULT 0,
  `discord` varchar(50) NOT NULL DEFAULT '0',
  `license` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `license` (`license`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.accounts: ~13 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.au_admin_log
CREATE TABLE IF NOT EXISTS `au_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `action` varchar(70) DEFAULT NULL,
  `hour` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.au_admin_log: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.banneds
CREATE TABLE IF NOT EXISTS `banneds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) NOT NULL,
  `time` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.banneds: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT 'Individuo',
  `name2` varchar(50) DEFAULT 'Indigente',
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `prison` int(10) NOT NULL,
  `bank` int(20) NOT NULL DEFAULT 0,
  `medicplan` int(20) NOT NULL DEFAULT 0,
  `blood` int(1) NOT NULL DEFAULT 1,
  `fines` int(20) NOT NULL DEFAULT 0,
  `tracking` int(30) NOT NULL DEFAULT 0,
  `spending` int(20) NOT NULL DEFAULT 0,
  `cardlimit` int(20) NOT NULL DEFAULT 0,
  `cardpassword` int(11) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `created` int(20) NOT NULL DEFAULT 0,
  `paypal` int(11) DEFAULT 0,
  `age` int(11) DEFAULT 20,
  `time` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.characters: ~14 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.chests
CREATE TABLE IF NOT EXISTS `chests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Permission` varchar(50) DEFAULT NULL,
  `Weight` int(10) NOT NULL DEFAULT 500,
  `Slots` int(20) NOT NULL DEFAULT 50,
  `Logs` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`Name`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.chests: ~1 rows (aproximadamente)
INSERT INTO `chests` (`id`, `Name`, `Permission`, `Weight`, `Slots`, `Logs`) VALUES
	(12, 'Pcc', 'Pcc', 20000, 2000, 1);

-- Copiando estrutura para tabela creawork.dependents
CREATE TABLE IF NOT EXISTS `dependents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Dependent` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.dependents: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.entitydata
CREATE TABLE IF NOT EXISTS `entitydata` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`dkey`),
  KEY `dkey` (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.entitydata: ~30 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.fidentity
CREATE TABLE IF NOT EXISTS `fidentity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `name2` varchar(50) NOT NULL DEFAULT '',
  `port` int(1) NOT NULL DEFAULT 1,
  `blood` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.fidentity: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.fines
CREATE TABLE IF NOT EXISTS `fines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.fines: ~3 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.five_orgs_goals
CREATE TABLE IF NOT EXISTS `five_orgs_goals` (
  `user_id` int(11) NOT NULL,
  `organization` varchar(50) NOT NULL,
  `item` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `day` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `step` int(11) DEFAULT 1,
  `reward_step` int(11) DEFAULT 0,
  UNIQUE KEY `user_id_organization_item_day` (`user_id`,`organization`,`item`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.five_orgs_goals: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.five_orgs_info
CREATE TABLE IF NOT EXISTS `five_orgs_info` (
  `organization` varchar(50) NOT NULL,
  `alerts` text DEFAULT '{}',
  `presets` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `radio` int(11) DEFAULT 0,
  `discord` varchar(150) DEFAULT '',
  `bank` int(11) DEFAULT 0,
  `bank_historic` text DEFAULT '{}',
  `permissions` text DEFAULT '{}',
  `salary` text DEFAULT '{}',
  `config_goals` text DEFAULT '{}',
  PRIMARY KEY (`organization`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela creawork.five_orgs_info: ~95 rows (aproximadamente)
INSERT INTO `five_orgs_info` (`organization`, `alerts`, `presets`, `logo`, `radio`, `discord`, `bank`, `bank_historic`, `permissions`, `salary`, `config_goals`) VALUES
	('1BPChq', '{}', NULL, NULL, 0, '', 0, '{}', '{"Soldado 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Cabo 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Subtenente Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Tenente 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Sargento Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Tenente Coronel 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Subtenente 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Terceiro Sargento Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Coronel 1BPChq":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Terceiro Sargento 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Sargento 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Major 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Tenente Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Coronel Bope":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Segundo Sargento 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Capitão 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Capitão Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Tenente 1BPChq":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Tenente Coronel Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Cabo Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Major Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Tenente Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Sargento Bope":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('3Pontes', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente 3Pontes":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Radinho 3Pontes":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor 3Pontes":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Frente 3Pontes":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado 3Pontes":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono 3Pontes":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true}}', '{}', '{}'),
	('5Bocas', '{}', NULL, NULL, 0, '', 0, '{}', '{"Dono 5Bocas":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Frente 5Bocas":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Radinho 5Bocas":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado 5Bocas":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente 5Bocas":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor 5Bocas":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Admin', '{}', NULL, NULL, 0, '', 0, '{}', '{"Suporte Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"Administrador Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"Helper Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"COO Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"Founder Admin":{"deposit":true,"withdraw":true,"demote":true,"promote":true,"invite":true,"alerts":true,"dismiss":true,"leader":true,"chat":true,"message":true},"Moderador Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"Diretor Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"SS Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"Supervisor Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false}}', '{}', '{}'),
	('AutoSport', '{}', NULL, NULL, 0, '', 0, '{}', '{"MecAuxilar AutoSport":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Mecanico AutoSport":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente AutoSport":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono AutoSport":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Chefe AutoSport":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Membro AutoSport":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Bloods', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Conselheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Membro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Bope', '{}', NULL, NULL, 0, '', 0, '{}', '{"Segundo Tenente Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Segundo Sargento Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Soldado Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Capitão Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Tenente Coronel Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Terceiro Sargento Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Primeiro Tenente Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Subtenente Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Primeiro Sargento Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Cabo Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Major Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Coronel Bope":{"deposit":true,"message":true,"withdraw":true,"chat":true,"alerts":true,"promote":true,"leader":true,"demote":true,"invite":true,"dismiss":true}}', '{}', '{}'),
	('Brasilandia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente Brasilandia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Sub-Chefe Brasilandia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Brasilandia":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Conselheiro Brasilandia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Brasilandia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('BurgerShot', '{}', NULL, NULL, 0, '', 2348000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:25","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:25","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:25","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:25","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:25","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:25","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:25","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:25","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:25","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":4000,"name":"BurgerShot"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"BurgerShot","value":4000}]', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Conselheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Membro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Camara', '{}', NULL, NULL, 0, '', 0, '{}', '{"Dono Camara":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Frente Camara":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Radinho Camara":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente Camara":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor Camara":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Camara":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Chapadao', '{}', NULL, NULL, 0, '', 0, '{}', '{"Dono Chapadao":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Gerente Chapadao":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Radinho Chapadao":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Chapadao":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Frente Chapadao":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor Chapadao":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('China', '{}', NULL, NULL, 0, '', 0, '{}', '{"Chefe China":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Membro China":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Sub-Chefe China":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Conselheiro China":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Gerente China":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Choque', '{}', NULL, NULL, 0, '', 0, '{}', '{"Primeiro Sargento Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Sargento Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Tenente Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Coronel Choque":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Subtenente Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Capitão Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Major Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Tenente Coronel Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Cabo Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Terceiro Sargento Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Tenente Choque":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('CidadeAlta', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente CidadeAlta":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor CidadeAlta":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Frente CidadeAlta":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Radinho CidadeAlta":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono CidadeAlta":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Soldado CidadeAlta":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Core', '{}', NULL, NULL, 0, '', 0, '{}', '{"Capitão Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Subtenente Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Terceiro Sargento Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Sargento Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Major Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Cabo Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Tenente Coronel Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Coronel Core":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Soldado Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Sargento Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Tenente Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Tenente Core":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Croacia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Chefe Croacia":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Gerente Croacia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Sub-Chefe Croacia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Croacia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Conselheiro Croacia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Desmanche01', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Dick', '{}', NULL, NULL, 0, '', 0, '{}', '{"Vapor Dick":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Dick":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono Dick":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Frente Dick":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Radinho Dick":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente Dick":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('EastCustoms', '{}', NULL, NULL, 0, '', 0, '{}', '{"MecAuxilar EastCustoms":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Mecanico EastCustoms":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe EastCustoms":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Gerente EastCustoms":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono EastCustoms":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Membro EastCustoms":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Emergency', '{}', NULL, NULL, 0, '', 0, '{}', '{"Chefe":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('Escocia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente Escocia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Escocia":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Sub-Chefe Escocia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Conselheiro Escocia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Escocia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Exercito', '{}', NULL, NULL, 0, '', 0, '{}', '{"Terceiro Sargento Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"General de Divisão Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Coronel Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"General de Brigada Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Tenente Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"General de Exército":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"General de Brigada":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Capitão Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Aspirante à Oficial Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub Tenente Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Sargento Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Tenente Coronel Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"General de Exército Exercito":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Primeiro Sargento Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Tenente Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"General de Divisão":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Major Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Recruta Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Cabo Exercito":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela01', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela02', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela03', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela04', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela05', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela06', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela07', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela08', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela09', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela10', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela11', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Favela12', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Franca', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe Franca":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Franca":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Gerente Franca":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Franca":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Conselheiro Franca":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Fuba', '{}', NULL, NULL, 0, '', 0, '{}', '{"Frente Fuba":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Radinho Fuba":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor Fuba":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono Fuba":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Soldado Fuba":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente Fuba":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Hospital', '{}', NULL, 'https://cdn.discordapp.com/attachments/955945917251473488/1428813433230590093/Untitled_design.png?ex=696fcab4&is=696e7934&hm=a837709d8584151e5751edf4007ce0ba7963b239857dc9309a389c3a341b7990&', 134, '', 10000, '[{"name":"HIDEN STORE","type":"DEPÓSITO","userid":1,"date":"20/01/2026 00:46:06","value":10000}]', '{"Paramedico Hospital":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Medico Hospital":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Diretor Hospital":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Enfermeiro Hospital":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Israel', '{}', NULL, NULL, 0, '', 0, '{}', '{"Conselheiro Israel":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Israel":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Gerente Israel":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Israel":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Sub-Chefe Israel":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Jacare', '{}', NULL, NULL, 0, '', 0, '{}', '{"Radinho Jacare":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Frente Jacare":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Jacare":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor Jacare":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente Jacare":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono Jacare":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true}}', '{}', '{}'),
	('Jorgeturco', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente Jorgeturco":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Jorgeturco":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor Jorgeturco":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono Jorgeturco":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Radinho Jorgeturco":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Frente Jorgeturco":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Juridic', '{}', NULL, NULL, 0, '', 4696000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:37","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:37","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:37","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":8000,"name":"Juridic"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"Juridic","value":8000}]', '{"Promotor":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Advogado":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Juiz":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true}}', '{}', '{}'),
	('Lester', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Conselheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Membro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Mafia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Conselheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Membro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Mecanica01', '{}', NULL, NULL, 0, '', 2935000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:38","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:38","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":5000,"name":"Mecanica01"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"Mecanica01","value":5000}]', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Mêcanico":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Borracheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Mecanica02', '{}', NULL, NULL, 0, '', 2935000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:25","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:25","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:25","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:25","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:25","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:25","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:25","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:25","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:25","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":5000,"name":"Mecanica02"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"Mecanica02","value":5000}]', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Mêcanico":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Borracheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Mechanic', '{}', NULL, NULL, 0, '', 2935000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:37","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:38","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":5000,"name":"Mechanic"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"Mechanic","value":5000}]', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Mêcanico":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Borracheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('NovaHolanda', '{}', NULL, NULL, 0, '', 0, '{}', '{"Frente NovaHolanda":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente NovaHolanda":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado NovaHolanda":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor NovaHolanda":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono NovaHolanda":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Radinho NovaHolanda":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Paramedic', '{}', NULL, NULL, 0, '', 2935000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:34","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:34","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:34","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:34","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:34","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":5000,"name":"Paramedic"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"Paramedic","value":5000}]', '{"Médico":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Doutor":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Conselheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Pcc', '{}', NULL, NULL, 0, '', 0, '{}', '{"Conselheiro Pcc":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Sub-Chefe Pcc":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Gerente Pcc":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Pcc":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Membro Pcc":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Pcesp', '{}', NULL, NULL, 0, '', 0, '{}', '{"Escrivão Pcerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Perito Criminal Pcerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Investigador Pcerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Escrivão Pcesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Auxiliar de Papiloscopista Pcesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Auxiliar de Papiloscopista Pcerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Médico Legista Pcerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Médico Legista Pcesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Delegado Pcesp":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Investigador Pcesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Perito Criminal Pcesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Delegado Pcerj":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true}}', '{}', '{}'),
	('Pedreira', '{}', NULL, NULL, 0, '', 0, '{}', '{"Soldado Pedreira":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono Pedreira":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Radinho Pedreira":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor Pedreira":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Frente Pedreira":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente Pedreira":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Penha', '{}', NULL, NULL, 0, '', 0, '{}', '{"Dono Penha":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Frente Penha":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Radinho Penha":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor Penha":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente Penha":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Penha":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Pmerj', '{}', NULL, NULL, 0, '', 0, '{}', '{"Major Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Primeiro Aluno Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Comandante Geral Pmerj":{"deposit":true,"message":true,"withdraw":true,"chat":true,"alerts":true,"promote":true,"leader":true,"demote":true,"invite":true,"dismiss":true},"Aspirante a Oficial Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Soldado Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Subtenente Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Segundo Aluno Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Coronel Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Primeiro Tenente Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Aluno Sargento Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Tenente Coronel Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Capitão Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Terceiro Aluno Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Primeiro Sargento Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Segundo Sargento Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Terceiro Sargento Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Aluno Csta Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Segundo Tenente Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Cabo Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false}}', '{}', '{}'),
	('Pmesp', '{}', NULL, NULL, 132, '', 0, '{}', '{"Terceiro Sargento Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Cabo Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Terceiro Sargento Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Aluno Csta Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Coronel Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Sargento Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Cabo Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Aluno Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Tenente Coronel Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Capitão Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Aluno Sargento Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Coronel Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Aluno Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Sargento Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Aluno Sargento Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Comandante Geral Pmerj":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Primeiro Aluno Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Major Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Tenente Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Sargento Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Comandante Geral Pmesp":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Major Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Aluno Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Aspirante a Oficial Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Sargento Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Tenente Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Aspirante a Oficial Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Tenente Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Subtenente Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Terceiro Aluno Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Aluno Csta Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Subtenente Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Terceiro Aluno Pmerj":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Tenente Coronel Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Tenente Pmesp":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Police', '{}', NULL, NULL, 0, '', 23480000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:37","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:38","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":40000,"name":"Police"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"Police","value":40000}]', '{"Dip":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Prfe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Delegado":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Coronel":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true}}', '{}', '{}'),
	('PoliciaFederal', '{}', NULL, NULL, 0, '', 0, '{}', '{"COT PoliciaFederal":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Perito Criminal PoliciaFederal":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Agente PF PoliciaFederal":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Escrivao PoliciaFederal":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Delegado PoliciaFederal":{"deposit":true,"message":true,"withdraw":true,"chat":true,"alerts":true,"promote":true,"leader":true,"demote":true,"invite":true,"dismiss":true}}', '{}', '{}'),
	('Premium', '{}', NULL, NULL, 0, '', 821800, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:27","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:27","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:37","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:38","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1400,"name":"Premium"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"Premium","value":1400}]', '{"Spotify":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Prata":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Bronze":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Ouro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Platina":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Diamante":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true}}', '{}', '{}'),
	('Prf', '{}', NULL, NULL, 0, '', 0, '{}', '{"Segundo Sargento Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Major Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Terceiro Sargento Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Cabo Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Aluno Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Terceiro Aluno Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Comandante Geral Prf":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Primeiro Aluno Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Capitão Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Tenente Coronel Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Aspirante a Oficial Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Sargento Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Tenente Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Tenente Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Aluno Sargento Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Coronel Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Aluno Csta Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Subtenente Prf":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Prfe', '{}', NULL, NULL, 0, '', 2935000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:38","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:38","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":5000,"name":"Prfe"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"Prfe","value":5000}]', '{"Cadete":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Capitão":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Oficial":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Tenente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sargento":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Corporal":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Qg01', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Qg02', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Traficante":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Morador":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapo":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Recom', '{}', NULL, NULL, 0, '', 0, '{}', '{"Segundo Tenente Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Cabo Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Capitão Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Soldado Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Segundo Sargento Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Subtenente Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Tenente Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Tenente Coronel Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Coronel Recom":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Terceiro Sargento Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Major Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Primeiro Sargento Recom":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Restaurants', '{}', NULL, NULL, 0, '', 0, '{}', '{"Chefe":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('Sapo', '{}', NULL, NULL, 0, '', 0, '{}', '{"Escrivão Pcerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Delegado Pcerj":{"deposit":true,"message":true,"withdraw":true,"chat":true,"alerts":true,"promote":true,"leader":true,"demote":true,"invite":true,"dismiss":true},"Investigador Pcerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Auxiliar de Papiloscopista Pcerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Médico Legista Pcerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Perito Criminal Pcerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false}}', '{}', '{}'),
	('Serrinha', '{}', NULL, NULL, 0, '', 0, '{}', '{"Soldado Serrinha":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Radinho Serrinha":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono Serrinha":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Frente Serrinha":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente Serrinha":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor Serrinha":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Spotify', '{}', NULL, NULL, 0, '', 0, '{}', '{"Spotify":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('Suecia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Membro Suecia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Conselheiro Suecia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Suecia":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Sub-Chefe Suecia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Gerente Suecia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Triads', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Conselheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Membro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Turquia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente Turquia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Sub-Chefe Turquia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Turquia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Conselheiro Turquia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Turquia":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true}}', '{}', '{}'),
	('Vagos', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Conselheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Membro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Vanilla', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Conselheiro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Chefe":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Membro":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Sub-Chefe":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('Verificado', '{}', NULL, NULL, 0, '', 0, '{}', '{"Verificado":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('Verify', '{}', NULL, NULL, 0, '', 0, '{}', '{"Verify":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('Vidigal', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente Vidigal":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono Vidigal":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Soldado Vidigal":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor Vidigal":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Frente Vidigal":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Radinho Vidigal":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}'),
	('VipApoiador', '{}', NULL, NULL, 0, '', 792450, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1350,"name":"VipApoiador"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipApoiador","value":1350}]', '{"Vip Apoiador":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipAposentado', '{}', NULL, NULL, 0, '', 792450, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:38","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:38","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1350,"name":"VipAposentado"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipAposentado","value":1350}]', '{"Vip Aposentado":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipBaby', '{}', NULL, NULL, 0, '', 587000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:24","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:24","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:24","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:24","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:24","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:24","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:24","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:24","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:24","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:37","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:37","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1000,"name":"VipBaby"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipBaby","value":1000}]', '{"Vip Baby":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipBarao', '{}', NULL, NULL, 0, '', 1109430, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:24","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:24","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:24","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:24","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:24","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:24","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:24","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:25","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:25","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1890,"name":"VipBarao"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipBarao","value":1890}]', '{"Vip Barão":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipBooster', '{}', NULL, NULL, 0, '', 410900, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":700,"name":"VipBooster"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipBooster","value":700}]', '{"VipBooster":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipChefao', '{}', NULL, NULL, 0, '', 1012575, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:37","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:38","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1725,"name":"VipChefao"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipChefao","value":1725}]', '{"Vip Chefão":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipCLT', '{}', NULL, NULL, 0, '', 475470, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:25","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:25","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:25","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:25","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:25","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:25","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:25","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:25","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:25","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":810,"name":"VipCLT"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipCLT","value":810}]', '{"Vip CLT":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipDesempregado', '{}', NULL, NULL, 0, '', 0, '{}', '{"Vip Desempregado":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipEmpreendedor', '{}', NULL, NULL, 0, '', 665658, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:24","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:24","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:24","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:24","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:24","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:24","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:24","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:25","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:25","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1134,"name":"VipEmpreendedor"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipEmpreendedor","value":1134}]', '{"Vip Empreendedor":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipGangster', '{}', NULL, NULL, 0, '', 895175, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1525,"name":"VipGangster"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipGangster","value":1525}]', '{"Vip Gangster":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipHeliVip', '{}', NULL, NULL, 0, '', 0, '{}', '{"VipHeliVip":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipHospital', '{}', NULL, NULL, 0, '', 880500, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:25","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:25","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:25","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:25","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:25","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:25","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:25","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:25","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:25","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:37","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:37","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1500,"name":"VipHospital"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipHospital","value":1500}]', '{"Vip Hospital":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipImperial', '{}', NULL, NULL, 0, '', 1479240, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":2520,"name":"VipImperial"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipImperial","value":2520}]', '{"Vip Imperial":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipInfluencer', '{}', NULL, NULL, 0, '', 587000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1000,"name":"VipInfluencer"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipInfluencer","value":1000}]', '{"Vip Influencer":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipMafia', '{}', NULL, NULL, 0, '', 777775, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:27","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1325,"name":"VipMafia"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipMafia","value":1325}]', '{"Vip Mafia":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipMecanica', '{}', NULL, NULL, 0, '', 880500, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:25","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:25","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:25","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:25","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:25","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:25","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:25","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:25","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:25","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:38","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:38","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1500,"name":"VipMecanica"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipMecanica","value":1500}]', '{"Vip Mecânica":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipNobre', '{}', NULL, NULL, 0, '', 933330, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:28","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:37","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:38","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:53","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:53","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:53","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1590,"name":"VipNobre"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipNobre","value":1590}]', '{"Vip Nobre":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipPolice', '{}', NULL, NULL, 0, '', 587000, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:27","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:36","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:36","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:36","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":1000,"name":"VipPolice"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipPolice","value":1000}]', '{"Vip Police":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipRei/Rainha', '{}', NULL, NULL, 0, '', 1370058, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:27","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:27","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:27","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:27","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:27","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:27","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:27","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:28","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:28","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:37","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:38","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":2334,"name":"VipRei/Rainha"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipRei/Rainha","value":2334}]', '{"Vip Rei/Rainha":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipRoyalty', '{}', NULL, NULL, 0, '', 1890140, '[{"type":"SALÁRIO FAC","date":"29/01/2026 15:33:25","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:43:25","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 15:53:25","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:03:25","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:13:25","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:23:25","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:33:25","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:43:25","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 16:53:25","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:24:35","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:34:36","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:44:36","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 17:54:37","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:04:37","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:14:38","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:33:52","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:43:52","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 18:53:52","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"29/01/2026 19:03:52","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:02:32","value":3220,"name":"VipRoyalty"},{"type":"SALÁRIO FAC","date":"05/02/2026 15:26:16","name":"VipRoyalty","value":3220}]', '{"Vip Royalty":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VJ', '{}', NULL, NULL, 0, '', 0, '{}', '{"Soldado VJ":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Frente VJ":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Vapor VJ":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Dono VJ":{"dismiss":true,"deposit":true,"alerts":true,"withdraw":true,"message":true,"promote":true,"chat":true,"invite":true,"leader":true,"demote":true},"Radinho VJ":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false},"Gerente VJ":{"dismiss":false,"deposit":false,"alerts":false,"withdraw":false,"message":false,"promote":false,"chat":false,"invite":false,"leader":false,"demote":false}}', '{}', '{}');

-- Copiando estrutura para tabela creawork.five_orgs_logs
CREATE TABLE IF NOT EXISTS `five_orgs_logs` (
  `organization` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `expire_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.five_orgs_logs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.five_orgs_partners
CREATE TABLE IF NOT EXISTS `five_orgs_partners` (
  `organization` varchar(50) DEFAULT NULL,
  `cds` text DEFAULT '{}',
  `keyword` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela creawork.five_orgs_partners: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.five_orgs_player_infos
CREATE TABLE IF NOT EXISTS `five_orgs_player_infos` (
  `user_id` int(11) NOT NULL,
  `organization` varchar(50) DEFAULT NULL,
  `joindate` int(11) DEFAULT 0,
  `lastlogin` int(11) DEFAULT 0,
  `timeplayed` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela creawork.five_orgs_player_infos: ~16 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.gas_station_balance
CREATE TABLE IF NOT EXISTS `gas_station_balance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gas_station_id` varchar(50) NOT NULL,
  `income` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.gas_station_balance: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.gas_station_business
CREATE TABLE IF NOT EXISTS `gas_station_business` (
  `gas_station_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` varchar(50) NOT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `stock_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `truck_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `relationship_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `money` int(10) unsigned NOT NULL DEFAULT 0,
  `total_money_earned` int(10) unsigned NOT NULL DEFAULT 0,
  `total_money_spent` int(10) unsigned NOT NULL DEFAULT 0,
  `gas_bought` int(10) unsigned NOT NULL DEFAULT 0,
  `gas_sold` int(10) unsigned NOT NULL DEFAULT 0,
  `distance_traveled` double unsigned NOT NULL DEFAULT 0,
  `total_visits` int(10) unsigned NOT NULL DEFAULT 0,
  `customers` int(10) unsigned NOT NULL DEFAULT 0,
  `timer` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`gas_station_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.gas_station_business: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.gas_station_jobs
CREATE TABLE IF NOT EXISTS `gas_station_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gas_station_id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `reward` int(10) unsigned NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `progress` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.gas_station_jobs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.history
CREATE TABLE IF NOT EXISTS `history` (
  `user_id` int(11) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `played_at` timestamp NOT NULL DEFAULT current_timestamp(),
  KEY `video_id` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela creawork.history: ~5 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.hydrus_credits
CREATE TABLE IF NOT EXISTS `hydrus_credits` (
  `player_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` int(11) DEFAULT 0,
  PRIMARY KEY (`player_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.hydrus_credits: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.hydrus_scheduler
CREATE TABLE IF NOT EXISTS `hydrus_scheduler` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(100) NOT NULL,
  `command` varchar(100) NOT NULL,
  `args` varchar(4096) NOT NULL,
  `execute_at` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `player_index` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.hydrus_scheduler: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.investments
CREATE TABLE IF NOT EXISTS `investments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Liquid` int(20) NOT NULL DEFAULT 0,
  `Monthly` int(20) NOT NULL DEFAULT 0,
  `Deposit` int(20) NOT NULL DEFAULT 0,
  `Last` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.investments: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Received` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Reason` longtext NOT NULL,
  `Holder` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.invoices: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.lawyer_logs
CREATE TABLE IF NOT EXISTS `lawyer_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lawyer_id` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.lawyer_logs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `user_id` int(11) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela creawork.likes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.mdt_creative_board
CREATE TABLE IF NOT EXISTS `mdt_creative_board` (
  `Permission` varchar(50) NOT NULL,
  `Title` text DEFAULT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`Permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.mdt_creative_board: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.mdt_operations
CREATE TABLE IF NOT EXISTS `mdt_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(100) DEFAULT NULL,
  `radio` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.mdt_operations: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.mdt_patrols
CREATE TABLE IF NOT EXISTS `mdt_patrols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `officers` text DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.mdt_patrols: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.mdt_penal_code
CREATE TABLE IF NOT EXISTS `mdt_penal_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `type` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.mdt_penal_code: ~16 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.mdt_records
CREATE TABLE IF NOT EXISTS `mdt_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passport` int(11) DEFAULT NULL,
  `officer_passport` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.mdt_records: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_passport` int(11) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.mdt_reports: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passport` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.mdt_warrants: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.org_transactions
CREATE TABLE IF NOT EXISTS `org_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Value` int(20) NOT NULL DEFAULT 0,
  `author` int(11) DEFAULT 0,
  `author_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.org_transactions: ~18 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.organizations
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bank` int(20) NOT NULL DEFAULT 0,
  `premium` int(20) NOT NULL DEFAULT 0,
  `buff` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.organizations: ~9 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.painel_creative_transactions
CREATE TABLE IF NOT EXISTS `painel_creative_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) DEFAULT NULL,
  `Passport` int(11) DEFAULT NULL,
  `Value` int(11) DEFAULT NULL,
  `Transfer` int(11) DEFAULT NULL,
  `Date` int(11) DEFAULT NULL,
  `Permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.painel_creative_transactions: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.ph_craft
CREATE TABLE IF NOT EXISTS `ph_craft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `craftxp` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Copiando dados para a tabela creawork.ph_craft: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.ph_crafts
CREATE TABLE IF NOT EXISTS `ph_crafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `weaponname` varchar(50) DEFAULT NULL,
  `weapontime` varchar(50) DEFAULT NULL,
  `weaponlabel` varchar(50) DEFAULT NULL,
  `itemtime` varchar(50) DEFAULT NULL,
  `images` varchar(50) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.ph_crafts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.playerdata
CREATE TABLE IF NOT EXISTS `playerdata` (
  `Passport` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`Passport`,`dkey`),
  KEY `Passport` (`Passport`),
  KEY `dkey` (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.playerdata: ~112 rows (aproximadamente)
INSERT INTO `playerdata` (`Passport`, `dkey`, `dvalue`) VALUES
	(6, 'Ammos', '[]'),
	(6, 'Attachs', '[]'),
	(6, 'Datatable', '{"Armour":0,"Pos":{"y":-523.91,"x":-730.45,"z":80.2},"Inventory":{"11":{"amount":1,"item":"plasticbottle"},"10":{"amount":1,"item":"WEAPON_DAGGER-1768538397"},"7":{"amount":101255,"item":"dollars"},"6":{"amount":1,"item":"water"},"1":{"amount":1,"item":"tablecoke-1768529357"},"9":{"amount":1,"item":"WEAPON_BOTTLE"},"8":{"amount":1,"item":"backpackg"},"5":{"amount":1,"item":"homekey-000339-154"},"4":{"amount":1,"item":"identity-6"},"3":{"amount":1,"item":"cellphone-1768527551"},"2":{"amount":1,"item":"WEAPON_KARAMBIT-1768538408"}},"Stress":0,"Health":190,"Skin":"mp_m_freemode_01","Thirst":69,"Hunger":69,"Weight":70}'),
	(6, 'Experience', '{"Trucker":0,"Tractor":0,"Postal":0,"Taxi":0,"Delivery":0,"Hunting":0,"Transporter":0,"Minerman":0,"Milkman":0,"Bus":0,"Lumberman":0,"Fisherman":0,"Tows":0,"Garbageman":0}');

-- Copiando estrutura para tabela creawork.playlist_videos
CREATE TABLE IF NOT EXISTS `playlist_videos` (
  `playlist_id` varchar(255) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`playlist_id`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `playlist_videos_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela creawork.playlist_videos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.playlists
CREATE TABLE IF NOT EXISTS `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela creawork.playlists: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.port
CREATE TABLE IF NOT EXISTS `port` (
  `portId` int(11) NOT NULL AUTO_INCREMENT,
  `identity` longtext DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `portType` longtext DEFAULT NULL,
  `serial` longtext DEFAULT NULL,
  `nidentity` longtext DEFAULT NULL,
  `exam` longtext DEFAULT NULL,
  `date` text DEFAULT NULL,
  PRIMARY KEY (`portId`),
  KEY `portId` (`portId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela creawork.port: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.prison
CREATE TABLE IF NOT EXISTS `prison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `police` varchar(255) DEFAULT '0',
  `nuser_id` int(11) NOT NULL DEFAULT 0,
  `services` int(11) NOT NULL DEFAULT 0,
  `fines` int(20) NOT NULL DEFAULT 0,
  `text` longtext DEFAULT NULL,
  `date` text DEFAULT NULL,
  `cops` longtext NOT NULL DEFAULT '0',
  `association` longtext NOT NULL DEFAULT '0',
  `residual` text DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela creawork.prison: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.propertys
CREATE TABLE IF NOT EXISTS `propertys` (
  `Number` int(20) NOT NULL,
  `Passport` int(11) NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `Keychain` int(11) NOT NULL DEFAULT 0,
  `Tax` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Number`) USING BTREE,
  KEY `Passport` (`Passport`),
  KEY `id` (`Number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.propertys: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.races
CREATE TABLE IF NOT EXISTS `races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Race` int(3) NOT NULL DEFAULT 0,
  `Passport` int(5) NOT NULL DEFAULT 0,
  `Name` varchar(100) NOT NULL DEFAULT 'Individuo Indigente',
  `Vehicle` varchar(50) NOT NULL DEFAULT 'Sultan RS',
  `Points` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Race` (`Race`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.races: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `victim_id` text DEFAULT NULL,
  `police_name` text DEFAULT NULL,
  `solved` text DEFAULT NULL,
  `victim_name` text DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  `victim_report` text DEFAULT NULL,
  `updated_at` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portId` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela creawork.reports: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_bank_invoices
CREATE TABLE IF NOT EXISTS `smartphone_bank_invoices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payee_id` int(11) NOT NULL,
  `payer_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `value` int(11) NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_bank_invoices: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_blocks
CREATE TABLE IF NOT EXISTS `smartphone_blocks` (
  `user_id` int(11) NOT NULL,
  `phone` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_blocks: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_calls
CREATE TABLE IF NOT EXISTS `smartphone_calls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL,
  `video` tinyint(4) NOT NULL DEFAULT 0,
  `anonymous` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `initiator_index` (`initiator`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_calls: ~2 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_casino
CREATE TABLE IF NOT EXISTS `smartphone_casino` (
  `user_id` int(11) NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `double` bigint(20) NOT NULL DEFAULT 0,
  `crash` bigint(20) NOT NULL DEFAULT 0,
  `mine` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_casino: ~2 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_contacts
CREATE TABLE IF NOT EXISTS `smartphone_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_index` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_contacts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_gallery
CREATE TABLE IF NOT EXISTS `smartphone_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `folder` varchar(255) NOT NULL DEFAULT '/',
  `url` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_gallery: ~6 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_ifood_orders
CREATE TABLE IF NOT EXISTS `smartphone_ifood_orders` (
  `id` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `fee` int(11) DEFAULT NULL,
  `rate` tinyint(4) DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_ifood_orders: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_instagram
CREATE TABLE IF NOT EXISTS `smartphone_instagram` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` varchar(255) NOT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_instagram: ~2 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_instagram_followers
CREATE TABLE IF NOT EXISTS `smartphone_instagram_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`follower_id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_instagram_followers: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_instagram_likes
CREATE TABLE IF NOT EXISTS `smartphone_instagram_likes` (
  `post_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`post_id`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_instagram_likes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_instagram_notifications
CREATE TABLE IF NOT EXISTS `smartphone_instagram_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  `saw` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_instagram_notifications: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_instagram_posts
CREATE TABLE IF NOT EXISTS `smartphone_instagram_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `comments` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `profile_id_index` (`profile_id`) USING BTREE,
  KEY `post_id_index` (`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela creawork.smartphone_instagram_posts: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_marketplace
CREATE TABLE IF NOT EXISTS `smartphone_marketplace` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `images` varchar(1024) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_marketplace: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_olx
CREATE TABLE IF NOT EXISTS `smartphone_olx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `images` varchar(1024) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `x` float DEFAULT 0,
  `y` float DEFAULT 0,
  `z` float DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_olx: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_olx_items
CREATE TABLE IF NOT EXISTS `smartphone_olx_items` (
  `ad_id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_olx_items: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_paypal_transactions
CREATE TABLE IF NOT EXISTS `smartphone_paypal_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'payment',
  `description` varchar(255) DEFAULT NULL,
  `value` bigint(20) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_paypal_transactions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_tinder
CREATE TABLE IF NOT EXISTS `smartphone_tinder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(1024) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `show_gender` tinyint(4) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `show_tags` tinyint(4) NOT NULL,
  `target` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`),
  KEY `gender_index` (`gender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_tinder: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_tinder_messages
CREATE TABLE IF NOT EXISTS `smartphone_tinder_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `liked` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_tinder_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_tinder_rating
CREATE TABLE IF NOT EXISTS `smartphone_tinder_rating` (
  `profile_id` int(11) NOT NULL,
  `rated_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`profile_id`,`rated_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_tinder_rating: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_tor_messages
CREATE TABLE IF NOT EXISTS `smartphone_tor_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel` varchar(24) NOT NULL DEFAULT 'geral',
  `sender` varchar(50) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_index` (`channel`),
  KEY `sender_index` (`sender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_tor_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_tor_payments
CREATE TABLE IF NOT EXISTS `smartphone_tor_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_tor_payments: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_twitter_followers
CREATE TABLE IF NOT EXISTS `smartphone_twitter_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  KEY `profile_id_index` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_twitter_followers: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_twitter_likes
CREATE TABLE IF NOT EXISTS `smartphone_twitter_likes` (
  `tweet_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  KEY `tweet_id_index` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_twitter_likes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_twitter_profiles
CREATE TABLE IF NOT EXISTS `smartphone_twitter_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `avatarURL` varchar(255) NOT NULL,
  `bannerURL` varchar(255) NOT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_twitter_profiles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_twitter_tweets
CREATE TABLE IF NOT EXISTS `smartphone_twitter_tweets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` bigint(20) DEFAULT NULL,
  `content` varchar(280) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`),
  KEY `tweet_id_index` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_twitter_tweets: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_uber_trips
CREATE TABLE IF NOT EXISTS `smartphone_uber_trips` (
  `id` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `user_rate` tinyint(4) DEFAULT 0,
  `driver_rate` tinyint(4) DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_uber_trips: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_weazel
CREATE TABLE IF NOT EXISTS `smartphone_weazel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `videoURL` varchar(255) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_weazel: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_whatsapp
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp` (
  `owner` varchar(32) NOT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `read_receipts` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_whatsapp: ~4 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_whatsapp_channels
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_channels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_whatsapp_channels: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_whatsapp_groups
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `avatarURL` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `members` varchar(2048) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_whatsapp_groups: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_whatsapp_messages
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) unsigned NOT NULL,
  `sender` varchar(50) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `deleted_by` varchar(255) DEFAULT NULL,
  `readed` tinyint(4) NOT NULL DEFAULT 0,
  `saw_at` bigint(20) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `channel_id_index` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_whatsapp_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.taxs
CREATE TABLE IF NOT EXISTS `taxs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.taxs: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.transactions: ~440 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela creawork.users: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `tax` int(20) NOT NULL DEFAULT 0,
  `plate` varchar(10) DEFAULT NULL,
  `rental` int(20) NOT NULL DEFAULT 0,
  `arrest` int(20) NOT NULL DEFAULT 0,
  `engine` int(4) NOT NULL DEFAULT 1000,
  `body` int(4) NOT NULL DEFAULT 1000,
  `health` int(4) NOT NULL DEFAULT 1000,
  `fuel` int(3) NOT NULL DEFAULT 100,
  `nitro` int(5) NOT NULL DEFAULT 0,
  `work` varchar(5) NOT NULL DEFAULT 'false',
  `doors` longtext NOT NULL,
  `windows` longtext NOT NULL,
  `tyres` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `vehicle` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.vehicles: ~44 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.videos
CREATE TABLE IF NOT EXISTS `videos` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela creawork.videos: ~3 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.vrp_properties
CREATE TABLE IF NOT EXISTS `vrp_properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `property` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `owner` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tax` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '{}',
  `information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`property_id`,`property`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.vrp_properties: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.warehouse
CREATE TABLE IF NOT EXISTS `warehouse` (
  `Number` int(20) NOT NULL,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Password` int(11) NOT NULL DEFAULT 0,
  `Tax` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Number`) USING BTREE,
  KEY `Passport` (`Passport`),
  KEY `id` (`Number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.warehouse: ~1 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.warrants
CREATE TABLE IF NOT EXISTS `warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` text DEFAULT NULL,
  `identity` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  `nidentity` text DEFAULT NULL,
  `timeStamp` text DEFAULT NULL,
  `reason` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portId` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela creawork.warrants: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

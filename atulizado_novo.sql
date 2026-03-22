-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.12.0.7122
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.accounts: ~13 rows (aproximadamente)
INSERT INTO `accounts` (`id`, `whitelist`, `priority`, `chars`, `gems`, `discord`, `license`) VALUES
	(1, 1, 0, 1, 9740975, '0', '33ebc8cd7b7e71fffec379e95a1d0fc3758750d4'),
	(2, 1, 0, 1, 2147307297, '0', 'f3106a095823cde26d912775b2dc9eeb3c21940d'),
	(3, 1, 0, 1, 2147448497, '0', '09a69a47a3e349d785b7e51438a694401c598403'),
	(4, 1, 0, 1, 10000000, '0', '49b56131996a1740085d44f24e0b17bcaeead946'),
	(5, 1, 0, 1, 2147482422, '0', '533270e16d3fb0a9cf28f4539cb4411bf7714901'),
	(6, 1, 0, 1, 0, '0', '4f4c0b717695c831b6f255802b644b058a4e7fe4'),
	(7, 1, 0, 1, 0, '0', 'e868828864957945d7f522710c9305576ac41240'),
	(8, 1, 0, 1, 0, '0', 'f199ec3532365eeda3bae12b9f132809da64701f'),
	(9, 1, 0, 1, 0, '0', '6cf84041fa2c214ffbd0b027a16acca9b149e389'),
	(10, 1, 0, 1, 0, '0', 'cc42ceee404ff607033b29587f48c2374da80465'),
	(11, 1, 0, 1, 0, '0', '0bde2c33b312dd02132fa1b96b413b9fd1609075'),
	(12, 1, 0, 1, 0, '0', 'e3a16c90d4497cd932d1c92d896e26451d48fde1'),
	(13, 1, 0, 1, 0, '0', '54e6a3f6998441a88b2645ce8003115d05e9553c');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.characters: ~14 rows (aproximadamente)
INSERT INTO `characters` (`id`, `license`, `phone`, `name`, `name2`, `sex`, `prison`, `bank`, `medicplan`, `blood`, `fines`, `tracking`, `spending`, `cardlimit`, `cardpassword`, `deleted`, `created`, `paypal`, `age`, `time`) VALUES
	(1, '33ebc8cd7b7e71fffec379e95a1d0fc3758750d4', '065-122', 'HIDEN', 'STORE', 'M', 0, 2147483647, 0, 1, 0, 0, 1000, 1000, 1506, 0, 1768514295, 0, 20, NULL),
	(2, 'f3106a095823cde26d912775b2dc9eeb3c21940d', '111-500', 'rebello', 'rebell', 'M', 0, 2147472518, 0, 1, 0, 0, 0, 0, 2020, 0, 1768584692, 0, 20, NULL),
	(3, '09a69a47a3e349d785b7e51438a694401c598403', '409-690', 'RICHARD', 'SILVA', 'M', 0, 5000, 0, 3, 0, 0, 0, 0, 0, 0, 1768585154, 0, 20, NULL),
	(4, '09a69a47a3e349d785b7e51438a694401c598403', '511-302', 'RICHARD', 'SILVA', 'M', 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1768585155, 0, 20, NULL),
	(5, '49b56131996a1740085d44f24e0b17bcaeead946', '681-226', 'Matheus', 'Amigão', 'M', 0, 5000, 0, 2, 0, 0, 0, 0, 0, 0, 1768609446, 0, 20, NULL),
	(6, '533270e16d3fb0a9cf28f4539cb4411bf7714901', '356-284', 'xxxx', 'xxxxxx', 'M', 0, 57000, 0, 3, 0, 0, 0, 0, 0, 0, 1768786751, 0, 20, NULL),
	(7, '4f4c0b717695c831b6f255802b644b058a4e7fe4', '446-346', 'vinicius', 'pinto', 'M', 0, 5000, 0, 2, 0, 0, 0, 0, 0, 0, 1768789429, 0, 20, NULL),
	(8, 'e868828864957945d7f522710c9305576ac41240', '831-968', 'Derik', 'Costa', 'M', 0, 4836300, 0, 3, 0, 0, 0, 0, 1206, 0, 1769444082, 0, 20, NULL),
	(9, '6cf84041fa2c214ffbd0b027a16acca9b149e389', '916-479', 'junim', 'bigode', 'M', 0, 5000, 0, 1, 0, 0, 0, 0, 0, 0, 1769449878, 0, 20, NULL),
	(10, 'f199ec3532365eeda3bae12b9f132809da64701f', '320-387', 'pinho', 'one', 'M', 0, 5000, 0, 2, 0, 0, 0, 0, 0, 0, 1769483652, 0, 20, NULL),
	(11, 'cc42ceee404ff607033b29587f48c2374da80465', '133-716', 'Carlos', 'Junior', 'M', 0, 356525, 0, 4, 0, 0, 0, 0, 2610, 0, 1769617894, 0, 20, NULL),
	(12, '0bde2c33b312dd02132fa1b96b413b9fd1609075', '135-087', 'kikiu', 'pcd', 'M', 0, 6350, 0, 3, 0, 0, 0, 0, 2222, 0, 1769636658, 0, 20, NULL),
	(13, 'e3a16c90d4497cd932d1c92d896e26451d48fde1', '773-005', 'leonardo', 'lousa', 'M', 0, 103400, 0, 1, 0, 0, 0, 0, 0, 0, 1769654172, 0, 20, NULL),
	(14, '54e6a3f6998441a88b2645ce8003115d05e9553c', '927-854', 'jaozinho ', 'lopes', 'M', 0, 5000, 0, 4, 0, 0, 0, 0, 0, 0, 1769722864, 0, 20, NULL);

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

-- Copiando dados para a tabela creawork.entitydata: ~24 rows (aproximadamente)
INSERT INTO `entitydata` (`dkey`, `dvalue`) VALUES
	('Mods:10:cg160', '{"extracolors":[0,0],"smokecolor":[255,255,255],"wheeltype":6,"xenonColor":255,"neon":{"1":false,"2":false,"3":false,"0":false},"dashColour":0,"lights":[0,0,0],"colors":[0,0],"interColour":0,"tint":-1,"var":{"24":false,"23":false},"plateIndex":0,"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":false,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"liverys":-1,"extras":[0,0,0,0,0,0,0,0,0,0,0,0],"platestyle":0}'),
	('Mods:11:bmwg07', '{"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":4,"17":false,"18":1,"19":false,"20":1,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"dashColour":0,"lights":[0,0,0],"xenonColor":255,"tint":1,"wheeltype":0,"liverys":-1,"var":{"24":false,"23":false},"plateIndex":0,"colors":[0,0],"extracolors":[0,0],"smokecolor":[1,1,1],"platestyle":0,"neon":{"1":false,"2":false,"3":false,"0":false},"interColour":0,"extras":[0,0,0,0,0,0,0,0,0,0,0,0]}'),
	('Mods:11:gt63', '{"liverys":0,"interColour":147,"wheeltype":0,"xenonColor":255,"neon":{"1":false,"2":false,"3":false,"0":false},"dashColour":147,"lights":[0,0,0],"colors":[12,147],"smokecolor":[255,255,255],"var":{"24":false,"23":false},"extras":[0,0,0,0,0,0,0,0,0,0,0,0],"plateIndex":0,"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":4,"12":-1,"13":-1,"14":-1,"15":3,"16":4,"17":false,"18":1,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"tint":1,"extracolors":[147,147],"platestyle":0}'),
	('Mods:11:landvelar', '{"liverys":-1,"interColour":0,"wheeltype":0,"xenonColor":255,"neon":{"1":false,"2":false,"3":false,"0":false},"dashColour":0,"lights":[0,0,0],"colors":[12,2],"smokecolor":[255,255,255],"var":{"24":false,"23":false},"extras":[0,0,0,0,0,0,0,0,0,0,0,1],"plateIndex":5,"mods":{"1":-1,"2":-1,"3":-1,"4":0,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":3,"12":-1,"13":-1,"14":-1,"15":-1,"16":4,"17":false,"18":1,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"tint":1,"extracolors":[134,156],"platestyle":5}'),
	('Mods:11:pop110i', '{"mods":{"1":-1,"2":-1,"3":-1,"4":0,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":3,"12":2,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":1,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"dashColour":0,"lights":[0,0,0],"xenonColor":255,"tint":-1,"wheeltype":6,"liverys":-1,"var":{"24":false,"23":false},"plateIndex":0,"colors":[111,0],"extracolors":[0,0],"smokecolor":[255,255,255],"platestyle":0,"neon":{"1":false,"2":false,"3":false,"0":false},"interColour":0,"extras":[0,1,0,0,0,0,0,0,0,0,0,0]}'),
	('Mods:11:saveiro', '{"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":3,"12":-1,"13":2,"14":-1,"15":3,"16":4,"17":false,"18":1,"19":false,"20":false,"21":false,"22":false,"23":66,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"dashColour":0,"lights":[0,0,0],"extras":[0,0,0,0,0,0,0,0,0,0,0,0],"tint":0,"neon":{"1":false,"2":false,"3":false,"0":false},"liverys":-1,"var":{"24":false,"23":false},"plateIndex":5,"colors":[4,0],"extracolors":[4,0],"smokecolor":[255,255,255],"wheeltype":0,"platestyle":5,"interColour":0,"xenonColor":255}'),
	('Mods:11:tenere1200', '{"mods":{"1":0,"2":0,"3":-1,"4":-1,"5":-1,"6":-1,"7":0,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":false,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"dashColour":0,"lights":[0,0,0],"xenonColor":255,"tint":-1,"wheeltype":6,"liverys":-1,"var":{"24":false,"23":false},"plateIndex":0,"colors":[0,0],"extracolors":[0,0],"smokecolor":[255,255,255],"platestyle":0,"neon":{"1":false,"2":false,"3":false,"0":false},"interColour":0,"extras":[0,0,1,0,1,0,0,0,0,0,0,0]}'),
	('Mods:11:tiger1200', '{"extracolors":[112,156],"smokecolor":[1,1,1],"wheeltype":6,"xenonColor":255,"neon":{"1":false,"2":false,"3":false,"0":false},"dashColour":0,"lights":[0,0,0],"colors":[42,112],"interColour":0,"tint":-1,"var":{"24":false,"23":false},"plateIndex":0,"mods":{"1":-1,"2":-1,"3":3,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":1,"11":3,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":1,"19":false,"20":1,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":0},"liverys":-1,"extras":[0,0,0,0,0,0,0,0,0,0,0,0],"platestyle":0}'),
	('Mods:11:xt2017', '{"mods":{"1":0,"2":0,"3":-1,"4":1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":1,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":0},"dashColour":0,"lights":[0,0,0],"xenonColor":255,"tint":-1,"wheeltype":6,"liverys":-1,"var":{"24":false,"23":false},"plateIndex":0,"colors":[111,131],"extracolors":[111,156],"smokecolor":[255,255,255],"platestyle":0,"neon":{"1":false,"2":false,"3":false,"0":false},"interColour":0,"extras":[0,0,0,0,0,0,0,0,0,0,0,0]}'),
	('Outfit:11', '{"mask":{"item":3,"texture":0},"pants":{"item":238,"texture":0},"accessory":{"item":0,"texture":0},"shoes":{"item":192,"texture":0},"ear":{"item":-1,"texture":0},"arms":{"item":46,"texture":0},"tshirt":{"item":15,"texture":0},"bracelet":{"item":-1,"texture":0},"vest":{"item":0,"texture":0},"glass":{"item":0,"texture":0},"torso":{"item":322,"texture":0},"hat":{"item":-1,"texture":0},"watch":{"item":-1,"texture":0},"decals":{"item":0,"texture":0},"backpack":{"item":0,"texture":0}}'),
	('Permissions:2BPChq', '{"1":1}'),
	('Permissions:Admin', '{"13":1,"12":3,"3":1,"2":1,"8":1,"7":1,"6":1,"10":1,"11":1,"1":1}'),
	('Permissions:Advogado', '{"1":1}'),
	('Permissions:AutoSport', '{"1":1,"10":2,"11":1}'),
	('Permissions:Baep', '{"1":1,"6":1,"2":1}'),
	('Permissions:Escocia', '{"1":1}'),
	('Permissions:Franca', '{"8":5}'),
	('Permissions:Harmony', '{"1":1}'),
	('Permissions:Hospital', '{}'),
	('Permissions:Hotel', '{"1":1}'),
	('Permissions:Pcc', '{"1":1}'),
	('Permissions:Pcesp', '{"1":1}'),
	('Permissions:Pmesp', '{"1":1,"13":2}'),
	('Permissions:Policia', '{"1":1}'),
	('Permissions:Premium', '{"1":0}'),
	('Permissions:Prf', '[]'),
	('Permissions:Som', '{"1":1,"2":1}'),
	('Permissions:Suecia', '{"1":1}'),
	('Permissions:Vanilla', '{"1":1}'),
	('Warehouse:124', '{"1":{"amount":1,"item":"WEAPON_ASSAULTRIFLE_MK2-1768355151-HE51RD"}}');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.fines: ~3 rows (aproximadamente)
INSERT INTO `fines` (`id`, `Passport`, `Name`, `Date`, `Hour`, `Value`, `Message`) VALUES
	(1, 1, 'HIDEN STORE', '2026-01-20', '00:40:02', 1000000, 'teste'),
	(2, 10, 'pinho one', '26/01/2026', '00:28', 362, 'Multa de Velocidade'),
	(3, 11, 'Carlos Junior', '26/01/2026', '19:19', 272, 'Multa de Velocidade');

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
	('1BPChq', '{}', NULL, NULL, 0, '', 0, '{}', '{"Coronel Bope":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Cabo Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Tenente 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Subtenente 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Sargento 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Sargento Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Tenente 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Major Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Cabo 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Tenente Coronel 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Tenente Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Tenente Coronel Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Sargento Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Sargento Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Tenente Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Coronel 1BPChq":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Major 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Capitão 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Sargento 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Subtenente Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Sargento 1BPChq":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Capitão Bope":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('3Pontes', '{}', NULL, NULL, 0, '', 0, '{}', '{"Soldado 3Pontes":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono 3Pontes":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Frente 3Pontes":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor 3Pontes":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente 3Pontes":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Radinho 3Pontes":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('5Bocas', '{}', NULL, NULL, 0, '', 0, '{}', '{"Dono 5Bocas":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Radinho 5Bocas":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente 5Bocas":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor 5Bocas":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Frente 5Bocas":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado 5Bocas":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Admin', '{}', NULL, NULL, 0, '', 0, '{}', '{"Suporte Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"Administrador Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"Helper Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"COO Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"Founder Admin":{"deposit":true,"withdraw":true,"demote":true,"promote":true,"invite":true,"alerts":true,"dismiss":true,"leader":true,"chat":true,"message":true},"Moderador Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"Diretor Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"SS Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false},"Supervisor Admin":{"deposit":false,"withdraw":false,"demote":false,"promote":false,"invite":false,"alerts":false,"dismiss":false,"leader":false,"chat":false,"message":false}}', '{}', '{}'),
	('AutoSport', '{}', NULL, NULL, 0, '', 0, '{}', '{"Chefe AutoSport":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Mecanico AutoSport":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"MecAuxilar AutoSport":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Membro AutoSport":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente AutoSport":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono AutoSport":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true}}', '{}', '{}'),
	('Bloods', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Membro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Conselheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Bope', '{}', NULL, NULL, 0, '', 0, '{}', '{"Segundo Tenente Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Segundo Sargento Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Soldado Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Capitão Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Tenente Coronel Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Terceiro Sargento Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Primeiro Tenente Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Subtenente Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Primeiro Sargento Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Cabo Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Major Bope":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Coronel Bope":{"deposit":true,"message":true,"withdraw":true,"chat":true,"alerts":true,"promote":true,"leader":true,"demote":true,"invite":true,"dismiss":true}}', '{}', '{}'),
	('Brasilandia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente Brasilandia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Sub-Chefe Brasilandia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Brasilandia":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Conselheiro Brasilandia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Brasilandia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('BurgerShot', '{}', NULL, NULL, 0, '', 2340000, '[{"date":"29/01/2026 15:13:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 15:23:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 15:33:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 15:43:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 15:53:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 16:03:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 16:13:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 16:23:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 16:33:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 16:43:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 16:53:25","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":4000,"name":"BurgerShot"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":4000,"name":"BurgerShot"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":4000,"name":"BurgerShot"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"BurgerShot","value":4000},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"BurgerShot","value":4000}]', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Membro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Conselheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Camara', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente Camara":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor Camara":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Camara":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono Camara":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Frente Camara":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Radinho Camara":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Chapadao', '{}', NULL, NULL, 0, '', 0, '{}', '{"Frente Chapadao":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor Chapadao":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Chapadao":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono Chapadao":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Radinho Chapadao":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente Chapadao":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('China', '{}', NULL, NULL, 0, '', 0, '{}', '{"Chefe China":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Membro China":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Sub-Chefe China":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Conselheiro China":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Gerente China":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Choque', '{}', NULL, NULL, 0, '', 0, '{}', '{"Primeiro Tenente Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Sargento Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Capitão Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Cabo Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Tenente Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Subtenente Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Coronel Choque":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Major Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Tenente Coronel Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Sargento Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Sargento Choque":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('CidadeAlta', '{}', NULL, NULL, 0, '', 0, '{}', '{"Radinho CidadeAlta":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor CidadeAlta":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Frente CidadeAlta":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado CidadeAlta":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono CidadeAlta":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Gerente CidadeAlta":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Core', '{}', NULL, NULL, 0, '', 0, '{}', '{"Cabo Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Tenente Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Subtenente Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Tenente Coronel Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Tenente Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Capitão Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Major Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Coronel Core":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Primeiro Sargento Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Sargento Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Sargento Core":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Croacia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Chefe Croacia":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Gerente Croacia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Sub-Chefe Croacia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Croacia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Conselheiro Croacia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Desmanche01', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Dick', '{}', NULL, NULL, 0, '', 0, '{}', '{"Vapor Dick":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono Dick":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Frente Dick":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Dick":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Radinho Dick":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente Dick":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('EastCustoms', '{}', NULL, NULL, 0, '', 0, '{}', '{"Mecanico EastCustoms":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono EastCustoms":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"MecAuxilar EastCustoms":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente EastCustoms":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Membro EastCustoms":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe EastCustoms":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true}}', '{}', '{}'),
	('Emergency', '{}', NULL, NULL, 0, '', 0, '{}', '{"Chefe":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('Escocia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente Escocia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Escocia":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Sub-Chefe Escocia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Conselheiro Escocia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Escocia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Exercito', '{}', NULL, NULL, 0, '', 0, '{}', '{"General de Divisão Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"General de Brigada Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Sargento Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Coronel Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Recruta Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Sargento Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Major Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Tenente Coronel Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"General de Exército Exercito":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"General de Brigada":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Tenente Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Sargento Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"General de Divisão":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Capitão Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"General de Exército":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Aspirante à Oficial Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Tenente Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Sub Tenente Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Cabo Exercito":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela01', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela02', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela03', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela04', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela05', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela06', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela07', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela08', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela09', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela10', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela11', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Favela12', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Franca', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe Franca":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Franca":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Gerente Franca":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Franca":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Conselheiro Franca":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Fuba', '{}', NULL, NULL, 0, '', 0, '{}', '{"Soldado Fuba":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Radinho Fuba":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente Fuba":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor Fuba":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono Fuba":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Frente Fuba":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Hospital', '{}', NULL, 'https://cdn.discordapp.com/attachments/955945917251473488/1428813433230590093/Untitled_design.png?ex=696fcab4&is=696e7934&hm=a837709d8584151e5751edf4007ce0ba7963b239857dc9309a389c3a341b7990&', 134, '', 10000, '[{"name":"HIDEN STORE","type":"DEPÓSITO","userid":1,"date":"20/01/2026 00:46:06","value":10000}]', '{"Diretor Hospital":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Medico Hospital":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Paramedico Hospital":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Enfermeiro Hospital":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Israel', '{}', NULL, NULL, 0, '', 0, '{}', '{"Conselheiro Israel":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Israel":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Gerente Israel":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Israel":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Sub-Chefe Israel":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Jacare', '{}', NULL, NULL, 0, '', 0, '{}', '{"Soldado Jacare":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Frente Jacare":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Radinho Jacare":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor Jacare":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente Jacare":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono Jacare":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true}}', '{}', '{}'),
	('Jorgeturco', '{}', NULL, NULL, 0, '', 0, '{}', '{"Frente Jorgeturco":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente Jorgeturco":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Jorgeturco":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono Jorgeturco":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Vapor Jorgeturco":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Radinho Jorgeturco":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Juridic', '{}', NULL, NULL, 0, '', 4680000, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":8000,"name":"Juridic"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 17:54:37","type":"SALÁRIO FAC","value":8000,"name":"Juridic"},{"date":"29/01/2026 18:04:37","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 18:14:37","type":"SALÁRIO FAC","value":8000,"name":"Juridic"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"Juridic","value":8000},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"Juridic","value":8000}]', '{"Advogado":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Juiz":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Promotor":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Lester', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Membro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Conselheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Mafia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Membro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Conselheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Mecanica01', '{}', NULL, NULL, 0, '', 2925000, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":5000,"name":"Mecanica01"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 17:54:38","type":"SALÁRIO FAC","value":5000,"name":"Mecanica01"},{"date":"29/01/2026 18:04:38","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":5000,"name":"Mecanica01"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"Mecanica01","value":5000},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"Mecanica01","value":5000}]', '{"Borracheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Mêcanico":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Mecanica02', '{}', NULL, NULL, 0, '', 2925000, '[{"date":"29/01/2026 15:13:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 15:23:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 15:33:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 15:43:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 15:53:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 16:03:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 16:13:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 16:23:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 16:33:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 16:43:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 16:53:25","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":5000,"name":"Mecanica02"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":5000,"name":"Mecanica02"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":5000,"name":"Mecanica02"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"Mecanica02","value":5000},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"Mecanica02","value":5000}]', '{"Borracheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Mêcanico":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Mechanic', '{}', NULL, NULL, 0, '', 2925000, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":5000,"name":"Mechanic"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 17:54:37","type":"SALÁRIO FAC","value":5000,"name":"Mechanic"},{"date":"29/01/2026 18:04:38","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":5000,"name":"Mechanic"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"Mechanic","value":5000},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"Mechanic","value":5000}]', '{"Borracheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Mêcanico":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('NovaHolanda', '{}', NULL, NULL, 0, '', 0, '{}', '{"Dono NovaHolanda":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Vapor NovaHolanda":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado NovaHolanda":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Frente NovaHolanda":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Radinho NovaHolanda":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente NovaHolanda":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Paramedic', '{}', NULL, NULL, 0, '', 2925000, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 17:34:34","type":"SALÁRIO FAC","value":5000,"name":"Paramedic"},{"date":"29/01/2026 17:44:34","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 17:54:34","type":"SALÁRIO FAC","value":5000,"name":"Paramedic"},{"date":"29/01/2026 18:04:34","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 18:14:34","type":"SALÁRIO FAC","value":5000,"name":"Paramedic"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"Paramedic","value":5000},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"Paramedic","value":5000}]', '{"Médico":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Conselheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Doutor":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true}}', '{}', '{}'),
	('Pcc', '{}', NULL, NULL, 0, '', 0, '{}', '{"Conselheiro Pcc":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Sub-Chefe Pcc":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Gerente Pcc":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Pcc":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Membro Pcc":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Pcesp', '{}', NULL, NULL, 0, '', 0, '{}', '{"Perito Criminal Pcerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Escrivão Pcesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Médico Legista Pcesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Auxiliar de Papiloscopista Pcesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Delegado Pcesp":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Perito Criminal Pcesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Escrivão Pcerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Investigador Pcerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Auxiliar de Papiloscopista Pcerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Médico Legista Pcerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Investigador Pcesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Delegado Pcerj":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true}}', '{}', '{}'),
	('Pedreira', '{}', NULL, NULL, 0, '', 0, '{}', '{"Vapor Pedreira":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Frente Pedreira":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Radinho Pedreira":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono Pedreira":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Gerente Pedreira":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Pedreira":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Penha', '{}', NULL, NULL, 0, '', 0, '{}', '{"Radinho Penha":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono Penha":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Frente Penha":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Penha":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente Penha":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor Penha":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Pmerj', '{}', NULL, NULL, 0, '', 0, '{}', '{"Major Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Primeiro Aluno Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Comandante Geral Pmerj":{"deposit":true,"message":true,"withdraw":true,"chat":true,"alerts":true,"promote":true,"leader":true,"demote":true,"invite":true,"dismiss":true},"Aspirante a Oficial Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Soldado Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Subtenente Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Segundo Aluno Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Coronel Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Primeiro Tenente Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Aluno Sargento Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Tenente Coronel Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Capitão Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Terceiro Aluno Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Primeiro Sargento Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Segundo Sargento Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Terceiro Sargento Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Aluno Csta Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Segundo Tenente Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Cabo Pmerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false}}', '{}', '{}'),
	('Pmesp', '{}', NULL, NULL, 132, '', 0, '{}', '{"Terceiro Aluno Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Aspirante a Oficial Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Tenente Coronel Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Tenente Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Aspirante a Oficial Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Tenente Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Sargento Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Major Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Sargento Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Aluno Sargento Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Capitão Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Aluno Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Tenente Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Aluno Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Cabo Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Subtenente Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Coronel Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Aluno Sargento Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Aluno Csta Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Sargento Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Subtenente Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Sargento Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Major Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Sargento Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Tenente Coronel Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Tenente Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Aluno Csta Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Cabo Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Aluno Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Comandante Geral Pmesp":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Comandante Geral Pmerj":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Primeiro Sargento Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Coronel Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Aluno Pmesp":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Aluno Pmerj":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Police', '{}', NULL, NULL, 0, '', 23400000, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":40000,"name":"Police"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 17:54:37","type":"SALÁRIO FAC","value":40000,"name":"Police"},{"date":"29/01/2026 18:04:38","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":40000,"name":"Police"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"Police","value":40000},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"Police","value":40000}]', '{"Delegado":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Coronel":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Prfe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dip":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('PoliciaFederal', '{}', NULL, NULL, 0, '', 0, '{}', '{"COT PoliciaFederal":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Perito Criminal PoliciaFederal":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Agente PF PoliciaFederal":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Escrivao PoliciaFederal":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Delegado PoliciaFederal":{"deposit":true,"message":true,"withdraw":true,"chat":true,"alerts":true,"promote":true,"leader":true,"demote":true,"invite":true,"dismiss":true}}', '{}', '{}'),
	('Premium', '{}', NULL, NULL, 0, '', 819000, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 16:33:27","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 16:53:27","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1400,"name":"Premium"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 17:54:37","type":"SALÁRIO FAC","value":1400,"name":"Premium"},{"date":"29/01/2026 18:04:38","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":1400,"name":"Premium"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"Premium","value":1400},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"Premium","value":1400}]', '{"Prata":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Spotify":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Diamante":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Platina":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Ouro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Bronze":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Prf', '{}', NULL, NULL, 0, '', 0, '{}', '{"Capitão Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Aluno Sargento Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Sargento Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Aluno Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Tenente Coronel Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Aluno Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Sargento Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Major Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Aspirante a Oficial Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Comandante Geral Prf":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Primeiro Tenente Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Cabo Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Aluno Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Tenente Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Aluno Csta Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Subtenente Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Coronel Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Sargento Prf":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Prfe', '{}', NULL, NULL, 0, '', 2925000, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":5000,"name":"Prfe"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 17:54:38","type":"SALÁRIO FAC","value":5000,"name":"Prfe"},{"date":"29/01/2026 18:04:38","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":5000,"name":"Prfe"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"Prfe","value":5000},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"Prfe","value":5000}]', '{"Sargento":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Corporal":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Oficial":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Capitão":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Cadete":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Tenente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Qg01', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Qg02', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Morador":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Traficante":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapo":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Recom', '{}', NULL, NULL, 0, '', 0, '{}', '{"Cabo Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Tenente Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Coronel Recom":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Subtenente Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Sargento Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Capitão Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Terceiro Sargento Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Segundo Sargento Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Primeiro Tenente Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Major Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Tenente Coronel Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Recom":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Restaurants', '{}', NULL, NULL, 0, '', 0, '{}', '{"Chefe":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('Sapo', '{}', NULL, NULL, 0, '', 0, '{}', '{"Escrivão Pcerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Delegado Pcerj":{"deposit":true,"message":true,"withdraw":true,"chat":true,"alerts":true,"promote":true,"leader":true,"demote":true,"invite":true,"dismiss":true},"Investigador Pcerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Auxiliar de Papiloscopista Pcerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Médico Legista Pcerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false},"Perito Criminal Pcerj":{"deposit":false,"message":false,"withdraw":false,"chat":false,"alerts":false,"promote":false,"leader":false,"demote":false,"invite":false,"dismiss":false}}', '{}', '{}'),
	('Serrinha', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente Serrinha":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Frente Serrinha":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Radinho Serrinha":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor Serrinha":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono Serrinha":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Soldado Serrinha":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Spotify', '{}', NULL, NULL, 0, '', 0, '{}', '{"Spotify":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('Suecia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Membro Suecia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Conselheiro Suecia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Suecia":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true},"Sub-Chefe Suecia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Gerente Suecia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false}}', '{}', '{}'),
	('Triads', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Membro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Conselheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Turquia', '{}', NULL, NULL, 0, '', 0, '{}', '{"Gerente Turquia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Sub-Chefe Turquia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Membro Turquia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Conselheiro Turquia":{"withdraw":false,"alerts":false,"demote":false,"promote":false,"deposit":false,"dismiss":false,"message":false,"invite":false,"leader":false,"chat":false},"Chefe Turquia":{"withdraw":true,"alerts":true,"demote":true,"promote":true,"deposit":true,"dismiss":true,"message":true,"invite":true,"leader":true,"chat":true}}', '{}', '{}'),
	('Vagos', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Membro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Conselheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Vanilla', '{}', NULL, NULL, 0, '', 0, '{}', '{"Sub-Chefe":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Membro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Chefe":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Conselheiro":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('Verificado', '{}', NULL, NULL, 0, '', 0, '{}', '{"Verificado":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('Verify', '{}', NULL, NULL, 0, '', 0, '{}', '{"Verify":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('Vidigal', '{}', NULL, NULL, 0, '', 0, '{}', '{"Dono Vidigal":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Radinho Vidigal":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Gerente Vidigal":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado Vidigal":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Frente Vidigal":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor Vidigal":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}'),
	('VipApoiador', '{}', NULL, NULL, 0, '', 789750, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1350,"name":"VipApoiador"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":1350,"name":"VipApoiador"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":1350,"name":"VipApoiador"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"VipApoiador","value":1350},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"VipApoiador","value":1350}]', '{"Vip Apoiador":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipAposentado', '{}', NULL, NULL, 0, '', 789750, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1350,"name":"VipAposentado"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 17:54:38","type":"SALÁRIO FAC","value":1350,"name":"VipAposentado"},{"date":"29/01/2026 18:04:38","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":1350,"name":"VipAposentado"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"VipAposentado","value":1350},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"VipAposentado","value":1350}]', '{"Vip Aposentado":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipBaby', '{}', NULL, NULL, 0, '', 585000, '[{"date":"29/01/2026 15:13:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 15:23:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 15:33:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 15:43:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 15:53:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 16:03:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 16:13:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 16:23:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 16:33:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 16:43:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 16:53:24","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1000,"name":"VipBaby"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 17:54:37","type":"SALÁRIO FAC","value":1000,"name":"VipBaby"},{"date":"29/01/2026 18:04:37","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":1000,"name":"VipBaby"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"VipBaby","value":1000},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"VipBaby","value":1000}]', '{"Vip Baby":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipBarao', '{}', NULL, NULL, 0, '', 1105650, '[{"date":"29/01/2026 15:13:24","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 15:23:24","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 15:33:24","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 15:43:24","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 15:53:24","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 16:03:24","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 16:13:24","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 16:23:24","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 16:33:24","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 16:43:25","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 16:53:25","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1890,"name":"VipBarao"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":1890,"name":"VipBarao"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":1890,"name":"VipBarao"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"VipBarao","value":1890},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"VipBarao","value":1890}]', '{"Vip Barão":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipBooster', '{}', NULL, NULL, 0, '', 409500, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":700,"name":"VipBooster"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":700,"name":"VipBooster"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":700,"name":"VipBooster"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"VipBooster","value":700},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"VipBooster","value":700}]', '{"VipBooster":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipChefao', '{}', NULL, NULL, 0, '', 1009125, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1725,"name":"VipChefao"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 17:54:37","type":"SALÁRIO FAC","value":1725,"name":"VipChefao"},{"date":"29/01/2026 18:04:38","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":1725,"name":"VipChefao"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"VipChefao","value":1725},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"VipChefao","value":1725}]', '{"Vip Chefão":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipCLT', '{}', NULL, NULL, 0, '', 473850, '[{"date":"29/01/2026 15:13:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 15:23:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 15:33:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 15:43:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 15:53:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 16:03:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 16:13:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 16:23:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 16:33:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 16:43:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 16:53:25","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":810,"name":"VipCLT"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":810,"name":"VipCLT"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":810,"name":"VipCLT"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"VipCLT","value":810},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"VipCLT","value":810}]', '{"Vip CLT":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipDesempregado', '{}', NULL, NULL, 0, '', 0, '{}', '{"Vip Desempregado":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipEmpreendedor', '{}', NULL, NULL, 0, '', 663390, '[{"date":"29/01/2026 15:13:24","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 15:23:24","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 15:33:24","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 15:43:24","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 15:53:24","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 16:03:24","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 16:13:24","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 16:23:24","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 16:33:24","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 16:43:25","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 16:53:25","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1134,"name":"VipEmpreendedor"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":1134,"name":"VipEmpreendedor"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":1134,"name":"VipEmpreendedor"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"VipEmpreendedor","value":1134}]', '{"Vip Empreendedor":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipGangster', '{}', NULL, NULL, 0, '', 892125, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1525,"name":"VipGangster"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":1525,"name":"VipGangster"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":1525,"name":"VipGangster"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"VipGangster","value":1525},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"VipGangster","value":1525}]', '{"Vip Gangster":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipHeliVip', '{}', NULL, NULL, 0, '', 0, '{}', '{"VipHeliVip":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipHospital', '{}', NULL, NULL, 0, '', 877500, '[{"date":"29/01/2026 15:13:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 15:23:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 15:33:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 15:43:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 15:53:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 16:03:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 16:13:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 16:23:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 16:33:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 16:43:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 16:53:25","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1500,"name":"VipHospital"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 17:54:37","type":"SALÁRIO FAC","value":1500,"name":"VipHospital"},{"date":"29/01/2026 18:04:37","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":1500,"name":"VipHospital"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"VipHospital","value":1500},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"VipHospital","value":1500}]', '{"Vip Hospital":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipImperial', '{}', NULL, NULL, 0, '', 1474200, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":2520,"name":"VipImperial"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":2520,"name":"VipImperial"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":2520,"name":"VipImperial"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"VipImperial","value":2520},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"VipImperial","value":2520}]', '{"Vip Imperial":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipInfluencer', '{}', NULL, NULL, 0, '', 585000, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1000,"name":"VipInfluencer"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":1000,"name":"VipInfluencer"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":1000,"name":"VipInfluencer"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"VipInfluencer","value":1000}]', '{"Vip Influencer":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipMafia', '{}', NULL, NULL, 0, '', 775125, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 16:33:27","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1325,"name":"VipMafia"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":1325,"name":"VipMafia"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":1325,"name":"VipMafia"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"VipMafia","value":1325},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"VipMafia","value":1325}]', '{"Vip Mafia":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipMecanica', '{}', NULL, NULL, 0, '', 877500, '[{"date":"29/01/2026 15:13:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 15:23:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 15:33:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 15:43:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 15:53:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 16:03:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 16:13:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 16:23:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 16:33:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 16:43:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 16:53:25","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1500,"name":"VipMecanica"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 17:54:38","type":"SALÁRIO FAC","value":1500,"name":"VipMecanica"},{"date":"29/01/2026 18:04:38","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":1500,"name":"VipMecanica"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"VipMecanica","value":1500},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"VipMecanica","value":1500}]', '{"Vip Mecânica":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipNobre', '{}', NULL, NULL, 0, '', 930150, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 16:33:28","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1590,"name":"VipNobre"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 17:54:37","type":"SALÁRIO FAC","value":1590,"name":"VipNobre"},{"date":"29/01/2026 18:04:38","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":1590,"name":"VipNobre"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 18:43:53","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 18:53:53","type":"SALÁRIO FAC","name":"VipNobre","value":1590},{"date":"29/01/2026 19:03:53","type":"SALÁRIO FAC","name":"VipNobre","value":1590}]', '{"Vip Nobre":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipPolice', '{}', NULL, NULL, 0, '', 585000, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 16:33:27","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":1000,"name":"VipPolice"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 17:54:36","type":"SALÁRIO FAC","value":1000,"name":"VipPolice"},{"date":"29/01/2026 18:04:36","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 18:14:36","type":"SALÁRIO FAC","value":1000,"name":"VipPolice"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"VipPolice","value":1000},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"VipPolice","value":1000}]', '{"Vip Police":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipRei/Rainha', '{}', NULL, NULL, 0, '', 1365390, '[{"date":"29/01/2026 15:13:27","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 15:23:27","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 15:33:27","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 15:43:27","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 15:53:27","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 16:03:27","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 16:13:27","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 16:23:27","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 16:33:27","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 16:43:28","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 16:53:28","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":2334,"name":"VipRei/Rainha"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 17:54:37","type":"SALÁRIO FAC","value":2334,"name":"VipRei/Rainha"},{"date":"29/01/2026 18:04:38","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":2334,"name":"VipRei/Rainha"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"VipRei/Rainha","value":2334}]', '{"Vip Rei/Rainha":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VipRoyalty', '{}', NULL, NULL, 0, '', 1883700, '[{"date":"29/01/2026 15:13:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 15:23:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 15:33:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 15:43:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 15:53:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 16:03:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 16:13:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 16:23:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 16:33:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 16:43:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 16:53:25","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 17:24:35","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 17:34:36","type":"SALÁRIO FAC","value":3220,"name":"VipRoyalty"},{"date":"29/01/2026 17:44:36","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 17:54:37","type":"SALÁRIO FAC","value":3220,"name":"VipRoyalty"},{"date":"29/01/2026 18:04:37","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 18:14:38","type":"SALÁRIO FAC","value":3220,"name":"VipRoyalty"},{"date":"29/01/2026 18:33:52","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 18:43:52","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 18:53:52","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220},{"date":"29/01/2026 19:03:52","type":"SALÁRIO FAC","name":"VipRoyalty","value":3220}]', '{"Vip Royalty":{"demote":true,"promote":true,"chat":true,"invite":true,"withdraw":true,"message":true,"alerts":true,"leader":true,"dismiss":true,"deposit":true}}', '{}', '{}'),
	('VJ', '{}', NULL, NULL, 0, '', 0, '{}', '{"Frente VJ":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Dono VJ":{"chat":true,"demote":true,"alerts":true,"leader":true,"deposit":true,"withdraw":true,"invite":true,"message":true,"dismiss":true,"promote":true},"Gerente VJ":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Soldado VJ":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Vapor VJ":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false},"Radinho VJ":{"chat":false,"demote":false,"alerts":false,"leader":false,"deposit":false,"withdraw":false,"invite":false,"message":false,"dismiss":false,"promote":false}}', '{}', '{}');

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

-- Copiando dados para a tabela creawork.five_orgs_player_infos: ~14 rows (aproximadamente)
INSERT INTO `five_orgs_player_infos` (`user_id`, `organization`, `joindate`, `lastlogin`, `timeplayed`) VALUES
	(1, 'AutoSport', 1768875852, 1769723539, 5497),
	(1, 'Hospital', 1768875852, 1769723539, 5497),
	(3, 'Admin', 1768880705, 1768880705, 0),
	(2, 'Admin', 1768880705, 1768880705, 0),
	(7, 'Admin', 1768880705, 1768880705, 0),
	(6, 'Admin', 1768880705, 1768880705, 0),
	(1, 'Admin', 1768880705, 1769723539, 5497),
	(1, 'Pcesp', 1768881163, 1769723539, 5497),
	(1, 'Pmesp', 1768881163, 1769723539, 5497),
	(1, 'Juridic', 1768945173, 1769723539, 5497),
	(11, 'Pmesp', 1769389086, 1769440449, 41317),
	(11, 'AutoSport', 1769398002, 1769440449, 33824),
	(13, 'Pmesp', 1769398598, 1769439565, 2614),
	(10, 'AutoSport', 1769443696, 1769443696, 0),
	(1, 'Premium', 1769642546, 1769723539, 0),
	(1, 'Vanilla', 1769645432, 1769723539, 0);

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
INSERT INTO `history` (`user_id`, `video_id`, `played_at`) VALUES
	(1, 'zctKiN-okXI', '2026-01-13 05:12:16'),
	(2, 'ed4Tl0EW5fg', '2026-01-13 17:57:48'),
	(2, 'ed4Tl0EW5fg', '2026-01-13 18:01:11'),
	(1, 'ZPcG9PCfagM', '2026-01-13 23:03:47'),
	(1, 'ZPcG9PCfagM', '2026-01-16 01:42:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.invoices: ~1 rows (aproximadamente)
INSERT INTO `invoices` (`id`, `Passport`, `Received`, `Type`, `Reason`, `Holder`, `Value`) VALUES
	(1, 1, 0, 'received', 'Cartão de Crédito', 'Loja: Compra De Veiculo', 1000);

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.mdt_penal_code: ~16 rows (aproximadamente)
INSERT INTO `mdt_penal_code` (`id`, `title`, `description`, `fine`, `sentence`, `type`) VALUES
	(1, 'Alta Velocidade', 'Transitar em velocidade superior a permitida.', 1000, 0, 0),
	(2, 'Estacionamento Irregular', 'Estacionar em local proibido.', 500, 0, 0),
	(3, 'Direção Perigosa', 'Colocar em risco a vida de outrem no trânsito.', 2000, 10, 0),
	(4, 'Veículo Irregular', 'Conduzir veículo sem condições de rodagem ou roubado.', 5000, 20, 0),
	(5, 'Desacato', 'Desacatar funcionário público no exercício da função.', 3000, 15, 0),
	(6, 'Danos ao Patrimônio', 'Destruir, inutilizar ou deteriorar coisa alheia.', 2500, 10, 0),
	(7, 'Ameaça', 'Ameaçar alguém, por palavra, escrito ou gesto.', 2000, 10, 0),
	(8, 'Vandalismo', 'Depredar patrimônio público ou privado.', 2000, 10, 0),
	(9, 'Roubo', 'Subtrair coisa móvel alheia, para si ou para outrem.', 5000, 30, 0),
	(10, 'Porte Ilegal de Armas', 'Portar arma de fogo sem autorização.', 10000, 40, 0),
	(11, 'Tráfico de Drogas', 'Vender, comprar, produzir ou guardar drogas.', 8000, 35, 0),
	(12, 'Tentativa de Fuga', 'Tentar fugir de abordagem policial.', 4000, 20, 0),
	(13, 'Homicídio', 'Matar alguém.', 50000, 100, 0),
	(14, 'Latrocínio', 'Roubo seguido de morte.', 60000, 120, 0),
	(15, 'Sequestro', 'Privar alguém de sua liberdade.', 30000, 60, 0),
	(16, 'Terrorismo', 'Prática de atos de terrorismo.', 100000, 200, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.mdt_records: ~1 rows (aproximadamente)
INSERT INTO `mdt_records` (`id`, `passport`, `officer_passport`, `type`, `reason`, `fine`, `sentence`, `date`) VALUES
	(1, 1, 1, 'Warning', 'null', 0, 0, 1768877996);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.mdt_reports: ~1 rows (aproximadamente)
INSERT INTO `mdt_reports` (`id`, `author_passport`, `title`, `description`, `type`, `date`, `archived`) VALUES
	(1, 1, '1', 'tgeste', NULL, 1768880614, 0);

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

-- Copiando estrutura para tabela creawork.organizations
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bank` int(20) NOT NULL DEFAULT 0,
  `premium` int(20) NOT NULL DEFAULT 0,
  `buff` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.organizations: ~9 rows (aproximadamente)
INSERT INTO `organizations` (`id`, `name`, `bank`, `premium`, `buff`) VALUES
	(1, 'Baep', 1999920, 1770951657, 1),
	(2, 'Admin', 0, 1770921133, 1),
	(3, 'AutoSport', 0, 0, 0),
	(4, '2BPChq', 21, 1770874274, 1),
	(5, 'Pcesp', 9, 0, 0),
	(6, 'Som', 0, 1770919532, 1),
	(7, 'Policia', 0, 1770937329, 1),
	(8, 'Hospital', 0, 0, 0),
	(9, 'Advogado', 0, 0, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.org_transactions: ~18 rows (aproximadamente)
INSERT INTO `org_transactions` (`id`, `name`, `Type`, `Value`, `author`, `author_name`) VALUES
	(1, 'Pcesp', 'entry', 10, 0, NULL),
	(2, 'Pcesp', 'exit', 1, 0, NULL),
	(3, '2BPChq', 'entry', 1, 0, NULL),
	(4, '2BPChq', 'entry', 1, 0, NULL),
	(5, '2BPChq', 'entry', 2, 0, NULL),
	(6, '2BPChq', 'entry', 1, 1, NULL),
	(7, '2BPChq', 'entry', 4, 1, NULL),
	(8, '2BPChq', 'entry', 11, 1, 'HIDEN STORE'),
	(9, '2BPChq', 'entry', 1, 1, 'HIDEN STORE'),
	(10, '2BPChq', 'exit', 1, 1, 'HIDEN STORE'),
	(11, '2BPChq', 'exit', 1, 1, 'HIDEN STORE'),
	(12, '2BPChq', 'entry', 2, 1, 'HIDEN STORE'),
	(13, 'Baep', 'entry', 1000000, 2, 'rebello rebell'),
	(14, 'Baep', 'entry', 10, 1, 'HIDEN STORE'),
	(15, 'Baep', 'entry', 10, 1, 'HIDEN STORE'),
	(16, 'Baep', 'entry', 100, 1, 'HIDEN STORE'),
	(17, 'Baep', 'exit', 200, 2, 'rebello rebell'),
	(18, 'Baep', 'entry', 1000000, 2, 'rebello rebell');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.painel_creative_transactions: ~1 rows (aproximadamente)
INSERT INTO `painel_creative_transactions` (`id`, `Type`, `Passport`, `Value`, `Transfer`, `Date`, `Permission`) VALUES
	(1, 'Deposit', 1, 100, NULL, 1768878050, 'Policia');

-- Copiando estrutura para tabela creawork.ph_craft
CREATE TABLE IF NOT EXISTS `ph_craft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `craftxp` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Copiando dados para a tabela creawork.ph_craft: ~1 rows (aproximadamente)
INSERT INTO `ph_craft` (`id`, `user_id`, `craftxp`) VALUES
	(1, 1, 80);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- Copiando dados para a tabela creawork.playerdata: ~111 rows (aproximadamente)
INSERT INTO `playerdata` (`Passport`, `dkey`, `dvalue`) VALUES
	(1, 'Ammos', '{"AMMO_9":55}'),
	(1, 'Attachs', '[]'),
	(1, 'Backpack', '{"backpackp":1770946998,"backpackg":1770946974,"backpackm":1770946990}'),
	(1, 'Barbershop', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(1, 'Clothings', '{"bracelet":{"item":-1,"texture":0},"ear":{"item":-1,"texture":0},"glass":{"item":-1,"texture":0},"watch":{"item":20,"texture":0},"shoes":{"item":69,"texture":0},"torso":{"item":55,"texture":0},"accessory":{"item":8,"texture":0},"backpack":{"item":0,"texture":0},"tshirt":{"item":55,"texture":0},"vest":{"item":8,"texture":0},"pants":{"item":35,"texture":0},"decals":{"item":0,"texture":0},"arms":{"item":0,"texture":0},"mask":{"item":0,"texture":0},"hat":{"item":13,"texture":2}}'),
	(1, 'Creator', '1'),
	(1, 'customVehicle:u1veh_t20placa_VEH10001', '{"suspensaoAr":1,"xenonControl":1,"neonControl":1}'),
	(1, 'Datatable', '{"Skin":"mp_m_freemode_01","Thirst":85,"Weight":110,"Armour":0,"Stress":0,"Health":200,"Inventory":{"2":{"amount":1,"item":"tijolomaconha"},"9":{"amount":1000000000,"item":"dollars"},"8":{"amount":1000000000,"item":"dollars"},"7":{"amount":1000000000,"item":"dollars"},"6":{"amount":999984950,"item":"dollars"},"34":{"amount":1,"item":"boneco4"},"1":{"amount":1,"item":"WEAPON_RPG-1769660895"},"33":{"amount":1,"item":"boneco3"},"12":{"amount":1000000000,"item":"dollars"},"13":{"amount":1000000000,"item":"dollars"},"35":{"amount":1,"item":"boneco5"},"37":{"amount":2,"item":"boneco7"},"38":{"amount":1,"item":"boneco8"},"14":{"amount":1000000000,"item":"dollars"},"42":{"amount":2,"item":"AMMO_9"},"43":{"amount":1,"item":"AMMO_556"},"44":{"amount":1,"item":"WEAPON_NAIL_AMMO"},"45":{"amount":1,"item":"AMMO_762"},"30":{"amount":1,"item":"boneco2"},"40":{"amount":1,"item":"boneco"},"10":{"amount":1000000000,"item":"dollars"},"11":{"amount":1000000000,"item":"dollars"},"29":{"amount":1,"item":"postbox"},"39":{"amount":1,"item":"papelao"},"41":{"amount":1,"item":"WEAPON_FLAMETHROWER_AMMO"},"36":{"amount":1,"item":"boneco6"}},"Pos":{"y":-627.23,"x":-1395.29,"z":30.31},"Hunger":85}'),
	(1, 'Experience', '{"Bus":0,"Milkman":0,"Minerman":0,"Postal":0,"Lumberman":0,"Tractor":0,"Delivery":0,"Taxi":0,"Transporter":0,"Garbageman":0,"Tows":0,"Trucker":0,"Fisherman":0,"Hunting":0}'),
	(1, 'Rolepass', '{"Premium":0,"Free":0,"RolepassBuy":true,"Points":0,"Finish":1769914800.0}'),
	(2, 'Ammos', '{"AMMO_9":70}'),
	(2, 'Attachs', '[]'),
	(2, 'Backpack', '{"backpackg":1770922953}'),
	(2, 'Barbershop', '[0,0,0,0,0,0,-1,-1,-1,71,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(2, 'Clothings', '{"mask":{"texture":0,"item":0},"bracelet":{"texture":0,"item":-1},"arms":{"texture":0,"item":15},"backpack":{"texture":0,"item":0},"glass":{"texture":0,"item":0},"tshirt":{"texture":0,"item":251},"hat":{"texture":0,"item":230},"decals":{"texture":0,"item":0},"accessory":{"texture":0,"item":0},"pants":{"texture":0,"item":0},"shoes":{"texture":0,"item":0},"vest":{"texture":0,"item":0},"watch":{"texture":0,"item":-1},"ear":{"texture":0,"item":-1},"torso":{"texture":0,"item":15}}'),
	(2, 'Creator', '1'),
	(2, 'Datatable', '{"Thirst":92,"Hunger":92,"Pos":{"y":-671.67,"x":-934.0,"z":26.08},"Health":172,"Weight":70,"Armour":0,"Skin":"mp_m_freemode_01","Stress":0,"Inventory":{"5":{"item":"cellphone-1768325492","amount":1},"4":{"item":"debitcard-2","amount":1},"10":{"item":"dronecontrol-1768332972","amount":1},"11":{"item":"drugtable","amount":7},"9":{"item":"hamburger-1768325492","amount":2},"8":{"item":"identity-2","amount":1},"7":{"item":"dollars","amount":49998003200},"6":{"item":"plasticbottle","amount":1},"12":{"item":"dollars2","amount":42000},"15":{"item":"radio-1768331684","amount":1},"1":{"item":"WEAPON_COMBATPISTOL-1768331623-62V694","amount":1},"3":{"item":"handcuff-1768330837","amount":1},"2":{"amount":1,"item":"WEAPON_DAGGER-1768332282"}}}'),
	(2, 'Experience', '{"Trucker":0,"Garbageman":0,"Postal":0,"Bus":0,"Taxi":0,"Tractor":0,"Minerman":0,"Lumberman":0,"Delivery":0,"Milkman":0,"Hunting":0,"Transporter":0,"Fisherman":0,"Tows":0}'),
	(2, 'Rolepass', '{"RolepassBuy":true,"Premium":0,"Finish":1769914800.0,"Points":0,"Free":0}'),
	(3, 'Ammos', '[]'),
	(3, 'Attachs', '[]'),
	(3, 'Backpack', '[]'),
	(3, 'Barbershop', '[0,0,0,0,0,0,0,0,0,2,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(3, 'Clothings', '{"accessory":{"texture":0,"item":0},"arms":{"texture":0,"item":0},"hat":{"texture":0,"item":-1},"watch":{"texture":0,"item":-1},"tshirt":{"texture":0,"item":1},"shoes":{"texture":0,"item":0},"bracelet":{"texture":0,"item":-1},"glass":{"texture":0,"item":0},"mask":{"texture":0,"item":0},"backpack":{"texture":0,"item":0},"torso":{"texture":0,"item":648},"ear":{"texture":0,"item":-1},"decals":{"texture":0,"item":0},"vest":{"texture":0,"item":0},"pants":{"texture":6,"item":196}}'),
	(3, 'Creator', '1'),
	(3, 'Datatable', '{"Hunger":91,"Stress":0,"Thirst":91,"Armour":0,"Health":200,"Weight":40,"Pos":{"x":97.11,"z":41.21,"y":6721.26},"Skin":"mp_m_freemode_01","Inventory":{"4":{"amount":1,"item":"identity-3"},"3":{"amount":2,"item":"water"},"2":{"amount":3,"item":"hamburger-1768325954"},"1":{"amount":1200,"item":"dollars"},"5":{"amount":1,"item":"cellphone-1768325954"}}}'),
	(3, 'Experience', '[]'),
	(4, 'Backpack', '[]'),
	(5, 'Ammos', '[]'),
	(5, 'Attachs', '[]'),
	(5, 'Backpack', '[]'),
	(5, 'Barbershop', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(5, 'Clothings', '{"vest":{"texture":0,"item":0},"backpack":{"texture":0,"item":0},"tshirt":{"texture":0,"item":1},"shoes":{"texture":0,"item":0},"torso":{"texture":0,"item":0},"bracelet":{"texture":0,"item":-1},"ear":{"texture":0,"item":-1},"mask":{"texture":0,"item":0},"watch":{"texture":0,"item":-1},"decals":{"texture":0,"item":0},"arms":{"texture":0,"item":0},"hat":{"texture":0,"item":-1},"glass":{"texture":0,"item":0},"accessory":{"texture":0,"item":0},"pants":{"texture":0,"item":0}}'),
	(5, 'Creator', '1'),
	(5, 'Datatable', '{"Skin":"mp_m_freemode_01","Pos":{"y":-77.06,"x":-2650.83,"z":17.59},"Armour":0,"Health":194,"Inventory":{"5":{"amount":1,"item":"cellphone-1768350246"},"4":{"amount":3,"item":"hamburger-1768350246"},"3":{"amount":1,"item":"identity-5"},"2":{"amount":1500,"item":"dollars"},"1":{"amount":56000,"item":"dollars2"},"6":{"amount":2,"item":"water"}},"Thirst":63,"Weight":40,"Stress":0,"Hunger":63}'),
	(5, 'Experience', '{"Bus":0,"Tractor":0,"Transporter":0,"Taxi":0,"Lumberman":0,"Tows":0,"Milkman":0,"Hunting":0,"Fisherman":0,"Trucker":0,"Garbageman":0,"Minerman":0,"Postal":0,"Delivery":0}'),
	(6, 'Ammos', '[]'),
	(6, 'Attachs', '[]'),
	(6, 'Backpack', '{"backpackg":1771130354}'),
	(6, 'Barbershop', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(6, 'Clothings', '{"pants":{"item":0,"texture":0},"arms":{"item":0,"texture":0},"ear":{"item":-1,"texture":0},"accessory":{"item":0,"texture":0},"watch":{"item":-1,"texture":0},"mask":{"item":0,"texture":0},"vest":{"item":0,"texture":0},"torso":{"item":0,"texture":0},"bracelet":{"item":-1,"texture":0},"decals":{"item":0,"texture":0},"glass":{"item":0,"texture":0},"backpack":{"item":0,"texture":0},"hat":{"item":-1,"texture":0},"shoes":{"item":0,"texture":0},"tshirt":{"item":1,"texture":0}}'),
	(6, 'Creator', '1'),
	(6, 'Datatable', '{"Weight":70,"Pos":{"z":98.66,"x":-2047.16,"y":2339.91},"Stress":0,"Health":190,"Inventory":{"11":{"item":"plasticbottle","amount":1},"10":{"item":"WEAPON_DAGGER-1768538397","amount":1},"2":{"item":"WEAPON_KARAMBIT-1768538408","amount":1},"3":{"item":"cellphone-1768527551","amount":1},"1":{"item":"tablecoke-1768529357","amount":1},"6":{"item":"water","amount":1},"7":{"item":"dollars","amount":101255},"4":{"item":"identity-6","amount":1},"5":{"item":"homekey-000339-154","amount":1},"8":{"item":"backpackg","amount":1},"9":{"item":"WEAPON_BOTTLE","amount":1}},"Skin":"mp_m_freemode_01","Armour":0,"Hunger":77,"Thirst":77}'),
	(6, 'Experience', '{"Trucker":0,"Bus":0,"Minerman":0,"Tractor":0,"Postal":0,"Taxi":0,"Delivery":0,"Tows":0,"Garbageman":0,"Fisherman":0,"Milkman":0,"Lumberman":0,"Transporter":0,"Hunting":0}'),
	(6, 'Rolepass', '{"Points":0,"Finish":1769914800.0,"Free":0,"Premium":0,"RolepassBuy":true}'),
	(7, 'Ammos', '[]'),
	(7, 'Attachs', '[]'),
	(7, 'Backpack', '[]'),
	(7, 'Barbershop', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(7, 'Clothings', '{"vest":{"item":0,"texture":0},"pants":{"item":0,"texture":0},"bracelet":{"item":-1,"texture":0},"ear":{"item":-1,"texture":0},"backpack":{"item":0,"texture":0},"tshirt":{"item":1,"texture":0},"decals":{"item":0,"texture":0},"arms":{"item":0,"texture":0},"shoes":{"item":0,"texture":0},"glass":{"item":0,"texture":0},"torso":{"item":0,"texture":0},"accessory":{"item":0,"texture":0},"watch":{"item":-1,"texture":0},"hat":{"item":-1,"texture":0},"mask":{"item":0,"texture":0}}'),
	(7, 'Creator', '1'),
	(7, 'Datatable', '{"Health":117,"Thirst":41,"Pos":{"z":27.04,"y":-5592.26,"x":4976.64},"Weight":40,"Inventory":{"6":{"item":"hamburger-1768530230","amount":3},"5":{"item":"identity-7","amount":1},"4":{"item":"dollars","amount":1200},"3":{"item":"cellphone-1768530230","amount":1},"2":{"item":"water","amount":2}},"Armour":0,"Stress":0,"Hunger":41,"Skin":"mp_m_freemode_01"}'),
	(7, 'Experience', '{"Postal":0,"Garbageman":0,"Transporter":0,"Fisherman":0,"Tractor":0,"Tows":0,"Taxi":0,"Bus":0,"Hunting":0,"Minerman":0,"Trucker":0,"Delivery":0,"Milkman":0,"Lumberman":0}'),
	(8, 'Ammos', '{"AMMO_556":64}'),
	(8, 'Attachs', '[]'),
	(8, 'Backpack', '{"backpackg":1771966239}'),
	(8, 'Barbershop', '[0,0,0,0,0,0,-1,-1,-1,21,61,29,0,0,0,0,0,0,0,0,29,1,0.99,61,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(8, 'Clothings', '{"pants":{"texture":2,"item":240},"glass":{"texture":0,"item":0},"arms":{"texture":0,"item":175},"accessory":{"texture":0,"item":0},"torso":{"texture":0,"item":632},"mask":{"texture":0,"item":0},"vest":{"texture":0,"item":0},"watch":{"texture":0,"item":-1},"bracelet":{"texture":0,"item":-1},"ear":{"texture":0,"item":-1},"decals":{"texture":0,"item":0},"backpack":{"texture":0,"item":0},"hat":{"texture":0,"item":188},"shoes":{"texture":0,"item":190},"tshirt":{"texture":0,"item":1}}'),
	(8, 'Creator', '1'),
	(8, 'Datatable', '{"Weight":70,"Pos":{"z":46.17,"x":356.34,"y":-362.72},"Stress":0,"Armour":0,"Inventory":{"13":{"item":"dollars2","amount":41},"12":{"item":"ATTACH_MAGAZINE","amount":1},"11":{"item":"ATTACH_FLASHLIGHT","amount":1},"10":{"item":"ATTACH_CROSSHAIR","amount":1},"2":{"item":"debitcard-8","amount":1},"3":{"item":"dollars","amount":2000},"1":{"item":"cellphone-1769184882","amount":1},"6":{"item":"AMMO_9","amount":11},"7":{"item":"dollars2","amount":100},"4":{"item":"WEAPON_PISTOL-1769662488-4TYO01","amount":1},"5":{"item":"energetic","amount":1},"14":{"item":"WEAPON_AR15-1769462442-2KYDA2","amount":1},"8":{"item":"WEAPON_PRECISIONRIFLE-1769659161-29ADW5","amount":1},"9":{"item":"vest-1769451460","amount":1}},"Skin":"mp_m_freemode_01","Health":132,"Hunger":96,"Thirst":96}'),
	(8, 'Experience', '{"Trucker":0,"Bus":0,"Milkman":0,"Garbageman":0,"Lumberman":0,"Taxi":0,"Delivery":0,"Tows":0,"Tractor":0,"Hunting":0,"Minerman":0,"Fisherman":0,"Transporter":0,"Postal":0}'),
	(8, 'Rolepass', '{"Points":0,"Premium":0,"RolepassBuy":false,"Free":0,"Finish":1769914800.0}'),
	(9, 'Ammos', '[]'),
	(9, 'Attachs', '[]'),
	(9, 'Backpack', '[]'),
	(9, 'Barbershop', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(9, 'Clothings', '{"glass":{"item":52,"texture":0},"tshirt":{"item":1,"texture":0},"mask":{"item":0,"texture":0},"vest":{"item":0,"texture":0},"watch":{"item":-1,"texture":0},"ear":{"item":-1,"texture":0},"bracelet":{"item":-1,"texture":0},"pants":{"item":243,"texture":0},"arms":{"item":200,"texture":0},"accessory":{"item":196,"texture":0},"torso":{"item":653,"texture":0},"shoes":{"item":192,"texture":0},"backpack":{"item":0,"texture":0},"decals":{"item":0,"texture":0},"hat":{"item":231,"texture":0}}'),
	(9, 'Creator', '1'),
	(9, 'Datatable', '{"Armour":0,"Health":191,"Stress":0,"Skin":"mp_m_freemode_01","Inventory":{"10":{"item":"dollars","amount":100},"20":{"item":"water","amount":2},"9":{"item":"dollars","amount":100},"7":{"item":"dollars","amount":100},"12":{"item":"dollars","amount":100},"13":{"item":"dollars","amount":100},"14":{"item":"dollars","amount":100},"3":{"item":"dollars","amount":100},"4":{"item":"dollars","amount":100},"1":{"item":"gift","amount":1},"2":{"item":"identity-9","amount":1},"18":{"item":"hamburger-1769190678","amount":3},"16":{"item":"dollars","amount":100},"15":{"item":"dollars","amount":100},"19":{"item":"cellphone-1769190678","amount":1},"17":{"item":"dollars","amount":100},"6":{"item":"dollars","amount":100},"5":{"item":"dollars","amount":100},"8":{"item":"dollars","amount":100},"11":{"item":"dollars","amount":100}},"Thirst":95,"Pos":{"x":908.71,"y":-2181.73,"z":39.26},"Weight":40,"Hunger":95}'),
	(9, 'Experience', '[]'),
	(10, 'Ammos', '[]'),
	(10, 'Attachs', '[]'),
	(10, 'Backpack', '[]'),
	(10, 'Barbershop', '[0,0,0,0,0,0,0,0,0,10,61,0,0,0,0,0,0,0,12,0.99,61,3,0.99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(10, 'Clothings', '{"mask":{"item":0,"texture":0},"pants":{"item":16,"texture":0},"arms":{"item":15,"texture":0},"watch":{"item":-1,"texture":0},"ear":{"item":-1,"texture":0},"vest":{"item":0,"texture":0},"bracelet":{"item":-1,"texture":0},"backpack":{"item":0,"texture":0},"accessory":{"item":0,"texture":0},"tshirt":{"item":254,"texture":0},"shoes":{"item":34,"texture":0},"hat":{"item":143,"texture":0},"glass":{"item":0,"texture":0},"decals":{"item":0,"texture":0},"torso":{"item":15,"texture":0}}'),
	(10, 'Creator', '1'),
	(10, 'Datatable', '{"Weight":40,"Thirst":91,"Inventory":{"19":{"item":"cellphone-1769224452","amount":1},"18":{"item":"hamburger-1769224452","amount":3},"2":{"item":"identity-10","amount":1},"5":{"item":"dollars","amount":50},"7":{"item":"dollars","amount":100},"6":{"item":"dollars","amount":100},"20":{"item":"water","amount":2},"8":{"item":"dollars","amount":100},"17":{"item":"dollars","amount":50}},"Pos":{"y":-797.09,"x":369.87,"z":29.28},"Stress":0,"Armour":0,"Hunger":91,"Skin":"mp_m_freemode_01","Health":135}'),
	(10, 'Experience', '{"Trucker":0,"Postal":0,"Fisherman":0,"Delivery":0,"Taxi":0,"Milkman":0,"Tractor":0,"Lumberman":0,"Minerman":0,"Tows":0,"Hunting":0,"Transporter":0,"Bus":0,"Garbageman":0}'),
	(10, 'Rolepass', '{"Points":0,"Finish":1769914800.0,"Premium":0,"Free":0,"RolepassBuy":false}'),
	(11, 'Ammos', '{"AMMO_556":227,"AMMO_9":230}'),
	(11, 'Attachs', '[]'),
	(11, 'Backpack', '{"backpackg":1771966190}'),
	(11, 'Barbershop', '[0,15,0,0,0,0,0,0,0,21,61,0,0,0,0,0,0,0,12,0.99,61,3,0.99,61,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(11, 'Clothings', '{"mask":{"item":3,"texture":0},"tshirt":{"item":15,"texture":0},"arms":{"item":46,"texture":0},"ear":{"item":-1,"texture":0},"glass":{"item":0,"texture":0},"pants":{"item":238,"texture":0},"bracelet":{"item":-1,"texture":0},"backpack":{"item":0,"texture":0},"watch":{"item":-1,"texture":0},"accessory":{"item":0,"texture":0},"shoes":{"item":192,"texture":0},"vest":{"item":0,"texture":0},"hat":{"item":-1,"texture":0},"decals":{"item":0,"texture":0},"torso":{"item":322,"texture":0}}'),
	(11, 'Creator', '1'),
	(11, 'Datatable', '{"Weight":70,"Thirst":88,"Inventory":{"1":{"item":"WEAPON_HEAVYPISTOL-1769450688-Q3285D","amount":1},"20":{"item":"lockpick-0","amount":1},"3":{"item":"WEAPON_STUNGUN-1769444448","amount":1},"2":{"item":"WEAPON_PARAFAL-1769450457-6H6OK3","amount":1},"5":{"item":"lockpick-1769477372","amount":2},"4":{"item":"WEAPON_M1911-1769450433-5415SS","amount":1},"7":{"amount":1,"item":"identity-11"},"6":{"amount":1,"item":"debitcard-11"},"9":{"item":"AMMO_9","amount":128},"8":{"item":"cellphone-1769387588","amount":1},"19":{"item":"WEAPON_SWITCHBLADE-1769387520","amount":1},"18":{"item":"AMMO_556","amount":128},"13":{"item":"AMMO_9","amount":128},"12":{"item":"AMMO_556","amount":128},"11":{"item":"AMMO_556","amount":128},"10":{"item":"AMMO_9","amount":128},"14":{"item":"AMMO_9","amount":120},"15":{"item":"AMMO_9","amount":61},"16":{"item":"AMMO_556","amount":15},"17":{"item":"AMMO_556","amount":128}},"Pos":{"y":-880.85,"x":-180.71,"z":29.35},"Stress":0,"Armour":0,"Skin":"mp_m_freemode_01","Health":188,"Hunger":88}'),
	(11, 'Experience', '{"Minerman":0,"Delivery":0,"Fisherman":0,"Postal":0,"Taxi":0,"Milkman":0,"Tractor":0,"Lumberman":0,"Trucker":0,"Tows":0,"Hunting":0,"Transporter":0,"Bus":0,"Garbageman":0}'),
	(12, 'Ammos', '[]'),
	(12, 'Attachs', '[]'),
	(12, 'Backpack', '[]'),
	(12, 'Barbershop', '[0,0,0,0,0,0,0,0,0,44,40,0,0,0,0,0,0,0,0,0,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(12, 'Clothings', '{"glass":{"item":0,"texture":0},"shoes":{"item":0,"texture":0},"ear":{"item":-1,"texture":0},"accessory":{"item":0,"texture":0},"watch":{"item":-1,"texture":0},"vest":{"item":0,"texture":0},"torso":{"item":648,"texture":0},"decals":{"item":0,"texture":0},"tshirt":{"item":1,"texture":0},"backpack":{"item":0,"texture":0},"mask":{"item":0,"texture":0},"hat":{"item":-1,"texture":0},"arms":{"item":0,"texture":0},"pants":{"item":201,"texture":0},"bracelet":{"item":-1,"texture":0}}'),
	(12, 'Creator', '1'),
	(12, 'Datatable', '{"Armour":0,"Skin":"mp_m_freemode_01","Stress":0,"Thirst":72,"Health":200,"Inventory":{"2":{"amount":1,"item":"identity-12"},"3":{"amount":2,"item":"hamburger-1769377458"},"1":{"amount":1,"item":"WEAPON_SPECIALCARBINE-1769378715-Y0AZW0"},"6":{"amount":100,"item":"dollars2"},"7":{"amount":100,"item":"dollars2"},"4":{"amount":100,"item":"dollars2"},"5":{"amount":100,"item":"dollars2"},"20":{"amount":1,"item":"cellphone-1769377458"},"16":{"amount":2,"item":"water"},"8":{"amount":100,"item":"dollars2"},"9":{"amount":100,"item":"dollars2"},"19":{"amount":100,"item":"dollars2"},"29":{"amount":100,"item":"dollars2"},"14":{"amount":100,"item":"dollars2"},"15":{"amount":1,"item":"debitcard-12"},"25":{"amount":72,"item":"dollars2"},"22":{"amount":99,"item":"dollars2"},"27":{"amount":100,"item":"dollars2"},"26":{"amount":100,"item":"dollars2"},"17":{"amount":100,"item":"dollars2"},"28":{"amount":100,"item":"dollars2"},"10":{"amount":100,"item":"dollars2"},"18":{"amount":100,"item":"dollars2"},"13":{"amount":100,"item":"dollars2"},"12":{"amount":100,"item":"dollars2"},"11":{"amount":100,"item":"dollars2"},"21":{"amount":104,"item":"AMMO_45"}},"Weight":40,"Pos":{"z":72.66,"x":267.57,"y":-857.15},"Hunger":72}'),
	(12, 'Experience', '{"Tows":0,"Trucker":0,"Delivery":0,"Garbageman":0,"Taxi":0,"Lumberman":0,"Postal":0,"Milkman":0,"Minerman":0,"Bus":0,"Fisherman":0,"Tractor":0,"Transporter":0,"Hunting":0}'),
	(12, 'Rolepass', '{"RolepassBuy":false,"Premium":0,"Finish":1769914800.0,"Free":0,"Points":0}'),
	(13, 'Ammos', '[]'),
	(13, 'Attachs', '[]'),
	(13, 'Backpack', '[]'),
	(13, 'Barbershop', '[0,0,0,0,0,0,0,0,0,37,29,61,0,0,0,0,0,0,30,0.99,61,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(13, 'Clothings', '{"mask":{"texture":0,"item":0},"pants":{"texture":0,"item":234},"arms":{"texture":0,"item":15},"tshirt":{"texture":0,"item":255},"glass":{"texture":5,"item":17},"torso":{"texture":0,"item":643},"bracelet":{"texture":0,"item":-1},"backpack":{"texture":0,"item":0},"accessory":{"texture":0,"item":0},"vest":{"texture":0,"item":0},"shoes":{"texture":0,"item":180},"hat":{"texture":0,"item":225},"watch":{"texture":0,"item":2},"decals":{"texture":0,"item":0},"ear":{"texture":0,"item":-2}}'),
	(13, 'Creator', '1'),
	(13, 'Datatable', '{"Weight":40,"Thirst":100,"Inventory":{"1":{"item":"dollars","amount":100},"3":{"amount":3,"item":"hamburger-1769394972"},"2":{"amount":1,"item":"identity-13"},"5":{"amount":100,"item":"dollars"},"4":{"amount":100,"item":"dollars"},"7":{"amount":100,"item":"dollars"},"6":{"amount":100,"item":"dollars"},"9":{"amount":100,"item":"dollars"},"8":{"amount":100,"item":"dollars"},"68":{"item":"dollars","amount":100},"78":{"item":"dollars","amount":100},"19":{"amount":2,"item":"water"},"59":{"item":"dollars","amount":100},"49":{"item":"dollars","amount":100},"39":{"item":"dollars","amount":100},"29":{"item":"dollars","amount":100},"31":{"item":"dollars","amount":100},"55":{"item":"dollars","amount":100},"11":{"amount":100,"item":"dollars"},"35":{"item":"dollars","amount":100},"25":{"item":"dollars","amount":100},"61":{"item":"dollars","amount":100},"51":{"item":"dollars","amount":100},"41":{"item":"dollars","amount":100},"93":{"item":"dollars","amount":100},"83":{"item":"dollars","amount":100},"87":{"item":"dollars","amount":100},"77":{"item":"dollars","amount":100},"97":{"item":"dollars","amount":100},"100":{"item":"dollars","amount":100},"18":{"amount":100,"item":"dollars"},"48":{"item":"dollars","amount":100},"58":{"item":"dollars","amount":100},"28":{"item":"dollars","amount":100},"38":{"item":"dollars","amount":100},"54":{"item":"dollars","amount":100},"64":{"item":"dollars","amount":100},"34":{"item":"dollars","amount":100},"44":{"item":"dollars","amount":100},"60":{"item":"dollars","amount":100},"24":{"item":"dollars","amount":100},"40":{"item":"dollars","amount":100},"50":{"item":"dollars","amount":100},"82":{"item":"dollars","amount":100},"92":{"item":"dollars","amount":100},"76":{"item":"dollars","amount":100},"86":{"item":"dollars","amount":100},"96":{"item":"dollars","amount":100},"67":{"item":"dollars","amount":100},"98":{"item":"dollars","amount":100},"71":{"item":"dollars","amount":100},"94":{"item":"dollars","amount":100},"74":{"item":"dollars","amount":100},"90":{"item":"dollars","amount":100},"66":{"item":"dollars","amount":100},"88":{"item":"dollars","amount":100},"70":{"item":"dollars","amount":100},"84":{"item":"dollars","amount":100},"73":{"item":"dollars","amount":100},"80":{"item":"dollars","amount":100},"13":{"amount":100,"item":"dollars"},"37":{"item":"dollars","amount":100},"33":{"item":"dollars","amount":100},"57":{"item":"dollars","amount":100},"53":{"item":"dollars","amount":100},"43":{"item":"dollars","amount":100},"27":{"item":"dollars","amount":100},"63":{"item":"dollars","amount":100},"65":{"item":"dollars","amount":100},"21":{"item":"dollars","amount":100},"91":{"item":"dollars","amount":100},"81":{"item":"dollars","amount":100},"72":{"item":"dollars","amount":100},"95":{"item":"dollars","amount":100},"85":{"item":"dollars","amount":100},"75":{"item":"dollars","amount":100},"99":{"item":"dollars","amount":100},"89":{"item":"dollars","amount":100},"79":{"item":"dollars","amount":100},"69":{"item":"dollars","amount":100},"16":{"amount":100,"item":"dollars"},"14":{"amount":100,"item":"dollars"},"17":{"amount":100,"item":"dollars"},"22":{"item":"dollars","amount":100},"30":{"item":"dollars","amount":100},"20":{"amount":1,"item":"cellphone-1769394972"},"23":{"item":"dollars","amount":100},"10":{"amount":100,"item":"dollars"},"15":{"amount":100,"item":"dollars"},"45":{"item":"dollars","amount":100},"46":{"item":"dollars","amount":100},"47":{"item":"dollars","amount":100},"36":{"item":"dollars","amount":100},"12":{"amount":100,"item":"dollars"},"56":{"item":"dollars","amount":100},"32":{"item":"dollars","amount":100},"42":{"item":"dollars","amount":100},"52":{"item":"dollars","amount":100},"62":{"item":"dollars","amount":100},"26":{"item":"dollars","amount":100}},"Skin":"mp_m_freemode_01","Hunger":100,"Armour":0,"Pos":{"y":-1270.36,"x":-438.23,"z":45.7},"Health":200,"Stress":0}'),
	(13, 'Experience', '{"Trucker":0,"Bus":0,"Fisherman":0,"Delivery":0,"Taxi":0,"Milkman":0,"Postal":0,"Lumberman":0,"Minerman":0,"Tows":0,"Hunting":0,"Transporter":0,"Tractor":0,"Garbageman":0}'),
	(14, 'Ammos', '[]'),
	(14, 'Attachs', '[]'),
	(14, 'Backpack', '[]'),
	(14, 'Barbershop', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
	(14, 'Clothings', '{"mask":{"item":0,"texture":0},"pants":{"item":253,"texture":0},"arms":{"item":15,"texture":0},"watch":{"item":-1,"texture":0},"ear":{"item":-1,"texture":0},"glass":{"item":62,"texture":4},"torso":{"item":15,"texture":0},"backpack":{"item":0,"texture":0},"accessory":{"item":213,"texture":0},"bracelet":{"item":-1,"texture":0},"shoes":{"item":192,"texture":0},"hat":{"item":226,"texture":0},"tshirt":{"item":1,"texture":0},"decals":{"item":0,"texture":0},"vest":{"item":0,"texture":0}}'),
	(14, 'Creator', '1'),
	(14, 'Datatable', '{"Weight":40,"Thirst":95,"Inventory":{"1":{"item":"hamburger-1769463664","amount":3},"3":{"item":"cellphone-1769463664","amount":1},"2":{"item":"identity-14","amount":1},"5":{"item":"dollars","amount":100},"4":{"item":"dollars","amount":100},"7":{"item":"dollars","amount":100},"6":{"item":"dollars","amount":100},"9":{"item":"dollars","amount":100},"8":{"item":"dollars","amount":100},"19":{"item":"gift","amount":1},"18":{"item":"dollars","amount":100},"20":{"item":"water","amount":2},"13":{"item":"dollars","amount":100},"12":{"item":"dollars","amount":100},"11":{"item":"dollars","amount":100},"10":{"item":"dollars","amount":100},"14":{"item":"dollars","amount":100},"15":{"item":"dollars","amount":100},"16":{"item":"dollars","amount":100},"17":{"item":"dollars","amount":100}},"Health":200,"Hunger":95,"Armour":0,"Stress":0,"Pos":{"y":-2687.48,"x":-992.21,"z":13.83},"Skin":"mp_m_freemode_01"}'),
	(14, 'Experience', '{"Bus":0,"Tractor":0,"Fisherman":0,"Postal":0,"Taxi":0,"Milkman":0,"Minerman":0,"Lumberman":0,"Trucker":0,"Tows":0,"Hunting":0,"Transporter":0,"Delivery":0,"Garbageman":0}');

-- Copiando estrutura para tabela creawork.playlists
CREATE TABLE IF NOT EXISTS `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela creawork.playlists: ~0 rows (aproximadamente)

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
INSERT INTO `propertys` (`Number`, `Passport`, `Interior`, `Keychain`, `Tax`) VALUES
	(154, 1, 1, 339, 1771122558);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela creawork.reports: ~1 rows (aproximadamente)
INSERT INTO `reports` (`id`, `victim_id`, `police_name`, `solved`, `victim_name`, `created_at`, `victim_report`, `updated_at`) VALUES
	(1, '1', 'HIDEN STORE', NULL, 'Hiden Store', '21/01/2026 ás 01:18', '<p>dbgashindjasdasdasdasd</p>', '21/01/2026 ás 01:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=958 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_calls: ~2 rows (aproximadamente)
INSERT INTO `smartphone_calls` (`id`, `initiator`, `target`, `duration`, `status`, `video`, `anonymous`, `created_at`) VALUES
	(956, '135-087', '927-854', 92, 'ok', 0, 0, 1769464096),
	(957, '927-854', '135-087', 52, 'ok', 0, 0, 1769464295);

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
INSERT INTO `smartphone_casino` (`user_id`, `balance`, `double`, `crash`, `mine`) VALUES
	(1, 10, 0, 0, 0),
	(2, 0, 0, 0, 0);

-- Copiando estrutura para tabela creawork.smartphone_contacts
CREATE TABLE IF NOT EXISTS `smartphone_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_index` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_gallery: ~6 rows (aproximadamente)
INSERT INTO `smartphone_gallery` (`id`, `user_id`, `folder`, `url`, `created_at`) VALUES
	(1035, 1, '/instagram', 'https://cdn.discordapp.com/attachments/1461129148197114161/1462999945488502795/1768876858054.jpg?ex=69703c60&is=696eeae0&hm=2655caa3d6b3111b6a0a9a32aa89622faf2aad76059892b96d11e5a774ab0c8c&', 1768876768),
	(1036, 1, '/instagram', 'https://cdn.discordapp.com/attachments/1461129148197114161/1463000026338033736/1768876877319.jpg?ex=69703c73&is=696eeaf3&hm=d8f0fa800acc6eae270c0ca50dfb16e16d36fadc1ffc53c1e4986ca95777efc6&', 1768876787),
	(1037, 1, '/olx', 'https://cdn.discordapp.com/attachments/1461129148197114161/1463018142107303986/1768881196279.jpg?ex=69704d52&is=696efbd2&hm=8b86267fb6bbbc15c9efbe751cc524d307b893514bf1dc5872622bc30d20cd4b&', 1768881107),
	(1038, 1, '/marketplace', 'https://cdn.discordapp.com/attachments/1461129148197114161/1463037751451717921/1768885871407.jpg?ex=69705f95&is=696f0e15&hm=e86a9cad7c680d0294c09bebbbe7e50711e6b38efd1e73f09c779b88cd08b672&', 1768885783),
	(1039, 11, '/instagram', 'https://cdn.discordapp.com/attachments/1461129148197114161/1465409884097872035/1769451342336.jpg?ex=697900ce&is=6977af4e&hm=6c0c6cab30146505282950e70460a09f35712d5169252d3d16cb5c8ede65a3a0&', 1769451343),
	(1040, 11, '/instagram', 'https://cdn.discordapp.com/attachments/1461129148197114161/1465410037273985210/1769451378936.jpg?ex=697900f2&is=6977af72&hm=ca66ef7fec74972c422725a65fd9a979487df9bef1030e6ce1e572efeadfdfd3&', 1769451379);

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
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_instagram: ~2 rows (aproximadamente)
INSERT INTO `smartphone_instagram` (`id`, `user_id`, `username`, `name`, `bio`, `avatarURL`, `verified`) VALUES
	(187, 1, 'hidenstore', 'hiden store', '.-.', 'https://cdn.discordapp.com/attachments/1461129148197114161/1462999945488502795/1768876858054.jpg?ex=69703c60&is=696eeae0&hm=2655caa3d6b3111b6a0a9a32aa89622faf2aad76059892b96d11e5a774ab0c8c&', 0),
	(188, 11, 'Carlos', 'Carlos', '', 'https://cdn.discordapp.com/attachments/1461129148197114161/1465409884097872035/1769451342336.jpg?ex=697900ce&is=6977af4e&hm=6c0c6cab30146505282950e70460a09f35712d5169252d3d16cb5c8ede65a3a0&', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=1274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Copiando dados para a tabela creawork.smartphone_instagram_posts: ~1 rows (aproximadamente)
INSERT INTO `smartphone_instagram_posts` (`id`, `profile_id`, `post_id`, `image`, `content`, `created_at`, `comments`) VALUES
	(626, 187, NULL, 'https://cdn.discordapp.com/attachments/1461129148197114161/1463000026338033736/1768876877319.jpg?ex=69703c73&is=696eeaf3&hm=d8f0fa800acc6eae270c0ca50dfb16e16d36fadc1ffc53c1e4986ca95777efc6&', '.-.', 1768876791, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_marketplace: ~1 rows (aproximadamente)
INSERT INTO `smartphone_marketplace` (`id`, `user_id`, `title`, `category`, `price`, `description`, `images`, `created_at`) VALUES
	(1, 1, 'tezst', 'motorcycles', 300009, 'rftghj', '["https://cdn.discordapp.com/attachments/1461129148197114161/1463037751451717921/1768885871407.jpg?ex=69705f95&is=696f0e15&hm=e86a9cad7c680d0294c09bebbbe7e50711e6b38efd1e73f09c779b88cd08b672&"]', 1768885785);

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_olx: ~0 rows (aproximadamente)
INSERT INTO `smartphone_olx` (`id`, `user_id`, `title`, `category`, `price`, `description`, `images`, `created_at`, `x`, `y`, `z`) VALUES
	(48, 1, 'bancada', 'misc', 10000, 'teste', '["https://cdn.discordapp.com/attachments/1461129148197114161/1463018142107303986/1768881196279.jpg?ex=69704d52&is=696efbd2&hm=8b86267fb6bbbc15c9efbe751cc524d307b893514bf1dc5872622bc30d20cd4b&"]', 1768881111, 0, 0, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_weazel: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela creawork.smartphone_whatsapp
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp` (
  `owner` varchar(32) NOT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `read_receipts` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.smartphone_whatsapp: ~4 rows (aproximadamente)
INSERT INTO `smartphone_whatsapp` (`owner`, `avatarURL`, `read_receipts`) VALUES
	('065-122', NULL, 1),
	('111-500', NULL, 1),
	('446-346', NULL, 1),
	('831-968', NULL, 1);

-- Copiando estrutura para tabela creawork.smartphone_whatsapp_channels
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_channels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.taxs: ~1 rows (aproximadamente)
INSERT INTO `taxs` (`id`, `Passport`, `Name`, `Date`, `Hour`, `Value`, `Message`) VALUES
	(1, 1, 'Armazém', '15/01/2026', '23:32', 500000, 'Compra de armazém.');

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
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.transactions: ~367 rows (aproximadamente)
INSERT INTO `transactions` (`id`, `Passport`, `Type`, `Date`, `Value`, `Balance`) VALUES
	(1, 1, 'entry', '12/01/2026', 5000, 0),
	(2, 1, 'entry', '12/01/2026', 3500, 5000),
	(3, 1, 'entry', '13/01/2026', 13000, 8500),
	(4, 1, 'entry', '13/01/2026', 13000, 21500),
	(5, 1, 'entry', '13/01/2026', 13000, 34500),
	(6, 1, 'entry', '13/01/2026', 13000, 47500),
	(7, 1, 'entry', '13/01/2026', 13000, 60500),
	(8, 1, 'entry', '13/01/2026', 13000, 73500),
	(9, 1, 'entry', '13/01/2026', 13000, 86500),
	(10, 1, 'entry', '13/01/2026', 13000, 99500),
	(11, 1, 'entry', '13/01/2026', 9900, 112500),
	(12, 1, 'entry', '13/01/2026', 13000, 122400),
	(13, 1, 'entry', '13/01/2026', 13000, 135400),
	(14, 2, 'entry', '13/01/2026', 5000, 0),
	(15, 3, 'entry', '13/01/2026', 5000, 0),
	(16, 2, 'entry', '13/01/2026', 2147483647, 5000),
	(17, 2, 'exit', '13/01/2026', 2000, 2147483647),
	(18, 2, 'exit', '13/01/2026', 2000, 2147483647),
	(19, 2, 'exit', '13/01/2026', 2147483647, 2147483647),
	(20, 2, 'exit', '13/01/2026', 1000, 2147483647),
	(21, 2, 'exit', '13/01/2026', 500, 2147483647),
	(22, 2, 'exit', '13/01/2026', 500, 2147483647),
	(23, 2, 'exit', '13/01/2026', 500, 2147483647),
	(24, 2, 'exit', '13/01/2026', 1000, 2147483647),
	(25, 2, 'exit', '13/01/2026', 1000, 2147483647),
	(26, 2, 'exit', '13/01/2026', 1000, 2147483647),
	(27, 2, 'exit', '13/01/2026', 1000, 2147483647),
	(28, 2, 'exit', '13/01/2026', 1000, 2147483647),
	(29, 2, 'exit', '13/01/2026', 1500, 2147483647),
	(30, 2, 'exit', '13/01/2026', 500, 2147483647),
	(31, 2, 'exit', '13/01/2026', 250, 2147483647),
	(32, 2, 'exit', '13/01/2026', 1000, 2147483647),
	(33, 2, 'entry', '13/01/2026', 13000, 2147483647),
	(34, 2, 'exit', '13/01/2026', 20, 2147483647),
	(35, 2, 'exit', '13/01/2026', 975, 2147483647),
	(36, 2, 'exit', '13/01/2026', 975, 2147483647),
	(37, 1, 'exit', '13/01/2026', 200, 148400),
	(38, 1, 'exit', '13/01/2026', 200, 148200),
	(39, 1, 'entry', '13/01/2026', 13000, 148000),
	(40, 5, 'entry', '13/01/2026', 5000, 0),
	(41, 1, 'entry', '13/01/2026', 13000, 161000),
	(42, 1, 'entry', '13/01/2026', 13000, 174000),
	(43, 1, 'exit', '14/01/2026', 10, 187000),
	(44, 1, 'entry', '14/01/2026', 13000, 186990),
	(45, 1, 'entry', '14/01/2026', 13000, 199990),
	(46, 1, 'exit', '14/01/2026', 100, 212990),
	(47, 1, 'entry', '14/01/2026', 3250, 212890),
	(48, 6, 'entry', '15/01/2026', 5000, 0),
	(49, 7, 'entry', '15/01/2026', 5000, 0),
	(50, 1, 'entry', '15/01/2026', 3250, 216140),
	(51, 1, 'entry', '15/01/2026', 2147483647, 219390),
	(52, 1, 'exit', '15/01/2026', 500000, 2147483647),
	(53, 1, 'entry', '16/01/2026', 3250, 2147483647),
	(54, 6, 'entry', '16/01/2026', 13000, 5000),
	(55, 1, 'entry', '16/01/2026', 3250, 2147483647),
	(56, 6, 'entry', '16/01/2026', 13000, 18000),
	(57, 1, 'entry', '16/01/2026', 3250, 2147483647),
	(58, 6, 'entry', '16/01/2026', 13000, 31000),
	(59, 1, 'entry', '16/01/2026', 3250, 2147483647),
	(60, 6, 'entry', '16/01/2026', 13000, 44000),
	(61, 1, 'entry', '16/01/2026', 3250, 2147483647),
	(62, 1, 'entry', '19/01/2026', 3250, 2146999897),
	(63, 1, 'exit', '20/01/2026', 100, 2147003147),
	(64, 1, 'entry', '20/01/2026', 3250, 2147003047),
	(65, 1, 'exit', '20/01/2026', 10000, 2147006297),
	(66, 1, 'entry', '20/01/2026', 3250, 2146996297),
	(67, 1, 'entry', '20/01/2026', 3250, 2146999547),
	(68, 1, 'entry', '20/01/2026', 3250, 2147002797),
	(69, 1, 'entry', '20/01/2026', 9900, 2147006047),
	(70, 1, 'entry', '20/01/2026', 3250, 2147015947),
	(71, 1, 'entry', '20/01/2026', 3500, 2147019197),
	(72, 1, 'entry', '20/01/2026', 13000, 2147022697),
	(73, 1, 'entry', '20/01/2026', 2500, 2147035697),
	(74, 1, 'entry', '20/01/2026', 13000, 2147038197),
	(75, 1, 'entry', '20/01/2026', 13000, 2147051197),
	(76, 1, 'entry', '20/01/2026', 9900, 2147064197),
	(77, 1, 'entry', '20/01/2026', 3250, 2147074097),
	(78, 1, 'entry', '20/01/2026', 3500, 2147077347),
	(79, 1, 'entry', '20/01/2026', 13000, 2147080847),
	(80, 1, 'entry', '20/01/2026', 2500, 2147093847),
	(81, 1, 'entry', '20/01/2026', 13000, 2147096347),
	(82, 1, 'entry', '20/01/2026', 13000, 2147109347),
	(83, 1, 'entry', '20/01/2026', 3250, 2147122347),
	(84, 1, 'entry', '20/01/2026', 13000, 2147125597),
	(85, 1, 'entry', '20/01/2026', 13000, 2147138597),
	(86, 1, 'entry', '20/01/2026', 2500, 2147151597),
	(87, 1, 'entry', '20/01/2026', 13000, 2147154097),
	(88, 1, 'entry', '20/01/2026', 3500, 2147167097),
	(89, 1, 'entry', '20/01/2026', 9900, 2147170597),
	(90, 1, 'entry', '20/01/2026', 3250, 2147180497),
	(91, 1, 'entry', '20/01/2026', 13000, 2147183747),
	(92, 1, 'entry', '20/01/2026', 13000, 2147196747),
	(93, 1, 'entry', '20/01/2026', 2500, 2147209747),
	(94, 1, 'entry', '20/01/2026', 13000, 2147212247),
	(95, 1, 'entry', '20/01/2026', 3500, 2147225247),
	(96, 1, 'entry', '20/01/2026', 9900, 2147228747),
	(97, 1, 'entry', '20/01/2026', 3250, 2147238647),
	(98, 1, 'entry', '20/01/2026', 13000, 2147241897),
	(99, 1, 'entry', '20/01/2026', 13000, 2147254897),
	(100, 1, 'entry', '20/01/2026', 2500, 2147267897),
	(101, 1, 'entry', '20/01/2026', 13000, 2147270397),
	(102, 1, 'entry', '20/01/2026', 3500, 2147283397),
	(103, 1, 'entry', '20/01/2026', 9900, 2147286897),
	(104, 1, 'exit', '21/01/2026', 2000, 2147296797),
	(105, 1, 'exit', '21/01/2026', 1000, 2147294797),
	(106, 1, 'exit', '21/01/2026', 26000, 2147293797),
	(107, 1, 'exit', '21/01/2026', 50, 2147267797),
	(108, 1, 'exit', '21/01/2026', 50, 2147267747),
	(109, 1, 'exit', '22/01/2026', 30000, 2147267697),
	(110, 1, 'exit', '22/01/2026', 30000, 2147237697),
	(111, 1, 'exit', '22/01/2026', 30000, 2147207697),
	(112, 1, 'exit', '22/01/2026', 30000, 2147177697),
	(113, 1, 'exit', '22/01/2026', 30000, 2147147697),
	(114, 1, 'exit', '22/01/2026', 30000, 2147117697),
	(115, 1, 'exit', '22/01/2026', 30000, 2147087697),
	(116, 1, 'entry', '22/01/2026', 13000, 2147057697),
	(117, 1, 'entry', '22/01/2026', 3250, 2147070697),
	(118, 1, 'entry', '22/01/2026', 13000, 2147073947),
	(119, 1, 'entry', '22/01/2026', 9900, 2147086947),
	(120, 1, 'entry', '22/01/2026', 3500, 2147096847),
	(121, 1, 'entry', '22/01/2026', 13000, 2147100347),
	(122, 1, 'exit', '22/01/2026', 30000, 2147113347),
	(123, 1, 'exit', '22/01/2026', 30000, 2147083347),
	(124, 1, 'exit', '22/01/2026', 30000, 2147053347),
	(125, 1, 'exit', '22/01/2026', 30000, 2147023347),
	(126, 1, 'exit', '22/01/2026', 50, 2146993347),
	(127, 1, 'exit', '22/01/2026', 30000, 2146993297),
	(128, 1, 'entry', '22/01/2026', 13000, 2146963297),
	(129, 1, 'entry', '22/01/2026', 3250, 2146976297),
	(130, 1, 'entry', '22/01/2026', 13000, 2146979547),
	(131, 1, 'entry', '22/01/2026', 9900, 2146992547),
	(132, 1, 'entry', '22/01/2026', 3500, 2147002447),
	(133, 1, 'entry', '22/01/2026', 13000, 2147005947),
	(134, 8, 'entry', '23/01/2026', 5000, 0),
	(135, 9, 'entry', '23/01/2026', 5000, 0),
	(136, 10, 'entry', '24/01/2026', 5000, 0),
	(137, 11, 'entry', '25/01/2026', 5000, 0),
	(138, 11, 'exit', '25/01/2026', 1000, 5000),
	(139, 11, 'exit', '25/01/2026', 500, 4000),
	(140, 11, 'entry', '25/01/2026', 2000, 3500),
	(141, 11, 'exit', '25/01/2026', 2000, 5500),
	(142, 11, 'entry', '25/01/2026', 2000, 3500),
	(143, 8, 'entry', '25/01/2026', 1000, 5000),
	(144, 11, 'entry', '25/01/2026', 500, 5500),
	(145, 11, 'entry', '25/01/2026', 200, 6000),
	(146, 11, 'entry', '25/01/2026', 200, 6200),
	(147, 8, 'entry', '25/01/2026', 300, 6000),
	(148, 11, 'entry', '25/01/2026', 1000, 6400),
	(149, 11, 'entry', '25/01/2026', 500, 7400),
	(150, 11, 'entry', '25/01/2026', 200, 7900),
	(151, 12, 'entry', '25/01/2026', 5000, 0),
	(152, 11, 'entry', '25/01/2026', 9900, 8100),
	(153, 12, 'entry', '25/01/2026', 200, 5000),
	(154, 12, 'entry', '25/01/2026', 200, 5200),
	(155, 12, 'entry', '25/01/2026', 200, 5400),
	(156, 12, 'entry', '25/01/2026', 200, 5600),
	(157, 12, 'entry', '25/01/2026', 200, 5800),
	(158, 12, 'entry', '25/01/2026', 200, 6000),
	(159, 12, 'entry', '25/01/2026', 200, 6200),
	(160, 12, 'entry', '25/01/2026', 100, 6400),
	(161, 12, 'exit', '25/01/2026', 50, 6500),
	(162, 11, 'entry', '25/01/2026', 9900, 18000),
	(163, 11, 'entry', '25/01/2026', 9900, 27900),
	(164, 11, 'exit', '25/01/2026', 50, 37800),
	(165, 11, 'exit', '25/01/2026', 1250, 37750),
	(166, 11, 'exit', '25/01/2026', 1250, 36500),
	(167, 11, 'exit', '25/01/2026', 25000, 35250),
	(168, 11, 'exit', '25/01/2026', 7250, 10250),
	(169, 11, 'exit', '25/01/2026', 1250, 3000),
	(170, 11, 'exit', '25/01/2026', 775, 1750),
	(171, 11, 'exit', '25/01/2026', 50, 975),
	(172, 11, 'entry', '25/01/2026', 1000000, 925),
	(173, 11, 'exit', '25/01/2026', 1250, 1000925),
	(174, 11, 'exit', '25/01/2026', 25000, 999675),
	(175, 11, 'exit', '25/01/2026', 20000, 974675),
	(176, 11, 'exit', '25/01/2026', 7250, 954675),
	(177, 11, 'exit', '25/01/2026', 50, 947425),
	(178, 11, 'exit', '25/01/2026', 1250, 947375),
	(179, 11, 'exit', '25/01/2026', 1250, 946125),
	(180, 11, 'exit', '25/01/2026', 1250, 944875),
	(181, 11, 'exit', '25/01/2026', 1250, 943625),
	(182, 11, 'exit', '25/01/2026', 1250, 942375),
	(183, 11, 'exit', '25/01/2026', 50, 941125),
	(184, 11, 'exit', '25/01/2026', 120000, 941075),
	(185, 11, 'exit', '25/01/2026', 7250, 821075),
	(186, 11, 'exit', '25/01/2026', 775, 813825),
	(187, 11, 'exit', '25/01/2026', 775, 813050),
	(188, 11, 'entry', '25/01/2026', 7500, 812275),
	(189, 11, 'entry', '25/01/2026', 5000, 819775),
	(190, 11, 'entry', '25/01/2026', 3500, 824775),
	(191, 11, 'exit', '25/01/2026', 1250, 828275),
	(192, 11, 'exit', '25/01/2026', 50, 827025),
	(193, 11, 'exit', '25/01/2026', 1250, 826975),
	(194, 11, 'exit', '25/01/2026', 1250, 825725),
	(195, 11, 'exit', '25/01/2026', 1250, 824475),
	(196, 11, 'exit', '25/01/2026', 1250, 823225),
	(197, 11, 'exit', '25/01/2026', 7250, 821975),
	(198, 11, 'exit', '25/01/2026', 1250, 814725),
	(199, 11, 'exit', '25/01/2026', 1250, 813475),
	(200, 11, 'exit', '25/01/2026', 50, 812225),
	(201, 11, 'entry', '25/01/2026', 3500, 812175),
	(202, 11, 'exit', '25/01/2026', 100, 815675),
	(203, 11, 'exit', '25/01/2026', 100, 815575),
	(204, 11, 'entry', '25/01/2026', 9900, 815475),
	(205, 11, 'exit', '25/01/2026', 50, 825375),
	(206, 11, 'exit', '25/01/2026', 50, 825325),
	(207, 11, 'exit', '25/01/2026', 50, 825275),
	(208, 11, 'exit', '25/01/2026', 50, 825225),
	(209, 11, 'exit', '25/01/2026', 50, 825175),
	(210, 11, 'exit', '25/01/2026', 50, 825125),
	(211, 11, 'exit', '25/01/2026', 25000, 825075),
	(212, 11, 'exit', '25/01/2026', 20000, 800075),
	(213, 11, 'exit', '25/01/2026', 25000, 780075),
	(214, 11, 'exit', '25/01/2026', 120000, 755075),
	(215, 11, 'exit', '25/01/2026', 7250, 635075),
	(216, 11, 'exit', '25/01/2026', 1250, 627825),
	(217, 11, 'exit', '25/01/2026', 775, 626575),
	(218, 11, 'exit', '25/01/2026', 1250, 625800),
	(219, 11, 'entry', '25/01/2026', 9900, 624550),
	(220, 13, 'entry', '25/01/2026', 5000, 0),
	(221, 11, 'exit', '25/01/2026', 50, 634450),
	(222, 11, 'exit', '25/01/2026', 50, 634400),
	(223, 11, 'exit', '25/01/2026', 50, 634350),
	(224, 11, 'entry', '25/01/2026', 3500, 634300),
	(225, 11, 'entry', '26/01/2026', 9900, 637800),
	(226, 11, 'exit', '26/01/2026', 50, 647700),
	(227, 11, 'exit', '26/01/2026', 50, 647650),
	(228, 11, 'exit', '26/01/2026', 50, 647600),
	(229, 11, 'exit', '26/01/2026', 50, 647550),
	(230, 11, 'exit', '26/01/2026', 50, 647500),
	(231, 8, 'exit', '26/01/2026', 1250, 6300),
	(232, 8, 'entry', '26/01/2026', 100, 5050),
	(233, 8, 'entry', '26/01/2026', 100, 5150),
	(234, 8, 'entry', '26/01/2026', 100, 5250),
	(235, 8, 'entry', '26/01/2026', 100, 5350),
	(236, 8, 'entry', '26/01/2026', 100, 5450),
	(237, 8, 'entry', '26/01/2026', 100, 5550),
	(238, 8, 'entry', '26/01/2026', 100, 5650),
	(239, 8, 'entry', '26/01/2026', 200, 5750),
	(240, 8, 'entry', '26/01/2026', 2000, 5950),
	(241, 8, 'entry', '26/01/2026', 2000, 7950),
	(242, 8, 'entry', '26/01/2026', 2000, 9950),
	(243, 8, 'entry', '26/01/2026', 2000, 11950),
	(244, 8, 'exit', '26/01/2026', 10000, 13950),
	(245, 8, 'entry', '26/01/2026', 2000, 3950),
	(246, 8, 'entry', '26/01/2026', 2000, 5950),
	(247, 8, 'entry', '26/01/2026', 2000, 7950),
	(248, 8, 'entry', '26/01/2026', 2000, 9950),
	(249, 8, 'entry', '26/01/2026', 1000, 11950),
	(250, 8, 'entry', '26/01/2026', 500, 12950),
	(251, 8, 'entry', '26/01/2026', 100, 13450),
	(252, 8, 'entry', '26/01/2026', 100, 13550),
	(253, 8, 'entry', '26/01/2026', 100, 13650),
	(254, 8, 'entry', '26/01/2026', 1000, 13750),
	(255, 8, 'entry', '26/01/2026', 1000, 14750),
	(256, 8, 'entry', '26/01/2026', 1000, 15750),
	(257, 8, 'entry', '26/01/2026', 1000, 16750),
	(258, 8, 'entry', '26/01/2026', 1000, 17750),
	(259, 8, 'entry', '26/01/2026', 1000, 18750),
	(260, 8, 'entry', '26/01/2026', 1000, 19750),
	(261, 8, 'entry', '26/01/2026', 1000, 20750),
	(262, 8, 'entry', '26/01/2026', 1000, 21750),
	(263, 8, 'entry', '26/01/2026', 100, 22750),
	(264, 8, 'entry', '26/01/2026', 100, 22850),
	(265, 8, 'entry', '26/01/2026', 100, 22950),
	(266, 8, 'entry', '26/01/2026', 100, 23050),
	(267, 8, 'entry', '26/01/2026', 100, 23150),
	(268, 8, 'entry', '26/01/2026', 100, 23250),
	(269, 8, 'entry', '26/01/2026', 100, 23350),
	(270, 8, 'entry', '26/01/2026', 100, 23450),
	(271, 8, 'entry', '26/01/2026', 5000000, 23550),
	(272, 8, 'exit', '26/01/2026', 30000, 5023550),
	(273, 8, 'exit', '26/01/2026', 20000, 4993550),
	(274, 8, 'exit', '26/01/2026', 25000, 4973550),
	(275, 8, 'exit', '26/01/2026', 120000, 4948550),
	(276, 8, 'exit', '26/01/2026', 7250, 4828550),
	(277, 8, 'exit', '26/01/2026', 1250, 4821300),
	(278, 8, 'exit', '26/01/2026', 1250, 4820050),
	(279, 8, 'exit', '26/01/2026', 1250, 4818800),
	(280, 8, 'exit', '26/01/2026', 1250, 4817550),
	(281, 8, 'exit', '26/01/2026', 1250, 4816300),
	(282, 8, 'exit', '26/01/2026', 1250, 4815050),
	(283, 8, 'exit', '26/01/2026', 1250, 4813800),
	(284, 8, 'exit', '26/01/2026', 1250, 4812550),
	(285, 8, 'entry', '26/01/2026', 10500, 4811300),
	(286, 13, 'entry', '26/01/2026', 8200, 5000),
	(287, 8, 'entry', '26/01/2026', 3000, 4821800),
	(288, 11, 'entry', '26/01/2026', 9900, 647450),
	(289, 11, 'entry', '26/01/2026', 3500, 657350),
	(290, 11, 'exit', '26/01/2026', 1250, 660850),
	(291, 11, 'exit', '26/01/2026', 1250, 659600),
	(292, 11, 'exit', '26/01/2026', 1250, 658350),
	(293, 11, 'exit', '26/01/2026', 1250, 657100),
	(294, 11, 'entry', '26/01/2026', 3500, 655850),
	(295, 11, 'exit', '26/01/2026', 1250, 659350),
	(296, 11, 'exit', '26/01/2026', 1250, 658100),
	(297, 11, 'exit', '26/01/2026', 1250, 656850),
	(298, 11, 'exit', '26/01/2026', 50, 655600),
	(299, 11, 'entry', '26/01/2026', 9900, 655550),
	(300, 11, 'entry', '26/01/2026', 3500, 665450),
	(301, 11, 'exit', '26/01/2026', 1000, 668950),
	(302, 11, 'exit', '26/01/2026', 1000, 667950),
	(303, 11, 'entry', '26/01/2026', 9900, 666950),
	(304, 11, 'entry', '26/01/2026', 3500, 676850),
	(305, 11, 'entry', '26/01/2026', 9900, 680350),
	(306, 11, 'entry', '26/01/2026', 3500, 690250),
	(307, 8, 'entry', '26/01/2026', 10500, 4824800),
	(308, 8, 'entry', '26/01/2026', 3000, 4835300),
	(309, 13, 'entry', '26/01/2026', 8200, 13200),
	(310, 13, 'entry', '26/01/2026', 8200, 21400),
	(311, 14, 'entry', '26/01/2026', 5000, 0),
	(312, 13, 'entry', '26/01/2026', 8200, 29600),
	(313, 12, 'exit', '26/01/2026', 1000, 6450),
	(314, 12, 'entry', '26/01/2026', 1000, 5450),
	(315, 12, 'exit', '26/01/2026', 1000, 6450),
	(316, 12, 'entry', '26/01/2026', 1000, 5450),
	(317, 13, 'entry', '26/01/2026', 8200, 37800),
	(318, 12, 'exit', '26/01/2026', 50, 6450),
	(319, 12, 'exit', '26/01/2026', 50, 6400),
	(320, 11, 'exit', '26/01/2026', 50, 693750),
	(321, 13, 'entry', '26/01/2026', 8200, 46000),
	(322, 11, 'exit', '26/01/2026', 1250, 693700),
	(323, 13, 'entry', '26/01/2026', 8200, 54200),
	(324, 13, 'entry', '26/01/2026', 8200, 62400),
	(325, 13, 'entry', '26/01/2026', 8200, 70600),
	(326, 11, 'exit', '26/01/2026', 50, 692450),
	(327, 11, 'exit', '26/01/2026', 25000, 692400),
	(328, 11, 'exit', '26/01/2026', 120000, 667400),
	(329, 11, 'exit', '26/01/2026', 7250, 547400),
	(330, 11, 'exit', '26/01/2026', 1250, 540150),
	(331, 11, 'exit', '26/01/2026', 775, 538900),
	(332, 11, 'exit', '26/01/2026', 775, 538125),
	(333, 11, 'exit', '26/01/2026', 50, 537350),
	(334, 11, 'exit', '26/01/2026', 30000, 537300),
	(335, 11, 'exit', '26/01/2026', 25000, 507300),
	(336, 11, 'exit', '26/01/2026', 120000, 482300),
	(337, 11, 'exit', '26/01/2026', 7250, 362300),
	(338, 11, 'exit', '26/01/2026', 1250, 355050),
	(339, 11, 'exit', '26/01/2026', 775, 353800),
	(340, 13, 'entry', '26/01/2026', 8200, 78800),
	(341, 11, 'entry', '26/01/2026', 3500, 353025),
	(342, 13, 'entry', '26/01/2026', 8200, 87000),
	(343, 13, 'entry', '26/01/2026', 8200, 95200),
	(344, 1, 'entry', '28/01/2026', 3500, 2147018947),
	(345, 1, 'entry', '28/01/2026', 9900, 2147022447),
	(346, 1, 'entry', '28/01/2026', 3250, 2147032347),
	(347, 1, 'entry', '28/01/2026', 13000, 2147035597),
	(348, 1, 'entry', '28/01/2026', 13000, 2147048597),
	(349, 1, 'entry', '28/01/2026', 13000, 2147061597),
	(350, 1, 'entry', '28/01/2026', 3500, 2147074597),
	(351, 1, 'entry', '28/01/2026', 9900, 2147078097),
	(352, 1, 'entry', '28/01/2026', 3250, 2147087997),
	(353, 1, 'entry', '28/01/2026', 13000, 2147091247),
	(354, 1, 'entry', '28/01/2026', 13000, 2147104247),
	(355, 1, 'entry', '28/01/2026', 13000, 2147117247),
	(356, 1, 'entry', '28/01/2026', 3500, 2147130247),
	(357, 1, 'entry', '28/01/2026', 9900, 2147133747),
	(358, 1, 'entry', '28/01/2026', 3250, 2147143647),
	(359, 1, 'entry', '28/01/2026', 13000, 2147146897),
	(360, 1, 'entry', '28/01/2026', 13000, 2147159897),
	(361, 1, 'entry', '28/01/2026', 13000, 2147172897),
	(362, 1, 'entry', '28/01/2026', 3500, 2147185897),
	(363, 1, 'entry', '28/01/2026', 9900, 2147189397),
	(364, 1, 'entry', '28/01/2026', 3250, 2147199297),
	(365, 1, 'entry', '28/01/2026', 13000, 2147202547),
	(366, 1, 'entry', '28/01/2026', 13000, 2147215547),
	(367, 1, 'entry', '28/01/2026', 13000, 2147228547),
	(368, 1, 'entry', '28/01/2026', 3500, 2147241547),
	(369, 1, 'entry', '28/01/2026', 9900, 2147245047),
	(370, 1, 'entry', '28/01/2026', 3250, 2147254947),
	(371, 1, 'entry', '28/01/2026', 13000, 2147258197),
	(372, 1, 'entry', '28/01/2026', 13000, 2147271197),
	(373, 1, 'entry', '28/01/2026', 13000, 2147284197),
	(374, 1, 'entry', '28/01/2026', 13000, 2147297197),
	(375, 1, 'entry', '28/01/2026', 3250, 2147310197),
	(376, 1, 'entry', '28/01/2026', 13000, 2147313447),
	(377, 1, 'entry', '28/01/2026', 9900, 2147326447),
	(378, 1, 'entry', '28/01/2026', 13000, 2147336347),
	(379, 1, 'entry', '28/01/2026', 3500, 2147349347),
	(380, 1, 'entry', '28/01/2026', 13000, 2147352847),
	(381, 1, 'entry', '28/01/2026', 3250, 2147365847),
	(382, 1, 'entry', '28/01/2026', 13000, 2147369097),
	(383, 1, 'entry', '28/01/2026', 9900, 2147382097),
	(384, 1, 'entry', '28/01/2026', 13000, 2147391997),
	(385, 1, 'entry', '28/01/2026', 3500, 2147404997),
	(386, 1, 'entry', '28/01/2026', 13000, 2147408497),
	(387, 1, 'entry', '28/01/2026', 3500, 2147421497),
	(388, 1, 'entry', '28/01/2026', 13000, 2147424997),
	(389, 1, 'entry', '28/01/2026', 9900, 2147437997),
	(390, 1, 'entry', '28/01/2026', 13000, 2147447897),
	(391, 1, 'entry', '28/01/2026', 3250, 2147460897),
	(392, 1, 'entry', '28/01/2026', 13000, 2147464147),
	(393, 1, 'entry', '28/01/2026', 3500, 2147477147),
	(394, 1, 'entry', '28/01/2026', 13000, 2147480647),
	(395, 1, 'entry', '28/01/2026', 9900, 2147483647),
	(396, 1, 'entry', '28/01/2026', 13000, 2147483647),
	(397, 1, 'entry', '28/01/2026', 3250, 2147483647),
	(398, 1, 'entry', '28/01/2026', 13000, 2147483647),
	(399, 1, 'entry', '28/01/2026', 3500, 2147483647),
	(400, 1, 'entry', '28/01/2026', 13000, 2147483647),
	(401, 1, 'entry', '28/01/2026', 9900, 2147483647),
	(402, 1, 'entry', '28/01/2026', 13000, 2147483647),
	(403, 1, 'entry', '28/01/2026', 3250, 2147483647),
	(404, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(405, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(406, 1, 'entry', '29/01/2026', 3500, 2147483647),
	(407, 1, 'entry', '29/01/2026', 9900, 2147483647),
	(408, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(409, 1, 'entry', '29/01/2026', 3250, 2147483647),
	(410, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(411, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(412, 1, 'entry', '29/01/2026', 3500, 2147483647),
	(413, 1, 'entry', '29/01/2026', 9900, 2147483647),
	(414, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(415, 1, 'entry', '29/01/2026', 3250, 2147483647),
	(416, 8, 'exit', '29/01/2026', 2000, 4838300),
	(417, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(418, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(419, 1, 'entry', '29/01/2026', 3500, 2147483647),
	(420, 1, 'entry', '29/01/2026', 9900, 2147483647),
	(421, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(422, 1, 'entry', '29/01/2026', 3250, 2147483647),
	(423, 1, 'entry', '29/01/2026', 9900, 2147483647),
	(424, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(425, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(426, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(427, 1, 'entry', '29/01/2026', 3250, 2147483647),
	(428, 1, 'entry', '29/01/2026', 3500, 2147483647),
	(429, 1, 'entry', '29/01/2026', 9900, 2147483647),
	(430, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(431, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(432, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(433, 1, 'entry', '29/01/2026', 3250, 2147483647),
	(434, 1, 'entry', '29/01/2026', 3500, 2147483647),
	(435, 1, 'entry', '29/01/2026', 9900, 2147483647),
	(436, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(437, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(438, 1, 'entry', '29/01/2026', 13000, 2147483647),
	(439, 1, 'entry', '29/01/2026', 3250, 2147483647),
	(440, 1, 'entry', '29/01/2026', 3500, 2147483647);

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela creawork.vehicles: ~43 rows (aproximadamente)
INSERT INTO `vehicles` (`id`, `Passport`, `vehicle`, `tax`, `plate`, `rental`, `arrest`, `engine`, `body`, `health`, `fuel`, `nitro`, `work`, `doors`, `windows`, `tyres`) VALUES
	(1, 1, 'pop110i', 1771561124, '36FSR021', 1768867591, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(2, 2, 'skyliner342', 1768931261, '62YBY197', 1770918461, 0, 1000, 1000, 1000, 98, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":1,"3":1,"4":false,"5":false,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(3, 2, 'm1000rr', 1768931388, '28DYP407', 1770918588, 0, 1000, 1000, 1000, 99, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":true,"2":true,"3":true,"4":false,"5":true,"6":false,"7":false,"0":false}'),
	(4, 2, 'trail21', 1768931775, '02PUE115', 1770918975, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(5, 3, 'tenere1200', 1768931860, '80OSP495', 1770919060, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(6, 3, 'teslamodels', 1768931913, '06PBL615', 1770919113, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(7, 3, 'bmwg07', 1768932028, '90MRT342', 1770919228, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(8, 2, 'cg160', 1768932138, '31RHO932', 1768932138, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(9, 2, '488misha', 1768932295, '47WVZ069', 1770919495, 0, 915, 906, 906, 88, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":1,"3":1,"4":false,"5":false,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(10, 3, 'uno', 1768933952, '62LDC726', 1768933952, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(11, 5, 'uno', 1768955165, '97QFH246', 1768955165, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(12, 6, 'cg160', 1769132466, '79DPO125', 1769132466, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(13, 7, 'uno', 1769136055, '09XYI286', 1769136055, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(14, 6, 'bdragon', 1769143425, '22PKV281', 1771130625, 0, 1000, 1000, 1000, 65, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":1,"3":1,"4":false,"5":false,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(15, 6, 'bmwg07', 1769143433, '09HDQ834', 1771130633, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(16, 6, 'c981', 1769143439, '62OQH262', 1771130639, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(17, 6, 'landvelar', 1769143452, '81LOT390', 1771130652, 0, 1000, 1000, 1000, 99, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":1,"3":1,"4":false,"5":false,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(18, 1, 'youga2', 1769559570, '96WDT780', 0, 0, 1000, 1000, 1000, 100, 0, 'true', '', '', ''),
	(19, 1, 'vwgol', 1772246457, '81ILX337', 0, 0, 1000, 1000, 1000, 100, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":false,"3":false,"4":false,"5":false,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(20, 1, 'skyliner342', 1772248870, '08IJF312', 1771561311, 0, 1000, 1000, 1000, 99, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":1,"3":1,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(21, 8, 'uno', 1769790143, '26HOY010', 1769790143, 0, 996, 996, 996, 95, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(22, 10, 'scorcher', 1769830781, '69QJN883', 0, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(24, 12, 'uno', 1769983557, '87QTT127', 1769983557, 0, 962, 932, 932, 99, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":false,"5":true,"6":false,"7":false,"0":false}'),
	(25, 11, 'tenere1200', 1769986868, '04CUO349', 1771974068, 0, 1000, 1000, 1000, 99, 2000, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":true,"2":true,"3":true,"4":false,"5":true,"6":false,"7":false,"0":false}'),
	(27, 11, 'tiger1200', 1769987119, '13JFP023', 1771974319, 0, 1000, 1000, 1000, 99, 2000, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":true,"2":true,"3":true,"4":false,"5":true,"6":false,"7":false,"0":false}'),
	(29, 11, 'bmwg07', 1769989699, '26EBY457', 1771976899, 0, 999, 996, 996, 98, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":1,"3":1,"4":1,"5":1,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(30, 11, 'xt2017', 1769990678, '32IND855', 0, 0, 1000, 1000, 1000, 65, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":true,"2":true,"3":true,"4":false,"5":true,"6":false,"7":false,"0":false}'),
	(31, 11, 'as350prf', 1769993830, '29FXN335', 0, 0, 1000, 1000, 1000, 100, 0, 'true', '', '', ''),
	(32, 11, 'wrr1200prf', 1769993855, '21WNA368', 0, 0, 1000, 1000, 1000, 100, 0, 'true', '', '', ''),
	(33, 11, 'saveiro', 1769998688, '74UED277', 0, 0, 1000, 1000, 1000, 65, 2000, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(34, 13, 'cg160', 1769999945, '59CMR538', 1769999945, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(35, 12, 'fk8', 1770000743, '77TEM687', 1771987943, 0, 993, 992, 992, 97, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":false,"3":false,"4":1,"5":1,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(36, 13, 'fk8', 1770000752, '86DWH865', 1771987952, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(37, 10, 'cg160', 1770003379, '86GHK247', 1770003379, 0, 998, 978, 980, 97, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":true,"2":true,"3":true,"4":false,"5":true,"6":false,"7":false,"0":false}'),
	(38, 13, 'stockade', 1770003493, '56MEX096', 0, 0, 920, 320, 240, 99, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":false,"3":false,"4":false,"5":false,"0":1}', '{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true}'),
	(39, 8, 'lancerevolutionx', 1770044088, '74LVK556', 1772031288, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(40, 13, 'pop110i', 1770045013, '32QWG207', 1770045013, 0, 1000, 1000, 1000, 100, 0, 'false', '', '', ''),
	(41, 11, 'towtruck2', 1770051139, '22ZPM018', 0, 0, 1000, 1000, 1000, 65, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":false,"3":false,"4":false,"5":false,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(42, 11, 'towtruck', 1770051190, '12OOQ632', 0, 0, 999, 998, 998, 99, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":false,"3":false,"4":false,"5":false,"0":1}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(43, 11, 'gt63', 1770062589, '85BTY912', 1772049789, 0, 1000, 1000, 1000, 97, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":1,"3":1,"4":1,"5":1,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(44, 11, 'landvelar', 1770062693, '73IXS458', 1772049893, 0, 996, 996, 996, 98, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":1,"3":1,"4":false,"5":false,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(45, 1, 'cargobob', 1770244796, '33SRK176', 0, 0, 1000, 1000, 1000, 100, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":false,"3":false,"4":false,"5":false,"0":1}', '{"1":true,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(46, 1, 'annihilator', 1770244808, '08ITW155', 0, 0, 1000, 1000, 1000, 100, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":1,"3":1,"4":1,"5":1,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(47, 1, 'insurgent2', 1770245415, '88JGP542', 0, 0, 1000, 1000, 1000, 100, 0, 'true', '', '', '');

-- Copiando estrutura para tabela creawork.videos
CREATE TABLE IF NOT EXISTS `videos` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela creawork.videos: ~3 rows (aproximadamente)
INSERT INTO `videos` (`id`, `title`, `thumbnail`, `duration`) VALUES
	('ed4Tl0EW5fg', 'MC Denny - Vai Faz a Fila e Vem Uma De Cada Vez (DJ Lindão)', 'https://i.ytimg.com/vi/ed4Tl0EW5fg/mqdefault.jpg', '03:22'),
	('zctKiN-okXI', 'Matuê - Crack com Mussilon', 'https://i.ytimg.com/vi/zctKiN-okXI/mqdefault.jpg', '03:02'),
	('ZPcG9PCfagM', 'Matuê - Máquina do Tempo', 'https://i.ytimg.com/vi/ZPcG9PCfagM/mqdefault.jpg', '03:51');

-- Copiando estrutura para tabela creawork.vrp_properties
CREATE TABLE IF NOT EXISTS `vrp_properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `property` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `owner` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
INSERT INTO `warehouse` (`Number`, `Passport`, `Password`, `Tax`) VALUES
	(124, 1, 1234, 1771122779);

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

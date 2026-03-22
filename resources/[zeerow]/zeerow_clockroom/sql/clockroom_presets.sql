CREATE TABLE IF NOT EXISTS `zeerow_clockroom_presets` (
  `clockroom` VARCHAR(128) NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  `data` LONGTEXT NOT NULL,
  PRIMARY KEY (`clockroom`, `name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

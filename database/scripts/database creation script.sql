CREATE SCHEMA `dogs_registry` ;

CREATE TABLE `dogs_registry`.`dogs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `photo` VARCHAR(255) NOT NULL,
  `race` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `size` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));


ALTER TABLE `dogs_registry`.`dogs` 
ADD COLUMN `created_at` DATETIME NOT NULL AFTER `size`,
ADD COLUMN `updated_at` DATETIME NULL AFTER `created_at`;
ALTER TABLE `dogs_registry`.`dogs` 
CHANGE COLUMN `photo` `photo` LONGTEXT NOT NULL ;
CREATE SCHEMA `dogs_registry` ;

CREATE TABLE `dogs_registry`.`dogs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `photo` VARCHAR(255) NOT NULL,
  `race` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `size` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

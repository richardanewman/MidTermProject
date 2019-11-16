-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema goodWorkdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `goodWorkdb` ;

-- -----------------------------------------------------
-- Schema goodWorkdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goodWorkdb` DEFAULT CHARACTER SET utf8 ;
USE `goodWorkdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NULL,
  `bio` TEXT NULL,
  `photo_url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(100) NULL,
  `address2` VARCHAR(100) NULL,
  `city` VARCHAR(100) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zip_code` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `location_id` INT NOT NULL,
  `host_id` INT NOT NULL,
  `event_name` VARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  `event_date` DATE NOT NULL,
  `start_time` VARCHAR(45) NULL,
  `end_time` VARCHAR(45) NULL,
  `people_needed` INT NULL DEFAULT 1,
  `date_created` DATETIME NOT NULL,
  `photo_url` TEXT NULL,
  `point_of_contact` VARCHAR(100) NULL,
  `poc_phone` VARCHAR(45) NULL,
  `poc_email` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_location1_idx` (`location_id` ASC),
  INDEX `fk_event_host_user_idx` (`host_id` ASC),
  CONSTRAINT `fk_event_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_host_user`
    FOREIGN KEY (`host_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_event` ;

CREATE TABLE IF NOT EXISTS `user_event` (
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `date_signed_up` DATE NOT NULL,
  `event_role` VARCHAR(45) NOT NULL,
  `attended` TINYINT NOT NULL DEFAULT 0,
  `rating` INT NULL,
  `review_description` TEXT NULL,
  INDEX `fk_user_event_user_idx` (`user_id` ASC),
  INDEX `fk_user_event_event1_idx` (`event_id` ASC),
  PRIMARY KEY (`user_id`, `event_id`),
  CONSTRAINT `fk_user_event_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `organization` ;

CREATE TABLE IF NOT EXISTS `organization` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `location_id` INT NULL,
  `org_name` VARCHAR(45) NOT NULL,
  `org_type` VARCHAR(45) NOT NULL,
  `org_number` VARCHAR(45) NULL,
  `logo_url` TEXT NULL,
  `website` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_organization_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_organization_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message_board`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `message_board` ;

CREATE TABLE IF NOT EXISTS `message_board` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `date_posted` DATETIME NOT NULL,
  `content` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_message_user_idx` (`user_id` ASC),
  INDEX `fk_event_message_event_idx` (`event_id` ASC),
  CONSTRAINT `fk_event_message_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_message_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_has_category` ;

CREATE TABLE IF NOT EXISTS `event_has_category` (
  `event_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `category_id`),
  INDEX `fk_event_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_event_has_category_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_event_has_category_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `organization_has_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `organization_has_user` ;

CREATE TABLE IF NOT EXISTS `organization_has_user` (
  `organization_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`organization_id`, `user_id`),
  INDEX `fk_organization_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_organization_has_user_organization1_idx` (`organization_id` ASC),
  CONSTRAINT `fk_organization_has_user_organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `organization` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organization_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS goodWorkUser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'goodWorkUser'@'localhost' IDENTIFIED BY 'goodwork';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'goodWorkUser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (1, 'waterboy', '12345', 1, 'Bobby', 'Bushay', 'bobbyB@gmail.com', 'Serving drinks and kicking ass.', 'https://miro.medium.com/max/1914/1*nPRQgbNeVv1PqgXV-HibXg.jpeg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (1, '1255 Crocodile Lane', NULL, 'Tallahassee', 'FL', 32301);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (2, '123 Main Street', NULL, 'Tallahassee', 'FL', 32301);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `event` (`id`, `location_id`, `host_id`, `event_name`, `description`, `event_date`, `start_time`, `end_time`, `people_needed`, `date_created`, `photo_url`, `point_of_contact`, `poc_phone`, `poc_email`) VALUES (1, 1, 1, 'Neighborhood Clean-Up', 'Help Bobby Bushay clean up all the trash around 5th and Central Ave this Saturday.', '2019-11-16', '12:00:00', '14:00:00', 5, '2019-11-14-17-33-00', NULL, 'Mamma Bushay', '850-334-9876', 'mammasemail@gmail.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `user_event` (`user_id`, `event_id`, `active`, `date_signed_up`, `event_role`, `attended`, `rating`, `review_description`) VALUES (1, 1, 1, '2019-11-15', 'host', 0, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `organization`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `organization` (`id`, `location_id`, `org_name`, `org_type`, `org_number`, `logo_url`, `website`) VALUES (1, 2, 'Mamma\'s Helpers', 'Group', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'Community');

COMMIT;


-- -----------------------------------------------------
-- Data for table `message_board`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `message_board` (`id`, `event_id`, `user_id`, `date_posted`, `content`) VALUES (1, 1, 1, '2019-11-14-17-33-00', 'Somebody better sign up and help me clean. Please.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_has_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `event_has_category` (`event_id`, `category_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `organization_has_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (1, 1);

COMMIT;


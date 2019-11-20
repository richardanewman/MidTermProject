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
  `city` VARCHAR(100) NOT NULL DEFAULT 'Denver',
  `state` CHAR(2) NOT NULL DEFAULT 'CO',
  `zip_code` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `location_id` INT NULL,
  `host_id` INT NULL,
  `event_name` VARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  `event_date` VARCHAR(45) NOT NULL,
  `start_time` VARCHAR(45) NULL,
  `end_time` VARCHAR(45) NULL,
  `people_needed` INT NULL DEFAULT 1,
  `date_created` DATETIME NULL,
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
  `description` TEXT NULL,
  `org_type` VARCHAR(45) NOT NULL,
  `org_number` VARCHAR(45) NULL,
  `logo_url` TEXT NULL,
  `website` VARCHAR(2000) NULL,
  `active` TINYINT NULL DEFAULT 1,
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
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (1, 'waterboy', '123', 1, 'Bobby', 'Bushay', 'bobbyB@gmail.com', 'Serving drinks and kicking ass.', 'https://miro.medium.com/max/1914/1*nPRQgbNeVv1PqgXV-HibXg.jpeg');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (2, 'david', '123', 1, 'David', 'Norris', 'dn@gmail.com', 'Drinking monster, writing code, and kicking ass.', 'https://trello-avatars.s3.amazonaws.com/5a6958e584c07bee62f2d218d99b93c5/original.png');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (3, 'jerry', '123', 1, 'Jerry', 'Rogers', 'jr@gmail.com', 'Riding motorcycles, coding java, and kicking ass. Oh and volunteeing.', 'https://avatars2.githubusercontent.com/u/43429899?s=460&v=4');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (4, 'rick', '123', 1, 'Rick', 'Newman', 'rn@gmail.com', 'Drinking coffee, writing code, and kicking ass. ', 'https://avatars3.githubusercontent.com/u/17536735?s=400&v=4');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (5, 'adam', '123', 1, 'Adam', 'Onwan', 'ao@gmail.com', 'Learning full stack!', 'https://avatars0.githubusercontent.com/u/51185732?s=400&v=4');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (6, 'colt', '123', 1, 'Colt', 'Looper', 'cl@gmail.com', 'Full stack java mofo!', 'https://avatars2.githubusercontent.com/u/48541678?s=400&v=4');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (7, 'cesar', '123', 1, 'Cesar', 'Moreno', 'cm@gmail.com', 'Drinking beer, kicking ass, and taking name.', 'https://avatars2.githubusercontent.com/u/54081564?s=400&v=4');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (8, 'jacob', '123', 1, 'Jacob', 'Shorter-Ivey', 'js@gmail.com', 'Coding video games allday everyday.', 'https://avatars2.githubusercontent.com/u/54083792?s=400&v=4');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (9, 'jared', '123', 1, 'Jared', 'McGowan', 'jm@gmail.com', 'Drinking java, writing java, and flying airplanes.', 'https://avatars3.githubusercontent.com/u/29109079?s=400&v=4');
INSERT INTO `user` (`id`, `username`, `password`, `active`, `first_name`, `last_name`, `email`, `bio`, `photo_url`) VALUES (10, 'jesse', '123', 1, 'Jesse', 'Trew', 'jt@gmail.com', 'I like dinosaurs.', 'https://avatars1.githubusercontent.com/u/54376581?s=400&v=4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (1, '1255 Crocodile Lane', NULL, 'Tallahassee', 'FL', 32301);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (2, '123 Main Street', NULL, 'Tallahassee', 'FL', 32301);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (3, '2660 Larimer Street', NULL, 'Denver', 'CO', 80205);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (4, '600 South Marion Parkway', NULL, 'Denver', 'CO', 80209);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (5, '3012 Sterling Circle', 'Suite #201', 'Boulder', 'CO', 80301);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (6, '105 South Aspen Ave', NULL, 'Lone Tree', 'CO', 80124);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (7, '7400 E. Orchard Road', NULL, 'Greenwood Village', 'CO', 80111);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (8, '555 Pine Street', NULL, 'Lone Tree', 'CO', 80124);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (9, '1130 Park Ave', NULL, 'Denver', 'CO', 80205);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (10, 'Sanderson Gulch Trail', NULL, 'Denver', 'CO', 80219);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (DEFAULT, NULL, NULL, DEFAULT, DEFAULT, NULL);
INSERT INTO `location` (`id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (DEFAULT, NULL, NULL, DEFAULT, DEFAULT, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `event` (`id`, `location_id`, `host_id`, `event_name`, `description`, `event_date`, `start_time`, `end_time`, `people_needed`, `date_created`, `photo_url`, `point_of_contact`, `poc_phone`, `poc_email`) VALUES (1, 1, 1, 'Neighborhood Clean-Up', 'Help Bobby Bushay clean up all the trash around 5th and Central Ave this Saturday.', '2019-11-16', '12:00:00', '14:00:00', 5, '2019-11-14-17-33-00', NULL, 'Mamma Bushay', '850-334-9876', 'mammasemail@gmail.com');
INSERT INTO `event` (`id`, `location_id`, `host_id`, `event_name`, `description`, `event_date`, `start_time`, `end_time`, `people_needed`, `date_created`, `photo_url`, `point_of_contact`, `poc_phone`, `poc_email`) VALUES (2, 7, 2, 'Feed the students!', 'Join us at Skill Distillery and help feed the hungry aspiring software developers.', '2019-11-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `event` (`id`, `location_id`, `host_id`, `event_name`, `description`, `event_date`, `start_time`, `end_time`, `people_needed`, `date_created`, `photo_url`, `point_of_contact`, `poc_phone`, `poc_email`) VALUES (3, 8, 3, 'Neighborhood Knock', 'Going door to door in our neighborhood to assist the elderly with yardwork.', '2019-12-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `event` (`id`, `location_id`, `host_id`, `event_name`, `description`, `event_date`, `start_time`, `end_time`, `people_needed`, `date_created`, `photo_url`, `point_of_contact`, `poc_phone`, `poc_email`) VALUES (4, 9, 4, 'Help the Homeless', 'Join us at the Denver soup kitchen to help the homeless.', '2019-11-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `event` (`id`, `location_id`, `host_id`, `event_name`, `description`, `event_date`, `start_time`, `end_time`, `people_needed`, `date_created`, `photo_url`, `point_of_contact`, `poc_phone`, `poc_email`) VALUES (5, 10, 5, 'Clear the Trail', 'We love the outdoors and we love keeping them clean. Help us clean up different trails every weekend.', '2019-11-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO `organization` (`id`, `location_id`, `org_name`, `description`, `org_type`, `org_number`, `logo_url`, `website`, `active`) VALUES (1, 2, 'Mamma\'s Helpers', 'Big Mamma\'s merry group of helpers.', 'Group', '12345', 'None', 'Nope', 1);
INSERT INTO `organization` (`id`, `location_id`, `org_name`, `description`, `org_type`, `org_number`, `logo_url`, `website`, `active`) VALUES (2, 3, 'Volunteers of America', 'Volunteers of America is dedicated to supporting and empowering America\'s most vulnerable groups, including the hungry, the frail elderly, people with disabilities, at-risk youth, homeless individuals, women in need, and veterans and their families.', 'Non-Profit', 'Tax ID 13-1692595', 'https://voa-production.s3.amazonaws.com/uploads/affiliate_site/logo_image_color/15/affiliate-colorado-branch.png', 'https://www.voacolorado.org/', 1);
INSERT INTO `organization` (`id`, `location_id`, `org_name`, `description`, `org_type`, `org_number`, `logo_url`, `website`, `active`) VALUES (3, 4, 'Volunteer For Outdoor Colorado', 'Since 1984, Volunteers for Outdoor Colorado (VOC) has been motivating and enabling people to become active stewards of Colorado’s natural resources.\n\nVOC works with conservation and land agencies and relies on thousands of people annually to provide a volunteer workforce for outdoor stewardship projects. These projects take place across Colorado – from city parks and open spaces, to grasslands and foothills, to alpine meadows and peaks.', 'Non-Profit', '(Tax ID #)74-2357211', 'https://www.voc.org/sites/default/files/VOC-logo-small.png', 'https://www.voc.org/', 1);
INSERT INTO `organization` (`id`, `location_id`, `org_name`, `description`, `org_type`, `org_number`, `logo_url`, `website`, `active`) VALUES (4, 5, 'Wildlands Restoration Volunteers', 'Wildlands Restoration Volunteers is a nonprofit organization that provides an opportunity for people to come together, learn about their natural environment, and take direct action to restore and care for the land.', 'Non-Profit', '46-0505155', 'https://www.wlrv.org/wp-content/uploads/transparent-web-versian-longerer.png', 'https://www.wlrv.org/', 1);
INSERT INTO `organization` (`id`, `location_id`, `org_name`, `description`, `org_type`, `org_number`, `logo_url`, `website`, `active`) VALUES (5, 6, 'Good Neighbors', 'Private group of neighbors who clean up and help the elderly in our community. ', 'Private Group', 'None', 'https://uwm.edu/neighborhoodhousing/wp-content/uploads/sites/149/2018/09/04-900x450.jpg', 'none', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'Clean-Up');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'Technology');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'Children & Youth');
INSERT INTO `category` (`id`, `name`) VALUES (4, 'Animals');
INSERT INTO `category` (`id`, `name`) VALUES (5, 'Arts & Culture');
INSERT INTO `category` (`id`, `name`) VALUES (6, 'Community');
INSERT INTO `category` (`id`, `name`) VALUES (7, 'Education');
INSERT INTO `category` (`id`, `name`) VALUES (8, 'Health & Medicine');
INSERT INTO `category` (`id`, `name`) VALUES (9, 'Seniors');
INSERT INTO `category` (`id`, `name`) VALUES (10, 'Disaster Relief');
INSERT INTO `category` (`id`, `name`) VALUES (11, 'Hunger');
INSERT INTO `category` (`id`, `name`) VALUES (12, 'Veterans & Military Families');
INSERT INTO `category` (`id`, `name`) VALUES (13, 'Disabilities');
INSERT INTO `category` (`id`, `name`) VALUES (14, 'Other');

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
INSERT INTO `event_has_category` (`event_id`, `category_id`) VALUES (2, 11);
INSERT INTO `event_has_category` (`event_id`, `category_id`) VALUES (3, 9);
INSERT INTO `event_has_category` (`event_id`, `category_id`) VALUES (4, 6);
INSERT INTO `event_has_category` (`event_id`, `category_id`) VALUES (5, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `organization_has_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `goodWorkdb`;
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (1, 1);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (2, 2);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (2, 10);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (3, 1);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (3, 5);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (3, 9);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (4, 8);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (4, 9);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (4, 10);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (5, 3);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (5, 4);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (5, 6);
INSERT INTO `organization_has_user` (`organization_id`, `user_id`) VALUES (2, 7);

COMMIT;


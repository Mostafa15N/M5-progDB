-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`achievements` (
  `achievement_id` INT NOT NULL,
  `naam` VARCHAR(45) NULL,
  `beschrijving` VARCHAR(45) NULL,
  `behaalde_achievements_behaald_id` INT NOT NULL,
  PRIMARY KEY (`achievement_id`),
  INDEX `fk_achievements_behaalde_achievements1_idx` (`behaalde_achievements_behaald_id` ASC) VISIBLE,
  CONSTRAINT `fk_achievements_behaalde_achievements1`
    FOREIGN KEY (`behaalde_achievements_behaald_id`)
    REFERENCES `mydb`.`behaalde_achievements` (`behaald_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`behaalde_achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`behaalde_achievements` (
  `behaald_id` INT NOT NULL,
  `gamer_id` VARCHAR(45) NULL,
  `achievement_id` VARCHAR(45) NULL,
  `datum_behaald` VARCHAR(45) NULL,
  `achievements_achievement_id` INT NOT NULL,
  PRIMARY KEY (`behaald_id`),
  INDEX `fk_behaalde_achievements_achievements1_idx` (`achievements_achievement_id` ASC) VISIBLE,
  CONSTRAINT `fk_behaalde_achievements_achievements1`
    FOREIGN KEY (`achievements_achievement_id`)
    REFERENCES `mydb`.`achievements` (`achievement_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`games` (
  `game_id` INT NOT NULL,
  `naam` VARCHAR(45) NULL,
  `releasedatum` VARCHAR(45) NULL,
  `ontwikkelaar` VARCHAR(45) NULL,
  `gespeelde_spellen_gespeeld_id` INT NOT NULL,
  PRIMARY KEY (`game_id`),
  INDEX `fk_games_gespeelde_spellen1_idx` (`gespeelde_spellen_gespeeld_id` ASC) VISIBLE,
  CONSTRAINT `fk_games_gespeelde_spellen1`
    FOREIGN KEY (`gespeelde_spellen_gespeeld_id`)
    REFERENCES `mydb`.`gespeelde_spellen` (`gespeeld_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gespeelde_spellen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gespeelde_spellen` (
  `gespeeld_id` INT NOT NULL,
  `gamer_id` VARCHAR(45) NULL,
  `game_id` VARCHAR(45) NULL,
  `datum_gespeeld` VARCHAR(45) NULL,
  `games_game_id` INT NOT NULL,
  PRIMARY KEY (`gespeeld_id`),
  INDEX `fk_gespeelde_spellen_games1_idx` (`games_game_id` ASC) VISIBLE,
  CONSTRAINT `fk_gespeelde_spellen_games1`
    FOREIGN KEY (`games_game_id`)
    REFERENCES `mydb`.`games` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gameraccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gameraccount` (
  `gamer_id` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `wachtwoord` VARCHAR(45) NULL,
  `datum_aanmaak` VARCHAR(45) NULL,
  `behaalde_achievements_behaald_id` INT NOT NULL,
  `gespeelde_spellen_gespeeld_id` INT NOT NULL,
  `gespeelde_spellen_gespeeld_id1` INT NOT NULL,
  `behaalde_achievements_behaald_id1` INT NOT NULL,
  PRIMARY KEY (`gamer_id`),
  INDEX `fk_gameraccount_behaalde_achievements_idx` (`behaalde_achievements_behaald_id` ASC) VISIBLE,
  INDEX `fk_gameraccount_gespeelde_spellen1_idx` (`gespeelde_spellen_gespeeld_id` ASC) VISIBLE,
  INDEX `fk_gameraccount_gespeelde_spellen2_idx` (`gespeelde_spellen_gespeeld_id1` ASC) VISIBLE,
  INDEX `fk_gameraccount_behaalde_achievements1_idx` (`behaalde_achievements_behaald_id1` ASC) VISIBLE,
  CONSTRAINT `fk_gameraccount_behaalde_achievements`
    FOREIGN KEY (`behaalde_achievements_behaald_id`)
    REFERENCES `mydb`.`behaalde_achievements` (`behaald_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gameraccount_gespeelde_spellen1`
    FOREIGN KEY (`gespeelde_spellen_gespeeld_id`)
    REFERENCES `mydb`.`gespeelde_spellen` (`gespeeld_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gameraccount_gespeelde_spellen2`
    FOREIGN KEY (`gespeelde_spellen_gespeeld_id1`)
    REFERENCES `mydb`.`gespeelde_spellen` (`gespeeld_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gameraccount_behaalde_achievements1`
    FOREIGN KEY (`behaalde_achievements_behaald_id1`)
    REFERENCES `mydb`.`behaalde_achievements` (`behaald_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

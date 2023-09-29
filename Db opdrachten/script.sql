-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `dbfirst`.`bestellingen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`bestellingen` (
  `BestelID` INT NOT NULL,
  `KlantID` VARCHAR(45) NULL DEFAULT NULL,
  `ProductID` VARCHAR(45) NULL DEFAULT NULL,
  `Aantal` VARCHAR(45) NULL DEFAULT NULL,
  `Totaalprijs` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`BestelID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`klanten`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`klanten` (
  `KlantID` INT NOT NULL,
  `Voornaam` VARCHAR(45) NULL DEFAULT NULL,
  `Achternaam` VARCHAR(45) NULL DEFAULT NULL,
  `E-mail` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`KlantID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`producten`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`producten` (
  `ProductID` INT NOT NULL,
  `Naam` VARCHAR(45) NULL DEFAULT NULL,
  `Prijs` VARCHAR(45) NULL DEFAULT NULL,
  `Voorraad` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

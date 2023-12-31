-- MySQL Script generated by MySQL Workbench
-- Thu Dec 21 17:50:42 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema diabet_predict
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema diabet_predict
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `diabet_predict` DEFAULT CHARACTER SET utf8 ;
USE `diabet_predict` ;

-- -----------------------------------------------------
-- Table `diabet_predict`.`Gender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diabet_predict`.`Gender` (
  `ID` INT NOT NULL,
  `name` VARCHAR(16) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diabet_predict`.`SmokingHistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diabet_predict`.`SmokingHistory` (
  `ID` INT NOT NULL,
  `info` VARCHAR(64) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diabet_predict`.`BloodAnalysis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diabet_predict`.`BloodAnalysis` (
  `ID` INT NOT NULL,
  `genderID` INT NULL,
  `skID` INT NULL,
  `age` TINYINT UNSIGNED NULL,
  `bmi` DECIMAL(10,2) UNSIGNED NULL,
  `hbA1c_level` DECIMAL(10,2) UNSIGNED NULL,
  `blood_glucose` SMALLINT UNSIGNED NULL,
  `heart_disease` TINYINT UNSIGNED NULL,
  `hypertension` TINYINT UNSIGNED NULL,
  `diabetes` TINYINT UNSIGNED NULL,
  PRIMARY KEY (`ID`),
  INDEX `genderID_idx` (`genderID` ASC) VISIBLE,
  INDEX `skID_idx` (`skID` ASC) VISIBLE,
  CONSTRAINT `genderID`
    FOREIGN KEY (`genderID`)
    REFERENCES `diabet_predict`.`Gender` (`ID`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT `skID`
    FOREIGN KEY (`skID`)
    REFERENCES `diabet_predict`.`SmokingHistory` (`ID`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

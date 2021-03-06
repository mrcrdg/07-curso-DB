-- MySQL Script generated by MySQL Workbench
-- qui 03 set 2020 09:15:35 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Survey_Schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Survey_Schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Survey_Schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Survey_Schema` ;

-- -----------------------------------------------------
-- Table `Survey_Schema`.`PERSON`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Survey_Schema`.`PERSON` (
  `ID_PERSON` VARCHAR(50) NOT NULL,
  `NOME_PERSON` VARCHAR(100) NOT NULL,
  `FAMILY_NAME` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PERSON`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Survey_Schema`.`SITE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Survey_Schema`.`SITE` (
  `NOME_SITE` VARCHAR(20) NOT NULL,
  `LAT` FLOAT NULL DEFAULT NULL,
  `LONGIT` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`NOME_SITE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Survey_Schema`.`VISITED`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Survey_Schema`.`VISITED` (
  `ID_VISITED` VARCHAR(20) NOT NULL,
  `VISITED_SITE` VARCHAR(20) NOT NULL,
  `DATA_VISITA` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID_VISITED`),
  INDEX `FK_VISITED_SITE` (`VISITED_SITE` ASC) VISIBLE,
  CONSTRAINT `FK_VISITED_SITE`
    FOREIGN KEY (`VISITED_SITE`)
    REFERENCES `Survey_Schema`.`SITE` (`NOME_SITE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Survey_Schema`.`SURVEY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Survey_Schema`.`SURVEY` (
  `TAKEN` VARCHAR(20) NOT NULL,
  `PERSON_SURVEY` VARCHAR(50) NULL DEFAULT NULL,
  `QUANT` VARCHAR(15) NULL DEFAULT NULL,
  `READING` FLOAT NULL DEFAULT NULL,
  INDEX `FK_SURVEY_VISITED` (`TAKEN` ASC) VISIBLE,
  INDEX `FK_SURVEY_PERSON` (`PERSON_SURVEY` ASC) VISIBLE,
  CONSTRAINT `FK_SURVEY_PERSON`
    FOREIGN KEY (`PERSON_SURVEY`)
    REFERENCES `Survey_Schema`.`PERSON` (`ID_PERSON`),
  CONSTRAINT `FK_SURVEY_VISITED`
    FOREIGN KEY (`TAKEN`)
    REFERENCES `Survey_Schema`.`VISITED` (`ID_VISITED`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
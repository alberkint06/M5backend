-- MySQL Script generated by MySQL Workbench
-- Thu Oct 19 10:02:44 2023
-- Model: New Model    Version: 1.0
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
-- Table `dbfirst`.`developer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`developer` (
  `iddeveloper` INT NOT NULL,
  `published_games` VARCHAR(45) NULL DEFAULT NULL,
  `revenue` INT NULL DEFAULT NULL,
  PRIMARY KEY (`iddeveloper`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`games` (
  `idgames` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `developer` VARCHAR(45) NULL DEFAULT NULL,
  `publisher` VARCHAR(45) NULL DEFAULT NULL,
  `genre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idgames`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`user` (
  `iduser` INT NOT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `balance` VARCHAR(45) NULL DEFAULT NULL,
  `friendcode` INT NULL DEFAULT NULL,
  `games_idgames` INT NOT NULL,
  PRIMARY KEY (`iduser`, `games_idgames`),
  INDEX `fk_user_games_idx` (`games_idgames` ASC) VISIBLE,
  CONSTRAINT `fk_user_games`
    FOREIGN KEY (`games_idgames`)
    REFERENCES `dbfirst`.`games` (`idgames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`developer_has_games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`developer_has_games` (
  `developer_iddeveloper` INT NOT NULL,
  `games_idgames` INT NOT NULL,
  PRIMARY KEY (`developer_iddeveloper`, `games_idgames`),
  INDEX `fk_developer_has_games_games1_idx` (`games_idgames` ASC) VISIBLE,
  INDEX `fk_developer_has_games_developer1_idx` (`developer_iddeveloper` ASC) VISIBLE,
  CONSTRAINT `fk_developer_has_games_developer1`
    FOREIGN KEY (`developer_iddeveloper`)
    REFERENCES `dbfirst`.`developer` (`iddeveloper`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_developer_has_games_games1`
    FOREIGN KEY (`games_idgames`)
    REFERENCES `dbfirst`.`games` (`idgames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

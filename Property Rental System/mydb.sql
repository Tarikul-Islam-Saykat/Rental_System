-- MySQL Script generated by MySQL Workbench
-- Tue Aug  9 21:29:19 2022
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Owner` (
  `Email` VARCHAR(45) NOT NULL,
  `Name` CHAR(20) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Mobile No.` INT NOT NULL,
  `City Corporation` ENUM("North", "South", "East", "West") NOT NULL,
  `Police Station` VARCHAR(45) NULL,
  `Post Code` INT NOT NULL,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  PRIMARY KEY (`Email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Property`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Property` (
  `Property code` VARCHAR(5) NOT NULL,
  `Property Name` VARCHAR(50) NOT NULL,
  `Discription` LONGTEXT NULL,
  `Location` VARCHAR(45) NULL,
  `Rent` INT NULL,
  `Image` BLOB NULL,
  `Rented` ENUM("YES", "NO") NOT NULL,
  PRIMARY KEY (`Property code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tenant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tenant` (
  `Email` VARCHAR(45) NOT NULL,
  `Name` CHAR(20) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Mobile No.` INT NOT NULL,
  `City Corporation` ENUM("North", "South", "East", "West") NOT NULL,
  `Post Code` INT NOT NULL,
  PRIMARY KEY (`Email`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Owner_has_Property`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Owner_has_Property` (
  `Owner_Email` VARCHAR(45) NOT NULL,
  `Property_Property code` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`Owner_Email`, `Property_Property code`),
  INDEX `fk_Owner_has_Property_Property1_idx` (`Property_Property code` ASC) VISIBLE,
  INDEX `fk_Owner_has_Property_Owner_idx` (`Owner_Email` ASC) VISIBLE,
  CONSTRAINT `fk_Owner_has_Property_Owner`
    FOREIGN KEY (`Owner_Email`)
    REFERENCES `mydb`.`Owner` (`Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Owner_has_Property_Property1`
    FOREIGN KEY (`Property_Property code`)
    REFERENCES `mydb`.`Property` (`Property code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

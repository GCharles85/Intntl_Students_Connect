-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema alumstudentdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema alumstudentdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `alumstudentdb` DEFAULT CHARACTER SET utf8 ;
USE `alumstudentdb` ;

-- -----------------------------------------------------
-- Table `alumstudentdb`.`davisrep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumstudentdb`.`davisrep` (
  `colbyRep_id` INT NOT NULL,
  `colbyRep_firstName` CHAR(15) NOT NULL,
  `colbyRep_Name` CHAR(15) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `yearsWorked` INT NOT NULL,
  PRIMARY KEY (`colbyRep_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumstudentdb`.`industry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumstudentdb`.`industry` (
  `industryType` CHAR(20) NOT NULL,
  `industryName` CHAR(15) NOT NULL,
  `med_Salary` INT(10) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`industryType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumstudentdb`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumstudentdb`.`company` (
  `company_Name` VARCHAR(30) NOT NULL,
  `industryT` VARCHAR(20) NOT NULL,
  `numberOfEmployees` INT NOT NULL,
  `city` CHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`company_Name`),
  INDEX `industryT_idx` (`industryT` ASC),
  CONSTRAINT `industryT`
    FOREIGN KEY (`industryT`)
    REFERENCES `alumstudentdb`.`industry` (`industryType`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumstudentdb`.`alumni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumstudentdb`.`alumni` (
  `idAlumni` INT NOT NULL,
  `major` CHAR(25) NOT NULL,
  `indType` CHAR(20) NOT NULL,
  `Position` VARCHAR(20) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `Year` INT NOT NULL,
  `colbyrep_ID` INT NOT NULL,
  `alumni_FirstName` CHAR(15) NOT NULL,
  `alumni_Name` CHAR(15) NOT NULL,
  `Comp.` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idAlumni`),
  INDEX `indType_idx` (`indType` ASC),
  INDEX `colbyrep_ID_idx` (`colbyrep_ID` ASC),
  INDEX `Comp._idx` (`Comp.` ASC),
  CONSTRAINT `colbyrep_ID`
    FOREIGN KEY (`colbyrep_ID`)
    REFERENCES `alumstudentdb`.`davisrep` (`colbyRep_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `indType`
    FOREIGN KEY (`indType`)
    REFERENCES `alumstudentdb`.`industry` (`industryType`)
    ON UPDATE CASCADE,
  CONSTRAINT `Comp.`
    FOREIGN KEY (`Comp.`)
    REFERENCES `alumstudentdb`.`company` (`company_Name`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `alumstudentdb`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alumstudentdb`.`students` (
  `idstudents` INT NOT NULL,
  `student_firstName` CHAR(15) NOT NULL,
  `student_Name` CHAR(15) NOT NULL,
  `graduationYear` INT NOT NULL,
  `major` CHAR(25) NOT NULL,
  `Year` CHAR(12) NOT NULL,
  `colbyrep_ID` INT NOT NULL,
  PRIMARY KEY (`idstudents`),
  INDEX `colby_repID_idx` (`colbyrep_ID` ASC),
  CONSTRAINT `colby_repID`
    FOREIGN KEY (`colbyrep_ID`)
    REFERENCES `alumstudentdb`.`davisrep` (`colbyRep_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

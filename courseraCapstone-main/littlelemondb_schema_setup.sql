-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8 ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`staff` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `id` INT NOT NULL,
  `tablenumber` INT NOT NULL,
  `bookingdate` DATETIME NOT NULL,
  `staffid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `staffid_idx` (`staffid` ASC) VISIBLE,
  CONSTRAINT `staffid`
    FOREIGN KEY (`staffid`)
    REFERENCES `littlelemondb`.`staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menuitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menuitems` (
  `id` INT NOT NULL,
  `coursename` VARCHAR(50) NOT NULL,
  `startername` VARCHAR(50) NOT NULL,
  `desertname` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`menu` (
  `id` INT NOT NULL,
  `menuitemid` INT NOT NULL,
  `menuname` VARCHAR(50) NOT NULL,
  `cuisine` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `menuid`
    FOREIGN KEY (`id`)
    REFERENCES `littlelemondb`.`menuitems` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`deliverys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`deliverys` (
  `id` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `deliverydate` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customer` (
  `id` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `phone` INT NULL,
  `email` VARCHAR(200) NOT NULL,
  `lastname` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orders` (
  `id` INT NOT NULL,
  `orderdate` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  `cost` DECIMAL(25,2) NOT NULL,
  `bookingsid` INT NULL,
  `deliveryid` INT NULL,
  `menuid` INT NOT NULL,
  `customerid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `bookingsid_idx` (`bookingsid` ASC) VISIBLE,
  INDEX `menuid_idx` (`menuid` ASC) VISIBLE,
  INDEX `deliveryid_idx` (`deliveryid` ASC) VISIBLE,
  INDEX `customerid_idx` (`customerid` ASC) VISIBLE,
  CONSTRAINT `bookingsid`
    FOREIGN KEY (`bookingsid`)
    REFERENCES `littlelemondb`.`bookings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menuid`
    FOREIGN KEY (`menuid`)
    REFERENCES `littlelemondb`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `deliveryid`
    FOREIGN KEY (`deliveryid`)
    REFERENCES `littlelemondb`.`deliverys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customerid`
    FOREIGN KEY (`customerid`)
    REFERENCES `littlelemondb`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

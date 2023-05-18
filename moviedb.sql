-- MySQL Script generated by MySQL Workbench
-- 08/13/17 21:17:23
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema moviedb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema moviedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `moviedb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `moviedb` ;

-- -----------------------------------------------------
-- Table `moviedb`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`actor` (
  `act_id` INT NOT NULL,
  `act_fname` VARCHAR(45) NOT NULL,
  `act_lname` VARCHAR(45) NOT NULL,
  `act_gender` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`act_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`movie` (
  `mov_id` INT NOT NULL,
  `mov_title` VARCHAR(50) NOT NULL,
  `mov_year` INT NOT NULL,
  `mov_time` INT NOT NULL,
  `mov_lang` VARCHAR(50) NOT NULL,
  `mov_dt_rel` DATE NULL,
  `mov_rel_country` VARCHAR(5) NULL,
  PRIMARY KEY (`mov_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`movie_cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`movie_cast` (
  `act_id` INT NOT NULL,
  `mov_id` INT NOT NULL,
  `role` VARCHAR(30) NOT NULL,
  INDEX `fk_movie_cast_actor_idx` (`act_id` ASC),
  INDEX `fk_movie_cast_movie1_idx` (`mov_id` ASC),
  CONSTRAINT `fk_movie_cast_actor`
    FOREIGN KEY (`act_id`)
    REFERENCES `moviedb`.`actor` (`act_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_cast_movie1`
    FOREIGN KEY (`mov_id`)
    REFERENCES `moviedb`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`genres` (
  `gen_id` INT NOT NULL,
  `gen_title` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`gen_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`director` (
  `dir_id` INT NOT NULL,
  `dir_fname` VARCHAR(45) NOT NULL,
  `dir_lname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dir_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`movie_direction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`movie_direction` (
  `dir_id` INT NOT NULL,
  `mov_id` INT NOT NULL,
  INDEX `fk_movie_direction_director1_idx` (`dir_id` ASC),
  INDEX `fk_movie_direction_movie1_idx` (`mov_id` ASC),
  CONSTRAINT `fk_movie_direction_director1`
    FOREIGN KEY (`dir_id`)
    REFERENCES `moviedb`.`director` (`dir_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_direction_movie1`
    FOREIGN KEY (`mov_id`)
    REFERENCES `moviedb`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`reviewer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`reviewer` (
  `rev_id` INT NOT NULL,
  `rev_name` VARCHAR(45) NULL,
  PRIMARY KEY (`rev_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`movie_genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`movie_genres` (
  `mov_id` INT NOT NULL,
  `gen_id` INT NOT NULL,
  INDEX `fk_movie_genres_movie1_idx` (`mov_id` ASC),
  INDEX `fk_movie_genres_genres1_idx` (`gen_id` ASC),
  CONSTRAINT `fk_movie_genres_movie1`
    FOREIGN KEY (`mov_id`)
    REFERENCES `moviedb`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_genres_genres1`
    FOREIGN KEY (`gen_id`)
    REFERENCES `moviedb`.`genres` (`gen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`rating` (
  `mov_id` INT NOT NULL,
  `rev_id` INT NOT NULL,
  `rev_stars` INT NOT NULL,
  `num_o_ratings` INT NOT NULL,
  INDEX `fk_rating_reviewer1_idx` (`rev_id` ASC),
  INDEX `fk_rating_movie1_idx` (`mov_id` ASC),
  CONSTRAINT `fk_rating_reviewer1`
    FOREIGN KEY (`rev_id`)
    REFERENCES `moviedb`.`reviewer` (`rev_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_movie1`
    FOREIGN KEY (`mov_id`)
    REFERENCES `moviedb`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

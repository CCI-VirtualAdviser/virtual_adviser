-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema virtual_adviser2
-- -----------------------------------------------------
-- virtual_adviser2 was created on 12/28/2014 in order to split the course_id into two columns now: course_id (like "3120") and dept_id (like "ITIS")

-- -----------------------------------------------------
-- Schema virtual_adviser2
--
-- virtual_adviser2 was created on 12/28/2014 in order to split the course_id into two columns now: course_id (like "3120") and dept_id (like "ITIS")
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `virtual_adviser2` DEFAULT CHARACTER SET latin1 ;
USE `virtual_adviser2` ;

-- -----------------------------------------------------
-- Table `virtual_adviser2`.`advisers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`advisers` (
  `adviser_id` VARCHAR(9) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_intial` VARCHAR(3) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`adviser_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`course_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`course_list` (
  `course_id` VARCHAR(11) NOT NULL,
  `course_name` VARCHAR(225) NOT NULL,
  `credit_hours` TINYINT(2) UNSIGNED NOT NULL,
  `dept_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`course_id`, `dept_id`,`credit_hours`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

drop table corequisites;
-- -----------------------------------------------------
-- Table `virtual_adviser2`.`corequisites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`corequisites` (
  `course_id` VARCHAR(11) NOT NULL,
  `coreq_list` VARCHAR(100) NOT NULL,
  `dept_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`course_id`, `dept_id`),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `corequisites_ibfk_1`
    FOREIGN KEY (`course_id`)
    REFERENCES `virtual_adviser2`.`course_list` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    INDEX `course_id_idx2` (`dept_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`degree_program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`degree_program` (
  `program_id` VARCHAR(100) NOT NULL,
  `concentration_id` VARCHAR(100) NOT NULL,
  `focus_id` VARCHAR(100) NULL,
  `IT_elective_hours` TINYINT(4) UNSIGNED NULL,
  `free_elective_hours` VARCHAR(3) NULL,
  PRIMARY KEY (`program_id`, `concentration_id`, `focus_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`students` (
  `student_id` VARCHAR(9) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_intial` VARCHAR(3) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `adviser_id` VARCHAR(9) NOT NULL,
  `program_id` VARCHAR(100) NOT NULL,
  `concentration_id` VARCHAR(100) NOT NULL,
  `outside_concentration_id` VARCHAR(100) NULL DEFAULT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `program_id_idx` (`program_id` ASC),
  INDEX `concentration_id_idx` (`concentration_id` ASC),
  INDEX `outside_concentration_id_idx` (`outside_concentration_id` ASC),
  INDEX `adviser_id` (`adviser_id` ASC),
  INDEX `program_id` (`program_id` ASC, `concentration_id` ASC),
  CONSTRAINT `students_ibfk_1`
    FOREIGN KEY (`adviser_id`)
    REFERENCES `virtual_adviser2`.`advisers` (`adviser_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `students_ibfk_2`
    FOREIGN KEY (`program_id` , `concentration_id`)
    REFERENCES `virtual_adviser2`.`degree_program` (`program_id` , `concentration_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

DROP TABLE courses_planning;
-- -----------------------------------------------------
-- Table `virtual_adviser2`.`courses_planning`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`courses_planning` (
  `student_id` VARCHAR(9) NOT NULL,
  `course_id` VARCHAR(11) NOT NULL,
  `dept_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`, `dept_id`),
  INDEX `student_id_idx` (`student_id` ASC),
  CONSTRAINT `courses_planning_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `virtual_adviser2`.`students` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`courses_taken`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`courses_taken` (
  `student_id` VARCHAR(9) NOT NULL,
  `course_id` VARCHAR(11) NOT NULL,
  `letter_grade` ENUM('A','B','C','D','F','I','W','P','N','TP','TA','TB','TC','QF','QD','RF') NOT NULL,
  `semester_id` VARCHAR(6) NOT NULL,
  `exemption_for_course` VARCHAR(6) NULL,
  `exemption_for_dept` VARCHAR(4) NULL,
  `dept_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`, `semester_id`, `dept_id`),
  INDEX `student_id_idx` (`student_id` ASC),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `courses_taken_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `virtual_adviser2`.`students` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`courses_taking_now`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`courses_taking_now` (
  `student_id` VARCHAR(9) NOT NULL,
  `course_id` VARCHAR(11) NOT NULL,
  `dept_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`, `dept_id`),
  INDEX `student_id_idx` (`student_id` ASC),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `courses_taking_now_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `virtual_adviser2`.`students` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `courses_taking_now_ibfk_2`
    FOREIGN KEY (`course_id`)
    REFERENCES `virtual_adviser2`.`course_list` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`cross_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`cross_list` (
  `course_id` VARCHAR(11) NOT NULL,
  `cross_listed_as_dept` VARCHAR(4) NOT NULL,
  `dept_id` VARCHAR(4) NOT NULL,
  `cross_listed_as_course` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`course_id`, `dept_id`),
  INDEX `crosslist_course_id_idx` (`course_id` ASC),
  INDEX `cross_listed_as_id_idx` (`cross_listed_as_dept` ASC),
  CONSTRAINT `cross_list_ibfk_1`
    FOREIGN KEY (`course_id`)
    REFERENCES `virtual_adviser2`.`course_list` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `cross_list_ibfk_2`
    FOREIGN KEY (`cross_listed_as_dept`)
    REFERENCES `virtual_adviser2`.`course_list` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`math_option`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`math_option` (
  `student_id` VARCHAR(9) NOT NULL,
  `option_number` TINYINT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `student_id_idx` (`student_id` ASC),
  CONSTRAINT `math_option_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `virtual_adviser2`.`students` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`outside_concentration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`outside_concentration` (
  `student_id` VARCHAR(9) NOT NULL,
  `course_id` VARCHAR(11) NOT NULL,
  `outside_concentration_id` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `student_id_idx` (`student_id` ASC),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `outside_concentration_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `virtual_adviser2`.`students` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `outside_concentration_ibfk_2`
    FOREIGN KEY (`course_id`)
    REFERENCES `virtual_adviser2`.`course_list` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`pre_or_corequisites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`pre_or_corequisites` (
  `course_id` VARCHAR(11) NOT NULL,
  `pre_or_coreq_list` VARCHAR(100) NOT NULL,
  `dept_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`course_id`, `dept_id`),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `pre_or_corequisites_ibfk_1`
    FOREIGN KEY (`course_id`)
    REFERENCES `virtual_adviser2`.`course_list` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`prerequisites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`prerequisites` (
  `course_id` VARCHAR(11) NOT NULL,
  `prereq_list` VARCHAR(100) NOT NULL,
  `required_grade` ENUM('A','B','C') NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `prerequisites_ibfk_1`
    FOREIGN KEY (`course_id`)
    REFERENCES `virtual_adviser2`.`course_list` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `virtual_adviser2`.`program_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`program_courses` (
  `program_id` VARCHAR(100) NOT NULL,
  `concentration_id` VARCHAR(100) NOT NULL,
  `course_id` VARCHAR(11) NOT NULL,
  `fulfills_major` TINYINT(1) UNSIGNED NOT NULL,
  `fulfills_writing` TINYINT(1) UNSIGNED NOT NULL,
  `fulfills_math1` TINYINT(1) UNSIGNED NOT NULL,
  `fulfills_math2` TINYINT(1) UNSIGNED NOT NULL,
  `fulfills_science` TINYINT(1) UNSIGNED NOT NULL,
  `fulfills_social_science` TINYINT(1) UNSIGNED NOT NULL,
  `fulfills_liberalEd` TINYINT(1) UNSIGNED NOT NULL,
  `fulfills_communications` TINYINT(1) UNSIGNED NOT NULL,
  `dept_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`program_id`, `concentration_id`, `dept_id`),
  INDEX `progam_id_idx` (`program_id` ASC),
  INDEX `concentration_id_idx` (`concentration_id` ASC),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `program_courses_ibfk_1`
    FOREIGN KEY (`program_id` , `concentration_id`)
    REFERENCES `virtual_adviser2`.`degree_program` (`program_id` , `concentration_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `program_courses_ibfk_2`
    FOREIGN KEY (`course_id`)
    REFERENCES `virtual_adviser2`.`course_list` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

drop table substitutions;
-- -----------------------------------------------------
-- Table `virtual_adviser2`.`substitutions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`substitutions` (
  `student_id` VARCHAR(9) NOT NULL,
  `adviser_id` VARCHAR(9) NOT NULL,
  `course_id` VARCHAR(11) NOT NULL,
  `course_sub_dept_id` VARCHAR(4) NOT NULL,
  `dept_id` VARCHAR(4) NULL,
  `course_sub_course_id` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`student_id`, `course_sub_course_id`),
  INDEX `course_id_idx` (`course_id` ASC),
  INDEX `student_id_idx` (`student_id` ASC),
  INDEX `FK_course_sub_idx` (`course_sub_dept_id` ASC),
  CONSTRAINT `substitutions_ibfk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `virtual_adviser2`.`students` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `substitutions_ibfk_2`
    FOREIGN KEY (`course_id`)
    REFERENCES `virtual_adviser2`.`course_list` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

drop table course_equivalence;
-- -----------------------------------------------------
-- Table `virtual_adviser2`.`course_equivalence`
-- -----------------------------------------------------
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema virtual_adviser2
-- -----------------------------------------------------
-- virtual_adviser2 was created on 12/28/2014 in order to split the course_id into two columns now: course_id (like "3120") and dept_id (like "ITIS")

-- -----------------------------------------------------
-- Schema virtual_adviser2
--
-- virtual_adviser2 was created on 12/28/2014 in order to split the course_id into two columns now: course_id (like "3120") and dept_id (like "ITIS")
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `virtual_adviser2` DEFAULT CHARACTER SET latin1 ;
USE `virtual_adviser2` ;

-- -----------------------------------------------------
-- Table `virtual_adviser2`.`course_equivalence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `virtual_adviser2`.`course_equivalence` (
  `course_id` VARCHAR(11) NOT NULL,
  `course_eq` VARCHAR(11) NOT NULL,
  `dept_id` VARCHAR(4) NOT NULL,
  `dept_eq` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`course_id`, `course_eq`, `dept_id`, `dept_eq`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


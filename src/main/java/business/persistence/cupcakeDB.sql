use cupcake_db;
-- MySQL Workbench Forward Engineering

CREATE SCHEMA IF NOT EXISTS `cupcake_db` ;
USE `cupcake_db` ;

-- -----------------------------------------------------
-- Table `cupcake_db`.`bot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake_db`.`bot` (
  `bot_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`bot_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6;


-- -----------------------------------------------------
-- Table `cupcake_db`.`top`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake_db`.`top` (
  `top_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`top_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake_db`.`cupcake`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake_db`.`cupcake` (
  `cupcake_id` INT NOT NULL AUTO_INCREMENT,
  `bot_id` INT NOT NULL,
  `top_id` INT NOT NULL,
  `price` INT NULL DEFAULT NULL,
  `amount` INT NULL DEFAULT NULL,
  PRIMARY KEY (`cupcake_id`),
  INDEX `fk_cupcake_bot_idx` (`bot_id` ASC),
  INDEX `fk_cupcake_top1_idx` (`top_id` ASC),
  CONSTRAINT `fk_cupcake_bot`
    FOREIGN KEY (`bot_id`)
    REFERENCES `cupcake_db`.`bot` (`bot_id`),
  CONSTRAINT `fk_cupcake_top1`
    FOREIGN KEY (`top_id`)
    REFERENCES `cupcake_db`.`top` (`top_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake_db`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `role` VARCHAR(45) NULL DEFAULT NULL,
  `balance` INT NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake_db`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake_db`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `price` INT NULL DEFAULT NULL,
  `date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_order_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `cupcake_db`.`user` (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake_db`.`orderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake_db`.`orderline` (
  `order_id` INT NOT NULL,
  `cupcake_id` INT NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`, `cupcake_id`),
  INDEX `fk_orderline_cupcake_idx` (`cupcake_id` ASC),
  CONSTRAINT `fk_orderline_cupcake`
    FOREIGN KEY (`cupcake_id`)
    REFERENCES `cupcake_db`.`cupcake` (`cupcake_id`),
  CONSTRAINT `fk_orderline_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `cupcake_db`.`order` (`order_id`))
ENGINE = InnoDB;

INSERT INTO `bot` VALUES 
(1,'chocolate',5),
(2,'vanilla',5),
(3,'nutmeg',5),
(4,'pistacio',6),
(5,'almond',7);
INSERT INTO `top` VALUES 
(1,'chocolate',5),
(2,'blueberry',5),
(3,'rasbarry',5),
(4,'crispy',6),
(5,'strawberry',6),
(6,'rum/rasin',7),
(7,'orange',8),
(8,'lemon',8),
(9,'blue cheese',9);
INSERT INTO `user` VALUES 
(1,'inga','inga@hotmail.com','inga123','admin',0),
(2,'timmy','timmy@hotmail.com','timmy123','customer',0),
(3,'jonas','jonas@hotmail.com','jonas123','admin',0);
INSERT INTO `cupcake_db`.`orders` (`order_id`, `user_id`, `price`) VALUES
('1', '2', '10'),
('2', '1', '12');

INSERT INTO `cupcake_db`.`cupcake` (`cupcake_id`, `bot_id`, `top_id`, `price`, `amount`) VALUES
('1', '1', '1', '10', '1'),
('2', '3', '2', '20', '2');

INSERT INTO `cupcake_db`.`orderline` (`order_id`, `cupcake_id`, `quantity`) VALUES
('2', '2', '2'),
('1', '1', '1');




-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema farmacia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema farmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `farmacia` DEFAULT CHARACTER SET utf8 ;
USE `farmacia` ;

-- -----------------------------------------------------
-- Table `farmacia`.`tipos_produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farmacia`.`tipos_produtos` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`tipos_produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia`.`fabricante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farmacia`.`fabricante` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`fabricante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fabricante` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia`.`produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farmacia`.`produtos` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produto` VARCHAR(45) NOT NULL,
  `designacao` VARCHAR(200) NOT NULL,
  `composicao` VARCHAR(200) NOT NULL,
  `preco_venda` DECIMAL(8) NOT NULL,
  `id_tipos_produtos` INT NOT NULL,
  `id_fabricante` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_1_idx` (`id_tipos_produtos` ASC),
  INDEX `fk_produtos_2_idx` (`id_fabricante` ASC),
  CONSTRAINT `fk_produtos_1`
    FOREIGN KEY (`id_tipos_produtos`)
    REFERENCES `farmacia`.`tipos_produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_2`
    FOREIGN KEY (`id_fabricante`)
    REFERENCES `farmacia`.`fabricante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia`.`clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farmacia`.`clientes` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `codigo_postal` DECIMAL(15) NOT NULL,
  `localidade` VARCHAR(200) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia`.`compras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farmacia`.`compras` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_compras_1_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_compras_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `farmacia`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia`.`produtos_compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farmacia`.`produtos_compra` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`produtos_compra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_compra_1_idx` (`id_compra` ASC),
  INDEX `fk_produtos_compra_2_idx` (`id_produto` ASC),
  CONSTRAINT `fk_produtos_compra_1`
    FOREIGN KEY (`id_compra`)
    REFERENCES `farmacia`.`compras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_compra_2`
    FOREIGN KEY (`id_produto`)
    REFERENCES `farmacia`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia`.`medico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farmacia`.`medico` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`medico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `crm` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `farmacia`.`receitas_medica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farmacia`.`receitas_medica` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`receitas_medica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto_compra` INT NOT NULL,
  `id_medico` INT NOT NULL,
  `receita` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_receitas_medica_1_idx` (`id_produto_compra` ASC),
  INDEX `fk_receitas_medica_2_idx` (`id_medico` ASC),
  CONSTRAINT `fk_receitas_medica_1`
    FOREIGN KEY (`id_produto_compra`)
    REFERENCES `farmacia`.`produtos_compra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receitas_medica_2`
    FOREIGN KEY (`id_medico`)
    REFERENCES `farmacia`.`medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

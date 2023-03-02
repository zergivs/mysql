CREATE SCHEMA `abp5` ;
CREATE TABLE `abp5`.`clientes` (
  `idcliente` INT NOT NULL,
  `nombreCliente` VARCHAR(50) NOT NULL,
  `apellidoCliente` VARCHAR(50) NOT NULL,
  `direccionCliente` VARCHAR(70) NULL,
  `telefonoCliente` INT NULL,
  PRIMARY KEY (`idcliente`));
  
  CREATE TABLE `abp5`.`ventas` (
  `idventa` INT NOT NULL AUTO_INCREMENT,
  `vendedor` VARCHAR(50) NULL,
  `cantidadArticulos` INT NOT NULL,
  `subtotal` INT NOT NULL,
  `impuesto` INT NOT NULL,
  `total` INT NOT NULL,
  `clientes_idcliente` INT NOT NULL,
  PRIMARY KEY (`idventa`),
  INDEX `clientes_idcliente_idx` (`clientes_idcliente` ASC) VISIBLE,
  CONSTRAINT `clientes_idcliente`
    FOREIGN KEY (`clientes_idcliente`)
    REFERENCES `abp4`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    

ALTER TABLE `abp5`.`clientes` AUTO_INCREMENT = 1001;

CREATE TRIGGER increment_insert BEFORE INSERT ON `abp5`.`clientes`
  FOR EACH ROW 
    SET NEW.idcliente = (SELECT MAX(idcliente) + 1 FROM `abp5`.`clientes`);

INSERT INTO `abp5`.`clientes` (`nombreCliente`, `apellidoCliente`, `direccionCliente`, `telefonoCliente`) VALUES ('Alfonso', 'Mora', 'quillota 980', '987687654');
INSERT INTO `abp5`.`clientes` (`nombreCliente`, `apellidoCliente`, `direccionCliente`, `telefonoCliente`) VALUES ('Sergio', 'Alvarado', 'curauma 420', '912342345');

ALTER TABLE ventas
ADD CONSTRAINT check_cantidad_articulos
CHECK (cantidadArticulos BETWEEN 1 AND 5 AND cantidadArticulos = ROUND(cantidadArticulos));



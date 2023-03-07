CREATE SCHEMA `abp6` ;
CREATE TABLE `abp6`.`clientes` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombreCliente` VARCHAR(50) NOT NULL,
  `apellidoCliente` VARCHAR(50) NOT NULL,
  `direccionCliente` VARCHAR(70) NULL,
  `telefonoCliente` INT NULL,
  PRIMARY KEY (`idcliente`));
  
  CREATE TABLE `abp6`.`ventas` (
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
    REFERENCES `abp6`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `abp6`.`clientes` (`idcliente`, `nombreCliente`, `apellidoCliente`) VALUES ('1', 'Stiven', 'Fonseca');
INSERT INTO `abp6`.`clientes` (`idcliente`, `nombreCliente`, `apellidoCliente`) VALUES ('2', 'Alfonso', 'Mora');
INSERT INTO `abp6`.`clientes` (`idcliente`, `nombreCliente`, `apellidoCliente`) VALUES ('3', 'Fernanda', 'Solar');
INSERT INTO `abp6`.`clientes` (`idcliente`, `nombreCliente`, `apellidoCliente`) VALUES ('4', 'Hortensia', 'Salazar');
INSERT INTO `abp6`.`clientes` (`idcliente`, `nombreCliente`, `apellidoCliente`) VALUES ('5', 'Maria', 'Fernandez');

INSERT INTO `abp6`.`ventas` (`idventa`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`, `clientes_idcliente`) VALUES ('1', '1', '3000', 3000*0.19, 3000*1.19, '3');
INSERT INTO `abp6`.`ventas` (`idventa`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`, `clientes_idcliente`) VALUES ('2', '4', '9000', 9000*0.19, 9000*1.19, '1');
INSERT INTO `abp6`.`ventas` (`idventa`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`, `clientes_idcliente`) VALUES ('3', '2', '5000', 5000*0.19, 5000*1.19, '2');
INSERT INTO `abp6`.`ventas` (`idventa`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`, `clientes_idcliente`) VALUES ('4', '3', '7000', 7000*0.19, 7000*1.19, '4');
INSERT INTO `abp6`.`ventas` (`idventa`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`, `clientes_idcliente`) VALUES ('5', '1', '2000', 2000*0.19, 2000*1.19, '5');

COMMIT;

UPDATE `abp6`.`clientes`
SET `direccionCliente` = 'Calle quillota 980, VIÑA',
    `telefonoCliente` = '987651234'
WHERE `idcliente` = 1;

UPDATE `abp6`.`clientes`
SET `direccionCliente` = 'San Antonio 910, VIÑA',
    `telefonoCliente` = '954651234'
WHERE `idcliente` = 2;

UPDATE `abp6`.`clientes`
SET `direccionCliente` = 'Alvares 210, VIÑA',
    `telefonoCliente` = '976651234'
WHERE `idcliente` = 3;

UPDATE `abp6`.`clientes`
SET `direccionCliente` = 'Alvares 420, VIÑA',
    `telefonoCliente` = '966651234'
WHERE `idcliente` = 4;

UPDATE `abp6`.`clientes`
SET `direccionCliente` = 'Viana 130, VIÑA',
    `telefonoCliente` = '933651234'
WHERE `idcliente` = 5;

ROLLBACK;






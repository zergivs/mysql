CREATE SCHEMA `abp4` ;
CREATE TABLE `abp4`.`clientes` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombreCliente` VARCHAR(50) NOT NULL,
  `apellidoCliente` VARCHAR(50) NOT NULL,
  `direccionCliente` VARCHAR(70) NULL,
  `telefonoCliente` INT NULL,
  PRIMARY KEY (`idcliente`));
  
  CREATE TABLE `abp4`.`ventas` (
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

INSERT INTO `abp4`.`clientes` (`idcliente`, `nombreCliente`, `apellidoCliente`, `direccionCliente`, `telefonoCliente`) VALUES ('1', 'Stiven', 'Fonseca', 'quillota 980', '98787654');
INSERT INTO `abp4`.`clientes` (`idcliente`, `nombreCliente`, `apellidoCliente`, `direccionCliente`, `telefonoCliente`) VALUES ('2', 'Alfonso', 'Mora', '5 oriente 910', '92345678');
INSERT INTO `abp4`.`clientes` (`idcliente`, `nombreCliente`, `apellidoCliente`, `direccionCliente`, `telefonoCliente`) VALUES ('3', 'Fernanda', 'Solar', 'san antonio 520', '99998887');
INSERT INTO `abp4`.`clientes` (`idcliente`, `nombreCliente`, `apellidoCliente`) VALUES ('4', 'Hortensia', 'Salazar');
INSERT INTO `abp4`.`clientes` (`idcliente`, `nombreCliente`, `apellidoCliente`) VALUES ('5', 'Maria', 'Fernandez');

INSERT INTO `abp4`.`ventas` (`idventa`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`, `clientes_idcliente`) VALUES ('1', 'Bob Patiño', '1', '3000', 3000*0.19, 3000*1.19, '3');
INSERT INTO `abp4`.`ventas` (`idventa`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`, `clientes_idcliente`) VALUES ('2', 'Homero Simpson', '4', '9000', 9000*0.19, 9000*1.19, '1');
INSERT INTO `abp4`.`ventas` (`idventa`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`, `clientes_idcliente`) VALUES ('3', 'Homero Simpson', '2', '5000', 5000*0.19, 5000*1.19, '2');
INSERT INTO `abp4`.`ventas` (`idventa`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`, `clientes_idcliente`) VALUES ('4', 'Bob Patiño', '3', '7000', 7000*0.19, 7000*1.19, '4');
INSERT INTO `abp4`.`ventas` (`idventa`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`, `clientes_idcliente`) VALUES ('5', 'Bob Patiño', '1', '2000', 2000*0.19, 2000*1.19, '5');

UPDATE ventas SET total = subtotal + impuesto;

DELETE FROM ventas WHERE clientes_idcliente = 3;
DELETE FROM clientes WHERE idcliente = 3;



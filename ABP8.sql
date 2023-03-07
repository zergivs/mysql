CREATE SCHEMA `abp8` ;
CREATE TABLE `abp8`.`clientes` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombreCliente` VARCHAR(50) NOT NULL,
  `apellidoCliente` VARCHAR(50) NOT NULL,
  `direccionCliente` VARCHAR(70) NULL,
  `telefonoCliente` INT NULL,
  PRIMARY KEY (`idcliente`));
  
  CREATE TABLE `abp8`.`ventas` (
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
    REFERENCES `abp8`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `abp8`.`producto` (
  `idproducto` INT NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(50) NOT NULL,
  `valor` INT NOT NULL,
  PRIMARY KEY (`idproducto`));

CREATE TABLE `abp8`.`detalleventa` (
  `ventas_idVenta` INT NOT NULL,
  `producto_idProducto` INT NOT NULL,
  `cantidad` INT NOT NULL,
   PRIMARY KEY (`ventas_idVenta`, `producto_idProducto`, `cantidad`),
  INDEX `producto_idProducto_idx` (`producto_idProducto` ASC) VISIBLE,
  CONSTRAINT `ventas_idVenta`
    FOREIGN KEY (`ventas_idVenta`)
    REFERENCES `abp8`.`ventas` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `producto_idProducto`
    FOREIGN KEY (`producto_idProducto`)
    REFERENCES `abp8`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


ALTER TABLE `abp8`.`producto`
ADD CONSTRAINT `uq_nombreProducto`
UNIQUE (`nombreProducto`);

ALTER TABLE `abp8`.`producto`
MODIFY COLUMN `idproducto` INT NOT NULL AUTO_INCREMENT;

INSERT INTO `abp8`.`producto` (`nombreProducto`, `valor`) 
VALUES ('Monitor', 100),
       ('Disco duro', 200),
       ('Tablet', 150),
       ('Noteook ', 300);
       
       INSERT INTO `abp8`.`detalleventa` (`ventas_idVenta`, `producto_idProducto`, `cantidad`)
VALUES (1, 1, 2),
       (1, 2, 1),
       (2, 3, 3),
       (2, 4, 2),
       (3, 1, 1),
       (3, 3, 2),
       (4, 2, 4),
       (4, 4, 1);
       
       COMMIT;

       
       



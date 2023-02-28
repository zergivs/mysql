CREATE SCHEMA abp1;

CREATE TABLE `abp1`.`ventas` (
  `idventas` INT NOT NULL AUTO_INCREMENT,
  `comprador` VARCHAR(30) NULL,
  `vendedor` VARCHAR(30) NULL,
  `cantidadArticulos` INT NULL,
  `subtotal` INT NULL,
  `impuesto` INT NULL,
  `total` INT NULL,
  PRIMARY KEY (`idventas`));
  
  INSERT INTO `abp1`.`ventas` (`comprador`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`) VALUES ('Marge Simpson', 'Nelson Muntz', 5, 5000, 5000*0.19, 5000*1.19);
INSERT INTO `abp1`.`ventas` (`comprador`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`) VALUES ('Apu Nagametepila', 'Troy McClure', 6, 9000, 9000*0.19, 9000*1.19);
INSERT INTO `abp1`.`ventas` (`comprador`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`) VALUES ('Ned Flanders', 'Patty bouvier', 3, 900, 900*0.19, 900*1.19);
INSERT INTO `abp1`.`ventas` (`comprador`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`) VALUES ('Seymur Skinner', 'Selma Bouvier', 8, 15000, 15000*0.19, 15000*1.19);
INSERT INTO `abp1`.`ventas` (`comprador`, `vendedor`, `cantidadArticulos`, `subtotal`, `impuesto`, `total`) VALUES ('Ralph Wiggunm', 'Bob Patiño', 20, 30000, 30000*0.19, 30000*1.19);

select * from ventas where cantidadArticulos >2;
select idventas, comprador, cantidadArticulos from ventas where subtotal < 1000;
select total, impuesto, subtotal, cantidadArticulos, vendedor, comprador from ventas where vendedor = 'Selma Bouvier' and total >= 5000;
select comprador, vendedor, total from ventas where comprador = 'Seymur Skinner' or vendedor = 'Bob Patiño';
select * from ventas where idventas in (2, 5, 6, 9);  
  
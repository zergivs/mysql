CREATE SCHEMA `abpro1` ;

CREATE TABLE `capacitacion` (
  `idcapacitacion` INT NOT NULL AUTO_INCREMENT,
  `rutCliente` VARCHAR(15) NOT NULL,
  `dia` VARCHAR(15) NULL,
  `hora` TIME NULL,
  `lugar` VARCHAR(50) NOT NULL,
  `duracion` INT NOT NULL,
  `cantidadAsistentes` INT NULL,
  PRIMARY KEY (`idcapacitacion`));

INSERT INTO `abpro1`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('12345234-1', 'jueves', '18:00', 'unab', '90', '8');
INSERT INTO `abpro1`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('15123234-2', 'martes', '21:00', 'unab', '60', '10');
INSERT INTO `abpro1`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('21432432-1', 'lunes', '17:00', 'unab', '40', '6');
INSERT INTO `abpro1`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('19987876-2', 'viernes', '21:00', 'unab', '70', '9');
INSERT INTO `abpro1`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('13999777-1', 'sabado', '20:00', 'unab', '90', '12');
INSERT INTO `abpro1`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('14657888-3', 'miercoles', '14:00', 'unab', '120', '3');
INSERT INTO `abpro1`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('15443225-k', 'jueves', '9:00', 'unab', '120', '14');
INSERT INTO `abpro1`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('11223445-9', 'jueves', '13:00', 'unab', '30', '20');
INSERT INTO `abpro1`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('15112998-8', 'viernes', '20:00', 'unab', '50', '18');
INSERT INTO `abpro1`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('16488222-0', 'lunes', '15:00', 'unab', '45', '15');

select idcapacitacion, hora, dia, rutCliente from capacitacion;
select * from capacitacion where duracion >= 60 and cantidadAsistentes > 30;
select * from capacitacion where duracion >= 60 and cantidadAsistentes < 30;
SELECT cantidadAsistentes, duracion, lugar, hora, dia, rutCliente FROM capacitacion WHERE rutCliente LIKE '2-0' or rutCliente LIKE '5-9' and lugar = 'unab';
select idcapacitacion, duracion, cantidadAsistentes from capacitacion where duracion >= 30 and duracion < 90 or cantidadAsistentes < 10;
select idcapacitacion, dia, cantidadAsistentes from capacitacion where dia in ('lunes', 'miercoles', 'viernes') and cantidadAsistentes >= 10 and duracion >= 30;


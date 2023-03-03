CREATE SCHEMA `abpro3` ;

CREATE TABLE `capacitacion` (
  `idcapacitacion` INT NOT NULL ,
  `rutCliente` VARCHAR(15) NOT NULL,
  `dia` VARCHAR(15) NULL,
  `hora` TIME NULL,
  `lugar` VARCHAR(50) NOT NULL,
  `duracion` INT NOT NULL,
  `cantidadAsistentes` INT NULL,
  PRIMARY KEY (`idcapacitacion`));
  
  CREATE TABLE `abpro3`.`asistentes` (
  `idAsistentes` INT NOT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `edad` INT NOT NULL,
  `FK_Capacitacion` INT NOT NULL,
  PRIMARY KEY (`idAsistentes`),
  CONSTRAINT `FK_Capacitacion`
    FOREIGN KEY (`FK_Capacitacion`)
    REFERENCES `abpro3`.`capacitacion` (`idCapacitacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
ALTER TABLE `abpro3`.`capacitacion` 
CHANGE COLUMN `idcapacitacion` `idcapacitacion` INT NOT NULL AUTO_INCREMENT ;
ALTER TABLE `abpro3`.`asistentes` 
CHANGE COLUMN `idAsistentes` `idAsistentes` INT NOT NULL AUTO_INCREMENT ;
    
INSERT INTO `abpro3`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('12345234-1', 'jueves', '18:00', 'unab', '90', '8');
INSERT INTO `abpro3`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('15123234-2', 'martes', '21:00', 'unab', '60', '10');
INSERT INTO `abpro3`.`capacitacion` (`rutCliente`, `dia`, `hora`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('21432432-1', 'lunes', '17:00', 'unab', '40', '6');

INSERT INTO `abpro3`.`asistentes` (`nombre`, `edad`, `FK_Capacitacion`) VALUES ('Maria Fernandez', '21', '5');
INSERT INTO `abpro3`.`asistentes` ( `nombre`, `edad`, `FK_Capacitacion`) VALUES ('Paola Mercado', '32', '1');
INSERT INTO `abpro3`.`asistentes` (`nombre`, `edad`, `FK_Capacitacion`) VALUES ('Jose Mora', '43', '2');
INSERT INTO `abpro3`.`asistentes` (`nombre`, `edad`, `FK_Capacitacion`) VALUES ('Altair bonnasera', '32', '4');
INSERT INTO `abpro3`.`asistentes` (`nombre`, `edad`, `FK_Capacitacion`) VALUES ('Ricardo Saez', '26', '3');

ALTER TABLE `abpro3`.`asistentes` 
ADD UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE;

UPDATE capacitacion 
SET dia = '2020-01-01', hora = '00:00:00' 
WHERE dia IS NULL AND hora IS NULL;

DELETE FROM capacitacion WHERE cantidadAsistentes = 0 
AND idcapacitacion NOT IN (SELECT DISTINCT FK_Capacitacion FROM asistentes);






CREATE SCHEMA `abpro4` ;

CREATE TABLE `capacitacion` (
  `idcapacitacion` INT NOT NULL AUTO_INCREMENT,
  `rutCliente` VARCHAR(15) NOT NULL,
  `dia` VARCHAR(15) NULL,
  `hora` TIME NULL,
  `lugar` VARCHAR(50) NOT NULL,
  `duracion` INT NOT NULL,
  `cantidadAsistentes` INT NULL,
  PRIMARY KEY (`idcapacitacion`));
  
  CREATE TABLE `abpro4`.`asistentes` (
  `idAsistentes` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `edad` INT NOT NULL,
  `FK_Capacitacion` INT NOT NULL,
  PRIMARY KEY (`idAsistentes`),
  CONSTRAINT `FK_Capacitacion`
    FOREIGN KEY (`FK_Capacitacion`)
    REFERENCES `abpro4`.`capacitacion` (`idCapacitacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
SET autocommit=0;
START TRANSACTION;      
INSERT INTO `abpro4`.`capacitacion` (`rutCliente`, `lugar`, `duracion`, `cantidadAsistentes`) VALUES ('12345234-1', 'unab', '90', '8');
COMMIT;
SET autocommit=0;
INSERT INTO `abpro4`.`asistentes` (`FK_Capacitacion`, `edad`, `nombre`, `idAsistentes`) VALUES ('1', '21', 'Maria Fernandez',  '5');
INSERT INTO `abpro4`.`asistentes` (`FK_Capacitacion`, `edad`, `nombre`, `idAsistentes`) VALUES ('1', '32', 'Paola Mercado',  '1');
COMMIT;
UPDATE capacitacion SET dia = 'Lunes', hora = '21:00';
DELETE FROM asistentes WHERE idcapacitacion = (SELECT idcapacitacion FROM capacitaciones WHERE idcapacitacion = 1);
ROLLBACK;
COMMIT;


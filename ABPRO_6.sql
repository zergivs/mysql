CREATE SCHEMA `abpro6` ;

CREATE TABLE `capacitacion` (
  `idcapacitacion` INT NOT NULL AUTO_INCREMENT,
  `rutCliente` VARCHAR(15) NOT NULL,
  `dia` VARCHAR(15) NULL,
  `hora` TIME NULL,
  `lugar` VARCHAR(50) NOT NULL,
  `duracion` INT NOT NULL,
  `cantidadAsistentes` INT NULL,
  PRIMARY KEY (`idcapacitacion`));
  
  CREATE TABLE `abpro6`.`asistentes` (
  `idAsistentes` INT NOT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `edad` INT NOT NULL,
  `FK_Capacitacion` INT NOT NULL,
  PRIMARY KEY (`idAsistentes`),
  CONSTRAINT `FK_Capacitacion`
    FOREIGN KEY (`FK_Capacitacion`)
    REFERENCES `abpro6`.`capacitacion` (`idCapacitacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
     CREATE TABLE `abpro6`.`cliente` (
  `rutCliente` INT NOT NULL,
  `nombreCliente` VARCHAR(30) NOT NULL,
  `apellidoCliente` VARCHAR(30) NOT NULL,
  `telefonoCliente` VARCHAR(20) NOT NULL, 
  `AFPCliente` VARCHAR(30) NULL DEFAULT NULL,
  `SistemaSaludCliente` INT NULL DEFAULT NULL,
  `DireccionCliente` VARCHAR(70) NULL DEFAULT NULL,
  `ComunaCliente` VARCHAR(50) NULL DEFAULT NULL,
  `EdadCliente` INT NOT NULL,
   PRIMARY KEY (`rutCliente`));
   
   CREATE TABLE `abpro6`.`accidente`(
   `idAccidente` INT NOT NULL,
   `diaAccidente` DATE NULL DEFAULT NULL,
   `horaAccidente` TIME NULL DEFAULT NULL,
   `lugarAccidente` VARCHAR(50) NOT NULL,
   `origenAccidente` VARCHAR(100) NULL DEFAULT NULL,
   `consecuenciaAccidente` VARCHAR(100) NULL DEFAULT NULL,
   `rutCliente_FK` INT NOT NULL,
  PRIMARY KEY (`idAccidente`),
  CONSTRAINT `rutCliente_FK`
    FOREIGN KEY (`rutCliente_FK`)
    REFERENCES `abpro6`.`cliente` (`rutCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    CREATE TABLE IF NOT EXISTS `abpro6`.`visita` (
  `idVisita` INT NOT NULL,
  `FechaVisita` DATE NOT NULL,
  `HoraVisita` DATE NULL DEFAULT NULL,
  `LugarVisita` VARCHAR(50) NOT NULL,
  `ComentariosVisita` VARCHAR(250) NOT NULL,
  `rutCliente_visitaFK` INT NOT NULL,
  PRIMARY KEY (`idVisita`),
  CONSTRAINT `rutCliente_visitaFK`
    FOREIGN KEY (`rutCliente_visitaFK`)
    REFERENCES `abpro6`.`cliente` (`rutCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
ALTER TABLE `abpro6`.`cliente` 
CHANGE COLUMN `DireccionCliente` `DireccionCliente` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `ComunaCliente` `ComunaCliente` VARCHAR(50) NOT NULL ;

ALTER TABLE `abpro6`.`capacitacion` 
DROP COLUMN `cantidadAsistentes`,
ADD COLUMN `cliente_rutCliente_fk` INT NULL AFTER `duracion`,
CHANGE COLUMN `dia` `fechaCapacitacion` DATE NULL DEFAULT NULL ,
CHANGE COLUMN `lugar` `lugar` VARCHAR(100) NOT NULL ,
ADD INDEX `cliente_rutCliente_fk_idx` (`cliente_rutCliente_fk` ASC) VISIBLE;

ALTER TABLE `abpro6`.`capacitacion` 
ADD CONSTRAINT `cliente_rutCliente_fk`
  FOREIGN KEY (`cliente_rutCliente_fk`)
  REFERENCES `abpro6`.`cliente` (`rutCliente`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
    ALTER TABLE `abpro6`.`asistentes` 
DROP FOREIGN KEY `FK_Capacitacion`;
ALTER TABLE `abpro6`.`asistentes` 
DROP COLUMN `FK_Capacitacion`,
ADD COLUMN `correAasistente` VARCHAR(70) NULL AFTER `edad`,
ADD COLUMN `telefonoAsistente` VARCHAR(20) NULL AFTER `correAasistente`,
ADD COLUMN `capacitacion_idCapacitacion_fk` INT NOT NULL AFTER `telefonoAsistente`,
CHANGE COLUMN `idAsistentes` `idAsistente` INT NOT NULL ,
CHANGE COLUMN `nombre` `nombreCompleto` VARCHAR(100) NOT NULL ,
ADD INDEX `capacitacion_idCapacitacion_fk_idx` (`capacitacion_idCapacitacion_fk` ASC) VISIBLE,
DROP INDEX `FK_Capacitacion` ;

ALTER TABLE `abpro6`.`asistentes` 
ADD CONSTRAINT `capacitacion_idCapacitacion_fk`
  FOREIGN KEY (`capacitacion_idCapacitacion_fk`)
  REFERENCES `abpro6`.`capacitacion` (`idcapacitacion`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `abpro6`.`accidente` 
CHANGE COLUMN `diaAccidente` `fechaAccidente` DATE NOT NULL ,
CHANGE COLUMN `horaAccidente` `horaAccidente` TIME NOT NULL ,
CHANGE COLUMN `lugarAccidente` `lugarAccidente` VARCHAR(150) NOT NULL ,
CHANGE COLUMN `origenAccidente` `origenAccidente` VARCHAR(100) NOT NULL ;

ALTER TABLE `abpro6`.`visita` 
CHANGE COLUMN `idVisita` `idVisita` INT NOT NULL AUTO_INCREMENT ;


    
    
    

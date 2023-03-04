CREATE SCHEMA `abpro5` ;

CREATE TABLE `capacitacion` (
  `idcapacitacion` INT NOT NULL AUTO_INCREMENT,
  `rutCliente` VARCHAR(15) NOT NULL,
  `dia` VARCHAR(15) NULL,
  `hora` TIME NULL,
  `lugar` VARCHAR(50) NOT NULL,
  `duracion` INT NOT NULL,
  `cantidadAsistentes` INT NULL,
  PRIMARY KEY (`idcapacitacion`));
  
  CREATE TABLE `abpro5`.`asistentes` (
  `idAsistentes` INT NOT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `edad` INT NOT NULL,
  `FK_Capacitacion` INT NOT NULL,
  PRIMARY KEY (`idAsistentes`),
  CONSTRAINT `FK_Capacitacion`
    FOREIGN KEY (`FK_Capacitacion`)
    REFERENCES `abpro5`.`capacitacion` (`idCapacitacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    CREATE TABLE `abpro5`.`cliente` (
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
   
   CREATE TABLE `abpro5`.`accidente`(
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
    REFERENCES `abpro5`.`cliente` (`rutCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    ALTER TABLE `abpro5`.`cliente` 
ADD UNIQUE INDEX `telefonoCliente_UNIQUE` (`telefonoCliente` ASC) VISIBLE;

ALTER TABLE cliente
MODIFY SistemaSaludCliente INT(1) CHECK (SistemaSaludCliente IN (1,2));

INSERT INTO Cliente (rutCliente, nombreCliente, apellidoCliente, telefonoCliente, EdadCliente)
VALUES 
  (11111111, 'Juan', 'Pérez', '+56912345678', 25),
  (22222222, 'María', 'González', '+56923456789', 35),
  (33333333, 'Pedro', 'Sánchez', '+56934567890', 40),
  (44444444, 'Ana', 'Martínez', '+56945678901', 50);

INSERT INTO Accidente (idAccidente, diaAccidente, horaAccidente, lugarAccidente, origenAccidente, consecuenciaAccidente, rutCliente_FK)
VALUES 
  (1, '2022-01-01', '10:00:00', 'Santiago', 'Caída', 'Fractura de pierna', 11111111),
  (2, '2022-02-02', '11:00:00', 'Valparaíso', 'Choque', 'Latigazo cervical', 11111111),
  (3, '2022-03-03', '12:00:00', 'Concepción', 'Resbalón', 'Esguince de tobillo', 22222222),
  (4, '2022-04-04', '13:00:00', 'La Serena', 'Atropello', 'Contusión', 22222222),
  (5, '2022-05-05', '14:00:00', 'Arica', 'Caída', 'Fractura de muñeca', 22222222),
  (6, '2022-06-06', '15:00:00', 'Antofagasta', 'Golpe', 'Hematoma', 33333333),
  (7, '2022-07-07', '16:00:00', 'Copiapó', 'Quemadura', 'Herida superficial', 44444444);



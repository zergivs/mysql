

SET AUTOCOMMIT = 1;

INSERT INTO abp6.clientes (nombreCliente, apellidoCliente, direccionCliente, telefonoCliente) 
VALUES ('Juan', 'Pérez', 'uno norte 123', '95551234');

INSERT INTO abp6.ventas (vendedor, cantidadArticulos, subtotal, impuesto, total, clientes_idcliente) 
VALUES ('Pedro', 10, 500, 500*0.19, 500*1.19, LAST_INSERT_ID());

SET autocommit = 0;

DELETE FROM `abp6`.`ventas` WHERE `idventa` = 1;

ROLLBACK;


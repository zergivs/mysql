CREATE SCHEMA abp2;
CREATE TABLE clientes (
  idcliente INT NOT NULL,
  nombres VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  direccion VARCHAR(70) NOT NULL,
  telefono INT,
  CONSTRAINT clientes_pk PRIMARY KEY (idcliente)
);

CREATE TABLE ventas (
  idventa INT NOT NULL,
  vendedor VARCHAR(50),
  cantarticulos INT NOT NULL,
  subtotal INT NOT NULL,
  impuesto INT NOT NULL,
  total INT NOT NULL,
  clientes_idcliente INT NOT NULL,
  CONSTRAINT ventas_pk PRIMARY KEY (idventa),
  CONSTRAINT ventas_clientes_fk FOREIGN KEY (clientes_idcliente)
    REFERENCES clientes (idcliente)
);

INSERT INTO clientes VALUES (1,'Antonia','Aranda','Calle Los Aromos #123',991111111);
INSERT INTO clientes VALUES (2,'Bernarda','Barros','Pasaje Manuel Balmaceda #456',992222222);
INSERT INTO clientes VALUES (3,'Carlos','Costa','Avenida Simón Bolivar #789',993333333);

INSERT INTO ventas (idventa, vendedor, cantarticulos, subtotal, impuesto, total, clientes_idcliente)
VALUES (1,'Andrés Aranda',3,4500,500,5000,1);

INSERT INTO ventas (idventa, cantarticulos, subtotal, impuesto, total, clientes_idcliente)
VALUES (2,2,1200,100,1400,1);

INSERT INTO ventas (idventa, vendedor, cantarticulos, subtotal, impuesto, total, clientes_idcliente)
VALUES (3,'Cristina Cortés',5,10480,20,10500,2);

INSERT INTO ventas (idventa, vendedor, cantarticulos, subtotal, impuesto, total, clientes_idcliente)
VALUES (4,'Daniela Durán',1,5000,2500,7500,2);

INSERT INTO ventas (idventa, cantarticulos, clientes_idcliente, subtotal, impuesto, total)
VALUES (5,3,3,3800,100,4000);

select * from ventas WHERE (subtotal + impuesto) <> total;
SELECT SUM(total) FROM ventas as total_ventas;
select * from ventas where clientes_idcliente = 1;
select idcliente, concat(nombres,' ', apellidos) as nombreCompleto from clientes where direccion = null;
select idcliente, concat(nombres,' ', apellidos) as nombreCompleto from clientes;
SELECT MIN(total) AS venta_minima, MAX(total) AS venta_maxima FROM ventas;

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
id_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

/*Lista el nombre de todos los productos que hay en la tabla producto.*/
select nombre from producto;

/*Lista los nombres y los precios de todos los productos de la tabla producto.*/
select nombre, precio from producto;

/*Lista todas las columnas de la tabla producto.
*/
select * from producto;


/*Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD)*/
SELECT nombre, precio as precioEURO,   ROUND(precio * 1.11, 2) as precioUSD
FROM producto;

/*Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.*/
SELECT nombre as nombre_de_producto, precio as euros,   ROUND(precio * 1.11, 2) as dolares
FROM producto;

/*Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los
nombres a mayúscula.*/

SELECT UPPER(nombre) as nombre_Mayuscula, precio
FROM producto;

/*Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los
nombres a minúscula*/

SELECT lower(nombre) as nombre_Mayuscula, precio
FROM producto;

/*Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en
mayúsculas los dos primeros caracteres del nombre del fabricante.*/

SELECT nombre, UPPER(LEFT(nombre, 2)) as producto_dos_char
FROM fabricante;

/*Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor
del precio.
*/

SELECT nombre, ROUND(precio) as precio_redondeo  FROM producto;

/*Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del
precio para mostrarlo sin ninguna cifra decimal.
*/

SELECT nombre, FLOOR(precio) as precio_entero
FROM producto;

/*Lista el identificador de los fabricantes que tienen productos en la tabla producto.
*/

SELECT id_fabricante FROM producto WHERE nombre IS NOT NULL;

/*Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los
identificadores que aparecen repetidos*/

SELECT DISTINCT id_fabricante FROM producto WHERE nombre IS NOT NULL;

/*. Lista los nombres de los fabricantes ordenados de forma ascendente*/

SELECT DISTINCT id_fabricante 
FROM producto 
WHERE nombre IS NOT NULL
ORDER BY id_fabricante ASC;

/*Lista los nombres de los fabricantes ordenados de forma descendente*/

SELECT DISTINCT id_fabricante 
FROM producto 
WHERE nombre IS NOT NULL
ORDER BY id_fabricante DESC;

/*Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente
y en segundo lugar por el precio de forma descendente.*/

SELECT nombre from producto ORDER BY nombre ASC;
SELECT nombre, precio from producto ORDER BY precio DESC;

/*Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/

SELECT * FROM fabricante LIMIT 5;

/*Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también
se debe incluir en la respuesta.*/

SELECT * FROM fabricante LIMIT 3, 2;

/*Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER
BY y LIMIT)
*/

SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

/*. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER
BY y LIMIT)*/

SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

/*. Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.*/

SELECT nombre FROM producto WHERE id_fabricante = 2;

/*. Lista el nombre de los productos que tienen un precio menor o igual a 120.
*/

SELECT nombre, precio from producto where precio <= 120;

/*Lista el nombre de los productos que tienen un precio mayor o igual a 400*/

SELECT nombre, precio from producto where precio >= 400;

/*. Lista el nombre de los productos que no tienen un precio mayor o igual a 400.*/

SELECT nombre, precio from producto where precio <= 400;

/*. Lista todos los productos que tengan un precio entre 80 y 300. Sin utilizar el
operador BETWEEN.
*/

SELECT * FROM producto WHERE precio >= 80 AND precio <= 300;

/*. Lista todos los productos que tengan un precio entre 60 y 200. Utilizando el operador BETWEEN.
*/

SELECT * FROM producto WHERE precio BETWEEN 60 AND 200;

/*Lista todos los productos que tengan un precio mayor que 200 y que el identificador de
fabricante sea igual a 6.*/

SELECT * FROM producto WHERE precio > 200 AND id_fabricante = 6;


/*. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el
operador IN.*/

SELECT nombre FROM producto WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5;

/*Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el
operador IN.*/

SELECT nombre FROM producto WHERE id_fabricante IN (1, 3, 5);

/*Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del
precio). Cree un alias para la columna que contiene el precio que se llame céntimos.*/

SELECT nombre, precio*100 AS centimos FROM producto;

/*. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
*/

SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';

/*Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.*/

SELECT nombre FROM fabricante WHERE nombre LIKE '%e';

/*Lista los nombres de los fabricantes cuyo nombre contenga por la vocal w.*/

SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';

/*. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
*/

SELECT nombre FROM fabricante WHERE CHAR_LENGTH(nombre) = 4;

/*. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el
nombre*/

SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';

/*Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el
nombre y tienen un precio inferior a 215 .*/

SELECT nombre FROM producto WHERE nombre LIKE '%Monitor%' AND precio < 215;

/*Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180.
Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por
el nombre (en orden ascendente).*/

SELECT nombre, precio FROM producto WHERE precio >= 180
ORDER BY precio DESC;
SELECT nombre, precio FROM producto WHERE precio >= 180
ORDER BY nombre ASC;

/*Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datos*/

SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id;

/*Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden
alfabético.
*/

SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
ORDER BY fabricante.nombre ASC;

/*Devuelve una lista con el identificador del producto, nombre del producto, identificador del
fabricante y nombre del fabricante, de todos los productos de la base de datos.
*/

SELECT producto.id, producto.nombre AS nombre_producto, fabricante.id, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id;


/*Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más
barato*/

SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio = (SELECT MIN(precio) FROM producto);

/*Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro*/

SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio = (SELECT MAX(precio) FROM producto);

/*Devuelve una lista de todos los productos del fabricante Lenovo.*/

SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Lenovo';

/*Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que
200*/

SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Crucial' and producto.precio > 200;


/*Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate.
Sin utilizar el operador IN.
*/

SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

/*Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate.
Utilizando el operador IN.*/

SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE id_fabricante IN (
  SELECT id_fabricante FROM fabricante
  WHERE nombre = 'Asus' OR nombre = 'Hewlett-Packard' OR nombre = 'Seagate');
  
/*Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo
nombre termine por la vocal e*/

SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%e';


/*. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante
contenga el carácter w en su nombre.*/

SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%w%';

/*Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los
productos que tengan un precio mayor o igual a 180. Ordene el resultado en primer lugar por el
precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)*/

SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, producto.nombre ASC;

SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio >= 180
ORDER BY producto.precio DESC;

SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio >= 180
ORDER BY producto.nombre ASC;

/*. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos
fabricantes que tienen productos asociados en la base de datos.
*/

SELECT DISTINCT fabricante.id as id_fabricante, fabricante.nombre as nombre_fabricante
FROM fabricante 
INNER JOIN producto ON fabricante.id = producto.id_fabricante;


/*Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que
no tienen productos asociados.*/

SELECT fabricante.id, fabricante.nombre, COUNT(producto.id) AS cantidad_producto
FROM fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id, producto.nombre
ORDER BY fabricante.nombre ASC;

SELECT fabricante.id, fabricante.nombre, COUNT(producto.id) AS cantidad_producto
FROM producto
RIGHT JOIN fabricante ON producto.id_fabricante = fabricante.id
GROUP BY fabricante.id, producto.nombre 
ORDER BY fabricante.nombre ASC;

/*Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto
asociado.*/

SELECT fabricante.id, fabricante.nombre
FROM fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante
WHERE producto.id IS NULL;

SELECT fabricante.id, fabricante.nombre
FROM producto
RIGHT JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.id_fabricante IS NULL;

/*¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.*/

	/* No, de acuerdo a las restricciones de la base de datos y a la Foreign Key, establecida en la tabla de productos
     como no nula por lo que cada producto debe estar asociado a un fabricante.*/
 
 /*Calcula el número total de productos que hay en la tabla productos.*/
 
SELECT COUNT(*) AS total_productos FROM producto;

/*Calcula el número total de fabricantes que hay en la tabla fabricante*/

SELECT COUNT(*) AS total_fabricantes FROM fabricante;

/*Calcula el número de valores distintos de identificador de fabricante aparecen en la
tabla productos.*/

SELECT COUNT(DISTINCT id_fabricante) as num_fabricantes FROM producto;

/*Calcula la media del precio de todos los productos.*/

SELECT ROUND(AVG(precio), 2) AS media_precios FROM producto;

/*Calcula el precio más barato de todos los productos.*/

SELECT precio FROM producto WHERE precio = (SELECT MIN(precio) FROM producto);

/*Calcula el precio más caro de todos los productos.*/

SELECT precio FROM producto WHERE precio = (SELECT MAX(precio) FROM producto);

/*Lista el nombre y el precio del producto más barato*/

SELECT precio, nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto);

/*Lista el nombre y el precio del producto más caro*/

SELECT precio, nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto);

/*Calcula la suma de los precios de todos los productos*/

SELECT SUM(precio) AS suma_precios FROM producto;

/*Calcula el número de productos que tiene el fabricante Asus.*/

SELECT COUNT(*) AS numero_productos
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');

/*Calcula la media del precio de todos los productos del fabricante Asus.*/

SELECT AVG(precio) AS media_precios_Asus
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');

/*Calcula el precio más barato de todos los productos del fabricante Asus.*/

SELECT MIN(precio) AS precio_minimo_Asus
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');

/*Calcula el precio más caro de todos los productos del fabricante Asus.*/

SELECT MAX(precio) AS precio_maximo_Asus
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');


/*Calcula la suma de todos los productos del fabricante Asus.*/

SELECT SUM(producto.precio) AS total_Asus
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');

/*Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene
el fabricante Crucial*/

SELECT 
    MAX(precio) AS precio_maximo_Crucial,
    MIN(precio) AS precio_minimo_Crucial,
    AVG(precio) AS precio_medio_Crucial,
    COUNT(*) AS total_productos_Crucial
FROM producto 
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Crucial');

/*Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también
debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas,
una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el
resultado descendentemente por el número de productos.*/

SELECT fabricante.nombre, COUNT(producto.id) AS cantidad_productos
FROM fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id, fabricante.nombre
ORDER BY cantidad_productos DESC;

/*Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los
fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.*/

SELECT fabricante.nombre AS nombre_fabricante,
MAX(producto.precio) AS precio_maximo,
MIN(producto.precio) AS precio_minimo,
AVG(producto.precio) AS precio_medio
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
GROUP BY fabricante.nombre;

/*Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los
fabricantes que tienen un precio medio superior a 200. No es necesario mostrar el nombre del
fabricante, con el identificador del fabricante es suficiente.*/

SELECT id_fabricante, MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo, AVG(precio) AS precio_medio, COUNT(*) AS numero_productos
FROM producto
GROUP BY id_fabricante
HAVING precio_medio > 200;


/*. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y
el número total de productos de los fabricantes que tienen un precio medio superior a 200. Es
necesario mostrar el nombre del fabricante.*/

SELECT fabricante.nombre AS nombre_fabricante, 
       MAX(producto.precio) AS precio_maximo,
       MIN(producto.precio) AS precio_minimo, 
       AVG(producto.precio) AS precio_medio, 
       COUNT(producto.id) AS numero_productos
FROM producto
JOIN fabricante 
ON producto.id_fabricante = fabricante.id 
GROUP BY fabricante.nombre 
HAVING precio_medio > 200;

/*Calcula el número de productos que tienen un precio mayor o igual a 180*/

SELECT COUNT(*) AS cantidad_producto_mayor_180 FROM producto WHERE precio >= 180;

/*Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180.*/

SELECT fabricante.nombre AS nombre_fabricante, COUNT(*) AS cantidad_productos
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= 180
GROUP BY fabricante.nombre;


/*Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del
fabricante.*/

SELECT fabricante.id as id_fabricante, AVG(producto.precio) AS precio_medio
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id; 

/*Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del
fabricante.*/

SELECT fabricante.nombre as nombre_fabricante, AVG(producto.precio) AS precio_medio
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre;

/*Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150.*/

SELECT fabricante.nombre as nombre_fabricante, AVG(producto.precio) AS precio_medio
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING precio_medio >= 150;

/*Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos*/

SELECT fabricante.nombre as nombre_fabricante, COUNT(*) as cantidad_producto
from producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
GROUP BY fabricante.nombre
HAVING cantidad_producto >= 2;

/*Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada
uno con un precio superior o igual a 220 . No es necesario mostrar el nombre de los fabricantes
que no tienen productos que cumplan la condición.*/

SELECT fabricante.nombre as nombre_fabricante, COUNT(producto.precio >= 220) as cantidad_producto
from producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
GROUP BY fabricante.nombre;















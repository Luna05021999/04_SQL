USE PEDIDOS;
-- Obtener el listado de todos los productos

SELECT * FROM producto;

-- Obtener el número de pedido, dni del repartidor y hora de reparto de aquellos pedidos que se toman nota después de las siete de la tarde.

SELECT Numero, DNI_R, Hora_tm FROM pedido 
WHERE Hora_tm > '19:00:00'AND DNI_R IS NOT NULL;

-- -- Obtener todos los campos de empleados que cobran entre 900 y 1000 euros.

SELECT nombre, salario FROM empleado 
WHERE salario BETWEEN 900 AND 1000;

-- Obtener el número de pedido e importe de aquellos que han sido registrados en el mes de noviembre de 2020 y su importe es mayor a 15 Euros.

SELECT numero, importe FROM pedido 
WHERE fecha >= '2020-11-01' AND fecha < '2020-12-01' AND importe > 15;

-- Obtener por cada uno de los repartidores su DNI junto a la cantidad de pedidos entregados.

SELECT DNI_R, COUNT(numero) AS numero_pedidos FROM pedido
WHERE DNI_R is not null
GROUP BY DNI_R;

-- Obtener por cada mes (con el formato de nombre y no de número ej. Noviembre),la cantidad de pedidos realizados.

SELECT MONTHNAME(Fecha) AS Mes, COUNT(numero) AS Cantidad_pedidos FROM pedido 
GROUP BY MONTH(Fecha), monthname(Fecha) ORDER BY MONTH(Fecha);

-- Obtener un listado con el nombre y dni de los empleados en el mismo campo y anteponiendo el dni al nombre de la siguiente forma (ej; 45776633P, Juan Rodríguez López) 
-- que tenga turno de “tarde” o "noche". Ordenar el listado por dni.

SELECT CONCAT(DNI, nombre) AS Empleado FROM empleado
WHERE turno IN ('tarde', 'noche') 
ORDER BY DNI;

 -- Obtener el nombre, código y precio de aquellos productos que superen o igualen la media de todos los precios. Ordenar de mayor a menor precio
 
SELECT codigo, nombre, precio AS Superan_media FROM producto
WHERE precio >= (SELECT AVG(Precio) FROM PRODUCTO)
ORDER BY Precio DESC;

-- Obtener un listado con el nombre y DNI de los empleados que no han preparado nunca ningún pedido.

SELECT nombre, DNI FROM empleado
WHERE DNI NOT IN (SELECT DNI_EP FROM pedido);

-- Obtener el código, nombre y precio de los productos(estos dos últimos en el mismo campo) que están contenidos en los pedidos que ha tomado nota "Luis" o "María 
-- Luisa". Ordena el listado de mayor a menor valor por fecha del pedido.

SELECT CONCAT(nombre, precio), codigo FROM producto
JOIN consta

-- Obtener por cada repartidor, su nombre, cantidad de pedidos y el tiempo medio que tardan en entregar los pedidos una vez preparados. 
-- Ordenar el listado el tiempo medio que tardan en entregarlos:



-- Obtener un listado obteniendo el código, nombre y el precio de los productos cuyo precios sea el más barato o el más caro de todos.
SELECT nombre, codigo, precio FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto)
UNION
SELECT nombre, codigo, precio FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto)

/*
=== BASE DE DATOS BDG2 ===
realizar una base de datos con todas las tablas 
para ejemplificaar el uso de sql server
*/
-- SQL-LDD
-- Construir la base de datos bdg2
CREATE DATABASE bdg2;

--Utilizar la base de datos
USE bdg2;

CREATE TABLE  categoria (
 idcategoria int not null identity (1,1), 
 categorianombre nvarchar (20) not null, 
 constraint pk_categoria
 primary key(idcategoria)
);

CREATE TABLE producto (
idproducto int not null,
productonombre nvarchar (20) not null, 
precio money not null, 
existencia int not null,
categoriaid  int,
constraint pk_producto
primary key (idproducto),
constraint fk_producto_categoria
foreign key (categoriaid)
references categoria(idcategoria)
);

-- SQL-LMD
--Agregar registros
INSERT INTO categoria (categorianombre)
VALUES ('Lacteos')

INSERT INTO categoria (categorianombre)
VALUES ('Carnes frias'),
       ('Vinos y Licores');

 --Seleccionar los datos de la taba categoria
 SELECT *
 FROM categoria;

 SELECT categorianombre
 FROM categoria
 WHERE categorianombre = 'Vinos y Licores';

 SELECT categorianombre
 FROM categoria
 WHERE idcategoria in (1,3);

 SELECT categorianombre, idcategoria
 FROM categoria
 WHERE idcategoria = 1 or idcategoria = 3;


 --Modificar un registro de la base de datos 
 UPDATE categoria 
 SET categorianombre = 'Carnes Rojas'
 WHERE idcategoria = 2;


 SELECT *
 FROM categoria

 --Eliminar un registros
 DELETE FROM categoria
 WHERE idcategoria = 2;

 --INSERTAR EN PRODUCTO
 INSERT INTO producto
 VALUES (1, 'Rancho Viejo' , 3450.5, 50, 3);

 INSERT INTO  producto (productonombre, existencia, precio, categoriaid, idproducto)
 VALUES('Don Julio', 456, 43.2, 3,2),
        ('Leche Nido', 567, 567.4,1,3 )

SELECT  *
FROM producto;
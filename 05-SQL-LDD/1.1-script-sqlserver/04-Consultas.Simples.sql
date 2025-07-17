--Crear y usar la base de datos de norwind
--SQL-LMD(insert, delete, update, select)

USE  NORTHWND
GO

SELECT * FROM Categories;
GO

SELECT * FROM Products;
GO

SELECT * FROM Suppliers;
GO

SELECT * FROM Customers;
GO

SELECT * FROM Employees;
GO

SELECT * FROM Shippers;
GO

SELECT * FROM Orders;
GO

SELECT * FROM [Order Details];    --cuando los nombres de las categorias tienen espacio, se deben de ordenar con un corchete
GO

--vamos a crear una pryeccion (seleccionar una categoria)

SELECT CustomerID,CompanyName, City FROM Customers;
GO

--Alias de columna
--A los datos debemos torturarlos hasta que hablen

SELECT CustomerID AS 'Numero Empleado',
       CompanyName AS Empresa,
	   City AS Ciudad,
	   ContactName AS [Nombre del Contacto]
FROM Customers;
GO

--Alias de tabla
SELECT c.CustomerID AS [Numero de cliente],
       c.CompanyName AS [Empresa],
	   c.ContactName AS [Nombre de Contacto]
FROM Customers as c;

--otra forma
SELECT c.CustomerID AS [Numero de cliente],
       c.CompanyName AS [Empresa],
	   c.ContactName AS [Nombre de Contacto]
FROM Customers c;      /* <--- aqui le quito el AS */

--campo calculado 
SELECT *,(UnitPrice * Quantity) AS [Total]
FROM [Order Details];
GO
 --MEJORADO
 SELECT od.OrderID AS [Numero de orde,],
 od.ProductID AS [Número del producto],
 od.UnitPrice AS [numero],
 od.Quantity AS [Cantidad],
 (UnitPrice * Quantity) AS [Total]
FROM [Order Details] AS od;
GO

--seleccionar todos los productos que pertenezcan a la categoria 1
SELECT p.ProductId as [Numero],
       p.ProductName AS [Nombre],
	   p.CategoryID AS [Categoria],
	   p.UnitPrice AS [Precio],
	   p.UnitsInStock AS [Cantidad],
	   (p.UnitPrice * p.UnitsInStock) as [Costo]
	   FROM
Products AS p 
WHERE CategoryID= 1;


--Seleccionar todos los productos productos de la categoria Condiments

SELECT * FROM Categories

SELECT p.ProductId as [Numero],
       p.ProductName AS [Nombre],
	   p.CategoryID AS [Categoria],
	   p.UnitPrice AS [Precio],
	   p.UnitsInStock AS [Cantidad],
	   (p.UnitPrice * p.UnitsInStock) as [Costo]
	   FROM
Products AS p 
WHERE CategoryID= 2;

--Seleccionar todos los productos que su precio sea mayor a 40.3

SELECT ProductID AS [Numero de producto],
       ProductName AS [Nombre del producto],
	   UnitPrice AS [Precio del producto]

  FROM Products as p
  WHERE (p.UnitPrice > 40.3);
  GO

  --selecionar todos los productos donde el numero de categoria sea diferente a 3
   
SELECT ProductID AS [Numero de producto],
       ProductName AS [Nombre del producto],
	   UnitPrice AS [Precio del producto]

  FROM Products as p
  WHERE p.CategoryID !=3;
  
  GO

  --Seleccionar todas las ordenes que sean de brasil rio de janeiro, mostrando solo el numero de orden,
  --la fecha de orden, el pais de envio y la ciudad y su transportista

  Select * from Orders;

  SELECT o.OrderID AS [numero de orden],
         o.OrderDate AS [Fecha de la orden],
         o.ShipCity as [Ciudad],
		 o.ShipCountry as [Pais],
	     o.ShipVia AS [Transportista]
		 
	   FROM
Orders AS o
WHERE ShipCity = 'Rio de Janeiro';
GO


	   --seleccionar todas las ordenes, mostrando lo mismo que lo anterior pero todas aquellas qe no tengan region

	    SELECT o.OrderID AS [numero de orden],
         o.OrderDate AS [Fecha de la orden],
         o.ShipCity as [Ciudad],
		 o.ShipCountry as [Pais],
	     o.ShipVia AS [Transportista]
		 
	   FROM
Orders AS o
WHERE ShipRegion is null;
GO

  SELECT o.OrderID AS [numero de orden],
         o.OrderDate AS [Fecha de la orden],
         o.ShipCity as [Ciudad],
		 o.ShipCountry as [Pais],
	     o.ShipVia AS [Transportista]
		 
	   FROM
Orders AS o
WHERE ShipRegion  is not null;
GO

--seleccionar todas las ordenes enviadas a brazil, alemania, y mexico

SELECT * FROM Orders;

 SELECT o.OrderID AS [numero de orden],
         o.OrderDate AS [Fecha de la orden],
         o.ShipCity as [Ciudad],
		 o.ShipCountry as [Pais],
	     o.ShipVia AS [Transportista]
		 
	   FROM
Orders AS o
WHERE (o.ShipCountry = 'Mexico' 
or o.ShipCountry ='Germany'
or o.ShipCountry='Brazil')
and o.ShipRegion is  null
ORDER BY o.ShipCountry  ASC, o.ShipCity desc;     --ASC DE MANERA DE A A LA Z Y DESC ES DE LA Z A LA A
GO

--seleccionar todas las ordenes de francia, alemania y argentina
--(CLAUSULA in)

SELECT * FROM Orders
where ShipCountry in 
('Germany', 'France', 'Argentina');


--seleccioar todos los productos descontinuados o con precio mayor a 50 y ordenados por el precio


SELECT po.ProductID, po.ProductName, po.Discontinued, po.UnitPrice
 FROM
Products AS po

where po.Discontinued = 1 and 
      po.UnitPrice > 50
;

SELECT po.ProductID, po.ProductName, po.Discontinued, po.UnitPrice
 FROM
Products AS po

where po.Discontinued = 1 or 
      po.UnitPrice > 50
;		 


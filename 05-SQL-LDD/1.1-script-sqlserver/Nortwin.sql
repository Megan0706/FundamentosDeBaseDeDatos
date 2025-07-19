/*
USAR EL LENGUAJE DE SQL-LMD - CRUD - (Insert, Delate, Update, Select)
*/
-- USAR BASE NORTHWIND
USE NORTHWND;
GO

SELECT *
FROM Categories;
GO

SELECT *
FROM Products;
GO

SELECT *
FROM Suppliers;
GO

SELECT *
FROM Customers;
GO

SELECT *
FROM Employees;
GO

SELECT *
FROM Shippers;
GO

SELECT *
FROM Orders;
GO

/*
-- NO ES BUENA PRACTICA PONER ESPASIOS ENTRE ESPASIOS, 
PERO PARA ESO SE COLOCAN LOS [], 
QUE SE PODRIA CONSIDERAR UNA BUENA PRACTICA HACER ESO AUNQUE NO TENGA ESPACIOS
*/
SELECT *
FROM [Order Details];
GO

-- Proyeccion
-- NORMAL
SELECT *
FROM Customers;
GO

-- PROYECCION
SELECT CustomeRID, CompanyName, City
FROM Customers;
GO

-- REPASAR: VER BASE CANAL DE GALLARDO, GALLARDO TI

-- Alias de columnas
SELECT CustomerID AS 'Numero Empleado'
fROM Customers;
GO

SELECT CustomerID AS 'Numero Empleado',
       CompanyName Empresa
fROM Customers;
GO

--SI no hay espasios no son necsarias las comillas, pero preferiblemnte usar los corchetes
SELECT CustomerID AS 'Numero Empleado',
       CompanyName Empresa,
	   City AS Ciudad,
	   ContactName AS [Nombre del contacto]
fROM Customers;
GO

-- Alias de tablas
SELECT *
FROM Customers AS c;
GO

-- Siempre se pone el select y despues el from
SELECT Customers.CustomerID AS [Numero Cliente],
       Customers.CompanyName AS [Empresa],
	   Customers.ContactName AS [Nombre del contacto]
FROM Customers;
GO

-- Siempre se pone el select y despues el from
-- Puedes promer el AS en el from y funcina igual
SELECT c.CustomerID AS [Numero Cliente],
       c.CompanyName AS [Empresa],
	   c.ContactName AS [Nombre del contacto]
FROM Customers AS c;
GO

-- Puedes promer el AS en el from y funcina igual, 
-- este esta culero,  no lo uses pero sirve
/*
SELECT c.CustomerID AS [Numero Cliente],
       c.CompanyName AS [Empresa],
	   c.ContactName AS [Nombre del contacto]
FROM Customers c;
*/

-- CAMPO CALCULADO = DERIVADO EN EL MODELO E - R
SELECT *
FROM [Order Details];

SELECT *
FROM [Order Details] AS OD;
GO

--Campo calculado, el as no es obligatorio pero es mejor ponerlo
SELECT *, (UnitPrice * Quantity) AS [TOTAL]
FROM [Order Details] AS OD;
GO

--Campo calculado, el as no es obligatorio pero es mejor ponerlo
-- EL od no es necesario, puede ser mas simple
SELECT OD.OrderID AS [Numero de orden], 
	   OD.ProductID AS [Numero Producto],
	   OD.UnitPrice AS [Precio],
	   OD.Quantity AS [Cantidad],
       (UnitPrice * Quantity) AS [TOTAL]
FROM [Order Details] AS OD;
GO

/*
OPERADORES ARITMETICOS
+
-
/
*

OPERADORES RELACIONALES
=
>
<
>=
<=
!= o tmabien <>

OPERADORES LOGICOS
AND

tt|t
ft|f
tf|f
ff|f

OR

FF|T
TF|T
FT|T
FF|T

NOT
FT
TF

*/

-- SEleccionar todos los productos que pertenzacna a la cetegoria 1
SELECT *
FROM Products AS P;

SELECT *
FROM Products AS P
WHERE P.CategoryID = 1;

SELECT P.CategoryID AS [Numero],
	   P.ProductName AS [Nombre],
	   P.CategoryID AS [Categoria],
	   P.UnitPrice AS [Precio],
	   P.UnitsInStock AS [Stock],
	   (P.UnitPrice * P.UnitsInStock) AS [Costo del Inventario]
FROM Products AS P
WHERE P.CategoryID = 1;

-- Seleccionar todos los productos de la categoria condiments
-- Los alias solo funcionan en esa consulta
SELECT *
FROM categories AS C;
GO

SELECT P.CategoryID AS [Numero],
	   P.ProductName AS [Nombre],
	   P.CategoryID AS [Categoria],
	   P.UnitPrice AS [Precio],
	   P.UnitsInStock AS [Stock],
	   (P.UnitPrice * P.UnitsInStock) AS [Costo del Inventario]
FROM Products AS P
WHERE P.CategoryID = 2;
GO

-- SELECCIOANR todos los productos que su precio sea mayor a 40.3
-- el where simpre va despues del from
SELECT P.CategoryID AS [Numero],
	   P.ProductName AS [Nombre del producto],
	   p.UnitPrice AS [Precio]
FROM Products AS p
WHERE (p.UnitPrice > 40.3);
GO

-- SELECCIOANR todos los productos que su precio sea mayor o igual a 40
-- el where simpre va despues del from
SELECT P.CategoryID AS [Numero],
	   P.ProductName AS [Nombre del producto],
	   p.UnitPrice AS [Precio]
FROM Products AS p
WHERE (p.UnitPrice >= 40.3);
GO

-- SELECCIOANR todos los productos que su precio sea mayor o igual a 40
-- el where simpre va despues del from
SELECT P.CategoryID AS [Numero],
	   P.ProductName AS [Nombre del producto],
	   p.UnitPrice AS [Precio]
FROM Products AS p
WHERE (p.CategoryID != 3);
--tambien puede ser WHERE (p.CategoryID <> 3);
GO

-- Seleccionar todas las ordenes que sean de brazil rio de janeiro, 
-- mostrnado solo el numero de orden, 
-- la fecha de orden
-- Pais de envio
-- Cuidad
-- Transportista

--SELECCIONAR LAS ORDENES MOSTRANDO LO MISMO QUE LA CONSULTA ANTERIOR PERO TODAS AQUELLAS QUE NO TENGAN REGION DE ENVIO

--SELECCIONAR LAS ORDENES MOSTRANDO LO MISMO QUE LA CONSULTA ANTERIOR PERO TODAS AQUELLAS QUE si TENGAN REGION DE ENVIO
SELECT *
FROM Orders;
GO

SELECT O.ShipRegion AS [REGION],
	   O.OrderID AS [Numero de orden],
	   O.OrderDate AS [FECHA DE ORDEN],
	   O.ShipCountry AS [PAIS DE ENVIO],
	   O.ShipCity AS [CUIDAD DE ENVIO],
	   O.ShipVia AS [TRANSPORTISTA]
FROM Orders AS O
WHERE ShipCity = 'Rio de Janeiro'
;

SELECT O.ShipRegion AS [REGION],
	   O.OrderID AS [Numero de orden],
	   O.OrderDate AS [FECHA DE ORDEN],
	   O.ShipCountry AS [PAIS DE ENVIO],
	   O.ShipCity AS [CUIDAD DE ENVIO],
	   O.ShipVia AS [TRANSPORTISTA]
FROM Orders AS O
WHERE (ShipRegion IS NULL);


SELECT O.ShipRegion AS [REGION],
	   O.OrderID AS [Numero de orden],
	   O.OrderDate AS [FECHA DE ORDEN],
	   O.ShipCountry AS [PAIS DE ENVIO],
	   O.ShipCity AS [CUIDAD DE ENVIO],
	   O.ShipVia AS [TRANSPORTISTA]
FROM Orders AS O
WHERE (O.ShipRegion IS NOT NULL);

-- Seleccionar todas las oredenes enviadas a brazil alemania y mexico y con region
-- Simpre que se use or y and hay que poner parentesis
SELECT O.ShipRegion AS [REGION],
	   O.OrderID AS [Numero de orden],
	   O.OrderDate AS [FECHA DE ORDEN],
	   O.ShipCountry AS [PAIS DE ENVIO],
	   O.ShipCity AS [CUIDAD DE ENVIO],
	   O.ShipVia AS [TRANSPORTISTA]
FROM Orders AS O
WHERE (O.ShipCountry = 'Brazil' 
       or O.ShipCountry = 'Mexico' 
	   or O.ShipCountry = 'Germany')
	   and (O.ShipRegion is not null)
;
GO

-- Poner un orden alfabetico
-- El orden simpre es al final
-- Simpre que se use or y and hay que poner parentesis
-- ASC, ASENDENTE   =   DESC DESCENDENTE
SELECT O.ShipRegion AS [REGION],
	   O.OrderID AS [Numero de orden],
	   O.OrderDate AS [FECHA DE ORDEN],
	   O.ShipCountry AS [PAIS DE ENVIO],
	   O.ShipCity AS [CUIDAD DE ENVIO],
	   O.ShipVia AS [TRANSPORTISTA]
FROM Orders AS O
WHERE (O.ShipCountry = 'Brazil' 
       or O.ShipCountry = 'Mexico' 
	   or O.ShipCountry = 'Germany')
	   and (O.ShipRegion is null)
-- El alias se puede usar aqui el el order by, [PAIS DE ENVIO]
ORDER BY O.ShipCountry ASC, O.ShipCity DESC
;
GO

SELECT *
FROM Orders;
GO

-- SELECCIONAR TODAS LAS ORDENES DE FRANCIA,A LEMANIA Y ARGENTINA (clausula in)
SELECT *
FROM Orders
WHERE ShipCountry in ('Germany', 'France', 'Argentina')
ORDER BY ShipCountry ASC
;
GO

-- SELECCIONAR TODOS LOS PRODUCTOS DESCONTINUADOS O CON PRECIO MAYOR A 50 Y ORDENADOS POR EL PRECIO, DEL MAYOR A MENOR
SELECT *
FROM Products;
GO

SELECT p.CategoryID AS [Numero],
	   p.ProductName AS [Nombre del producto],
	   p.UnitPrice AS [Precio],
	   p.Discontinued [descontinuado]
FROM Products AS p
WHERE (p.Discontinued = 1 or p.UnitPrice > 50)
ORDER BY p.UnitPrice DESC
;
GO

SELECT p.CategoryID AS [Numero],
	   p.ProductName AS [Nombre del producto],
	   p.UnitPrice AS [Precio],
	   p.Discontinued [descontinuado]
FROM Products AS p
WHERE (p.Discontinued = 1 AND p.UnitPrice > 50)
ORDER BY p.UnitPrice DESC
;
GO

SELECT FirstName,LastName, HireDate
FROM Employees;

SELECT (FirstName + ' '+ LastName) AS [Nombre Completo],
HireDate AS [Fecha de contratación]
FROM Employees
WHERE HireDate >'1994-12-31' ;


SELECT CONCAT(FirstName , ' ', LastName) AS [Nombre Completo],
HireDate AS [Fecha de contratación], YEAR(HireDate) AS [Año de contratación],
MONTH (HireDate) AS [Mes de Contratación], DAY(HireDate) as [Dia de Contratacion]
FROM Employees
WHERE YEAR(HireDate) > 1993;

--Mostrar los empleados que fueron contratados em Abril

SELECT MAX(HIREDATE) FROM Employees;

SELECT GETDATE();

--Mostrar los empleados que fueron contratados em Abril

SELECT CONCAT(FirstName , ' ', LastName) AS [Nombre Completo],
HireDate AS [Fecha de contratación], DATEPART(YEAR, HireDate) AS [Año de contratación],
MONTH (HireDate) AS [Mes de Contratación], DAY(HireDate) as [Dia de Contratacion]
FROM Employees
WHERE MONTH(HireDate)=4;
;


SELECT CONCAT(FirstName , ' ', LastName) AS [Nombre Completo],
HireDate AS [Fecha de contratación], DATEPART(YEAR, HireDate) AS [Año de contratación],
DATEPART(mm,HireDate) AS [Mes de Contratación], DATEPART(d,HireDate) as [Dia de Contratacion],
DATEPART(quarter,HireDate) AS [Trimestre],
DATENAME (weekday,HireDate) as [Dia],
DATENAME (MONTH,HireDate) as [Mes]
FROM Employees
WHERE MONTH(HireDate)=4;
;

SELECT DATENAME(year, '12:10:30.123')  
    ,DATENAME(month, '12:10:30.123')  
    ,DATENAME(day, '12:10:30.123')  
    ,DATENAME(dayofyear, '12:10:30.123')  
    ,DATENAME(weekday, '12:10:30.123');

	--seleccionar los productos que no estan descontinuados
	SELECT ProductName as [Nombre Producto],	Discontinued AS [Descontinuado]
	FROM Products
	WHERE Discontinued=0;

	--seleccionar los proveedores que no son de USA
	SELECT CompanyName AS [Empresa],
	ContactName AS [Contacto]
	FROM Suppliers
	WHERE Country <> 'USA';

	--Seleccionaar los pridcutos caros y bajo precio, con orecio mayiresa 50 y menor a 20

	SELECT ProductName AS [Nombre del producto], SupplierID AS [Proveedor],
	UnitsInStock AS [Existencia], UnitPrice AS [Precio unitario]
	FROM Products
	{WHERE UnitPrice>50 and UnitsInStock<20;


	
	SELECT ProductName AS [Nombre del producto], Supplier.SupplierID AS [Proveedor],

	UnitsInStock AS [Existencia], UnitPrice AS [Precio unitario]
	FROM Products, Suppliers
	WHERE (Products.SupplierID= Suppliers.SuplierID)
	{WHERE UnitPrice>50 and UnitsInStock<20;



	--Clientes de mexico y españa, y que tengan region
	SELECT c.CompanyName AS [Cliente],
	      c.City AS [Ciudad],
		  c.Country AS [País],
		  c.Region AS [Region]

	FROM Customers AS c
	WHERE (Country= 'Mexico ' OR country ='Spain')
	AND Region is not  null ;

	--productos qu eno estan descontinuados y tienen inventario

	SELECT p.ProductName AS [Nombre Producto], p.UnitsInStock as [Existencia],
	       p.UnitPrice AS [Precio], Discontinued,
		   (p.UnitPrice * p.UnitsInStock) AS [Precio dek inventario]
	FROM Products AS p 
	WHERE P.Discontinued = 1 AND p.UnitsInStock>0; 

	--Prodcutos que no son de estados unidos ni de reino unido


	SELECT s.CompanyName AS [Nombre de Empresa], s.City AS [Ciudad],
	       s.Country as [Pais]
	FROM Suppliers as s 
	WHERE NOT (s.Country <> 'USA' or s.Country= 'UK');

	
	SELECT s.CompanyName AS [Nombre de Empresa], s.City AS [Ciudad],
	       s.Country as [Pais]
	FROM Suppliers as s 
	WHERE s.Country <> 'USA' and s.Country= 'UK';

	--Order by, SELECCIONAR A TODOS LOS PROVEEDORES MOSTRANDO EL NOMBRE,PAIS, CIUDAD ordenada por pais de menor a mayor

	SELECT s.CompanyName AS [Nombre],
	      s.Country as [Pais],
		  s.City as [CIUDAD]
	FROM Suppliers as s
	ORDER BY Country ASC;

	--FOma descendente

	
	SELECT s.CompanyName AS [Nombre],
	      s.Country as [Pais],
		  s.City as [CIUDAD]
	FROM Suppliers as s
	ORDER BY Country DESC;

	--seleccionar todos los provedores mostrando el nombre dek proveedor, el 
	--pais y la ciudad ordenada por pais de mayor a menos y dentro de pais poe la ciudad de menor a mayor

	SELECT s.CompanyName AS [Nombre],
	      s.Country as [Pais],
		  s.City as [CIUDAD]
	FROM Suppliers as s
	ORDER BY Country DESC, City DESC  ;
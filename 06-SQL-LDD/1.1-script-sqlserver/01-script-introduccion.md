```sql

--Agregar nombre de la empresa
--Para 1er contruye toda l tabla que no tenga FK y despues las que tengan menos atributos 
-- Lenguaje sql-ldd (create, alter y drop), crear la base de empresa g2

CREATE DATABASE empresag2;
GO

--Utilizar la base de datos
USE empresag2; 

--Crea la tabla de categorias
CREATE TABLE Categorias
(
CategoriaId int primary key,
nombrecategoria nvarchar(30) not null unique
);
GO

--Crear la tabla empleado
CREATE TABLE Empleado
(
 EmpleadoId int not null identity (1,1),
 Nombre nvarchar (30) not null, 
 ApellidoPaterno nvarchar(15)not null,
 curp char(18) not null,
 telefono char(15),
 sexo char(1) not null,
 activo bit not null, 
 CONSTRAINT pk_empleado
 PRIMARY KEY (EmpleadoId),
 CONSTRAINT unique_curp
 UNIQUE(curp),
 CONSTRAINT chk_sexo
 CHECK(sexo in ('M', 'F'))
);
GO

--insertar en categorias

INSERT INTO Categorias (CategoriaId, nombrecategoria)
VALUES(1,'CARNES FRIAS')


INSERT INTO Categorias (CategoriaId, nombrecategoria)
VALUES(2,'VINOS Y LICORES')

SELECT * FROM Categorias;
--Insertar en empleado

INSERT INTO Empleado (nombre, ApellidoPaterno, curp, telefono,sexo,activo)
VALUES ('sarahi', 'djwshsj', 'md', '2430069878', 'F' , 1);
GO
SELECT * FROM Empleado;
GO
```sql
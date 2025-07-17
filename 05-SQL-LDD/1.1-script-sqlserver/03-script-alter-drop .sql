--Crea una base de datos nueva

CREATE DATABASE bdmorgan;
GO

USE bdmorgan;
GO

CREATE TABLE empleado (
IdEmpleado int not null identity(1,1),
Nombre varchar(17) not null,
Apellido1 varchar (28) not null,
Apellido2 varchar(15),
edad int not null,
estatus char(1) not null default 'A'

);

--Añadir columnas a la tabla empleado
ALTER TABLE empleado
ADD jef int ;
GO
--añadir otra columna
ALTER TABLE empleado
ADD IdDepto int;
GO

--Restricciones
ALTER TABLE empleado
ADD CONSTRAINT pk_empleado
PRIMARY KEY (IdEmpleado)
GO

ALTER TABLE empleado
ADD CONSTRAINT chk_edad
CHECK (edad between 18 and 60);
GO

ALTER TABLE empleado
ADD CONSTRAINT fk_empleado
PRIMARY KEY (jef)
REFERENCES empleado(IdEmpleado);
go


--Crear la tabla de departamento
CREATE TABLE departamento(
IdDepart int not null identity(1,1),
NomDepto nvarchar(20) not null,
IdEmpleado int not null,
CONSTRAINT pk_depto
PRIMARY KEY (IdDepart)

);
GO




--Crear una nueva base de datos ejemplo en clase

CREATE DATABASE empresacucha;
GO

USE empresacucha;
GO

--Crear tabla empleados
CREATE TABLE empleados(
IdEmpleado int not null identity(1,1),
Nombre varchar(100) not null,
Puesto varchar(20) ,
FechaIngreso date,
Salario decimal(10,2),
CONSTRAINT pk_empleados
PRIMARY KEY (IdEmpleado)
);
GO

--Crear tabla departamentos
CREATE TABLE departamento( 
IdDepto int not null primary key,
NombreDepto varchar(50)
);
GO

--Agregar una columna a la tabla empleados
ALTER TABLE empleados
ADD CorreoElectronico varchar(20) not null;
GO


--Modificar un tipo de dato de salario de la tabla empleados
ALTER TABLE empleados
ALTER COLUMN Salario money not null;
GO

--Renombrar una columna correo electronico de  la tabla empleados
EXECUTE sp_rename
                 'empleados.CorreoElectronico',
				 'Email' , 'COLUMN';
GO

--Agregar una columna para empleados para  clave foranea 
ALTER TABLE empleados
ADD IdDepto int ;
GO

--Agregar un constraint a foreing key
ALTER TABLE empleados
ADD CONSTRAINT fk_empleados_depto
FOREIGN KEY (IdDepto) 
REFERENCES Departamento(IdDepto);
GO

--Agregae un constarint a salario
ALTER TABLE empleados
ADD CONSTRAINT chk_Salario
CHECK(Salario>=100 and salario<=100000)
GO

--Agregra un constrain nique al nombre del departamento
ALTER TABLE departamento
ADD CONSTRAINT unique_NombreDepto
UNIQUE (NombreDepto);
GO


--Eliminar el constraint de foreign key
ALTER TABLE empleados
DROP  CONSTRAINT fk_empleados_depto;
GO

--Eliminar la primary key de empleados
ALTER TABLE empleados
DROP CONSTRAINT pk_empleados;
GO

--Eliminar la primary key de departamentos
ALTER TABLE departamento
DROP CONSTRAINT [PK__departam__7AEC424EED259CB6];
GO

--Eliminar columna
ALTER TABLE empleados
DROP COLUMN Email;
GO

--Eliminar una tabla
DROP TABLE departamento;
GO

DROP TABLE empleados;
GO


SELECT * FROM empleados;
GO
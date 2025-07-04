```sql

--Agregar nombre de la empresa
--Para 1er contruye toda l tabla que no tenga FK y despues las que tengan menos atributos 
-- Lenguaje sql-ldd (create, alter y drop), crear la base de empresa g2

CREATE DATABASE empresag2;


#Utilizar la base de datos
USE empresag2; 

#Crea la tabla de categorias

CREATE TABLE Categorias
(
CategoriaId int primary key,
nombrecategoria nvarchar(30) not null unique
);


#Crear la tabla empleado
CREATE TABLE Empleado
(
 EmpleadoId int not null auto_increment,
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


#insertar en categorias

INSERT INTO Categorias (CategoriaId, nombrecategoria)
VALUES(1,'CARNES FRIAS');


INSERT INTO Categorias (CategoriaId, nombrecategoria)
VALUES(2,'VINOS Y LICORES');

SELECT * FROM Categorias;

#Insertar en empleado

INSERT INTO Empleado (nombre, ApellidoPaterno, curp, telefono,sexo,activo)
VALUES ('sarahi', 'djwshsj', 'md', '2430069878', 'F' , 1);

SELECT * FROM Empleado;


# Creacion de primary key compuestas

CREATE TABLE Tabla1
(
 Tabla1id1 int not null,
 Tabla1id2 int not null,
 Nombre nvarchar(20) not null,
 CONSTRAINT pk_tabla1
 PRIMARY KEY(Tabla1id1, Tabla1id2)
);


#Razon de cardinalidad 1:N

CREATE TABLE tabla2(
Tabla2id int not null auto_increment,
Nombre varchar (20),
Tabla1id1 int, 
Tabla1id2 int,
CONSTRAINT pk_tabla2
PRIMARY KEY (Tabla1id2),
CONSTRAINT fk_tabla2_tabla1
FOREIGN KEY (Tabla1id1, Tabla1id2)
REFERENCES Tabla1(Tabla1id1 , Tabla1id2)
);


#Razon de cardinalidad 1:1 (fidelidad)

CREATE TABLE Employee
(
Id int  not null auto_increment,
Nombre varchar (20) not null,
Ap1 varchar(15) not null,
Ap2 varchar(15),
Sexo char (1) not null,
Salario decimal(10,2) not null,
CONSTRAINT pk_Employee
PRIMARY KEY(Id),
CONSTRAINT chk_Sexo2
CHECK (Sexo in ('M', 'F')),
CONSTRAINT chk_Salario
CHECK (Salario>0.0)
);


CREATE TABLE Departmet
(
 Id int not null auto_increment,
 NombreProyecto nvarchar(20) not null,
 Ubicacion varchar(15) not null, 
 FechaInicio date not null,
  IdEmployee int not null,
 CONSTRAINT pk_Department
 PRIMARY KEY(Id),
 CONSTRAINT unique_nombreproyecto
 UNIQUE (NombreProyecto),
 CONSTRAINT unique_IdEmployee 
 UNIQUE(IdEmployee), 
 CONSTRAINT fk_Department_Employee
 FOREIGN KEY (IdEmployee)
 REFERENCES Employee(Id)
);



#Razon de Cardinalidad N:M 

CREATE TABLE Project
(
ProjectId int  not null auto_increment,
Nombre varchar (20) not null,
CONSTRAINT pk_Project
PRIMARY KEY(ProjectId),
CONSTRAINT Unique_Nombre
UNIQUE (Nombre)
);


CREATE TABLE Work_On
(
 EmployeId int not null,
 ProjectId int not null,
 Horas int not null, 
 CONSTRAINT pk_Work_On
 PRIMARY KEY (EmployeId, ProjectId),
 CONSTRAINT fk_Work_On_Employee
 FOREIGN KEY(EmployeId)
 REFERENCES Employee(Id),
 CONSTRAINT fk_work_On_Project
 Foreign key (ProjectId)
 REFERENCES Project(ProjectId)
);
```sql
-- Crear la base de datos
```sql
CREATE DATABASE EmployeeG3;
GO

USE EmployeeG3;

-- Tabla: Employee
CREATE TABLE Employee1 (
    SSN INT PRIMARY KEY,
    Firstname NVARCHAR(20) NOT NULL UNIQUE,
    Lastname NVARCHAR(20) NOT NULL,
    Address NVARCHAR(100) NOT NULL,
    Birthdate DATE NOT NULL,
    Salary MONEY,
    sex NVARCHAR(20),
    NumberDepto_FK INT,
    Supervisor_FK INT
);

-- Tabla: Department
CREATE TABLE Department (
    NumberDepartment INT PRIMARY KEY,
    NameDepartment NVARCHAR(30) NOT NULL,
    SSN_FK INT,
    Startdate DATE NOT NULL
);

-- Tabla: Deptlocations
CREATE TABLE Deptlocations (
    NumberDeport INT NOT NULL,
    Location NVARCHAR(30) NOT NULL,
    PRIMARY KEY (NumberDeport, Location)
);

-- Tabla: Projects
CREATE TABLE Projects (
    NumberProject INT PRIMARY KEY,
    nameproject NVARCHAR(30) NOT NULL,
    locations NVARCHAR(30) NOT NULL,
    numberdeptFK INT
);

-- Tabla intermedia: Work_on
CREATE TABLE Work_on (
    SSN_FK INT NOT NULL,
    numberproject_FK INT NOT NULL,
    hours INT,
    PRIMARY KEY (SSN_FK, numberproject_FK)
);

-- Tabla: Dependent
CREATE TABLE Dependent (
    SSN_FK INT NOT NULL,
    name_FK NVARCHAR(30) NOT NULL,
    relationship NVARCHAR(20),
    sex NVARCHAR(20) NOT NULL,
    Birthdate DATE,
    PRIMARY KEY (SSN_FK, name_FK)
);



-- Empleado pertenece a un departamento
ALTER TABLE Employee1
ADD CONSTRAINT FK_Employee_Department FOREIGN KEY (NumberDepto_FK)
REFERENCES Department(NumberDepartment);

-- Empleado tiene un supervisor (otro empleado)
ALTER TABLE Employee1
ADD CONSTRAINT FK_Employee_Supervisor FOREIGN KEY (Supervisor_FK)
REFERENCES Employee1(SSN);

-- Departamento tiene un gerente (empleado)
ALTER TABLE Department
ADD CONSTRAINT FK_Department_Manager FOREIGN KEY (SSN_FK)
REFERENCES Employee1(SSN);

-- Localizaciones del departamento
ALTER TABLE Deptlocations
ADD CONSTRAINT FK_Deptlocations_Department FOREIGN KEY (NumberDeport)
REFERENCES Department(NumberDepartment);

-- Proyecto pertenece a un departamento
ALTER TABLE Projects
ADD CONSTRAINT FK_Project_Department FOREIGN KEY (numberdeptFK)
REFERENCES Department(NumberDepartment);



-- Agregar clave foránea a la tabla Work_on para el empleado
ALTER TABLE Work_on
ADD CONSTRAINT FK_Workon_Employee FOREIGN KEY (SSN_FK)
REFERENCES Employee1(SSN);


-- Dependientes están ligados a un empleado
ALTER TABLE Dependent
ADD CONSTRAINT FK_Dependent_Employee FOREIGN KEY (SSN_FK)
REFERENCES Employee1(SSN);

```sql
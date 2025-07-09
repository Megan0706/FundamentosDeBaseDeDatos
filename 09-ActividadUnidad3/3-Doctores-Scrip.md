--Crear base de datos de doctores
```sql
CREATE DATABASE Doctores;
GO

USE Doctores;

CREATE TABLE Doctor
(
IdDoctor int primary key,
Nombre nvarchar(20) not null unique,
Especialidad nvarchar(50) not null,
);
GO


CREATE TABLE Paciente
(
IdPaciente int primary key,
Nombres nvarchar(20) not null unique,
Apellido1 nvarchar(50) not null,
Apellido2 nvarchar(50),
);
GO


CREATE TABLE Atiende
(
IdDoctor int not null,
IdPaciente int not null,
fecha int not null,
Diagnostico nvarchar(30) not null,
CONSTRAINT pk_Atiende
PRIMARY KEY (IdDoctor, IdPaciente),
CONSTRAINT fk_Atiende_Doctor
FOREIGN KEY (IdDoctor)
REFERENCES Doctor(IdDoctor),
CONSTRAINT fk_Atiende_Paciente
FOREIGN KEY (IdPaciente)
REFERENCES Paciente(IdPaciente),

);
GO
```sql

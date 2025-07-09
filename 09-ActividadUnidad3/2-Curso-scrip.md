--Creal base de datos de alumno y curso
```sql

CREATE DATABASE Cursos;
GO

USE Cursos;

CREATE TABLE Alumno
(
NumAlumno int primary key,
Nombre nvarchar(20) not null unique,
Apellido1 nvarchar(50) not null,
Apellido2 nvarchar(30),
);
GO

CREATE TABLE Curso (
NumCurso int Primary Key not null,
nombre nvarchar(20) not null unique,

);
GO

CREATE TABLE Participa(
Ubicacionid int not null unique,
NumCurso int not null,
CONSTRAINT pk_Participa
PRIMARY KEY (Ubicacionid, NumCurso),
CONSTRAINT fk_Participa_Curso
FOREIGN KEY (NumCurso)
REFERENCES Curso(NumCurso),
CONSTRAINT fk_Participa_Participa
FOREIGN KEY (Ubicacionid)
REFERENCES Participa(Ubicacionid)
);
GO

CREATE TABLE Ubicacion(
NumAlumno int not null,
NumCurso int not null,
horas int not null,
FechaCurso int not null,
CONSTRAINT pk_Ubicacion
PRIMARY KEY (NumAlumno, NumCurso),
CONSTRAINT fk_Ubicacion_Alumno
FOREIGN KEY (NumAlumno)
REFERENCES Alumno(NumAlumno),
CONSTRAINT fk_Ubicacion_Curso
FOREIGN KEY (NumCurso)
REFERENCES Curso(NumCurso) 
);
GO
```sql

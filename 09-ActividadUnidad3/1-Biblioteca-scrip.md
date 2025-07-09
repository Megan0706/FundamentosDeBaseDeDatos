--Crear base de datos de datos biblioteca

CREATE DATABASE biblioteca;
GO

USE biblioteca;

CREATE TABLE Libro
(
NumLibro int primary key,
isbn int not null unique,
titulo nvarchar(50) not null,
autor nvarchar(30) not null,
);
GO

CREATE TABLE Lector(
NumLector int Primary Key,
NumMateria int not null,
Nombrep nvarchar(30) not null,
Apellido1 nvarchar(30) not null,
Apellido2 nvarchar(30),
);
GO

CREATE TABLE Presta(
NumLibro int not null,
NumLector int not null,
fechaPrestamo int not null,
CONSTRAINT pk_Presta
PRIMARY KEY(NumLibro, Numlector),
CONSTRAINT fk_Presta_Libro
FOREIGN KEY(NumLibro)
REFERENCES Libro(NumLibro),
CONSTRAINT fk_Presta_Lector
FOREIGN KEY (NumLector)
REFERENCES Lector(NumLector)
);
GO
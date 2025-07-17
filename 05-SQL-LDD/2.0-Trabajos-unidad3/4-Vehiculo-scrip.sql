--Base de datos de Vehiculos


CREATE DATABASE Vehiculos;
GO

USE Vehiculos;

CREATE TABLE Cliente
(
NumCliente int primary key,
Nombre nvarchar(20) not null unique,
Apellido1 nvarchar(50) not null,
Apellido2 nvarchar(30),
curp nchar(20) not null unique,
telefono int not null,
calle nvarchar(50) not null,
numero int not null,
ciudad nvarchar(50) not null
);


CREATE TABLE Sucursal(
numeroSucursal int primary key,
Nombre nvarchar(30) not null,
ubicacion nvarchar(30) not null
);
GO

CREATE TABLE Vehiculo(
numVehiculo int not null,
placa nvarchar(20) not null,
marca nvarchar(40) not null,
modelo nvarchar(20) not null,
anio int not null,
NumCliente int not null,
numeroSucursal int not null,
CONSTRAINT pk_Vehiculo
PRIMARY KEY (NumCliente, numeroSucursal, numVehiculo),
CONSTRAINT fk_Vehiculo_Cliente
FOREIGN KEY (NumCliente)
REFERENCES Cliente(NumCliente),
CONSTRAINT fk_Vehiculo_Sucursal
FOREIGN KEY (numeroSucursal)
REFERENCES Sucursal(numeroSucursal)
);
GO
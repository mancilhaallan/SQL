USE master;

CREATE DATABASE DB_Locadora;
GO

USE DB_Locadora;

CREATE TABLE TBL_Empresa(
	IdEmpresa INT PRIMARY KEY IDENTITY (1,1),
	NomeEmpresa VARCHAR(200) NOT NULL,
);
GO

CREATE TABLE TBL_Cliente(
	IdCliente INT PRIMARY KEY IDENTITY (1,1),
	NomeCliente VARCHAR(200) NOT NULL,
	CPF VARCHAR(11) NOT NULL
);
GO

CREATE TABLE TBL_Marca(
	IdMarca INT PRIMARY KEY IDENTITY (1,1),
	NomeMarca VARCHAR(200) NOT NULL
);
GO

CREATE TABLE TBL_Modelo(
	IdModelo INT PRIMARY KEY IDENTITY (1,1),
	NomeModelo VARCHAR(200) NOT NULL,
	FK_IdMarca INT FOREIGN KEY REFERENCES TBL_Marca(IdMarca) NOT NULL
);
GO

CREATE TABLE TBL_Veiculo(
	IdVeiculo INT PRIMARY KEY IDENTITY (1,1),
	Placa VARCHAR(7) NOT NULL,
	FK_IdEmpresa INT FOREIGN KEY REFERENCES TBL_Empresa(IdEmpresa) NOT NULL,
	FK_IdModelo INT FOREIGN KEY REFERENCES TBL_Modelo(IdModelo) NOT NULL
);

CREATE TABLE TBL_Aluguel(
	IdAluguel INT PRIMARY KEY IDENTITY (1,1),
	FK_IdCliente INT FOREIGN KEY REFERENCES TBL_Cliente(IdCliente) NOT NULL,
	FK_IdVeiculo INT FOREIGN KEY REFERENCES TBL_Veiculo(IdVeiculo) NOT NULL,
	DataInicio DATETIME NOT NULL,
	DataFim DATETIME NOT NULL
);
GO
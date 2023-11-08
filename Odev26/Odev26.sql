--1)
CREATE DATABASE Odev26Db
GO

USE Odev26Db
GO

CREATE TABLE Danismanlar
(
    Id INT PRIMARY KEY IDENTITY,
	Ad NVARCHAR(50) NOT NULL,
	Soyad NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE Talebeler
(
    Id INT PRIMARY KEY IDENTITY,
	Ad NVARCHAR(50) NOT NULL,
	Soyad NVARCHAR(50) NOT NULL,
	DanismanId INT FOREIGN KEY REFERENCES Danismanlar(Id) NULL
)

INSERT INTO Danismanlar(Ad, Soyad)
VALUES
(N'Derin',N'Y�ld�z'),
(N'Mete', N'�ahin'),
(N'Sevil',N'Kaya'),
(N'Leyla',N'Y�lmaz'),
(N'Berna',N'Korkmaz');
GO

INSERT INTO Talebeler(Ad,Soyad,DanismanId)
VALUES
(N'Kenan',N'�ahin',1),
(N'Fatma',N'Sipahi',2),
(N'Mehmet',N'Ziya',5),
(N'Ahmet',N'D�ndar',2),
(N'Ferhat',N'T�nek',3),
(N'Naci',N'�ak�r',4),
(N'P�nar',N'Solmaz',NULL),
(N'G�l�ah',N'Sezer',NULL),
(N'Cem',N'Denli',NULL),
(N'Merve',N'Koruk',NULL);
GO

SELECT * FROM Talebeler JOIN Danismanlar on Danismanlar.Id = Talebeler.DanismanId


USE NORTHWND
--2)
SELECT Products.ProductName, Products.UnitPrice FROM Products JOIN [Order Details] on [Order Details].ProductID = Products.ProductID
WHERE Discount != 0

--3)
SELECT Suppliers.City, Suppliers.CompanyName FROM Suppliers JOIN Products on [Products].SupplierID = Suppliers.SupplierID 
WHERE Suppliers.City = N'New Orleans'
order by Products.ProductName desc

--4)
SELECT * FROM Territories JOIN Region on Region.RegionID = Territories.RegionID
WHERE Territories.TerritoryDescription = N'Boston'

--5)
SELECT Products.ProductName, Categories.CategoryName, Products.Discontinued FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE (Categories.CategoryName = N'Seafood' OR Categories.CategoryName = N'Cheeses') AND Products.Discontinued = 1

--6)
SELECT Employees.FirstName, Employees.LastName, Employees.ReportsTo FROM Employees
JOIN Employees E1 ON Employees.EmployeeID = E1.ReportsTo


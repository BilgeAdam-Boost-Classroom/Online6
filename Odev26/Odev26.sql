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
(N'Derin',N'Yýldýz'),
(N'Mete', N'Þahin'),
(N'Sevil',N'Kaya'),
(N'Leyla',N'Yýlmaz'),
(N'Berna',N'Korkmaz');
GO

INSERT INTO Talebeler(Ad,Soyad,DanismanId)
VALUES
(N'Kenan',N'Þahin',1),
(N'Fatma',N'Sipahi',2),
(N'Mehmet',N'Ziya',5),
(N'Ahmet',N'Dündar',2),
(N'Ferhat',N'Tünek',3),
(N'Naci',N'Çakýr',4),
(N'Pýnar',N'Solmaz',NULL),
(N'Gülþah',N'Sezer',NULL),
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


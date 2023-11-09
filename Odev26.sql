USE NORTHWND;
--1.
CREATE TABLE Danismanlar (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL
);

--*
CREATE TABLE Talebeler (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    DanismanId INT NULL,
    FOREIGN KEY (DanismanId) REFERENCES Danismanlar(Id)
	);

	--**
	INSERT INTO Danismanlar (Ad, Soyad)
VALUES
    ('Ali', 'Ekin'),
    ('Ayþe', 'Kaya'),
    ('Fatma', 'Özdemir'),
    ('Mehmet', 'Aslan'),
    ('Zeynep', 'Yýldýz');


	INSERT INTO Talebeler (Ad, Soyad, DanismanId)
VALUES
    ('Sibel', 'Özkan', NULL),
    ('Esra', 'Atalay', NULL),
    ('Serdar', 'Karadeniz', NULL),
    ('Aysel', 'Tekin', NULL),
    ('Mustafa', 'Yýlmaz', NULL),
	('Hüseyin', 'Öztürk', NULL),
    ('Eren', 'Kocaman', NULL),
    ('Ziynet', 'Çelik', NULL),
    ('Hasan', 'Can', NULL),
    ('Su', 'Yiðit', NULL);

	UPDATE Talebeler
SET DanismanID = (SELECT TOP 1 DanismanID FROM Danismanlar ORDER BY RAND())
WHERE DanismanId IN (SELECT TOP 5 DanismanId FROM Talebeler ORDER BY RAND());
	
SELECT Talebeler.Ad  [Talebe Adý], Talebeler.Soyad [Talebe Soyadý], Danismanlar.Ad [Danýþman Adý], Danismanlar.Soyad [Danýþman Soyadý]
FROM Talebeler
INNER JOIN Danismanlar ON Talebeler.DanismanId = Danismanlar.Id;

--2.
SELECT Products.ProductName, Products.UnitPrice
FROM [Order Details]
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE [Order Details].Discount <> 0;

--3.
SELECT Suppliers.City, Suppliers.CompanyName, Products.ProductName
FROM Suppliers
INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID
WHERE Suppliers.City = 'New Orleans'
ORDER BY Products.ProductName DESC;

--4.
SELECT Territories.TerritoryDescription, Region.RegionDescription
FROM Territories 
INNER JOIN Region ON Territories.RegionID = Region.RegionID
WHERE Territories.TerritoryDescription = 'Boston';

--5.
SELECT Products.ProductName, Categories.CategoryName, Products.Discontinued
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE (Categories.CategoryName = 'Seafood' OR Categories.Description = 'Cheeses') AND Products.Discontinued = 1;

--6.

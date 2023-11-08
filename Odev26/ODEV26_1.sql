USE master;
GO

DROP DATABASE IF EXISTS OkulBilgiSistemiDb;
GO

CREATE DATABASE  OkulBilgiSistemiDb;
GO

CREATE TABLE Danismanlar
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Ad NVARCHAR(50) NOT NULL,
	SOYAD NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Talebeler
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Ad NVARCHAR(50) NOT NULL,
	SOYAD NVARCHAR(50) NOT NULL,
	DanismanId INT FOREIGN KEY REFERENCES Danismanlar(Id) NULL
);
GO


INSERT INTO Danismanlar(Ad,Soyad) VALUES 
(N'Ali',N'Kara'),(N'Emine',N'Çalışkan'),(N'Mete',N'Ceylan'), (N'Halil','Kahraman');
INSERT INTO Talebeler(Ad,Soyad,DanismanId) VALUES 
(N'Ece',N'Gezdir',1),(N'Emre',N'Ay',2),(N'Ada',N'Al',1), (N'Eylül',N'Gece',1),(N'Oya',N'Say',1),(N'Ela',N'Kara',3),(N'Alper',N'Yıldız',2), (N'Eylül',N'Gece',4),(N'Seda',N'Güler',2), (N'Seher',N'Akbaş',3);
 
--SELECT * FROM  Talebeler INNER JOIN Danismanlar ON Danismanlar.Id=Talebeler.DanismanId

SELECT
    Talebeler.Ad      AS TalebeAd,
    Talebeler.Soyad   AS TalebeSoyad,
    Danismanlar.Ad    AS DanismanAd,
    Danismanlar.Soyad AS DanismanSoyad
FROM Talebeler
INNER JOIN Danismanlar ON Talebeler.DanismanId = Danismanlar.Id;

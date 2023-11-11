CREATE DATABASE OkulDb;
GO

USE OkulDb;
GO

CREATE TABLE Ogretmenler
(
	Id INT PRIMARY KEY IDENTITY,
	OgretmenAd NVARCHAR(50) NOT NULL,
	OgretmenSoyad NVARCHAR(50) NOT NULL

)

CREATE TABLE Siniflar
(
	SinifId INT PRIMARY KEY IDENTITY,
	SinifAd NVARCHAR(10) UNIQUE NOT NULL,
	OgretmenId INT FOREIGN KEY REFERENCES Ogretmenler(Id)
)

INSERT INTO Ogretmenler VALUES('Salih','Akıncı'),('Burcu','Koç'),('Nazmi','Çavuş'),('Pelin','Akarsu'),('Remzi','Kaptan')
INSERT INTO Siniflar VALUES('1.Sınıf',1),('2.Sınıf',2),('3.Sınıf',3),('4.Sınıf',5),('5.Sınıf',5),('6.Sınıf',5),('7.Sınıf',NULL),('8.Sınıf',NULL),('9.Sınıf',NULL),('10.Sınıf',NULL)

-- Sınıfı olan öğretmenlerin ad,soyad,sınıfId ve sınıfad listesi
SELECT OgretmenAd, OgretmenSoyad, SinifId, SinifAd FROM Ogretmenler JOIN Siniflar ON Ogretmenler.Id = Siniflar.OgretmenId 

--Sınıfı olmayan öğretmenlerin ad ve soyad listesi
SELECT OgretmenAd,OgretmenSoyad FROM Ogretmenler LEFT JOIN Siniflar ON Ogretmenler.Id = Siniflar.OgretmenId  WHERE Siniflar.OgretmenId IS NULL

--Öğretmeni olmayan sınıfların Id’leri ve sinifadları listesi 
SELECT * FROM Ogretmenler RIGHT JOIN Siniflar ON Ogretmenler.Id = Siniflar.OgretmenId  WHERE Siniflar.OgretmenId IS NULL

-- GENEL liste: Ogretmen ad, ogretmen soyad,sınıfıd ve sınıfad. Değerler varsa yazmalı yoksa NULL yazmalı.
SELECT OgretmenAd, OgretmenSoyad, SinifId, SinifAd FROM Ogretmenler FULL  JOIN Siniflar ON Ogretmenler.Id = Siniflar.OgretmenId 
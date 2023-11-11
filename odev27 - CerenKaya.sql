
USE Odev27Db
GO

CREATE TABLE Ogretmenler(
OgretmenId INT PRIMARY KEY IDENTITY(1,1),
OgretmenAd NVARCHAR(50) NOT NULL,
OgretmenSoyad NVARCHAR(50) NOT NULL
);

CREATE TABLE Siniflar(
SinifId INT PRIMARY KEY IDENTITY(1,1),
SinifAd NVARCHAR(10) NOT NULL unique,
OgretmenId INT FOREIGN KEY REFERENCES Ogretmenler(OgretmenId)
);


INSERT INTO Ogretmenler (OgretmenAd,OgretmenSoyad)
VALUES ('Salih','Do�an'),('Burcu','Sar�kaya'),('Nazmi','��nar'),('Pelin','Akarsu'),('Remzi','�nci')

INSERT INTO Siniflar(SinifAd,OgretmenId)
VALUES ('A1',1 ),('A2', 2),('A3',3 ),('B1', 5),('B2', 5),('B3',5), ('C1',NULL ),('C2',NULL ),
('C3', NULL),('C4', NULL)

--1;S�n�f� olan ��retmenlerin ad,soyad,s�n�fId ve s�n�fad listesi.

SELECT  o.OgretmenAd,o.OgretmenSoyad,s.SinifId,s.SinifAd
FROM Ogretmenler o JOIN Siniflar s ON s.OgretmenId = o.OgretmenId

--2; S�n�f� olmayan ��retmenlerin ad ve soyad listesi 

SELECT CONCAT(o.OgretmenAd,' , ',o.OgretmenSoyad) AS [��retmen Ad Soyad]
FROM Ogretmenler o LEFT JOIN Siniflar s ON s.OgretmenId = o.OgretmenId
WHERE s.SinifId IS NULL


--3; � ��retmeni olmayan s�n�flar�n Id�leri ve sinifadlar� listesi 

SELECT S.SinifId,S.SinifAd
FROM Ogretmenler o RIGHT JOIN Siniflar s ON s.OgretmenId = o.OgretmenId
WHERE O.OgretmenId IS NULL

--4;
--� GENEL liste: Ogretmen ad, ogretmen soyad,s�n�f�d ve s�n�fad.
--De�erler varsa yazmal� yoksa NULL yazmal�.

SELECT CONCAT(o.OgretmenAd,' , ',o.OgretmenSoyad) AS [��retmen Ad Soyad],
S.SinifId,s.SinifAd
FROM Ogretmenler o FULL JOIN Siniflar s ON s.OgretmenId = o.OgretmenId

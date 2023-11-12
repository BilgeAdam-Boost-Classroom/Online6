--
USE master;

CREATE DATABASE OkulDB;
GO

USE OkulDB;
GO

--
CREATE TABLE Ogretmenler (
    OgretmenId INT PRIMARY KEY IDENTITY,
    OgretmenAd NVARCHAR(50) NOT NULL,
    OgretmenSoyAd NVARCHAR(50) NOT NULL
);

--
CREATE TABLE Siniflar (
    SinifId INT PRIMARY KEY IDENTITY,
    SinifAd NVARCHAR(10) NOT NULL UNIQUE,
    OgretmenId INT NULL,
    FOREIGN KEY (OgretmenId) REFERENCES Ogretmenler(OgretmenId)
);

-- 
INSERT INTO Ogretmenler (OgretmenAd, OgretmenSoyAd) VALUES
('Salih', 'Yılmaz'),
('Burcu', 'Güzel'),
('Nazmi', 'Acar'),
('Pelin', 'Kaya'),
('Remzi', 'Aydın');

-- 
INSERT INTO Siniflar (SinifAd, OgretmenId) VALUES
('S1', 1),
('S2', 2),
('S3', 3),
('S4', 4),
('S5', 4),
('S6', 4),
('S7', NULL),
('S8', NULL),
('S9', NULL),
('S10', NULL);


SELECT 
    O.OgretmenAd,
    O.OgretmenSoyAd,
    S.SinifId,
    S.SinifAd
FROM 
    Ogretmenler O
JOIN 
    Siniflar S ON O.OgretmenId = S.OgretmenId;


	SELECT 
    O.OgretmenAd,
    O.OgretmenSoyAd
FROM 
    Ogretmenler O
LEFT JOIN 
    Siniflar S ON O.OgretmenId = S.OgretmenId
WHERE 
    S.SinifId IS NULL;
	



-- Veritabanını oluştur
CREATE DATABASE OkulDB;
USE OkulDB;

-- Ogretmenler tablosunu oluştur
CREATE TABLE Ogretmenler (
    OgretmenId INT PRIMARY KEY IDENTITY,
    OgretmenAd NVARCHAR(50) NOT NULL,
    OgretmenSoyAd NVARCHAR(50) NOT NULL
);

-- Siniflar tablosunu oluştur
CREATE TABLE Siniflar (
    SinifId INT PRIMARY KEY IDENTITY,
    SinifAd NVARCHAR(10) NOT NULL UNIQUE,
    OgretmenId INT NULL,
    FOREIGN KEY (OgretmenId) REFERENCES Ogretmenler(OgretmenId)
);

-- Öğretmen verilerini ekle
INSERT INTO Ogretmenler (OgretmenAd, OgretmenSoyAd) VALUES
('Salih', 'Yılmaz'),
('Burcu', 'Güzel'),
('Nazmi', 'Acar'),
('Pelin', 'Kaya'),
('Remzi', 'Aydın');

-- Sınıf verilerini ekle
INSERT INTO Siniflar (SinifAd, OgretmenId) VALUES
('S1', 1),
('S2', 2),
('S3', 3),
('S4', 4),
('S5', 4),
('S6', 4),
('S7', NULL),
('S8', NULL),
('S9', NULL),
('S10', NULL);


--Sınıfı olan öğretmenlerin ad, soyad, sınıfId ve sınıf adı listesi:

SELECT 
    O.OgretmenAd,
    O.OgretmenSoyAd,
    S.SinifId,
    S.SinifAd
FROM 
    Ogretmenler O
JOIN 
    Siniflar S ON O.OgretmenId = S.OgretmenId;


--Sınıfı olmayan öğretmenlerin ad ve soyad listesi:
SELECT 
    O.OgretmenAd,
    O.OgretmenSoyAd
FROM 
    Ogretmenler O
LEFT JOIN 
    Siniflar S ON O.OgretmenId = S.OgretmenId
WHERE 
    S.SinifId IS NULL;

--Öğretmeni olmayan sınıfların Id'leri ve sınıf adları listesi:

	SELECT 
    SinifId,
    SinifAd
FROM 
    Siniflar
WHERE 
    OgretmenId IS NULL;
	--GENEL liste: Ogretmen ad, ogretmen soyad, sınıfId ve sınıf ad. Değerler varsa yazmalı, yoksa NULL yazmalı:

	SELECT 
    O.OgretmenAd,
    O.OgretmenSoyAd,
    S.SinifId,
    S.SinifAd
FROM 
    Ogretmenler O
LEFT JOIN 
    Siniflar S ON O.OgretmenId = S.OgretmenId;

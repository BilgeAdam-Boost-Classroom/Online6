--CREATE TABLE Ogretmenler
--(
--	OgretmenId INT PRIMARY KEY IDENTITY (1,1),
--	OgretmenAd nvarchar(50) not null ,
--	OgretmenSoyAd  nvarchar(50) not null
--);
--GO

--CREATE TABLE Siniflar
--(
--	SinifId INT PRIMARY KEY IDENTITY,
--	SinifAd  nvarchar(10) unique NOT NULL,
--	OgretmenId int foreign key REFERENCES Ogretmenler(OgretmenId) 
--);
--GO

---- Ogretmenler tablosuna öğretmen ekleyelim
--INSERT INTO Ogretmenler (OgretmenAd, OgretmenSoyAd) VALUES
--('Salih', 'Yılmaz'),
--('Burcu', 'Erdem'),
--('Nazmi', 'Arslan'),
--('Pelin', 'Öztürk'),
--('Remzi', 'Gökalp');

--INSERT INTO Siniflar (SinifAd, OgretmenId) VALUES
--(N'SİNİF 1', 1 ),
--(N'SİNİF 2', 2 ),
--(N'SİNİF 3', 3 ),
--(N'SİNİF 4', 5 ),
--(N'SİNİF 5', 5 ),
--(N'SİNİF 6', 5 ),
--(N'SİNİF 7', NULL ),
--(N'SİNİF 8', NULL ),
--(N'SİNİF 9', NULL ),
--(N'SİNİF 10', NULL )


--Bu bilgilere göre aşağıdaki sonuçları getiren sorguları yazınız. 
--SORU 1• Sınıfı olan öğretmenlerin ad,soyad,sınıfId ve sınıfad listesi
--SORU 2• Sınıfı olmayan öğretmenlerin ad ve soyad listesi 
--SORU 3• Öğretmeni olmayan sınıfların Id’leri ve sinifadları listesi 
--SORU 4• GENEL liste: Ogretmen ad, ogretmen soyad,sınıfıd ve sınıfad. Değerler varsa yazmalı yoksa NULL yazmalı.


--SORU 1:
SELECT * FROM Ogretmenler O
LEFT JOIN Siniflar S ON O.OgretmenId = S.OgretmenId
WHERE S.SinifId IS NOT NULL


--SORU 2:
SELECT O.OgretmenAd, O.OgretmenSoyAd FROM Ogretmenler O
LEFT JOIN Siniflar S ON O.OgretmenId = S.OgretmenId
WHERE S.SinifId IS  NULL


--SORU 3:
SELECT S.OgretmenId, S.SinifAd FROM Siniflar S
LEFT JOIN Ogretmenler O  ON O.OgretmenId = S.OgretmenId
WHERE S.OgretmenId IS  NULL


--SORU 4:
SELECT * FROM Ogretmenler O
LEFT JOIN Siniflar S ON O.OgretmenId = S.OgretmenId
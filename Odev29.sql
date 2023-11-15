--1) AyHesapla adýnda, aldýðý DATETIME cinsinden deðerin üzerinden kaç ay geçtiðini hesaplayan 
--ve bu deðeri geri döndüren bir fonksiyon oluþturunuz. Ardýndan, Employees tablosundaki her 
--bir çalýþan için iþe baþlama tarihinden bu yana kaç ay geçtiðini, bu fonksiyonu kullanarak 
--listeleyiniz.
CREATE FUNCTION AyHesapla(@Ay DATETIME)
RETURNS INT
AS 
	BEGIN
	RETURN DATEDIFF(MONTH, @Ay, GETDATE())
	END
SELECT FirstName, LastName, dbo.AyHesapla(HireDate) AS GecenAy FROM Employees

--2)Ýki tarih arasýndaki farký alan ve bu farký gün olarak döndüren bir fonksiyon yazýnýz. Daha 
--sonra orders tablosundaki her satýr için OrderDate ile ShippedDate arasýndaki gün sayýsýný, bu 
--fonksiyonu kullanarak listeleyiniz
CREATE FUNCTION GunHesapla(@Tarih1 DATETIME,@Tarih2 DATETIME)
RETURNS INT
AS
	BEGIN
	RETURN DATEDIFF(DAY, @Tarih1, @Tarih2)
	END

SELECT dbo.GunHesapla(OrderDate, ShippedDate) FROM Orders

--3)Employees tablosundan firstname’leri, dýþarýdan gönderilen harf ile baþlayanlarý tablo olarak 
--döndüren fonksiyon yazýnýz. Ardýndan bu fonksiyonu kullanarak A ile baþlayanlarý listeleyiniz.CREATE FUNCTION IlkHarfArama(@Harf NVARCHAR(1))RETURNS TABLEAS	RETURN SELECT * FROM Employees WHERE FirstName LIKE @Harf + '%'SELECT * FROM dbo.IlkHarfArama('A')--4) Order details tablosundaki unitprice’larýn kýrpýlmýþ ortalamasýný hesaplayan stored procedure 
--yazýnýz. (Kýrpýlmýþ ortalama: En küçük ve en büyük deðerler dahil edilmeden hesaplanan 
--aritmetik ortalamadýr. Bölerken, (terim sayýsý-2) ’ye bölünmelidir.)CREATE PROC spKirpilmisOrtalamaAS	BEGIN	DECLARE @MaxFiyat INT;	DECLARE @MinFiyat INT;				SELECT AVG(UnitPrice) AS Kirpilmis_Ortalama FROM [Order Details] WHERE UnitPrice < (SELECT MAX(UnitPrice) FROM [Order Details])  AND UnitPrice >(SELECT MIN(UnitPrice) FROM [Order Details])	ENDspKirpilmisOrtalama
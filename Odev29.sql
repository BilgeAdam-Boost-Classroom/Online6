--1) AyHesapla ad�nda, ald��� DATETIME cinsinden de�erin �zerinden ka� ay ge�ti�ini hesaplayan 
--ve bu de�eri geri d�nd�ren bir fonksiyon olu�turunuz. Ard�ndan, Employees tablosundaki her 
--bir �al��an i�in i�e ba�lama tarihinden bu yana ka� ay ge�ti�ini, bu fonksiyonu kullanarak 
--listeleyiniz.
CREATE FUNCTION AyHesapla(@Ay DATETIME)
RETURNS INT
AS 
	BEGIN
	RETURN DATEDIFF(MONTH, @Ay, GETDATE())
	END
SELECT FirstName, LastName, dbo.AyHesapla(HireDate) AS GecenAy FROM Employees

--2)�ki tarih aras�ndaki fark� alan ve bu fark� g�n olarak d�nd�ren bir fonksiyon yaz�n�z. Daha 
--sonra orders tablosundaki her sat�r i�in OrderDate ile ShippedDate aras�ndaki g�n say�s�n�, bu 
--fonksiyonu kullanarak listeleyiniz
CREATE FUNCTION GunHesapla(@Tarih1 DATETIME,@Tarih2 DATETIME)
RETURNS INT
AS
	BEGIN
	RETURN DATEDIFF(DAY, @Tarih1, @Tarih2)
	END

SELECT dbo.GunHesapla(OrderDate, ShippedDate) FROM Orders

--3)Employees tablosundan firstname�leri, d��ar�dan g�nderilen harf ile ba�layanlar� tablo olarak 
--d�nd�ren fonksiyon yaz�n�z. Ard�ndan bu fonksiyonu kullanarak A ile ba�layanlar� listeleyiniz.
CREATE FUNCTION IlkHarfArama(@Harf NVARCHAR(1))
RETURNS TABLE
AS
	RETURN SELECT * FROM Employees WHERE FirstName LIKE @Harf + '%'

SELECT * FROM dbo.IlkHarfArama('A')

--4) Order details tablosundaki unitprice�lar�n k�rp�lm�� ortalamas�n� hesaplayan stored procedure 
--yaz�n�z. (K�rp�lm�� ortalama: En k���k ve en b�y�k de�erler dahil edilmeden hesaplanan 
--aritmetik ortalamad�r. B�lerken, (terim say�s�-2) �ye b�l�nmelidir.)

CREATE PROC spKirpilmisOrtalama
AS
	BEGIN

	
		SELECT AVG(UnitPrice) AS Kirpilmis_Ortalama FROM [Order Details] WHERE UnitPrice < (SELECT MAX(UnitPrice) FROM [Order Details])  AND UnitPrice >(SELECT MIN(UnitPrice) FROM [Order Details])
	END
spKirpilmisOrtalama

SELECT COUNT(*) FROM [Order Details]
select SUM(UnitPrice) from [Order Details] ORDER BY 1 DESC
PRINT (56500-4238)/(2155-27)
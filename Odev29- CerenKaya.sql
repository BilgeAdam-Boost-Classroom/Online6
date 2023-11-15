
--1)AyHesapla ad�nda, ald��� DATETIME cinsinden de�erin �zerinden ka� ay ge�ti�inihesaplayan
--ve bu de�eri geri d�nd�ren bir fonksiyonolu�turunuz. Ard�ndan, Employees tablosundaki her bir
--�al��an i�in i�e ba�lama tarihinden bu yana ka� ay ge�ti�ini, bu fonksiyonukullanarak listeleyiniz.

--1.yol 
ALTER FUNCTION AyHesapla(@tarih DATETIME)
	RETURNS INT
AS
BEGIN 
	DECLARE @GecenSure INT
	SET @GecenSure=DATEDIFF(MONTH,@tarih,GETDATE())
	RETURN @GecenSure	
END
GO

--2.yol
ALTER FUNCTION AyHesapla2(@tarih DATETIME)
	RETURNS INT 
AS 
BEGIN
	RETURN DATEDIFF(MONTH,@tarih,GETDATE())
END
GO


--Employees tablosundaki her bir �al��an i�in i�e ba�lama tarihinden bu yana ka� ay ge�ti�ini hesaplay�n�z.
--1.YOL
SELECT
	CONCAT(Employees.FirstName,' ',Employees.LastName) AS [Ad Soyad],
	dbo.AyHesapla(HireDate) AS [��e Ba�lad���ndan Beri Ge�en G�n Say�s�]
FROM
	Employees;

--2.YOL
SELECT 
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS [Ad Soyad],
    dbo.AyHesapla2(Employees.HireDate) AS [��e Ba�lad���ndan Beri Ge�en G�n Say�s�]
FROM 
    Employees;


--2)�ki tarih aras�ndaki fark� alan ve bu fark� g�n olarakd�nd�ren bir fonksiyonyaz�n�z.
--Daha sonra orderstablosundaki her sat�r i�inOrderDateile ShippedDatearas�ndaki g�n say�s�n�,
--bu fonksiyonukullanarak listeleyiniz.

--1.FONSK�YON
CREATE FUNCTION IkiTarihArasindaGecenSure(@ilkTarih DATETIME,@SonTarih DATETIME)
	RETURNS INT
AS
BEGIN
	DECLARE @GecenSure INT
	SET @GecenSure= DATEDIFF(DAY,@ilkTarih,@SonTarih) 
	RETURN @GecenSure

END
GO

--2.FONKS�YON
CREATE FUNCTION IkiTarihArasindaGecenSure2(@ilkTarih DATETIME,@SonTarih DATETIME)
	RETURNS INT
AS
BEGIN	
	RETURN DATEDIFF(DAY,@ilkTarih,@SonTarih) 
END
GO


--orderstablosundaki her sat�r i�inOrderDateile ShippedDatearas�ndaki g�n say�s�:

SELECT Orders.OrderID, dbo.IkiTarihArasindaGecenSure(OrderDate,ShippedDate) AS [Kargolanma S�resi] FROM Orders

SELECT Orders.OrderID, dbo.IkiTarihArasindaGecenSure2(OrderDate,ShippedDate) AS [Kargolanma S�resi] FROM Orders




--3)Employees tablosundan firstname�leri, d��ar�dan g�nderilen
--harf ile ba�layanlar� tablo olarak d�nd�ren fonksiyon yaz�n�z. Ard�ndan bu fonksiyonu kullanarak
--A ile ba�layanlar� listeleyiniz.

ALTER FUNCTION IstenenHarf�leBasla(@harf char(1))
	RETURNS TABLE
AS
RETURN ( SELECT FirstName FROM Employees WHERE FirstName LIKE @harf+'%'); 


SELECT FirstName FROM dbo.IstenenHarf�leBasla('a');




--4)Order details tablosundaki unitprice�lar�n k�rp�lm�� ortalamas�n�
--hesaplayan stored procedure yaz�n�z. (K�rp�lm�� ortalama: En k���k ve en b�y�k de�erlerdahil edilmeden
--hesaplanan aritmetik ortalamad�r. B�lerken,(terim say�s�-2) �ye b�l�nmelidir.)

ALTER PROCEDURE spKirpilmisOrtalama
AS
BEGIN
	
    DECLARE @kirpilmisOrt FLOAT
	DECLARE @�lkDeger FLOAT = (SELECT TOP 1 UnitPrice FROM [Order Details] ORDER BY UnitPrice DESC);
	DECLARE @SonDeger FLOAT = (SELECT TOP 1 UnitPrice FROM [Order Details] ORDER BY UnitPrice ASC);
    SET @kirpilmisOrt = (SELECT ((SUM(UnitPrice)-(@�lkDeger+@SonDeger)) / (COUNT(1) - 2)) AS KIRPILMIS FROM [Order Details]);
    SELECT @kirpilmisOrt


END

EXECUTE spKirpilmisOrtalama;



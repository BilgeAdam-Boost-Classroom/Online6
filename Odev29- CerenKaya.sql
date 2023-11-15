
--1)AyHesapla adýnda, aldýðý DATETIME cinsinden deðerin üzerinden kaç ay geçtiðinihesaplayan
--ve bu deðeri geri döndüren bir fonksiyonoluþturunuz. Ardýndan, Employees tablosundaki her bir
--çalýþan için iþe baþlama tarihinden bu yana kaç ay geçtiðini, bu fonksiyonukullanarak listeleyiniz.

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


--Employees tablosundaki her bir çalýþan için iþe baþlama tarihinden bu yana kaç ay geçtiðini hesaplayýnýz.
--1.YOL
SELECT
	CONCAT(Employees.FirstName,' ',Employees.LastName) AS [Ad Soyad],
	dbo.AyHesapla(HireDate) AS [Ýþe Baþladýðýndan Beri Geçen Gün Sayýsý]
FROM
	Employees;

--2.YOL
SELECT 
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS [Ad Soyad],
    dbo.AyHesapla2(Employees.HireDate) AS [Ýþe Baþladýðýndan Beri Geçen Gün Sayýsý]
FROM 
    Employees;


--2)Ýki tarih arasýndaki farký alan ve bu farký gün olarakdöndüren bir fonksiyonyazýnýz.
--Daha sonra orderstablosundaki her satýr içinOrderDateile ShippedDatearasýndaki gün sayýsýný,
--bu fonksiyonukullanarak listeleyiniz.

--1.FONSKÝYON
CREATE FUNCTION IkiTarihArasindaGecenSure(@ilkTarih DATETIME,@SonTarih DATETIME)
	RETURNS INT
AS
BEGIN
	DECLARE @GecenSure INT
	SET @GecenSure= DATEDIFF(DAY,@ilkTarih,@SonTarih) 
	RETURN @GecenSure

END
GO

--2.FONKSÝYON
CREATE FUNCTION IkiTarihArasindaGecenSure2(@ilkTarih DATETIME,@SonTarih DATETIME)
	RETURNS INT
AS
BEGIN	
	RETURN DATEDIFF(DAY,@ilkTarih,@SonTarih) 
END
GO


--orderstablosundaki her satýr içinOrderDateile ShippedDatearasýndaki gün sayýsý:

SELECT Orders.OrderID, dbo.IkiTarihArasindaGecenSure(OrderDate,ShippedDate) AS [Kargolanma Süresi] FROM Orders

SELECT Orders.OrderID, dbo.IkiTarihArasindaGecenSure2(OrderDate,ShippedDate) AS [Kargolanma Süresi] FROM Orders




--3)Employees tablosundan firstname’leri, dýþarýdan gönderilen
--harf ile baþlayanlarý tablo olarak döndüren fonksiyon yazýnýz. Ardýndan bu fonksiyonu kullanarak
--A ile baþlayanlarý listeleyiniz.

ALTER FUNCTION IstenenHarfÝleBasla(@harf char(1))
	RETURNS TABLE
AS
RETURN ( SELECT FirstName FROM Employees WHERE FirstName LIKE @harf+'%'); 


SELECT FirstName FROM dbo.IstenenHarfÝleBasla('a');




--4)Order details tablosundaki unitprice’larýn kýrpýlmýþ ortalamasýný
--hesaplayan stored procedure yazýnýz. (Kýrpýlmýþ ortalama: En küçük ve en büyük deðerlerdahil edilmeden
--hesaplanan aritmetik ortalamadýr. Bölerken,(terim sayýsý-2) ’ye bölünmelidir.)

ALTER PROCEDURE spKirpilmisOrtalama
AS
BEGIN
	
    DECLARE @kirpilmisOrt FLOAT
	DECLARE @ÝlkDeger FLOAT = (SELECT TOP 1 UnitPrice FROM [Order Details] ORDER BY UnitPrice DESC);
	DECLARE @SonDeger FLOAT = (SELECT TOP 1 UnitPrice FROM [Order Details] ORDER BY UnitPrice ASC);
    SET @kirpilmisOrt = (SELECT ((SUM(UnitPrice)-(@ÝlkDeger+@SonDeger)) / (COUNT(1) - 2)) AS KIRPILMIS FROM [Order Details]);
    SELECT @kirpilmisOrt


END

EXECUTE spKirpilmisOrtalama;



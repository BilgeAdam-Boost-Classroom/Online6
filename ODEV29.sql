--1 ) AyHesapla adında, aldığı DATETIME cinsinden değerin üzerinden
--kaç ay geçtiğinihesaplayan ve bu değeri geri döndüren bir fonksiyonoluşturunuz. Ardından, Employees tablosundaki 
--her bir çalışan için işe başlama tarihinden bu yana kaç ay geçtiğini, bu fonksiyonukullanarak listeleyiniz.
GO
CREATE FUNCTION dbo.AyHesapla (@baslangic_tarihi DATETIME)
RETURNS INT
AS
BEGIN
    DECLARE @su_an DATETIME = GETDATE()
    DECLARE @gecen_gun INT

    -- İki tarih arasındaki gün farkını hesapla
    SET @gecen_gun = DATEDIFF(DAY, @baslangic_tarihi, @su_an)

    -- Günleri aya çevirip döndür
    RETURN @gecen_gun / 30
END;
GO
-- Employees tablosundaki her bir çalışan için işe başlama tarihinden bu yana geçen ay sayısını listeleyen sorgu
SELECT
    EmployeeID,
    FirstName,
    LastName,
    dbo.AyHesapla(HireDate) [Kaç ay geçti]
FROM
    Employees;
--2İki tarih arasındaki farkı alan ve bu farkı gün olarakdöndüren bir fonksiyonyazınız. Daha sonra orderstablosundaki her satır içinOrderDateile 
--ShippedDatearasındaki gün sayısını, bu fonksiyonukullanarak listeleyiniz.
GO
CREATE FUNCTION dbo.GunFarkiHesapla (@tarih1 DATETIME, @tarih2 DATETIME)
RETURNS INT
AS
BEGIN
    DECLARE @gun_farki INT

    -- İki tarih arasındaki gün farkını hesapla
    SET @gun_farki = DATEDIFF(DAY, @tarih1, @tarih2)

    RETURN @gun_farki
END;
GO
-- Orders tablosundaki her satır için OrderDate ile ShippedDate arasındaki gün sayısını listeleyen sorgu
SELECT
    OrderID,
    OrderDate,
    ShippedDate,
    dbo.GunFarkiHesapla(OrderDate, ShippedDate) AS GunFarki
FROM
    Orders;


	--3Employees tablosundan firstname’leri, dışarıdan gönderilen harf ile başlayanları tablo olarak döndüren fonksiyon yazınız. 
	--Ardından bu fonksiyonu kullanarak A ile başlayanları listeleyiniz.
	GO
	CREATE FUNCTION dbo.BaslayanIsimleriGetir (@bas_harf CHAR(1))
RETURNS TABLE
AS
RETURN
(
    SELECT
        EmployeeID,
        FirstName,
        LastName
    FROM
        Employees
    WHERE
        FirstName LIKE @bas_harf + '%'
);
GO

SELECT * FROM dbo.BaslayanIsimleriGetir('A');

--44)Order details tablosundaki unitprice’ların kırpılmış ortalamasını hesaplayan stored procedure yazınız. 
--(Kırpılmış ortalama: En küçük ve en büyük değerlerdahil edilmeden hesaplanan aritmetik ortalamadır. 
--Bölerken,(terim sayısı-2) ’ye bölünmelidir.)
GO
CREATE PROCEDURE dbo.KirpilmisOrtalamaHesapla
AS
BEGIN
    DECLARE @MinUnitPrice MONEY
    DECLARE @MaxUnitPrice MONEY
    DECLARE @TerimSayisi INT
    DECLARE @KirpilmisOrtalama MONEY

    -- En küçük ve en büyük UnitPrice'ları bul
    SELECT @MinUnitPrice = MIN(UnitPrice), @MaxUnitPrice = MAX(UnitPrice)
    FROM OrderDetails;

    -- Terim sayısını bul
    SELECT @TerimSayisi = COUNT(UnitPrice)
    FROM OrderDetails;

    -- Kırpılmış ortalama hesapla
    SELECT @KirpilmisOrtalama = AVG(UnitPrice)
    FROM OrderDetails
    WHERE UnitPrice > @MinUnitPrice AND UnitPrice < @MaxUnitPrice;

    -- Sonucu yazdır
    PRINT 'Kırpılmış Ortalama: ' + CAST(@KirpilmisOrtalama AS NVARCHAR(50));
END;
GO

EXEC dbo.KirpilmisOrtalamaHesapla;
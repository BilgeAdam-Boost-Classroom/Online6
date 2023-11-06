--Employees tablosunda adýnýn ilk harfi alfabetik alarak A ile I aralýðýnda olmayanlarýn bütün bilgilerini getiren sorguyu yazýnýz
SELECT * FROM Employees WHERE FirstName NOT LIKE '[A-I]%';

--Employees tablosunda adýnýn ikinci harfi A ve T olmayanlarý bütün bilgilerini getiren sorguyu yazýnýz.
SELECT * FROM Employees WHERE SUBSTRING(FirstName, 2, 1) NOT LIKE 'a' AND SUBSTRING(FirstName, 2, 1) NOT LIKE 't';

--Employees tablosunda adýnýn ilk iki harfi LA, ÝN, AA veya AN olanlarýn bütün bilgilerini getiren sorguyu yazýnýz.
SELECT * FROM Employees WHERE (FirstName LIKE 'La%' OR FirstName LIKE 'In%' OR FirstName LIKE 'Aa%' OR FirstName LIKE 'An%');

--Employees tablosunda adýnýn içinde _ (alt çizgi) geçenlerin sadece adlarýný getiren sorguyu yazýnýz
SELECT FirstName FROM Employees WHERE FirstName LIKE '%_%';

--Customers tablosundan,CustomerID'sinin 2, harfi A ve 4. harfi T olanlarýn CustomerID'ye göre AZALAN halinin ilk %10'Iuk kýsmýný getir.
--(Kolon olarak sadece CustomerID'lerini getiriniz)


--Employees tablosundan ad, soyad ve doðum tarihinin saati (Saat adýyla) bilgilerini saate göre azalan olarak sýralayýp getir
SELECT FirstName, LastName, DATEPART(HOUR, BirthDate) AS Saat FROM Employees ORDER BY Saat DESC;

--Employees tablosundan ad, soyad ve doðum tarihinin dakika (Dakika adýyla) bilgilerini dakikaya göre azalan olarak sýralayýp getir
SELECT FirstName, LastName, DATEPART(MINUTE, BirthDate) AS Dakika FROM Employees ORDER BY Dakika DESC;

--Kendi doðum gününüze göre kaç gündür hayatta olduðunuzu hesaplayan sorguyu yazýnýz.
SELECT DATEDIFF(DAY, '1995-10-03', GETDATE()) AS HayattakiSure;

--Orders tablosundan OrderDate'nin ayý temmuz olanlarý veya ShippedDate'inin günü 15'ten büyük olanlarýn SADECE OrderDate ve 
--ShippedDate'lerini getir
SELECT OrderDate, ShippedDate FROM Orders WHERE MONTH(OrderDate) = 7 OR DAY(ShippedDate) > 15;

--SatrancDb adýnda bir veritabaný oluþturunuz. Oluþturduðunuz veritabanýna Taslar adýnda bir tablo oluþturunuz. 
--Tablonun kolonlarý þu þekilde olmalýdýr:
 --ID int,primary key  nvarchar(50), not null
 --Ad nvarchar(50) not null,
--Hareket 	nvarchar(MAX),not null
--Renk 	bit, not null
--Daha sonra bu tabloya piyon, kale,at, fil, vezir ve þah isimlerinde veriler giriniz.(Hareketlerini ve renklerini istediðiniz gibi doldurunuz.)

CREATE DATABASE SatrancDb;
USE SatrancDb;
CREATE TABLE Taslar(
 ID INT PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Hareket NVARCHAR(MAX) NOT NULL,
    Renk BIT NOT NULL
);
INSERT INTO Taslar (ID, Ad, Hareket, Renk) VALUES
(1, 'Piyon', 'Ýleri git, çaprazda yeme', 0),
(2, 'Kale', 'Ýleri, geri, yanlara git', 0),
(3, 'Fil', 'Çapraz git', 0),
(4, 'At', 'L þeklinde git', 0),
(5, 'Vezir', 'Her yöne git', 0),
(6, 'Þah', 'Her yöne git, ama sadece bir kare', 0);







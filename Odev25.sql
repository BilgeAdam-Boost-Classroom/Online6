
--GÖREV 1: EMPLOYEES TABLOSUNDA ADININ İLK HARFİ ALFABETİK OLARAK A İLE I ARALIĞINDA OLMAYANLARIN BÜTÜN BİLGİLERİNİ GETİREN SORGU 
SELECT * FROM Employees WHERE FirstName NOT LIKE '[A-I]%'

--GÖREV 2: EMPLOYEES TABLOSUNDA ADININ İKİNCİ HARFİ A VE T OLMAYANLARI BÜTÜN BİLGİLERİNİ GETİREN SORGU
SELECT * FROM Employees WHERE FirstName NOT LIKE '_A%' AND FirstName NOT LIKE '_T%'

--GÖREV 3:EMPLOYEES TABLOSUNDA ADININ İLK İKİ HARFİ LA,LN,AA VEYA AN OLANLARIN BÜTÜN BİLGİLERİNİ GETİREN SORGUYU YAZINIZ.
SELECT * FROM Employees WHERE  LEFT(FirstName, 2) IN ('LA', 'LN', 'AA', 'AN')

--GÖREV 4:EMPLOYEES TABLOSUNDA ADININ İÇİNDE _(ALT ÇİZGİ) GEÇENLERİN SADECE ADLARINI GETİREN SORGUYU YAZINIZ.
SELECT FirstName FROM Employees WHERE CHARINDEX('_', FirstName) > 0

--GÖREV 5:CUSTOMER TABLOSUNDAN, CUSTOMERID'SİNİN 2. HARFİ A VE 4. HARFİ T OLANLARIN CUSTOMERID'YE GÖRE AZALAN HALİNİN İLK %10 LUK KISMINI GETİREN SORGUYU YAZINIZ.(KOLON OLARAK SADECE CUSTOMERID'LERİNİ GETİRİNİZ.)
SELECT TOP 10 PERCENT  CustomerID   FROM Customers WHERE CustomerID LIKE '_A_T%' ORDER BY CustomerID DESC 

--GÖREV 6:EMPLOYEES TABLOSUNDAN AD,SOYAD VE DOĞUM TARİHİNİN SAATİ(SAAT ADIYLA) BİLGİLERİNİ SAATE GÖRE AZALAN OLARAK SIRALAYIP GETİREN SORGUYU YAZINIZ
SELECT FirstName ,LastName ,DATEPART(HOUR, BirthDate) AS Saat FROM Employees ORDER BY Saat DESC;

--
--GÖREV 7:EMPLOYEES TABLOSUNDAN AD,SOYAD VE DOĞUM TARİHİNİN DAKİKA(DAKİKA ADIYLA) BİLGİLERİNİ SAATE GÖRE AZALAN OLARAK SIRALAYIP GETİREN SORGUYU YAZINIZ
SELECT FirstName ,LastName ,DATEPART(MINUTE, BirthDate) AS Dakika FROM Employees ORDER BY Dakika DESC;

--GÖREV 8: KENDİ DOĞUM GÜNÜNÜZE GÖRE KAÇ GÜNDÜR HAYATTA OLDUĞUNUZU HESAPLAYIN.
SELECT DATEDIFF(DAY, '1995-06-06', GETDATE()) AS YasadigimGun

--GÖREV 9:ORDERS TABLOSUNDAN ORDERDATE'NİN AYI TEMMUZ OLANLARI VEYA SHİPPEDDATE'İNİN GÜNÜ 15'TEN BÜYÜK OLANLARIN SADECE ORDERDATE VE SHİPPEDDATE'LERİNİ GETİREN SQL SORGUSUNU YAZINIZ.
SELECT OrderDate,ShippedDate FROM Orders WHERE MONTH(OrderDate) = 7 OR DAY(ShippedDate) > 15

--GÖREV 10:SatrancDb adında bir veritabanı oluşturunuz. Oluşturduğunuz veritabanına Taslar adında tablo oluşturunuz. Tablonun kolonları şu şekilde olmalıdır:
--ID => int, primary key
--Ad => nvarchar(50), not null
--Hareket => nvarchar(max), not null
--Renk => bit, not null
--Daha sonra bu tabloya piyon,kale,at,fil,vezir ve şah isimlerinde veriler giriniz(Hareketlerini ve renklerini istediğiniz gibi doldurunuz.)
CREATE DATABASE SatrancDb;
GO

USE SatrancDb;

CREATE TABLE Taslar
(
	ID int primary key,
	Ad nvarchar(50) not null,
	Hareket nvarchar(max) not null,
	Renk bit not null
)
INSERT INTO Taslar(ID,Ad,Hareket,Renk)
VALUES (1,'Piyon','Düz tek kare gider',0),
		(2,'Kale','Düz gider',1),
		(3,'At','L gider',1),
		(4,'Fil','Çapraz gider',0),
		(5,'Vezir','Her yöne gider',0),
		(6,'Şah','Tek kare her yöne gider','1');

SELECT * FROM Taslar


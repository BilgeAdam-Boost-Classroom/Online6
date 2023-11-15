
--1) Employees tablosunda adýnýn ilk harfi alfabetik alarak A ile I aralýðýnda olmayanlarýn bütün
--bilgilerini getiren sorguyu yazýnýz.

SELECT *
FROM Employees
WHERE LEFT(FirstName, 1) NOT BETWEEN 'A' AND 'I'
   --2.YOL
SELECT * 
FROM Employees
WHERE SUBSTRING(FirstName,1,1) NOT BETWEEN 'A'AND'I';




--2Employees tablosunda adýnýn ikinci harfi A ve T olmayanlarý bütün bilgilerini getiren sorguyu yazýnýz.

SELECT *
FROM Employees
WHERE SUBSTRING(FirstName, 2, 1) NOT IN ('A', 'T');




--3)Employees tablosunda adýnýn ilk iki harfi LA, LN, AA veya AN olanlarm bütün bilgilerini getiren sorguyu yazýnýz.

SELECT* 
FROM Employees
WHERE LEFT(FirstName,2) IN('LA','LN','AA','AN');






--4)Employees tablosunda adýnýn içinde _ (alt çizgi) geçenlerin sadece adlarým getiren sorguyu yazýnýz,

SELECT FirstName
FROM Employees
WHERE FirstName LIKE '%_%';






--5)Customers tablosundan, CustomerID'sinin 2. harfi A ve 4. harfi T olanlarýn CustomerlD’ye göre
--AZALAN halinin ilk %10'Iuk kýsmýný getiren sorguyu yazýnýz. (Kolon olarak sadece CustomerID’lerini getiriniz).

SELECT TOP 10 PERCENT CustomerID FROM Customers
WHERE LEFT(CustomerID,2)='A' AND LEFT(CustomerID,4)='T' 
ORDER BY CustomerID DESC;
--2.YOL
SELECT TOP 10 PERCENT CustomerID
FROM Customers
WHERE SUBSTRING(CustomerID, 2, 1) = 'A' AND SUBSTRING(CustomerID, 4, 1) = 'T'
ORDER BY CustomerID DESC;






--6)Employees tablosundan ad, soyad ve doðum tarihinin saati (Saat adýyla) bilgilerini saate göre azalan
--olarak sýralayýp getiren sorguyu yazýnýz.

SELECT FirstName,LastName,FORMAT(BirthDate, 'HH:mm:ss') AS Saat
FROM Employees
ORDER BY Saat DESC;






--7)Employeeþ tablosundan ad, soyad ve doðum tarihinin dakika (Dakika adýyla)
--bilgilerini dakikaya göre azalan olarak sýralayýp getiren sorguyu yazýnýz,
SELECT FirstName,LastName, FORMAT(BirthDate,'mm') AS [DOÐUM DAKÝKASI]
FROM Employees
ORDER BY [DOÐUM DAKÝKASI] DESC;

--2.YOL
SELECT FirstName, LastName, 
       DATEPART(MINUTE, BirthDate) AS Dakika
FROM Employees
ORDER BY DATEPART(MINUTE, BirthDate) DESC;






--8)Kendi doðum gününüze göre kaç gündür hayatta olduðunuzu hesaplayan sorguyu yazýnýz,

DECLARE @DogumTarihi DATE = '1997-01-16'; -- Doðum tarihinizi buraya girin
DECLARE @Bugun DATE = GETDATE();
SELECT DATEDIFF(DAY, @DogumTarihi, @Bugun) AS GunSayisi;

--2.YOL
SELECT DATEDIFF(DAY, '1997-01-16', GETDATE()) AS GunSayisi;


 --3.yol
INSERT INTO Employees(FirstName,LastName,BirthDate)
VALUES('CEREN','KAYA','1997-01-16');
SELECT FirstName,LastName, DATEDIFF(DAY, BirthDate, GETDATE()) AS GunSayisi
FROM Employees
WHERE FirstName='CEREN';






--9)Orders tablosundan OrderDate'nin ayý temmuz olanlarý veya ShippedDate'inin günü
--15'ten büyük olanlarýn SADECE OrderDate ve ShippedDate'lerini getiren SQL sorgusunu yazýnýz.

SELECT OrderDate, ShippedDate
FROM Orders
WHERE MONTH(OrderDate) = 7 OR DAY(ShippedDate) > 15;






--10)10)	SatrancDb adýnda bir veritabaný oluþturunuz. Oluþturduðunuz veritabanýna Taslar adýnda bir tablo oluþturunuz. 
--Tablonun kolonlarý þu þekilde olmalýdýr:
-- ID => int,primary key 
-- Ad => nvarchar(50), not null
--Hareket =>nvarchar(MAX),not null
--Renk =>bit, not null
--Daha sonra bu tabloya  ve þah isimlerinde veriler giriniz. (Hareketlerini ve renklerini istediðiniz gibi doldurunuz.)


CREATE DATABASE SatrancDb;
USE SatrancDb;

CREATE TABLE Taslar (
    ID INT PRIMARY KEY,
	Ad nvarchar(50) NOT NULL,
    Hareket NVARCHAR(MAX) NOT NULL,
    Renk BIT NOT NULL
);
INSERT INTO Taslar (ID, Ad, Hareket, Renk) VALUES (1, 'Piyon', 'Öne doðru 1 adým', 1);
INSERT INTO Taslar (ID, Ad, Hareket, Renk) VALUES (2, 'Kale', 'Dikey veya yatay hareket', 0);
INSERT INTO Taslar( ID, Ad, Hareket,Renk) VALUES(3,'Fil','çarpraz þekilde hareket',1);
INSERT INTO Taslar( ID,Ad, Hareket, Renk) VALUES(4,'At','L þeklinde hareket',1);
INSERT INTO Taslar (ID, Ad, Hareket, Renk) VALUES (5, 'Vezir', 'Dikey, yatay veya çapraz hareket', 0);
INSERT INTO Taslar (ID, Ad, Hareket, Renk) VALUES (6, 'Þah', 'Her yöne 1 adým', 0);


SELECT * FROM Taslar;

DELETE FROM Taslar
DROP TABLE Taslar

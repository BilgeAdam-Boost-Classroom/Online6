
--1) Employees tablosunda ad�n�n ilk harfi alfabetik alarak A ile I aral���nda olmayanlar�n b�t�n
--bilgilerini getiren sorguyu yaz�n�z.

SELECT *
FROM Employees
WHERE LEFT(FirstName, 1) NOT BETWEEN 'A' AND 'I'
   --2.YOL
SELECT * 
FROM Employees
WHERE SUBSTRING(FirstName,1,1) NOT BETWEEN 'A'AND'I';




--2Employees tablosunda ad�n�n ikinci harfi A ve T olmayanlar� b�t�n bilgilerini getiren sorguyu yaz�n�z.

SELECT *
FROM Employees
WHERE SUBSTRING(FirstName, 2, 1) NOT IN ('A', 'T');




--3)Employees tablosunda ad�n�n ilk iki harfi LA, LN, AA veya AN olanlarm b�t�n bilgilerini getiren sorguyu yaz�n�z.

SELECT* 
FROM Employees
WHERE LEFT(FirstName,2) IN('LA','LN','AA','AN');






--4)Employees tablosunda ad�n�n i�inde _ (alt �izgi) ge�enlerin sadece adlar�m getiren sorguyu yaz�n�z,

SELECT FirstName
FROM Employees
WHERE FirstName LIKE '%_%';






--5)Customers tablosundan, CustomerID'sinin 2. harfi A ve 4. harfi T olanlar�n CustomerlD�ye g�re
--AZALAN halinin ilk %10'Iuk k�sm�n� getiren sorguyu yaz�n�z. (Kolon olarak sadece CustomerID�lerini getiriniz).

SELECT TOP 10 PERCENT CustomerID FROM Customers
WHERE LEFT(CustomerID,2)='A' AND LEFT(CustomerID,4)='T' 
ORDER BY CustomerID DESC;
--2.YOL
SELECT TOP 10 PERCENT CustomerID
FROM Customers
WHERE SUBSTRING(CustomerID, 2, 1) = 'A' AND SUBSTRING(CustomerID, 4, 1) = 'T'
ORDER BY CustomerID DESC;






--6)Employees tablosundan ad, soyad ve do�um tarihinin saati (Saat ad�yla) bilgilerini saate g�re azalan
--olarak s�ralay�p getiren sorguyu yaz�n�z.

SELECT FirstName,LastName,FORMAT(BirthDate, 'HH:mm:ss') AS Saat
FROM Employees
ORDER BY Saat DESC;






--7)Employee� tablosundan ad, soyad ve do�um tarihinin dakika (Dakika ad�yla)
--bilgilerini dakikaya g�re azalan olarak s�ralay�p getiren sorguyu yaz�n�z,
SELECT FirstName,LastName, FORMAT(BirthDate,'mm') AS [DO�UM DAK�KASI]
FROM Employees
ORDER BY [DO�UM DAK�KASI] DESC;

--2.YOL
SELECT FirstName, LastName, 
       DATEPART(MINUTE, BirthDate) AS Dakika
FROM Employees
ORDER BY DATEPART(MINUTE, BirthDate) DESC;






--8)Kendi do�um g�n�n�ze g�re ka� g�nd�r hayatta oldu�unuzu hesaplayan sorguyu yaz�n�z,

DECLARE @DogumTarihi DATE = '1997-01-16'; -- Do�um tarihinizi buraya girin
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






--9)Orders tablosundan OrderDate'nin ay� temmuz olanlar� veya ShippedDate'inin g�n�
--15'ten b�y�k olanlar�n SADECE OrderDate ve ShippedDate'lerini getiren SQL sorgusunu yaz�n�z.

SELECT OrderDate, ShippedDate
FROM Orders
WHERE MONTH(OrderDate) = 7 OR DAY(ShippedDate) > 15;






--10)10)	SatrancDb ad�nda bir veritaban� olu�turunuz. Olu�turdu�unuz veritaban�na Taslar ad�nda bir tablo olu�turunuz. 
--Tablonun kolonlar� �u �ekilde olmal�d�r:
-- ID => int,primary key 
-- Ad => nvarchar(50), not null
--Hareket =>nvarchar(MAX),not null
--Renk =>bit, not null
--Daha sonra bu tabloya  ve �ah isimlerinde veriler giriniz. (Hareketlerini ve renklerini istedi�iniz gibi doldurunuz.)


CREATE DATABASE SatrancDb;
USE SatrancDb;

CREATE TABLE Taslar (
    ID INT PRIMARY KEY,
	Ad nvarchar(50) NOT NULL,
    Hareket NVARCHAR(MAX) NOT NULL,
    Renk BIT NOT NULL
);
INSERT INTO Taslar (ID, Ad, Hareket, Renk) VALUES (1, 'Piyon', '�ne do�ru 1 ad�m', 1);
INSERT INTO Taslar (ID, Ad, Hareket, Renk) VALUES (2, 'Kale', 'Dikey veya yatay hareket', 0);
INSERT INTO Taslar( ID, Ad, Hareket,Renk) VALUES(3,'Fil','�arpraz �ekilde hareket',1);
INSERT INTO Taslar( ID,Ad, Hareket, Renk) VALUES(4,'At','L �eklinde hareket',1);
INSERT INTO Taslar (ID, Ad, Hareket, Renk) VALUES (5, 'Vezir', 'Dikey, yatay veya �apraz hareket', 0);
INSERT INTO Taslar (ID, Ad, Hareket, Renk) VALUES (6, '�ah', 'Her y�ne 1 ad�m', 0);


SELECT * FROM Taslar;

DELETE FROM Taslar
DROP TABLE Taslar

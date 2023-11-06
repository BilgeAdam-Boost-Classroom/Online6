--Employees tablosunda ad�n�n ilk harfi alfabetik alarak A ile I aral���nda olmayanlar�n b�t�n bilgilerini getiren sorguyu yaz�n�z
SELECT * FROM Employees WHERE FirstName NOT LIKE '[A-I]%';

--Employees tablosunda ad�n�n ikinci harfi A ve T olmayanlar� b�t�n bilgilerini getiren sorguyu yaz�n�z.
SELECT * FROM Employees WHERE SUBSTRING(FirstName, 2, 1) NOT LIKE 'a' AND SUBSTRING(FirstName, 2, 1) NOT LIKE 't';

--Employees tablosunda ad�n�n ilk iki harfi LA, �N, AA veya AN olanlar�n b�t�n bilgilerini getiren sorguyu yaz�n�z.
SELECT * FROM Employees WHERE (FirstName LIKE 'La%' OR FirstName LIKE 'In%' OR FirstName LIKE 'Aa%' OR FirstName LIKE 'An%');

--Employees tablosunda ad�n�n i�inde _ (alt �izgi) ge�enlerin sadece adlar�n� getiren sorguyu yaz�n�z
SELECT FirstName FROM Employees WHERE FirstName LIKE '%_%';

--Customers tablosundan,CustomerID'sinin 2, harfi A ve 4. harfi T olanlar�n CustomerID'ye g�re AZALAN halinin ilk %10'Iuk k�sm�n� getir.
--(Kolon olarak sadece CustomerID'lerini getiriniz)


--Employees tablosundan ad, soyad ve do�um tarihinin saati (Saat ad�yla) bilgilerini saate g�re azalan olarak s�ralay�p getir
SELECT FirstName, LastName, DATEPART(HOUR, BirthDate) AS Saat FROM Employees ORDER BY Saat DESC;

--Employees tablosundan ad, soyad ve do�um tarihinin dakika (Dakika ad�yla) bilgilerini dakikaya g�re azalan olarak s�ralay�p getir
SELECT FirstName, LastName, DATEPART(MINUTE, BirthDate) AS Dakika FROM Employees ORDER BY Dakika DESC;

--Kendi do�um g�n�n�ze g�re ka� g�nd�r hayatta oldu�unuzu hesaplayan sorguyu yaz�n�z.
SELECT DATEDIFF(DAY, '1995-10-03', GETDATE()) AS HayattakiSure;

--Orders tablosundan OrderDate'nin ay� temmuz olanlar� veya ShippedDate'inin g�n� 15'ten b�y�k olanlar�n SADECE OrderDate ve 
--ShippedDate'lerini getir
SELECT OrderDate, ShippedDate FROM Orders WHERE MONTH(OrderDate) = 7 OR DAY(ShippedDate) > 15;

--SatrancDb ad�nda bir veritaban� olu�turunuz. Olu�turdu�unuz veritaban�na Taslar ad�nda bir tablo olu�turunuz. 
--Tablonun kolonlar� �u �ekilde olmal�d�r:
 --ID int,primary key  nvarchar(50), not null
 --Ad nvarchar(50) not null,
--Hareket 	nvarchar(MAX),not null
--Renk 	bit, not null
--Daha sonra bu tabloya piyon, kale,at, fil, vezir ve �ah isimlerinde veriler giriniz.(Hareketlerini ve renklerini istedi�iniz gibi doldurunuz.)

CREATE DATABASE SatrancDb;
USE SatrancDb;
CREATE TABLE Taslar(
 ID INT PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Hareket NVARCHAR(MAX) NOT NULL,
    Renk BIT NOT NULL
);
INSERT INTO Taslar (ID, Ad, Hareket, Renk) VALUES
(1, 'Piyon', '�leri git, �aprazda yeme', 0),
(2, 'Kale', '�leri, geri, yanlara git', 0),
(3, 'Fil', '�apraz git', 0),
(4, 'At', 'L �eklinde git', 0),
(5, 'Vezir', 'Her y�ne git', 0),
(6, '�ah', 'Her y�ne git, ama sadece bir kare', 0);







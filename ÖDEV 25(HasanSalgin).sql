--soru 1:
SELECT * FROM employees
WHERE FirstName NOT LIKE '[A-I]%';

--soru 2:
SELECT * FROM employees
WHERE FirstName NOT LIKE '_A%' AND FirstName NOT LIKE '_T%'

--SORU 3:
SELECT * FROM employees
WHERE FirstName LIKE 'LA%' OR FirstName LIKE 'LN%' OR FirstName LIKE 'AA%' OR FirstName LIKE 'AN%'
-- YA DA ŞU ŞEKİLDE YAZARIM:
--SELECT *
--FROM employees
--WHERE LEFT(FirstName, 2) IN ('LA', 'LN', 'AA', 'AN');

--SORU 4:
SELECT FirstName FROM employees
WHERE FirstName LIKE '%_%'
--Alt çizgi karakteri, SQL'de özel bir karakterdir ve herhangi bir tek karakteri temsil eder , BU YÜZDEN BÜTÜN İSİMLER GELİR

--SORU 5:
SELECT TOP 10 PERCENT CustomerID
FROM Customers
WHERE CustomerID LIKE '_A%' AND CustomerID LIKE '___T%'
ORDER BY CustomerID DESC;
-----------
--SELECT  CustomerID FROM Customers
--WHERE CustomerID LIKE '_A%' and CustomerID LIKE '___T%' ORDER BY CustomerID DESC

--SORU 6:
SELECT FirstName, LastName, BirthDate AS Saat FROM employees
ORDER BY Saat DESC;

--soru 7:
SELECT FirstName, LastName, BirthDate AS Dakika FROM employees
ORDER BY Dakika DESC;

--soru 8:
SELECT DATEDIFF(DAY, '1996-06-12', GETDATE()) AS GecenGunSayisi;

--soru 9:
SELECT OrderDate, ShippedDate FROM Orders 
WHERE MONTH(OrderDate) = 7 OR DAY(ShippedDate) > 15;

----SORU 10
CREATE DATABASE SatrancDb
GO

use SatrancDb
GO
--TABLO OLUŞTUTRMA
create table Taslar(
	TasID int primary key,
	Ad nvarchar(50) not null,
	Hareket  nvarchar(max) not null,
	Renk bit not null
);

-- BİRKAÇ ÖRNEK EKLEME
INSERT INTO Taslar (TasID, Ad, Hareket, Renk) VALUES (1, 'piyon', 'bir ileri veya başlangıçta iki ileri', 1);
INSERT INTO Taslar (TasID, Ad, Hareket, Renk) VALUES (2, 'kale', 'sadece düz veya yana sınırsız', 0);
INSERT INTO Taslar (TasID, Ad, Hareket, Renk) VALUES (3, 'şah', 'her yöne bir birim', 1);



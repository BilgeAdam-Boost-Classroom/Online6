--Employees tablosundan Country’si UK veya Turkey olanları getiren SQL sorgusunu yazınız.
SELECT * FROM Employees WHERE Country = 'UK' OR Country = 'Turkey';
--
--Employees tablosundan Region’ı NULL olanlarıgetirenSQL sorgusunu yazınız.
SELECT * FROM Employees WHERE Region IS NULL;

--Employees tablosundan LastName’i Fuller veya King olanları getiren SQL sorgusunu yazınız.
SELECT * FROM Employees WHERE LastName = 'Fuller' OR LastName = 'King';

--Products tablosundan UnitPrice’ı 15’ten büyük olup Discontinued’u 0 olanları veya UnitsOnOrder'ı 70’ten küçük olup
--ReorderLevel’ı 5’ten büyük olanları getirenSQL sorgusunu yazınız.
SELECT * FROM Products WHERE (UnitPrice > 15 AND Discontinued = 0) OR (UnitsOnOrder < 70 AND ReorderLevel > 5);

--Products tablosundan CategoryID’si 1,4 veya 8 olanların SADECE ProductName’ini ve CategoryID’sini getiren SQL sorgusunu yazınız.
SELECT ProductName, CategoryID FROM Products WHERE CategoryID IN (1, 4, 8);

--Suppliers tablosundan Fax’ı NULL olan veya City’si New Orleans olanların SADECE Address’ini getiren SQL sorgusunu yazınız.
SELECT Address FROM Suppliers WHERE Fax IS NULL OR City = 'New Orleans';

--Region tablosundaki bütün verileri getirenSQL sorgusunu yazınız.(Kolon isimleri şu şekilde görüntülenmelidir: 
--RegionID➔BolgeNo, RegionDescription➔BolgeTanimi)
SELECT RegionID "BolgeNo", RegionDescription "BolgeTanimi" FROM Region;

--OrderDetails tablosundan Discount’u sıfırdan faklı olanları veya Quantity’si 10 ile 40 arasında olanları (sınırlar dahil)
--getiren SQL sorgusunu yazınız.

SELECT * FROM [Order Details] WHERE Discount > 0 OR (Quantity >= 10 AND Quantity <= 40);

--Employees tablosundaki bütün Title’ları TEKRARSIZ BİR ŞEKİLDE ve Gorev ismiyle getiren SQL sorgusunu yazınız.
SELECT DISTINCT Title Gorev FROM Employees;
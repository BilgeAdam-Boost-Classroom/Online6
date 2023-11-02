USE NORTHWND;
GO
--Görev 1:  Employees tablosundan Country’si UK veya Turkey olanları getiren SQL sorgusunu yazınız.
SELECT * FROM Employees WHERE Country IN ('UK','TURKEY')

--GÖREV 2 :Employees tablosundan Region’ı NULL olanları getiren SQL sorgusunu yazınız.
SELECT * FROM Employees WHERE Region IS NULL

--GÖREV 3 : Employees tablosundan LastName’i Fuller veya King olanları getiren SQL sorgusunu yazınız.
SELECT * FROM Employees WHERE LastName IN ('Fuller','King')

--GÖREV 4:Products tablosundan UnitPrice’ı 15’ten büyük olup Discontinued’u 0 olanları veya
--UnitsOnOrder ‘ ı 70’ten küçük olup ReorderLevel’ı 5’ten büyük olanları getiren SQL sorgusunu 
--yazınız.
SELECT * FROM Products WHERE UnitPrice > 15 AND Discontinued = 0 OR UnitsOnOrder > 70 AND ReorderLevel > 5

--GÖREV 5:Products tablosundan CategoryID’si 1,4 veya 8 olanların SADECE ProductName’ini ve 
--CategoryID’sini getiren SQL sorgusunu yazınız
SELECT ProductName,CategoryID FROM Products WHERE CategoryID IN (1,4,8)

--GÖREV 6:Suppliers tablosundan Fax’ı NULL olan veya City’si New Orleans olanların SADECE Address’ini 
--getiren SQL sorgusunu yazını
SELECT [Address] FROM Suppliers WHERE Fax IS NULL OR City='New Orleans'

--GÖREV 7:Region tablosundaki bütün verileri getiren SQL sorgusunu yazınız. (Kolon isimleri şu şekilde 
--görüntülenmelidir: RegionID ➔ BolgeNo, RegionDescription➔BolgeTanimi)
SELECT RegionID as BolgeNo, RegionDescription as BolgeTanimi FROM Region 

--GÖREV 8: OrderDetails tablosundan Discount’u sıfırdan faklı olanları veya Quantity’si 10 ile 40 arasında 
--olanları (sınırlar dahil) getiren SQL sorgusunu yazınız
SELECT * FROM [Order Details] WHERE Discount != 0 AND Quantity BETWEEN 10 AND 40 ORDER BY Quantity

--GÖREV 9:Employees tablosundaki bütün Title’ları TEKRARSIZ BİR ŞEKİLDE ve Gorev ismiyle getiren SQL 
--sorgusunu yazınız
SELECT DISTINCT Title AS Gorev FROM Employees

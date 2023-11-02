--1)Employees tablosundan Country’si UK veya Turkey olanları getirenSQL sorgusunu yazınız.
SELECT * FROM Employees
WHERE Country=N'UK' OR Country=N'Turkey';

--2)Employees tablosundan Region’ı NULL olanlarıgetirenSQL sorgusunu yazınız.
SELECT * FROM Employees
WHERE Region is null
--3)Employees tablosundan LastName’i Fuller veya King olanları getirenSQL sorgusunu yazınız.
SELECT *FROM Employees
WHERE LastName=N'Fuller' OR LastName=N'King'
--4)Products tablosundan UnitPrice’ı 15’ten büyük olup Discontinued’u 0 olanlarıveyaUnitsOnOrder ‘ı 70’ten küçük olup ReorderLevel’ı 5’ten büyük olanları getirenSQL sorgusunu yazınız.
SELECT *FROM Products
WHERE (UnitPrice>15 AND Discontinued=0) OR (UnitsOnOrder<70 AND ReorderLevel>5) 
--5)Products tablosundan CategoryID’si 1,4veya 8 olanların SADECE ProductName’ini ve CategoryID’sini getirenSQL sorgusunu yazınız.
SELECT ProductName, CategoryID FROM Products
WHERE CategoryID=1 OR CategoryID=4 OR CategoryID=8
--6)Suppliers tablosundan Fax’ı NULL olan veya City’si New Orleans olanlarınSADECEAddress’ini getirenSQL sorgusunu yazınız.
SELECT Address FROM Suppliers
Where Fax is NULL OR City=N'New Orleands' 
--7)Region tablosundaki bütün verileri getirenSQL sorgusunu yazınız.(Kolon isimleri şu şekilde görüntülenmelidir: RegionID➔BolgeNo, RegionDescription➔BolgeTanimi)
SELECT RegionID [BolgeNo],RegionDescription [BolgeTanimi] FROM Region
--8)OrderDetails tablosundan Discount’u sıfırdan faklı olanları veya Quantity’si 10 ile 40 arasında olanları (sınırlar dahil)getirenSQL sorgusunu yazınız.
SELECT * FROM [Order Details]
WHERE Discount <>0 OR Quantity BETWEEN 10 AND 40
--9)Employees tablosundaki bütün Title’ları TEKRARSIZ BİR ŞEKİLDE ve Gorev ismiyle getirenSQL sorgusunu yazınız.
SELECT DISTINCT Title  FROM Employees

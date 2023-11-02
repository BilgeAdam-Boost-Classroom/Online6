--1)Employees tablosundan Country’si UK veya Turkey olanları getirenSQL sorgusunu yazınız.
--2)Employees tablosundan Region’ı NULL olanlarıgetirenSQL sorgusunu yazınız.
--3)Employees tablosundan LastName’i Fuller veya King olanları getirenSQL sorgusunu yazınız.
--4)Products tablosundan UnitPrice’ı 15’ten büyük olup Discontinued’u 0 olanlarıveyaUnitsOnOrder ‘ı 70’ten küçük olup ReorderLevel’ı 5’ten büyük olanları getirenSQL sorgusunu yazınız.
--5)Products tablosundan CategoryID’si 1,4veya 8 olanların SADECE ProductName’ini ve CategoryID’sini getirenSQL sorgusunu yazınız.
--6)Suppliers tablosundan Fax’ı NULL olan veya City’si New Orleans olanlarınSADECEAddress’ini getirenSQL sorgusunu yazınız.
--7)Region tablosundaki bütün verileri getirenSQL sorgusunu yazınız.(Kolon isimleri şu şekilde görüntülenmelidir: RegionID➔BolgeNo, RegionDescription➔BolgeTanimi)
--8)OrderDetails tablosundan Discount’u sıfırdan faklı olanları veya Quantity’si 10 ile 40 arasında olanları (sınırlar dahil)getirenSQL sorgusunu yazınız.
--9)Employees tablosundaki bütün Title’ları TEKRARSIZ BİR ŞEKİLDE ve Gorev ismiyle getirenSQL sorgusunu yazınız.

--soru 1:
select * from Employees where Country='UK' or Country='turkey';

--soru 2:
select * from Employees where Region IS null

--soru 3:
SELECT *FROM Employees WHERE LastName = 'Fuller' OR LastName = 'King';

--soru 4:
select * from Products where (UnitPrice > 15 and Discontinued=0) or (UnitsOnOrder < 70 and ReorderLevel > 5)

--soru 5:
select ProductName,CategoryID from Products WHERE CategoryID IN (1, 4, 8);

--soru 6:
select Address,Fax,City from Suppliers where Fax IS NULL OR City='NEW ORLEANS'

--soru 7:
select RegionID as BolgeNo, RegionDescription as BolgeTanimi from Region

--soru 8:
select * from [Order Details] where Discount <> 0 or Quantity between 10 and 40;

--soru 9:
select distinct Title as Gorev from Employees;
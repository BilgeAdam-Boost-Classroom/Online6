--1.SORGU: Dan��man� olan talebelerin ad,soyad, dan��man ad ve dan��man soyad olmak �zere inner join sorgusu ile getiriniz.

SELECT CONCAT(Danismanlar.Ad,' ',Danismanlar.Soyad) AS [Dan��man Ad], CONCAT(Talebeler.Ad,' ',Talebeler.Soyad) AS [��renci Ad�] FROM Talebeler
INNER JOIN Danismanlar ON Danismanlar.Id=Talebeler.DanismanId



 --2.SORGU : Order Details tablosu ile Products tablosunu inner join yaparak dicount'u s�f�rdan farkl� olanlar�n
 --ProductName ve UnitPrice kolonlar�n� getiriniz.

USE NORTHWND
GO

SELECT Products.ProductName, [Order Details].UnitPrice AS [Order Unitprice], Products.UnitPrice AS [Products Unitprice]
FROM [Order Details] INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE [Order Details].Discount != 0;


--3.SORGU : Products tablosu ile Suppliers tablosunu inner join yaparak Supplier'�n �ehri (city) New Orleans olanlar�n,
--city, companyname ve productname'lerini, productname'e g�re azalan s�rada s�ralayarak getiriniz.

SELECT City,CompanyName,ProductName FROM Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Suppliers.City='NEW ORLEANS'
ORDER BY ProductName DESC;

--4. SORGU: TerritoryDescripttion'� Boston olan�n RegionDescription'�n�n bulunuz. (Inner join kullanarak)

SELECT RegionDescription FROM Territories INNER JOIN Region ON Territories.RegionID=Region.RegionID
WHERE TerritoryDescription='BOSTON'

--5.CategoryName'i Seafood VEYA Cheeses olan VE discontinued de�eri 1 olanlar� ProductName,CategoryName
--ve Discontinued de�erlerini inner join ile getiriniz. (product ve category)

SELECT ProductName ,CategoryName,Discontinued FROM Products INNER JOIN Categories c ON Products.CategoryID=c.CategoryID
WHERE (CategoryName='Seafood' OR Description like '%Cheeses%') AND Discontinued=1


--6)Employees tablosundaki ki�ilerin adlar�n�, soyadlar�n�, rapor verdikleri �al��an�n adlar�n� ve soyadlar�n� getiriniz. 
--(reports to kolonunu kullan�n�z). (Tabloyu kendisi ile inner join yap�n�z.)
SELECT e1.FirstName as Calisan�sim,e1.LastName as CalisanSoyisim,CONCAT(e2.FirstName,e2.LastName) AS [Rapor Verdi�i Y�netici]
FROM Employees e1
INNER JOIN Employees e2 ON e1.EmployeeID=e2.ReportsTo

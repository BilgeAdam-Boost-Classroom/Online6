54--1.SORGU: Danýþmaný olan talebelerin ad,soyad, danýþman ad ve danýþman soyad olmak üzere inner join sorgusu ile getiriniz.

SELECT CONCAT(Danismanlar.Ad,' ',Danismanlar.Soyad) AS [Danýþman Ad], CONCAT(Talebeler.Ad,' ',Talebeler.Soyad) AS [Öðrenci Adý] FROM Talebeler
INNER JOIN Danismanlar ON Danismanlar.Id=Talebeler.DanismanId

 --2.SORGU : Order Details tablosu ile Products tablosunu inner join yaparak dicount'u sýfýrdan farklý olanlarýn
 --ProductName ve UnitPrice kolonlarýný getiriniz.

USE NORTHWND
GO

SELECT Products.ProductName, [Order Details].UnitPrice AS [Order Unitprice], Products.UnitPrice AS [Products Unitprice]
FROM [Order Details] INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE [Order Details].Discount != 0;

--3.SORGU : Products tablosu ile Suppliers tablosunu inner join yaparak Supplier'ýn þehri (city) New Orleans olanlarýn,
--city, companyname ve productname'lerini, productname'e göre azalan sýrada sýralayarak getiriniz.

SELECT City,CompanyName,ProductName FROM Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Suppliers.City='NEW ORLEANS'
ORDER BY ProductName DESC;

--4. SORGU: TerritoryDescripttion'ý Boston olanýn RegionDescription'ýnýn bulunuz. (Inner join kullanarak)

SELECT RegionDescription FROM Territories INNER JOIN Region ON Territories.RegionID=Region.RegionID
WHERE TerritoryDescription='BOSTON'

--5.CategoryName'i Seafood VEYA Cheeses olan VE discontinued deðeri 1 olanlarý ProductName,CategoryName
--ve Discontinued deðerlerini inner join ile getiriniz. (product ve category)

SELECT ProductName ,CategoryName,Discontinued FROM Products INNER JOIN Categories c ON Products.CategoryID=c.CategoryID
WHERE (CategoryName='Seafood' OR Description='Cheeses') AND Discontinued=1;


--6)Employees tablosundaki kiþilerin adlarýný, soyadlarýný, rapor verdikleri çalýþanýn adlarýný ve soyadlarýný getiriniz. 
--(reports to kolonunu kullanýnýz). (Tabloyu kendisi ile inner join yapýnýz.)
SELECT e1.FirstName as CalisanÝsim,e1.LastName as CalisanSoyisim,CONCAT(e2.FirstName,e2.LastName) AS [Rapor Verdiði Yönetici]
FROM Employees e1
INNER JOIN Employees e2 ON e1.EmployeeID=e2.ReportsTo

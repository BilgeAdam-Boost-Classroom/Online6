--1)Order details tablosundan unitprice', ortalama unitprice'dan k���k olanlar�n productid ve unitprice kolonlar�n�,
--unitprice'a g�re azalan s�rada ve productid'leri tekrarlamayacak �ekilde getiren sorguyu yaz�n�z. (subquery kullanarak)

SELECT DISTINCT OD.ProductID, OD.UnitPrice FROM [Order Details] OD INNER JOIN Products ON Products.ProductID=OD.ProductID
WHERE OD.UnitPrice<( SELECT AVG(OD.UnitPrice) FROM [Order Details])
ORDER BY OD.UnitPrice DESC


--2)Region tablosu ile territories tablosunu inner join yaparak, territorydescription ve regiondescription
--kolonlar�n� getiren sorguyu yaz�n�z.

SELECT TerritoryDescription,RegionDescription FROM Region R INNER JOIN Territories T ON R.RegionID=T.RegionID



--3)Customers tablosundan postalcode de�erinin uzunlu�u 5 karakterden fazla olanlar� getiren sorguyu yaz�n�z.

SELECT *
FROM Customers C
WHERE LEN(C.PostalCode) > 5;


--4) Employees tablosundan employeeid'si; categories tablosundaki categoryname'i seafood olan�n categoryid'sine
--e�it olan�n; employeeid, firstname, lastname bilgilerini getiren sorguyu yaz�n�z. (subquery kullanarak)

SELECT 
	EmployeeID,FirstName,LastName
FROM 
	Employees 
WHERE
	EmployeeID = (SELECT CategoryID FROM Categories WHERE CategoryName='seafood')


--5)Products tablosu ile categories tablosunu inner join yaparak productname ve categoryname kolonlar�n�
--productname e g�re azalan s�rada getiren sorguyu yaz�n�z.

SELECT 
	ProductName,
	CategoryName
FROM Products 
INNER JOIN Categories
ON
	Products.CategoryID=Categories.CategoryID
ORDER BY
	ProductName DESC


--6) 5.sorunun sonucunu subquery kullanarak bulunuz.


	SELECT 
	ProductName,
	( SELECT CategoryName FROM Categories WHERE Categories.CategoryID=Products.CategoryID) AS CategoryName
FROM Products 
ORDER BY
	ProductName DESC



--7)Products tablosundan unitsinstock de�eri VE unitprice de�eri 50'den b�y�k olanlar�n productname,
--unitsinstock ve unitprice kolonlar�n� unitsinstock de�erine g�re artan s�rada getiren sorguyu yaz�n�z.

SELECT 
	ProductName,UnitsInStock,UnitPrice
FROM 
	Products
WHERE UnitsInStock>50 AND UnitPrice>50
ORDER BY UnitsInStock ASC


--8) 7. Sorunun sonucunu subquery kullanarak bulunuz.

SELECT 
	*
FROM (SELECT ProductName,UnitsInStock,UnitPrice FROM Products WHERE UnitsInStock>50 AND UnitPrice>50) AS BB
ORDER BY UnitsInStock ASC;



--9) Products, categories ve suppliers tablolar�n� inner join yaparak, product tablosundaki
--productname, categories tablosundaki categoryname ve suppliers tablosundaki companyname kolonlar�n� getiriniz.


SELECT 
	Products.ProductName,
	Categories.CategoryName,
	Suppliers.CompanyName
FROM Products
INNER JOIN Categories ON Products.CategoryID=Categories.CategoryID
INNER JOIN Suppliers ON Suppliers.SupplierID=Products.SupplierID




SELECT 
	*
FROM (SELECT Products.ProductName,Categories.CategoryName,Suppliers.CompanyName FROM Products INNER JOIN Categories ON Products.CategoryID=Categories.CategoryID
INNER JOIN Suppliers ON Suppliers.SupplierID=Products.SupplierID) AS CC

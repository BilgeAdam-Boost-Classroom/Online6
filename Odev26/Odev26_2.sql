
--2) Order Details tablosu ile Products tablosunu inner join yaparak dicount'u sıfırdan farklı olanların ProductName ve UnitPrice kolonlarını getiriniz.
SELECT  Products.ProductName[Product Name], Products.UnitPrice [Products Unit Price],[Order Details].UnitPrice [Order details unit price] FROM Products INNER JOIN [Order Details] ON [Order Details].ProductID=Products.ProductID Where Discount !=0

--3)Products tablosu ile Suppliers tablosunu inner join yaparak Supplier'ın şehri (city) New Orleans olanların, city, companyname ve productname'lerini, productname'e göre azalan sırada sıralayarak getiriniz.
SELECT ProductName,City,CompanyName FROM Products INNER JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID WHERE City=N'New Orleans' ORDER BY ProductName

--4)TerritoryDescripttion'ı Boston olanın RegionDescription'ının bulunuz. (Inner join kullanarak)

SELECT Region.RegionDescription FROM Region INNER JOIN Territories ON Territories.RegionID=Region.RegionID WHERE Territories.TerritoryDescription = 'Boston';

--5)CategoryName'i Seefood VEYA Cheeses olan VEYA  description'ı cheeses olanları ve discontinued değeri 1 olanları ProductName,CategoryName ve Discontinued değerlerini inner join ile getiriniz.
--YAPAMADIM
SELECT Products.ProductName, Categories.CategoryName, Products.Discontinued
FROM Products  
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE ( CategoryName = 'Seafood' OR CategoryName = 'Cheeses' ) OR (Categories.Description='cheeses'  AND Products.Discontinued = 1);

--6
SELECT Birinci.FirstName AS EmployeeFirstName, Birinci.LastName AS EmployeeLastName, İkinci.FirstName AS ManagerFirstName, İkinci.LastName AS ManagerLastName
FROM Employees Birinci
INNER JOIN Employees İkinci ON Birinci.ReportsTo = İkinci.EmployeeID;
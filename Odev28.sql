--Görev1 
SELECT ProductID, UnitPrice FROM [Order Details] WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM [Order Details]) ORDER BY 2 DESC

--GÖREV 2
SELECT TerritoryDescription, RegionDescription FROM Region JOIN Territories ON Region.RegionID = Territories.RegionID

--GÖREV 3
SELECT * FROM Customers WHERE  LEN(PostalCode) > 5

--GÖREV 4
SELECT EmployeeID, FirstName , LastName FROM Employees,Categories  WHERE Categories.CategoryID =Employees.EmployeeID  AND CategoryName = 'seafood'

--GÖREV 5
SELECT ProductName, CategoryName FROM Products JOIN Categories ON Products.CategoryID = Categories.CategoryID ORDER BY 1 DESC

--GÖREV 6
SELECT ProductName,(SELECT TOP 1 CategoryName FROM Categories WHERE Categories.CategoryID  = Products.CategoryID) FROM Products

--GÖREV 7
SELECT ProductName, UnitsInStock, UnitPrice FROM Products  WHERE UnitPrice > 50 AND UnitsInStock > 50

--GÖREV 8
SELECT ProductName, UnitPrice, UnitsInStock FROM Products WHERE EXISTS  (SELECT  * FROM Products WHERE UnitsInStock > 50) AND    EXISTS (SELECT * FROM Products WHERE UnitPrice > 50)

--GÖREV 9 
SELECT P.ProductName, C.CategoryName , S.CompanyName FROM Products P JOIN Categories C ON P.CategoryID = C.CategoryID JOIN Suppliers S ON S.SupplierID = P.SupplierID



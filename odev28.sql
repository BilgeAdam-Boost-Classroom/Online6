--1--
SELECT   ProductID,UnitPrice
FROM  [Order Details]
WHERE UnitPrice < (SELECT AVG(UnitPrice) FROM [Order Details])
GROUP BY  ProductID, UnitPrice
ORDER BY UnitPrice DESC, ProductID;
	--2--

SELECT 
    t.TerritoryDescription,
    r.RegionDescription
FROM 
    Territories t
INNER JOIN 
    Region r ON t.RegionID = r.RegionID;



--2.yol
    SELECT 
    TerritoryDescription,
    (SELECT RegionDescription FROM Region WHERE RegionID = t.RegionID) AS RegionDescription
FROM   Territories t;


--3
SELECT *
FROM Customers
WHERE LEN(PostalCode) > 5;
--2.yol
SELECT *
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE LEN(PostalCode) > 5);


--4
SELECT   E.EmployeeID, E.FirstName,E.LastName
FROM Employees E
INNER JOIN Categories EC ON E.EmployeeID = EC.CategoryID
INNER JOIN Categories C ON EC.CategoryID = C.CategoryID
WHERE C.CategoryName = 'Seafood';

--5
SELECT   P.ProductName,  C.CategoryName
FROM   Products P
INNER JOIN Categories C ON P.CategoryID = C.CategoryID
ORDER BY   P.ProductName DESC;

--6
	SELECT ProductName,
	(SELECT CategoryName FROM Categories WHERE Categories.CategoryID = Products.CategoryID) AS CategoryName
FROM Products
ORDER BY ProductName DESC;

	--7

SELECT ProductName, UnitsInStock, UnitPrice
FROM  Products
WHERE  UnitsInStock > 50 AND UnitPrice > 50
ORDER BY UnitsInStock ASC;

	--8
SELECT   ProductName, UnitsInStock, UnitPrice
FROM  Products
WHERE  UnitsInStock > 50 AND UnitPrice > 50 AND UnitsInStock =
	(
        SELECT TOP 1 UnitsInStock 
        FROM Products 
        WHERE UnitsInStock > 50 AND UnitPrice > 50
        ORDER BY UnitsInStock ASC
		)

		--9 
SELECT  P.ProductName, C.CategoryName AS Category
 FROM  Products P
INNER JOIN Categories C ON P.CategoryID = C.CategoryID
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID;



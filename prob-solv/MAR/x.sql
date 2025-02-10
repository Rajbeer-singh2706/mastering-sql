
SQL Interview Questions with Answers in data analyst interviews 🎯

-- #1. Find the products that have been ordered more than ten times.
-- Products (ProductID, ProductName), 
-- OrderItems (OrderID, ProductID, Quantity)

SELECT 
  p.ProductID, 
  p.ProductName 

FROM Products p JOIN OrderItems oi ON p.ProductID = oi.ProductID 
GROUP BY p.ProductID, p.ProductName HAVING SUM(oi.Quantity) > 10;

--# 2. Find the second highest salary of employees. 
-- Employees (EmployeeID, Name, Salary)
SELECT 
    MAX(Salary) AS SecondHighestSalary 
FROM Employees WHERE Salary < (SELECT MAX(Salary) FROM Employees);

--#3. Write a SQL query to find the average purchase amount for each customer. Assume you have two tables.
-- Customers (CustomerID, Name) 
-- Orders (OrderID, CustomerID, Amount).

SELECT 
        c.CustomerID, 
        c.Name, 
        AVG(o.Amount) AS AveragePurchase

 FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID 
 GROUP BY c.CustomerID, c.Name;

--# 4. Write a query to find the employee with the minimum salary in each department from a table 
-- Employees(EmployeelD, Name, DepartmentID, and Salary)

SELECT 
    e1.DepartmentID, e1.EmployeeID, e1.Name, e1.Salary

FROM Employees e1 WHERE Salary = (
        SELECT MIN(Salary) FROM Employees e2 WHERE e2.DepartmentID = e1.DepartmentID
);

-- #5. Write a SQL query to find all products that have never been sold. Assume you have a table 
-- Products (ProductID, ProductName) 
-- Sales (SaleID, ProductID, Quantity).
SELECT 
    p.ProductID, 
    p.ProductName

FROM Products p LEFT JOIN Sales s ON p.ProductID = s.ProductID 
WHERE s.ProductID IS NULL;

-- #6. Given a table ,  write a query to find the customer with the highest total order quantity.
-- Orders(OrderID, CustomerID, OrderDate), and a table 
-- OrderItems(OrderID, ItemID, Quantity)

SELECT 
    o.CustomerID, 
    SUM(oi.Quantity) AS TotalQuantity 
FROM Orders o JOIN OrderItems oi ON o.OrderID = oi.OrderID 
GROUP BY o.CustomerID ORDER BY TotalQuantity DESC LIMIT 1;

-- #7. Write a SQL query to find the earliest order date for each customer from a table Orders (OrderID, CustomerID, OrderDate).

SELECT 
  CustomerID, MIN(OrderDate) AS EarliestOrderDate 
FROM Orders GROUP BY CustomerID;

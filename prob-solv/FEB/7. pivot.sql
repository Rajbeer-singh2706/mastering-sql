-- Write a SQL query to pivot a table, turning rows into columns.
-- To pivot a table in SQL Server, you can use the `PIVOT` operator. This operator allows you to convert 
-- rows into columns, typically used for summarizing data.
-- Suppose you have a table named `Sales` with the following structure:

| SalesPerson | Product  | Amount |
|-------------|----------|--------|
| Alice       | ProductA | 100    |
| Alice       | ProductB | 150    |
| Bob         | ProductA | 120    |
| Bob         | ProductC | 130    |

You want to pivot this table to show the total sales amount by each salesperson for each product.

### Pivot Query:

SELECT SalesPerson, 
       [ProductA], 
       [ProductB], 
       [ProductC]
FROM 
(
    SELECT SalesPerson, Product, Amount
    FROM Sales
) AS SourceTable
PIVOT
(
    SUM(Amount)
    FOR Product IN ([ProductA], [ProductB], [ProductC])
) AS PivotTable;


--### Explanation:
- The inner query (`SourceTable`) selects the `SalesPerson`, `Product`, and `Amount` columns.
- The `PIVOT` operator aggregates the `Amount` values by `SalesPerson` for each `Product`.
- The `FOR Product IN ([ProductA], [ProductB], [ProductC])` clause specifies the values from the `Product` column that should 
become new columns.

### Result:

| SalesPerson | ProductA | ProductB | ProductC |
|-------------|----------|----------|----------|
| Alice       | 100      | 150      | NULL     |
| Bob         | 120      | NULL     | 130      |

This query transforms the rows into columns based on the `Product` values.
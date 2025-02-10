-- Problem: 
-- You have a table called Sales, which records the sales amount of a product on different dates. 
-- sales(salesID,salesDate,salesAmount)
-- You want to calculate the difference between each sale and the previous one and also calculate the 
-- difference between each sale and the next one

-- Sample Table: `Sales`

| SaleID | SaleDate   | SalesAmount |
|--------|------------|-------------|
| 1      | 2024-09-10 | 100         |
| 2      | 2024-09-11 | 150         |
| 3      | 2024-09-12 | 120         |
| 4      | 2024-09-13 | 200         |
| 5      | 2024-09-14 | 180         |

SELECT 
    SaleID, 
    SaleDate, 
    SalesAmount,
    LAG(SalesAmount, 1) OVER (ORDER BY SaleDate) AS PreviousSalesAmount,
    LEAD(SalesAmount, 1) OVER (ORDER BY SaleDate) AS NextSalesAmount,
    SalesAmount - LAG(SalesAmount, 1) OVER (ORDER BY SaleDate) AS DiffWithPrevious,
    LEAD(SalesAmount, 1) OVER (ORDER BY SaleDate) - SalesAmount AS DiffWithNext
FROM Sales;
```

### Explanation:
- `LAG(SalesAmount, 1)`: Gets the sales amount from the previous row.
- `LEAD(SalesAmount, 1)`: Gets the sales amount from the next row.
- `DiffWithPrevious`: The difference between the current sales amount and the previous one.
- `DiffWithNext`: The difference between the current sales amount and the next one.

### Output:

| SaleID | SaleDate   | SalesAmount | PreviousSalesAmount | NextSalesAmount | DiffWithPrevious | DiffWithNext |
|--------|------------|-------------|---------------------|-----------------|------------------|--------------|
| 1      | 2024-09-10 | 100         | NULL                | 150             | NULL             | 50           |
| 2      | 2024-09-11 | 150         | 100                 | 120             | 50               | -30          |
| 3      | 2024-09-12 | 120         | 150                 | 200             | -30              | 80           |
| 4      | 2024-09-13 | 200         | 120                 | 180             | 80               | -20          |
| 5      | 2024-09-14 | 180         | 200                 | NULL            | -20              | NULL         |

### Notes:
- The first row doesn't have a previous row, so `LAG()` returns `NULL`.
- The last row doesn't have a next row, so `LEAD()` returns `NULL`.

####Heres a problem with a solution using both `LAG()` and `LEAD()` window functions in SQL Server. These functions allow you to 
access data from the previous or next row within the result set, based on an ordering.

-- 5. Data Aggregation
-- Given a sales(date, product_id,amount) , 
-- write a SQL query to calculate the 7-day rolling average of sales for each product.

| Date       | ProductID | Amount | rolling_avg_7_days |
|------------|-----------|--------|--------------------|
| 2024-08-01 | 1         | 100    | 100                |
| 2024-08-02 | 1         | 150    | 125                |
| 2024-08-03 | 1         | 200    | 150                |
| 2024-08-04 | 1         | 250    | 175                |
| 2024-08-05 | 1         | 300    | 200                |
| 2024-08-06 | 1         | 350    | 225                |
| 2024-08-07 | 1         | 400    | 250                |
| 2024-08-08 | 1         | 450    | 300                |

-- 6. To calculate the 7-day rolling average of sales for each product, you can use the `WINDOW` 
-- function with a range-based window specification. Heres how you can write the SQL query to achieve this:

SELECT
    date,
    product_id,
    amount,
    AVG(Amount) OVER (
        PARTITION BY product_id
        ORDER BY Date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_avg_7_days
FROM
    Sales
ORDER BY
    product_id,
    date;
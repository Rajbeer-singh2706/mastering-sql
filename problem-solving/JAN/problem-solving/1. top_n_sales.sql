# 3. Top N per Group
# sales(product_id, salesperson_id, sales_amount)
# Write a SQL query to find the top 3 sales amounts for each `salesperson_id`.

'''
SELECT
         salesperson_id,
         product_id,
         sales_amount
     FROM (
         SELECT
             salesperson_id,
             product_id,
             sales_amount,
             ROW_NUMBER() OVER (PARTITION BY salesperson_id ORDER BY sales_amount DESC) AS rank
         FROM sales
     ) ranked_sales
     WHERE rank <= 3;

--- Approach 2 
--- ## correlated subquery. Heres how you can write the query:
SELECT 
    s1.salesperson_id, 
    s1.sales_amount
FROM 
    Sales s1
WHERE 
    (
        SELECT COUNT(DISTINCT s2.sales_amount) 
        FROM Sales s2 
        WHERE s2.salesperson_id = s1.salesperson_id 
        AND s2.sales_amount > s1.sales_amount
    ) < 3
ORDER BY 
    s1.salesperson_id, s1.sales_amount DESC;


* Correlated Subquery: The subquery (SELECT COUNT(DISTINCT s2.sales_amount) ...) counts how many distinct sales amounts are 
greater than the current rows sales_amount for the same salesperson_id.

* WHERE ... < 3: The query filters out rows where there are already 3 or more distinct sales amounts greater than the current one. 
This ensures that only the top 3 sales amounts are returned.
 
* ORDER BY s1.salesperson_id, s1.sales_amount DESC: Finally, the results are ordered by salesperson_id and then by sales amount in 
descending order.

This approach avoids the use of window functions and directly filters the top 3 sales amounts using a correlated subquery.
'''

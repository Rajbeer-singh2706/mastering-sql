The `CASE` statement in SQL is a powerful conditional expression that can be used in various parts of a query to implement conditional logic. Here’s how you can use it in different parts of a SQL query:

### 1. **In the `SELECT` Clause**

You can use the `CASE` statement to create new columns based on conditional logic.

**Example:**
```sql
SELECT 
    product_id,
    product_name,
    price,
    CASE
        WHEN price < 50 THEN 'Cheap'
        WHEN price BETWEEN 50 AND 100 THEN 'Moderate'
        ELSE 'Expensive'
    END AS price_category
FROM 
    Products;
```

### 2. **In the `WHERE` Clause**

You can use `CASE` to create more complex conditions or handle multiple conditions.

**Example:**
```sql
SELECT 
    *
FROM 
    Orders
WHERE 
    CASE
        WHEN order_amount > 1000 THEN 'High Value'
        WHEN order_amount BETWEEN 500 AND 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END = 'High Value';
```

### 3. **In the `ORDER BY` Clause**

You can use `CASE` to implement custom sorting logic.

**Example:**
```sql
SELECT 
    employee_id,
    first_name,
    last_name,
    salary
FROM 
    Employees
ORDER BY 
    CASE 
        WHEN salary > 100000 THEN 1
        WHEN salary BETWEEN 50000 AND 100000 THEN 2
        ELSE 3
    END;
```

### 4. **In the `GROUP BY` Clause**

`CASE` can be used in `GROUP BY` to group data based on conditional logic.

**Example:**
```sql
SELECT 
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30 to 50'
        ELSE 'Over 50'
    END AS age_group,
    COUNT(*) AS num_customers
FROM 
    Customers
GROUP BY 
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30 to 50'
        ELSE 'Over 50'
    END;
```

### 5. **In the `HAVING` Clause**

`CASE` can be used to apply conditional logic on aggregate results.

**Example:**
```sql
SELECT 
    department_id,
    COUNT(*) AS total_employees
FROM 
    Employees
GROUP BY 
    department_id
HAVING 
    SUM(CASE 
            WHEN salary > 50000 THEN 1
            ELSE 0
        END) > 10;
```

### 6. **In the `UPDATE` Clause**

`CASE` can be used to conditionally update columns.

**Example:**
```sql
UPDATE 
    Products
SET 
    discount = CASE
        WHEN category = 'Electronics' THEN 0.10
        WHEN category = 'Clothing' THEN 0.20
        ELSE 0.05
    END
WHERE 
    stock > 0;
```

### 7. **In the `INSERT` Clause**

`CASE` can be used in `INSERT` statements to conditionally set values.

**Example:**
```sql
INSERT INTO 
    SalesSummary (product_id, sale_amount, discount)
SELECT 
    product_id,
    sale_amount,
    CASE
        WHEN sale_amount > 1000 THEN 0.15
        WHEN sale_amount BETWEEN 500 AND 1000 THEN 0.10
        ELSE 0.05
    END
FROM 
    Sales;
```

### 8. **In the `JOIN` Clause**

`CASE` can be used in `JOIN` conditions for more complex joining logic.

**Example:**
```sql
SELECT 
    o.order_id,
    c.customer_name
FROM 
    Orders o
JOIN 
    Customers c
ON 
    o.customer_id = c.customer_id
AND 
    CASE 
        WHEN o.order_date < '2023-01-01' THEN o.status
        ELSE 'Active'
    END = c.status;
```

The `CASE` statement is versatile and can help you handle various conditional scenarios within your SQL queries, making it a valuable tool for complex querying and data manipulation.
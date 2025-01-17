-- Joins are fundamental operations in SQL used to combine rows from two or more tables based on a related column. Among the 
-- various types of joins, **Anti Joins** and **Semi Joins** are less common but highly useful for specific scenarios.

-- ### **1. Semi Join**
--A Semi Join returns rows from one table where a match exists in another table, but it does not return columns from the second table. 
-- Essentially, it checks for the existence of matching rows and returns only those rows from the first table.

--**Use Case:** Finding rows in one table that have matching rows in another table, but you only need the rows from the first table.

#### **Example**

Assume we have two tables:

- **Customers**:
  - `customer_id`
  - `customer_name`

- **Orders**:
  - `order_id`
  - `customer_id`
  - `order_date`

**Task:** Find all customers who have placed at least one order.

**SQL Query:**

```sql
SELECT customer_id, customer_name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);
```

**Explanation:**
- The `EXISTS` subquery checks if there are any rows in the `Orders` table with the same `customer_id` as in the `Customers` table.
- If such rows exist, the `customer_id` and `customer_name` from the `Customers` table are returned.


--### **2. Anti Join**
-- An Anti Join returns rows from one table where no match exists in another table. It is the opposite of a Semi Join. 
--Essentially, it filters out rows from the first table that have matching rows in the second table.

**Use Case:** Finding rows in one table that do not have corresponding rows in another table.

#### **Example**

Continuing with the same tables:

- **Customers**:
  - `customer_id`
  - `customer_name`

- **Orders**:
  - `order_id`
  - `customer_id`
  - `order_date`

--**Task:** Find all customers who have not placed any orders.

**SQL Query:**

```sql
SELECT customer_id, customer_name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);
```

**Explanation:**
- The `NOT EXISTS` subquery checks if there are no rows in the `Orders` table with the same `customer_id` as in the `Customers` table.
- If no such rows exist, the `customer_id` and `customer_name` from the `Customers` table are returned.

### **Alternative Methods for Semi and Anti Joins**

In addition to using `EXISTS` and `NOT EXISTS`, you can achieve similar results 
1. using `LEFT JOIN` with `IS NULL` for Anti Joins 
2. and `INNER JOIN` for Semi Joins.

#### **Semi Join Alternative with `INNER JOIN`**

```sql
SELECT DISTINCT c.customer_id, c.customer_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;
```

**Explanation:**
- This query performs an `INNER JOIN` and uses `DISTINCT` to ensure each customer appears only once.

-- #### **Anti Join Alternative with `LEFT JOIN` and `IS NULL`**

```sql
SELECT c.customer_id, c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
```

**Explanation:**
- The `LEFT JOIN` returns all rows from `Customers` and matches rows from `Orders`. Rows in `Customers` with no match in `Orders` 
will have `NULL` values in the `Orders` columns.
- The `WHERE o.customer_id IS NULL` condition filters out customers who have not placed any orders.
## 2. Give customer_names of the persons who have not bought 'C'
'''
      -- Customers table:
    -- +-------------+---------------+
    -- | customer_id | customer_name |
    -- +-------------+---------------+
    -- | 1           | Daniel        |
    -- | 2           | Diana         |
    -- | 3           | Elizabeth     |
    -- | 4           | Jhon          |
    -- +-------------+---------------+
    -- Orders table:
    -- +------------+--------------+---------------+
    -- | order_id   | customer_id  | product_name  |
    -- +------------+--------------+---------------+
    -- | 10         |     1        |     A         |
    -- | 20         |     1        |     B         |
    -- | 30         |     1        |     D         |
    -- | 40         |     1        |     C         |
    -- | 50         |     2        |     A         |
    -- | 60         |     3        |     A         |
    -- | 70         |     3        |     B         |
    -- | 80         |     3        |     D         |
    -- | 90         |     4        |     C         |
'''

### SOL 1
'''
  select customer_name from customers NOT IN (select customer_id from Orders where prodcut_name like '%C') # 1, 4
'''

### SOL2: Using Join 
'''
  SELECT 
  FROM CUSTOMER C 
  LEFT JOIN Orders O 
     ON C.customer_id = o.customer_id AND product_name = 'C'
  WHERE product_name is null;

'''
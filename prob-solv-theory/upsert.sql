 --An **UPSERT** (a combination of "UPDATE" and "INSERT") is a database operation that either updates an existing record or inserts 
 --a new one if the record does not exist. Different databases provide different methods to achieve UPSERT functionality. 
 --Below are ways to implement an UPSERT in various popular databases.

-- ### 1. **Upsert in MySQL (`INSERT ... ON DUPLICATE KEY UPDATE`)**
-- In MySQL, UPSERT is done using the `INSERT ... ON DUPLICATE KEY UPDATE` statement. This works when there's a unique or primary 
-- key conflict.

**Example:**
INSERT INTO Employees (employee_id, employee_name, salary)
VALUES (1, 'Alice', 60000)
ON DUPLICATE KEY UPDATE 
    employee_name = VALUES(employee_name), 
    salary = VALUES(salary);

**Explanation:**
- If an entry with `employee_id = 1` already exists, the query updates `employee_name` and `salary`.
- If it does not exist, a new record will be inserted.

### 2. **Upsert in PostgreSQL (`INSERT ... ON CONFLICT`)**
PostgreSQL provides an `ON CONFLICT` clause that handles conflicts arising from constraints such as primary keys 
or unique indexes.

**Example:**
INSERT INTO Employees (employee_id, employee_name, salary)
VALUES (1, 'Alice', 60000)
ON CONFLICT (employee_id)
DO UPDATE SET 
    employee_name = EXCLUDED.employee_name,
    salary = EXCLUDED.salary;

**Explanation:**
- `ON CONFLICT (employee_id)` specifies that if there is a conflict on the `employee_id` column (usually due to a unique or 
primary key constraint), PostgreSQL should perform an update.
- `EXCLUDED` refers to the values that were attempted to be inserted.

--- ### 3. **Upsert in SQL Server (`MERGE`)**
In SQL Server, the `MERGE` statement is used for UPSERT operations. It allows you to compare rows between a target table and 
a source table or values.

**Example:**

MERGE INTO Employees AS target
USING (VALUES (1, 'Alice', 60000)) AS source (employee_id, employee_name, salary)
ON target.employee_id = source.employee_id
WHEN MATCHED THEN
    UPDATE SET employee_name = source.employee_name, salary = source.salary
WHEN NOT MATCHED THEN
    INSERT (employee_id, employee_name, salary)
    VALUES (source.employee_id, source.employee_name, source.salary);

**Explanation:**
- The `MERGE` statement checks if a record with `employee_id = 1` exists.
- If it exists (`MATCHED`), it updates `employee_name` and `salary`.
- If it doesnt exist (`NOT MATCHED`), it inserts the new record.

-- ### 6. **Upsert in Amazon Redshift**
-- Redshift doesn't support native UPSERT like PostgreSQL or MySQL. Instead, you use a combination of `DELETE` and `INSERT`.

**Example:**
-- First delete the existing row (if it exists)
BEGIN;
DELETE FROM Employees
WHERE employee_id = 1;

-- Then insert the new row
INSERT INTO Employees (employee_id, employee_name, salary)
VALUES (1, 'Alice', 60000);
END;

-- ### 7. **Upsert in DynamoDB**
-- In AWS DynamoDB, you don't need a special syntax for UPSERT because every `PUT` operation is automatically an UPSERT. If the item exists, it's updated; if it doesn't, it's inserted.

**Example:**
```bash
aws dynamodb put-item \
--table-name Employees \
--item '{"employee_id": {"N": "1"}, "employee_name": {"S": "Alice"}, "salary": {"N": "60000"}}'
```

### Summary of UPSERT Approaches:

- **MySQL               :** `INSERT ... ON DUPLICATE KEY UPDATE`
- **PostgreSQL & SQLite :** `INSERT ... ON CONFLICT`
- **SQL Server & Oracle :** `MERGE`
- **Amazon Redshift     :** `DELETE + INSERT`
- **DynamoDB            :** `PUT` (automatic UPSERT)
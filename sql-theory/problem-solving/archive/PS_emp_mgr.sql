-- Here are examples for both SQL problems:

-- ### **1. Find Employees Who Are Also Managers**
-- To find employees who are also managers, you would typically need a table where each employee's manager is recorded. 
-- Assuming you have an `Employees` table with columns `employee_id`, `employee_name`, and `manager_id`, where `manager_id` refers 
-- to the `employee_id` of the manager, the query would look like this:


**Table Structure:**

- **Employees**:
  - `employee_id`
  - `employee_name`
  - `manager_id`

**SQL Query:**

```sql
SELECT DISTINCT e1.employee_id, e1.employee_name
FROM Employees e1
JOIN Employees e2 ON e1.employee_id = e2.manager_id;
```

**Explanation:**
- **Join:** The query joins the `Employees` table with itself. `e1` represents the employees, and `e2` represents the managers.
- **Condition:** The join condition `e1.employee_id = e2.manager_id` checks if the `employee_id` in `e1` matches the `manager_id` 
in `e2`.
- **Distinct:** `DISTINCT` ensures that each employee who is a manager is listed only once, even if they manage multiple employees.

**Example:**
Suppose the `Employees` table has the following data:

| employee_id | employee_name | manager_id |
|-------------|---------------|------------|
| 1           | Alice         | NULL       |
| 2           | Bob           | 1          |
| 3           | Carol         | 1          |
| 4           | Dave          | 2          |
| 5           | Eve           | 2          |

In this case, the result of the query would be:

| employee_id | employee_name |
|-------------|---------------|
| 1           | Alice         |
| 2           | Bob           |


-- ### **2. Find Employees Who Manage Exactly 2 Employees**
-- To find employees who manage exactly 2 employees, you need to count the number of direct reports each employee has and filter 
-- for those with exactly 2 reports.

SELECT manager_id, COUNT(employee_id) AS num_employees
FROM Employees
GROUP BY manager_id
HAVING COUNT(employee_id) = 2;

**Explanation:**
- **Group By:** The query groups the rows by `manager_id` to aggregate data for each manager.
- **Count:** `COUNT(employee_id)` counts the number of employees managed by each manager.
- **Having:** `HAVING COUNT(employee_id) = 2` filters the groups to include only those where 
the manager manages exactly 2 employees.

**Example:**

Given the same `Employees` table:

| employee_id | employee_name | manager_id |
|-------------|---------------|------------|
| 1           | Alice         | NULL       |
| 2           | Bob           | 1          |
| 3           | Carol         | 1          |
| 4           | Dave          | 2          |
| 5           | Eve           | 2          |
| 6           | Frank         | 3          |

In this case, the result of the query would be:

| manager_id | num_employees |
|------------|---------------|
| 2          | 2             |

Here, only Bob (manager_id = 2) manages exactly 2 employees (Dave and Eve).
These queries allow you to extract useful information about employee management relationships from the `Employees` table.
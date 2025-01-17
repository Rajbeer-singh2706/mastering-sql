### **Problem: Find Second Highest Salary**
'''
Given a table named `Employees` with the following structure:
Employees Table:**
  - `EmployeeID`: Unique identifier for each employee.
  - `EmployeeName`: Name of the employee.
  - `Salary`: Salary of the employee.

Q) Write a SQL query to find the second highest salary in the `Employees` table.
A)

| EmployeeID | EmployeeName | Salary |
|------------|--------------|--------|
| 1          | Alice        | 7000   |
| 2          | Bob          | 8000   |
| 3          | Charlie      | 6000   |
| 4          | David        | 9000   |
| 5          | Eva          | 8000   |



### **Expected Output:**
The query should return `8000` as the second highest salary.
A) One way to solve this is by using a subquery:

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees WHERE Salary < (SELECT MAX(Salary) FROM Employees);

### **Explanation:**
- The inner query `(SELECT MAX(Salary) FROM Employees)` finds the highest salary in the `Employees` table.
- The outer query then selects the maximum salary that is less than the highest salary found by the inner query, 
which gives us the second highest salary.

### Solution 2:
SELECT DISTINCT salary
FROM (
    SELECT 
      salary,
      RANK() OVER(ORDER BY SALARY DESC) AS RN => incorrect
      DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK
    FROM 
      Employee
)
WHERE RNK=2

9000 => RN1
8000 => RN2
8000 => RN2
7000 => RN4

But if data 
9000 => RN1
9000 => RN1
8000 => RN3
8000 => RN3
7000 => RN5

### DEN_RANK
But if data 
9000 => RN1
9000 => RN1
8000 => RN2
8000 => RN2
7000 => RN5


### Approach 3
SELECT DISTINCT salary FROM Employees ORDER BY salary DESC LIMIT 1 OFFSET 1;
Note: This query orders the distinct salaries in descending order and skips the first one (OFFSET 1), returning the second one.


### Apr4: 
WITH RankedSalaries AS (
    SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
    FROM Employees
)
SELECT salary AS SecondHighestSalary
FROM RankedSalaries
WHERE rank = 2;

Explanation:
  * ROW_NUMBER() OVER (ORDER BY salary DESC): This assigns a unique rank to each salary, ordering them in descending order.
  * WITH RankedSalaries AS (...): This common table expression (CTE) creates a temporary result set that ranks the salaries.
  WHERE rank = 2: This filters out the salary with a rank of 2, which corresponds to the second-highest salary.

########
### **Follow-Up Question:**
modify the query to return the `EmployeeName` and `EmployeeID` of the person with the second highest salary. Here's one approach:


SELECT EmployeeID, EmployeeName, Salary
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE Salary < (SELECT MAX(Salary) FROM Employees)
);
'''


### 5. **Advanced Aggregations**
'''
Q) Write a SQL query to find the second highest salary in a table.

     SELECT MAX(salary) AS SecondHighestSalary
     FROM employees
     WHERE salary < (SELECT MAX(salary) FROM employees);
'''
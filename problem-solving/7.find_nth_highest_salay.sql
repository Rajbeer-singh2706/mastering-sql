3. Find Nth Highest Salary

Q3: Write a SQL query to find the Nth highest salary from the employees table.

--- SOL1 
select 
 distinct salary 
FROM (
select 
  salary,
  dense_rank() over(order by salary DESC) as RNK 
FROM employees 
)
WHERE RNK = n

--- OR 
WITH SalaryRank AS (
    SELECT salary, 
    DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
    FROM employees
)
SELECT salary FROM SalaryRank WHERE rank = N;

---Answer: You can use subqueries or window functions:
select min(salary) as Nth_higest_salary
FROM (
    select 
        distinct salary 
    from employees order by salary DESC LIMIT N
) AS TEMP;



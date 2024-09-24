-- Coding Ninjas

select salary
FROM
( 
    select salary, DENSE_RANK() OVER(order by salary) as rank 
    FROM employee
) as X where X.rank = 2;


#
select distinct salary from employee order by salary desc limit 1 offset 1
-- 
salary 
100
200
300

-> salary desc 
300 offset 0 
200 offset 1
100 offset 2

-> limit 1 offset 1 -> 200 
_> limit 2 offset 0 -> return 2 records which start from 0 , result, 300,200
-> limit 2 offset 1 -> return 2 records which start from 1 , result , 200,100

LIMIT 1 OFFSET 1: This combination limits the result to only one row (the second-highest salary). 
The OFFSET 1 skips the first row (highest salary), and LIMIT 1 limits the result to one row.


### APPROACH 3 : SUBQUERY 

An alternate approach to finding the second-highest salary in the employee table is to use a subquery. 
Heres an example of how you can do it:

```sql
SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);
```

In this query:
1. The inner subquery `(SELECT MAX(salary) FROM employee)` finds the maximum salary in the employee table, which is the highest salary.
2. The outer query then selects the maximum salary (`MAX(salary)`) from the employee table but with a condition in the WHERE clause. 
It retrieves the maximum salary that is less than the highest salary found in the subquery.
This approach ensures that you find the second-highest salary without needing to offset or skip any rows explicitly. 
It relies on the comparison of salaries to find the desired result.


# Certainly, here's another approach using a correlated subquery:
Certainly, here's another approach using a correlated subquery:

```sql
SELECT DISTINCT salary
FROM employee e1
WHERE 1 = (
    SELECT COUNT(DISTINCT salary)
    FROM employee e2
    WHERE e2.salary > e1.salary
);
```


In this query:
1. The outer query selects distinct salaries from the employee table as `salary`.
2. The inner subquery calculates the count of distinct salaries (`COUNT(DISTINCT salary)`) in the employee table (aliased as `e2`) 
where the salary is greater than the salary in the outer query (`e1.salary`).
3. The `WHERE 1 = ...` condition in the outer query ensures that we only select salaries where there is exactly one salary greater 
than the current salary. This identifies the second-highest salary.
This approach avoids the use of `LIMIT` and `OFFSET` and is based on counting distinct salaries greater than the current salary to 
find the second-highest salary in the table.



### 2nd Approach 

select salary from  ( 
     select distinct salary from employee order by limit 2 desc
) order by sal limit 1

#####

SELECT SALARY 
FROM ( 
        SELECT 
        salary , 
        DENSE_RANK() over(order by salary) AS DR
        FROM EMPLOYEE 
)
WHERE DR=2


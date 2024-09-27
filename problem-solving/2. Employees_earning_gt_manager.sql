2. Employees earning > managers

https://leetcode.com/problems/employees-earning-more-than-their-managers/description/


Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 

Write a solution to find the employees who earn more than their managers.
Return the result table in any order.

Example 1:

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |X. Manager table contain only these records 
| 4  | Max   | 90000  | Null      |X. Manager table contain only these records 
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.

--- ####
SELECT 
   e.name 
FROM EMPLOYEE emp
JOIN EMPLOYEE mgr 
  ON emp.managerId = mgr.id and emp.salary > mgr.salary




--##### NOTE : ALWAYS SOLVE SELF JOIN LIKE THIS => APPROACH ####
-- # 1. Alias first table with another 
-- # 2. Then assume there are two table exits ,
---# 3. Then think how you are going to solve that problems
-- # 4. Image same table as two table 
--- # For Example 1 as employee 1 as managers
-- 3. Duplicate emails:https://leetcode.com/problems/duplicate-emails/description/

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.

-- Write a solution to report all the duplicate emails. Note that its guaranteed that the email field is not NULL.
Return the result table in any order.
The result format is in the following example.


Example 1:

Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.

SOL1 
-----
select 
  email
from Person 
GROUP BY email having count(email) > 1;

SOL2 
--- 
select 
   distinct p1.email 
FROM person p1 
JOIN person p2 
  ON p1.id != p2.id and p1.email = p2.email 

-- dummy run 
--1 , 1  fail 
-- 1 , 2, email not matched 
-- 1, 3 , email match,shown 

--2, 1, email not matched  
-- 2,2 fail 
-- 2,3, email not matched 

-- 3, 1 , email match 
-- 3, 2, email not matched 
-- 3, 3 , fail 

-- SOL 3
SELECT 
 email 

FROM (SELECT 
   *,
   ROW_NUMBER() OVER(PARTITION BY email) as RNK
FROM PERSON 
) X 
WHERE X.RNK = 2

-- # https://leetcode.com/problems/delete-duplicate-emails/description/

Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+

-- ID is the primary key (column with unique values) for this table. Each row of this table contains an email. The emails will not contain uppercase letters.
-- Q) Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

-- For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one. For Pandas users, please note that you are supposed to 
-- modify Person in place.

-- After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and  then show the Person table. 
-- The final order of the Person table does not matter, The result format is in the following example.

Example 1:
Input: 
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.

-- ######## SOLUTION 1 #############
SELECT 
  ID, 
  EMAIL  
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY email order by id) AS RNK 
    FROM person 
) 
WHERE RNK=1

-- ####### SOLUTION 2 ####### 
WITH CTE AS (
    SELECT 
        id,
        email,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS row_num
    FROM 
        Person
)
DELETE FROM CTE
WHERE row_num > 1;

-- ###### SOLUTION 3 ###
DELETE FROM PERSON 
WHERE ID NOT IN (
    SELECT 
      min(ID)
    FROM Person
    GROUP BY email having count(ID) > 1 
)

-- ####### SOLUTION 4 ###########
DELETE p1 
FROM PERSON p1 
JOIN PERSON p2 
    ON p1.email = p2.email
WHERE p1.id > p2.id ; -- keeping only one unique email with the smallest id.
OR 
WHERE p1.id < p2.id ; -- keeping only one unique email with the greatest id.



-- ######### SOL #
select 
  id,
  email
FROM person p1
INNER JOIN 
(
    select 
        email,
        count(*)
    from person 
    group by email having count(*) > 1
) p2 
ON p1.email = p2.email;


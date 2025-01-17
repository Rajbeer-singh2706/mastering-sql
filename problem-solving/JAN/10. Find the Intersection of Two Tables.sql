#10. Find the Intersection of Two Tables
# Q10: How would you find the common records between two tables?
# Answer: You can use INNER JOIN or INTERSECT


-- SOL1 Using INNER JOIN:
SELECT 
    a.*
FROM table1 a
JOIN table2 b 
    ON a.column = b.column;

-- SOL2: INTERSECT
SELECT column FROM table1
INTERSECT
SELECT column FROM table2;




### 2. Duplicate Rows Removal
Q2: How would you remove duplicate rows from a table without using the DISTINCT keyword?

Answer: Use a common table expression (CTE) with the ROW_NUMBER() function to identify and delete duplicates:

with fetch_all_dup_row
as (
    select 
    eid, name,age,salary
    from employee
    group by all having count(*) > 1
)
----


with ranked_data as (
select 
   e.*
   row_number() over(partition by name,age,salary order by eid) as RNK 
FROM employee E
)
delete from ranked_data where RNK > 1


---
WITH CTE AS (
    SELECT 
        column1, column2, 
        ROW_NUMBER() OVER (PARTITION BY column1, column2 ORDER BY id) AS row_num
    FROM table_name
)
DELETE FROM table_name
WHERE id IN (SELECT id FROM CTE WHERE row_num > 1);

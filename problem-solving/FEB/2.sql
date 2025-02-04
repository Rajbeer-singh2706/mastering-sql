# Q6: Write a SQL query to find duplicate records in a table with multiple columns.

'''
SELECT 
    column1, column2, COUNT(*)
FROM table_name
GROUP BY column1, column2
HAVING COUNT(*) > 1;

'''
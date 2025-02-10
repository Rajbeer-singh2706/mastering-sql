11. Check if a Table is Empty
Q11: How would you check if a table is empty?

Answer: You can use a simple SELECT query:

SELECT 
CASE WHEN COUNT(*) = 0 THEN 'Table is empty' ELSE 'Table is not empty' END
FROM table_name;


SELECT 
   CASE 
        WHEN COUNT(*) = 0 THEN 'Table is empty'
        ELSE 'Table is not empty'
   END 
FROM table_name 

select count(*) from table ;




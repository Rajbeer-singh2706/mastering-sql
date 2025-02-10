# 6. Count the Occurrences of Each Element
# Q6: How would you count the occurrences of each element in a table?

Answer: Use GROUP BY and COUNT():

SELECT 
    column_name, COUNT(*) AS count
FROM table_name
GROUP BY column_name;



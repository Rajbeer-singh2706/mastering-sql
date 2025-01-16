#12. Find the Most Frequent Element in a Table

# Q12: How would you find the most frequent element in a table?
Answer: Use GROUP BY and ORDER BY to find the most frequent element


SELECT 
 column_name, COUNT(*) AS freq
FROM table_name
GROUP BY column_name
ORDER BY freq DESC
LIMIT 1;
 



# Find the First Non-Null Value in Multiple Columns
# Q8: Write a query to find the first non-null value from multiple columns.

# Answer: Use the COALESCE() function, which returns the first non-null value:


SELECT 
  COALESCE(column1, column2, column3) as first_non_null_value
FROM table_name;

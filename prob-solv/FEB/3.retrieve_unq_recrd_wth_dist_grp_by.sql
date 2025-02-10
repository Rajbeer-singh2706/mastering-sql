# 6. Write a SQL query to retrieve unique records without using DISTINCT or GROUP BY?
'''
with CTE1 as (
   select 
        name1,
        name2,
        ROW_NUMBER() OVER(PARTITION BY name1, name2 ORDER BY (select null)) as RNK 
  FROM table1 
)
select * FROM CTE1 WHERE RNK = 1
'''

# Explanation
''''
ROW_NUMBER(): Assigns a unique row number for each duplicate combination of column1 and column2 based on the PARTITION BY clause.
CTE: Captures the result of the ROW_NUMBER() operation.
WHERE row_num = 1: Filters out duplicates, leaving only the first occurrence of each unique combination.
Key Points:
The ORDER BY (SELECT NULL) is used to minimize the impact of sorting and can be replaced with a specific column if ordering is required.
Replace ROW_NUMBER() with RANK() or DENSE_RANK() if needed based on your requirements.
'''
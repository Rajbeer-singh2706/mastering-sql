#* 3. Write a SQL query to delete the 10th highest salary from the employee table?
'''
DELETE 
FROM (
    SELECT
    *,
    DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK
    FROM EMPLOYEE
 )
WHERE RNK = 10

'''
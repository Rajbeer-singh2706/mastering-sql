# 4. How would you find the top 3 highest-paid employees in an organization?
'''
SELECT
* 
FROM 
(
 SELECT 
   *, 
   DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK 
) 
WHERE RNK <=3 

'''
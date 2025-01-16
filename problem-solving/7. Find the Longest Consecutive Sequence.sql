# 7. Find the Longest Consecutive Sequence
#Q7: Given a list of numbers, how would you find the longest consecutive sequence?

Answer: You can use a self-join or window functions. A more efficient way 
would be using window functions to find the gap between consecutive numbers


--- VEry Difficult 
WITH numberSequence AS (
   
   SELECT
      number,
      ROW_NUMBER() OVER(ORDER BY number) as row_num  
    FROM numbers
)
SELECT 
   MAX(number) - MIN(number) + 1 AS longest_consecutive_sequence
FROM NUmberSequence
GROUP BY row_num - number 
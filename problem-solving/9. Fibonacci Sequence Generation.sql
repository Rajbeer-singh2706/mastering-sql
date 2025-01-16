# 9. Fibonacci Sequence Generation
# Q9: How would you generate the Fibonacci sequence in SQL?
Answer: You can use a recursive CTE to generate Fibonacci numbers

WITH recursive Fibonacci(n, fib) AS (
   SELECT 
      1, 0 
    UNION ALL 
    SELECT 
            n+1, fib+n 
    FROM Fibonacci
    WHERE n < 10 -- GEnerate 10 Fibonacii numbner 
)
SELECT * from Fibonacci

-- ouput 
n fib 
1 0
2 1 
3 3 
4 6
5 10
6 15
7 21
8 28
9 36
10 45

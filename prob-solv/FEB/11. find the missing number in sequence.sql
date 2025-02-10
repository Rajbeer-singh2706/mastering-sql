1. Find the Missing Number in a Sequence
Q1: Given a sequence of integers from 1 to N with one number missing, how would you find the missing number in the most efficient way?

Answer: You can use the sum formula for the first N natural numbers and subtract the sum of the given numbers:

Formula:
Sum of first n numners = N*(N+1) / 2

SELECT ( N* (N + 1 ) )/ 2  - SUM(number)  AS missing_number FROM sequence_table;
 
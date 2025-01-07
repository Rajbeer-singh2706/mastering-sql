 was asked these 𝟓 𝐒𝐐𝐋 𝐏𝐫𝐨𝐛𝐥𝐞𝐦𝐬 in almost every 𝐃𝐚𝐭𝐚 𝐄𝐧𝐠𝐢𝐧𝐞𝐞𝐫𝐢𝐧𝐠 interview.

1. Remove duplicate rows from a table where all columns have duplicate values.

2. Fetch the users who placed orders for at least 3 consecutive days.

3. Find the Nth highest salary of an employee (overall and department-wise), with and without using window functions.

4. Determine the total number of records in each type of join for the given tables, along with the output column values.

📌 Convert rows into columns. Sample question:
 Input Table (c1, c2) --
 A, B

 Output (c1) --
 A
 B

 Technical interviews can be scary.

Here 8 SQL Interview Questions and Answers for data analysts:

1) Can you explain the concept of window functions in SQL, and how are they used in data analysis?
A) Window functions are used to perform calculations across a specified range of rows related to the current row.
 Examples include 
 ROW_NUMBER(), 
 RANK(), and LAG(). These functions are valuable for tasks such as ranking, aggregation, 
 and trend analysis.

Q2) How do you approach optimizing SQL queries for large datasets?
A) Optimization for large datasets involves using indexes appropriately, minimizing the use of wildcard characters in LIKE 
statements, and optimizing JOIN operations. Additionally, understanding query execution plans and using EXPLAIN statement 
can help identify bottlenecks.

Q3) Explain the difference between UNION and UNION ALL in SQL?
Ans) UNION merges the results of two SELECT statements, eliminating duplicate rows, while UNION ALL includes all rows, 
including duplicates. UNION is generally slower as it requires sorting and removing duplicates.

Q4) What is a correlated subquery, and how is it different from a regular subquery?
Ans) A correlated subquery refers to a subquery that refers to values from the outer query. It executes once for each row 
processed by the outer query. Regular subqueries do not depend on the outer query and execute independently.

Q5) How do you handle time zone differences in a database when dealing with international data?
Ans) Store timestamps in a standardized format (UTC) and convert to local time zones when presenting data. 
Be aware of daylight saving time changes and use appropriate functions for time zone conversions.

Q6) What is a CTE (Common Table Expression), and how is it useful in data analysis?
Ans) A CTE is a named temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. 
It simplifies complex queries by breaking them into more readable, modular components.

Q7: Can you explain the concept of indexing and its impact on data analytics performance?
Ans) Indexing involves creating data structures to improve the speed of data retrieval operations on a database table. 
Proper indexing can significantly enhance query performance, especially when dealing with large datasets.

Q8) How would you identify and handle outliers in a dataset using SQL?
Ans) Use statistical methods such as standard deviations or percentiles to identify outliers. Filtering or transforming 
these values can help prevent them from skewing analysis results.


1. window function -- must get a sql on this
2. performance tuning -- must ask question and candidate must know how to answer and prepare to speak at least 10 min. Never start with indexing and start with explain plan.
3. Union and Union all: always explain with example, do not only give definition
4. CTE :try to write the sql's using CTE, it shows your skill of handing complex sql query 
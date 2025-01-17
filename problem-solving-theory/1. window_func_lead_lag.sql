#########################
WINDOW FUNCTIONS 
###########################

The LEAD and LAG functions in SQL are window functions used to access data from subsequent or preceding rows within the same result set, 
without the need for self-joins. They are commonly used in analytics and reporting scenarios.

Theory
1. LEAD:
    * Fetches data from the next row in the partition.
    * Allows comparison with a subsequent rows value.

2. LAG:
  * Fetches data from the previous row in the partition.
  * Allows comparison with a preceding rows value.

Syntax:
-------
LEAD(column_name, offset, default_value) OVER (PARTITION BY column_name ORDER BY column_name)
LAG(column_name, offset, default_value) OVER (PARTITION BY column_name ORDER BY column_name)

* column_name: The column to evaluate.
* offset: The number of rows ahead/behind to fetch (default is 1).
* default_value: Value to return if no row is found (default is NULL).

OVER:
 PARTITION BY: Divides the result set into groups (optional).
 ORDER BY: Specifies the order of rows for the function to operate on (mandatory).


Use Cases
==========
1. Trend Analysis:
  * Compare sales growth or decline over time.

2. Session Data:
 * Identify gaps between events.

3. Time Series Analysis:
 * Detect patterns by comparing consecutive data points.



Examples of LEAD() and LAG() Functions
Consider a “contest” table:- 

c_id	start_date	end_date
1	    2015-02-01	2015-02-04
2	    2015-02-02	2015-02-05
3	    2015-02-03	2015-02-07
4	    2015-02-04	2015-02-06
5	    2015-02-06	2015-02-09
6	    2015-02-08	2015-02-10
7	    2015-02-10	2015-02-11

In the above table, “c_id” represents contest id and “start_date” and “end_date” represents starting and ending date of contest respectively. 

Example 1: Calculate Overlapping Days Between Contests
Problem description: We have to find number of days a contest will collapse with the next contest i.e no. of days on which both contests are 
held.

Query: 
with cte1 AS (
select 
  start_date, 
  end_date, 
  LEAD(start_date) OVER(order by start_date) as next_row_start_date 
FROM contests 
) 
SELECT 
    start_date,
    end_date, 
    DATEDIFF(next_row_start_date, end_date) +1 AS no_of_days 
FROM CTE1 


  SELECT c_id, 
       start_date, 
       end_date,
       DATEDIFF(LEAD(start_date) OVER (ORDER BY start_date), end_date) + 1 AS no_of_days
FROM contest;


In the above query “end_date” return ending date of the current contest and lead(start_date) return next contest starting date. 
So, the difference between these dates plus 1 will return no. of days the contest will collide.

Here, window specification is given by “order by” clause, which represent that lead() function will operate on table order by their 
“start_date” in increasing order. Since there is no partition clause so, whole table is taken as a single window.


c_id	start_date	end_date	  no_of_days
1	    2015-02-01	2015-02-04	3
2	    2015-02-02	2015-02-05	3
3	    2015-02-03	2015-02-07	4
4	    2015-02-04	2015-02-06	1
5	    2015-02-06	2015-02-09	2
6	    2015-02-08	2015-02-10	1
7	    2015-02-10	2015-02-11	NULL


Since, there is no contest after contest 7 i.e (c_id=7). So, lead(start_date) returns NULL value.

Note:The LEAD() and LAG() function are always used with OVER(). Missing of an over clause will raise an error.


Example 2: Retrieve Preceding Data for Analysis

SELECT 
    c_id, 
    start_date, 
    end_date, 
    LAG(end_date) OVER (ORDER BY start_date) AS prev_end_date,
    DATEDIFF(start_date, LAG(end_date) OVER (ORDER BY start_date)) AS gap_days
FROM contest;

c_id	start_date	end_date	  prev_end_date	gap_days
1	    2015-02-01	2015-02-04	NULL	        NULL
2	    2015-02-02	2015-02-05	2015-02-04	  -2
3	    2015-02-03	2015-02-07	2015-02-05	  -2
4	    2015-02-04	2015-02-06	2015-02-07	  -3
5	    2015-02-06	2015-02-09	2015-02-06	   0
6	    2015-02-08	2015-02-10	2015-02-09	  -1
7	    2015-02-10	2015-02-11	2015-02-10	   0

Conclusion
The LEAD() and LAG() functions in MySQL are essential for performing sequential data analysis, making it easier to access previous or 
next rows without complex joins. Whether you’re comparing trends, detecting gaps, or monitoring progressions, these functions simplify 
query writing and enhance performance. By understanding the syntax, use cases, and real-world applications, you can leverage LEAD() and 
LAG() effectively in your database operations.
# Rising temperature
#s6. Rising temperature: https://lnkd.in/dyZvVYvP
# https://leetcode.com/problems/rising-temperature/description/


Table: Weather
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+

create table weather(id int, recordDate date, temperature int)
INSERT INTO Weather (id, recordDate, temperature)
VALUES
    (1, '2015-01-01', 10),
    (2, '2015-01-02', 25),
    (3, '2015-01-03', 20),
    (4, '2015-01-04', 30);


* id is the column with unique values for this table.
* There are no different rows with the same recordDate.
* This table contains information about the temperature on a certain day.
 

Q) Write a solution to find all dates id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.
The result format is in the following example.

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+

Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).

### SOlution 1 
with CTE1 as (
    select
       id, 
       temperature,
       lag(temperature) over(order by recordDate) as prev_row_temprature
    FROM weather
) 
SELECT 
  id 
FROM CTE1  WHERE temperature >  prev_row_temprature
 
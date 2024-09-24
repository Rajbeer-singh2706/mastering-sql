#get the name of employee with max salary

select employee_name from employee where salary = (select max(salary) from employee);

(
   select max(salary) from employee
)


select employee_name, max(salary) from employee 
group by salary 
order by 2 desc 
limit 1


Q)  Problem 1: Display Names
----------------------------
Write a SQL query to retrieve the first name and last name of all employees from a table named Employees.

Q) Problem 2: Filtering Data
----------------------------
Write a SQL query to retrieve all products from a table named Products with a price less than $50.

Q) Problem 3: Counting Records
----------------------------
Write a SQL query to count the total number of customers in a table named Customers.

Q) Problem 4: Ordering Results
--------------------------------
Write a SQL query to retrieve the names of movies from a table named Movies in alphabetical order.


Q) Problem 5: Aggregating Data
------------------------------
Write a SQL query to calculate the average salary of all employees from a table named Salaries.


Q) Problem 6: Joining Tables
------------------------------
Given two tables 
Students (StudentID, FirstName, LastName) and 
Grades (StudentID, Course, Grade), 

write a SQL query to retrieve the names of students along with their grades in the course "Math".

Q) Problem 7: Finding Duplicates
--------------------------------
Write a SQL query to find duplicate email addresses from a table named Contacts.


Q) Problem 8: Filtering with LIKE
-------------------------------
Write a SQL query to retrieve all customers from a table named Customers whose last name starts with the letter "S".

Q) Problem 9: Limiting Results
-------------------------------
Write a SQL query to retrieve the top 5 highest-priced products from a table named Products.


Q) Problem 10: Date Manipulation
---------------------------------
Given a table named Orders with columns OrderID, CustomerID, and OrderDate, write a SQL query to retrieve all orders placed in 
the year 2022.



These problems cover fundamental SQL concepts such as 
 - SELECT statements, 
 - filtering, 
 - ordering, 
 - aggregation, 
 - joining tables,
 - date manipulation. 
Practice solving these problems to build a solid foundation in SQL.

Solutions 
---------
select first_name,last_name from employees;

select avg(salary) as AvgSalaries from Salaries
select * from products where price <= 50;
select count(*) from customers;
select title from movies order by title;
select 
 s.StudentID, FirstName, LastName Course, Grade 
FROM Students s 
JOIN Grades g 
   ON s.StudentsId = g.StudentID
WHERE course = 'MATH'
SELECT email, count(*) from contacts group by emaill having count(*) > 1;
selct * from customere where last_name like 'S%'
select * from products order by price DESC limit 5;
select * from orders where year(orderDate) = 2022


##################
Consider a database with two tables: students and courses. 
students 
--------
student_id (unique identifier), student_name, and course_id (the ID of the course the student is enrolled in). 

courses
--------
course_id (unique identifier) and course_name.

Write an SQL query to find the names of students who are enrolled in more than one course and display their names along 
with the number of courses they are enrolled in.



select s1.student_name
from students s1 
inner join (select student_id , count(*) from students group by student_id  having count(*) > 1) s2 
ON s1.student_id = s2.student_id 


SELECT s.student_name, COUNT(s.course_id) AS course_count
FROM students s
GROUP BY s.student_name
HAVING COUNT(s.course_id) > 1;


SELECT s.student_name, COUNT(s.course_id) AS course_count
FROM students s
JOIN courses c ON s.course_id = c.course_id
GROUP BY s.student_name
HAVING COUNT(s.course_id) > 1;



################
# Employees 
# departments
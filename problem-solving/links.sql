I didn't like SQL Until..

#### Weekdnds lets start working on LEET CODE 

I solved these 20 Leetcode questions.


7. Employee bonus: https://Inkd.in/d9iTXt-V
8. Find customer referee : https://lnkd.in/d5cXjXdb
10. Big countries: https://lnkd.in/dAnS54qK

12. Sales person: https://lnkd.in/dwRnf5Df
13. Triangle judgement: https://lnkd.in/dwzD-hFn
14. Biggest single number: https://lnkd.in/d4F5zHDs
15. Not boring movies: https://lnkd.in/d5w8_z65
16. Swap salary: https://lnkd.in/dnbCtecM
18. Product sales analysis 1: https://lnkd.in/dRj3EBuK
19. Project employees 1: https://lnkd.in/dvGHsbKQ
20. Sales analysis III : https://lnkd.in/d_y_rxPh

𝗦𝗤𝗟 𝗲𝘅𝗽𝗲𝗿𝘁𝘀 𝘆𝗼𝘂 𝗰𝗮𝗻 𝗳𝗼𝗹𝗹𝗼𝘄:
- Ankit Bansal
- Sumit Mittal
- Zach Wilson
- Brij kishore Pandey
- Shashank Mishra 🇮🇳
- Shashank Singh 🇮🇳
- Munna Das


# 1. From the following tables, write a SQL query to find the information on each salesperson of ABC Company. 
# Return name, city, country and state of each salesperson.
'''
 SELECT 
   s.salesperson_id,
   concat(first_name, last_name) as name,
   city, 
   country , 
   state 
 FROM salespersons s
 LEFT JOIN address a ON s.salesperson_id = a.salesperson_id 
'''


# 2. From the following table, write a SQL query to find the third highest sale. Return sale amount.
# sale_id|employee_id|sale_date |sale_amt|
'''
  select distinct sales_amt from salesmast order by salesmast limit 3 offset 3
 
   select sales_amt FROM 
   (
    select *, dense_rank() over(order by sales_amt) as rank 
    FROM salesmast 
   ) where rank = 3

   # SOl1 
   select max(sale_amt) as SecondHighestSales 
   FROM (select distinct sale_amt from salesmast ORDER BY sales_amt DESC LIMIT 2 offset 1 ) AS sale 

   # SOL2 
   select MAX(sale_amt) AS SecondHighestSales FROM salemast
   WHERE sale_amt < (select max(sale_amt) from salemast ) 
'''

# #https://www.w3resource.com/sql-exercises/challenges-1/index.php
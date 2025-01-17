# 5. Count Distinct Pairs
Q5: Given a table of user interactions, how would you find all distinct pairs of users who 
interacted with each other?

#Answer: You can self-join the table to find distinct pairs:



-- SOl1 
SELECT 
   distinct 
   t1.user_id as user1,
   t2.user_id as user2

FROM interaction t1 
JOIN interation t2 
   ON t1.user_id < t2.user_id AND t1.interaction_id = t2.interaction_id ;


-- SOL2 

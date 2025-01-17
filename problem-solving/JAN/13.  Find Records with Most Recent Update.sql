# Find Records with Most Recent Update

#Q4: How do you retrieve records with the most recent update timestamp?

Answer: You can use the MAX() function or window functions to get the latest record

-- 1. Using Max()
select 
  * 
FROM records 
WHERE update_time = (select max(update_time) from records)

-- 2. using window functions 
WITH RankedRecords AS (
    SELECT 
        *, 
        ROW_NUMBER() OVER (ORDER BY update_time DESC) AS rn
    FROM records
)
SELECT * FROM RankedRecords WHERE rn = 1;

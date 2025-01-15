-- 𝐖𝐡𝐚𝐭 𝐢𝐬 𝐭𝐡𝐞 𝐨𝐮𝐭𝐩𝐮𝐭 𝐰𝐡𝐞𝐧 𝐩𝐞𝐫𝐟𝐨𝐫𝐦𝐢𝐧𝐠 𝐈𝐧𝐧𝐞𝐫 𝐉𝐨𝐢𝐧, 𝐋𝐞𝐟𝐭 𝐉𝐨𝐢𝐧, 𝐑𝐢𝐠𝐡𝐭 𝐉𝐨𝐢𝐧, 𝐚𝐧𝐝 𝐂𝐫𝐨𝐬𝐬 𝐉𝐨𝐢𝐧 𝐨𝐧 𝐭𝐡𝐞 𝐟𝐨𝐥𝐥𝐨𝐰𝐢𝐧𝐠 𝐭𝐚𝐛𝐥𝐞𝐬 𝐜𝐨𝐧𝐭𝐚𝐢𝐧𝐢𝐧𝐠 𝐍𝐔𝐋𝐋 𝐯𝐚𝐥𝐮𝐞𝐬?

-- 𝐒𝐭𝐫𝐮𝐜𝐭𝐮𝐫𝐞 𝐟𝐨𝐫 𝐭𝐚𝐛𝐥𝐞𝟏

CREATE TABLE table1 ( id INT );


-- 𝐈𝐧𝐬𝐞𝐫𝐭 𝐝𝐚𝐭𝐚 𝐢𝐧𝐭𝐨 𝐭𝐚𝐛𝐥𝐞𝟏
INSERT INTO table1 (id) VALUES
(NULL),
(NULL);

-- 𝐒𝐭𝐫𝐮𝐜𝐭𝐮𝐫𝐞 𝐟𝐨𝐫 𝐭𝐚𝐛𝐥𝐞𝟐

CREATE TABLE table2 (
 id INT
);

-- 𝐈𝐧𝐬𝐞𝐫𝐭 𝐝𝐚𝐭𝐚 𝐢𝐧𝐭𝐨 𝐭𝐚𝐛𝐥𝐞𝟐

INSERT INTO table2 (id) VALUES
(NULL),
(NULL),
(NULL);


-- 𝐃𝐢𝐬𝐩𝐥𝐚𝐲 𝐭𝐚𝐛𝐥𝐞𝟏

SELECT * FROM table1;

-- 𝐃𝐢𝐬𝐩𝐥𝐚𝐲 𝐭𝐚𝐛𝐥𝐞𝟐

SELECT * FROM table2;

-- 𝐈𝐧𝐧𝐞𝐫 𝐉𝐨𝐢𝐧 (𝐈𝐍𝐍𝐄𝐑 𝐉𝐎𝐈𝐍)

SELECT table1.id AS table1_id, table2.id AS table2_id
FROM table1
INNER JOIN table2 ON table1.id = table2.id;

-- 𝐋𝐞𝐟𝐭 𝐉𝐨𝐢𝐧 (𝐋𝐄𝐅𝐓 𝐎𝐔𝐓𝐄𝐑 𝐉𝐎𝐈𝐍)

SELECT table1.id AS table1_id, table2.id AS table2_id
FROM table1
LEFT JOIN table2 ON table1.id = table2.id; --4 rows

-- 𝐑𝐢𝐠𝐡𝐭 𝐉𝐨𝐢𝐧 (𝐑𝐈𝐆𝐇𝐓 𝐎𝐔𝐓𝐄𝐑 𝐉𝐎𝐈𝐍)

SELECT table1.id AS table1_id, table2.id AS table2_id
FROM table1
RIGHT JOIN table2 ON table1.id = table2.id; --not supported in online 

-- 𝐂𝐫𝐨𝐬𝐬 𝐉𝐨𝐢𝐧 (𝐂𝐑𝐎𝐒𝐒 𝐉𝐎𝐈𝐍)

SELECT table1.id AS table1_id, table2.id AS table2_id
FROM table1
CROSS JOIN table2; --multiple empty rows its was showing 

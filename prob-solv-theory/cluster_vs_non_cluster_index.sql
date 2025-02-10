Clustered vs Non cluster index in SQL

1. Clustered Index ▶ 

Definition: A clustered index determines the physical order of data in a table. The table rows are stored in the same order as the index.
Table Organization: The data is physically sorted based on the column(s) defined in the clustered index.
Number of Clustered Indexes: A table can only have one clustered index because the rows can only be stored in one physical order.
Performance: Since the data is physically stored in order, querying data ranges or retrieving data in an ordered manner (e.g., ORDER BY) is very efficient with a clustered index.
Primary Key: In most databases, the primary key by default creates a clustered index unless explicitly specified otherwise.
Storage: The data itself is the index in a clustered index, meaning there’s no separate structure for the clustered index and the data.
Insert/Update/Delete Impact: Since the physical order of data is maintained, inserting, updating, or deleting rows can be more costly due to potential reordering of rows.

2. Non-Clustered Index ▶ 

Definition: A non-clustered index is a separate structure from the data and contains a sorted list of index keys along with pointers to the actual rows in the table.
Table Organization: The data is not physically ordered based on the non-clustered index. Instead, the index contains a sorted list of keys that point to the location of the corresponding data.
Number of Non-Clustered Indexes: A table can have multiple non-clustered indexes (depending on the database system), allowing for different ways to quickly retrieve data.
Performance: Non-clustered indexes are great for speeding up lookups that do not affect the physical ordering of data (e.g., searching for a specific value or small sets of data). However, they are less efficient for range queries compared to clustered indexes.
Storage: A non-clustered index takes up additional storage because it creates a separate data structure to store the index key and pointers to the actual table rows.
Insert/Update/Delete Impact: Modifying data in a table requires updates to the non-clustered indexes, but since the physical order of data is not affected, the overhead is generally lower than with clustered indexes.
Include Clause: Non-clustered indexes can have included columns, meaning certain columns can be added to the index to avoid looking them up separately, enhancing performance.

When to Use Which:

Clustered Index:
Use on columns that are frequently used for sorting or range-based queries.
Typically used for primary keys or columns with unique values (e.g., ID or OrderDate).
Non-Clustered Index:
Use on columns that are frequently used in WHERE clauses for exact match lookups (e.g., searching by Email, LastName).
Useful when you want multiple ways to quickly query the data, without altering the physical data order.


In SQL Server, indexes are used to improve the speed of data retrieval. The two most common types of indexes are **Clustered Index** and **Non-Clustered Index**. Here's a detailed explanation of the differences between them:

### 1. **Clustered Index**:
A **Clustered Index** sorts and stores the rows of data in the table based on the index key (the column or columns on which the index is created). There can only be **one clustered index** per table because the table's rows are physically stored in this order.

#### Characteristics:
- **Physical ordering**: The data rows are stored on disk in the same order as the index.
- **Only one per table**: Since the physical order of the rows is determined by the clustered index, there can only be one clustered index on a table.
- **Fast data retrieval**: Because the data is stored in the order of the index, it's efficient for range queries and lookups that align with the index.
- **Primary key**: By default, a primary key constraint creates a clustered index.

#### Example:
```sql
CREATE CLUSTERED INDEX idx_EmployeeID
ON Employees(EmployeeID);
```
Here, the `EmployeeID` column is used to create a clustered index, and the rows in the `Employees` table will be stored in ascending order of `EmployeeID`.

### 2. **Non-Clustered Index**:
A **Non-Clustered Index** creates a separate structure that stores the index key and a pointer (reference) to the actual data row. This allows for **multiple non-clustered indexes** on a table. The data in the table is not sorted according to the non-clustered index.

#### Characteristics:
- **Logical ordering**: The data is not physically rearranged in the table. The index contains a pointer to the actual data row.
- **Multiple per table**: A table can have multiple non-clustered indexes (up to 999 in SQL Server).
- **More flexible**: You can create indexes on different columns or combinations of columns to optimize different types of queries.
- **Slightly slower than clustered**: Since the data is not stored in the order of the index, extra lookups (called "bookmark lookups") are required to retrieve the data rows.

#### Example:
```sql
CREATE NONCLUSTERED INDEX idx_LastName
ON Employees(LastName);
```
Here, the `LastName` column is used to create a non-clustered index, which helps to quickly search for records based on the last name.

### Key Differences Between Clustered and Non-Clustered Indexes:

| Feature                 | Clustered Index                                      | Non-Clustered Index                        |
|-------------------------|------------------------------------------------------|--------------------------------------------|
| **Number per table**    | Only 1 per table                                     | Multiple per table (up to 999)             |
| **Data storage**        | Stores the actual data rows in the index             | Stores only pointers to the data rows      |
| **Physical order**      | Rows are physically stored in the order of the index | No effect on physical storage order         |
| **Data access**         | Faster for retrieving rows in the index order        | Slower compared to clustered due to lookups|
| **Use case**            | Optimal for range queries and primary keys           | Best for searching by columns other than the clustered index |

### Example Scenario:
- **Clustered Index**: You create a clustered index on the `OrderID` column in an `Orders` table. The table is now stored in ascending order of `OrderID`, and any queries that involve searching by `OrderID` will be fast.
- **Non-Clustered Index**: You add a non-clustered index on the `CustomerID` column in the same `Orders` table. Now, SQL Server can quickly find orders by `CustomerID`, but it will still have to follow pointers to the actual rows since they are ordered by `OrderID`.

### Visual Representation:
- **Clustered Index**: Think of it as a phonebook where names are listed alphabetically, and you can quickly find names and phone numbers because they are stored in alphabetical order.
- **Non-Clustered Index**: Think of it as an index at the back of a textbook. You can find the topic you are looking for, but you still need to go to the correct page in the book to read the content.
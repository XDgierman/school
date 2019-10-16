--creatubg database
CREATE DATABASE databaseName;
--using database
USE databaseName;
--deleting database
DROP DATABASE databaseName;

--creating tables
CREATE TABLE tableName(
    columnName1 columnType [atributes],
    columnName2 columnType [atributes],
    ...
    columnNameN columnType [atributes]
)
--you can't define the size for int like in MySQL, for example int(3)
--deleting table
DROP TABLE tableName;

--creating database schema
CREATE SCHEMA schemaName;

--showing current schemas
SELECT QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name)
AS SchemaTabele
FROM sys.tables;

--assigning object to schemas
CREATE TABLE schemaName.tableName (
    ... tableDefinition ...
);

--transfering objects between schemas
ALTER SCHEMA schemaName2 TRANSFER schemaName1.object;

--deleting schema
--schema before deletion needs to be empty!
DROP SCHEMA schemaName;

--schema ownership and authorization
CREATE SCHEMA schemaName AUTHORIZATION owner;

--default schema
SELECT SCHEMA_NAME() AS DEFAULTSCHEMA;

--defining default schema for user
DEFAULT_SCHEMA CREATE userName;

--changing default schema for user
ALTER USER userName WITH DEFAULT_SCHEMA = schemaName;

--showing table project
[exec] SP_HELP tableName;
[exec] SP_COLUMNS tableName;

--altering table structure
ALTER TABLE tableName ADD columnName atribute;
ALTER TABLE tableName DROP COLUMN columnName;

--batch seperator GO
USE databaseName;
GO
ALTER TABLE tableName ADD columnName atribute;
ALTER TABLE tableName DROP COLUMN columnName;

--column attributes
--PRIMARY KEY
CREATE TABLE tableName(
    columnName columnType NOT NULL PRIMARY KEY
);
ALTER TABLE tableName ADD PRIMARY KEY(columnName);

--IDENTITY
CREATE TABLE tableName(
    columnName columnType IDENTITY NOT NULL PRIMARY KEY
);
CREATE TABLE tableName(
    columnName columnType IDENTITY (X,Y) NOT NULL PRIMARY KEY
);
--X means first value added to column, and Y is amount of increment to another value.
--default values are (1,1)
--identity can be turned on, or off
--while off, the value has to be inserted manually
SET INDENTITY_INSERT tableName ON;
SET INDENTITY_INSERT tableName OFF;

--DEFAULT
CREATE TABLE tableName(
    columnName columnType NOT NULL DEFAULT 'defaultValue',
);
--UNIQUE
CREATE TABLE tableName(
    columnName columnType UNIQUE NOT NULL,
);
--logic statement CHECK
CREATE TABLE tableName(
    columnName columnType CHECK(logicStatement),
);

--DML language
--INSERT
INSERT INTO tableName
VALUES (listOfValues);
--if we want to skip collumns we use this command
INSERT INTO tableName (columnList)
VALUES (listOfValues);
--BULK INSERT
--bulk insert grabs data from files with CSV and TXT extension
BULK INSERT tableName
FROM ('fileLocation\file.fileExtension')
with(
    FIELDTERMINATOR='fieldTerminator',
    ROWTERMINATOR='rowTerminator'
);
--UPDATE
UPDATE tableName
SET columnName = value
[WHERE statement];
--DELETE
DELETE FROM tableName
WHERE statement;
--TRUNCATE
TRUNCATE tableName;

--SELECT instruction, values in [] are optional
SELECT [DISTINCT] [TOP n[PERCENT]]
{
    columnName | expression | IDENTITYCOL | ROWGUIDCOL
    [[AS] columnName]
}
[,... n]
FROM tableName [JOIN][joinedTableName][ON][joiningWarrants]
[WHERE][filterWarrants]
[GROUP BY][groupingColumns]
[HAVING][filterWarrants]
[ORDER BY][columnName];
--DISTINCT removes duplicates from view
--ORDER BY sorts the view by the applied value
SELECT columnName
FROM tableName
ORDER BY columnName;
--it can be influenced by DESC and ASC to sort descending or ascending
--TOP limits shown records to the limit set by value and the top records
--TOP [value] WITH TIES shows the TOP record and other records with the same value as the top record when using ORDER BY
SELECT TOP 5 columnName
FROM tableName;

SELECT TOP 50 PERCENT columnName
FROM tableName;

SELECT TOP 1 WITH TIES columnName
FROM tableName
ORDER BY columnName;

--WHERE is a filter, that uses logic variables
SELECT columnName
FROM tableName
WHERE filterWarrants;
--WHERE can use AND, OR, [NOT] LIKE, [NOT] IN, BETWEEN
--text in WHERE has to be in ''

--SELECT INTO copies data to other tables, and if not exists, makes one
SELECT columnName1, columnName2, ... columnNameN INTO targetTable
FROM sourceTable;

--AS creates aliases for columns and tables
SELECT columnName AS alias
FROM tableName;
SELECT columnName AS 'alias with space'
FROM tableName;

--Agregating functions:
--COUNT, SUM, AVG, MAX, MIN
--example:
SELECT 'Record count', COUNT(*)
FROM tableName;
SELECT 'Distinct record count', COUNT(DISTINCT columnName)
FROM tableName;

--grouping funcions example:
SELECT columnName, count(primaryKey)
FROM tableName
GROUP BY columnName;
--on grouped records WHERE doesn't work, for that we have HAVING
SELECT columnName, count(primaryKey)
FROM tableName
GROUP BY columnName
HAVING filterWarrants;

--JOIN / INNER JOIN connects tables if key columns have the same values
--those are inside connections, that collect only chosen data
SELECT tableName1.columnName1, tableName2.columnName2
FROM tableName1 INNER JOIN tableName2 ON tableName1.primaryKey = tableName2.foreignKey;
--in case of three tables and more tables
SELECT tableName1.columnName1, tableName2.columnName2, tableName3.columnName3
FROM(tableName1 INNER JOIN tableName2 ON tableName1.primaryKey = tableName2.foreignKey)
INNER JOIN tableName3 ON tableName2.primaryKey = tableName3.foreignKey;

--outer connections deliver all collumn data depending on side
--LEFT OUTER JOIN collects all data from first collumn, RIGHT OUTER JOIN collects data from second collumn
--FULL OUTER JOIN collects all data from both collumns, even the unnecessary data
--examples:
SELECT tableName1.columnName1, tableName2.columnName2
FROM tableName1 LEFT OUTER JOIN tableName2 ON tableName1.primaryKey = tableName2.foreignKey;

SELECT tableName1.columnName1, tableName2.columnName2
FROM tableName1 RIGHT OUTER JOIN tableName2 ON tableName1.primaryKey = tableName2.foreignKey;

SELECT tableName1.columnName1, tableName2.columnName2
FROM tableName1 FULL OUTER JOIN tableName2 ON tableName1.primaryKey = tableName2.foreignKey;

--CROSS JOIN of two tables makes table being Cartesian multiplication of those tables.
--the amount of data is equal to muliplication of data in both of tables
SELECT tableName1.columnName1, tableName2.columnName2
FROM tableName1 CROSS JOIN tableName2;

--joining table with itself
--operation of autojoining results in Cartesian table of the table itself basing on multiplication of itself
--we use it on two possibilities:
--* there is a need to make diffrent aliases for joined table and in querry consequently writing alias name than tableName
--* each record, in which values of joining atribute are equal, will be added to the result of joinng, which ends with duplicates of records
SELECT alias1.columnName1, alias1.columnName2
FROM tableName1 AS alias1 CROSS JOIN tableName1 AS alias2
WHERE alias1.columnName3 = alias2.columnName3;

--MS SQL and database integrity
--Defining foreign key
--basic query:
CONSTRAINT keyName FOREIGN KEY(foreignKey)
REFERENCES tableName(primaryKey);
--if CONSTRAINT is absent, foreign key will get name given by DBMS (database management system)
--example
CREATE TABLE tableName(
    primaryKey INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
    columnName DATE NOT NULL,
    foreignKey1 INT,
    FOREIGN KEY(foreignKey1) REFERENCES tableName1(primaryKey1),
    foreignKey2 INT,
    FOREIGN KEY(foreignKey2) REFERENCES tableName2(primaryKey2)
)
--if table exists, but doesn't have foreign keys, we can add them using ALTER TABLE
ALTER TABLE tableName ADD foreignKey1 INT
REFERENCES tableName1(primaryKey1);
--naming foreign key for created table
ALTER TABLE tableName ADD CONSTRAINT foreignKeyName
FOREIGN KEY(foreignKey1) REFERENCES tableName1(primaryKey1),
--deleting existing foreign key from table
ALTER TABLE tabela DROP CONSTRAINT foreignKeyName;

--cascade update and deletion of data
--cascade updating and deleting is defined in ON UPDATE/ON DELETE with values:
--* NO ACTION - data will be not modified in joined tables
--* CASCADE - data will be modified in all joined tables
--* SET NULL - modified values of primary key may be changed with NULL value in joined colums of foreign key
--* SET DEFAULT - modified values of primary key may be changed with default values in joined column of foreign key default value
--example:
ALTER TABLE tableName1 ADD FOREIGN KEY(foreignKey2)
REFERENCES tableName2(primaryKey2) ON DELETE CASCADE;

--UNION
--this instruction makes available to join two or more SELECT
--with condition that the result has the same amount of columns and types of columns

SELECT ...
FROM ...
UNION
SELECT ...
FROM ...;
--instruction forces removal of all duplicated data
--to show all data we use instruction UNION ALL
--union can be used as exchange for IN or OR in queries:
SELECT columnName
FROM tableName
WHERE columnName1 = 'value1' OR columnName1 = 'value2';

--EXCEPT
--this instruction shows data that are in first SELECT, but doesn't appear in second SELECT
SELECT ...
FROM ...
EXCEPT
SELECT ...
FROM ...;
--mirror instruction for EXCEPT is INTERSECT, that shows data that are in both SELECT, but not distinct ones
SELECT ...
FROM ...
INTERSECT
SELECT ...
FROM ...;

--SUBQUERIES
--subqueries are queries that are inserted into other queries
--SUBQUERIES in WHERE
--ex.1:
SELECT columnName
FROM tableName
WHERE columnName1 > (SELECT AVG(columnName1) FROM tableName);
--ex.2:
SELECT columnName
FROM tableName
WHERE columnName1 IN (SELECT columnName1 FROM tableName1
WHERE columnName2 < value);
--ex.3:
SELECT columnName
FROM tableName
WHERE columnName1 = (SELECT MAX(columnName1) FROM tableName);

--SUBQUERIES in FROM
--result of the subquery can be an amount of table data, rom that it can be a source of data for other query
--example:
SELECT *
FROM (SELECT columnName
FROM tableName
WHERE columnName1 > 1000) AS result;

--operators in subqueries
--IN - checks if at least one value from list is true to condition
--EXISTS - returns true, when subquery returns data, if not - returns false
--ANY - checks values of any data returned from subquery
--SOME - acts the same as ANY
--ALL - checks values of all values returned by subquerry

--EXISTS
SELECT *
FROM tableName1
WHERE [NOT] EXISTS
(SELECT * FROM tableName2 WHERE tableName1.primaryKey1 = tableName2.foreignKey1);

--ANY and SOME
--operator is true, if at least one condition is true for the value
SELECT columnName1, columnName2
FROM tableName
WHERE columnName3 > ANY
(SELECT PlacaPracownika FROM tableName
WHERE columnNameN = 'value');

--ALL
--operator is true, when all conditions are true for the value

--connected subqueries (corelled)
--these specific subqueries the query is questioning to the result of foreign query
--in that case subquery is perofred for each value returned by foreign query and its checked
--ex:
SELECT columnName1, columnName2, columnName3
FROM tableName1
WHERE columnName2 > (SELECT AVG(columnName2) FROM tableName1
WHERE columnName2 = tableName1.columnName2);

--Views
--Views (perspectives) in T-SQL are created using:
CREATE VIEW vName AS
    SELECT ...;
--ex:
CREATE VIEW vName AS
    SELECT columnName1, columnName2
    FROM tableName;
--created view can be used as normal table
SELECT *
FROM vName;
--in views you cannot use ORDER BY, unless while creation of view TOP was used

--removing views:
DROP VIEV vName;

--altering views:
ALTER VIEW vName AS
    SELECT ...;
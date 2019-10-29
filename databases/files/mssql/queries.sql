--creating database
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
--

/*
X means first value added to column, and Y is amount of increment to another value.
default values are (1,1)
identity can be turned on, or off
while off, the value has to be inserted manually
*/
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
/*
it can be influenced by DESC and ASC to sort descending or ascending
TOP limits shown records to the limit set by value and the top records
TOP [value] WITH TIES shows the TOP record and other records with the same value as the top record when using ORDER BY
*/
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
/*
outer connections deliver all collumn data depending on side
LEFT OUTER JOIN collects all data from first collumn, RIGHT OUTER JOIN collects data from second collumn
FULL OUTER JOIN collects all data from both collumns, even the unnecessary data
examples:
*/
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
/*
joining table with itself
operation of autojoining results in Cartesian table of the table itself basing on multiplication of itself
we use it on two possibilities:
* there is a need to make diffrent aliases for joined table and in querry consequently writing alias name than tableName
* each record, in which values of joining atribute are equal, will be added to the result of joinng, which ends with duplicates of records
*/
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

/*
cascade update and deletion of data
cascade updating and deleting is defined in ON UPDATE/ON DELETE with values:
* NO ACTION - data will be not modified in joined tables
* CASCADE - data will be modified in all joined tables
* SET NULL - modified values of primary key may be changed with NULL value in joined colums of foreign key
* SET DEFAULT - modified values of primary key may be changed with default values in joined column of foreign key default value
example:
*/
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
/*
operators in subqueries
IN - checks if at least one value from list is true to condition
EXISTS - returns true, when subquery returns data, if not - returns false
ANY - checks values of any data returned from subquery
SOME - acts the same as ANY
ALL - checks values of all values returned by subquerry
*/
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
(SELECT columnName3 FROM tableName
WHERE columnNameN = 'value');

--ALL
--operator is true, when all conditions are true for the value
/*
connected subqueries (corelled)
these specific subqueries the query is questioning to the result of foreign query
in that case subquery is perofred for each value returned by foreign query and its checked
ex:
*/
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

--index
--while creating the table
CREATE TABLE tableName(
    columnName dataType,
    columnName dataType,
    ...
    columnName dataType INDEX indexName
);
--in case of unique
CREATE TABLE tableName(
    columnName dataType,
    columnName dataType,
    ...
    columnName dataType,
    CONSTRAINT indexName UNIQUE(columnName)
);
--for existing table
CREATE INDEX indexName ON tableName (columnName);
--in case of unique
CREATE UNIQUE INDEX indexName ON tableName (columnName);
--index removal is made using DROP INDEX
DROP INDEX tableName.indexName;

--server variables

--user variables
--user variables(local) are starting with @ sign, and global are set using @@
--user variables are declared using DECLARE statement
DECLARE @variableName dataType;
--setting values to variables
SELECT @variableName = "value";
SET @variableName = "value";
--the diffrence between SET and SELECT, is that SET only applies values to only one variable, while SELECT applies to many divided by ','
--showing variable value
SELECT @variableName AS alias;
--in variables we can set up queries to be agregating
DECLARE @howManyLines INT;
SELECT @howManyLines = COUNT(*) from tableName;
SELECT @howManyLines AS 'Number of lines in tableName';

--system variables
--system variables, aka global, are set by @@ chars
--system variable examples
--@@ERROR - returns number of last error (0=no errors)
--@@FETCH_STATUS - returns if cursor loaded the line (returns 0, if true)
--@@IDENTITY - returns last generated IDENTITY value( usefil, when we want to use the ID inserted by INSERT to line in table)
--@@ROWCOUNT - returns number of lines, on which SQL query worked
--@@TRANCOUNT - returns number of open transactions
--@@VERSION - returns version of SQL Server
--@@TOTAL_ERRORS - variable defining number of all errors, that happned since beggining of current connection to database
--@@TOTAL_READ - variable containing number of disc operations performed since beggining of current connection to database
SELECT * FROM tableName
SELECT @@ROWCOUNT AS 'Row count';
SELECT @@VERSION AS 'Server version';

--catching errors
--function RAISERROR
--this function allows user to report errors
RAISERROR('text',weight,status);
--weight argument states error type and can take integer values from 1 to 25
--1 to 10 are information cominicates
--11 to 16 are errors that user can fix
--17 to 18 are severe errors
--19 to 25 are severe errors, which fixing is available only for admins, while errors with weight 20-25 are critical errors, which drop connection and save the comunicate within binary log
--whilst status argument can take integer value from 1 to 255. values negative or bigger than 255 will generate the error.
--example:
DECLARE @variable1 FLOAT, @variable2 FLOAT;
SET @variable1 = 100;
SET @variable2 = 10;
IF @variable2 = 0
    RAISERROR('Divitation by 0!',14,1)
ELSE
    SELECT @variable1 / @variable2 AS "Divitation result";
--this also works with @@ERROR
DECLARE @variable1 FLOAT, @variable2 FLOAT, @variable3 FLOAT;
SET @variable1 = 100;
SET @variable2 = 10;
SELECT @variable3 = @variable1 / @variable2;
IF @@ERROR <> 0
    RAISERROR('Divitation by 0!',14,1)
ELSE
    SELECT @variable3 AS "Divitation result";
--TRY/CATCH
--in TRY block we can perfrom querry that ganenerate an error
--CATCH block is the response for TRY error
--the faulty code wont be stopped, for that whe have to use a transaction
BEGIN TRY
    ...
END TRY
BEGIN CATCH
    ...
END cATCH;
--example:
DECLARE @variable INT;
BEGIN TRY
    SET @variable = 1000
    PRINT 'This number is in INT type'
END TRY
BEGIN CATCH
    PRINT 'This number is NOT in INT type'
END cATCH;
--example 2:
DECLARE @variable1 FLOAT, @variable2 FLOAT, @variable3 FLOAT;
SET @variable1 = 100;
SET @variable2 = 0;
BEGIN TRY
    SELECT @variable3 = @variable1 / @variable2
    SELECT @variable3 AS "Divitation result"
END TRY
BEGIN CATCH
  PRINT 'Error! Divitation by 0!'
END cATCH;

--logical
--IF / ELSE
--just like in other coding languages
IF logicStatement query;
IF logicStatement
    query1;
ELSE
    query2;
--example
DECLARE @variable INT;
SELECT @variable = COUNT(*) FROM tableName;
IF @variable>10
    SELECT TOP 6 * FROM tableName;
ELSE
    SELECT TOP 6 * FROM tableName;
--to perform more queries, they need to begin and end on BEGIN/END
IF logicStatement
    BEGIN
        query1;
        query2;
    END
ELSE
    BEGIN
        query3;
        query4;
    END

--CASE
--case adapts the variable or expression to given values, and then performs given instructions
--it also can check logical expression and perform instructions
CASE
    WHEN statement1
    THEN query1
    WHEN statement2
    THEN query2
    ...
    [ELSE query3]
END;
--example
SELECT columnName1, columnName2,
    CASE
        WHEN columnName3 < 1000 THEN 'Low'
        WHEN columnName3 BETWEEN 1000 AND 2000 THEN 'Medium'
    ELSE
        'High'
    END
    AS 'Value'
FROM tableName1;

--WHILE
--WHILE performs an fragment of code till until reaching the declared value
--ex.
DECLARE @i INTEGER
SET @i = 0
WHILE @i < 10
    BEGIN
        SET @i += 1
        PRINT 'Repeat nr: ' + CAST(@i AS CHAR)
    END
--ex. reading table
DECLARE @i INT, @j INT, @name NVARCHAR(30)
SET @i = 0
SELECT @j = COUNT(*) FROM tableName
WHILE @i < @j
    BEGIN
        SET @i += 1
        SELECT @name = columnName FROM tableName WHERE columnID = @i;
        PRINT @name
    END
--ex. returning records
DECLARE @i INT, @j INT
SET @i = 0
SELECT @j = COUNT(*) FROM tableName
WHILE @i < @j
    BEGIN
        SET @i += 1
        SELECT * FROM tableName WHERE columnID = @i;
    END
--WHILE can be controlled using CONTINUE and BREAK. First one will skip further part of code code, while the second will stop it
--ex.
DECLARE @i INT, @j INT
SET @i = 0
SELECT @j = COUNT(*) FROM tableName
WHILE @i < @j
    BEGIN
        SET @i += 1
            IF @i % 2 = 0 CONTINUE
        SELECT * FROM tableName WHERE columnID = @i;
    END

DECLARE @variable1 INT, @variable2 INT, @i INT;
SELECT @variable2 = COUNT(*) FROM tableName;
SET @i = 1;
WHILE @i <= @variable2
BEGIN
    SELECT @variable1 = columnName FROM tableName WHERE columnID = @i;
    IF @variable1 < 1500
        BEGIN
            UPDATE tableName SET columnname = columnname + 200 WHERE columnID = @i
            PRINT 'In current record the value was rised by 200'
        END
    ELSE
        BEGIN
            UPDATE tableName SET columnname = columnname + 10 WHERE columnID = @i
            PRINT 'In current record the value was rised by 10'
        END
    SET @i = @i+1
END
--CTE (common table expression)
--cte allows declaring temporary tables to use
WITH tableName[(columnName1,columnName2,...,columnNameN)]
AS
(query code)
--ex.
WITH CTE_TableName AS
(SELECT columnID, columnName1, columnName2, columnName3 FROM tableName);
SELECT * FROM CTE_TableName
WHERE columnName3 > '1990-01-01';

--CTE can be used as definition of a View, as a part of SELECT query

WITH CTE_TableName (columnName1, columnID1, columnName2) AS
(SELECT columnID2, columnName1, columnName2
FROM tableName2 INNER JOIN tableName1
ON tableName2.columnID1=tableName1.columnID1)
SELECT columnName2, COUNT(columnID1) AS 'Number of values'
FROM CTE_TableName
GROUP BY columnName2
ORDER BY COUNT(columnID1);

--temporary tables
--temprorary tables allows to gather data for one query
--the table exists until the end of connection session
CREATE TABLE #tableName(
    table structure definition
);
--using SELECT
SELECT columnName1, columnName2, ... , columnNameN
INTO #tableName
FROM sourceTable (sourceColumn);

--ex.
SELECT temporaryColumn1, COUNT(sourceTable1.sourceColumnID) AS temporaryColumn2
INTO #temporaryTable
FROM sourceTable1 INNER JOIN sourceTable2
ON sourceTable1.sourceColumnID = sourceTable2.sourceColumnID
GROUP BY sourceTable2.sourceColumn
ORDER BY COUNT(sourceTable1.sourceColumnID);
--showing data from temporary table
SELECT *
FROM #temporaryTable
WHERE temporaryColumn2 > 1;
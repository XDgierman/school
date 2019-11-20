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

--IDENTITY (auto increment)
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

--Procedures
--Procedures are structures, that contain instructions to perform (nor SQL querry), and their definition is stored on server
--Procedure structure is made by query:
CREATE PROCEDURE procedureName [(@arg1 TYPE, @arg2 type...)] AS
BEGIN
    --... procedure code...
END;

--procedure without arguments
CREATE PROCEDURE procedureName AS
BEGIN
    SELECT columnName1 + ' ' + columnName2 AS alias1,
    columnName3 + ' ' + columnName4 + ' ' + columnName5 AS 'alias2'
    FROM tableName1;
END;

--procedure with arguments
CREATE PROCEDURE procedureName (@arg1 MONEY) AS
BEGIN
    SELECT *
    FROM tableName1
    WHERE tableName1 < @arg1;
END;

CREATE PROCEDURE procedureName (@arg1 VARCHAR(30), @arg2 MONEY) AS
BEGIN
    SELECT *
    FROM tableName1 INNER JOIN tableName2
    ON tableName1.columnID1 = tableName2.columnID1
    WHERE tableName1.columnName1 < @arg2
    AND tableName2.columnName2 = @arg1;
END;

--executing procetures
EXEC procedureName [arg1Value, arg2Value ...];

--modyfing and removing procedures
ALTER PROCEDURE procedureName [(@arg1 TYPE, @arg2 TYPE ...)] AS
BEGIN
    ... procedure code ...;
END;

DROP PROCEDURE procedureName;

--Function
--Function is a structure, that contains series of instructions to execute, and on their basis returns the result
--performed instructions may differ basing on arguments given at beggining of function
--Result of function has dual form - single value (scalar) or table
--sclar values being a result of function can be writen to variables, nor arguments used by functions or procedures
--Functions are created using CREATE FUNCTION:
CREATE FUNCTION functionName() [(@arg1 TYPE, @arg2 TYPE ...)]
RETURNS resultType AS
BEGIN
    ... function code ...
    RETURN result
END;

--functions returning scalar values
--function without arguments
CREATE FUNCTION functionName()
RETURNS INT AS
BEGIN
    RETURN (SELECT COUNT(*) FROM tableName)
END;

--function with arguments
CREATE FUNCTION functionName(@arg1 DATE, @arg2 INT)
RETURNS DATE AS
BEGIN
    RETURN DATEADD(month, @arg2, @arg1)
END;

CREATE FUNCTION functionName(@arg1 INT, @arg2 MONEY)
RETURNS varchar(10) AS
BEGIN
    DECLARE @variable MONEY;
    SET @variable = @arg1 * @arg2;
    RETURN (CAST(@variable AS varchar(10)));
END;

--executing functions
--functions are executed by writing database scheme (default dbo) and their name
--ex.
SELECT 'Value', dbo.functionName();
SELECT 'Value', dbo.functionName(value1,value2) AS 'Result';

--creating function returning table values
--diffrence between scalar and tabular functions is that the return always returns SQL querry
CREATE FUNCTION functionName(@arg TYPE) RETURNS TABLE AS
RETURN(
    SELECT * FROM tableName WHERE columnName = @arg
);
--execution
SELECT *
FROM dbo.functionName('Argument');

--modyfying and removing functions

ALTER FUNCTION functionName [(@arg1 TYPE, @arg2 TYPE ...)]
RETURNS resultType AS
BEGIN
    ... function code ...
    RETURN result
END;

DROP FUNCTION schemaName.functionName;
/*
Transactions
Transaction is made from 3 steps
beggining - after beggining of transactions all further queries are taken as a part of instrucion, then grouping it till closure or rollback of transaction
performing
closure or rollback - if all oprerations of transaction been made succesfull, the changes made by instrucions will be permanently saved in database system
if not, the database will rollback all the changes made by transaction

ACID
transactions are obeying rules of ACID:
* atomicity - transaction can be done in full or neighter;
* consistency - database status always shows the status before or after transaction.
queries performed on system during transaction has to show status before transaction, not in between.
if database is consistent before transaction, it has to be consistent after;
* isolation - transaction is performad independently from other operation, counting other transactions;
* durability - durability guarantees, that the efects of applied transactions will be saved on database, even while server malfunction;

Ways of performing transactions
There are three ways of performing transactions:

* Autocommit transactions
Each individual statement is a transaction.
* Explicit transactions
Each transaction is explicitly started with the BEGIN TRANSACTION statement and explicitly ended with a COMMIT or ROLLBACK statement.
* Implicit transactions
A new transaction is implicitly started when the prior transaction completes, but each transaction is explicitly completed with a COMMIT or ROLLBACK statement.
*/

--Explicit transactions
--those transactions are made when we declare the need to perform the query or insturction block in BEGIN TRANSACTION
--this transcation always has to end with COMMIT | ROLLBACK

BEGIN TRANSACTION
    sql query 1;
    sql query 2;
COMMIT | ROLLBACK

--example
BEGIN TRANSACTION
UPDATE tableName
SET columnName = columnName - columnName * 0.1
WHERE columnName > 1500
IF @@ERROR <> 0
    BEGIN
        RAISERROR('Error! The operation has failed!',16,-1)
        ROLLBACK;
    END
UPDATE tableName
SET columnName = columnName + columnName * 0.1
WHERE columnName <= 1500
IF @@ERROR <> 0
    BEGIN
        RAISERROR('Error! The operation has failed!',16,-1)
        ROLLBACK;
    END
COMMIT;

--transaction can be performed, if some conditions were met in database.
--example

DECLARE @variable INTEGER
SELECT @variable = columnID1 FROM tableName2
INNER JOIN tableName1 ON tableName2.foreignID = tableName1.foreignID
WHERE tableName1.columnName1 = 'Value1' AND tableName2.columnName2 = 'Value2'
IF @variable IS NOT NULL
    BEGIN  
    BEGIN TRANSACTION
        DELETE FROM tableName1 WHERE columnID1 = @variable
        IF @@ERROR <> 0
        BEGIN
            RAISERROR('Error! The operation has failed!',16,-1)
            ROLLBACK;
        END
        INSERT INTO tableName1 (columnName1, columnID2, foreignID, columnName3
        VALUES ('Value3', 1, 4, 1500)
		IF @@ERROR <> 0
        BEGIN
            RAISERROR('Error! The operation has failed!',16,-1)
            ROLLBACK;
        END
    COMMIT;
	END
ELSE
	PRINT 'In database there is no values like that!';

--global variable @@TRANCOUNT returns number of currently opened transactions in system
--ex
SELECT @@TRANCOUNT AS 'Number of opened transactions'
UPDATE tableName SET columnName = '2327665'
WHERE columnID = 3
SELECT @@TRANCOUNT AS 'Number of opened transactions'

--IMPLICIT

SET IMPLICIT_TRANSACTIONS ON

--this command allows to turn the server into IMPLICIT mode
--in this mode the DML and DDL transactions will be done, but they still need to be authorised or declined
--after turning implicit mode, if we forget about COMMIT or ROLLBACK, the active transaction will stay open, and will block the data in database!

SET IMPLICIT_TRANSACTIONS ON
SELECT @@TRANCOUNT AS 'Number of opened transactions'
UPDATE tableName SET columnName = '3333333'
WHERE columnID = 4
SELECT @@TRANCOUNT AS 'Number of opened transactions'

--this code shall return that there is an opened transaction
--after modyfying it to this state:

SET IMPLICIT_TRANSACTIONS ON
SELECT @@TRANCOUNT AS 'Number of opened transactions'
UPDATE tableName SET columnName = '3333333'
WHERE columnID = 4
COMMIT;
SELECT @@TRANCOUNT AS 'Number of opened transactions'

--the count shall be seen as 0
--to return to default AUTOCOMMIT state, we need to perform SQL query:

SET IMPLICIT_TRANSACTIONS OFF

--Nested Transaction
--t-sql allows for nested transactions, like while you have one big transaction, you can perform other smaller transactions inside
BEGIN TRANSACTION
    sql query 1;
    sql query 2;
    BEGIN TRANSACTION
        sql query 1.1;
        sql query 2.1;
    COMMIT | ROLLBACK
    sql query 3;
    sql query 4;
COMMIT | ROLLBACK

--nesting transactions works kind of defferently than you might think:
--* performing new transaction from level of existing transaction (external transaction)
--will activate another transaction in system (internal transaction);
--* COMMIT command shall close the transaction from the level it was performed, so if it was from internal level,
--internal shall be closed, but external will still run. it's impossible to close external transaction before internal;
--* ROLLBACK command shall decline all transactions, no matter on which level it was performed, was it internal or external

--ex:
BEGIN TRANSACTION
    PRINT 'Transaction 1 active! Current amount of active transactions ' + CAST(@@TRANCOUNT AS VARCHAR);
    DECLARE @variable INTEGER;
    INSERT INTO tableName1 (columnName1, columnID1, columnID2) VALUES ('2015-11-12', 3, 5);
    SET @variable = @@IDENTITY;
    BEGIN TRANSACTION
        PRINT 'Transaction 2 active! Current amount of active transactions ' + CAST(@@TRANCOUNT AS VARCHAR);
        INSERT INTO tableName2 VALUES (@variable, 4, 1, 360);
    COMMIT;
    PRINT 'Transaction 2 commited! Current amount of active transactions ' + CAST(@@TRANCOUNT AS VARCHAR);
COMMIT;

--Transaction save points
--these points help find in which point of transaction ROLLBACK operation was performed
--in case of ROLLBACK, all changes will be reverted to point of save point
--if there are more save points, you can revert to any of them, but not to points after returned savepoint
--ex: There are points P1, P2, P3. if you rollback to P2, you cant go to P3, but you can go to P1

SAVE TRANSACTION savePoint;

--each save point has to have name (name lenght max 32 chars)
--returning to save point

ROLLBACK TRANSACTION savePoint;

--example

BEGIN TRANSACTION
    PRINT 'Adding first record!';
    INSERT INTO tableName (columnName1, columnName2,columnName3, columnName4, columnName5)
    VALUES ('Value 1', 'Value 2',5,1,400);
    SAVE TRANSACTION savePoint1;
    PRINT 'Save point created!';
    INSERT INTO tableName (columnName1, columnName2,columnName3, columnName4, columnName5)
    VALUES ('Value 3', 'Value 4',5,1,200);
    ROLLBACK TRANSACTION savePoint1;
    PRINT 'Rollback transaction to savePoint1!';
COMMIT;
PRINT 'Transaction done! Current amount of active transactions: ' + CAST(@@TRANCOUNT AS VARCHAR);

/*
concurrencies
* pessimistic - model states that there could be conflicts, so the date is locked each time,
when transaction tries to read data or modify. to read there are made locks protecting from saving
and for modifying locks protecting from saving and reading
* optymistic - model states that there is low propability from users to use the same data, but not impossible
this means there is no locks for reading, while there is a lock for saving while modifying

just like in mysql, there can be appearances of:
* lost updates - appears when two diffrent transactions modify the same data, so the first transactions dont know that the second is usind, and vice versa
the last transaction overwrites the data, that transactions before added or modified.
default server configuration doesnt allow for lost updates;
* dirty reads - appears when first transaction modifies data, and other reads the data.
in effect second transaction reads data, that wasnt commited and could be rollbacked.
default server configuration doesnt allow for dirty reads;
* non-repeatable reads - appears when repeat of data within transaction from the same read gives diffrent values.
this can happen, when after first read(not after closure of transaction) read locs were taken off.
unlocked data can be changed by diffrent process, so their repeat read can give diffrent (uncanny) values.
default server configuration allow for dirty reads;
* phantom reads -  appears, when between two reads of the same data within one transaction the number of readen recods change,
for ex. as a result of INSERT or DELETE on those date in between operations.
default server configuration allow for dirty reads;


--data locking mechanism - transaction isolation
--locking mechanism performs locks on data used by transaction, so it wont be modified nor deleted
--generally, servers use two types of locks:

--* shared lock type S - lock is put on read objects only for the time of query
--with this type of lock, there is possibilty of setting lock on the same date by other process on server
--by default, shared lock is put during the SELECT instruction;
--* exclusive lock type x - lock is put on the modifyed objects for the whole time of transactions
--by that the locked data is not available for other transactions nor processes on server;

--1. extends of locks
--locks can be put on many levels - table colums, records, tables or whole database.
--for each transaction there is dynamicly made level, on which the lock has to be put.
--its the database server who checks, if locks set on one level respects other locks set on diffrent level
--the bigger objects are locket, the longer they are available for user and the lower transaction concurrencies are on server

--2.  transaction clash
--the so called clashes appear, when one transaction tries to put lock making conflict with lock, that other transaction tries to perform.
--in that moment both transactions are blocked, and their users cant work.
--in that moment the server treis to unlock the blocked sessions, which results, that in one session server automaticly rollback all transaction results
*/
--Transaction isolation levels
--There are 4 levels of isolation on SQL Server
--* Read Uncommited;
--* Read Commited;
--* Repeatable Read;
--* Serializable

--Read Uncommited mode:
--It's the lowest transaction isolation level
--on this level there are dirty reads, non-repeatable reads and phantom reads
--this mode is set by command:
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

--ex.
╔════════════════════════════════════════╦══════════════════════════════════════════════════╗
║                                        ║ SET TRANSACTION ISOLATION LEVEL READ UNCOMMITED; ║
╠════════════════════════════════════════╬══════════════════════════════════════════════════╣
║ BEGIN TRANSACTION                      ║                                                  ║
║ UPDATE tableName SET columnName2 = 400 ║                                                  ║
║ WHERE columnName1 = 'Value';           ║                                                  ║
╠════════════════════════════════════════╬══════════════════════════════════════════════════╣
║                                        ║ SELECT columnName1, columnName2                  ║
║                                        ║ FROM tableName                                   ║
║                                        ║ WHERE columnName1 = 'Value';                     ║
╠════════════════════════════════════════╬══════════════════════════════════════════════════╣
║ ROLLBACK;                              ║                                                  ║
╠════════════════════════════════════════╬══════════════════════════════════════════════════╣
║                                        ║ SELECT columnName1, columnName2                  ║
║                                        ║ FROM tableName                                   ║
║                                        ║ WHERE columnName1 = 'Value';                     ║
╚════════════════════════════════════════╩══════════════════════════════════════════════════╝

--Read Commited mode:
--Default isolation mode
--eliminates dirty reads, byt non-repeatable reads and phantom reads still appear
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

--ex.
╔═════════════════════════════════════════════════╦════════════════════════════════════════╗
║ SET TRANSACTION ISOLATION LEVEL READ COMMITTED; ║                                        ║
╠═════════════════════════════════════════════════╬════════════════════════════════════════╣
║ BEGIN TRANSACTION                               ║                                        ║
║ SELECT columnName1, columnName2                 ║                                        ║
║ FROM tableName                                  ║                                        ║
║ WHERE columnName1 = 'Value';                    ║                                        ║
╠═════════════════════════════════════════════════╬════════════════════════════════════════╣
║                                                 ║ UPDATE tableName SET columnName2 = 400 ║
║                                                 ║ WHERE columnName1 = 'Value';           ║
╠═════════════════════════════════════════════════╬════════════════════════════════════════╣
║ SELECT columnName1, columnName2                 ║                                        ║
║ FROM tableName                                  ║                                        ║
║ WHERE columnName1 = 'Value';                    ║                                        ║
║ COMMIT;                                         ║                                        ║
╚═════════════════════════════════════════════════╩════════════════════════════════════════╝

--Repeatable read mode:
--In this mode, shared locks are put to the end of transaction
--thanks to that other process cant modify readed date in its data fields, which eliminates non-repeatable reads
--phantom reads still apear
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--ex.
╔══════════════════════════════════════════════════╦════════════════════════════════════════╗
║ SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; ║                                        ║
╠══════════════════════════════════════════════════╬════════════════════════════════════════╣
║ BEGIN TRANSACTION                                ║                                        ║
║ SELECT columnName1, columnName2                  ║                                        ║
║ FROM tableName                                   ║                                        ║
║ WHERE columnName1 = 'Value';                     ║                                        ║
╠══════════════════════════════════════════════════╬════════════════════════════════════════╣
║                                                  ║ UPDATE tableName SET columnName2 = 400 ║
║                                                  ║ WHERE columnName1 = 'Value';           ║
╠══════════════════════════════════════════════════╬════════════════════════════════════════╣
║ SELECT columnName1, columnName2                  ║                                        ║
║ FROM tableName                                   ║                                        ║
║ WHERE columnName1 = 'Value';                     ║                                        ║
╠══════════════════════════════════════════════════╬════════════════════════════════════════╣
║ COMMIT;                                          ║                                        ║
╚══════════════════════════════════════════════════╩════════════════════════════════════════╝

--this time the session went smoothly, but this time we will modify already read data
╔══════════════════════════════════════════════════╦════════════════════════════════════════╗
║ SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; ║                                        ║
╠══════════════════════════════════════════════════╬════════════════════════════════════════╣
║ BEGIN TRANSACTION                                ║                                        ║
║ SELECT columnName1, columnName2                  ║                                        ║
║ FROM tableName                                   ║                                        ║
║ WHERE columnName2 = 400;                         ║                                        ║
╠══════════════════════════════════════════════════╬════════════════════════════════════════╣
║                                                  ║ UPDATE tableName SET columnName2 = 500 ║
║                                                  ║ WHERE columnName2 = 400;               ║
╠══════════════════════════════════════════════════╬════════════════════════════════════════╣
║ SELECT columnName1, columnName2                  ║                                        ║
║ FROM tableName                                   ║                                        ║
║ WHERE columnName2 = 400;                         ║                                        ║
╠══════════════════════════════════════════════════╬════════════════════════════════════════╣
║ COMMIT;                                          ║                                        ║
╚══════════════════════════════════════════════════╩════════════════════════════════════════╝

--this time updating the records from second session will be possible only after the transaction basing on it from first session will end (by COMMIT),
--and the lock is set off
				
--Serializable mode:
--highest isolation level
--in this mode transactions calling out to same tables are performed one after another.
--the lock is put on whole objects, not only on read data
--this prevents phantom reads, but it also prevents accessing data from other users while using just one table
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--ex.
╔═══════════════════════════════════════════════╦══════════════════════════════════════════╗
║ SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; ║                                          ║
╠═══════════════════════════════════════════════╬══════════════════════════════════════════╣
║ BEGIN TRANSACTION                             ║                                          ║
║ SELECT NazwaRoweru, CenaJednostkowa           ║                                          ║
║ FROM Rowery                                   ║                                          ║
║ WHERE NazwaRoweru = 'Bobo';                   ║                                          ║
╠═══════════════════════════════════════════════╬══════════════════════════════════════════╣
║                                               ║ UPDATE Rowery SET CenaJednostkowa = 1400 ║
║                                               ║ WHERE NazwaRoweru = 'Relaks';            ║
╠═══════════════════════════════════════════════╬══════════════════════════════════════════╣
║ COMMIT;                                       ║                                          ║
╚═══════════════════════════════════════════════╩══════════════════════════════════════════╝

--TODO (vital) - write about triggers

CREATE TRIGGER triggerName on tableName
INSTEAD OF DELETE
AS
SELECT * FROM tableName;

--DDL triggers
--DDL triggers activate after instructions such as CREATE, ALTER, DROP
--Usage:
--Base role of DDL triggers is helping audit mechanisms and observe the changes in database structure, and limit abilities of manipulating this structure
--They are useful, when:
--* denying performing changes in database schema
--* perform queries in database in response to changes in database schema
--* save changes in database schema

--Creating DDL Triggers
--DDL trigges can be created on database level or whole server
--To create DDL triggers for server CONTROL SERVER priveleges are needed
--To create DDL triggers for database ALTER DATABASE priveleges are needed

CREATE TRIGGER triggerName ON ALL SERVER /*or*/ DATABASE
FOR | AFTER exemption
AS triggerCode /*or*/ EXTERNAL NAME procedureName;

--where:
--* ON DATABASE - creates trigger on database
--* ON ALL SERVER - creates trigger on current server;
--* exemption - responds to exemption basing on DDL, for example CREATE_TABLE, DROP_TABLE, ALTER_TABLE etc.
--Trigger examples

CREATE TRIGGER disabledDROP ON DATABASE
FOR DROP_TABLE, ALTER_TABLE
AS
PRINT 'Turn off trigger "disabledDROP" to alter or drop the table in database!'
ROLLBACK;

--other example of DDL trigger is registering DDL exemptions in database
--First, we connect with tempdb database:
USE tempdb;
--next, it that database we create exemptionRegister:
CREATE TABLE exemptionRegister(
    exemptionID INT IDENTITY PRIMARY KEY,
    exemption VARCHAR(MAX),
    userName VARCHAR(MAX),
    exemptionDate DATETIME
);
--now the trigger
CREATE TRIGGER registerExemptions ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
DECLARE @command VARCHAR(MAX);
SET @command = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','VARCHAR(MAX)');
INSERT INTO exemptionRegister VALUES (@command, USER_NAME(),GETDATE());

--in this trigger we used special base function EVENTDATA(), which returns data about exemption in XML form
--from that you need to read from that XML code what exemption carried and save it in @command variable

--at the end some DDL exemption to test if trigger works

CREATE TABLE tableName(
    columnID INT,
    columnName INT
);
DROP TABLE tableName;

--LOGON triggers
--LOGON triggers are activated , when  user tries to begin session with database
--trigger is initialized after user verification on server, but not befor database initialization

--USAGE
--LOGON triggers are used to control and monitor server session
--through them you can register the activity of logon and size up the session amounts for each login

--Creating LOGON triggers
--LOGON triggers are created on database level or whole server
--to create LOGON trigger for server you need CONTROL SERVER priveleges
CREATE TRIGGER triggerName ON ALL SERVER
FOR | AFTER LOGON
AS
triggerCode /*or*/ EXTERNAL NAME procedureName

--Trigger management
--Showing info about triggers
--Information about defined DML and DDL trigger (defined on database level) can be read from two system tables sys.triggers and sys.trigger_events
SELECT * FROM sys.triggers;
SELECT * FROM sys.trigger_events;

--To show system triggers:
SELECT * FROM sys.system_triggers;

--Enabling and disabling DML triggers
--Disabling command
DISABLE TRIGGER schema.triggerName ON schema.tableName;
--Enabling command
ENABLE TRIGGER schema.triggerName ON schema.tableName;

--Enabling and disabling DDL triggers
--Disabling command
DISABLE TRIGGER triggerName ON DATABASE | ALL SERVER;
--Enabling command
ENABLE TRIGGER triggerName ON DATABASE | ALL SERVER;
--Disabling all triggers
DISABLE TRIGGER ALL ON DATABASE | ALL SERVER;
--Enabling all triggers
ENABLE TRIGGER ALL ON DATABASE | ALL SERVER;

--Removing triggers
--Removing DML trigger
DROP TRIGGER schema.triggerName;
--Removing trigger from database or server
DROP TRIGGER schema.triggerName ON DATABASE | ALL SERVER;

--modifying triggers
--Modifying DML triggers can be done by:
ALTER TRIGGER schema.triggerName ON tableName
FOR | AFTER /*or*/ INSTEAD OF INSERT /*or*/ DELETE /*or*/ UPDATE
AS
triggerCode /*or*/ EXTERNAL NAME procedureName;
--Modifying DLL triggers can be done by:
ALTER TRIGGER triggerName ON DATABASE /*or*/ ALL SERVER
FOR | AFTER exemption
AS
triggerCode /*or*/ EXTERNAL NAME procedureName;

--Changing account password
EXEC sp_password 'oldPassword', 'newPassword', 'userName';

--creating login account (server login)

CREATE LOGIN userLoginName
FROM WINDOWS /*or*/ WITH PASSWORD = 'password';

--creating user account (database login)

USE databaseName;
CREATE USER userName
FOR LOGIN userLoginName;

--From newer versions of MSSQL we can use CREATE/ALTER/DROP
--in older versions we had to use these commands (depraciated)
--* sp_grantlogin - creates login account Win Auth type
--* sp_addlogin - creates login account SQL Server Auth type
--* sp_grantdbaccess - creates user
--etc.

--granting server priveleges (administrative)
GRANT PRIVELEGE TO userLoginName;

--granting database priveleges
GRANT PRIVELEGE to userName;

--granting priveleges to object
GRANT PRIVELEGE
ON objectName TO userName;

--denying priveleges to object
DENY PRIVELEGE
ON objectName TO userName;

--revoking priveleges to object
REVOKE PRIVELEGE
ON objectName FROM userName;

--granting privelege to grant the same priveleges
GRANT PRIVELEGE
ON objectName TO userName
WITH GRANT OPTION;

--revoking privelege to grant the priveleges
REVOKE GRANT OPTION FOR SELECT
ON obiectName FROM userName; 

--setting ownership while creating object
CREATE VIEW userName.vName AS
    SELECT columnName1, columnName2
    FROM tableName;

--checking server role permissions
EXEC sp_srvrolepermission 'serverRoleName';

--adding Logon account to administrative role
EXEC sp_addsrvrolemember 'userLoginName','serverRoleName';

--removing Logon account from administrative role
EXEC sp_dropsrvrolemember 'userLoginName','serverRoleName';

--checking database role permissions
EXEC sp_dbfixedrolepermission 'databaseRoleName';

--creating role
CREATE ROLE databaseRoleName;

--droping role
DROP ROLE databaseRoleName;

--granting priveleges to roles
GRANT PRIVELEGE
ON objectName TO databaseRoleName;

--revoking priveleges to roles
REVOKE PRIVELEGE
ON objectName TO databaseRoleName;

--altering roles (adding/removing members, change name)
ALTER ROLE databaseRoleName ADD MEMBER userName;
ALTER ROLE databaseRoleName DROP MEMBER userName;
ALTER ROLE databaseRoleName WITH NAME = databaseRoleName1;

--adding user to role
EXEC sp_addrolemember 'databaseRoleName', 'userName';

--dropping user from role
EXEC sp_droprolemember 'databaseRoleName', 'userName';
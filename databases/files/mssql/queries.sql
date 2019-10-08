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
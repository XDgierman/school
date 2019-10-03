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
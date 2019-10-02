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
create database lesson2
go 
use lessoon2
EXEC sp_msforeachdb 

EXEC sp_MSforeachdb @command1 = '
USE [?];
SELECT 
    ''?'' AS DatabaseName,
    TABLE_SCHEMA AS SchemaName,
    TABLE_NAME AS TableName
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = ''BASE TABLE'';
';
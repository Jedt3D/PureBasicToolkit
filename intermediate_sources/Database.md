# Database.pb - Intermediate Description

## Purpose
Demonstrates SQLite database operations: create file, open database, create table, insert rows, query with SELECT, and iterate results.

## Application Type
GUI (uses Debug output)

## Compiler Flags
None

## Structure
- Procedure CheckDatabaseUpdate(Database, Query$) - executes update with error checking
- No structures

## Key Libraries/Functions
- Database: UseSQLiteDatabase, OpenDatabase, CloseDatabase, DatabaseUpdate, DatabaseQuery, NextDatabaseRow, GetDatabaseString, FinishDatabaseQuery, DatabaseError
- File: CreateFile, CloseFile, GetTemporaryDirectory

## Input/Output
- Creates SQLite database file in temp directory
- Output: Debug showing query results

## Logic Flow
1. Register SQLite database plugin
2. Create empty file for database
3. Open database
4. Create "food" table
5. Insert three rows
6. Query rows where weight > 7
7. Iterate and debug results
8. Close database

## Cross-Platform Notes
- SQLite is cross-platform
- Uses GetTemporaryDirectory() for portable path

## Important Notes
- Creates file first, then opens as database
- CheckDatabaseUpdate helper returns result and logs errors

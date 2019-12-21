/*
This is the solution for Module 1 Coding Assignment.
The database is from https://archive.codeplex.com/?p=chinookdatabase
*/

--Q1: Retrieve all the records from the Employees table.
Select * from Employees;

--Q2: Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.
Select FirstName, LastName, Birthdate, Address, City, State
from Employees;

--Q3: Retrieve all the columns from the Tracks table, but only return 20 rows.
Select *
From Tracks
Limit 20;

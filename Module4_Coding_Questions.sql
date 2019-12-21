/*
This is the solution for Module 4 Coding Assignment.
The database is from https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png
*/

--Q1: Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE.
SELECT CustomerId, FirstName, LastName, Address, UPPER(City || ' ' || Country) AS cc
FROM Customers;

--Q2: Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
SELECT LOWER(SUBSTR(FirstName, 1, 4) || SUBSTR(LastName, 1, 2))
FROM Employees
WHERE FirstName = 'Robert' AND LastName = 'King';

--Q3: Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
SELECT EmployeeId, LastName, (Date('now') - HireDate) AS Years
FROM Employees
WHERE Years >= 15
ORDER BY LastName ASC;

--Q4: Profiling the Customers table, answer the following question.
SELECT *
FROM Customers
WHERE PostalCode IS NULL;

--Q5: Find the cities with the most customers and rank in descending order.
SELECT City, Count(*) AS Number
FROM Customers
GROUP BY City
ORDER BY Number DESC;

--Q6: Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
SELECT (c.FirstName || c.LastName || i.InvoiceId) AS NewId
FROM Invoices i
INNER JOIN Customers c ON i.CustomerId = c.CustomerId
ORDER BY c.FirstName, c.LastName, i.InvoiceId;
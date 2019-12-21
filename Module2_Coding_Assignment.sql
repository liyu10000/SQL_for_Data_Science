/*
This is the solution for Module 2 Coding Assignment.
The database is from https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png
*/

--Q1: Find all the tracks that have a length of 5,000,000 milliseconds or more.
Select *
From Tracks
Where Milliseconds >= 5000000;

--Q2: Find all the invoices whose total is between $5 and $15 dollars.
Select *
From Invoices
Where Total Between 5 And 15;

--Q3: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
Select *
From Customers
Where State in ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY');

--Q4: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
Select *
From Invoices
Where CustomerId in (56, 58) And Total Between 1 And 5;

--Q5: Find all the tracks whose name starts with 'All'.
Select *
From Tracks
Where Name Like 'All%';

--Q6: Find all the customer emails that start with "J" and are from gmail.com.
Select Email
From Customers
Where Email Like 'J%gmail.com';

--Q7: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
Select *
From Invoices
Where BillingCity in ('Brasília', 'Edmonton', 'Vancouver')
Order By InvoiceId desc;

--Q8: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
Select Customerid, Count(*) As Orders
From Invoices
Group By CustomerId
Order By Orders Desc;

--Q9: Find the albums with 12 or more tracks.
SELECT AlbumId, Count(*) AS Ntracks
FROM Tracks
GROUP BY AlbumId
HAVING Ntracks >= 12;

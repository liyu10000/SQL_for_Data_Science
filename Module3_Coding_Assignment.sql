/*
This is the solution for Module 3 Coding Assignment.
The database is from https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png
*/

--Q1: Using a subquery, find the names of all the tracks for the album "Californication".
Select t.Name
From Albums a
Inner Join Tracks t On a.AlbumId = t.AlbumId
Where a.Title = 'Californication';

--Q2: Find the total number of invoices for each customer along with the customer's full name, city and email.
Select Count(*) as Number, c.FirstName, c.LastName, c.City, c.Email
From Customers c
Left Join Invoices i On c.CustomerId = i.CustomerId
Group By c.CustomerId;

--Q3: Retrieve the track name, album, artistID, and trackID for all the albums.
Select t.Name, ab.Title, ab.ArtistId, t.TrackId
From Artists at
Left Join Albums ab on at.ArtistId = ab.ArtistId
Left Join Tracks t on ab.AlbumId = t.AlbumId;

--Q4: Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
Select e2.LastName as Manager, e1.LastName as Employee
From Employees e1, Employees e2
Where e1.ReportsTo = e2.EmployeeId;

--Q5: Find the name and ID of the artists who do not have albums.
Select at.ArtistId, at.Name
From Artists at
Left Join Albums ab On at.ArtistId = ab.ArtistId
Where ab.AlbumId Is Null;

--Q6: Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
Select e.FirstName, e.LastName
From Employees e
Union
Select c.FirstName, c.LastName
From Customers c
Order By LastName Desc;

--Q7: See if there are any customers who have a different city listed in their billing city versus their customer city.
Select c.CustomerId, c.City, i.BillingCity
From Customers c
Left Join Invoices i On c.CustomerId = i.CustomerId
Where c.City <> i.BillingCity;
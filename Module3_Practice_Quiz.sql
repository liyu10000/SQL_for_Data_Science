/*
This is the solution for Module 3 Practice Quiz.
The database is from https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/UAPENoOVEei4RQ5L9j9nDA_5042a1f0839511e8beb2b5b4ae9fa29a_ER-Diagram.png?expiry=1577059200000&hmac=aDgYCJd-i_T438PlmxPq2Rek9xIophPny3rpUEWX2LM
*/

--Q1: How many albums does the artist Led Zeppelin have?
Select Count(at.Name)
From Albums al
Inner Join Artists at On al.ArtistId = at.ArtistId
Where at.Name = 'Led Zeppelin';

--Q2: Create a list of album titles and the unit prices for the artist "Audioslave".
Select al.Title, tr.UnitPrice
From Albums al
Inner Join Artists at On al.ArtistId = at.ArtistId
Inner Join Tracks tr On al.AlbumId = tr.AlbumId
Where at.Name = 'Audioslave';

--Q3: Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?
Select c.CustomerId, c.FirstName, c.LastName
From Customers c
Left Join Invoices i On c.CustomerId = i.CustomerId
Where InvoiceId Is Null;

--Q4: Find the total price for each album.
Select al.AlbumId, al.Title, Sum(tr.UnitPrice) as TotalPrice
From Albums al
Inner Join Tracks tr On al.AlbumId = tr.AlbumId
Where al.Title = 'Big Ones'
Group By al.AlbumId;

--Q5: How many records are created when you apply a Cartesian join to the invoice and invoice items table?
Select i.InvoiceId
From invoices i
Cross Join invoice_items it;
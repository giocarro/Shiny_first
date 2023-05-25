CREATE DATABASE myMusic;

--Crear Tabla
CREATE TABLE Albums(
	AlbumID INT PRIMARY KEY,
	Title VARCHAR(255),
	Artist VARCHAR(255),
	ReleaseYear INT,
	Genre VARCHAR(255),
	Label VARCHAR(255),
);

--Agregar Fila
INSERT INTO Albums (AlbumID, Title, Artist, ReleaseYear, Genre, Label) VALUES
(1, 'Back in Black', 'AC/DC', 1980, 'Rock', 'Atlantic Records');

SELECT *
FROM Albums;

SELECT Title, Artist
FROM Albums;

USE Chinook;

SELECT *
FROM Artist

SELECT name FROM sys.tables;

SELECT TOP 5 *
FROM Artist;

SELECT *
FROM Artist
WHERE ArtistId = 10;

SELECT TOP 100 *
FROM Artist
ORDER BY Name ASC;

SELECT TOP 100 *
FROM Artist
ORDER BY Name DESC;

SELECT COUNT(*) AS TotalTracks
FROM Track;

SELECT *
FROM Invoice

SELECT SUM(Total) as Ventas
FROM Invoice;

SELECT *
FROM Track;

SELECT AVG(Milliseconds) as Duracion
FROM Track;

SELECT MIN(Milliseconds) AS Min_Track, MAX(Milliseconds) AS Max_Track
FROM Track;

SELECT *
FROM Artist;

INSERT INTO Artist(ArtistId, Name) VALUES
(276, 'Valentin Elizalde');

ALTER TABLE Artist
ADD Edad INT;

EXEC sp_rename 'Artist.Edad', 'Numero', 'COLUMN';

UPDATE Artist
SET Name = 'Peso Pluma', Numero = 20
WHERE ArtistId = 276;

SELECT GenreId, COUNT(*) AS Total_Track
FROM Track
GROUP BY GenreID
ORDER BY Total_Track DESC;

SELECT AlbumId, AVG(Milliseconds) as Duracion
FROM Track
GROUP BY AlbumId
HAVING AVG(Milliseconds) > 231636;

SELECT AlbumId, GenreId, AVG(Milliseconds) as Duracion
FROM Track
GROUP BY AlbumId, GenreId
HAVING AVG(Milliseconds) > 231636;

SELECT *
FROM Track;

SELECT *
FROM Album;

SELECT Track.TrackId, Track.Name, Album.Title
FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId

SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, Invoice.InvoiceId
FROM Customer
LEFT JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId

SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, Invoice.InvoiceId
FROM Invoice
RIGHT JOIN Customer ON Customer.CustomerId = Invoice.CustomerId

SELECT t.TrackId, t.Name AS TrackName, ar.Name AS ArtistName, al.Title AS AlbumTitle
FROM Track t
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
JOIN Genre g ON t.GenreId = g.GenreId;

SELECT t.TrackId, t.Name AS TrackName, ar.Name AS ArtistName, al.Title AS AlbumTitle
FROM Track t
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Reggae';

SELECT *
FROM Genre

CREATE VIEW canciones AS (
SELECT t.TrackId, t.Name AS TrackName, ar.Name AS ArtistName, al.Title AS AlbumTitle
FROM Track t
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Reggae');

SELECT *
FROM canciones

CREATE OR ALTER VIEW canciones AS (
SELECT t.TrackId, t.Name AS TrackName, ar.Name AS ArtistName, al.Title AS AlbumTitle
FROM Track t
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
JOIN Genre g ON t.GenreId = g.GenreId);

SELECT *
FROM canciones;

SELECT DISTINCT ArtistName
FROM canciones;

SELECT COUNT(DISTINCT ArtistName)
FROM canciones;

DROP VIEW canciones;

--Ejercicio 1:
--Escribe una consulta para recuperar toda la información de los clientes de la tabla "Customer".

SELECT *
FROM Customer

--Ejercicio 2:
--Escribe una consulta para recuperar el nombre de la pista y el precio unitario de la tabla "Track" 
--para todas las pistas con un precio unitario mayor a $0.99.

SELECT *
FROM Track

SELECT t.Name AS TrackName, t.UnitPrice
FROM Track t
WHERE t.UnitPrice > 0.99

--Ejercicio 3:
--Escribe una consulta para recuperar 
--el título del álbum, 
--el nombre del artista 
--y la cantidad de pistas 
--para todos los álbumes en la tabla "Album", ordenados por la cantidad de pistas de forma descendente.

--album, artist, #songs
CREATE OR ALTER VIEW newlist AS (
SELECT al.Title AS AlbumTitle, ar.Name AS ArtistName, t.Name AS TrackName
FROM Album al
JOIN Artist ar ON al.ArtistId = ar.ArtistId
JOIN Track t ON t.AlbumId = al.AlbumId);

SELECT *
FROM newlist

SELECT AlbumTitle, ArtistName, COUNT(*) AS TotalTracks
FROM newlist
GROUP BY AlbumTitle, ArtistName
ORDER BY TotalTracks DESC

--Ejercicio 4:
--Escribe una consulta para recuperar 
--el nombre del cliente
--la fecha de la factura 
--y el monto total 
--para todas las facturas en 
--la tabla "Invoice", 
--ordenadas por la fecha de la factura de forma ascendente.

CREATE VIEW FullNameClients AS(
SELECT CustomerId, CONCAT(FirstName, ' ', LastName) AS FullName 
FROM Customer);

SELECT inv.CustomerId, fnc.FullName, inv.InvoiceDate, inv.Total 
FROM Invoice inv
JOIN FullNameClients fnc ON inv.CustomerId = fnc.CustomerId
ORDER BY inv.InvoiceDate ASC


--Ejercicio 5:
--Escribe una consulta para recuperar 
--el nombre del género 
--y el número total de pistas para cada género 
--de las tablas "Genre" y "Track", 
--agrupados por género y ordenados por la cantidad de pistas de forma descendente.

CREATE VIEW Genres AS(
SELECT GenreId, COUNT(*) AS Total_Track
FROM Track
GROUP BY GenreID);

SELECT gr.Name, grs.Total_Track 
FROM Genre gr
JOIN Genres grs ON gr.GenreId = grs.GenreId
ORDER BY grs.Total_Track DESC

SELECT *
FROM Genre
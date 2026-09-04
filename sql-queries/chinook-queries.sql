-- 1. Список клиентов и их покупок
SELECT c.FirstName, c.LastName, i.InvoiceDate, i.Total
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
ORDER BY i.InvoiceDate DESC;

-- 2. Топ-5 самых продаваемых треков
SELECT t.Name, COUNT(il.InvoiceLineId) AS sales_count
FROM tracks t
JOIN invoice_items il ON t.TrackId = il.TrackId
GROUP BY t.TrackId
ORDER BY sales_count DESC
LIMIT 5;

-- 3. Клиенты, которые ничего не купили
SELECT c.FirstName, c.LastName
FROM customers c
LEFT JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

-- 4. Общая выручка по жанрам
SELECT g.Name, SUM(il.UnitPrice * il.Quantity) AS total_revenue
FROM genres g
JOIN tracks t ON g.GenreId = t.GenreId
JOIN invoice_items il ON t.TrackId = il.TrackId
GROUP BY g.GenreId
HAVING total_revenue > 100
ORDER BY total_revenue DESC;

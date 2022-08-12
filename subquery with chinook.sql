-- Subquery 1
--Top 10 Revenue genres song in the world.


SELECT ROW_NUMBER() OVER() AS RANK,
    *
FROM (SELECT 
	ge.name,
    ROUND(sum(i.total),2) as 'Total Revenue',
    COUNT(tr.trackid) as 'Total Track'
    
    FROM invoices AS i

    JOIN invoice_items AS invi 	    ON i.InvoiceId = invi.InvoiceId
    JOIN tracks AS tr 				ON tr.TrackId = invi.trackid
    JOIN genres AS ge 				ON ge.GenreId = tr.genreid
    
    GROUP BY ge.Name 
    ORDER BY 2 DESC)
    LIMIT 10 ;


-- Subquery 2
--common table expression // โดยใช้ WITH 
-- Top 10 country sprending and how many customers in 2013

WITH all_customers AS (
    SELECT * FROM customers   
), invoices_2013 AS (
    SELECT * FROM invoices
    WHERE STRFTIME('%Y', invoicedate) = '2013'
)
    SELECT  allcus.country,
    		ROUND(SUM(inv2013.total),2) AS sum_invoice,
            COUNT(inv2013.customerid) AS count_customers
    
    		FROM all_customers AS allcus
    		JOIN invoices_2013 AS inv2013 ON allcus.customerid = inv2013.customerid
    
    		GROUP BY 1
            ORDER BY 2 DESC
            LIMIT 10 ;

--Get the product name , count of orders processed
SELECT p.ProductName, COUNT(o.ProductId) AS 'Orders Processed' FROM OrderDetail o
JOIN Product p ON p.Id = o.ProductId
GROUP BY p.Id
ORDER BY COUNT(o.ProductId) DESC;

--Get the top 3 products which have the most orders
JOIN Product p ON p.Id = o.ProductId
GROUP BY p.Id
ORDER BY COUNT(o.ProductId) DESC
LIMIT 3;

--Get the list of the products which don’t have any orders across all the months and years
SELECT ProductName, b.ProductId FROM Product a
LEFT JOIN
	(SELECT OrderDetail.ProductId FROM OrderDetail
	 GROUP BY OrderDetail.ProductId) b ON b.ProductId = a.Id
WHERE b.ProductId IS NULL;

--Get the list of employees who processed orders for the product chai
SELECT e.FirstName || " " || e.LastName AS 'Name', p.ProductName FROM OrderDetail od
JOIN [Order] o ON o.Id = od.OrderId
JOIN Employee e ON e.Id = o.EmployeeId
JOIN Product p ON p.Id = od.ProductId
WHERE p.ProductName LIKE 'Chai'
GROUP BY e.Id;

--Get the list of employees and the count of orders they processed in the month of march across all years
SELECT e.FirstName || " " || e.LastName AS 'Employee', COUNT(o.EmployeeId) AS 'Orders' FROM Employee e
JOIN [Order] o ON o.EmployeeId = e.Id
WHERE strftime('%m', o.OrderDate) LIKE '03'
GROUP BY e.Id; 

--Get the list of employees who processed the orders that belong to the city in which they live
SELECT e.FirstName || " " || e.LastName AS 'Employee', e.City, COUNT(o.Id) AS 'Num Of Orders' FROM Employee e
JOIN [Order] o ON o.EmployeeId = e.Id
WHERE o.ShipCity LIKE e.City
GROUP BY e.Id
ORDER BY COUNT(o.Id) DESC;

--Get the list of employees who processed the orders that belong to the city in which they live
SELECT e.FirstName || " " || e.LastName AS 'Employee', e.City, COUNT(o.Id) AS 'Num Of Orders' FROM Employee e
JOIN [Order] o ON o.EmployeeId = e.Id
WHERE o.ShipCity NOT LIKE e.City
GROUP BY e.Id
ORDER BY COUNT(o.Id) DESC;
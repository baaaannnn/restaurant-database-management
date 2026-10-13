-- Find chefs without a tutor.
SELECT * FROM chef WHERE chef_tutorID IS NULL;

-- Dishes appearing in more than one order.
SELECT dishName, COUNT(*) AS order_count FROM hasOrderCook
GROUP BY dishName HAVING COUNT(*) > 1;

-- People who have placed orders. The report's Order reference is corrected to Orders.
SELECT first_name, last_name FROM Person WHERE ID IN (SELECT person_ID FROM Orders);

-- Dishes served at Jeddah branches.
SELECT Name FROM Dish WHERE Name IN
(SELECT dishName FROM provide WHERE branchNum IN
(SELECT Number FROM Rest_branch WHERE city = 'Jeddah'));

-- Customer names and dishes ordered.
SELECT Person.first_name AS Customer_FirstName,
Person.last_name AS Customer_LastName, hasOrderCook.dishName AS Dish
FROM hasOrderCook
INNER JOIN Orders ON hasOrderCook.orderNum = Orders.Num
INNER JOIN Person ON Orders.person_ID = Person.ID;

-- Customers with and without orders; account password omitted from display.
SELECT P.first_name, P.last_name, O.Num AS order_number, O.date, O.comments
FROM customer AS C LEFT JOIN Person AS P ON C.personID = P.ID
LEFT JOIN Orders AS O ON C.personID = O.person_ID;

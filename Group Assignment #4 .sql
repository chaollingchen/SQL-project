USE lyft;

#Q1 What is different?
SELECT DriverName, count(RequestID)
FROM drivers LEFT JOIN requests
USING (DriverName)
GROUP BY DriverName
HAVING count(RequestID)=0;

#Q2
SELECT DayOfWeek, count(RequestID)
FROM requests
GROUP BY DayOfWeek
ORDER BY count(RequestID) ASC;

#Q3 !!join的做法
SELECT count(distinct requests.CustomerName), Gender, Color
FROM customers JOIN requests 
USING (CustomerName)
JOIN drivers 
USING (DriverName)
WHERE Color='Black'
GROUP BY Gender;

#Q4
SELECT Destination, AVG(Distance), TimeOfDay,avg(Distance)
FROM requests
WHERE TimeOfDay='evening'
GROUP BY Destination
HAVING AVG(Distance)>8
ORDER BY AVG(Distance) DESC;

#Q5 Subquery用法!!
SELECT DriverName
FROM drivers
WHERE Year=(SELECT min(Year) FROM Drivers);

#Q6
SELECT count(requestID)
FROM requests
WHERE DriverName=(SELECT DriverName
FROM drivers
WHERE Year=(SELECT min(Year) FROM Drivers));

#Q7 數driver的时候一定要避免重覆，也就是加DISTINCT !!
SELECT Color, count(RequestID) as NumberOfRides, 
count(DISTINCT DriverName) as NumberOfCars,
count(RequestID)/count(DISTINCT DriverName) as AverageRidesPerCar, 
SUM(Distance)/count(DISTINCT DriverName) as AverageDistance
FROM requests right JOIN drivers
USING (DriverName)
GROUP BY Color;


#Q8 IF语句的运用 & LEFT JOIN不是RIGHT JOIN,因为要包括trip为0的顾客 !! join的时候，再用sum要小心，可能會重覆计算。
SELECT CustomerName, PastTrips, count(RequestID) as CurrentTrips,
IF(PastTrips is NULL,0,PastTrips)+count(RequestID) as TotalTrips   /* IFNULL(PastTrips,0)*/
FROM customers LEFT JOIN requests
USING (CustomerName)
GROUP BY CustomerName
ORDER BY TotalTrips ASC 
LIMIT 12;

#Q9
SELECT DISTINCT CustomerName,Destination
FROM customers JOIN requests
USING (CustomerName)
WHERE Age>(SELECT AVG(Age) FROM customers);

SELECT distinct requests.CustomerName,Destination
FROM requests JOIN 
(Select customers.CustomerName,age from customers 
WHERE Age>(SELECT AVG(Age) FROM customers))as oldcustomers
using (CustomerName);


#Q10 GROUP BY要連續的话，直接逗號再加入屬性就行
SELECT DayOfWeek, TimeOfDay, count(RequestID)
FROM requests
GROUP BY DayOfWeek, TimeOfDay
HAVING count(RequestID)>5;

#Q11 customer重覆计算了怎麼处理 !!
SELECT AVG(Age), Destination
FROM customers RIGHT JOIN requests
USING (CustomerName)
GROUP BY Destination
ORDER BY AVG(Age) DESC;

#Q12
SELECT Destination, count(RequestID)
FROM requests
GROUP BY Destination
HAVING count(RequestID)>4
ORDER BY count(RequestID) DESC;

#Q13
SELECT RequestID, CustomerName, Distance, DriverName, Destination
FROM requests
WHERE Distance>(SELECT AVG(Distance) FROM requests)
ORDER BY Distance ASC LIMIT 10;
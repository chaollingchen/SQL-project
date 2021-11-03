USE lyft;

#Q1 
SELECT CustomerName,RequestID
FROM customers left join requests
USING (CustomerName)
Where RequestID is null;

#Q2
SELECT count(RequestID) 
FROM customers JOIN requests
USING (CustomerName)
WHERE Address='St. Louis';

#Q3
SELECT CustomerName, count(RequestID)
FROM customers JOIN requests
USING (CustomerName)
WHERE Address='St. Louis' AND DayOfWeek='Friday'
GROUP BY CustomerName
ORDER BY count(RequestID) DESC;

#Q4

Select DayOfWeek,count(DayOfWeek)
From requests
where Destination='Zoo'
group by DayofWeek
order by count(DayOfWeek) desc;


SELECT Destination, Address, count(RequestID)
From customers JOIN requests
USING (CustomerName)
WHERE Destination='Zoo'
GROUP BY Address
ORDER BY count(RequestID) DESC;

#Q5
SELECT CustomerName, Distance, Address, Destination
From customers JOIN requests
USING (CustomerName)
ORDER BY Distance DESC;

#Q6
SELECT DriverName, Distance, Destination
From drivers JOIN requests
USING (DriverName)
WHERE Destination='Arch'
ORDER BY Distance DESC
limit 1;


#Q7
SELECT Destination, count(RequestID), TimeOfDay
FROM requests
WHERE TimeOfDay='evening' 
group by Destination
Having count(RequestID)>2; 
/* "having" applies to the results of a group by query, which is different from "where" */


#Q8
SELECT customers.CustomerName as CustomerName, Age as CustomerAge, 
drivers.DriverName as DriverName, Destination, Model
FROM customers, drivers, requests
WHERE customers.CustomerName=requests.CustomerName
AND drivers.DriverName=requests.DriverName
AND Destination is NOT Null
AND Model is NOT Null;


#Q9
SELECT TimeOfDay, Avg(Distance)
FROM requests
GROUP BY TimeOfDay;


#Q10
SELECT c1.CustomerName, c2.CustomerName, Address
FROM customers as c1 JOIN customers as c2
USING (Address)
WHERE C1.CustomerName<C2.CustomerName;
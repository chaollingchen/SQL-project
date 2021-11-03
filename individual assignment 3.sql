use airport;

/*Q1*/
Select gates.GateNumber,count(gateassignments.FlightNumber)
From gateassignments right join gates
Using (GateNumber)
group by GateNumber
order by count(FlightNumber);

/*Q2*/
Select gates.GateNumber,gates.Terminal,count(gateassignments.FlightNumber),SUM(TIME_TO_SEC(TurnaroundTime))
From gateassignments right join gates
Using (GateNumber)
group by Terminal,GateNumber;

/*Q3*/
Select distinct gates.GateNumber,gates.Terminal,Services
From gateassignments right join gates
Using (GateNumber)
where TIME_TO_SEC(TurnaroundTime)<=3600
And Services is null
group by gates.GateNumber,gates.Terminal;

/*Q4*/
Select departures.FlightNumber,ArrivalAirport,PlaneCode,Entertainment
From airplanes inner join departures
Using (FlightNumber)
where Entertainment="Medium Entertainment Service" 
Or Entertainment="Full Entertainment";

/*Q5*/
Select gateinformation.GateNumber, sum(Capacity) as TotalNumberOfCustomer
From airplanes left join 
(select gates.GateNumber,gateassignments.FlightNumber From gates left join gateassignments using(GateNumber)) as gateinformation
using(FlightNumber)
group by gateinformation.GateNumber
order by gateinformation.GateNumber;

/*Q6*/
Select gatearrive.GateNumber,count(arrivals.ScheduledTime) as NoOfArr,count(gatearrive.ScheduledTime) as NoOfDep 
From arrivals right join
(Select gateassignments.FlightNumber,departures.ScheduledTime,gateassignments.GateNumber from gateassignments left join departures using (FlightNumber)) as gatearrive
using (FlightNumber)
group by gatearrive.GateNumber
order by gatearrive.GateNumber;


/*Q7*/
Select airplanes.Manufacturer,avgturnaroundtime.PlaneCode, avgturnaroundtime.avgTime
From airplanes right join 
(Select PlaneCode, avg(TIME_TO_SEC(TurnaroundTime)) as avgTime
From airplanes inner join gateassignments
Using (FlightNumber)
group by PlaneCode) as avgturnaroundtime
using(PlaneCode);

/*Q8*/
Select p1.GateNumber as p1Gate,Services,p2.GateNumber as p2Gate
From gates As p1 join gates as p2 
using(Services)
where p1.GateNumber < p2.GateNumber
order by p1.GateNumber,Services,p2.GateNumber asc;

/*Q9*/
Select GateNumber
From gateassignments inner join 
(select capacity,departures.FlightNumber as FlightNumber from departures inner join airplanes using(FlightNumber) where capacity >=100) as capaflight
using(FlightNumber)
group by GateNumber
having count(capaflight.FlightNumber)>1;

/*Q10*/
Select p1.Departingairport as p1airport,p1.Airline,p2.Departingairport as p2airport
From arrivals As p1 join arrivals as p2 
using(Airline)
where p1.Airline = "American"
And p1.Departingairport < p2.Departingairport;

/*Q11*/
Select FoodServices, count(arrivals.FlightNumber)
From arrivals inner join airplanes
Using(FlightNumber)
group by FoodServices;

/*Q12*/
Select GateNumber, count(arrivals.FlightNumber)
From arrivals join gateassignments
Using(FlightNumber)
where TIME_TO_SEC(ScheduledTime)>43200
or TIME_TO_SEC(UpdatedTime)>43200
group by GateNumber;

select *,hour(ScheduledTime),TIME_TO_SEC(ScheduledTime)
from arrivals
where hour(ScheduledTime)>12
order by ScheduledTime;

select *,hour(ScheduledTime),TIME_TO_SEC(ScheduledTime)
from arrivals
where TIME_TO_SEC(ScheduledTime)>43200
order by ScheduledTime;



/*Q13*/
Select Airline, count(airplanes.Manufacturer) as NumBoe
From departures inner join airplanes
Using(FlightNumber)
where airplanes.Manufacturer = "Boeing"
group by Airline;













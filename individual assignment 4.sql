use airport;

/* Q1 */
Select Airline,avg(Capacity)
From arrivals inner join airplanes
using(FlightNumber)
group by Airline
having avg(Capacity)>=100;

/* Q2 */
Select gateassignments.FlightNumber,gateassignments.GateNumber,Terminal
From gates inner join gateassignments
using(GateNumber)
where TIME_TO_SEC(TurnaroundTime)>
(Select min(TIME_TO_SEC(TurnaroundTime)) from gateassignments);

/* Q3 */ 
Select GateNumber, sum(TIME_TO_SEC(TurnaroundTime)),sum(TIME_TO_SEC(TurnaroundTime))/3600
From gateassignments
where FlightNumber<600
group by GateNumber
having sum(TIME_TO_SEC(TurnaroundTime))<10000;

/* Q4 */ 
Select FlightNumber, GateNumber,TurnaroundTime,TIME_TO_SEC(TurnaroundTime)
From gateassignments
where TIME_TO_SEC(TurnaroundTime) < 
(Select avg(TIME_TO_SEC(TurnaroundTime)) From gateassignments where GateNumber=7)
order by GateNumber desc
limit 15;

/* Q5 */
Select GateNumber,sum(Capacity)
From gateassignments inner join airplanes
using(FlightNumber) 
right join departures
using(FlightNumber)
group by GateNumber
having sum(capacity)<=500
And sum(capacity)>=200;

/* Q6 */
Select GateNumber,Terminal,Services
From gates right join 
(Select GateNumber
From gateassignments inner join airplanes
using(FlightNumber) 
right join departures
using(FlightNumber)
group by GateNumber
having sum(capacity)<=500
And sum(capacity)>=200) as gategate
using(GateNumber);

/* Q7 */ 
select distinct Entertainment,DepartingAirport,ArrivalAirport
from arrivals left join airplanes 
using(FlightNumber),
(select distinct ArrivalAirport 
from departures
join airplanes 
using(flightnumber))as ar
where Entertainment='Music' 
or Entertainment='Basic Entertainment Service';



/* Q8 */ 
Select Airline,if(UpdatedTime is null, Timediff(ScheduledTime,ScheduledTime),Timediff(UpdatedTime,ScheduledTime)) as delay
From departures
order by Timediff(UpdatedTime,ScheduledTime) desc;

/* Q9 */ #left?
Select Terminal,avg(TurnaroundTime) as avgTime,count(TurnaroundTime) as count,sum(TurnaroundTime)as sumTime,max(TurnaroundTime)as maxTime,min(TurnaroundTime) as minTime 
From gates left join gateassignments
using(GateNumber)
group by Terminal;

/* Q10 */ #???
Select Terminal,avg(If(TurnaroundTime is null, 0, TurnaroundTime))as avgTime,
count(If(TurnaroundTime is null, 0, TurnaroundTime))as count,
sum(If(TurnaroundTime is null, 0, TurnaroundTime)) as sumTime,
max(If(TurnaroundTime is null, 0, TurnaroundTime))as maxTime,
min(If(TurnaroundTime is null, 0, TurnaroundTime)) as minTime
From gates left join gateassignments
using(GateNumber)
group by Terminal;

/* Q11 */ 
Select Airline,avg(Timediff(departures.UpdatedTime,departures.ScheduledTime))as averageDepartureDelay
From departures
where Airline = (Select Airline
From arrivals
group by Airline
order by avg(Timediff(UpdatedTime,ScheduledTime)) asc
limit 1) 
group by Airline;


/* Q12 */ 
Select Terminal, Airline, Services
From gates inner join gateassignments
using(GateNumber)
right join departures
using(FlightNumber)
where ArrivalAirport="SFO";


/* Q13 */ 
Select p1.FlightNumber as p1Flight,DepartingAirport,p2.FlightNumber as p2Flight
From arrivals As p1 join arrivals as p2 
using(DepartingAirport)
where p1.FlightNumber < p2.FlightNumber
And p1.Airline="Spirit";







 











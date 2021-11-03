USE airport;

/* Q1 */
SELECT GateNumber,Terminal,Services
FROM gates;

/* Q2 */
Select GateNumber,count(Flightnumber)
From gateassignments
where Flightnumber is not null
group by GateNumber;

/* Q3 */
Select FlightNumber,TurnaroundTime,time_to_sec(TurnaroundTime)
From gateassignments;

/* Q4 */
Select distinct arrivals.Airline, PlaneCode, Manufacturer,YearBuilt
From arrivals inner join airplanes
on arrivals.FlightNumber = airplanes.FlightNumber
order by Airline;

/* Q5 */
SELECT Services,count(Services)
FROM gates
where Terminal= "A"
group by Services;

/* Q6 */
Select Airline,sum(Capacity)
From arrivals inner join airplanes
on arrivals.FlightNumber = airplanes.FlightNumber
group by Airline;

/* Q7 */
Select Airline,count(FlightNumber)
From arrivals
Where ScheduledTime is not null
group by Airline,ScheduledTime
order by Airline;

/* Q8 */
Select arrivals.airline,min(YearBuilt)
From arrivals inner join airplanes
on arrivals.FlightNumber = airplanes.FlightNumber
group by airline;



/* Q9 */
Select Airline,sum(Capacity)
From arrivals inner join airplanes
on arrivals.FlightNumber = airplanes.FlightNumber
Where WifiAvailable ="YES"
group by Airline;

/* Q10-Q11？？？ */
/* Time_To_Sec(UpdatedTime)- Time_To_Sec(ScheduledTime)>0 */
Select Airline,avg(time_to_sec(UpdatedTime)-time_to_sec(ScheduledTime))
From arrivals
Where UpdatedTime is not null
group by Airline
order by avg(time_to_sec(UpdatedTime)-time_to_sec(ScheduledTime)) asc;

Select Airline,avg(time_to_sec(UpdatedTime)-time_to_sec(ScheduledTime))
From arrivals
Where time_to_sec(UpdatedTime) is not null
group by Airline
order by avg(time_to_sec(UpdatedTime)-time_to_sec(ScheduledTime)) desc;

/* Q12*/
 
Select departures.FlightNumber,gateassignments.GateNumber
From gateassignments inner join departures
on gateassignments.FlightNumber  = departures.FlightNumber
Where ArrivalAirport="STL";

/* Q13 */
Select PlaneCode,count(FlightNumber)
From airplanes
group by PlaneCode
order by count(FlightNumber) desc;


/* Q14 */
/*I spend about 1.5 hour on this assignment*/









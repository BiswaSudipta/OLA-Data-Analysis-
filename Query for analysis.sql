#  Q1). Retrieve all successful bookings:
CREATE OR REPLACE VIEW Successful_Bookings AS
select
* 
From Bookings
WHere Booking_Status = 'Success';

select * from Successful_Bookings;
-- Q2). Find the average ride distance for each vehicle type:
CREATE OR REPLACE VIEW ride_distance_for_each_vehicle AS
SELECT
Vehicle_Type,
AVG(Ride_Distance)
FROM Bookings
GROUP BY Vehicle_Type;

select * from ride_distance_for_each_vehicle;

-- Q3). Get the total number of cancelled rides by customers:
CREATE OR REPLACE VIEW cancel_ride_by_customers AS

SELECT 
COUNT(*)
FROM Bookings
WHERE Booking_Status = 'Canceled by Customer';
-- Q4). List the top 5 customers who booked the highest number of rides:
CREATE OR REPLACE VIEW Top_5_Customers AS

SELECT
	Customer_ID,
	COUNT(Booking_ID) count_cust
FROM Bookings
GROUP BY Customer_ID
ORDER BY count_cust DESC
LIMIT 5;
select * from Top_5_Customers;
-- Q5). Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE OR REPLACE VIEW Ride_Cancelled_by_Drivers_P_C_Issues AS

SELECT 
	COUNT(Canceled_Rides_by_Driver) Ride_can_bydr
FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- Q6). Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE OR REPLACE VIEW Max_Min_Driver_rating AS

SELECT
	MAX(Driver_Ratings) max_rating,
	MIN(Driver_Ratings) min_rating
FROM Bookings
WHERE Vehicle_Type = 'Prime Sedan'
GROUP BY Vehicle_Type;

-- Q7). Retrieve all rides where payment was made using UPI:
CREATE OR REPLACE VIEW UPI_Payment AS

SELECT
	* 
FROM Bookings
WHERE Payment_Method = 'UPI';

-- Q8). Find the average customer rating per vehicle type:
CREATE OR REPLACE VIEW Avg_Cust_Ratings AS

SELECT
	Vehicle_Type,
	AVG(Customer_Rating) Avg_Cust_Rating
FROM Bookings
GROUP BY Vehicle_Type;

-- Q9). Calculate the total booking value of rides completed successfully:
CREATE OR REPLACE VIEW Total_Successfull_Ride_Value AS

select 
	sum(Booking_Value) as Total_Bookings_Value
from Bookings
WHERE Booking_Status = 'Success';

-- Q10). List all incomplete rides along with the reason:
CREATE OR REPLACE VIEW Incomplete_Rides_Reason AS

select	
	Booking_ID,
	Incomplete_Rides_Reason
from Bookings
WHERE Incomplete_Rides = 'Yes';
select * from Incomplete_Rides_Reason;
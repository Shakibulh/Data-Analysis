create Database Uber;
use Uber;

# Retrieve all successful bookings:.
Create View Successful_Bookings As
SELECT * FROM bookings WHERE Booking_Status = 'Success';
# Retrieve all successful bookings:.
Select * From Successful_Bookings;

# Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;
# Find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle;

# Get the total number of cancelled rides by customers:

Create View cancelled_rides_by_customers As
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'cancelled by Customer';

# Get the total number of cancelled rides by customers:
select * from cancelled_rides_by_customers;

# List the top 5 customers who booked the highest number of rides:

Create View Top_5_Customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
# List the top 5 customers who booked the highest number of rides:
select * from Top_5_Customers;


# Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';
# Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from Rides_cancelled_by_Drivers_P_C_Issues;


# Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

# Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from Max_Min_Driver_Rating;


# Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment AS
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';
# Retrieve all rides where payment was made using UPI:
SELECT * FROM UPI_Payment;


# Find the average customer rating per vehicle type:

Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

# Find the average customer rating per vehicle type:
select * from AVG_Cust_Rating;
 
# Calculate the total booking value of rides completed successfully:

Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

# Calculate the total booking value of rides completed successfully:
select * from total_successful_ride_value;


#List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

#List all incomplete rides along with the reason:
select * from  Incomplete_Rides_Reason;

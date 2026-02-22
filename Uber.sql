CREATE DATABASE UBER;

USE UBER;

SELECT DISTINCT pickup_location 
FROM Rides;

SELECT COUNT(*) AS total_rides 
FROM Rides;

SELECT AVG(ride_duration) AS avg_duration 
FROM Rides;

SELECT driver_name, earnings 
FROM Drivers 
ORDER BY earnings DESC 
LIMIT 5;

SELECT payment_method, COUNT(*) AS ride_count 
FROM Rides 
GROUP BY payment_method;

SELECT * FROM Rides 
WHERE fare_amount > 20;

SELECT pickup_location, COUNT(*) AS location_count 
FROM Rides 
GROUP BY pickup_location 
ORDER BY location_count DESC 
LIMIT 1;

SELECT AVG(fare_amount) AS average_fare 
FROM Rides;

SELECT driver_name, rating 
FROM Drivers 
ORDER BY rating DESC 
LIMIT 10;

SELECT SUM(earnings) AS total_company_driver_earnings 
FROM Drivers;

SELECT COUNT(*) AS cash_rides 
FROM Rides 
WHERE payment_method = 'Cash';

SELECT COUNT(*) AS total_rides, AVG(ride_distance) AS avg_distance 
FROM Rides 
WHERE pickup_location = 'Dhanbad';

SELECT * FROM Rides 
WHERE ride_duration < 10;

SELECT p.passenger_name, COUNT(r.ride_id) AS ride_count
FROM Passengers p
JOIN Rides r ON p.passenger_id = r.passenger_id
GROUP BY p.passenger_name
ORDER BY ride_count DESC;

SELECT DISTINCT payment_method 
FROM Rides 
WHERE pickup_location = 'Gandhinagar';

SELECT AVG(fare_amount) AS avg_fare 
FROM Rides 
WHERE ride_distance > 10;

SELECT driver_name, total_rides 
FROM Drivers 
ORDER BY total_rides DESC;

SELECT pickup_location, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Rides) AS percentage_contribution
FROM Rides 
GROUP BY pickup_location;

SELECT * FROM Rides 
WHERE pickup_location = dropoff_location;

SELECT p.passenger_name, COUNT(DISTINCT r.pickup_location) AS unique_locations
FROM Passengers p
JOIN Rides r ON p.passenger_id = r.passenger_id
GROUP BY p.passenger_name
HAVING COUNT(DISTINCT r.pickup_location) >= 300;

SELECT AVG(fare_amount) AS avg_weekday_fare
FROM Rides
WHERE DAYOFWEEK(STR_TO_DATE(ride_timestamp, '%m/%d/%Y %H:%i')) BETWEEN 2 AND 6;

SELECT DISTINCT d.driver_name
FROM Drivers d
JOIN Rides r ON d.driver_id = r.driver_id
WHERE r.ride_distance > 19;

SELECT SUM(earnings) AS total_top_driver_earnings
FROM Drivers
WHERE total_rides > 100;

SELECT * FROM Rides 
WHERE fare_amount < (SELECT AVG(fare_amount) FROM Rides);

SELECT AVG(rating) 
FROM Drivers 
WHERE driver_id IN (SELECT driver_id FROM Rides WHERE payment_method = 'Cash')
  AND driver_id IN (SELECT driver_id FROM Rides WHERE payment_method = 'Credit Card');

SELECT passenger_name, total_spent 
FROM Passengers 
ORDER BY total_spent DESC 
LIMIT 3;

SELECT MONTH(STR_TO_DATE(ride_timestamp, '%m/%d/%Y %H:%i')) AS ride_month, 
       AVG(fare_amount) AS avg_fare
FROM Rides
GROUP BY ride_month;

SELECT pickup_location, dropoff_location, COUNT(*) as frequency
FROM Rides
GROUP BY pickup_location, dropoff_location
ORDER BY frequency DESC
LIMIT 1;

SELECT driver_name, earnings 
FROM Drivers 
ORDER BY earnings DESC;

SELECT p.passenger_name
FROM Passengers p
JOIN Rides r ON p.passenger_id = r.passenger_id
WHERE DATE(p.signup_date) = DATE(r.ride_timestamp);

SELECT driver_name, (earnings / total_rides) AS avg_earnings_per_ride
FROM Drivers
ORDER BY avg_earnings_per_ride DESC;

SELECT * FROM Rides 
WHERE ride_distance < (SELECT AVG(ride_distance) FROM Rides);

SELECT driver_name, total_rides 
FROM Drivers 
WHERE total_rides = (SELECT MIN(total_rides) FROM Drivers);

SELECT AVG(r.fare_amount)
FROM Rides r
JOIN Passengers p ON r.passenger_id = p.passenger_id
WHERE p.total_rides >= 20;

SELECT pickup_location, AVG(fare_amount) as avg_fare
FROM Rides
GROUP BY pickup_location
ORDER BY avg_fare DESC
LIMIT 1;

SELECT AVG(rating) 
FROM Drivers 
WHERE total_rides >= 100;

SELECT p.passenger_name
FROM Passengers p
JOIN Rides r ON p.passenger_id = r.passenger_id
GROUP BY p.passenger_id, p.passenger_name
HAVING COUNT(DISTINCT r.pickup_location) >= 5;

SELECT AVG(r.fare_amount)
FROM Rides r
JOIN Passengers p ON r.passenger_id = p.passenger_id
WHERE p.rating > 4;

SELECT pickup_location, MIN(ride_duration) AS min_duration
FROM Rides
GROUP BY pickup_location;

SELECT d.driver_name
FROM Drivers d
JOIN Rides r ON d.driver_id = r.driver_id
GROUP BY d.driver_id, d.driver_name
HAVING COUNT(DISTINCT r.pickup_location) = (SELECT COUNT(DISTINCT pickup_location) FROM Rides);

SELECT AVG(r.fare_amount) AS avg_fare
FROM Rides r
JOIN Passengers p ON r.passenger_id = p.passenger_id
WHERE p.total_spent > 300;

SELECT driver_name, (earnings / total_rides) AS avg_earnings_per_ride
FROM Drivers
ORDER BY avg_earnings_per_ride ASC
LIMIT 5;

SELECT SUM(fare_amount) 
FROM Rides 
WHERE passenger_id IN (
    SELECT passenger_id 
    FROM Rides 
    GROUP BY passenger_id 
    HAVING COUNT(DISTINCT payment_method) > 1
);

SELECT * FROM Rides 
WHERE fare_amount > (SELECT AVG(fare_amount) * 2 FROM Rides);

SELECT DISTINCT d.driver_name
FROM Drivers d
JOIN Rides r ON d.driver_id = r.driver_id
WHERE DATE(STR_TO_DATE(d.join_date, '%m/%d/%Y')) = DATE(STR_TO_DATE(r.ride_timestamp, '%m/%d/%Y %H:%i'));

SELECT AVG(fare_amount) 
FROM Rides 
WHERE passenger_id IN (
    SELECT passenger_id 
    FROM Rides 
    GROUP BY passenger_id 
    HAVING COUNT(DISTINCT payment_method) > 1
);

SELECT pickup_location, 
       (AVG(fare_amount) - (SELECT AVG(fare_amount) FROM Rides)) * 100.0 / (SELECT AVG(fare_amount) FROM Rides) AS percentage_increase
FROM Rides
GROUP BY pickup_location
ORDER BY percentage_increase DESC
LIMIT 1;

SELECT * FROM Rides 
WHERE pickup_location = dropoff_location;

SELECT AVG(rating) 
FROM Drivers 
WHERE driver_id IN (
    SELECT driver_id 
    FROM Rides 
    GROUP BY driver_id 
    HAVING COUNT(DISTINCT pickup_location) > 1
);














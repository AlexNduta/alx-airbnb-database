-- non-correlated subquery 
-- main intent is to return rows that have an average rating greater than 4.0
SELECT property_id,
name,
location 
FROM "Property"
WHERE property_id IN 
(SELECT property_id FROM review GROUP BY property_id HAVING AVG(rating) > 4.0 );

-- correlated sub query
-- The goal is to find users with more than 3 bookings
SELECT u.user_id, u.first_name, u.last_name, u.email
FROM "User" AS u
WHERE (SELECT COUNT(*) FROM Booking AS b WHERE b.user_id = u.user_id) >3;


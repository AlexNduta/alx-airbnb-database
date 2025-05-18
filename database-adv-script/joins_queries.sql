--inner JOIN between Users and bookings
-- main goal is to find users who have bookings

SELECT "User".user_id,
"User".first_name,
"User".last_name,
Booking.Booking_id,
Booking.start_date,
Booking.end_date,
Booking.status
FROM "User"
INNER JOIN
Booking
ON "User".user_id = Booking.user_id;


-- we can rewrite this using SQL aliases

SELECT
u.user_id,
u.first_name,
u.last_name,
b.booking_id,
b.start_date,
b.end_date,
b.status
FROM  "User" AS u
INNER JOIN Booking AS b
ON u.user_id = b.user_id;



-- LEFT JOIN for Properties and bookings
-- main goal is to find all properties with and withut reviews
SELECT
p.property_id,
p.name,p.location,
r.review_id,
r.rating,
r.comment,
r.user_id
FROM "Property" AS p
LEFT JOIN review AS r
ON p.property_id = r.property_id
ORDER BY r.rating ASC;


-- FULL OUTER JOIN between Users and Bookings
-- The goal is to find all users and bookings even if the user does not have bookings or bookings do not have a user
SELECT
u.user_id,
u.first_name,
u.last_name,
u.email,
b.booking_id,
b.property_id,
b.start_date,
b.end_date,
b.status
FROM Booking AS b
FULL OUTER JOIN "User" AS u
On u.user_id = b.user_id;



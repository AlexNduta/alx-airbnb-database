 SELECT b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
u.first_name AS user_first_name, u.last_name AS user_last_name, u.email AS user_email,
p.name AS property_name, p.property_id AS property_id, p.location AS property_location,
pm.amount AS payment_amount, pm.payment_date AS payment_date, pm.payment_method AS payment_method
FROM Booking as b
INNER JOIN "User" AS u
ON b.user_id = u.user_id
INNER JOIN "Property" AS p
ON b.property_id = p.property_id
LEFT JOIN Payment AS pm
ON b.booking_id = pm.booking_id;

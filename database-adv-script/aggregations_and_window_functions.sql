
-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT u.user_id, u.first_name, u.last_name, u.email,
COUNT(b.booking_id) FROM  "User" AS u
LEFT JOIN booking AS b
ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name, u.email;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
WITH PropertyBookingCounts AS (
    -- Step 1: Calculate the total number of bookings for each property
    SELECT
        p.property_id,
        p.name AS property_name, -- Giving an alias to p.name for clarity
        p.location,
        COUNT(b.booking_id) AS total_bookings
    FROM
        property AS p  -- Assuming 'property' is the lowercase name of your Property table
    LEFT JOIN
        booking AS b ON p.property_id = b.property_id
    GROUP BY
        p.property_id,
        p.name,
        p.location
)
-- Step 2: Select from the CTE and apply the window function to rank
SELECT
    property_id,
    property_name,
    location,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS property_rank
FROM
    PropertyBookingCounts
ORDER BY
    property_rank ASC, -- Show highest rank (rank 1) first
    total_bookings DESC,
    property_name ASC; -- Further sorting for consistent results if ranks/bookings are tied

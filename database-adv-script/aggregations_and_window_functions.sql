
-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT u.user_id, u.first_name, u.last_name, u.email,
COUNT(b.booking_id) FROM  "User" AS u
LEFT JOIN booking AS b
ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name, u.email;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

WITH PropertyBookingCounts AS (
    -- Step 1: Calculate the total number of bookings for each property (this part remains the same)
    SELECT
        p.property_id,
        p.name AS property_name,
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
-- Step 2: Select from the CTE and apply the ROW_NUMBER() window function to rank
SELECT
    property_id,
    property_name,
    location,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS property_row_num_rank -- Using ROW_NUMBER()
FROM
    PropertyBookingCounts
ORDER BY
    property_row_num_rank ASC, -- Show lowest row number ( effectively rank 1) first
    property_name ASC;         -- Further sorting for consistent results if row numbers are tied (though they won't be)

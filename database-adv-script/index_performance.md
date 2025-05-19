# Indexes
- identify and devide columns in the tables `User`, `Booking` and `Property` that might need indexing
- These are columns with high usage
- These columns could have the clauses `WHERE`, `JOIN` and `ORDER BY` used oftenly

Prerequiste:
    * All primary keys have indexes set by default that do not need an extra column.
        - User: user_id, 
        - Booking: booking_id
        - Property: property_id
    * All columns that have `UNIQUE` set have indexes by default
    
## User
1. `user_id`(PK)
    does not need an index
2. `email` (UNIQUE)
    - does not need an index as it is a unique value that has an index by default

3. `first_name` and `last_name`
    - These could be potential candidates to have indexes as queries could use the `WHERE` clause to find a specific user
    - Recomend creating an index for this

## Property
1. `property_id` (PK)
    - does not need an index as it is a primary key
2. host_id(FK)
    - as a foreign key, it might be used in `JOIN`
    - can also be use to find all properties that belong to a specific user 
    - This is a strong candidate for an index
3.`location`
    - This might be used with the `WHERE` clause to find an item by location
    - A good candidate if search by location are common

4. `Price_per_night`:
    - This can be used with the `WHERE` clause to search for specific properties accoding to price
    - it can also be used with the `ORDER BY` to group properties according to prices
## Booking
1. `booking_id`(PK)
2. `property_id`(FK)
    - Can be used for JOIN operations
    - This can also be used to find specific property bookings using the `WHERE` clause
    - This is a strong candidate for indexing

3. `user_id` (FK)
    - Essential for joins
    - can be used with `WHERE` clause to find specific users that have bookings

4. `start_date and end_date`
    - common use with the `WHERE` clause to find bookings with a date range
    - strong candidate for indexing

5. `status`
    - Might be used with `WHERE` to find specific booking status e.g find pending bookings
    - 

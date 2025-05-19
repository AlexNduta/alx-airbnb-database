-- suggested  indexes


CREATE INDEX IF NOT EXISTS idx_user_email ON "User"(email); -- IF NOT EXISTS is good practice

-- Indexes on Foreign Keys
CREATE INDEX IF NOT EXISTS idx_property_host_id ON property(host_id);
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON booking(property_id);
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON booking(user_id);
CREATE INDEX IF NOT EXISTS idx_payment_booking_id ON payment(booking_id);
CREATE INDEX IF NOT EXISTS idx_review_property_id ON review(property_id);
CREATE INDEX IF NOT EXISTS idx_review_user_id ON review(user_id);
CREATE INDEX IF NOT EXISTS idx_message_sender_id ON message(sender_id);
CREATE INDEX IF NOT EXISTS idx_message_recipient_id ON message(recipient_id);

-- index on finding location
CREATE INDEX idx_property_location ON "Property" (location);

-- indexes on the start and end dates
CREATE INDEX idx_booking_start_date ON booking (start_date);
CREATE INDEX idx_booking_end_date ON booking (end_date);


-- measure query perfomance
-- Before adding an index
EXPLAIN ANALYZE SELECT property_id, review_id, rating, user_id, rating
FROM Review WHERE comment = 'Average stay';
                                               QUERY PLAN                                               
--------------------------------------------------------------------------------------------------------
 Seq Scan on review  (cost=0.00..71.10 rows=1320 width=56) (actual time=0.011..0.489 rows=1320 loops=1)
   Filter: (comment = 'Average stay'::text)
   Rows Removed by Filter: 1408
 Planning Time: 0.051 ms
 Execution Time: 0.558 ms
(5 rows)

-- after adding an index
EXPLAIN ANALYZE SELECT property_id, review_id, rating, user_id, rating
FROM Review WHERE comment = 'Average stay';
                                               QUERY PLAN
--------------------------------------------------------------------------------------------------------
 Seq Scan on review  (cost=0.00..71.10 rows=1320 width=56) (actual time=0.014..0.724 rows=1320 loops=1)
   Filter: (comment = 'Average stay'::text)
   Rows Removed by Filter: 1408
 Planning Time: 0.199 ms
 Execution Time: 0.828 ms
(5 rows)


-- I honestly did not see much changes, maybe I should try it out on a larger dataset


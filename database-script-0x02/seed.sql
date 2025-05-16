INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('a11ce001-face-4567-b89b-000000000001', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_alice', '555-0101', 'host', '2024-01-10 10:00:00'),
('b0b00002-face-4567-b89b-000000000002', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password_bob', '555-0102', 'guest', '2024-02-15 11:30:00'),
('c4a211e3-face-4567-b89b-000000000003', 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashed_password_charlie', NULL, 'host', '2024-03-20 14:15:00'),
('d1a7a004-face-4567-b89b-000000000004', 'Diana', 'Prince', 'diana.prince.admin@example.com', 'hashed_password_diana', '555-0199', 'admin', '2024-01-01 09:00:00');


INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
('p0000001-prop-4567-b89b-000000000001', 'a11ce001-face-4567-b89b-000000000001', 'Alice''s Beach House', 'A beautiful house by the sea with stunning views and direct beach access.', 'Sunset Beach, CA', 250.00, '2024-01-15 10:00:00', '2024-01-15 10:00:00'),
('p0000002-prop-4567-b89b-000000000002', 'a11ce001-face-4567-b89b-000000000001', 'Alice''s City Loft', 'Stylish loft in the heart of downtown, close to all amenities and nightlife.', 'Metropolis Center, NY', 175.50, '2024-02-01 12:00:00', '2024-02-01 12:00:00'),
('p0000003-prop-4567-b89b-000000000003', 'c4a211e3-face-4567-b89b-000000000003', 'Charlie''s Cozy Cabin', 'A rustic cabin in the woods, perfect for a quiet getaway. Features a fireplace and hiking trails.', 'Whispering Pines, CO', 120.00, '2024-03-25 16:00:00', '2024-03-25 16:00:00');


INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
-- Booking 1: Bob books Alice's Beach House (P1) - Past, Confirmed (5 nights * 250 = 1250)
('b0000001-book-4567-b89b-000000000001', 'p0000001-prop-4567-b89b-000000000001', 'b0b00002-face-4567-b89b-000000000002', '2025-03-01', '2025-03-06', 1250.00, 'confirmed', '2025-01-10 09:00:00'),

-- Booking 2: Alice books Charlie's Cabin (P3) - Future, Pending (3 nights * 120 = 360)
('b0000002-book-4567-b89b-000000000002', 'p0000003-prop-4567-b89b-000000000003', 'a11ce001-face-4567-b89b-000000000001', '2025-08-01', '2025-08-04', 360.00, 'pending', '2025-04-15 10:30:00'),

-- Booking 3: Bob books Charlie's Cabin (P3) - Past, Canceled (4 nights * 120 = 480)
('b0000003-book-4567-b89b-000000000003', 'p0000003-prop-4567-b89b-000000000003', 'b0b00002-face-4567-b89b-000000000002', '2025-04-10', '2025-04-14', 480.00, 'canceled', '2025-02-20 11:00:00'),

-- Booking 4: Bob books Alice's City Loft (P2) - Current, Confirmed (7 nights * 175.50 = 1228.50)
('b0000004-book-4567-b89b-000000000004', 'p0000002-prop-4567-b89b-000000000002', 'b0b00002-face-4567-b89b-000000000002', '2025-05-12', '2025-05-19', 1228.50, 'confirmed', '2025-03-01 17:00:00'),

-- Booking 5: Charlie books Alice's Beach House (P1) - Far Future, Confirmed (7 nights * 250 = 1750)
('b0000005-book-4567-b89b-000000000005', 'p0000001-prop-4567-b89b-000000000001', 'c4a211e3-face-4567-b89b-000000000003', '2025-12-20', '2025-12-27', 1750.00, 'confirmed', '2025-05-01 08:20:00');

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
-- Payment for Booking 1 (Bob's stay at P1)
('py000001-pay-4567-b89b-000000000001', 'b0000001-book-4567-b89b-000000000001', 1250.00, '2025-01-10 09:05:00', 'credit_card'),

-- Payment for Booking 4 (Bob's current stay at P2)
('py000002-pay-4567-b89b-000000000002', 'b0000004-book-4567-b89b-000000000004', 1228.50, '2025-03-01 17:05:00', 'paypal'),

-- Payment for Booking 5 (Charlie's future stay at P1)
('py000003-pay-4567-b89b-000000000003', 'b0000005-book-4567-b89b-000000000005', 1750.00, '2025-05-01 08:25:00', 'stripe');


INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
-- Bob reviews Alice's Beach House (P1) from his past Booking 1
('r0000001-rev-4567-b89b-000000000001', 'p0000001-prop-4567-b89b-000000000001', 'b0b00002-face-4567-b89b-000000000002', 5, 'Absolutely loved the Beach House! The views were incredible, and Alice was a fantastic host. Highly recommend!', '2025-03-07 10:00:00'),

-- Bob reviews Alice's City Loft (P2) after his current Booking 4 is considered "completed" for this sample data
('r0000002-rev-4567-b89b-000000000002', 'p0000002-prop-4567-b89b-000000000002', 'b0b00002-face-4567-b89b-000000000002', 4, 'The City Loft was very stylish and in a great location. A bit noisy at night, but that''s expected downtown. Overall, a great stay.', '2025-05-20 09:30:00');

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
-- Bob asks Alice about check-in for Booking 1 (P1)
('m0000001-msg-4567-b89b-000000000001', 'b0b00002-face-4567-b89b-000000000002', 'a11ce001-face-4567-b89b-000000000001', 'Hi Alice, just wondering about the check-in process for my booking at the Beach House on March 1st. Is there a key code?', '2025-02-25 14:30:00'),

-- Alice replies to Bob
('m0000002-msg-4567-b89b-000000000002', 'a11ce001-face-4567-b89b-000000000001', 'b0b00002-face-4567-b89b-000000000002', 'Hi Bob, thanks for reaching out! Yes, the key code is 1234#. I''ll also send you full instructions the day before. Looking forward to hosting you!', '2025-02-25 15:00:00'),

-- Charlie sends a message to Alice regarding her booking at his cabin
('m0000003-msg-4567-b89b-000000000003', 'c4a211e3-face-4567-b89b-000000000003', 'a11ce001-face-4567-b89b-000000000001', 'Hello Alice, I see your booking for the cabin in August is pending. Just let me know if you have any questions before confirming!', '2025-04-16 11:00:00');



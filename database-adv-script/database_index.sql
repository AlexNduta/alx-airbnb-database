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

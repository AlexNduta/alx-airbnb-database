# Normalisation


##Database Specification - AirBnB
Entities and Attributes
User

    user_id: Primary Key, UUID, Indexed
    first_name: VARCHAR, NOT NULL
    last_name: VARCHAR, NOT NULL
    email: VARCHAR, UNIQUE, NOT NULL
    password_hash: VARCHAR, NOT NULL
    phone_number: VARCHAR, NULL
    role: ENUM (guest, host, admin), NOT NULL
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Property

    property_id: Primary Key, UUID, Indexed
    host_id: Foreign Key, references User(user_id)
    name: VARCHAR, NOT NULL
    description: TEXT, NOT NULL
    location: VARCHAR, NOT NULL
    pricepernight: DECIMAL, NOT NULL
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
    updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

Booking

    booking_id: Primary Key, UUID, Indexed
    property_id: Foreign Key, references Property(property_id)
    user_id: Foreign Key, references User(user_id)
    start_date: DATE, NOT NULL
    end_date: DATE, NOT NULL
    total_price: DECIMAL, NOT NULL
    status: ENUM (pending, confirmed, canceled), NOT NULL
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Payment

    payment_id: Primary Key, UUID, Indexed
    booking_id: Foreign Key, references Booking(booking_id)
    amount: DECIMAL, NOT NULL
    payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
    payment_method: ENUM (credit_card, paypal, stripe), NOT NULL

Review

    review_id: Primary Key, UUID, Indexed
    property_id: Foreign Key, references Property(property_id)
    user_id: Foreign Key, references User(user_id)
    rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
    comment: TEXT, NOT NULL
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Message

    message_id: Primary Key, UUID, Indexed
    sender_id: Foreign Key, references User(user_id)
    recipient_id: Foreign Key, references User(user_id)
    message_body: TEXT, NOT NULL
    sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

==========================================================================================================================================
**1st Normal Form**
- The database contains:
    * `user`
    * `property`
    * `Booking`
    * `payment`
    * `Review`
    * `message`

- All these entities are compliant with the first normal form as all the items are designed to fit in a single column

    

**2nd normal form**
- the first requirement is that the table has to be in the `first normal form`, which it is
- The tartget is the entities with composite key(combo of PK and FK)
`Rule`: all non-key items must be uniquely identified using the composite key, not part of it

- tables with composite key:
    * Property
    * Booking
    * payment
    * Review
    * Message

- We will not be changing any structure because for tables with  composite key, the non-key elements in them fully depend on the composite key.
- In short, there is no `partial dependency`

**3rd normal form**
- The table can be said to be in 3rdNF because the tables with composite keys do not have trasnsitive dependency
- `Transitive dependency` is where an entry in a table is dependent  on another entry which now depends on the primary key
- The best way to combat this is to take the two related items that depend on each  other and put them in the same database and give an primary ID that will be used as a foreign key for the former DB 

CREATE TABLE users(
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number_id UUID,
    role VARCHAR(50) DEFAULT 'user',

    FOREIGN KEY (phone_number_id) REFERENCES phone_numbers(phone_number_id)
);

CREATE TABLE auth_methods(
    auth_method_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    method_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE user_auth(
    user_id UUID,
    auth_method_id UUID,
    
    PRIMARY KEY (user_id, auth_method_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (auth_method_id) REFERENCES auth_methods(auth_method_id)
);

CREATE TABLE password_auth (
    password_auth_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID,
    password_hash VARCHAR(255) NOT NULL,
    salt VARCHAR(64) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE event_type(
    event_type_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event_type_name VARCHAR(255) UNIQUE NOT NULL
);

----------------- global address design

CREATE TABLE countries(
    country_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    country_name VARCHAR(255) UNIQUE NOT NULL,
    country_code VARCHAR(10) NOT NULL -- international dial code
);

CREATE TABLE states(
    state_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    state_name VARCHAR(255) NOT NULL,
    country_id UUID,

    FOREIGN KEY(country_id) REFERENCES countries(country_id)
);

CREATE TABLE cities(
    city_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_name VARCHAR(255) NOT NULL,
    state_id UUID,

    FOREIGN KEY(state_id) REFERENCES states(state_id)
);

CREATE TABLE addresses(
    address_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    street VARCHAR(255) NOT NULL,
    suburb VARCHAR(255),
    city_id UUID,
    state_id UUID,
    country_id UUID,
    postal_code VARCHAR(20),

    FOREIGN KEY(city_id) REFERENCES cities(city_id),
    FOREIGN KEY(state_id) REFERENCES states(state_id),
    FOREIGN KEY(country_id) REFERENCES countries(country_id)
);

-----------------

----------------- global phone number design

CREATE TABLE phone_numbers (
    phone_number_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    country_id UUID,
    national_code VARCHAR(10), -- 415 for San Francisco
    subscriber_number VARCHAR(20) NOT NULL,
    extension VARCHAR(10),
    
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    UNIQUE (country_id, national_code, subscriber_number)
);

-----------------

CREATE TABLE venues(
    venue_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    venue_name VARCHAR(255) NOT NULL,
    address_id UUID,
    capacity INT,
    phone_number_id UUID,

    FOREIGN KEY (address_id) REFERENCES addresses(address_id),
    FOREIGN KEY (phone_number_id) REFERENCES phone_numbers(phone_number_id)
);

CREATE TABLE organizers(
    organizer_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organizer_name VARCHAR(255) NOT NULL,
    phone_number_id UUID,

    FOREIGN KEY (phone_number_id) REFERENCES phone_numbers(phone_number_id)
);

CREATE TABLE schedules(
    schedule_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL,

    CHECK (end_time > start_time)
);

CREATE TABLE events(
    event_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event_name VARCHAR(255) NOT NULL,
    event_type_id UUID,
    schedule_id UUID,
    venue_id UUID,
    organizer_id UUID,

    FOREIGN KEY (event_type_id) REFERENCES event_type(event_type_id),
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id),
    FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id),
    FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id)
);


CREATE TABLE guests(
    guest_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID,
    event_id UUID,
    guest_status VARCHAR(20) DEFAULT 'invited', -- invited/attending/declined

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);


CREATE TABLE expense_type(
    expense_type_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    expense_type_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE expenses(
    expense_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event_id UUID,
    expense_type_id UUID,
    amount NUMERIC,
    payment_status VARCHAR(20) DEFAULT 'pending',

    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (expense_type_id) REFERENCES expense_type(expense_type_id)
);

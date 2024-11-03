CREATE TABLE users(
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(50) DEFAULT 'user'
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
    FOREIGN KEY (auth_method_id) REFERENCES auth_methods(auth_method_id),
);

CREATE TABLE password_auth (
    password_auth_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID,
    password_hash VARCHAR(255) NOT NULL,
    salt VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE event_type(
    event_type_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event_type_name VARCHAR(255) NOT NULL,
);

CREATE TABLE venues(
    venue_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    venue_name VARCHAR(255) NOT NULL,
    -- address handle like a pro
    capacity INT,
    -- contact no handle like pro
);

CREATE TABLE events(
    event_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event_name VARCHAR(255) NOT NULL,
    event_type_id UUID,
    event_date TIMESTAMPTZ,


    FOREIGN KEY (event_type_id) REFERENCES event_type(event_type_id)

);

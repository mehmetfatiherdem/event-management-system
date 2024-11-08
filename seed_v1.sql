INSERT INTO countries(country_name, country_code) VALUES 
('Canada', '1'),
('United States of America', '1'),
('Mexico', '52'),
('United Kingdom', '44'),
('Germany', '49'),
('France', '33'),
('Italy', '39'),
('Spain', '34'),
('Australia', '61'),
('India', '91'),
('China', '86'),
('Japan', '81'),
('Brazil', '55'),
('South Africa', '27'),
('Russia', '7'),
('Argentina', '54'),
('New Zealand', '64'),
('Singapore', '65'),
('Sweden', '46'),
('Norway', '47');

INSERT INTO phone_numbers (country_id, national_code, subscriber_number, phone_number_extension) VALUES
((SELECT country_id FROM countries WHERE country_name = 'Canada'), '416', '1234567', NULL),
((SELECT country_id FROM countries WHERE country_name = 'United States of America'), '212', '5551234', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Mexico'), '55', '1234567', NULL),
((SELECT country_id FROM countries WHERE country_name = 'United Kingdom'), '20', '7946000000', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Germany'), '30', '123456789', NULL),
((SELECT country_id FROM countries WHERE country_name = 'France'), '1', '23 45 67 89 00', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Italy'), '6', '123456789', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Spain'), '91', '123456789', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Australia'), '2', '12345678', NULL),
((SELECT country_id FROM countries WHERE country_name = 'India'), '11', '1234567890', NULL),
((SELECT country_id FROM countries WHERE country_name = 'China'), '10', '12345678', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Japan'), '3', '12345678', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Brazil'), '11', '912345678', NULL),
((SELECT country_id FROM countries WHERE country_name = 'South Africa'), '11', '1234567', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Russia'), '495', '1234567', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Argentina'), '11', '1234567890', NULL),
((SELECT country_id FROM countries WHERE country_name = 'New Zealand'), '9', '1234567', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Singapore'), '65', '12345678', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Sweden'), '8', '12345678', NULL),
((SELECT country_id FROM countries WHERE country_name = 'Norway'), '21', '12345678', NULL);

INSERT INTO users (first_name, last_name, email, phone_number_id) VALUES
('John', 'Doe', 'jdoe@gmail.com', 
    (SELECT phone_number_id FROM phone_numbers 
     WHERE country_id = (SELECT country_id FROM countries WHERE country_name = 'Canada') 
     LIMIT 1)),
('Alice', 'Smith', 'asmith@gmail.com', 
    (SELECT phone_number_id FROM phone_numbers 
     WHERE country_id = (SELECT country_id FROM countries WHERE country_name = 'United States') 
     LIMIT 1)),
('Maria', 'Gonzalez', 'mgonzalez@gmail.com', 
    (SELECT phone_number_id FROM phone_numbers 
     WHERE country_id = (SELECT country_id FROM countries WHERE country_name = 'Mexico') 
     LIMIT 1)),
('Chen', 'Wang', 'cwang@gmail.com', 
    (SELECT phone_number_id FROM phone_numbers 
     WHERE country_id = (SELECT country_id FROM countries WHERE country_name = 'China') 
     LIMIT 1)),
('Kumar', 'Patel', 'kpatel@gmail.com', 
    (SELECT phone_number_id FROM phone_numbers 
     WHERE country_id = (SELECT country_id FROM countries WHERE country_name = 'India') 
     LIMIT 1));

INSERT INTO auth_methods(auth_method_name) VALUES 
('password');

INSERT INTO user_auth(user_id, auth_method_id) VALUES
((SELECT u.user_id FROM users u WHERE u.email = 'jdoe@gmail.com'), (SELECT auth_method_id FROM auth_methods WHERE auth_method_name = 'password')),
((SELECT u.user_id FROM users u WHERE u.email = 'asmith@gmail.com'), (SELECT auth_method_id FROM auth_methods WHERE auth_method_name = 'password')),
((SELECT u.user_id FROM users u WHERE u.email = 'mgonzalez@gmail.com'), (SELECT auth_method_id FROM auth_methods WHERE auth_method_name = 'password')),
((SELECT u.user_id FROM users u WHERE u.email = 'cwang@gmail.com'), (SELECT auth_method_id FROM auth_methods WHERE auth_method_name = 'password')),
((SELECT u.user_id FROM users u WHERE u.email = 'kpatel@gmail.com'), (SELECT auth_method_id FROM auth_methods WHERE auth_method_name = 'password'));

INSERT INTO password_auth(user_id, password_hash, salt) VALUES
((SELECT u.user_id FROM users u WHERE u.email = 'jdoe@gmail.com'), '12345', 'tOtaLlySecuRe_sALt123#'),
((SELECT u.user_id FROM users u WHERE u.email = 'asmith@gmail.com'), '12345', 'tOtaLlySecuRe_sALt123#'),
((SELECT u.user_id FROM users u WHERE u.email = 'mgonzalez@gmail.com'), '12345', 'tOtaLlySecuRe_sALt123#'),
((SELECT u.user_id FROM users u WHERE u.email = 'cwang@gmail.com'), '12345', 'tOtaLlySecuRe_sALt123#'),
((SELECT u.user_id FROM users u WHERE u.email = 'kpatel@gmail.com'), '12345', 'tOtaLlySecuRe_sALt123#');

INSERT INTO event_type(event_type_name) VALUES
('concert'),
('summit');

INSERT INTO states(state_name, country_id) VALUES
('Alabama', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Alaska', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Arizona', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Arkansas', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('California', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Colorado', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Connecticut', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Delaware', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Florida', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Georgia', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Hawaii', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Idaho', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Illinois', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Indiana', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Iowa', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Kansas', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Kentucky', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Louisiana', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Maine', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Maryland', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Massachusetts', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Michigan', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Minnesota', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Mississippi', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Missouri', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Montana', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Nebraska', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Nevada', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('New Hampshire', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('New Jersey', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('New Mexico', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('New York', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('North Carolina', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('North Dakota', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Ohio', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Oklahoma', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Oregon', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Pennsylvania', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Rhode Island', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('South Carolina', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('South Dakota', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Tennessee', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Texas', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Utah', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Vermont', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Virginia', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Washington', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('West Virginia', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Wisconsin', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('Wyoming', (SELECT country_id FROM countries WHERE country_name = 'United States of America')),
('New South Wales', (SELECT country_id FROM countries WHERE country_name = 'Australia')),
('Queensland', (SELECT country_id FROM countries WHERE country_name = 'Australia')),
('South Australia', (SELECT country_id FROM countries WHERE country_name = 'Australia')),
('Tasmania', (SELECT country_id FROM countries WHERE country_name = 'Australia')),
('Victoria', (SELECT country_id FROM countries WHERE country_name = 'Australia')),
('Western Australia', (SELECT country_id FROM countries WHERE country_name = 'Australia')),
('Australian Capital Territory', (SELECT country_id FROM countries WHERE country_name = 'Australia')),
('Northern Territory', (SELECT country_id FROM countries WHERE country_name = 'Australia')),
('Andhra Pradesh', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Arunachal Pradesh', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Assam', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Bihar', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Chhattisgarh', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Goa', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Gujarat', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Haryana', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Himachal Pradesh', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Jharkhand', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Karnataka', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Kerala', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Madhya Pradesh', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Maharashtra', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Manipur', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Meghalaya', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Mizoram', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Nagaland', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Odisha', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Punjab', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Rajasthan', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Sikkim', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Tamil Nadu', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Telangana', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Tripura', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Uttar Pradesh', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Uttarakhand', (SELECT country_id FROM countries WHERE country_name = 'India')),
('West Bengal', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Andaman and Nicobar Islands', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Chandigarh', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Dadra and Nagar Haveli and Daman and Diu', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Lakshadweep', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Delhi', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Puducherry', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Ladakh', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Jammu and Kashmir', (SELECT country_id FROM countries WHERE country_name = 'India')),
('Acre', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Alagoas', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Amapá', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Amazonas', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Bahia', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Ceará', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Distrito Federal', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Espírito Santo', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Goiás', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Maranhão', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Mato Grosso', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Mato Grosso do Sul', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Minas Gerais', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Pará', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Paraíba', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Paraná', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Pernambuco', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Piauí', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Rio de Janeiro', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Rio Grande do Norte', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Rio Grande do Sul', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Rondônia', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Roraima', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Santa Catarina', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('São Paulo', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Sergipe', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Tocantins', (SELECT country_id FROM countries WHERE country_name = 'Brazil')),
('Buenos Aires', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Catamarca', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Chaco', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Chubut', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Córdoba', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Corrientes', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Entre Ríos', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Formosa', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Jujuy', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('La Pampa', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('La Rioja', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Mendoza', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Misiones', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Neuquén', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Río Negro', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Salta', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('San Juan', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('San Luis', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Santa Cruz', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Santa Fe', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Santiago del Estero', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Tierra del Fuego', (SELECT country_id FROM countries WHERE country_name = 'Argentina')),
('Tucumán', (SELECT country_id FROM countries WHERE country_name = 'Argentina'));

INSERT INTO provinces (province_name, country_id) VALUES
('Alberta', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('British Columbia', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('Manitoba', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('New Brunswick', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('Newfoundland and Labrador', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('Nova Scotia', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('Ontario', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('Prince Edward Island', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('Quebec', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('Saskatchewan', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('Northwest Territories', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('Nunavut', (SELECT country_id FROM countries WHERE country_name = 'Canada')),
('Yukon', (SELECT country_id FROM countries WHERE country_name = 'Canada'));

INSERT INTO cities(city_name, state_id, province_id
) VALUES
('Toronto', NULL, (SELECT province_id FROM provinces WHERE province_name = 'Ontario')),
('Austin', (SELECT state_id FROM states WHERE state_name = 'Texas'), NULL);

INSERT INTO addresses(street, suburb, city_id, state_id, province_id, country_id, postal_code
) VALUES
('60 Queen St E', NULL, (SELECT city_id FROM cities WHERE city_name = 'Toronto'), NULL, (SELECT province_id FROM provinces WHERE province_name = 'Ontario'), (SELECT country_id FROM countries WHERE country_name = 'Canada'), 'M5C 2T3');

INSERT INTO venues(venue_name, address_id, capacity, phone_number_id) VALUES
('Harley Hall', (SELECT address_id FROM addresses WHERE country_id = (SELECT country_id FROM countries WHERE country_name = 'Canada' LIMIT 1)), 1000, (SELECT phone_number_id FROM phone_numbers WHERE country_id = (SELECT country_id FROM countries WHERE country_name = 'Canada' LIMIT 1)));

INSERT INTO organizers(organizer_name, phone_number_id) VALUES
('PEPSICO', (SELECT phone_number_id FROM phone_numbers WHERE country_id = (SELECT country_id FROM countries WHERE country_name = 'Canada' LIMIT 1)));


INSERT INTO schedules(start_time, end_time) VALUES
('2024-11-10 21:00:00+00', '2024-11-10 23:00:00+00');

INSERT INTO expense_types(expense_type_name) VALUES
('Marketing and Promotion');

INSERT INTO events(event_name, event_type_id, schedule_id, venue_id, organizer_id) VALUES
('Imagine Dragons Concert', (SELECT event_type_id FROM event_type WHERE event_type_name = 'concert'), (SELECT schedule_id FROM schedules LIMIT 1), (SELECT venue_id FROM venues WHERE venue_name = 'Harley Hall'), (SELECT organizer_id FROM organizers WHERE organizer_name = 'PEPSICO'));

INSERT INTO guests(user_id, event_id) VALUES
((SELECT user_id FROM users WHERE email = 'jdoe@gmail.com'), (SELECT event_id FROM events WHERE event_name = 'Imagine Dragons Concert' LIMIT 1));

INSERT INTO currencies (currency_code, currency_name) VALUES
('CAD', 'Canadian Dollars');

INSERT INTO expenses(event_id, expense_type_id, amount, currency_id) VALUES
((SELECT event_id FROM events WHERE event_name = 'Imagine Dragons Concert'), (SELECT expense_type_id FROM expense_types WHERE expense_type_name = 'Marketing and Promotion'), 80000, (SELECT currency_id FROM currencies WHERE currency_code = 'CAD'));



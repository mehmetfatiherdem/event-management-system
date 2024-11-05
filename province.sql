CREATE TABLE provinces(
    province_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    province_name VARCHAR(255) NOT NULL,
    country_id UUID,
    FOREIGN KEY(country_id) REFERENCES countries(country_id)
);

ALTER TABLE cities
ADD COLUMN province_id UUID, ADD FOREIGN KEY (province_id) REFERENCES provinces(province_id);


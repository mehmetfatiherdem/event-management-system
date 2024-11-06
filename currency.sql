CREATE TABLE currencies (
    currency_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    currency_code VARCHAR(3),
    currency_name VARCHAR(50),
    currency_symbol VARCHAR(5)
);

ALTER TABLE expenses
ADD COLUMN currency_id UUID,
ADD FOREIGN KEY (currency_id) REFERENCES currencies(currency_id);


CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(200), price DECIMAL(7, 2));

INSERT INTO spaces (name,description,price) VALUES ('hotel','two bed hotelroom', 600.00);

INSERT INTO spaces (name,description,price) VALUES ('penthouse','penthouse w/ hot tub', 1000.00);

INSERT INTO spaces (name,description,price) VALUES ('motel','single bed', 200.00);

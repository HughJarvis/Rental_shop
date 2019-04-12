DROP TABLE rentals;
DROP TABLE vehicles;
DROP TABLE customers;


CREATE TABLE vehicles(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  category VARCHAR,
  on_hire VARCHAR,
  image VARCHAR
);

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  second_name VARCHAR
);

CREATE TABLE rentals(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  vehicle_id INT REFERENCES vehicles(id) ON DELETE CASCADE
);

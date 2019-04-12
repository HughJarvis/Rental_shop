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

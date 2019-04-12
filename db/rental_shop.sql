DROP TABLE vehicles;


CREATE TABLE vehicles(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  category VARCHAR,
  on_hire VARCHAR,
  image VARCHAR
);

-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country_id INTEGER NOT NULL REFERENCES country
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city INTEGER NOT NULL REFERENCES city,
  to_city INTEGER NOT NULL REFERENCES city
);


INSERT INTO country
  (country_name)
VALUES
  ('Brazil'), ('Chile'), ('UAE'), ('China'), ('Mexico'), ('Morocco'),('United States'), ('France'), ('Japan'), ('United Kingdom');

INSERT INTO city
  (city_name, country_id)
VALUES
  ('Cedar Rapids', 7),
  ('Chicago', 7),
  ('Charlotte', 7),
  ('Los Angeles', 7),
  ('New York', 7),
  ('Seattle', 7),
  ('Washington DC', 7),
  ('New Orleans', 7),
  ('Las Vegas', 7),
  ('Sao Paolo', 1),
  ('Santiago', 2),
  ('Dubai', 3),
  ('Beijing', 4),
  ('Mexico City', 5),
  ('Casablanca', 6),
  ('Paris', 8),
  ('Tokyo', 9),
  ('London', 10);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, to_city)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 7, 6),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 17, 18),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 4, 9),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 6, 14),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 16, 15),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 12, 13),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 5, 3),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 1, 2),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 3, 8),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 10, 11);
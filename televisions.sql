-- In case there is already a televisions_lab database, drop it
DROP DATABASE televisions;

-- Create a televisions_lab database
CREATE DATABASE televisions;

-- Connect to the televisions_lab databases
\c televisions

-- Create a tv_models table
--  The table should have id, make, model, screen_size, resolution,
--  price, release_date, photo_url
CREATE TABLE tv_models (
  id serial PRIMARY KEY,
  make TEXT,
  model TEXT,
  screen_size NUMERIC,
  resolution TEXT,
  price NUMERIC(3, 2),
  release_date DATE,
  photo_url TEXT
)


-- Alter the tv_models, removing the resolution column
ALTER TABLE tv_models DROP COLUMN resolution;

--  and add vertical_resolution and horizontal_resolution columns
ALTER TABLE tv_models ADD vertical_resolution TEXT;
ALTER TABLE tv_models ADD horizontal_resolution TEXT;

-- Insert 4 televisions into the tv_models table
INSERT INTO tv_models (make, model, screen_size, price, release_date, photo_url, vertical_resolution, horizontal_resolution)
  VALUES ('Samsung', '3000', '40', 9.99, '2014-01-22', 'http://samsung.com/photo.jpg', 1020, 768);

INSERT INTO tv_models (make, model, screen_size, price, release_date, photo_url, vertical_resolution, horizontal_resolution)
  VALUES ('Samsung', '4000', '80', 2.99, '2014-01-22', 'http://samsung.com/photo2.jpg', 1300, 900);

-- Select all entries from the tv_models table
SELECT * from tv_models;

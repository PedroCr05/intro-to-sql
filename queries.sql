psql -- This is how we get started with sequel

\q -- This command is how you quit out of the shell/shutting down the shell

sequel -- is basically structure query language but sql is more common to be spelt as

-- MongoDB is considered as a non-sql DB

CREATE DATABASE music;

-- Remember to always end a cmd with a semi colon ";"

\l

-- Lists ALL tables in our database

\c

-- We connect to out database specifically just like accessing a folder

CREATE TABLE bands (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    genre VARCHAR
)

-- This is how it looks when creating out database structure

\dt

-- This displays our tables

INSERT INTO bands (name, genre) 
VALUES 
('The Beatles', 'Rock');
('The Rolling Stones', 'Rock');
('The Who', 'Rock');

-- THis is how we implement out data into the DB so it's readable

SELECT * FROM bands;

-- This is how we go by reading out data if we were curious | Although this is a return of ALL the data

SELECT name FROM bands WHERE genre = 'Rock';

-- This is how we can a return by the genre band

SELECT * FROM bands ORDER BY name ASC;
SELECT * FROM bands ORDER BY name DESC;

-- We can get a return of ascending or descending order either alphabetically or numerically

SELECT * FROM bands LIMIT 2;

-- We can have a limit of how much data we get returned

SELECT COUNT(*) FROM bands;

-- This helps us tell how much we have in our DB

SELECT name FROM bands WHERE genre = 'Metal' ORDER BY name ASC LIMIT 2;

-- So you can actually combine all thingies forgot what they're called

 CREATE TABLE musicians (
music(
    # 
    id SERIAL PRIMARY KEY, 
    band_id INTEGER REFERENCES bands(id), 
    name VARCHAR NOT NULL, 
    age INTEGER NOT NULL, 
    sings BOOLEAN, 
    dances BOOLEAN
);

-- Insert musicians for The Beatles
INSERT INTO musicians (band_id, name, age, sings, dances) 
VALUES 
(1, 'John Lennon', 40, null, FALSE),
(1, 'Paul McCartney', 39, TRUE, FALSE),
(1, 'George Harrison', 38, TRUE, null),
(1, 'Ringo Starr', 41, FALSE, TRUE);

-- Insert musicians for The Rolling Stones
INSERT INTO musicians (band_id, name, age, sings, dances) 
VALUES 
(2, 'Mick Jagger', 38, TRUE, null),
(2, 'Keith Richards', 39, TRUE, FALSE),
(2, 'Charlie Watts', 40, null, FALSE),
(2, 'Ronnie Wood', 41, TRUE, TRUE);

-- Insert musicians for The Who
INSERT INTO musicians (band_id, name, age, sings, dances) 
VALUES 
(3, 'Roger Daltrey', 38, TRUE, TRUE),
(3, 'Pete Townshend', 39, null, FALSE),
(3, 'John Entwistle', 40, TRUE, FALSE),
(3, 'Keith Moon', 41, null, TRUE);

SELECT name FROM musicians WHERE sings = TRUE;

You can also use various operators in the condition, such as:

=: Equal to
<> or !=: Not equal to
>: Greater than
<: Less than
>=: Greater than or equal to
<=: Less than or equal to
BETWEEN: Between an inclusive range
LIKE: Search for a pattern
IN: Matches any of a list of values
IS NULL: Checks for NULL values
AND: Combines multiple conditions
OR: Returns rows that meet either condition
NOT: Negates a condition

SELECT bands.name AS band, musicians.name AS musician
FROM bands
FULL JOIN musicians ON bands.id = musicians.band_id;

UPDATE bands
SET genre = 'Rock and Roll'
WHERE name = 'The Beatles';

UPDATE bands SET genre = 'Rock and Roll' WHERE name = 'The Rolling Stones';
UPDATE bands SET genre = 'Rock and Blues' WHERE name = 'The Who';

DELETE FROM table_name WHERE condition;

DELETE FROM musicians WHERE name = 'Roger Daltrey';

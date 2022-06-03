-- CHOOSING CHEESE --

-- Find all the cheeses
SELECT * FROM cheeses;

-- Find all the French cheeses
SELECT * FROM cheeses WHERE country LIKE "%French%";

-- Find all the English cheeses
SELECT * FROM cheeses WHERE country LIKE "%English%";

-- Find all cheeses with a stink level of 2
SELECT * FROM cheeses WHERE stink_level = 2;

-- Find all cheeses with a stink level of 10
SELECT * FROM cheeses WHERE stink_level = 10;

-- Find all French cheeses with a stink level of 5
SELECT * FROM cheeses WHERE country = "French" AND stink_level = 5;

-- Find all Irish cheeses with a stink level of 6
SELECT * FROM cheeses WHERE country = "Irish" AND stink_level =
 6;

-- Find all cheeses with a stink level of at least 4, but no greater than 8.
SELECT * FROM cheeses WHERE stink_level > 3 AND stink_level < 8;

-- Find all American and English cheeses.
SELECT * FROM cheeses WHERE country = "American" OR country = "Engl
ish";

-- Find all cheeses that are not from France.
SELECT * FROM cheeses WHERE country != "French";




-- RESTOCKING CHEESES --

-- Change the stink level of Roquefort to 3

UPDATE cheeses SET stink_level = 3 WHERE name = "Roquefort";

-- Change the color of Teleme to "mauve"
UPDATE cheeses SET color = "mauve" WHERE name = "Teleme";

-- Delete the Hooligan cheese
DELETE FROM cheeses WHERE name = "Hooligan";

-- Change the stink level of Stichelton to be 7
UPDATE cheeses SET stink_level = 7 WHERE name = "Stichelton";

-- Add the cheese "Monterey Jack", an American cheese with a stink level of 0
-- NOTE NO COLOR WAS ASSIGNED!

INSERT INTO cheeses VALUES ("Monterey Jack", "American", "", 0);

-- Add a column named animal_milk with a datatype of VARCHAR(50) to the cheeses table
-- ALTER TABLE cheeses ADD COLUMN cheese_id SERIAL PRIMARY KEY NOT NULL FIRST;

ALTER TABLE cheeses ADD COLUMN animal_milk VARCHAR(50) NOT NULL;

-- Add a column named pasteurized with a boolean datatype to the cheeses table
ALTER TABLE cheeses ADD COLUMN pasteurized BOOLEAN NOT NULL AFTER stink_level;


ALTER TABLE cheeses DROP COLUMN pasteurized;
-- Update the new cheese data (see table below)

INSERT INTO cheeses (cheese_id, name, pasteurized, animal_milk) VALUES 
(3,"Charolais", false, "goat"),
(4,"Maroilles", false, "cow"),
(5,"Durrus", false, "cow"),
(1,"Roquefort", false, "sheep"),
(6,"Teleme", true, "cow"),
(7,"Stichelton", true, "cow"),
(9,"Monterey Jack", true, "cow")
ON DUPLICATE KEY UPDATE
cheese_id=VALUES(cheese_id),
name=VALUES(name),
pasteurized=VALUES(pasteurized),
animal_milk=VALUES(animal_milk);


DELETE FROM cheeses WHERE cheese_id > 9;

-- Change "Monterey Jack" to "Pepper Jack"
UPDATE cheeses SET name = "Pepper Jack" WHERE name = "Monterey Jack";

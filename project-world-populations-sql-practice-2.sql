SELECT *
FROM countries
LIMIT 10;

SELECT *
FROM population_years
LIMIT 10;

-- How many entries in the countries table are from Africa?
SELECT COUNT(*)
FROM countries
WHERE continent = 'Africa';

-- What was the total population of the continent of Oceania in 2005?
SELECT SUM(population) FROM population_years
INNER JOIN countries ON
countries.id = population_years.country_id
WHERE year = 2005
AND continent = 'Oceania';

-- What is the average population of countries in South America in 2003?
SELECT AVG(population) FROM population_years
INNER JOIN countries ON
countries.id = population_years.country_id
WHERE year = 2003
AND continent = 'South America';

-- What country had the smallest population in 2007?
SELECT MIN(population), name FROM population_years
INNER JOIN countries ON
countries.id = population_years.country_id
WHERE year = 2007;

-- What is the average population of Poland during the time period covered by this dataset?
SELECT AVG(population), name FROM population_years
INNER JOIN countries ON
countries.id = population_years.country_id
WHERE name = 'Poland';

-- How many countries have the word "The" in their name?
SELECT COUNT(*) FROM countries
where name LIKE "%The%";

-- What was the total population of each continent in 2010?
SELECT SUM(population), continent FROM population_years
INNER JOIN countries ON
countries.id = population_years.country_id
WHERE year = 2010
GROUP BY continent;
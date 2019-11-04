-- Getting started, take a look at the startups table
SELECT *
FROM startups
LIMIT 5;

-- Calculate the total number of companies in the table.
SELECT COUNT(*)
FROM startups;

-- We want to know the total value of all companies in this table. Calculate this by getting the SUM() of the valuation column.
SELECT SUM(valuation)
FROM startups;

-- What is the highest amount raised by a startup? Return the maximum amount of money raised.
SELECT MAX(raised)
FROM startups;

-- Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.
SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';

-- In what year was the oldest company on the list founded?
SELECT MIN(founded)
FROM startups;

-- Return the average valuation.
SELECT AVG(valuation)
FROM startups;

-- Return the average valuation, in each category.
SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

-- Return the average valuation, in each category. Round the averages to two decimal places.
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category;

-- Return the average valuation, in each category. Round the averages to two decimal places. Lastly, order the list from highest averages to lowest.
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY 1
ORDER BY 2 DESC;

-- First, return the name of each category with the total number of companies that belong to it.
SELECT category, COUNT(*)
FROM startups
GROUP BY category;

-- Next, filter the result to only include categories that have more than three companies in them. What are the most competitive markets?
SELECT category, COUNT(*)
FROM startups
GROUP BY category
HAVING COUNT(*) > 3;

-- What is the average size of a startup in each location?
SELECT location, AVG(employees)
FROM startups
GROUP BY location;

-- What is the average size of a startup in each location, with average sizes above 500?
SELECT location, AVG(employees)
FROM startups
GROUP BY 1
HAVING AVG(employees) > 500;
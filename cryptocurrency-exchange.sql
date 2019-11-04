-- Let’s start by checking out the whole transactions table:
SELECT *
FROM transactions;

-- What is the total money_in in the table?
SELECT SUM(money_in)
FROM transactions;

-- What is the total money_out in the table?
SELECT SUM(money_out)
FROM transactions;

-- How many money_in transactions are in this table? How many money_in transactions are in this table where ‘BIT’ is the currency?
SELECT COUNT(money_in)
FROM transactions;

SELECT COUNT(money_in)
FROM transactions
WHERE currency = 'BIT';

-- What was the largest transaction in this whole table? Was it money_in or money_out?
SELECT MAX(money_in)
FROM transactions;

SELECT MAX(money_out)
FROM transactions;

-- What is the average money_in in the table for the currency Ethereum (‘ETH’)?
SELECT AVG(money_in)
FROM transactions
WHERE currency = 'ETH';

-- Select date, average money_in, and average money_out from the table. And group everything by date.
SELECT date, AVG(money_in), AVG(money_out)
FROM transactions
GROUP BY date;

-- To make the previous query easier to read, round the averages to 2 decimal places. Give the column aliases using AS for readability.
SELECT date,
ROUND(AVG(money_in), 2) AS 'Average Buy',
ROUND(AVG(money_out), 2) AS 'Average Sell'
FROM transactions
GROUP BY date;
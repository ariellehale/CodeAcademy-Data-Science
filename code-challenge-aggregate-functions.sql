-- Code Challenge 1: Use COUNT() and a LIKE operator to determine the number of users that have an email ending in ‘.com’.

SELECT COUNT(*)
FROM users
WHERE email LIKE '%.com';

-- Code Challenge 2: What are the most popular first names on Codeflix? Use COUNT(), GROUP BY, and ORDER BY to create a list of first names and occurrences within the users table. Order the data so that the most popular names are displayed first.

SELECT first_name, COUNT(*)
FROM users
GROUP BY first_name
ORDER BY 2 DESC;

-- Code Challenge 3: The UX Research team wants to see a distribution of watch durations. They want the result to contain: duration, which is the watch event duration, rounded to the closest minute count, the number of watch events falling into this “bucket”. Use COUNT(), GROUP BY, and ORDER BY to create this result and order this data by increasing duration.

SELECT ROUND(watch_duration_in_minutes, 0) AS duration,
COUNT(*)
FROM watch_history
GROUP BY duration
ORDER BY COUNT(*) ASC;

-- Code Challenge 4: Find all the users that have successfully made a payment to Codeflix and find their total amount paid. Sort them by their total payments (from high to low). Use SUM(), WHERE, GROUP BY, and ORDER BY.

SELECT user_id, SUM(amount)
FROM payments
WHERE status = 'paid'
GROUP BY user_id
ORDER BY SUM(amount) DESC;

-- Code Challenge 5: Generate a table of user ids and total watch duration for users who watched more than 400 minutes of content. Use SUM(), GROUP BY, and HAVING to achieve this.

SELECT user_id, SUM(watch_duration_in_minutes)
FROM watch_history
GROUP BY user_id
HAVING SUM(watch_duration_in_minutes) > 400;

-- Code Challenge 6: To the nearest minute, how many minutes of content were streamed on Codeflix?

SELECT ROUND(SUM(watch_duration_in_minutes), 0)
FROM watch_history;

-- Code Challenge 7: Which days in this period did Codeflix collect the most money? Your result should have two columns, pay_date and total amount, sorted by the latter descending. This should only include successful payments (status = 'paid'). Use SUM(), GROUP BY, and ORDER BY.

SELECT pay_date, SUM(amount)
FROM payments
WHERE status = 'paid'
GROUP BY pay_date
ORDER BY SUM(amount) DESC;

-- Code Challenge 8: When users successfully pay Codeflix (status = 'paid'), what is the average payment amount?

SELECT AVG(amount)
FROM payments
WHERE status = 'paid';

-- Code Challenge 9: Of all the events in the watch_history table, what is the duration of the longest individual watch event? What is the duration of the shortest? Use one query and rename the results to max and min.

SELECT MAX(watch_duration_in_minutes), MIN(watch_duration_in_minutes)
FROM watch_history;

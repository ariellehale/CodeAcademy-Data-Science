 -- Start by getting a feel for the hacker_news table! Let’s find the most popular Hacker News stories:
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;
 
-- First, find the total score of all the stories.
SELECT SUM(score)
FROM hacker_news;

-- Next, we need to pinpoint the users who have accumulated a lot of points across their stories. Find the individual users who have gotten combined scores of more than 200, and their combined scores. GROUP BY and HAVING are needed!
SELECT user, score
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;

-- Then, we want to add these users’ scores together and divide by the total to get the percentage.
SELECT (517 + 309 + 304 + 282) / 6366.0;

-- Oh no! While we are looking at the power users, some users are rickrolling — tricking readers into clicking on a link to a funny video and claiming that it links to information about coding. The url of the video is: https://www.youtube.com/watch?v=dQw4w9WgXcQ How many times has each offending user posted this link?
SELECT user, COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ'
GROUP BY user
ORDER BY COUNT(*) DESC;

-- Which of these sites feed Hacker News the most:
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source',
  COUNT(*)
FROM hacker_news
GROUP BY 1;

-- What’s the best time of the day to post a story on Hacker News?
SELECT MAX(timestamp)
FROM hacker_news
LIMIT 10;

-- What do you think this does? Open the hint if you’d like to learn more.
SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

-- Okay, now we understand how strftime() works. Let’s write a query that returns three columns: The hours of the timestamp The average score for each hour The count of stories for each hour
SELECT strftime('%H', timestamp) AS hours,
ROUND(AVG(score), 0) AS score,
COUNT(*) AS count
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 1;
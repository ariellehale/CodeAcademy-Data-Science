SELECT email, birthday
FROM users
WHERE birthday > 1980 AND birthday < 1990
ORDER BY birthday ASC;

SELECT created_at
FROM users
WHERE created_at < 2017/05/01
ORDER BY created_at ASC;

SELECT email, test
FROM users
WHERE test = 'bears';

SELECT email, campaign
FROM users
WHERE campaign LIKE '%BBB%';

SELECT email, campaign
FROM users
WHERE campaign = 'AAA-2';

SELECT email, campaign, test
FROM users
WHERE campaign IS NOT NULL
AND test IS NOT NULL;
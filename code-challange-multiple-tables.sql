-- 1. Let’s see which plans are used by which premium members! The column membership_plan_id in premium_users should match the column id in plans. Join plans and premium_users and select: user_id from premium_users description from plans (Be sure to select the columns in this order).

SELECT premium_users.user_id, plans.description
FROM premium_users
JOIN plans
  ON plans.id = premium_users.membership_plan_id;

-- 2. Let’s see the titles of songs that were played by each user! The column song_id in plays should match the column id in songs. Join plays to songs and select: user_id from plays play_date from plays title from songs (Be sure to select the columns in this order)

 SELECT plays.user_id, 
   plays.play_date, 
   songs.title
 FROM plays
 JOIN songs
   ON plays.song_id = songs.id;

-- 3. Which users aren’t premium users? Use a LEFT JOIN to combine users and premium_users and select id from users. The column id in users should match the column user_id in premium_users. Use a WHERE clause to limit the results to users where premium_users.user_id IS NULL. This will remove premium users and leave you with only free users.

SELECT users.id
FROM users
LEFT JOIN premium_users
   ON users.id = premium_users.user_id
WHERE premium_users.user_id IS NULL;

-- 4. Use a left join to combine january and february on user_id and select user_id from january. Add the following WHERE statement to find which users played songs in January, but not February: WHERE february.user_id IS NULL

WITH january AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '01'
),
february AS (
  SELECT *
  FROM plays
  WHERE strftime("%m", play_date) = '02'

)
SELECT january.user_id
FROM january
LEFT JOIN february
  ON february.user_id = january.user_id
WHERE february.user_id IS NULL;

-- 5. For each month in months, we want to know if each user in premium_users was active or canceled. Cross join months and premium_users and select: user_id from premium_users purchase_date from premium_users cancel_date from premium_users months from months (Be sure to select the columns in this order).

 SELECT premium_users.user_id,
   premium_users.purchase_date,
   premium_users.cancel_date,
   months.months
FROM months
CROSS JOIN premium_users;

-- 6. Songify has added some new songs to their catalog. Combine songs and bonus_songs using UNION and select all columns from the result. Since the songs table is so big, just look at a sample by LIMITing the results to 10 rows.

SELECT *
FROM songs
UNION
SELECT *
FROM bonus_songs
LIMIT 10;

Modify the query in test.sqlite: Add a third UNION/SELECT so that the result contains 2017-03-01.

SELECT '2017-01-01' as month
UNION
SELECT '2017-02-01' as month
UNION
SELECT '2017-03-01' as month;
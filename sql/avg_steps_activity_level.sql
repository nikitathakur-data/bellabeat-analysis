-- Count total number of unique users in the dataset
SELECT COUNT(DISTINCT Id) AS users_steps
FROM `avid-life-471614-i7.fitness_tracker.daily_steps`;


-- Calculate average daily steps per user and classify activity level
SELECT
  Id,
  avg_steps,
  CASE
    WHEN avg_steps <5000 THEN 'Low Activity'
    WHEN avg_steps >=5000 AND avg_steps <10000 THEN 'Moderate Activity'
    ELSE 'High Activity'
  END AS activity_level
FROM (
  SELECT
    ROUND(AVG(total_steps),2) AS avg_steps,
    Id
  FROM
    `avid-life-471614-i7.fitness_tracker.daily_activity_cleaned`
  GROUP BY
    Id
)

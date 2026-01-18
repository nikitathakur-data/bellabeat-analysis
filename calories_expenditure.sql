--to calculate average days logged in across all users
SELECT
  AVG(active_days)
FROM (
SELECT
  Id,
  COUNT(DISTINCT ActivityDay) AS active_days
FROM `avid-life-471614-i7.fitness_tracker.daily_calories`
GROUP BY
  Id
ORDER BY
  active_days ASC
)


--to calculate average calories burned per user
SELECT
  Id,
  ROUND(AVG(Calories),2) AS avg_calories
FROM `avid-life-471614-i7.fitness_tracker.daily_calories`
GROUP BY
  Id
ORDER BY
  avg_calories



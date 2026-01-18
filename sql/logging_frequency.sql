-- Note: activity_rate_pct uses total distinct days in the dataset as the denominator
-- Calculate user logging frequency as the percentage of days

SELECT
  Id,
  COUNT(DISTINCT ActivityDate) AS active_days,
  ROUND(
    COUNT(DISTINCT ActivityDate) / total.total_days * 100,
    1
  ) AS activity_rate_pct,
  CASE
    WHEN ROUND(COUNT(DISTINCT ActivityDate) / total.total_days * 100, 1) >= 80 THEN 'Highly Consistent'
    WHEN ROUND(COUNT(DISTINCT ActivityDate) / total.total_days * 100, 1) BETWEEN 50 AND 79 THEN 'Moderately Consistent'
    WHEN ROUND(COUNT(DISTINCT ActivityDate) / total.total_days * 100, 1) BETWEEN 20 AND 49 THEN 'Low Consistency'
    ELSE 'Very Low Consistency'
  END AS logging_frequency
FROM `avid-life-471614-i7.fitness_tracker.daily_activity_cleaned`
CROSS JOIN (
  SELECT COUNT(DISTINCT ActivityDate) AS total_days
  FROM `avid-life-471614-i7.fitness_tracker.daily_activity_cleaned`
) total
GROUP BY Id, total.total_days
ORDER BY activity_rate_pct DESC;


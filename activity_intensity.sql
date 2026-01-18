--distribution of user activity across sedentary, lightly_active, and very_active minutes
SELECT
  Id,
  ROUND(AVG(SedentaryMinutes),2) AS avg_sedentaryminutes,
  ROUND(AVG(LightlyActiveMinutes),2) AS avg_lightlyactive_minutes,
  ROUND(AVG(VeryActiveMinutes),2) AS avg_veryactive_minutes
FROM
  avid-life-471614-i7.fitness_tracker.daily_intensities
GROUP BY
  Id

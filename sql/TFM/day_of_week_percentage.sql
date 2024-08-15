CREATE TABLE `crack-case-431914-j8.Capstone.daily_summary_percentage` AS

SELECT
day_of_week,
  ROUND(daily_activity * 100 / SUM(daily_activity) OVER (), 0) AS daily_activity_pct,
  ROUND(heart_rate * 100 / SUM(heart_rate) OVER (), 0) AS heart_rate_pct,
  ROUND(calories * 100 / SUM(calories) OVER (), 0) AS calories_pct,
  ROUND(intensities * 100 / SUM(intensities) OVER (), 0) AS intensities_pct,
  ROUND(steps * 100 / SUM(steps) OVER (), 0) AS steps_pct,
  ROUND(sleep * 100 / SUM(sleep) OVER (), 0) AS sleep_pct,
  ROUND(weight_log * 100 / SUM(weight_log) OVER (), 0) AS weight_log_pct
FROM
  `crack-case-431914-j8.Capstone.daily_summary`
  ORDER BY
  CASE
    WHEN day_of_week = 'Monday' THEN 1
    WHEN day_of_week = 'Tuesday' THEN 2
    WHEN day_of_week = 'Wednesday' THEN 3
    WHEN day_of_week = 'Thursday' THEN 4
    WHEN day_of_week = 'Friday' THEN 5
    WHEN day_of_week = 'Saturday' THEN 6
    WHEN day_of_week = 'Sunday' THEN 7
  END

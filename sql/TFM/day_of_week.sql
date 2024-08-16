/*
create table that splits data into day of the week
*/
CREATE TABLE `crack-case-431914-j8.Capstone.daily_summary` AS

WITH daily_activity_summary AS ( --counts how many logs for reach day
  SELECT
    FORMAT_DATE('%A', DATE(activity_date)) AS day_of_week, -- converts timestamp to day of the week
    COUNT(*) AS daily_activity
  FROM
    `crack-case-431914-j8.Capstone.daily_activity`
  GROUP BY
    day_of_week
),
heart_rate_summary AS (
  SELECT
    FORMAT_DATE('%A', DATE(time)) AS day_of_week,
    COUNT(*) AS heart_rate
  FROM
    `crack-case-431914-j8.Capstone.heart_rate`
  GROUP BY
    day_of_week
),
hourly_calories_summary AS (
  SELECT
    FORMAT_DATE('%A', DATE(activity_hour)) AS day_of_week,
    COUNT(*) AS calories
  FROM
    `crack-case-431914-j8.Capstone.hourly_calories`
  GROUP BY
    day_of_week
),
hourly_intensities_summary AS (
  SELECT
    FORMAT_DATE('%A', DATE(activity_hour)) AS day_of_week,
    COUNT(*) AS intensities
  FROM
    `crack-case-431914-j8.Capstone.hourly_intensities`
  WHERE
    total_intensity != 0
  GROUP BY
    day_of_week
),
hourly_steps_summary AS (
  SELECT
    FORMAT_DATE('%A', DATE(activity_hour)) AS day_of_week,
    COUNT(*) AS steps
  FROM
    `crack-case-431914-j8.Capstone.hourly_steps`
  WHERE
    stepp_total !=0
  GROUP BY
    day_of_week
),
minute_sleep_summary AS (
  SELECT
    FORMAT_DATE('%A', DATE(date)) AS day_of_week,
    COUNT(*) AS sleep
  FROM
    `crack-case-431914-j8.Capstone.minute_sleep`
  GROUP BY
    day_of_week
),
weight_log_summary AS (
  SELECT
    FORMAT_DATE('%A', DATE(date)) AS day_of_week,
    COUNT(*) AS weight_log
  FROM
    `crack-case-431914-j8.Capstone.weight_log_info`
  GROUP BY
    day_of_week
)      
SELECT
  das.day_of_week,
  COALESCE(das.daily_activity, 0) AS daily_activity,
  COALESCE(hrs.heart_rate, 0) AS heart_rate,
  COALESCE(hcs.calories, 0) AS calories,
  COALESCE(his.intensities, 0) AS intensities,
  COALESCE(hss.steps, 0) AS steps,
  COALESCE(mss.sleep, 0) AS sleep,
  COALESCE(wls.weight_log, 0) AS weight_log
   --replaces null logs with 0
FROM
  daily_activity_summary das
LEFT JOIN
  heart_rate_summary hrs
ON
  das.day_of_week = hrs.day_of_week
LEFT JOIN
  hourly_calories_summary hcs
ON
  das.day_of_week = hcs.day_of_week
LEFT JOIN
  hourly_intensities_summary his
ON
  das.day_of_week = his.day_of_week
LEFT JOIN
  hourly_steps_summary hss
 ON 
  das.day_of_week = hss.day_of_week
LEFT JOIN
  minute_sleep_summary mss
ON
  das.day_of_week = mss.day_of_week
LEFT JOIN
  weight_log_summary wls
ON
  das.day_of_week = wls.day_of_week

ORDER BY -- ensure days of week are in order
    CASE
    WHEN das.day_of_week = 'Monday' THEN 1
    WHEN das.day_of_week = 'Tuesday' THEN 2
    WHEN das.day_of_week = 'Wednesday' THEN 3
    WHEN das.day_of_week = 'Thursday' THEN 4
    WHEN das.day_of_week = 'Friday' THEN 5
    WHEN das.day_of_week = 'Saturday' THEN 6
    WHEN das.day_of_week = 'Sunday' THEN 7
  END
/*
create table that splits data hours of the day
*/

DROP TABLE `crack-case-431914-j8.Capstone.hourly_summary`;
CREATE TABLE `crack-case-431914-j8.Capstone.hourly_summary` AS

WITH hours AS (
  -- Create a list of all 24 hours in a day
  SELECT 
    FORMAT_TIMESTAMP('%H:00', TIMESTAMP '1970-01-01 00:00:00' + INTERVAL hour HOUR) AS hour_of_day
  FROM 
    UNNEST(GENERATE_ARRAY(0, 23)) AS hour
),
heart_rate_summary AS ( --counts how many logs for each hour
  SELECT
    FORMAT_DATE('%H:00', time) AS hour_of_day, -- converts timestamp to hous of the day
    COUNT(*) AS heart_rate
  FROM
    `crack-case-431914-j8.Capstone.heart_rate`
  GROUP BY
    hour_of_day

),
hourly_calories_summary AS (
  SELECT
    FORMAT_DATE('%H:00', activity_hour) AS hour_of_day,
    COUNT(*) AS calories
  FROM
    `crack-case-431914-j8.Capstone.hourly_calories`
  GROUP BY
    hour_of_day
),
hourly_intensities_summary AS (
  SELECT
    FORMAT_DATE('%H:00', activity_hour) AS hour_of_day,
    COUNT(*) AS intensities
  FROM
    `crack-case-431914-j8.Capstone.hourly_intensities`
  WHERE
  total_intensity != 0
  GROUP BY
    hour_of_day
),
hourly_steps_summary AS (
  SELECT
    FORMAT_DATE('%H:00', activity_hour) AS hour_of_day,
    COUNT(*) AS steps
  FROM
    `crack-case-431914-j8.Capstone.hourly_steps`
  WHERE
  step_total != 0
  GROUP BY
    hour_of_day
),
minute_sleep_summary AS (
  SELECT
    FORMAT_DATE('%H:00', date) AS hour_of_day,
    COUNT(*) AS sleep
  FROM
    `crack-case-431914-j8.Capstone.minute_sleep`
  GROUP BY
    hour_of_day
),
weight_log_summary AS (
  SELECT
    FORMAT_DATE('%H:00', date) AS hour_of_day,
    COUNT(*) AS weight_log,
    is_manual_report
  FROM
    `crack-case-431914-j8.Capstone.weight_log_info`
  GROUP BY
    hour_of_day,
    is_manual_report
)      
SELECT
  hrs.hour_of_day,
  COALESCE(hrs.heart_rate, 0) AS heart_rate,
  COALESCE(hcs.calories, 0) AS calories,
  COALESCE(his.intensities, 0) AS intensities,
  COALESCE(hss.steps, 0) AS steps,
  COALESCE(mss.sleep, 0) AS sleep,
  COALESCE(wls.weight_log, 0) AS weight_log
   --replaces null logs with 0
FROM
  heart_rate_summary hrs
LEFT JOIN
  hourly_calories_summary hcs
ON
  hrs.hour_of_day = hcs.hour_of_day
LEFT JOIN
  hourly_intensities_summary his
ON
  hrs.hour_of_day = his.hour_of_day
LEFT JOIN
  hourly_steps_summary hss
 ON 
  hrs.hour_of_day = hss.hour_of_day
LEFT JOIN
  minute_sleep_summary mss
ON
  hrs.hour_of_day = mss.hour_of_day
LEFT JOIN
  weight_log_summary wls
ON
  hrs.hour_of_day = wls.hour_of_day
AND
  is_manual_report = false --manual reports not accurate time data

ORDER BY -- ensure hours are in order
hrs.hour_of_day
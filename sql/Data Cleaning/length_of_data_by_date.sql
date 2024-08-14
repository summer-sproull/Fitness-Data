/*
date range for each table
*/

SELECT 
'daily_Activity' as table_name,
  MIN(cast(ActivityDate as timestamp)) as earliest,
  MAX(cast(ActivityDate as timestamp)) as latest
FROM
`crack-case-431914-j8.Capstone.daily_activity_raw`

UNION ALL

SELECT 
'heart_rate',
  MIN(time) as earliest,
  MAX(time) as latest
FROM
`crack-case-431914-j8.Capstone.heart_rate`

UNION ALL

SELECT 
'hourly_calorie',
  MIN(activity_hour) as earliest,
  MAX(activity_hour) as latest
FROM
`crack-case-431914-j8.Capstone.hourly_calories`

UNION ALL

SELECT 
'hourly_intensities',
  MIN(activity_hour) as earliest,
  MAX(activity_hour) as latest
FROM
`crack-case-431914-j8.Capstone.hourly_intensities`

UNION ALL

SELECT 
'hourly_steps',
  MIN(activity_hour) as earliest,
  MAX(activity_hour) as latest
FROM
`crack-case-431914-j8.Capstone.hourly_steps`

UNION ALL

SELECT
'hourly_intensities',
  MIN(activity_hour) as earliest,
  MAX(activity_hour) as latest
FROM
`crack-case-431914-j8.Capstone.hourly_intensities`

UNION ALL

SELECT
'minute_sleep',
  MIN(date) as earliest,
  MAX(date) as latest
FROM
`crack-case-431914-j8.Capstone.minute_sleep`

UNION ALL

SELECT 
'weight_log_info',
  MIN(date) as earliest,
  MAX(date) as latest
FROM
`crack-case-431914-j8.Capstone.weight_log_info`
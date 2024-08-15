/*
number of days in activity log
*/

SELECT 
  MIN(ActivityDate) AS min_date,
  MAX(ActivityDate) AS max_date,
  DATE_DIFF(MAX(ActivityDate), MIN(ActivityDate), DAY) AS number_of_days
FROM 
  `crack-case-431914-j8.Capstone.daily_activity_raw`
/*
looking at total number of participants in each table using distinct ID
*/

CREATE VIEW `crack-case-431914-j8.Capstone.distinct_id_tables` AS

SELECT  
    'daily_activity' AS table_name, 
    COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.daily_activity_raw`

UNION ALL

SELECT
    'heart_rate',
     COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.heart_rate`

UNION ALL

SELECT
    'hourly_calories',
     COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.hourly_calories`

UNION ALL

SELECT
    'hourly_intensities',
     COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.hourly_intensities`

UNION ALL

SELECT
    'hourly_steps',
     COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.hourly_steps`

UNION ALL

SELECT
    'minute_calories',
     COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.minute_calories`

UNION ALL

SELECT
    'minute_intensities',
     COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.minute_intensities`

UNION ALL
SELECT
    'minute_mets',
     COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.minute_mets`

UNION ALL

SELECT
    'minutes_sleep',
     COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.minute_sleep`

UNION ALL

SELECT
    'minute_steps',
     COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.minute_steps`

UNION ALL
SELECT
    'weight_log_info',
     COUNT(DISTINCT Id) AS distinct_id
FROM `crack-case-431914-j8.Capstone.weight_log_info`
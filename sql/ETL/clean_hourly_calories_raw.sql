CREATE TABLE `crack-case-431914-j8.Capstone.hourly_calories` AS
SELECT 
    Id,
    PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', ActivityHour) AS activity_hour, --parsed field to convert to timestamp
    Calories as calories
FROM `crack-case-431914-j8.Capstone.hourly_calories_raw`
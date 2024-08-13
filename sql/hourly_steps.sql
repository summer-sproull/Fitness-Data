CREATE TABLE `crack-case-431914-j8.Capstone.hourly_steps` AS
SELECT 
    Id,
    PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', activity_hour) AS activity_hour, --parsed field to convert to timestamp
    step_total
FROM `crack-case-431914-j8.Capstone.hourly_steps_raw`
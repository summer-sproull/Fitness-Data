 CREATE TABLE `crack-case-431914-j8.Capstone.minute_steps` AS
SELECT 
    Id,
    PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', actvity_minute) AS activity_minute, --parsed field to convert to timestamp
    steps,
FROM `crack-case-431914-j8.Capstone.minute_steps_raw`

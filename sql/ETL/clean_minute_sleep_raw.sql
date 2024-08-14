CREATE TABLE `crack-case-431914-j8.Capstone.minute_sleep` AS 
SELECT 
    Id,
    PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', date) AS date, --parsed field to convert to timestamp
    value,
    log_id
FROM `crack-case-431914-j8.Capstone.minute_sleep_raw`

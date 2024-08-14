CREATE TABLE `crack-case-431914-j8.Capstone.minute_mets` AS 
SELECT 
    Id,
    PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', activity_minute) AS activity_minute, --parsed field to convert to timestamp
    mets
FROM `crack-case-431914-j8.Capstone.minute_mets_raw`

CREATE TABLE `crack-case-431914-j8.Capstone.minute_intensities` AS 
SELECT 
    Id,
    PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', activity_minute) AS activity_minute, --parsed field to convert to timestamp
    intensity
FROM `crack-case-431914-j8.Capstone.minute_intensities_raw`

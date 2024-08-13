CREATE TABLE `crack-case-431914-j8.Capstone.heart_rate` AS
SELECT 
    Id,
    PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', time) AS time, --parsed the time field to convert to timestampt datatype 
    Value
FROM `crack-case-431914-j8.Capstone.heart_rate_raw`

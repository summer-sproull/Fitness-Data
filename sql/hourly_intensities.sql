CREATE TABLE `crack-case-431914-j8.Capstone.hourly_intensities` AS
SELECT 
    Id,
    PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', activity_hour) AS activity_hour, --parsed field to convert to timestamp
    total_intensity
    average_intensity
FROM `crack-case-431914-j8.Capstone.hourly_intensities_raw`
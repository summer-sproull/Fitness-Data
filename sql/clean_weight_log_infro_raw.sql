 CREATE TABLE `crack-case-431914-j8.Capstone.weight_log_info` AS
SELECT 
    ID As Id,
    PARSE_TIMESTAMP('%m/%d/%Y %I:%M:%S %p', date) AS date, --parsed field to convert to timestamp
    weight_kg,
    weight_pounds,
    fat,
    bmi,
    is_manual_report,
    log_id,
FROM `crack-case-431914-j8.Capstone.weight_log_info_raw`
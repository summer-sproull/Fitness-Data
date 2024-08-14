/*
verify Id column adhered to specficic length perameters and no errors were present
*/

SELECT Id
FROM `crack-case-431914-j8.Capstone.daily_activity_raw` 
WHERE
    LENGTH (CAST(Id as string)) < 10
    OR
    LENGTH (CAST(Id as string)) > 10
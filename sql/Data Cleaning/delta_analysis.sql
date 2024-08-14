/*
comapre IDs between datasets to identify the delta
*/

select distinct
dar.id, 
hc.id
from
`crack-case-431914-j8.Capstone.daily_activity_raw` dar
left join 
`crack-case-431914-j8.Capstone.hourly_calories` hc
on dar.id = hc.id
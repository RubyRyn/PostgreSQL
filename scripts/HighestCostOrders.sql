"""
Difficulty: Medium

Find all the users who were active for 3 consecutive days or more.

sf_events table
------------------
user_id:character varying
record_date:date
account_id:character varying

"""


with record_date_order as (
select *
, LEAD(se.record_date) OVER(PARTITION BY se.user_id ORDER BY se.record_date ) as next_date
, LAG(se.record_date) OVER(PARTITION BY se.user_id ORDER BY se.record_date ) as prev_date
from sf_events as se 
)
select distinct(rdd.user_id) as user_id
from record_date_order rdd
where DATEDIFF(next_date,record_date) = 1 and DATEDIFF(record_date, prev_date) = 1;
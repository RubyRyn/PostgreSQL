"""
Calculate the net change in the number of products launched by companies in 2020 compared to 2019. 
Your output should include the company names and the net difference.
(Net difference = Number of products launched in 2020 - The number launched in 2019.)

car_launches table
------------------
company_name:text
product_name:text
year:bigint

"""


select cl.company_name,
-- count(*) FILTER (WHERE cl.year = 2020) product_count_2020,
-- count(*) FILTER (WHERE cl.year = 2019) product_count_2019, 
(count(*) FILTER (WHERE cl.year = 2020) - count(*) FILTER (WHERE cl.year = 2019)) as net_products
from car_launches cl
group by cl.company_name
order by cl.company_name
;

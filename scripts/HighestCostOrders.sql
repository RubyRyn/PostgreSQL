"""
Find the customers with the highest daily total order cost between 2019-02-01 and 2019-05-01. 
If a customer had more than one order on a certain day, sum the order costs on a daily basis. 
Output each customer's first name, total cost of their items, and the date. 
If multiple customers tie for the highest daily total on the same date, return all of them.
For simplicity, you can assume that every first name in the dataset is unique.

customers table
------------------
id:bigint
first_name:text
last_name:text
phone_number:text
address:text
city: text

orders table
------------------
cust_id:bigint
id:bigint
order_date:date
order_details:text
total_order_cost:bigint

"""

with daily_order_rank as (

select c.id as cust_id , c.first_name, o.order_date, count(o.id) as num_of_orders , sum(o.total_order_cost) as total_cost, 
RANK() OVER(PARTITION BY o.order_date ORDER BY sum(o.total_order_cost) desc) as rank_
from customers as c 
left join orders as o on c.id = o.cust_id
where o.order_date between '2019-02-01' and '2019-05-01'
group by c.id , c.first_name, o.order_date

)
select first_name as cust_name,order_date , total_cost as max_cost
from daily_order_rank as dor 
where dor.rank_ = 1 ;

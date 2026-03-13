with total_paid_rank_by_month as (
select * 
,EXTRACT(MONTH FROM re.invoicedate) AS month,
re.unitprice * re.quantity as total_paid, 
RANK() OVER(PARTITION BY EXTRACT(MONTH FROM re.invoicedate) ORDER BY (re.unitprice * re.quantity) desc) rank_
from online_retail as re
where re.stockcode = '22382'
order by EXTRACT(MONTH FROM re.invoicedate) , (re.unitprice * re.quantity) desc 
)
select EXTRACT(MONTH FROM ore.invoicedate), ore.stockcode, 
from total_paid_rank_by_month rbm 
left join online_retail ore on rbm.stockcode = ore.stockcode
where rank_ = 1
group by EXTRACT(MONTH FROM ore.invoicedate), ore.stockcode
 ;

select *
from online_retail as re
where re.stockcode = '22382'; 
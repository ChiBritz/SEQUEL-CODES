select *
from "Cars_Data"

select *
from "Sales_Team"


select *
from "sales_data"


-----Sql Assessment-----

select distinct  sales_manager_id, (first_name||' '|| last_name) as full_name
from sales_team
order by full_name

-----QUESTION ONE
select distinct(st."first_name"||' '|| "last_name") as full_name, sum(cd.car_price) as total_sales,
round((sum(st.monthly_target) - sum(cd.car_price))/sum(st.monthly_target)*100, 2) as percentage_target_left
from cars_data cd
join sales_data sd
on sd.customer_car_code = cd.car_code
join sales_team st
on st.sales_manager_id = sd.sales_manager_id
group by full_name
order by total_sales, percentage_target_left;


-----Question two
select (st."first_name"||' '|| "last_name") as full_name, st.sales_manager_id, cd.car_code, cd.car_name,
round(sum(cd.car_price - sd.deposit_paid_for_booking)/ cd.car_price * 100, 2) as "percentage_target"
from sales_team st
join sales_data sd
on st.sales_manager_id = sd.sales_manager_id
join cars_data cd
on sd.customer_car_code =cd.car_code
where sd.sales_manager_id ='12134'
group by full_name, st.sales_manager_id, cd.car_code,
cd.car_name,cd.car_price,sd.deposit_paid_for_booking
order by "percentage_target"

------Question three
select (st."first_name"||' '|| "last_name") as full_name, sum (deposit_paid_for_booking) as "total_deposit", 
round(sum (sd.deposit_paid_for_booking)/sum (cd.car_price)*100, 2) as "percentage_total_price"
from sales_data sd
join sales_team st
on sd.sales_manager_id = st.sales_manager_id
join cars_data cd
on sd.customer_car_code = cd.car_code
group by full_name
order by "percentage_total_price", "total_deposit"; 


------Question four
select (st."first_name"||' '|| "last_name") as full_name, cd.car_name, sum(sd.deposit_paid_for_booking) as car_sales,
sum(cd.car_price) as total_amt
from sales_team st
join sales_data sd
on st.sales_manager_id = sd.sales_manager_id
join cars_data cd
on sd.customer_car_code = cd.car_code
group by full_name, car_name
order by  "car_sales", "total_amt" desc;



--question 5
select round(avg(sd2.sold_on - sd1.sold_on), 2) as "avg_diff"
from "sales_data" sd1
join "sales_data" sd2
on sd1.customer_car_code = sd2.customer_car_code
and sd1.sold_on < sd2.sold_on;
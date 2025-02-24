use W3Resource
--task1
select sum(purch_amt) from inventory.orders
--task2
select avg(purch_amt) from inventory.orders
--task3
select count(distinct salesman_id) from Inventory.Orders
--task4
select count(distinct customer_id) from Inventory.Orders
--task5
select count(grade) from Inventory.Customer
--task6
select max(purch_amt) from inventory.orders
--task7
select min(purch_amt) from inventory.orders
--task8
select city, max(grade) from Inventory.Customer
group by city
--task9
select customer_id, max(purch_amt) from Inventory.Orders
group by customer_id
--task10
select customer_id, ord_date, max(purch_amt) from Inventory.Orders
group by ord_date, customer_id
--task11
select salesman_id, max(purch_amt) from inventory.orders
where ord_date = '2012-08-17'
group by salesman_id
--task12
select customer_id, ord_date, max(purch_amt) from inventory.orders
where purch_amt > 2000
group by customer_id,ord_date
--task13
select customer_id, ord_date, max(purch_amt) from inventory.orders
where purch_amt >= 2000 and purch_amt <= 6000 
group by customer_id,ord_date
--task14
select customer_id, ord_date, max(purch_amt)
as max from inventory.orders
where purch_amt in (2000, 3000, 5760, 6000)
group by customer_id, ord_date
--task15
select customer_id, max(purch_amt) from inventory.orders
where customer_id between 3002 and 3007
group by customer_id
--task16
select customer_id, max(purch_amt) from inventory.orders
where customer_id between 3002 and 3007 and purch_amt > 1000
group by customer_id
--task17
select salesman_id, max(purch_amt) from inventory.orders
where salesman_id between 5003 and 5008
group by salesman_id
--task18
select count(ord_no) from inventory.orders
where ord_date = '2012-08-17'
--task19
select count(distinct salesman_id) from Inventory.Salesman
--task20
select ord_date, salesman_id, count(ord_no) 
from inventory.orders
group by ord_date, salesman_id
--task21
select avg(pro_price) as average_price from dbo.item_mast
--task22
select count(pro_id) from  dbo.item_mast
where pro_price >= 350
--task23
select avg(pro_price), pro_com from dbo.item_mast
group by pro_com
--task24
create table emp_department(dpt_code int primary key, dpt_name varchar(50), dpt_allotment int)
select * from emp_department
insert into emp_department values (57, 'IT', 65000),
(63, 'Finance', 15000), (47, 'HR', 240000),
(27, 'RD', 55000), (89, 'QC', 75000)
select sum(dpt_allotment) from emp_department
--task25
select count(emp_idno), emp_dept from dbo.emp_details
GROUP BY emp_dept

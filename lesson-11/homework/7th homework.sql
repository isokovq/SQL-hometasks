-- homework7 JOins
--task1
select * from [Inventory].[Salesman] s
join [Inventory].[Customer] c on s.city = c.city 

--task2
select ord_no, purch_amt,cust_name, city from Inventory.orders o
join Inventory.Customer c on c.salesman_id = o.salesman_id
where purch_amt between 500 and 2000 

--task3
select cust_name, c.city, c.salesman_id, commission from Inventory.customer c
 right Join Inventory.Salesman s on  c.salesman_id = s.salesman_id

--task4
select cust_name, c.city, c.salesman_id, commission from Inventory.customer c
 JOin Inventory.Salesman s on  c.salesman_id = s.salesman_id
where commission > 0.12

--task5
select cust_name, c.city, c.salesman_id, s.city,  commission from Inventory.customer c
 JOin Inventory.Salesman s on  c.salesman_id = s.salesman_id
where commission > 0.12 and s.city <> c.city

--task6
select ord_no, ord_date, purch_amt, cust_name, grade, o.salesman_id, commission
from Inventory.orders o
join Inventory.Customer c on o.salesman_id = c.salesman_id
join Inventory.Salesman s on s.salesman_id = o.salesman_id

--task7
select  distinct * from  Inventory.orders o
join Inventory.Customer c on o.salesman_id = c.salesman_id
join Inventory.Salesman s on s.salesman_id = o.salesman_id

 --task8
 select cust_name, c.city, grade, s.name, s.city from Inventory.Customer c
 join Inventory.Salesman s on s.salesman_id= c.salesman_id
 order by customer_id desc

 --task9
 select cust_name, c.city, grade, s.name, s.city from Inventory.Customer c
 join Inventory.Salesman s on s.salesman_id= c.salesman_id
 where grade< 300
 order by customer_id

 --task10
 select cust_name, ord_no, ord_date, purch_amt  from inventory.orders o
 join Inventory.Customer c on o.customer_id = c.customer_id
 order by ord_date 

 --task11
 select cust_name, c.city, ord_no,ord_date,purch_amt,s.name, commission
 from Inventory.Customer c
 left join Inventory.orders o on c.customer_id = o.customer_id
 left join Inventory.Salesman s on o.salesman_id = s.salesman_id

 --task12
 select * from Inventory.Salesman s
 left join Inventory.Customer c on s.salesman_id=c.salesman_id
 order by s.salesman_id

 --task13
 select s.name as salesman, cust_name,c.city, grade,ord_no, ord_date, purch_amt from Inventory.Customer c
 left JOin Inventory.Salesman s on c.salesman_id = s.salesman_id
 left join Inventory.Orders o on c.customer_id = o.customer_id

 --task14
 select *
 from Inventory.Customer c
 left JOin Inventory.Salesman s on c.salesman_id = s.salesman_id
 left join Inventory.Orders o on c.customer_id = o.customer_id
 where grade>0 and purch_amt>2000

 --task15
  select cust_name, c.city, ord_no, ord_date,purch_amt from Inventory.Customer c
  left join Inventory.Orders o on c.customer_id=o.customer_id

 --task16
 select cust_name, c.city, ord_no, ord_date,purch_amt  from Inventory.Customer c
  full join Inventory.Orders o on c.customer_id=o.customer_id
  where grade > 0

  --task 17
  select * from Inventory.Customer
  cross join Inventory.Salesman

  --task18
  select * from Inventory.Salesman s
  cross join Inventory.Customer c
where c.city is not null

 --task19
  select * from Inventory.Salesman s
  cross join Inventory.Customer c
  where grade is not null

  --task20
    select * from Inventory.Salesman s
  cross join Inventory.Customer c
  where c.city is not null and c.city <> s.city and grade is not null

  --task 21
  select * from company_mast cm
  join item_mast im on cm.com_id=im.pro_com

  --task22
 select pro_name, pro_price, com_name from company_mast cm
  join item_mast im on cm.com_id=im.pro_com

  --task 23
  select avg(pro_price),com_name from company_mast cm
  join item_mast im on cm.com_id=im.pro_com
  group by com_name

  --task24
    select avg(pro_price) ,com_name from company_mast cm
  join item_mast im on cm.com_id=im.pro_com
  group by com_name
  having avg(pro_price)>=350 

  --task25
   select max(pro_price),com_name from company_mast cm
  join item_mast im on cm.com_id=im.pro_com
  group by com_name

  --task26
  select * from emp_department ed
  full join emp_details d on ed.dpt_code = d.emp_dept

  --task27
  select emp_fname+emp_lname as full_name, dpt_name, dpt_allotment from emp_department ed
  full join emp_details d on ed.dpt_code = d.emp_dept

  --task28
  select emp_fname+emp_lname as full_name from emp_department ed
  full join emp_details d on ed.dpt_code = d.emp_dept
  where dpt_allotment > 50000
  
  --task29
  select dpt_name from emp_department ed
  full join emp_details d on ed.dpt_code = d.emp_dept
  group by dpt_name
  having count(emp_idno) > 2


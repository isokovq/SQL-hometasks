use Northwindgo
--task35
select e.EmployeeID,OrderID, eomonth(OrderDate) as orderDate 
from Employees e join  Orders o on o.EmployeeID=e.EmployeeID
Order by e.EmployeeID,OrderID

--task 36
select top 10 o.OrderId, count(*) from Orders o
join OrderDetails od  on od.OrderID=o.OrderID
group by o.orderId
order by 2 desc
select * from OrderDetails
select * from Orders

--task37
select orderid
from orders
where orderid in (
    select top 2 percent orderid 
    from orders 
    order by newid()
);

--task38

select o.orderId from OrderDetails od
left join Orders o on o.OrderID=od.OrderID
left join Employees e on o.EmployeeID =e.EmployeeID
left join Products p on 
where quantity>=60 and 
e.EmployeeID = (select EmployeeID from Employees where FirstName= 'Janet' and LastName='Leverling')
group by o.OrderID,Quantity

select * from OrderDetails
where orderId =10263

--task39

Select OrderDetails.OrderID
,ProductID
,UnitPrice ,Quantity ,Discount From OrderDetails Join (
Select OrderID
From OrderDetails Where Quantity >= 60
Group By OrderID, Quantity Having Count(*) > 1
) PotentialProblemOrders on PotentialProblemOrders.OrderID =
OrderDetails.OrderID
Order by OrderID, ProductID
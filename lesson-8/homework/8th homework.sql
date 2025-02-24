use Northwind

select * from [dbo].[CustomerGroupThresholds]
select * from [dbo].[Customers]
select * from [dbo].[Employees]
select * from [dbo].[OrderDetails]
select * from [dbo].[Orders]
select * from [dbo].[Categories]
select * from [dbo].[Products]
select * from [dbo].[Shippers]
select * from [dbo].[Suppliers]

--task1
select * from shippers

--task2
select categoryname, description from Categories

--task3
select firstname, lastname, hiredate from Employees
where Title = 'Sales Representative'

--task4
select firstname, lastname, hiredate from Employees
where Title = 'Sales Representative' and country = 'USA'

--task5
select orderid, orderdate from Orders
where EmployeeID = 5

--task6
select supplierid,contactname, contactTitle from suppliers
where ContactTitle <> 'Marketing Manager'

--task7
select productID, ProductName from Products
where ProductName like '%queso%' 
 
 --task8
 select orderid, customerID, shipcountry from orders
 where ShipCountry in ('Belgium', 'France')

 --task9
 select orderid, customerID, shipcountry from orders
 where ShipCountry in ('Brazil', 'Mexico', 'Argentina', 'Venezuela')

 --task10
 select FirstName, LastName, Title, BirthDate from Employees
 Order by BirthDate

 --task11
 select  FirstName, LastName, Title,  CONVERT(DATE, BirthDate)
 from Employees
 Order by BirthDate
  
 --task12
  select firstname, lastname, CONCAT(FirstName, ' ', LastName) AS FullName 
  from Employees

  --task13
  select OrderID, ProductID, UnitPrice, Quantity,
  unitprice*quantity as Totalprice from OrderDetails

  --task14

  select count(distinct customerID) Totalcustomers from Customers

  --task15
  select min(orderdate) from orders

  --task16
  select country from customers
  group by country

  --task17
  select ContactTitle, count(ContactTitle) as TotalContactTitle from Customers
  group by ContactTitle
  order by 2 desc

  --task18 
  select ProductId, ProductName,CompanyName as Supplier from Products p 
  JOin Suppliers s on p.SupplierID=s.SupplierID
  order by 1

  --task19
  select orderId, OrderDate, CompanyName as Shipper from Orders o
  join Shippers s on o.ShipVia = s.ShipperID
  where orderID < 10300

  --task20
  select categoryName, count(Productname) from Categories c
  join Products p on c.CategoryID= p.CategoryID
  group by categoryName
  order by 2 desc

  --task21
  select Country, City, count(customerID) from CUstomers 
  Group by Country, City
  order by 3 desc

  --task22
  select ProductID, ProductName, UnitsInStock,reorderLevel from Products
  where UnitsInStock<ReorderLevel
  Order by ProductID

  --task23
 select ProductID, ProductName, UnitsInStock ,UnitsOnOrder, reorderLevel, Discontinued from Products 
  where UnitsInStock+UnitsOnOrder<=ReorderLevel and Discontinued=0

--task24
select customerID, CompanyName, Region  from Customers
Group by Region, CustomerID,CompanyName
Order by case when Region is null then 1 else 0 END, region
 
--task25
select top 3 shipCountry, avg(Freight) from Orders
group by shipCountry
Order by 2 desc

--task26
select top 3 shipCountry, avg(Freight) from Orders
where orderDate between '2015-01-01' and '2016-01-01'
group by shipCountry
Order by 2 desc

--task28
select top 3 shipCountry, avg(Freight) from Orders
where orderDate between (Select Dateadd(yy, -1, (Select Max(OrderDate) from Orders)))
and (select max(orderdate) from Orders)
group by shipCountry
Order by 2 desc

--task29
select e.employeeId,e.lastname,o.OrderID,p.ProductName,od.Quantity  from Employees e
JOin Orders o on e.EmployeeID= o.EmployeeID
join OrderDetails od on o.OrderId =od.OrderID
join Products p on p.ProductID= od.ProductID

--task30

Select Customers.CustomerID as Customers_CustomerID,
 Orders.CustomerID as Orders_CustomerID
From Customers 
left join Orders on Orders.CustomerID =
Customers.CustomerID
where Customers.CustomerID is null or  Orders.CustomerID is null

--task31
 Select Customers.CustomerID as Customers_CustomerID,
 Orders.CustomerID as Orders_CustomerID
From Customers 
left join Orders on Orders.CustomerID =
Customers.CustomerID And EmployeeID = 4 
where  Customers.CustomerID is null or  Orders.CustomerID is null

--TASK32

select c.CustomerID, CompanyName,o.orderID, sum(od.Quantity*od.unitprice) as TOA
from Customers c
join Orders o on c.CustomerID = o.CustomerID
join OrderDetails od on o.OrderID = od.OrderID
where OrderDate between '2016-01-01' and '2017-01-01'
group by c.CustomerID, CompanyName, o.orderID
Having sum(od.Quantity*od.unitprice) > 10000
order by TOA desc

--task33
select c.CustomerID, CompanyName, sum(od.Quantity*od.unitprice) as TOA
from Customers c
join Orders o on c.CustomerID = o.CustomerID
join OrderDetails od on o.OrderID = od.OrderID
where OrderDate between '2016-01-01' and '2017-01-01'
group by c.CustomerID, CompanyName
Having sum(od.Quantity*od.unitprice) >= 15000
order by TOA desc

--task34
select c.CustomerID, CompanyName, sum(od.Quantity*od.unitprice) as TOA, 
sum(od.Quantity*od.unitprice*(1-od.discount)) as TOAD
from Customers c
join Orders o on c.CustomerID = o.CustomerID
join OrderDetails od on o.OrderID = od.OrderID
where OrderDate between '2016-01-01' and '2017-01-01'
group by c.CustomerID, CompanyName
having sum(od.Quantity*od.unitprice*(1-od.discount)) >= 10000
order by TOAD desc

--TASK35
select e.employeeID, o.OrderID,  from Employees e
join Orders o on e.EmployeeID = o.EmployeeID

CREATE TABLE Colleagues
(
 
[Workplace] [varchar] (50) NULL,
[Name] [varchar] (50) NULL,
[Roles] [varchar] (50) NULL
)
 
GO
--Insert data in the table
 
INSERT INTO Colleagues(Workplace,Name,Roles)
SELECT 'A','John','Engineer'
UNION ALL
SELECT 'A','Jack','Officer'
UNION ALL
SELECT 'B','John','Manager'
UNION ALL
SELECT 'B','Jack','Manager'
UNION ALL
SELECT 'D','John','Chairman'
UNION ALL
SELECT 'E','Jack','Department Head'


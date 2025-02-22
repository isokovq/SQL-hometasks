/*Puzzle 1 A value of 0 signifies the workflow failed, and a value of 1 signifies the workflow passed.
Write an SQL statement that transforms the following table into the expected output.*/

CREATE TABLE #WorkflowCases
(
Workflow  VARCHAR(100) PRIMARY KEY,
Case1     INTEGER NOT NULL DEFAULT 0,
Case2     INTEGER NOT NULL DEFAULT 0,
Case3     INTEGER NOT NULL DEFAULT 0
);
GO

INSERT INTO #WorkflowCases (Workflow, Case1, Case2, Case3) VALUES
('Alpha',0,0,0),('Bravo',0,1,1),('Charlie',1,0,0),('Delta',0,0,0);
GO
  
/*Puzzle 2
Write an SQL statement given the following requirements.
For every customer that had a delivery to California, provide a result set of the customer orders that
were delivered to Texas*/

CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);
GO

INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);
GO

/*Puzzle 3
Your customer phone directory table allows individuals to set up a home, cellular, or work phone
number.
Write an SQL statement to transform the following table into the expected output
*/

CREATE TABLE #PhoneDirectory
(
CustomerID   INTEGER,
[Type]       VARCHAR(100),
PhoneNumber  VARCHAR(12) NOT NULL,
PRIMARY KEY (CustomerID, [Type])
);
GO

INSERT INTO #PhoneDirectory (CustomerID, [Type], PhoneNumber) VALUES
(1001,'Cellular','555-897-5421'),
(1001,'Work','555-897-6542'),
(1001,'Home','555-698-9874'),
(2002,'Cellular','555-963-6544'),
(2002,'Work','555-812-9856'),
(3003,'Cellular','555-987-6541');
select * from #PhoneDirectory
 
 Select CustomerID, 
 max(case when type = 'Cellular' then PhoneNumber end) as Cellular,
  max(case when type = 'Work' then PhoneNumber end) as Work,
  max(case when type = 'Home' then PhoneNumber end) as Home
 from #PhoneDirectory
 group by CustomerID
 
/*Puzzle 4
You work for a manufacturing company and need to track inventory adjustments from the warehouse.
Some days the inventory increases, on other days the inventory decreases.
Write an SQL statement that will provide a running balance of the inventory
*/
CREATE TABLE #Inventory
(
InventoryDate       DATE PRIMARY KEY,
QuantityAdjustment  INTEGER NOT NULL
);
GO

INSERT INTO #Inventory (InventoryDate, QuantityAdjustment) VALUES
('7/1/2018',100),('7/2/2018',75),('7/3/2018',-150),
('7/4/2018',50),('7/5/2018',-75);
GO

-- MY ANSWERS
--task1
  select workflow, case1+case2+case3 as SuccesfullCases from #WorkflowCases
  
  --task 2
  Select o1.CustomerID, o1.OrderID, o1.DeliveryState, o1.Amount from #Orders o1
join #Orders o2 on o1.customerID = o2.CustomerID and o2.DeliveryState = 'CA'
Where o1.DeliveryState = 'TX'

--task3
 Select CustomerID, 
 max(case when type = 'Cellular' then PhoneNumber end) as Cellular,
  max(case when type = 'Work' then PhoneNumber end) as Work,
  max(case when type = 'Home' then PhoneNumber end) as Home
 from #PhoneDirectory
 group by CustomerID


--task4

select i1.InventoryDate, i1.QuantityAdjustment, sum(i2.quantityAdjustment) as Runningtotal from #Inventory i1
join #Inventory i2 on i1.InventoryDate>=i2.InventoryDate
group by i1.InventoryDate, i1.QuantityAdjustment 
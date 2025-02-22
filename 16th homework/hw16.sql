CREATE TABLE #Consecutives
(
     Id VARCHAR(5)  
    ,Vals INT /* Value can be 0 or 1 */
)
GO
 
INSERT INTO #Consecutives VALUES
('a', 1),
('a', 0),
('a', 1),
('a', 1),
('a', 1),
('a', 0),
('b', 1),
('b', 1),
('b', 0),
('b', 1),
('b', 0)
GO

select * from #Consecutives

with cte as(
select *, 
count(id) over (partition by id) + 1 as NextOne,
row_number() over (order by id) as rn from #Consecutives),
cte2 as(
select *, rn - lag(rn) over (order by (select null)) as prrn from cte
where vals = 1)
select id, nextone, count(id) + 1 from cte2
where prrn = 1
group by id, nextone
order by id
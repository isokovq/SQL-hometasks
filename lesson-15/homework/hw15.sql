create table #EmptySeats(Number int, Empty varchar(1))

insert into #EmptySeats values (1, 'Y'), (2, 'N'), (3, 'N'), (4, 'Y'), (5, 'Y'), (6, 'Y'), (7, 'N'),
(8, 'Y'), (9, 'Y'), (10, 'Y'), (11, 'N'), (12, '')

select * from #EmptySeats

--Find 3 successive empty seats

with cte as(
select *, lead(empty,1) over (order by number) next, lead(empty,2) over (order by number) next2 from #EmptySeats)
select concat(Number, ' - ', Number +1, ' - ', Number+2) from cte
where cte.empty='Y' and cte.next='Y' and cte.next2='Y'



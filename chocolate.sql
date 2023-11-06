select * from sales
where GeoID = "G1"
order by PID, Amount desc;

select * from sales
where Boxes>=0 and Boxes<=50;
select * from sales
where Boxes between 0 and 50;

select SaleDate, Amount, Boxes, weekday(saledate) 'Day of week' from sales
where weekday(saledate) = 4;
select * from people
-- where team = 'Delish' or Team = 'Jucies'
-- where team in ('Delish', 'Jucies');
where Salesperson like '%A%';

select * from sales;
select saleDate, Amount,
       case when amount < 1000 then 'less than 1K'
            when amount < 5000 then 'less than 5K'
            when amount < 10000 then 'less than 10K'
           else '10K or more'
        end 'Amount Category'
        from sales
order by amount;

select s.SaleDate, s.Amount, s.SPID, p.SPID, p.Salesperson
from sales s
right join people p on s.spid = p.spid
order by p.spid desc, amount desc;

-- select s.SaleDate, s.Amount, s.Boxes, pr.Product
-- from sales s
-- left join products pr on pr.PID = s.PID

select s.SaleDate, s.Amount, s.SPID, p.team, p.Salesperson, pr.Product
from sales s
join people p on s.spid = p.spid
join products pr on pr.PID = s.PID
where s.amount < 500
and p.team = ''
order by p.spid desc, amount desc;

select s.SaleDate, s.Amount, s.SPID, p.team, p.Salesperson, pr.Product, g.Geo
from sales s
join people p on s.spid = p.spid
join products pr on pr.PID = s.PID
join geo g on g.GeoID = s.GeoID
where g.Geo in ('New Zealand', 'India')
order by p.spid desc, amount desc;
select * from people
where Salesperson like '%G%';
-- The Best Salesperson with Highest Amount
select s.SPID, s.Amount, s.Boxes, s.Customers, p.Team, p.Location, p.Salesperson, 
s.Amount/s.Boxes 'amount per box', count(p.Salesperson),count(p.Salesperson)/s.Boxes 'perosn per box'
from sales s
join people p on p.SPID = s.SPID
-- where Amount > 22500
group by p.Salesperson
order by Amount desc;

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

select s.SaleDate, s.Amount, s.Boxes, pr.Product
from sales s
left join products pr on pr.PID = s.PID;

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

select * from people
where Salesperson like '%G%';
-- The Best Salesperson with Highest Amount
select s.SPID, s.Amount, s.Boxes, s.Customers, p.Team, p.Location, p.Salesperson, 
s.Amount/s.Boxes 'amount per box', count(p.Salesperson),count(p.Salesperson)/s.Boxes 'perosn per box'
from sales s
join people p on p.SPID = s.SPID
-- where Amount > 22500
group by p.Salesperson
order by Amount desc;

select GeoID, sum(Amount), avg(Amount), sum(Boxes)
from sales
group by GeoID
order by GeoID;

select  p.Salesperson, sum(Boxes), avg(Boxes)
from sales s
right join people p on p.SPID = s.SPID
group by Salesperson
order by sum(Boxes) desc;

select g.GeoID, g.Geo, sum(Amount) totalAMount, avg(Amount), sum(Boxes)
from sales s
join geo g on g.GeoID = s.GeoID
group by g.GeoID
order by sum(Amount) desc;

select p.team, pr.Category, sum(Amount), avg(Amount), sum(Boxes)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid 
-- where team <> ''
group by pr.Category, p.team
order by sum(Amount) desc, pr.Category, p.team;

select pr.Product, sum(Amount) as 'Total Amount', avg(Amount), sum(Boxes)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid 
-- where team <> ''
group by pr.Product
order by sum(Amount) desc
limit 10;

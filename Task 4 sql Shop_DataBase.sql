use Shop_Database;
select *
from Customers,Orders;
select c.Name,o.*
from Customers c,Orders o;
select * from Customers;
select * from Orders;
select *
from Customers
full outer join Orders
on Customers.CustomerID = Orders.CustomerID;
select distinct c1.CustomerID , c2.Name
from Customers c1
join Customers c2
on c1.Name = c2.Name
and c1.CustomerID != c2.CustomerID;
select c.Name,o.*
from Customers c
join Orders o
on o.CustomerID=c.CustomerID
where o.Amount>500;
select c.*
from Customers c
full outer join Orders o
on o.CustomerID=c.CustomerID
where o.OrderID is null;
select c.*,COUNT(o.OrderID) as cnt
from Customers c
left join Orders o
on o.CustomerID = c.CustomerID
group by c.CustomerID, c.Name;
select c.*,COALESCE(SUM(o.Amount),0) as total
from Customers c
left join Orders o
on o.CustomerID=c.CustomerID
group by c.CustomerID, c.Name;
update Orders
set Amount=Amount * 1.1
where CustomerID = (select CustomerID from Customers where Name = 'John Doe');
delete o
from Orders o
left join Customers c
on o.CustomerID=c.CustomerID
where c.CustomerID is null;

create view OrdersView AS
select 
o.id
,o.quantity
,m.cost
from orders o
left join menu m
	on o.menuid = m.id;



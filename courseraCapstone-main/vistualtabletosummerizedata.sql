select * from bookings;
CREATE VIEW OrdersView AS SELECT id, quantity, cost FROM orders;
select * from ordersview;


select 
o.customerid
,c.firstname
,c.lastname
,o.cost
,m.itemname
,mi.coursename
from orders o
left join customer c 
	on o.customerid = c.id
left join menu m 
	on o.menuid = m.id
left join menuitems mi
	on m.menuitemid = mi.id
where o.cost > 150
order by o.cost desc;

select 
itemname 
from
menu
where (select count(itemname) from menu) >= 2;

create procedure GetMaxQuantity()
select max(quantity) from orders;

delimiter //
create procedure GetOrderDetail(
in custid int
)
begin 
select  o.id, o.quantity, o.cost 
from orders o 
left join customer c on o.customerid = custid;
end //
delimiter ;

delimiter //
create procedure CancelOrder(
in oid int
)
begin 
delete from orders o where o.id = oid;
end //
delimiter ;


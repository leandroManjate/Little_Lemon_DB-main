select 
c.id
,concat(c.firstname, " ",c.lastname) as FullName
,o.id as OrderId
,o.cost
,mi.coursename
,mi.menuname
from customer c 
left join orders o 
on c.id = o.customerid
left join menuitems mi
on o.menuid = mi.id
where o.cost > '150.00'
order by o.cost asc;

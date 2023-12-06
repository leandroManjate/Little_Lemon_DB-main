select 
m.itemname
from menu m
left join orders o 
on m.id = o.menuid
group by m.itemname
having count(m.itemname) > 2;
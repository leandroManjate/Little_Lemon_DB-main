insert into bookings values 
(1, 5, '2022-10-10', 1)
,(2, 3, '2022-11-12', 3)
,(3, 2, '2022-10-11', 2)
,(4, 2, '2022-10-13', 1);

insert into customer values
(1, 'james',999111222,'ya@g.ca','lname')
,(2, 'jason',999222333,'cool@you.com','pdawg')
,(3,  'moe',999222555,'boop@beep.net', 'rdawg');

select * from customer;

select * from staff;
insert into staff values (1),(2), (3);

create procedure CheckBooking(
in bdate datetime
,in tabnum int
)
select 

import mysql.connector as connector
from mysql.connector import pooling

dbconfig={"database":"littlelemondb", "user":"user", "password":"HungryHippo"}
conn_pool = pooling.MySQLConnectionPool(pool_name="pool_b",
                        pool_size=2,
                        host='localhost',
                        pool_reset_session=True,**dbconfig)

connection1 = conn_pool.get_connection()
cursor = connection1.cursor()

show_tables_query = "SHOW tables" 


cursor.execute(show_tables_query)
print("results for show tables")
for results in cursor:
    print(results)

customer_order_info_query = "select concat(c.firstname, ' ', c.lastname) as fullname, c.email, c.phone, o.cost from customer c left join orders o on c.id = o.customerid where o.cost > 60 "
cursor.execute(customer_order_info_query)
print("results for customers with orders > 60 $")
for results in cursor:
    print(results)
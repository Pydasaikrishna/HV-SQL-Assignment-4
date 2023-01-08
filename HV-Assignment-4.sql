-- CREATE DATABASE OrderDetails

#=================== CREATING THE consumer TABLE===============
-- CREATE TABLE consumer(consumer_id INT NOT NULL,consumer_name VARCHAR(25) NOT NULL,
-- salesmanager_id INT NOT NULL PRIMARY KEY,consumer_city VARCHAR(30) NOT NULL,Grade INT NOT NULL);

#=================== CREATING THE orders TABLE===============
-- CREATE TABLE orders(order_no INT NOT NULL,purchase_amount INT NOT NULL,order_date DATE NOT NULL,
--  consumer_id INT NOT NULL,salesmanager_id INT NOT NULL PRIMARY KEY);

#=================== CREATING THE sales manager TABLE===============
-- CREATE TABLE salesmanager(salesmanager_id INT NOT NULL PRIMARY KEY,Name VARCHAR(25) NOT NULL,
-- City VARCHAR(30) NOT NULL);

#=================== INSERTING THE VALUES IN consumer TABLE===========
-- INSERT INTO consumer(consumer_id,consumer_name,salesmanager_id,consumer_city,Grade)
-- VALUES (5001,"SAI",2001,"RJY",100),
-- (5002,"KRISHNA",2002,"KKD",300),
-- (5003,"DEEPU",2003,"VIZ",600),
-- (5004,"LAVANYA",2004,"VSP",400),
-- (5005,"PRABHA",2005,"RCPM",200)

-- SELECT * FROM consumer;

#=================== INSERTING THE VALUES IN orders TABLE===========
-- INSERT INTO orders(order_no,purchase_amount,order_date,consumer_id,salesmanager_id)
-- VALUES(101,500,"2022-08-15",5001,2001),
-- (102,300,"2022-06-05",5002,2002),
-- (103,400,"2022-05-06",5003,2003),
-- (104,600,"2019-07-21",5004,2004),
-- (105,200,"2008-02-12",5005,2005)

-- SELECT * FROM orders; 

#=================== INSERTING THE VALUES IN orders TABLE===========
-- INSERT INTO salesmanager(salesmanager_id,Name,City)
-- VALUES(2001,"KRISHNA","RJY"),
-- (2002,"RADHA","AMP"),
-- (2003,"GOPALA","TNK"),
-- (2004,"DEEPIKA","RZL"),
-- (2005,"MURARI","APK")

-- SELECT * FROM salesmanager;

#===========Display the purchase amount from 100 to 500 from the orders table.=========

-- SELECT purchase_amount FROM orders WHERE purchase_amount BETWEEN 100 AND 500;

#======Change the consumer id in the orders table where order_no is equal to “105”.=====

-- UPDATE orders SET order_no = "108" WHERE order_no = 105

-- SELECT * FROM orders;

#==== Return the consumer name, city, order number, order date, order amount, and sales manager name to find those consumers with a grade less than 500 and
# should return in ascending order of consumer id. =====

-- SELECT consumer.consumer_name,consumer.consumer_city,consumer.Grade,orders.order_no,
-- orders.order_date,orders.purchase_amount,salesmanager.Name FROM salesmanager
-- JOIN consumer,orders WHERE consumer.salesmanager_id = orders.salesmanager_id AND orders.salesmanager_id = salesmanager.salesmanager_id AND consumer.Grade < 500 ORDER BY Grade asc;


#=========== Return consumer name, city, order number, order date, and order amount in ascending order according to the order date to 
-- determine whether any of the existing consumers have placed an order or not ==============

-- SELECT consumer_name,consumer_city,order_no,order_date,purchase_amount FROM consumer,orders,salesmanager WHERE EXISTS(SELECT consumer_name FROM consumer WHERE consumer.salesmanager_id = orders.salesmanager_id AND orders.salesmanager_id = salesmanager.salesmanager_id 
-- AND purchase_amount ORDER BY purchase_amount, order_date asc)


#===== Fetch the consumer name, city, order number, order date, order amount, and sales manager name to find out whether any existing consumer(s) 
# have not placed any orders or if they have placed orders through their sales manager or by themselves. ========

-- SELECT consumer.consumer_name,consumer.consumer_city,orders.order_no,orders.order_date,orders.purchase_amount,salesmanager.Name FROM consumer,orders,salesmanager
-- WHERE EXISTS(SELECT consumer_name FROM consumer WHERE consumer.salesmanager_id = orders.salesmanager_id AND orders.salesmanager_id = salesmanager.salesmanager_id 
-- AND orders.purchase_amount AND orders.order_date ORDER BY purchase_amount, order_date asc)













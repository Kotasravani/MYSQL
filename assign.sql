create database assign;

create table assign.sales_Person
(Snum int Primary key,
Sname varchar(255) not null,
city varchar(255),
comm float);

insert into assign.sales_person values
(1001, "peel", "London",12),
(1002, "Serres", "Sanjose", 13),
(1004, "Motika", "London", 11),
(1007, "Rifikin", "Barcelona", 15),
(1003, "Axelrod", "NewYork", 10);

create table assign.customers
(Cnum int Primary key,
Cname varchar(255),
City varchar(255) not null,
Snum int,
foreign key(snum) references sales_person(snum));

insert into assign.customers values
(2001, "Hoffman", "London", 1001),
(2002, "Giovanni", "Rome", 1003),
(2003, "Liu", "Sanjose", 1002),
(2004, "Grass", "Berlin", 1002),
(2006, "Clemens", "Sanjose", 1001),
(2008, "Cisneros", "Sanjose", 1007),
(2007, "Pereira", "Rome", 1004);


create table assign.Orders
(Onum int Primary Key,
Amt float,
Odate DATE ,
cnum int,
foreign key(cnum) references customers(cnum),
snum int,
foreign key(snum) references sales_person(snum));

iNSERT INTO assign.orders(Onum,Amt,Odate,Cnum,Snum)
VALUES
(3001,18.69,"1990-10-3",2008,1007),
(3003,767.19,"1990-10-3",2001,1001),
(3002,1900.10,"1990-10-3",2007,1004),
(3005,5160.45,"1990-10-3",2003,1002),
(3006,1098.16,"1990-10-3",2008,1007),
(3009,1713.23,"1990-10-4",2002,1003),
(3007,75.75,"1990-10-4",2004,1002),
(3008,4273.00,"1990-10-5",2006,1001),
(3010,1309.95,"1990-10-6",2004,1002),
(3011,9891.88,"1990-10-6",2006,1001);

----------------- QUESTIONS BASED ON ABOVE TABLE ------------
# 1.  Count the number of Salesperson whose name begin with ‘a’/’A’.

select count(sname) from assign.sales_person
where sname like'A%';

SELECT COUNT(Sname) FROM assign.sales_person
WHERE Sname LIKE "a%";

#2.  Display all the Salesperson whose all orders worth is more than Rs. 2000.

SELECT sales_person.Sname,orders.Amt FROM assign.sales_person
INNER JOIN orders ON sales_person.Snum = orders.Snum 
WHERE Amt>2000;

#3. Count the number of Salesperson belonging to Newyork.

select count(city) as count_city from assign.sales_person
where city = "Newyork";

 #4. Display the number of Salespeople belonging to London and belonging to Paris.
 
 select * from assign.sales_person
 where city in ("London", "Paris");
 
 #5. Display the number of orders taken by each Salesperson and their date of orders.
 
SELECT sales_person.Sname,COUNT(orders.Onum) AS "Numbers of Orders",orders.Odate FROM assign.sales_person
INNER JOIN orders ON sales_person.Snum = orders.Snum 
GROUP BY sales_person.Sname;





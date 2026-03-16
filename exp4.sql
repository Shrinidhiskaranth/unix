create database bk_shop012
use bk_shop012
create table AUTHOR(
autherid int primary key,
aname varchar(20),city varchar(20),
country varchar(20))
insert into AUTHOR values(101,'Ravi','Mukka','India')
insert into AUTHOR values(102,'Surya','Periya','Sri lanka')
insert into AUTHOR values(103,'Sumukh','Panaji','Loas')
insert into AUTHOR values(104,'Sooraj','Vitla','Veitnam')
insert into AUTHOR values(105,'Toji','Tokyo','Japan')
select * from AUTHOR

create table PUBLISHER(
pubid int primary key,
pname varchar(20),
city varchar(20),
country varchar(20))
insert into PUBLISHER values(201,'Guru','haiti','USA')
insert into PUBLISHER values(202,'Noori','Naples','Italy')
insert into PUBLISHER values(203,'Farish','Paris','Spain')
insert into PUBLISHER values(204,'Ferman','Karachi','Pakistan')
insert into PUBLISHER values(205,'Mayur','Katmandu','Nepal')



create table CATEGORY(
catid int primary key,
descript varchar(30))
insert into CATEGORY values(1,'Fanasty')
insert into CATEGORY values(2,'Dark Fantasy')
insert into CATEGORY values(3,'Science')
insert into CATEGORY values(4,'Fiction')
insert into CATEGORY values(5,'Magical')


create table CATALOGUE(
  bookid int primary key,
  titile varchar(20),
  pubid int,
  autherid int,catid int,yr int,price int,
  foreign key(pubid) references PUBLISHER(pubid) on delete cascade on update cascade,
  foreign key(autherid) references AUTHOR(autherid) on delete cascade on update cascade ,foreign key(catid) references CATEGORY(catid) on delete cascade on update cascade)
  insert into CATALOGUE values(301,'Demon Slayer',202,102,1,2006,200)
  insert into CATALOGUE values(302,'Death Note',203,103,2,2007,500)
  insert into CATALOGUE values(303,'Stone',204,105,3,2007,300)
  insert into CATALOGUE values(304,'Re Zero',201,104,4,2001,250)
  insert into CATALOGUE values(305,'Jujutsu',205,101,5,2005,1000)
  create table ORDER_DET(
    ordno int,
	bookid int,
	qty int,
	primary key(ordno,bookid),
	foreign key(bookid) references CATALOGUE(bookid) on delete cascade on update cascade)
	insert into ORDER_DET values(401,302,4)
	insert into ORDER_DET values(402,305,9)
	insert into ORDER_DET values(403,302,3)
	insert into ORDER_DET values(404,303,2)
	insert into ORDER_DET values(405,304,7)

select A.autherid ,A.aname ,A.city ,C.bookid,sum(O.qty) as QTY_SUM
into tb_auth from AUTHOR A, CATALOGUE C,ORDER_DET O
where A.autherid = C.autherid
and C.bookid = O.bookid group by A.autherid, A.aname,A.city,C.bookid
select * from tb_auth where QTY_SUM in (select max(QTY_SUM) from
tb_auth)

update CATALOGUE set price = price * 1.1 where pubid in ( select pubid
from publisher where pname ='Guru')
select count(*) as no_of_orders from order_det
where bookid in (
select bookid from order_det group by bookid
having sum(qty) >= all (select sum(qty) from order_det group by
bookid)
)
group by bookid

select bookid,sum(qty) as total_sales from ORDER_DET
group by bookid
having sum(qty)=(select min(Total_qty) from(select sum(qty) as Total_qty from ORDER_DET group by bookid) as sales_summary);
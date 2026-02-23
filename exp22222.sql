create database ord_proc3
use ord_proc3
create table CUSTOMER(
custid int,
cname char(15) not null,
city varchar(30),
primary key(custid))
insert into CUSTOMER values('111','Shrinidhi','Uppinangady')
insert into CUSTOMER values('112','Sharun','Mangalore')
insert into CUSTOMER values('113','Sudhanva','Shirva')
insert into CUSTOMER values('114','Shubham','Kalburgi')
insert into CUSTOMER values('115','Suhas','Vijayanagar')
delete CUSTOMER
select * from CUSTOMER


create table C_ORDER(orderid int ,odate date,custid int,
ordamt int,
primary key(orderid),foreign key(custid) references CUSTOMER(custid) on delete cascade on update cascade )
insert into C_ORDER values('101','2026-01-12',111,4000)
insert into C_ORDER values('102','2024-01-13',112,3000)
insert into C_ORDER values('103','2025-03-12',113,4500)
insert into C_ORDER values('104','2023-01-12',114,3000)
insert into C_ORDER values('105','2022-01-12',115,2000)
insert into C_ORDER values('106','2022-01-12',111,2000)
insert into C_ORDER values('107','2022-01-12',111,2000)
insert into C_ORDER values('108','2022-01-12',111,2000)
insert into C_ORDER values('109','2022-01-12',111,2000)
delete C_ORDER
select * from C_ORDER

create table ITEM(itemid int,
price int 
primary key(itemid))
insert into ITEM values('201',4000)
insert into ITEM values('202',3000)
insert into ITEM values('203',4500)
insert into ITEM values('204',3000)
insert into ITEM values('205',2000)
delete ITEM
select * from ITEM

create table ORDER_ITEM(
orderid int,itemid int,
qty int,
primary key(orderid,itemid),foreign key(orderid) references C_ORDER(orderid) on delete cascade on update cascade,
foreign key(itemid) references ITEM(itemid) on delete cascade on update cascade )
insert into  ORDER_ITEM values('101','201',2)
insert into  ORDER_ITEM values('102','202',3)
insert into  ORDER_ITEM values('103','203',1)
insert into  ORDER_ITEM values('104','204',2)
insert into  ORDER_ITEM values('105','205',4)
insert into  ORDER_ITEM values('106','202',4)
insert into  ORDER_ITEM values('107','203',4)
insert into  ORDER_ITEM values('108','204',4)
insert into  ORDER_ITEM values('109','205',4)

delete ORDER_ITEM
select * from ORDER_ITEM

create table WAREHOUSE(
warehouseid int,city varchar(20) not null,primary key(warehouseid))
insert into  WAREHOUSE values('301','gujarat')
insert into  WAREHOUSE values('302','karnataka')
insert into  WAREHOUSE values('303','goa')
insert into  WAREHOUSE values('304','andrapradhesh')
insert into  WAREHOUSE values('305','telangana')
delete WAREHOUSE
select * from WAREHOUSE

create table shipments(
orderid int,
warehouseid int,ship_dt date,primary key(orderid,warehouseid),
foreign key(orderid) references C_ORDER(orderid) on delete cascade on update cascade,
foreign key(warehouseid) references WAREHOUSE(warehouseid) on delete cascade on update cascade)
insert into  shipments values('101','301','2026-01-12')
insert into  shipments values('102','302','2025-02-13')
insert into  shipments values('103','303','2026-03-11')
insert into  shipments values('104','304','2024-04-13')
insert into  shipments values('105','305','2023-11-12')
delete shipments
select * from shipments
select C.cname,count(O.orderid),avg(O.ordamt) 
from CUSTOMER C,C_ORDER O
where C.custid=O.custid group by C.cname
select S.orderid
from shipments S,WAREHOUSE W 
where S.warehouseid=W.warehouseid and
W.city='goa' group by S.orderid having count(W.warehouseid)>=2
select C.custid, C.cname,I.itemid from 
C_ORDER O,CUSTOMER C,ORDER_ITEM I where C.custid=O.custid and O.orderid=I.orderid group by C.custid,C.cname,I.itemid

select i.itemid, count(distinct s.warehouseid) as num_warehouses,
sum(oi.qty) as total_quantity_shipped
from ITEM i 
join ORDER_ITEM oi on i.itemid=oi.itemid 
join shipments s on oi.orderid=s.orderid and oi.itemid=s.orderid
group by i.itemid
having count(distinct oi.orderid)>2
and count(distinct s.warehouseid)>=2;


select c.custid ,c.cname 
from CUSTOMER c
join C_ORDER o on c.custid=o.custid join ORDER_ITEM oi on o.orderid=oi.orderid 
group by c.custid ,c.cname having count(distinct oi.itemid)=(select count(*) from ITEM);

SELECT w.warehouseid, w.city AS warehouse_city, c.cname, c.city AS customer_city
FROM shipments s
JOIN WAREHOUSE w ON s.warehouseid = w.warehouseid
JOIN C_ORDER o ON s.orderid = o.orderid
JOIN CUSTOMER c ON o.custid = c.custid
WHERE w.city = c.city;

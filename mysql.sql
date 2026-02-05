create Database Ins352
use Ins352

create table person(
driv_id varchar(10),
fname char(15) not null,
address varchar (30),
primary key (driv_id)
)

select * from person;

insert into person values('111','john smith','sp road,bangalore-12')
insert into person values('112','Ramesh Babu','kp nagar,bangalore-13')
insert into person values('113','Raju SK','ks circle,bangalore-12')
insert into person values('114','Ramesh Babu','AS road,bangalore-14')
insert into person values('115','Alica wallace','ss road,karkala-16')
select * from person

CREATE Table car(
regno varchar(10),
model varchar(10)not null,
cyear int,
primary key(regno)
)
insert into car values('KA-12','Ford',1980)
insert into car values('KA-12','Swift',1980)
insert into car values('mh-11','Indigo',1998)
insert into car values('AP-10','Swift',1980)
insert into car values('TN-11','Ford',2001)
insert into car values('TN-12','Toyota',2001)
insert into car values('MH-14','Swift',2001)
insert into car values('KL-15','Toyota',2001)
insert into car values('KL-4','Indigo',2001)
insert into car values('KL-05','Santro',2001)
select * from  car

CREATE TABLE accident(
reportno int,
accdate datetime,
location varchar(20),
primary key(reportno)
)
insert into accident values (1,'1998-07-22','Nitte')
insert into accident values (2,'1998-07-22','Karkala')
insert into accident values (12,'1998-07-22','Mangalore')
insert into accident values (3,'1998-07-23','Mangalore')
insert into accident values (4,'1998-07-09','Bhatkal')
insert into accident values (5,'1998-07-22','Udupi')
insert into accident values (6,'1998-07-09','Udupi')
insert into accident values (15,'1998-07-22','Udupi')

select * from  accident


CREATE TABLE owns(
driv_id varchar(10),
regno varchar(10),
primary key(driv_id,regno),
foreign key(driv_id) references person(driv_id) on delete cascade on update cascade, 
foreign key(regno) references car(regno) on delete cascade on update cascade,
unique(regno)
)
select * from person
select * from  car

insert into owns values('111','KA-13')
insert into owns values ('111','KA-12')

insert into owns values('112','MH-11')

insert into owns values ('112','AP-10')
insert into owns values('112','TN-11')

insert into owns values('113','TN-12')
insert into owns values ('113','KL-15')

insert into owns values ('114','AP-05')
insert into owns values ('114','KL-4')

insert into owns values ('114','KL-4')

select * from owns

CREATE TABLE participated(
driv_id varchar(10),
regno varchar(10),
reportno int,
dmgamt int,
primary key(driv_id,regno,reportno),
foreign key(driv_id) references person(driv_id) on delete cascade on update cascade,
foreign key(regno) references car(regno) on delete cascade on update cascade,
foreign key(reportno) references accident(reportno) on delete cascade on update cascade,
foreign key(driv_id,regno) references owns(driv_id,regno),
unique(reportno)
)

select * from accident

insert into participated values ('111','KA-12',1,20000)
insert into participated values ('111','KA-13',2,10000)
insert into participated values ('111','KA-12',3,60000)
insert into participated values ('111','KA-12',4,60000)
insert into participated values ('111','KA-12',5,60000)
insert into participated values ('111','KA-12',15,40000)
insert into participated values ('111','KA-13',6,10000)
insert into participated values ('111','MH-11',12,20000)
insert into participated values ('111','AP-10',7,30000)
insert into participated values ('111','TN-11',14,10000)
insert into participated values ('111','TN-12',9,40000)
insert into participated values ('113','KL-15',10,50000)
insert into participated values ('113','TN-12',11,20000)

select * from participated


select count (distinct P.driv_id)
from accident A,participated P
where A.reportno=P.reportno and A.accdate between '1998-01-01' and '1998-12-31'

select count(distinct P.driv_id)
from accident A,participated P
where A.reportno = P.reportno
and year(A.accdate)='1998'

select count (distinct P.driv_id)
from participated P where P.reportno in
(select reportno from accident
where year(accdate)='1998')

select count(distinct P.driv_id) as No_of_people
from participated P where p.reportno in
(select reportno from accident 
where year(accdate)='1998')


select count (P.reportno) as NO_OF_ACC
from participated P,person PN
where P.driv_id=PN.driv_id
and PN.fname='John smith'

update participated set dmgamt=3000 where reportno=1 and driv_id in (select driv_id from owns where regno='KA-12')

select * from person
select * from car
select * from accident
select * from participated 
select * from owns

create database stud_enrol
use stud_enrol
create table STUDENT(
regno varchar(10),
fname char(15),
major char(20),
bdate date,
primary key(regno));

insert into STUDENT values(111,'Ravi','CSE','2010-10-12')
insert into STUDENT values(112,'Govardhan','ISE','2005-11-13')
insert into STUDENT values(113,'Melvardhan','E&C','2011-01-01')
insert into STUDENT values(114,'Aman','EEE','2005-07-12')
insert into STUDENT values(115,'Sumedh','AIML','2006-10-23')
select * from STUDENT



create table COURSE (course int,
cname varchar(15),
dept char(20),
primary key(course));
insert into COURSE values(1,'Maths','CSE')
insert into COURSE values(2,'Cn','ISE')
insert into COURSE values(3,'signals','E&C')
insert into COURSE values(4,'Motors','EEE')
insert into COURSE values(5,'Data science','AIML')
select * from COURSE


create table TEXTBOOK(bookISBN int,
title varchar(50),
publisher varchar(20),
author char(20),
primary key(bookISBN)
);
insert into TEXTBOOK values(201,'Discrete maths','Anitha d bayar','Ashwini kumari')
insert into TEXTBOOK values(202,'Database management system','Prithviraj','Pradeep Kanchan')
insert into TEXTBOOK values(203,'Algorithm','Soumya p','Sunitha lasrado')
insert into TEXTBOOK values(204,'Data structres','Keerthana','Vaishali bangera')
insert into TEXTBOOK values(205,'Data science','Govindaraj','Rajashree')
select * from TEXTBOOK



create table BOOK_ADOPTION(course int,
sem int,
bookISBN int,
primary key(course,sem,bookISBN),foreign key(course) references COURSE(course) on delete cascade on update cascade ,foreign key(bookISBN) references TEXTBOOK(bookISBN) on delete cascade on update cascade);
insert into BOOK_ADOPTION values(1,2,201)
insert into BOOK_ADOPTION values(1,3,202)
insert into BOOK_ADOPTION values(2,2,203)
insert into BOOK_ADOPTION values(3,6,204)
insert into BOOK_ADOPTION values(4,4,205)
select * from BOOK_ADOPTION



create table ENROLL(
regno varchar(10),
course int,
sem int,marks int ,primary key(regno,course,sem),foreign key(regno) references STUDENT on delete cascade on update  cascade ,foreign key(course) references COURSE(course) on delete cascade on update cascade
)
insert into ENROLL values(111,2,1,60)
insert into ENROLL values(112,4,6,80)
insert into ENROLL values(113,1,7,90)
insert into ENROLL values(114,3,3,70)
insert into ENROLL values(115,5,2,95)
select * from ENROLL 

-- CREATING A DATABASE
CREATE DATABASE  BANK ;

-- USING A DATABASE
USE BANK;

-- THIS SHOW THE ALL DATABASES OF YOUR WORKBENCH
show databases;


-- CREATING 1ST TABLE
CREATE TABLE CUSTOMER_PERSONAL_INFO(
CUSTOMER_ID VARCHAR(5) PRIMARY KEY,
CUSTOMER_NAME VARCHAR(30),
DATE_OF_BIRTH DATE,
GUARDIAN_NAME VARCHAR(30),
ADDRESS VARCHAR(50),
CONTACT_NO BIGINT(10),
MAIL_ID VARCHAR(25),
GENDER CHAR(1)
);

-- THIS SHOWS ALL THE TABLES IN YOUR DATABASES
SHOW TABLES;

-- THIS SHOW THE DESCRIPTION SUCH AS DATATYPES AND CONSTRAINTS USE IN THE TABLE 
desc customer_personal_info;


-- CREATING 2ND TABLE
CREATE TABLE CUSTOMER_REFERENCE_INFO(
CUSTOMER_ID VARCHAR(5),
REFERENCE_ACC_NAME VARCHAR(20),
REFERENCE_ACC_NO BIGINT(16),
REFERENCE_ACC_ADDRESS VARCHAR (50),
RELATION VARCHAR(15),
foreign key (customer_id) references customer_personal_info(customer_id) on delete cascade
);
desc customer_reference_info;

show tables;


-- CREATING THE 3RD TABLE
create table bank(
ifsc_code varchar(20) primary key not null,
branch_name varchar(10),
bank_name varchar(20)
);

-- CREATING 4TH TABLE
create table bank_info(
customer_id varchar(5),
account_type varchar(20),
ifsc_code varchar(10),
registration_date date,
foreign key (ifsc_code) references bank(ifsc_code) on delete cascade
);


-- INSERTING THE VALUES OF IST TABLE
insert into customer_personal_info(customer_id,customer_name,date_of_birth,guardian_name,address,contact_no,mail_id,gender)
values (1,'Pankaj naik','2001-08-23','Basant naik','Mumbai',9359074652,'pankajnaik@gmail.com','M'),
(2,'Ravi pondra','1991-09-25','P danaiya','Bhilai',7859462875,'ravipondra@gmail.com','M'),
(3,'Abhay kumar','2022-01-22','P Laxmi narayan','Kursipar',6222487424,'abhaykumar@gmail.com','M'),
(4,'Krishna kumar','2003-08-23','Padma','durg',1234567894,'krishnakumar@gmail.com','M'),
(5,'Himanshu naik','2007-07-15','Saraswati','Nalasopara',8767657115,'himanshunaik@gmail.com','M'),
(6,'Dipti pandari','1999-09-24','P Ramchandra','Hosingboard',7854875186,'diptipandari@gmail.com','F'),
(7,'Taruna vehra','1997-08-21','Padma','gayanagar',4578933659,'tarunavehra@gmail.com','F');

desc customer_personal_info;

-- THIS WILL HSHOW ALL THE DATAS YOU HAD INSERTED INTO THE TABLE
select* from customer_personal_info;

-- INSERTING DATA IN THE 2ND TABLE
insert into CUSTOMER_REFERENCE_INFO(CUSTOMER_ID,REFERENCE_ACC_NAME,REFERENCE_ACC_NO,REFERENCE_ACC_ADDRESS,RELATION)
values (1,'basant naik',11001100124566,'Mumbai','Father'),
(4,'padma',11001100148566,'bhilai','mother'),
(5,'saraswati',11001100024566,'nalasopara','mother'),
(7,'praveen vehra',11054890124566,'durg','brother'),
(2,'P danaiya',110011001244578,'bhilai','Father'),
(3,'P laxmi',1001100124566,'kursipar','Father'),
(6,'p ramchndra',12001100124566,'housingboard','Father');

select* from customer_reference_info;
show tables;

-- INSERTING DATA IN THE 3RD TABLE
insert into bank(ifsc_code,branch_name,bank_name)
values ('BARBONALEAS','Nalasopara','BOB'),
('CNRB0100015','Bhayander','Canara'),
('BARB014507','Kursipar','BOI'),
('BRA29720546','Churchgate','SBI'),
('VGVSGUSH265','Bandra','HDFC');

select* from bank;

.
-- INSERTING DATA IN THE 4TH TABLE
insert into bank_info(customer_id,account_type,ifsc_code,registration_date)
values (4,'saving','VGVSGUSH265','2022-02-25'),
(3,'salary','BARB014507','2015-05-15'),
(2,'fixed','CNRB0100015','2018-12-09'),
(7,'Join','BRA29720546','2012-01-13'),
(6,'NRI','BARBONALEAS','2020-04-14');


-- THIS COMMAND IS USE FOR CHANGE THE COLUMNS BY MODIFY,DELETE,RENAME,ADD NEW COLUMNS
alter table bank_info
modify column ifsc_code varchar(20);

-- THIS IS USE TO DELETE THE WHOLE TABLE 
drop table bank_info;

-- CREATING AGAIN THE 4TH TABLE
create table bank_info(
customer_id varchar(5),
account_type varchar(20),
ifsc_code varchar(10),
registration_date date,
foreign key (ifsc_code) references bank(ifsc_code) on delete cascade,
foreign key (customer_id) references customer_personal_info(customer_id) on delete cascade
);
desc bank_info;
desc bank;

-- THIS COMMAND IS USE TO FETCH THE DATA INSIDE YOUR TABLES WITHOUT PERMANENTLY CHANGING IT.
select customer_id,ifsc_code from bank_info;


-- JOINING THE INNER TABLE 
select s.customer_id,s.date_of_birth,s.guardian_name,st.ifsc_code,st.customer_id
from customer_personal_info s
inner join bank_info st
on s.customer_id=st.customer_id;


-- LEFT JOINING THE TABLE
select s.customer_id,s.date_of_birth,s.customer_name,s.guardian_name,st.ifsc_code,st.customer_id
from customer_personal_info s
left join bank_info st
on s.customer_id=st.customer_id;


-- RIGHT JOINING THE TABNLE
select s.customer_id,s.date_of_birth,s.guardian_name,st.ifsc_code,st.customer_id
from customer_personal_info s
right join bank_info st
on s.customer_id=st.customer_id;


-- CROSS JOINING THE TABLE
select s.customer_id,s.customer_name,s.guardian_name,st.ifsc_code,st.customer_id
from customer_personal_info s
cross join bank_info st;

-- FETCHING THE DATA USING WHERE CLAUSE
select ifsc_code,account_type from bank_info where customer_id=6; 


alter table bank_info
add column amount bigint;

-- THIS IS USE TO UPDATE THE DATA INSISE YOUR TABLE
update bank_info
set amount=120000 where customer_id=4;

update bank_info
set amount=150000000 where customer_id=3;

update bank_info
set amount=18000 where customer_id=2;

update bank_info
set amount=100000 where customer_id=7;

update bank_info
set amount=14506 where customer_id=6;


select*from bank_info;

-- THIS COMMAND IS USING WHERE AND COMPARISION OPERATOR
select * from bank_info where customer_id !=2;

-- RANGE AND WHERE COMMAND
select * from bank_info where amount between 100000 and 150000000000;
select * from bank_info where registration_date between '2020-12-31' and '2022-12-31';
select * from bank_info where amount not between 100000 and 1500000;

-- LIST OPERATOR
select * from bank_info where amount not in (100000,150000000,14506);
select * from bank_info where registration_date in ('2012-01-13','2020-04-14');

-- LIKE OPERATORS
select * from bank_info where ifsc_code not like '%ar%';
select * from bank_info where ifsc_code like '%7';
select * from bank_info where ifsc_code like 'b%s';

-- DISTINCT KEY
select distinct relation from customer_reference_info;

-- ORDER BY CLAUSE
select * from customer_personal_info order by customer_name desc;

-- USING ORDER BY AND LIMIT 
select * from customer_reference_info order by customer_id limit 2;

-- USING COMPARISION,WHERE AND ORDER BY COMMAND
select * from bank_info where amount >10000 order by customer_id;


-- USING LIKE OPERATOR,LOGICAL, NULL OR NOT NULL AND WHERE
select * from bank_info where ifsc_code like 'B%' and amount is not null;

-- CASE EXPRESSION
select customer_id,ifsc_code,amount,
case
when amount>1500000 then "Premium Member"
when amount<20000 then "non_premium member"
else "normal member"
end as member_status
from bank_info;

-- SRTING FUNCTIONS
-- CONCATINATION
select customer_id,concat(customer_name,' son of ',guardian_name)as relation,address from customer_personal_info;

-- LOWER
select lower(ifsc_code) from bank_info; 

-- UPPER
select upper(mail_id) from customer_personal_info;

-- REPLACE
select replace('ravi pondra','pondra','kumar')from customer_personal_info where customer_id =2;

-- SUBSTRING
select substring('pankaj naik',-9,3)as length from customer_personal_info where customer_id=1;

-- LENGTH
select length('pankajnaik@gmail.com') as length from customer_personal_info where customer_id =1;


-- GROUP BY CLAUSE WITH HAVNG CONDITION
select count(customer_id),gender from customer_personal_info group by gender having count(customer_id) >2;

-- SINGLE SUBQUERY
select * from bank_info where amount=(select amount from bank_info where customer_id=4);

-- MULTIPLE SUBQUERY
select * from bank_info where amount in(select amount from bank_info where amount>=100000);

-- CREATING A SIMPLE VIEW
create view customer as select customer_id,customer_name,mail_id,contact_no,gender from customer_personal_info;
show tables;

-- INSERTING DATA IN SIMPLE VIEW
insert into customer(customer_id,customer_name,mail_id,contact_no,gender)
values (8,'Pooja naik','poojanaik@gmail.com','9561488160','F'),
 (9,'Atharv ranjankar','atharvranjankar@gmail.com','9323098323','M');
 select * from customer_personal_info;
 select* from customer;
 
 -- UPDATING SIMPLE VIEW
update customer set customer_id=9 where customer_id =10;

-- DELETING A SIMPLE VIEW DATA
delete from customer where customer_id=9;


-- CREATING A COMPLEX VIEW USING JOINS
create view pankaj_view as select customer.customer_id,customer.customer_name,date_of_birth,customer_personal_info.gender,
customer_personal_info.mail_id 
from customer
inner join customer_personal_info
on customer.customer_id=customer_personal_info.customer_id;

show tables;


-- DROPING COMPLEX VIEW
drop view pankaj_view;


--  NEW KEYS


-- USE OF UNION KEYS
SELECT customer_id,relation from customer_reference_info where relation='Father' union
select ifsc_code,account_type from bank_info ;

select* from bank_info;

-- USE OF ANY OPERATOR USING WHERE,SELECT CONDITION.
select customer_id, relation from customer_reference_info where customer_id=ANY(select customer_id from customer_personal_info
 where gender='M');

-- USE OF ALL OPERATOR
select customer_id, relation from customer_reference_info where customer_id=ALL(select customer_id from customer_personal_info 
where gender='T');


use bank;
select * from customer_personal_info where customer_name like ('%r');

select s.customer_name,s.guardian_name,st.relation
from customer_personal_info s
cross join customer_reference_info st;
------------------------------------------  ------------------------------- -------------------------------- ---------------------------------




create schema hr;
go

Create Table hr.candidates(
id int primary key identity,
fullname varchar(60) not null);

Create Table hr.employees(
id int primary key identity,
fullname varchar(60) not null);

insert into hr.candidates(fullname) values('John cena'),('Dean ambrose'),('Seth rollins'),('Roman reigns');
insert into hr.employees(fullname) values('Triple H'),('Dean ambrose'),('Brok lestner'),('Roman reigns');

select * from hr.candidates;
select * from hr.employees;

--- Inner Join ---
select 
	c.id candidate_id,
	c.fullname candidate_name,
	e.id candidate_id,
	e.fullname candidate_name
from hr.candidates c
	INNER JOIN hr.employees e
	ON c.fullname=e.fullname;
---------------------------------
select 
	c.id cId,
	c.fullname cFN,
	e.id eId,
	e.fullname eFN
FROM hr.candidates c
	Inner Join hr.employees e
	On c.fullname=e.fullname;
	------------------
--- Left join---
select 
	c.id candidate_id,
	c.fullname candidate_name,
	e.id candidate_id,
	e.fullname candidate_name
from hr.candidates c
	left join hr.employees e
	ON c.fullname=e.fullname;
-------------------------------------
--- Right join ------
select 
	c.id candidate_id,
	c.fullname candidate_name,
	e.id candidate_id,
	e.fullname candidate_name
from hr.candidates c
	Right join hr.employees e
	ON c.fullname=e.fullname;

	------- checking only for null values
select 
	c.id candidate_id,
	c.fullname candidate_name,
	e.id candidate_id,
	e.fullname candidate_name
from hr.candidates c
	Right join hr.employees e
	ON c.fullname=e.fullname
Where c.id is null;

---full join
select 
	c.id candidate_id,
	c.fullname candidate_name,
	e.id candidate_id,
	e.fullname candidate_name
from hr.candidates c
	Full join hr.employees e
	ON c.fullname=e.fullname;
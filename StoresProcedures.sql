select * from hr.candidates;
select * from hr.candidates where id=2;
----------- stored procedures ---------------
create procedure spGetAllCandidates
as
begin
select * from hr.employees
end;

Exec spGetAllEmployees;
Exec spGetAllCandidates;


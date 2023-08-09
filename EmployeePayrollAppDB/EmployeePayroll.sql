Create table EmployeeTable(
Id int primary key identity,
Name varchar(100) Not Null,
ProfileImage varchar(100),
Gender varchar(50),
Department varchar(50),
Salary int,
StartDate DateTime,
Notes varchar(200),
CreatedAt DateTime,
ModifiedAt DateTime,
IsTrash bit default 0
);

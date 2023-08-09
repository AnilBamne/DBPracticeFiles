Create Procedure spAddEmployee
@Name varchar(100),
@ProfileImage varchar(100),
@Gender varchar(50),
@Department varchar(50),
@Salary int,
@StartDate DateTime,
@Notes varchar(200)
AS
Begin
	Begin Try
		Begin Transaction
		Insert Into EmployeeTable(Name,ProfileImage,Gender,Department,Salary,StartDate,Notes,CreatedAt,ModifiedAt)
		Values(@Name,@ProfileImage,@Gender,@Department,@Salary,@StartDate,@Notes,GetDate(),GETDATE())
		Commit Transaction
	End Try
	Begin Catch
		rollback transaction
	End Catch
End

Exec spAddEmployee 'Sam','image.png','M','HR',30000, '10-05-2023','Sam started working as a hr'

select * from EmployeeTable

---Stored procedure for Get all emp
Create proc spGetAllEmployees
AS
Begin
	Begin Try
		Begin Transaction
			Select * from EmployeeTable
		Commit Transaction
	End Try
	Begin Catch
		rollback transaction
	End Catch
End

Exec spGetAllEmployees

---stored procedure for update emp details
Create Procedure spUpdateEmployee
@EmpId int,
@Name varchar(100),
@ProfileImage varchar(100),
@Gender varchar(50),
@Department varchar(50),
@Salary int,
@StartDate DateTime,
@Notes varchar(200)
AS
Begin
	Begin Try
		Begin Transaction
		Update EmployeeTable
		Set Name=@Name,ProfileImage=@ProfileImage,Gender=@Gender,
		Department=@Department,Salary=@Salary,StartDate=@StartDate,
		Notes=@Notes,ModifiedAt=GETDATE() Where Id=@EmpId
		Commit Transaction
	End Try
	Begin Catch
		rollback transaction
	End Catch
End

Exec spUpdateEmployee 3,'Naresh','image.jpeg','Male','Tester','30000','06-07-2023','dJHDKajd';
select * from EmployeeTable
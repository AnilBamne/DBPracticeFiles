Create Procedure spDeleteEmployee
@EmpId int
AS
Begin
Begin Try
	Begin tran
		Delete from EmployeeTable Where Id=@EmpId;
	Commit tran
End Try
Begin Catch
	Rollback Tran
End catch
End

Exec spDeleteEmployee 6;
select * from EmployeeTable

Alter table EmployeeTable
Alter column ProfileImage varchar(255);
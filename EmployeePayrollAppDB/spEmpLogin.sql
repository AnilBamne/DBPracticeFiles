--stored procedure for login
Create Procedure spEmployeLogin
@Id int,
@Name varchar(100)
AS
Begin
	Begin Try
	Begin Tran
		If Exists(Select * from EmployeeTable Where Id=@Id AND Name=@Name)
		Begin
			Select Id from EmployeeTable Where Id=@Id AND Name=@Name
			print 'User exists';
		End
		Else
		Begin
			print 'User not exists';
		End
	Commit Tran
	End Try
	Begin Catch
		Rollback Tran
	End Catch
End


Exec spEmployeLogin 3,'Naresh'
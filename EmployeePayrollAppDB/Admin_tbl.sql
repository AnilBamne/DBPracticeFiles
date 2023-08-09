Create Table AdminTable(
Id int primary key Identity,
AdminName Varchar(100),
AdminEmail Varchar(100),
AdminPassword Varchar(100)
);
Insert Into AdminTable(AdminName,AdminEmail,AdminPassword)Values('Admin','Admin@gmail.com','Admin@123');

Select * from AdminTable

--stored procedure for login
Alter Procedure spAdminLogin
@Id int,
@Name varchar(100)
AS
Begin
	Begin Try
	Begin Tran
		If Exists(Select * from AdminTable Where Id=@Id AND AdminName=@Name)
		Begin
			Select Id from AdminTable Where Id=@Id AND AdminName=@Name
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

Exec spAdminLogin 1,Admin
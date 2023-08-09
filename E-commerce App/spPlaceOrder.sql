Select * From Customers
Insert Into Customers (Name,Email,Password,Address) Values('Sam','Sam@gmail.com','Sam@123','Austin')
Insert Into Customers (Name,Email,Password,Address) Values('Khris','Khris@gmail.com','Khris@123','New York')
Insert Into Customers (Name,Email,Password,Address) Values('David','David@gmail.com','David@123','Hongkong')
Insert Into Customers (Name,Email,Password,Address) Values('Nick','Nick@gmail.com','Nick@123','New York')
Insert Into Customers (Name,Email,Password,Address) Values('Anderson','Anderson@gmail.com','Anderson@123','Poland')
Insert Into Customers (Name,Email,Password,Address) Values('Tom','Tom@gmail.com','Tom@123','Canada')

---------------------------------------------
Select * from Products
Insert Into Products(Name,Price,Quantity) Values('TV',10000,20)
Insert Into Products(Name,Price,Quantity) Values('Mobile',20000,80)
Insert Into Products(Name,Price,Quantity) Values('AC',10000,20)
Insert Into Products(Name,Price,Quantity) Values('Refrigerator',17000,40)
Insert Into Products(Name,Price,Quantity) Values('Cooler',9000,20)

------------------------------------------------------

Select * from Orders

--Stored procedure for Order
Alter Proc spPlaceOrder
@productId int,
@customerId int,
@quantity int 
As
Begin
	Begin Try
		Begin Transaction
		declare @prodName varchar(100);
		set @prodName=(select Name from Products where Id=@productId)
			
		Insert Into Orders (ProdName,Quantity,OrderDate,CustId,ProdId)
		Values(@prodName,@quantity,GetDate(),@customerId,@productId);
		--Declare @orderId int = SCOPE_IDENTITY();
			
			--- updating inventory
		--Update Products set Quantity=Quantity-@quantity where Id=@productId;
		Commit Transaction
	End Try
	Begin Catch
		Rollback Transaction;
	End Catch
 End;

 exec spPlaceOrder 2,2,7
 select * from Products
 select * from Customers
   Insert into Orders(ProdName,Quantity,OrderDate,ProdId)Values('TV',2,GETDATE(),1)
 select * from Invoice
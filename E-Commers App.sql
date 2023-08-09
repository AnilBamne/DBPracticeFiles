Create Table Customers(
Id int primary key identity(1,1),
Name varchar(50),
Email varchar(50),
Password varchar(50),
Address varchar(100)
);

Create Table Products(
Id int primary key identity(1,1),
Name varchar(50),
Price float,
Quantity int
);

Create Table Orders(
Id int primary key identity(1,1),
ProdName varchar(50),
Quantity int,
OrderDate DateTime,
CustId int Foreign key References Customers(Id),
ProdId int Foreign key References Orders(Id)
);

Create Table Invoice(
Id int primary key identity(1,1),
CustomerName varchar(50),
ProductName varchar(50),
Quantity int,
price float,
Amount int,
OrderDate DateTime,
OederId int Foreign key References Orders(Id)
);

create proc spPlaceOrder
 @productId int,
 @customerId int,
 @Quantity int,
 
 Begin
	if @productId is Null OR @customerId is Null OR @Quantity is Null
	Begin
		RAISEERROR('Invalid input',1,1);
		return;
	End
	
	-- placing order --
	Begin Try
		Begin Transaction
			declare @custName varchar(50),@prodName varchar(50);
			select @custName=Name from Customers where Id=@customerId;
			select @prodName=Name from Products where Id=@productid;

			Insert Into order (ProdName,Quantity,OrderDate,CustId,ProdId)
			Values(@prodName,@Quantity,Date.Now(),@customerId,@productId);
			Declare @orderId = SCOPE_IDENTITY();
			
			--- updating inventory
			Update Product set Quantity=Quantity-@Quantity where Id=@productId;

			select * from Products
		
		Commit Transaction
	End Try
	Begin Catch
		Rollback Transaction;
	End Catch
 End;

Create Trigger trg_GenerateInvoice
ON Orders
for insert
AS
Begin
	Declare @orderId int, @productName varchar(50),@quantity int,@totalprice float;

	select @orderId=Id from inserted;
	select @productName=Name from inserted;
	select @quantity=Quantity from inserted;
	select @totalprice=Amount from inserted;

	Insert into Invoice (orderId,prodName,quantity,totalAmount)
	Values(@orderId,@pName,@quant,@totalpri)
End;
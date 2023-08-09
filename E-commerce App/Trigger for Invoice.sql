
---Trigger for Generationg invoice on placing orders
Alter Trigger trg_GenerateInvoice
On Orders
For Insert
As
Begin
	Declare @orderId int,@customerId int,@productId int,@customerName varchar(100),@productName varchar(100),@quantity int,@price float,@amount float,@orderDate DateTime
	
	set @price=(select Price from Products Where Id=@productId)

	select @productName=ProdName from inserted
	select @quantity = Quantity from inserted
	select @amount=@price*@quantity
	select @orderDate= OrderDate from Inserted
	select @orderId=Id from inserted
	set @customerName = (Select Name from Customers Where Id=@customerId);

	Insert Into Invoice (CustomerName,ProductName,Quantity,price,Amount,OrderDate,OederId)
				Values(@customerName,@productName,@quantity,@price,@amount,@orderDate,@orderId)
End


--E-commerce application: 
--Suppose you have an e-commerce application where customers can place orders, and the orders need to be processed and shipped. 
--You could create a stored procedure that takes in the order details, validates the data, creates a new order in the database,
-- updates the inventory, and sends an email confirmation to the customer. This stored procedure could be called from the 
-- application whenever a new order is placed.
 
-- list of tables
-- 1.customers,
-- 2.products,
-- 3.orders,
 
 --STEP1
 create proc spOrderProcess
 @prodName varchar(100),
 @productId int,
 @customerId int,
 @Quantity int
 As
 Begin
	if @productId is Null OR @customerId is Null OR @Quantity is Null
	Begin
		RAISEERROR('Invalid input',1,1);
		return;
	End
	
	-- placing order --
	Begin Try
		Begin Transaction
			Insert Into Orders (ProdName,Quantity,orderDate,CustId,ProdId)
			Values(@prodName,@Quantity,Date.Now(),@customerId,@productId);
			Declare @orderId = SCOPE_IDENTITY();
			
			--- updating inventory
			Update Products set quantity=quantity-@Quantity where productId=@productId;
			
			---- STEP3  Send email confirmation to customer   ----
			Declare @customerEmailId varchar(100);
			select @customerEmailId=Email from customer where customerId=@customerId;
			EXEC spSendConfirmationMail(@customerEmailId,@orderId);
			
			--- join
			select * from customer 
			Inner Join orders
			On orders.customerId=customer.customerId
			where orderId=@orderId;
		
		Commit Transaction
	End Try
	Begin Catch
		Rollback Transaction;
	End Catch
 End;
 
 ---STEP2   trigger for generating Invoice ----
Create Trigger trg_GenerateInvoice
ON orders

for insert
AS
Begin
	Declare @oId int, @pName varchar(100),@quant int,@totalpri float;

	select @oId=id from inserted;
	select @pName=productName from inserted;
	select @quant=quantity from inserted;
	select @totalpri=totalPrice from inserted;

	Insert into Invoice (Id,Name,price,Quantity)
	Values(@oId,@pName,@totalpri,@quant)
End;

--------------------------------------------------------------------------------------------
--2.E-commerce application: In an e-commerce application, you could use a join to retrieve the order details and customer information
-- for a specific order. For example, you could join the orders table with the customers table on the customer ID to get the customers
-- name, address, and contact information for the order.
 
 create procedure spGetOrderDetails
 @orderId int
 As      
 Begin
	Begin Try
		Begin Transaction
			select * from customer 
			Inner Join orders
			On orders.customerId=customer.customerId
			where orderId=@orderId
		Commit Transaction
	End Try
	Begin Catch
		Rollback Transaction;
	End Catch
 End;


 select * from Products
--Examen
--Nohemi Campech Colin

--Ejercicio 1 



go
Create or alter view VistaInformacionClienteEmpleado
as
select
cu.CompanyName as 'Nombre del Cliente',
o.OrderID as 'Identificador',
CONCAT(e.FirstName, ' ', e.LastName) as 'Nombre de Empleado',
o.OrderDate as 'Fecha de Orden',
o.RequiredDate as 'Fecha de Requisicion',
o.Freight as 'Peso'
from Customers as cu
inner join Orders as o
on cu.CustomerID = o.CustomerID
inner join Employees as e
on e.EmployeeID = o.EmployeeID
go

select * from VistaInformacionClienteEmpleado

--------------------------------------------------------------------------------------------------------------


--Ejercicio 2

select * from [Order Details]
select * from Products
select * from Categories

go
create or alter view VistaDetallePedidosInformacionProductoCategoria
as 
select 
p.ProductName as 'Nombre del Producto',
c.CategoryName as 'Nombre de Categoria',
od.UnitPrice as 'Precio Unitario',
od.Quantity as 'Cantidad de Vendida',
(od.Quantity * od.UnitPrice) as 'Importe'
from [Order Details] as od
inner join Products as p
on od.ProductID = p.ProductID
inner join Categories as c
on p.CategoryID = c.CategoryID
go

select * from VistaDetallePedidosInformacionProductoCategoria

-----------------------------------------------------------------------

--Ejercicio 3

go 
create or alter proc spu_RegistrarNuevoPedido
@CustomerID NVARCHAR(5),
@EmployeeID INT,
@OrderDate DATETIME,
@RequiredDate DATETIME,
@ShipVia INT,
@Freight MONEY
as
	begin
		if not exists (select 1 from Customers where CustomerID = @CustomerID)
		begin
		print 'Error'
		return -1;
		end

		if not exists (select 1 from Employees where EmployeeID = @EmployeeID)
		begin
		print 'Error'
		return -2;
		end

		if @RequiredDate <= @OrderDate
		begin
		print 'Error'
		return -3;
		end

			begin try 

			insert into Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShipVia, Freight)
			values (@CustomerID,@EmployeeID,@OrderDate,@RequiredDate,@ShipVia,@Freight)

			end try

		begin catch
		print 'Error inerperado'
		return -4;
		end catch

	end;
go

select * from orders

exec spu_RegistrarNuevoPedido
@OrderDate = '1996-07-04' , @RequiredDate = '1996-08-01', 
@ShipVia = 3 , @Freight = 32.38,	
@CustomerID = 'VINET' , @EmployeeID = 5
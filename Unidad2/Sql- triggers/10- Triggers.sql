--Triggers (Disparadores)(Tipo de SP)
--Delete, interte, update
--Aplicar a : tablas, views

/*
Create or alter trigger nombre-trigger
on tabla
after | for
as
	begin
	end;
*/


--Realizar un trigger que se dispare cuando se inserte un pedido pero y modifique el stock del producto vendido
--verificar si hay suficiente stock sino se cancela el pedido

select * from Pedidos

CREATE OR ALTER TRIGGER tg_pedidos_insertar
on pedidos 
after insert
as
begin
declare @existencia int
declare @fab char(3)
declare @prod char(5)
declare @cantidad int


select @fab = fab, @prod = producto,
@cantidad = Cantidad
from inserted

select @existencia = stock from Productos
where id_fab = @fab and Id_producto = @prod;

if @existencia > (select cantidad from inserted)
begin
update Productos
set stock = stock - @cantidad
where Id_fab = @fab and 
	  Id_producto = @prod;
end;

else
begin 
	raiserror('No hay suficiente stock para el pedido', 16,1)
	rollback;
end;

end;

select * from Pedidos
select MAX(Num_Pedido) from Pedidos
select * from Productos

declare @importe money
select @importe = (p.Cantidad * pr.Precio)
from pedidos as p
inner join Productos as pr
on p.Fab = pr.Id_fab 
and p.Producto = pr.Id_producto

insert into Pedidos(Num_Pedido, Fecha_Pedido, cliente, Rep, Fab, Producto, Cantidad, Importe)
values(113071, getdate(), 2103, 106, 'Aci', '41001', 77, @importe)


select * from Productos
where Id_fab = 'ACI'
and Id_producto = '41001'

select * from Pedidos
where Num_Pedido = 113071

--Crear un trigger que cada vez que se elimine un pedido se debe actualizar el stock de los productos con la cantidad eliminada.

create or alter trigger tg_actualizarStock
on Pedidos
after deleted
as
	begin
declare @Existencia int
declare @fab char(3)
declare @prod char(5)
declare @cantidad int

select 
	end;

	--Logros: Creacion de triggers
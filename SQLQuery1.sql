
--?? Lista de pedidos con la fecha en que se realizaron, el nombre del cliente, el representante asignado y el importe total del pedido.

Select * from Pedidos
select * from Clientes
select * from Representantes

Select p.Fecha_Pedido, c.Empresa, p.Rep, p.Importe
from Pedidos as p
inner join Clientes as c 
on c.Num_Cli = p.Cliente 
inner join Representantes as r
on r.Num_Empl = c.Rep_Cli

--??Total de ventas realizadas en cada oficina, agrupando a todos los representantes de cada oficina.

select * from Representantes
select * from Oficinas

select  o.Oficina ,sum (r.Ventas) as 'Total de ventas'
from Representantes as r
inner join Oficinas as o
on r.Num_Empl = o.Jef
group by o.Oficina

--Obtener los productos más vendidos
--?? Muestra el ID del producto, su descripción y cuántas veces ha sido vendido (ordenado de mayor a menor).

select * from Productos
select * from Pedidos

select pr.Id_producto, pr.Descripcion, pe.Cantidad
from Productos as pr
inner join Pedidos as pe
on pr.Id_producto = pe.Producto and pr.Id_fab = pe.Fab
order by [Cantidad] desc

--Listar las oficinas que no tienen representantes asignados
--?? Muestra todas las oficinas que NO tienen ningún representante registrado.

select * from Oficinas
select * from  Representantes

select o.Oficina, r.Oficina_Rep
from Oficinas as o 
inner join Representantes as r
on o.Oficina = r.Oficina_Rep
where Oficina_Rep is null 

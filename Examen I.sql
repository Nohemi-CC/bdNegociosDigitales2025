
--Examen 

--1

select * from Clientes
select * from Representantes

select Nombre, Limite_Credito
from Clientes as c
inner join Representantes as r
on r.Num_Empl = c.Rep_Cli
where Limite_Credito > 5000

--2 *

select * from Pedidos
select * from Clientes

--select Num_Cli, Rep_Cli ,Empresa ,Cantidad, Importe 
--from Clientes as c
--inner join Pedidos as p
--on p.Cliente = c.Num_Cli 
--where Cantidad >= 100 and Importe >= 5000

select Num_Cli, Rep_Cli ,Empresa ,Cantidad, Importe 
from Clientes as c
inner join Pedidos as p
on p.Cliente = c.Num_Cli 
where Cantidad >= 100 or Importe >= 5000

--3

select * from Oficinas
select * from Representantes

select o.Oficina, o.Region, o.Ciudad, nombre
from Oficinas as o
inner join Representantes as r
on o.Oficina = r.Oficina_Rep

--4 

select * from Clientes
select * from Representantes
select * from Oficinas

select r.Nombre, c.Empresa, o.Ciudad
from Clientes as c
inner join Representantes as r
on r.Num_Empl = c.Rep_Cli
inner join Oficinas as o
on o.Oficina = r.Oficina_Rep
where Ciudad in ('Navarra', 'Castellon', 'Daimiel') 


--5 

select * from Clientes
select * from Representantes

select r.Num_Empl ,c.Empresa, c.Rep_Cli, c.Limite_Credito
from Clientes as c
inner join Representantes as r
on r.Num_Empl = c.Rep_Cli
order by Limite_Credito desc

--6

select * from Clientes
select * from Pedidos
select * from Representantes

select c.Empresa, r.Nombre, p.Cantidad
from clientes as c
inner join Pedidos as p
on c.Num_Cli = p.Cliente
inner join Representantes as r
on r.Num_Empl = p.Rep
where Cantidad > 3 

--7

select * from Oficinas
select * from Representantes

select r.Nombre ,o.Oficina, o.Ciudad, o.Region, r.Ventas
from Oficinas as o
inner join Representantes as r
on r.Num_Empl = o.Jef
where r.Ventas > 10000

--8

select * from Oficinas
select * from Representantes

select o.Oficina, r.Nombre, r.Oficina_Rep, o.Region
from Oficinas as o
inner join Representantes as r
on r.Num_Empl = o.Jef
group by  o.Oficina, r.Nombre, r.Oficina_Rep, o.Region
having count(*)>3


--9

select * from Productos
select * from Pedidos

select pe.Fab, pr.Id_producto,pr.Descripcion ,pr.Stock
from Productos as pr
inner join Pedidos as pe
on pr.Id_fab = pe.Fab and pr.Id_producto = pe.Producto
where pr.Stock <= 50

--10 

select * from Clientes
select * from Representantes
select * from Oficinas
select * from Pedidos

select c.Empresa, r.Nombre, r.Oficina_Rep, o.Oficina, o.Ciudad 
from Clientes as c
inner join Representantes as r
on r.Num_Empl = c.Rep_Cli
inner join Oficinas as o
on r.Num_Empl = o.Jef
inner join Pedidos as p
having count(Cantidad)>3
order by Empresa


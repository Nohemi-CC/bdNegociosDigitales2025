-- Consultas de agregado 
-- Nota: Solo devuelven un solo registro 
-- sum, avg, count, count(*), max y min

--Cuantos clientes tengo
select count(*) as 'Numero de clientes'
from Customers

--Cuantas regiones hay
select count(*)
from Customers
where Region is null

select count (distinct region) 
from Customers
where region is not null

select count(*) from Orders
select *from Orders
select count(ShipRegion) from orders

--Seleciona el precio mas bajo de los productos

select min(UnitPrice), max(UnitPrice),
avg(UnitsInStock)
from Products;

-- Seleccionar cuantos pedidos existen

select count(*) from Orders

--Calcula el total de dinero vendido 

select sum(UnitPrice * Quantity ) 
from [Order Details]

select sum(UnitPrice * Quantity - (UnitPrice * Quantity * Discount)) as Total 
from [Order Details]

--Calcula el total de unidades en stock de todos los productos

select sum(UnitsInStock) as 'Total de Stock'
from Products;


--Seleccionar el numero de productos por categoria

select CategoryID, count(*) as 'Numero de producto'
from Products
group by CategoryID

select Categories.CategoryName, count(*) as [Numero de Productos]
from Categories
inner join Products as p
on Categories.CategoryID = p.CategoryID
group by Categories.CategoryName

--Calcular el precio promedio de los productos por cada categoria

select categoryid, avg(UnitPrice) as 'Precio Promedio'
from Products
group by CategoryID

--Seleciona el numero de pedidos realizados por cada empleado 

select EmployeeID, count(*) as 'Numero de peddidos'
from Orders
group by EmployeeID

--Seleccionaar el numero de pedidos realizados por cada empleado por el ultimo trimestre de 1996

Select EmployeeID, count(*) as 'Numero de pedidos'
from Orders
where OrderDate between '1996-10-01' and '1996-12-31'
group by EmployeeID

--Seleccionar la suma total de unidades vendidas por producto

select top 5 ProductID, sum(Quantity) as 'Numero de Productos vendidos'
from [Order Details]
group by ProductID
order by 2 desc

select OrderID, ProductID ,sum(Quantity) as 'Numero de Productos vendidos'
from [Order Details]
group by OrderID, ProductID
order by 2 desc

--Seleccionar el numero de productos por categoria, pero solo aquellos que tenfan mas de 10 productos 

--Paso 1
Select * from Products
--select distinct CategoryID from  Products

--Paso 2
Select CategoryID, UnitsInStock from Products 
where CategoryID in (2,4,8)
order by CategoryID

--Paso 3 
select CategoryID, sum(UnitsInStock) from Products

--Paso 4
Select CategoryID, sum (UnitsInStock)
from Products
where CategoryID in (2,4,8)
group by CategoryID
having count(*)>10
order by CategoryID

--Listar las ordenes agrupadas por empleados, pero que solo muestre aquellos que hayan gestionado mas de 10 pedidos 

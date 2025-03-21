--Join (Juntar) INNER (Default), LEFT (), RIGHT (), CROSS (), FULL ()

use Northwind

--Seleccionar todas las categorias y productos

Select * from
categories
inner join
Products
on categories.CategoryID = products.CategoryID;

Select categories.CategoryID, categoryName, ProductName, UnitsInStock, UnitPrice from
categories
inner join
Products
on categories.CategoryID = products.CategoryID;

Select c.CategoryID as [Numero de Categorias], categoryName as 'Nombre Categoria',
ProductName as 'Nombre de Producto', UnitsInStock as 'Existencias', UnitPrice as Precio from
categories as c
inner join
Products as p
on c.CategoryID = p.CategoryID;

--Seleccionar los productos de la categoria beverages y condiments donde la existencia este entre 18 y 30

Select*from 
Products as p
inner join Categories as ca
on p.CategoryID = ca.CategoryID
where ca.CategoryName in ('beverages', 'condiments')
and p.UnitsInStock >=18 and p.UnitsInStock <=30

select * from Products as p
join Categories as ca
on p.CategoryID = ca.CategoryID
where ca.CategoryName in ('Beverages','condiments')
and p.UnitsInStock between 18 and 30;

--Seleccionar los productos y sus importes realizados de marzo a junio de 1996, mostrando la fecha de la orden, el id del producto y el importe

select o.OrderID, o.OrderDate, od.ProductID,
(od.UnitPrice * od.Quantity) as importe 
from Orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
where o.OrderDate between '1996-07-01' and '1996-10-30'

select getdate()

--Mostrar el importe total de ventas de la consulta anterior 

select concat('$', '' ,sum (od.Quantity * od.UnitPrice)) 
from Orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
where o.OrderDate between '1996-07-01' and '1996-10-30'

---Consultas Basicas con inner join

--1. Obtener los nombres de los clientes y los paises a los que se enviaron sus pedidos

Select c.CompanyName, o.ShipCountry
from Orders as O
inner join Customers as c
on c.CustomerID = o.CustomerID

Select c.CompanyName as 'Nombre del Cliente', o.ShipCountry,
from Orders as O
inner join Customers as c
on c.CustomerID = o.CustomerID
order by o.ShipCountry desc

--2. Obtener los productos y sus respectivos proveedores

select p.ProductName as 'Nombre producto', s.CompanyName as 'Nombre del Proveedor'
from Products as p 
inner join Suppliers as s 
on p.SupplierID =s.SupplierID

--3. Obtener los pedidos y los empleados que los gestionaron

select o.OrderID, concat (e.Title, ' - ' , e.FirstName, ' ', e.LastName) as 'Nombre' from Orders as o 
inner join Employees as e 
on o.EmployeeID = e.EmployeeID

--4. Listar los productos junto con sus precios y la categoria a la que pertenecen

Select p.ProductName as 'Nombre del Producto', p.UnitPrice as 'Precio' , c.CategoryName as 'Nombre del producto', c.CategoryName as 'Nombre de la categoria'
from Products as P
inner join Categories as c
on c.CategoryID = p.CategoryID


--5. Obtener el nombre del cliente, el numero de orden y la fecha de orden 

select c.CompanyName as 'Cliente', o.OrderID as 'Numero de orden', o.OrderDate as 'Fecha de orden' 
from Customers as c
inner join Orders as o
on o.CustomerID =  o.CustomerID  

--6. Listar las ordenes mostrando el numero de orden, el nombre del producto y la cantidad que se vendio

select od.OrderID as 'Numero de Orden', p.ProductName as 'Nombre del Producto', od.Quantity as 'Cantidad Vendida'
from [Order Details] as od
inner join Products as p
on od.ProductID = p.ProductID


select top 5 od.OrderID as 'Numero de Orden', p.ProductName as 'Nombre del Producto', od.Quantity as 'Cantidad Vendida'
from [Order Details] as od
inner join Products as p
on od.ProductID = p.ProductID
order by od.Quantity desc



select od.OrderID as 'Numero de Orden',
count (*) as 'Cantidad de Productos vendidos'
from [Order Details] as od
inner join Products as p
on od.ProductID = p.ProductID
group by od.OrderID
order by od.OrderID desc

select * from 
[Order Details] as od
where od.OrderID = 11077

--7. Obtener los empleados y sus respectivos jefes
select concat (e1.FirstName, ' ', e1.LastName) as [Empleado],
concat (j1.FirstName, ' ', j1.LastName) as [Jefe]
from Employees as e1
inner join Employees as j1
on e1.Re

select FirstName, ReportsTo
from Employees

--8. Listar los pedidos y el nombre de la empresa de transporte utilizada
select o.OrderID, s.CompanyName as [Transportista]
from Orders as o
inner join Shippers as s
on o.ShipVia = s.ShipperID

--Consultas inner join Intermedias

--9. Obtener la cantidad total de productos vendidos por categoria

select sum(Quantity) from [Order Details]

select c.CategoryName as 'Nombre Categoria', sum (Quantity) as 'Productos Vendidos' 
from Categories as c 
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName
order by c.CategoryName


--10 Obtener el total de ventas por empleado

Select concat (e.FirstName, ' ' , e.LastName) as Nombre, 
sum ((od.Quantity * od.UnitPrice )-(od.Quantity * od.UnitPrice) * od.Discount)
as Total
from Orders as o 
inner join Employees as e
on o.EmployeeID = e.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
group by e.FirstName, e.LastName

--11. Listar los clientes y la cantidad de pedidos que han realizado

Select c.CompanyName as Cliente,
count(*) as 'numero de ordenes'
from Customers as c 
inner join Orders as o
on c.CustomerID = o.CustomerID
group by c.CompanyName
order by count(*) desc

--12. Obtener los empleadosque han gestionado pedidos enviados a alemania

Select concat (e.FirstName, '', e.LastName) as [Nombre]
from Employees as e
inner join orders as o
on e.EmployeeID =o.EmployeeID
where o.ShipCountry ='Germany'

--13. Listar los productos junto con el nombre del proovedor y el pais de origen

select p.ProductName as [Nombre Producto],
s.CompanyName as [Proveedor],
s.Country as [Pais de origen]
from Products as p
inner join Suppliers as s
on p.SupplierID = p.SupplierID
order by 1 asc

--14. Obtener los pedidos agrupados por pais de envio

select o.ShipCountry as [Pais de Envio],
count (o.OrderID) as [numero de ordenes]
from Orders as o
inner join
group by

--15. Obtener los empleados y la cantidad de territorios en los que trabajan

select concat(e.FirstName, ' ', e.LastName) as [Nombre],
count (et.TerritoryID)
from Employees as e
inner join EmployeeTerritories as et
on e.EmployeeID = et.EmployeeID
group by e.FirstName, e.LastName

--16. Listar las categorias y las cantidad de productos que contienen
select * from Products
select * from Categories

 select c.CategoryName as 'Nombre de la Categoria', COUNT (ProductID) as 'Cantidad de Productos'
 from Categories as c
 inner join Products as p
 on c.CategoryID = p.CategoryID
 group by CategoryName

 --17. Obtener la cantidad de productos vendidos por proveedor 

 Select * from Products
 select * from [Order Details]
 select * from Suppliers

 Select s.CompanyName as 'Proveedor', sum (od.Quantity) as 'Total de productos vendidos'
 from Suppliers as s
 inner join Products as p
 on s.SupplierID = p.SupplierID
 inner join [Order Details] as od
 on p.ProductID = od.ProductID
 group by s.CompanyName

--18. Obtener la cantidad de pedidos por cada empresa de transporte

select S.CompanyName,count(*) as [Total de pedidos] 
from Orders as o
inner join Shippers as s
on o.ShipVia = s.ShipperID
group by s.CompanyName

Select * from Orders

Select count(*) from Orders

Select count(OrderID) from Orders

Select count(ShipRegion) from Orders

--19. Obtener los clientes que han realizado pedidos con mas de un producto

select c.CompanyName, count(distinct ProductID) as 'Numero Productos' 
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
group by c.CompanyName
order by 2 desc 

--20. Listas los empleados con la cantidad total de pedidos que ha gestionado, y a que clientes les han vendido, agrupandolos por nombre completo
-- y dentro de este nombre por cliente, ordenandolos por la cantidad de mayor de pedidos

select concat(e.FirstName, '', e.LastName) as Nombre,
count (OrderID) as 'Numero de Ordenes' 
from Orders as o
inner join Employees as e
on o.EmployeeID = e.EmployeeID
group by  e.FirstName, e.LastName 
order by [Nombre] asc



select concat(e.FirstName, '', e.LastName) as Nombre, c.CompanyName as Cliente,
count (OrderID) as 'Numero de Ordenes' 
from Orders as o
inner join Employees as e
on o.EmployeeID = e.EmployeeID
inner join Customers as c
on o.CustomerID = c.CustomerID
group by  e.FirstName, e.LastName, c.CompanyName
order by [Nombre] asc, [Cliente]

--21. Listar las categorias con el total de ingresos generados por sus productos

select * from Categories
select * from Products
select * from [Order Details]

select c.CategoryName as 'Nombre Categoria', p.ProductName as 'Nombre de Productos',
sum (od.UnitPrice * od.Quantity) as 'Total de ingresos'
from Categories as c
inner join products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od 
on p.ProductID = od.ProductID
group by c.CategoryName, p.ProductName

--22. Listar los clientes en el total de $ gastado en pedido

select * from Customers
select * from Orders
select * from [Order Details]

select c.CompanyName as 'Cliente', o.OrderID as 'Id de Orden',
sum (od.Quantity * UnitPrice) as 'Total de gasto en pedidos '
from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID 
inner join [Order Details] as od
on o.OrderID = od.OrderID
group by c.CompanyName, o.OrderID

--23. Listar los pedidos realizados entre el 1 de Enero de 1997 y el 30 de Junio de 1997 y mostrar el total de dinero

Select * from Orders 
select * from [Order Details]

select o.OrderDate, sum (od.Quantity) as 'Total de dinero'
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
where o.OrderDate
between '1997-01-01' and '1997-06-30'
group by o.OrderDate


--24.Listar lo productos con las categorias beverages, seafood y confetions 

select * from Categories
Select * from Products

select c.CategoryName as 'Nombre de la Categoria', p.ProductName as 'Nombre del producto'
from Categories as c
inner join products as p
on c.CategoryID = p.CategoryID
where c.CategoryName in ('beverages', 'Seafood', 'Confections')


--25. Listar los clientes ubicados en alemania y que hayan realizado pedidos antes de 1 de Enero de 1997

select * from Customers 
select * from Orders

select c.Country as 'Ciudad', o.OrderDate as 'Dia de orden'
from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
where o.OrderDate< '1997-01-01' and c.Country = 'Germany'

--26. Listar los clientes que han realizado pedidos con un total entre 500 y 2000 
select * from Customers
select * from Orders
select * from [Order Details]


select c.CompanyName as 'Cliente', sum (od.Quantity * od.UnitPrice) as 'Total'
from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
group by c.CompanyName
having sum(od.Quantity * od.UnitPrice) between 500 and 2000

--Left join, right join, full join y cross join




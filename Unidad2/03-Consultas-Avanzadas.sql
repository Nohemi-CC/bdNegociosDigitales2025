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



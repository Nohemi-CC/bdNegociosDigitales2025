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
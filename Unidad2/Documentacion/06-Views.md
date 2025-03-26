# Views

- Sirve oara encapsular una vista muy grande

**Sintaxis**
```sql
/*create view nombreVista
As
select columnas 
from tabla
where condicion
*/
```

- alter  -> para cambiar datos del campo
-  drop view -> Para borrar-
- create or alter -> para borrar y cambiar 

use Northwind;

```sql
go

create view VistaCategoriasTodas
as
select CategoryID, CategoryName, [Description], Picture
from Categories
Go

select * from VistaCategoriasTodas
where CategoryName = 'Beverages'
```

## Crear una vista que permita visualizar solamente clientes de mexico y brazil
```sql
go

create or alter view VistaClientesLatinos
as
select  CompanyName, Country, City
from Customers
where country = 'Mexico' or country = 'Brazil' 
go

select CompanyName	as Cliente, city as Ciudad, Country as pais
from VistaClientesLatinos
where city = 'Sao Paulo'
order by 2 desc
```

## Crear una vista que contenga los datos de todas las ordenes, los productos, categorias de productos, en la orden, calcular el importe

```sql
go
create or alter view [dbo]. [vistaOrdenesCompra]
as
Select o.OrderID as 'Numero de Orden', 
o.OrderDate as 'Fecha de Orden', 
o.RequiredDate as 'Fecha de Requisicion',
CONCAT(e.FirstName, ' ', e.LastName) as 'Nombre de Empleado', 
cu.CompanyName as 'Nombre del Cliente', 
p.ProductName as 'Nombre del Producto',
c.CategoryName as 'Nombre de la Categoria', 
od.UnitPrice as 'Precio de Venta', 
od.Quantity as 'Cantidad de Venta', 
(od.Quantity * od.UnitPrice) as 'Importe'
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on p.ProductID = od.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as cu
on o.CustomerID = cu.CustomerID
inner join Employees as e
on o.EmployeeID = e.EmployeeID

go
```

## Cuenta cuentas ordenes unicas existen en la base de datos usando la vista
```sql
select count(distinct [Numero de Orden]) as [numero de Ordenes]
from vistaOrdenesCompra
```

## Suma el total de todas las ventas registradas en la base de datos
```sql
select sum([Cantidad de Venta] * [Precio de Venta]) as [Importe Total]
from vistaOrdenesCompra
go
```
```sql
select sum(Importe) as [Importe Total]
from vistaOrdenesCompra
where year([Fecha de Orden]) between '1995' and '1996'
go
```
```sql

create or alter view vistaOrdenes_1995_1996
as
select [Nombre del Cliente] as [Nombre Cliente],
sum(Importe) as [Importe Total]
from vistaOrdenesCompra
where year([Fecha de Orden]) 
between '1995' and '1996'
group by [Nombre del CLiente]
having count(*)>2;
go

create schema rh

create table rh.tablarh (
	id int primary key,
	nombrre nvarchar (50)
)
```

## Vista Horizontal
```sql
create or alter view rh.ViewCategoriasProductos
as
select c.CategoryID, CategoryName, p.ProductID, p.ProductName
from
Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID;
go

select * from rh.ViewCategoriasProductos
```
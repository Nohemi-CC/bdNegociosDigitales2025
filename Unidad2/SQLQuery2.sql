-- 1. Productos con categor�a 1, 3 o 5

select ProductID as 'Numero del Producto',
ProductName as 'Nombre Producto', 
CategoryID as 'Numero de categoria',
UnitPrice as Precio, 
UnitsInStock as Existencia 
from Products
where CategoryID in (1, 3, 5);


use Northwind;


--2. Clientes de M�xico, Brasil o Argentina = 17 DATOS

Select CustomerID, 
ContactName,
CompanyName,
City,
Country,
Phone 
from Customers
where Country in ('Mexico', 'Brazil', 'Argentina');

--3. Pedidos enviados por los transportistas 1, 2 o 3 y con flete mayor a 50 = 360 DATOS

Select OrderID, 
OrderDate, 
ShipVia,
Freight, 
ShipCountry 
from Orders 
where ShipVia in (1, 2, 3) and Freight > 50;

--4. Empleados que trabajan en Londres, Seattle o Buenos Aires = 6 DATOS

Select EmployeeID, 
CONCAT(FirstName, ' ' , LastName) as 'Nombre Completo',
Title,
City,
Country,
ReportsTo 
from Employees
where City in ('London', 'Seattle', 'Buenos Aires');

--5. Pedidos de clientes en Francia o Alemania, pero con un flete menor a 100 = 154 DATOS

Select OrderID, CustomerID, OrderDate, Freight, ShipCountry from Orders where ShipCountry in ('France', 'Germany') and Freight < 100;

--6. Productos con categor�a 2, 4 o 6 y que NO est�n descontinuados = 23 DATOS

Select ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock, Discontinued from Products where CategoryID in (2, 4, 6) and Discontinued = 0;

--7. Clientes que NO son de Alemania, Reino Unido ni Canad� = 73 DATOS

Select CustomerID, CompanyName, ContactName, Country from Customers where NOT Country in ('Germany', 'UK', 'Cananda');

--8. Pedidos enviados por transportistas 2 o 3, pero que NO sean a USA ni Canad� = 464 DATOS

Select OrderID, CustomerID, OrderDate, ShipVia, ShipCountry from Orders where ShipVia in (2, 3) and not ShipCountry in ('USA', 'Canada');

--9. Empleados que trabajan en 'London' o 'Seattle' y fueron contratados despu�s de 1995 -- Todos los empleados fueron contratados antes de 1995

Select EmployeeID, CONCAT(FirstName, ' ' , LastName) as 'Nombre Completo', Title, HireDate, City, Country from Employees where City in ('London', 'Seattle') and YEAR(HireDate) > 1995;
select * from Employees;

--10. Productos de categor�as 1, 3 o 5 con stock mayor a 50 y que NO est�n descontinuados

Select ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock, Discontinued from Products where CategoryID in (1, 3, 5) and UnitsInStock > 50 and Discontinued = 0;


-- Clausula Between (Siempre va en el where)
-- Between valor Inicial and valorFinal ----
-- Mostrar los productos con precio entre 10 y 50 

select * from Products
where UnitPrice >= 10 and UnitPrice<= 50;

select * from Products
where UnitPrice between 10 and 50

-- Seleccionar todos los pedidos realizados entre el 1 de enero y el 30 de junio de 1997

select * from Orders 
where OrderDate >= '1997-01-01' and
OrderDate <= '1997-06-30';

select * from Orders
where OrderDate between '1997-01-01' and '1997-06-30';

--Seleccionar todos los empleados contradatos entre 1992 y 1994 que trabajan en Londres

select * from Employees
where year (HireDate) between 1992 and 1994 and City = 'London';

--Pedidos con flete (freigh) entre 50 y 200 enviados a alemania y a francia

select OrderID as 'NUmero de Orden',
OrderDate as 'Fecha de Orden',
RequiredDate as 'Fecha de Entrega',
Freight as 'Peso',
ShipCountry as 'Pais de Entrega'
from Orders Where Freight between 50 and 200 and ShipCountry in ('France', 'Germany');

--Seleccionar todos los productos que tengan un precio entre 5 y 20 dolares o que sean de la categoria 1,2 o 3

select UnitPrice as 'Precio',
ProductName as 'Nombre del Producto',
CategoryID as 'Numero de Categoria'
from Products
where UnitPrice between 5 and 20 or CategoryID IN(1, 2, 3);


--Empleados con numero de trabajador entre 3 y 7 que no trabajan en londres ni Seattle

Select EmployeeID as 'Numero de empleado ',
concat (FirstName, '' , LastName) as 'Nombre Completo',
city as 'ciudad'
from Employees
where EmployeeID between 3 and 7 and (city <> 'London' and city <> 'City');


Select EmployeeID as 'Numero de empleado ',
concat (FirstName, '' , LastName) as 'Nombre Completo',
city as 'ciudad'
from Employees
where EmployeeID between 3 and 7
and NOT city in ('London', 'seattle');

--Clausula Like
--Patrones:
	-- 1) % (Porcentaje) -> Este representa cero o mas caracteres en el patron de busqueda 
	-- 2) _ (Guion Bajo)-> Representa exactamente un caracter en el patron de busqueda
	-- 3)[] (Corchetes) -> Se utiliza para definir un conjunto de caracteres, buscando cualquiera de ellos en la posicion especifica
	-- 4)[^] (Acento Circunflejo) -> Se utiliza para buscar caracteres que no estan dentro del conjunto especifico 


	--Buscar los productos que comienzan con C
	Select * from Products
	where ProductName like 'C%';

	Select * from Products
	where ProductName like 'Cha%' and UnitPrice=18;

--Buscar todos los productos que terminen con e

select * from Products
where ProductName like  '%e'

-- Seleccionar todos los clientes cuyo nombre de empresa contiene "co" en cualquier parte

select * from Customers 
where CompanyName like '%co%'

-- Seleccionar los empleados cuyo nombre comience con "A" y tenga exactamente 5 caracteres

select FirstName, LastName
from Employees
where FirstName like 'A_____'

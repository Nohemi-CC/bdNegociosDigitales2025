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

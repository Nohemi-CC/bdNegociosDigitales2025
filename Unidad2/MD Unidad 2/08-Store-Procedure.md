# Store Procedure

- Crear un store procedure para seleccionar todos los clientes
```sql
create or alter procedure spu_mostrar_clientes
as 
begin
	Select * from Customers;
end;
Go

exec spu_spu_mostrar_clientes

```

- Crear un sp que muestre los clientes por pais
```sql
Create or alter proc spu_customersporpais
@pais nvarchar(15) 
as
begin
 select * from Customers
 where Country = @pais;
end;


exec spu_customersporpais 'Germany'
```

```sql
Create or alter proc spu_customersporpais2
@pais1 nvarchar(15), --Parametro de entrada
@pais2 nvarchar(15) --Parametro de entrada
as
begin
 select * from Customers
 where Country in (@pais1, @pais2);
end;

---

DECLARE @P1 nvarchar(15) = 'Spain'
DECLARE @P2 nvarchar(15) = 'Germany'

exec spu_customersporpais2 @P1, @P2;
go
```

- Generar un reporte que permita visualizar los datos de compra de un determinado cliente, en un rango de fechas
- Mostrando el monto total de compras por producto, mediante un sp.

```sql
Create or alter proc spu_imforme_ventas_clientes
@nombre nvarchar(40) = 'Berglunds snabbköp', 
@fechaInicial DateTime,
@fechaFinal DateTime
as
begin
Select [Nombre del Producto],[Nombre del Cliente], SUM(Importe) as [Monto Total] 
from vistaOrdenesCompra
where [Nombre del Cliente] = @nombre
and [Fecha de Orden] between @fechaInicial and @fechaFinal
group by [Nombre del Producto], [Nombre del Cliente]
end;
go
```

*Ejecuciones*

```sql
--Ejecucion de un store con parametros de entrada
--Select getdate()
exec spu_imforme_ventas_clientes 
								'Berglunds snabbköp',
								'1996-01-01', '1997-01-01'

--Ejecucion de un store procedure con parametros en diferente posicion

exec spu_imforme_ventas_clientes @fechaFinal = '1997-01-01',
								@nombre = 'Berglunds snabbköp',
								@fechaInicial= '1996-07-04'

--Ejecucion de un store procedure con parametros de entrada con un campo que tiene un valor por default

exec spu_imforme_ventas_clientes @fechaInicial= '1996-07-04',
								 @fechaFinal = '1997-01-01'
```

-   Store Procedure con parametros de salida
```sql
create or alter proc spu_Obtener_Numero_Clientes
@Customerid nchar(5), --Parametro de entrada
@totalCustomers int output --parametro de salida
as
begin
	select @totalCustomers = count(*) from customers
	where CustomerID = @customerid;
end;
	go

	
declare @numero int;

exec spu_Obtener_Numero_Clientes @Customerid = 'ANATR',
								@totalCustomers = @numero output;
print @numero;
go
```

- Crear un store procedure que permita saber si un alumno aprobo o reprobo
```sql
create or alter proc spu_comparar_calificacion
@calif decimal(10,2) --Parametro de entrada
as
begin
		if @calif>=0 and @calif<=10
		begin
				if @calif >=8
				print 'La calificacion es aprobatoria'
				else
				print 'La calificacion es reprobatoria'
	end;
	else
		print 'calificacion no valida'
		end;
	go

exec spu_comparar_calificacion @calif = 11
```

- Crear un store procedure que permita verificar si un cliente existe antes de devolver su informacion

```sql 
go
create or alter proc spu_obtener_cliente_si_existe
@numeroCliente nchar(5)
as
begin
	if exists (select 1 from Customers where CustomerID = @numeroCliente)
	select * from Customers where CustomerID = @numeroCliente;
else
	print 'El cliente no existe'	
end;
go 

Select * from Customers 
select 1 from Customers where CustomerID = 'AROUT'

exec spu_obtener_cliente_si_existe @numeroCliente = 'arout'
```

- Crear un store procedure que permita insertar un cliente, pero se debe verificar primero que no exista
```sql

go
create or alter proc spu_agregar_cliente
	@id nchar(5),
	@nombre nvarchar(40),
	@city nvarchar(15) = 'San Miguel'
as
begin
	if exists (select 1 from Customers where CustomerID = @id)
	begin
		print ('El cliente ya existe')
		return 1
	end

	insert into Customers (CustomerID, CompanyName)
	values (@id, @nombre);
	print ('Cliente insertaado exitosamente');
	return 0;

	end;
	go

exec spu_agregar_cliente 'AlFKI', 'Patito de Hule'
exec spu_agregar_cliente 'AIFKI', 'Patito de Hule'
```

```sql
go
create or alter proc spu_agregar_cliente_try_catch
	@id nchar(5),
	@nombre nvarchar(40),
	@city nvarchar(15) = 'San Miguel'
as
begin
	begin try
		insert into Customers (CustomerID, CompanyName)
		values (@id, @nombre);
		print ('Cliente insertaado exitosamente');
	end try
	begin catch
		print('El cliente ya existe')
	end catch
end;
go
	
exec spu_agregar_cliente 'ALFKC', 'Muneca Vieja'
```
- Manejo de ciclos en store procedures
- Imprimir el numero de veces que indique el usuario

```sql
go
create or alter proc spu_Imprimir
@numero int
as
begin
	if @numero<=0
	begin
		print('El numero no puede ser 0 o negativo')
		return
	end

	declare @i int
	SET @i = 1
	while(@i <=@numero)
	begin
	print concat( 'Numero' , @i)
	set @i = @i + 1
	end

end;

go
exec spu_Imprimir 10
```
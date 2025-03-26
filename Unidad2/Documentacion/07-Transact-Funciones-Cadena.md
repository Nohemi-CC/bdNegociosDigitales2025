# Transact Funciones Cadena 

- Funciones de cadena

- Las funciones de cadena  permiten manipular tipos de datos como:
- varchar, nvarchar, char, nchar

- Funcion Lem -> Devuelve la longitud de una cadena 

- Declaracion de una variable

```sql
DECLARE @numero int;
SET @numero = 10;
print @numero

DECLARE @Texto varchar(50) = 'Hola, Mundo!';
```


## Obtener el tamano de la cadena almacenada en la variable Texto
```sql
Select len(@Texto) as Longitud 
```

## Funcion Left -  Extrae un determinado numero de caracteres desde el inicio de la cadena 
```sql
select LEFT(@Texto, 4) as Inicio
```

## Right -> Extrae un determinado numero de caracteres del final de la cadena 
```sql
select RIGHT(@Texto, 6) as Final
```

## SubString -> Extrae una parte de la cadena, donde el segundo parametro, es la posicion inicial y el tercer parametro el recorido
```sql
DECLARE @Texto2 varchar(50) = 'Hola, Mundo!';

select SUBSTRING(@Texto2, 7,5) as Medio
```

## Replace -> Remplaza una subcaadena por otra, primeor cadena despues la cadena que voy a remplazar y su reemplazo
```sql
-- REPLACE (string_expression , string_pattern, string_replacement)

DECLARE @Texto3 varchar(50) = 'Hola, Mundo!';

select REPLACE (@Texto3, 'Mundo', 'Amigo')
```

## CharIndex - CHARINDEX ( expressionToFind , expressionToSearch [ , start_location ] )

```sql
select CHARINDEX('Mundo', @Texto3)
```

## UPPER -> Convierte una cadena en Mayusculas - UPPER ( character_expression )
```sql
select UPPER(@Texto3) as Mayusculas

select concat(
			LEFT(@Texto3,5),
			'',
			UPPER(SUBSTRING(@Texto3, 7,5)),
			RIGHT(@Texto3, 1)
			) as TextoNuevo

Update Customers
set CompanyName = Upper(CompanyName)
where country in ('Mexico', 'Germany')

select * from Customers
go
```
## Trim ->Quita espacios en blanco de una cadena
- SELECT TRIM( '     test    ') AS Result;
```sql
DECLARE @Texto3 varchar(50) = 'Hola, Mundo!';
SELECT TRIM(@Texto3) AS Result;


select companyName, len(CompanyName) as 'Numero de Caracteres',
LEFT (CompanyName, 4) as Inicio,
RIGHT (CompanyName, 6) as Final,
SUBSTRING(CompanyName,7,4) as 'SubCadena'
from Customers
```
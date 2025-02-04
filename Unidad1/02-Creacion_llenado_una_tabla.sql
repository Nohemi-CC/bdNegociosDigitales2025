--Creacion de la base de datos tienda1

create database tienda1;

--Utilzar una base de datos

use tienda1;

--SQL - LDD (LENGUAJE DE DEFINICION DE DATOS)
--Crear tabla de categoria 

create table categoria (
categoriaID int NOT NULL, 
nombrecatego varchar (20) NOT NULL
constraint pk_categoria
primary key (categoriaID),
constraint unico_nombre
unique (nombrecatego)
);

--SQL -LMD (LENGUAJE DE MANICPULACION DE DATOS)

insert into categoria
values (1, 'carnes frias');

insert into categoria (categoriaID, nombrecatego)
values (2, 'linea blanca');

insert into categoria (nombrecatego, categoriaID)
values ('vinos y licores', 3);

insert into categoria 
values (4, 'ropa'), 
(5, 'dulces'),
(6, 'lacteos');

insert into categoria (nombrecatego, categoriaID)
values ('panaderia', 7),
('zapateria', 8),
('jugueteria', 9);

insert into categoria 
values (5, 'farmacia');

select * from categoria order by categoriaID;

create table producto1 (
productoID int NOT NULL,
nombreProducto varchar (20) NOT NULL,
descripcion varchar (80),
precio money NOT NULL,
existencia int NOT NULL,
categoriaID int NULL,
constraint pk_producto1
primary key (productoID),
constraint unico_nombreProducto
unique (nombreProducto),
constraint chk_precio 
check (precio > 0.0 and precio <= 100),
constraint chk_existencia
check (existencia > 0 and existencia <=200),
constraint fk_categoria_producto1 
foreign key (categoriaID)
references categoria (categoriaID)
);
alter table producto1 drop constraint chk_precio;
alter table producto1 add constraint chk_precio check (precio > 0.0 and precio <=1000);

insert into producto1
values (1, 'Miguelito', 'Dulce para la lombriz', 34.5, 45, 5);

insert into producto1
values (2, 'Tupsi Pop', 'Dulce resano para el diente', 1000, 45, 5);

insert into	producto1
values (3, 'Plancha', 'Plancha facil el suit', 256.3, 45, 2);

create table cliente (
clienteID int NOT NULL identity (1,1),
codigoCliente varchar (15) Not null,
nombre varchar (30) NOT NULL,
direccion varchar (100) NOT NULL,
telefono varchar (19),
constraint pk_cliente 
primary key (clienteID),
constraint unico_codigoCliente
unique (codigoCliente)
);

create table detalleOrden (
ordenfk int not null,
productofk int not null,
precioCompra money not null,
cantidad int not null,
constraint pk_detalleOrden
primary key (ordenfk, productofk),
constraint chk_precioCompra
check (precioCompra > 0.0 and precioCompra < 20000),
constraint chk_cantidad 
check (cantidad > 0),
Constraint fk_detalleOrden_producto1
foreign key (productofk)
references producto1 (productoID)
);

create table ordenCompra (
ordenID int NOT NULL identity (1,1),
fechaCompra date NOT NULL,
clientefk int NOT NULL,
constraint pk_ordenCompra
primary key (ordenID),
constraint fk_ordenCompra_cliente
foreign key (clientefk)
references cliente (clienteID)
);

Alter table detalleOrden 
Add constraint fk_detalleOrden_ordenCompra
foreign key (ordenfk)
references ordenCompra (ordenID);
CREATE DATABASE ProyectoBD9no
USE ProyectoBD9no

select*from tabla_clientes
select*from tabla_direccion

--Creacion llave primaria tabla_clientes
alter table tabla_clientes
add Id int primary key identity (1,1)

--Creacion llave primaria tabla_direcciones
alter table tabla_direccion
add Id int primary key identity (1,1)

--Creacion de llave foranea en tabla_direcciones
alter table tabla_direccion
add CONSTRAINT fk_Id_clientes FOREIGN KEY (Id_clientes) REFERENCES tabla_clientes (Id) 


-- Creamos la tabla Productos

CREATE TABLE Productos 
(
 Id int primary key identity (1,1),
 nombre varchar (30),
 descripcion varchar(MAX),
 precio decimal
)

--Creamos la tabla Proveedores

CREATE TABLE Proveedores
(
 Id int primary key identity (1,1),
 nombre varchar(35),
 telefono varchar(13),
 email varchar(40)
)

 -- Creamos la tabla servicios
 create table Servicios
(
id int identity primary key,
descripcion varchar(MAX),
precio int 
)

--Tabla Historial
Create table HistorialClteEliminado
(
  id INT IDENTITY (1,1) primary key,
  fecha date,
  accion varchar(100),
  usuario varchar(100)
)

--Relacion Muchos a muchos de proveedores y productos

  create table Productos_Proveedores
(
  primary key (id_Productos,id_Proveedor),
  id_Productos int foreign key references Productos(id), 
  id_Proveedor int foreign key references Proveedores (id)
)

--Relacion de muchos a muchos de servicios y productos
 create table Servicios_Productos
(
  primary key (id_Servicios,id_Productos),
  id_Servicios int foreign key references Servicios(id), 
  id_Productos int foreign key references Productos (id)
)

 create table Clientes_Servicios
(
  primary key (id_Clientes,id_Servicios),
  id_Clientes int foreign key references tabla_clientes(id), 
  id_Servicios int foreign key references Servicios (id)
)
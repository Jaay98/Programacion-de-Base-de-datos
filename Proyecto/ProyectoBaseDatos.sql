CREATE DATABASE ProyectoBaseDatos
use ProyectoBaseDatos

-- Insertamos datos de los csv tabla clientes
select*from tabla_clientes

alter table tabla_clientes
add Id int primary key identity (1,1)

-/*ELIMINANDO ID CLIENTES
ALTER TABLE tabla_clientes
DROP COLUMN Id*/-
--Agregamos campo de redes sociales
alter table tabla_clientes
add  Red_Social varchar(35)




insert into tabla_clientes (Apellido_Paterno,Apellido_Materno,Nombre_s,Telefono,Correo) values ('ALVAREZ','YANEZ','JOSE ALONSO','6645484871','JOSE.ALVAREZ@TECTIJUANA.EDU.MX')


-- Insertamos datos de los csv tabla direcciones

select*from tabla_direccion

alter table tabla_direccion
add Id int primary key identity (1,1)

-/*ALTER TABLE tabla_direccion
DROP COLUMN Id*/-
--Agregamos llave foranea de tabla_direcciones
alter table tabla_direccion
add CONSTRAINT fk_Id FOREIGN KEY (Id) REFERENCES tabla_clientes (Id) 

INSERT INTO tabla_direccion (Calle_y_Numero,Colonia,Municipio_Ciudad,Estado,CP) values ('Padre Kino 94','La Gloria','Tijuana','Baja California',22675)


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

--Relacion Muchos a muchos de proveedores y productos

  create table Productos_Proveedores
(
  primary key (id_Productos,id_Proveedor),
  id_Productos int foreign key references Productos(id), 
  id_Proveedor int foreign key references Proveedores (id)
)

 -- Creamos la tabla servicios
 create table Servicios
(
id int identity primary key,
descripcion varchar(MAX),
precio int 
)

--Relacion de muchos a muchos de servicios y productos
 create table Servicios_Productos
(
  primary key (id_Servicios,id_Productos),
  id_Servicios int foreign key references Servicios(id), 
  id_Productos int foreign key references Productos (id)
)

--Relacion de muchos a muchos de clientes y servicios

 create table Clientes_Servicios
(
  primary key (id_Clientes,id_Servicios),
  id_Clientes int foreign key references tabla_clientes(id), 
  id_Servicios int foreign key references Servicios (id)
)


--Vistas
 CREATE VIEW VWClientesDireccion
 AS SELECT Apellido_Paterno, Nombre_s, telefono , Calle_y_Numero , Municipio_Ciudad , Estado
 FROM tabla_clientes as E
 JOIN tabla_direccion as P 
 on E.Id = P.Id
 Go

 select*from VWClientesDireccion


 --procedimiento 
CREATE PROCEDURE ALTA_CLIENTE
AS
SELECT*FROM tabla_clientes


EXEC ALTA_CLIENTE


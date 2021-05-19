------VISTAS-------

use ProyectoBaseDatos

CREATE VIEW VWClientesDireccion
 AS SELECT Apellido_Paterno, Nombre_s, telefono , Calle_y_Numero , Municipio_Ciudad , Estado
 FROM tabla_clientes as E
 JOIN tabla_direccion as P 
 on E.Id = P.Id
 Go

 select*from VWClientesDireccion

CREATE VIEW VDATOSPROVEEDORES AS
SELECT Id, nombre, telefono
FROM tabla_Proveedores
WHERE Id < 3;

select*from VDATOSPROVEEDORES

CREATE VIEW VPRECIOS AS
SELECT Productos.Id, Productos.nombre, Productos.descripcion, Productos.precio, Servicios.id, Servicios.descripcion, Servicios.precio
FROM Productos, Servicios
WHERE Productos.precio and Servicios.precio < 200;

select*from VPRECIOS

 --procedimiento 
CREATE PROCEDURE ALTA_CLIENTE
AS
SELECT*FROM tabla_clientes


EXEC ALTA_CLIENTE


select*from tabla_direccion

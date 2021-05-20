------VISTAS-------

use ProyectoBD9no

CREATE VIEW VWClientesDireccion
 AS SELECT Apellido_Paterno, Nombre_s, telefono , Calle_y_Numero , Municipio_Ciudad , Estado
 FROM tabla_clientes as E
 JOIN tabla_direccion as P 
 on E.Id = P.Id
 Go

 select*from VWClientesDireccion

CREATE VIEW VDATOSPROVEEDORES AS
SELECT Id, nombre, telefono
FROM Proveedores
WHERE Id = 3;

select*from VDATOSPROVEEDORES



CREATE VIEW VPRECIOS AS
SELECT Productos.Id, Productos.nombre, Productos.descripcion, Productos.precio, Servicios.id, Servicios.descripcion, Servicios.precio
FROM Productos
INNER JOIN Servicios
ON Productos.precio = Servicios.precio;

select*from VPRECIOS




CREATE VIEW vapellidosprov AS
SELECT Proveedores.Id, Proveedores.nombre, Proveedores.telefono, Proveedores.email
FROM Proveedores
WHERE Proveedores.nombre = R;

 --PROCEDURES---
CREATE PROCEDURE ALTA_CLIENTE
AS
SELECT*FROM tabla_clientes


EXEC ALTA_CLIENTE


select*from tabla_direccion

SELECT Servicios.id, Servicios.descripcion, Servicios.precio, tabla_clientes.Id, tabla_clientes.Nombres
FROM Servicios
INNER JOIN tabla_clientes ON tabla_clientes.id = Clientes_Servicios.id_Servicios
INNER JOIN Clientes_Servicios ON Clientes_Servicios.Id_Clientes = tabla_clientes.id
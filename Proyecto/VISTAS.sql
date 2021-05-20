------VISTAS-------

use ProyectoBD9no

CREATE VIEW VWClientesDireccion
 AS SELECT Apellido_Paterno, Nombre_s, telefono , Calle_y_Numero , Municipio_Ciudad , Estado
 FROM tabla_clientes as E
 JOIN tabla_direccion as P 
 on E.Id = P.Id
 Go

 select*from VWClientesDireccion


 --PROCEDURES---
CREATE PROCEDURE ALTA_CLIENTE
AS
SELECT*FROM tabla_clientes


EXEC ALTA_CLIENTE


select*from tabla_direccion
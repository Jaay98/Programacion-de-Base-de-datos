-----------------------TRIGGER---------------------------
use ProyectoBD9no

CREATE TRIGGER Eliminar_Cliente
on tabla_clientes for DELETE 
as 
BEGIN

INSERT INTO HistorialClteEliminado (fecha,accion,usuario)
values (GETDATE(),'Se elimino cliente', USER)

DELETE FROM tabla_clientes WHERE tabla_clientes.Id = (SELECT Id FROM deleted)

END

DELETE from tabla_clientes where Id = 113
select*from HistorialClteEliminado
select*from tabla_direccion where Id = 113
select*from Clientes_Servicios where id_Clientes = 113
select*from tabla_clientes where Id = 113


CREATE TRIGGER Insertar_Cliente
on tabla_clientes for INSERT 
as 
BEGIN

INSERT INTO HistorialClteInsertado (fecha,accion,usuario)
values (GETDATE(),'Se inserto cliente', USER)

END

INSERT INTO tabla_clientes (Apellido_Paterno,Apellido_Materno,Nombres,Telefono,Correo) values ('ALVAREZ','YANEZ','JOSE ALONSO','6645484871','JOSE.ALVAREZ17@TECTIJUANA.EDU.MX')
SELECT*FROM HistorialClteInsertado

CREATE TRIGGER Eliminar_registros_Clientes ON tabla_clientes
FOR DELETE 
AS 
BEGIN 
  DELETE FROM tabla_direccion WHERE tabla_direccion.Id= (SELECT Id FROM deleted)
  DELETE FROM Clientes_Servicios WHERE Clientes_Servicios.id_Clientes= (SELECT Id FROM deleted)

END



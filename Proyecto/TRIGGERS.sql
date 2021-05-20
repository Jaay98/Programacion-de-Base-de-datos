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



CREATE TRIGGER Eliminar_registros_Clientes ON tabla_clientes
FOR DELETE 
AS 
BEGIN 
  DELETE FROM tabla_direccion WHERE tabla_direccion.Id= (SELECT Id FROM deleted)
  DELETE FROM Clientes_Servicios WHERE Clientes_Servicios.id_Clientes= (SELECT Id FROM deleted)

END


DELETE from tabla_clientes where Id = 113
drop trigger Eliminar_registros_Clientes
drop trigger Eliminar_Cliente

select*from HistorialClteEliminado
select*from tabla_direccion where Id = 113
select*from Clientes_Servicios where id_Clientes = 113
select*from tabla_clientes where Id = 113
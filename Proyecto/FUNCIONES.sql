-------------------FUNCIONES---------------------------------------------

use ProyectoBD9no


CREATE FUNCTION BuscarNombreClte (@nombre varchar(15))


--funciones de usuario programación en base de datos en sql server
CREATE FUNCTION BuscarNombreClte (@nombre varchar(15))

RETURNS  TABLE
AS
RETURN
( 
  select telefono, Apellido_Paterno, Apellido_Materno from tabla_clientes where Nombres = @nombre
);
GO


select*from  BuscarNombreclte ('JOSE')


CREATE FUNCTION  BUSCARPRECIO (@precio int)

returns table
as
return (
select id, descripcion, precio
from Servicios
where precio = @precio
);

select*from BUSCARPRECIO ('250')


CREATE FUNCTION  BRHISTORIALCTEELIMINADO (@id int)

returns table
as
return (
select id, accion, usuario, fecha
from HistorialClteEliminado
where id = @id 
);

select*from BRHISTORIALCTEELIMINADO ('1')
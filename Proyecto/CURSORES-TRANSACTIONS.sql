use ProyectoBD9no

----CURSORES


--Declaramos variables
DECLARE @nombre varchar(15) , @apellidoP varchar(15)
--Declaramos el Cursor
DECLARE CursorEJ CURSOR FOR
SELECT Apellido_Paterno , Nombres FROM tabla_clientes WHERE Apellido_Paterno = 'AGUIRRE' -- Consulta de los Datos

OPEN CursorEj -- Abrimos el Cursor

FETCH NEXT FROM CursorEj INTO @nombre, @apellidoP -- Leer la primera fila
WHILE @@FETCH_STATUS = 0 BEGIN 
PRINT @nombre + ' ' + @apellidoP -- Ejecutamos las operaciones
FETCH NEXT FROM CursorEj INTO @nombre, @apellidoP -- Leer la fila siguiente

END --Fin del while

CLOSE CursorEj
DEALLOCATE CursorEj

----------IF---------------------
declare @course_id int=4

if(@course_id = 4)
select*from tabla_direccion where Id = 4
else
select*from tabla_direccion where Id != 4

--------TRY CATCH
DECLARE @i int  
BEGIN  
BEGIN TRY  
SET @i = 2  
SET @i = @i / 0  
END TRY  
BEGIN CATCH  
SELECT ERROR_NUMBER() AS ErrorNumber  
    , ERROR_MESSAGE() AS ErrorMessage  
    , ERROR_LINE() AS ErrorLine;END CATCH  
END;

-------TRANSACTION
BEGIN TRAN
UPDATE tabla_clientes
SET    Apellido_Materno = 'FRANCIS', 
        Nombres = 'ALONSO'  WHERE Id=2
SELECT * FROM tabla_clientes WHERE Id=2
ROLLBACK TRAN 
SELECT * FROM tabla_clientes WHERE Id=2
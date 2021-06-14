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


-- Actualizar nombre y apellido materno
BEGIN TRAN
UPDATE tabla_clientes
SET    Apellido_Materno = 'FRANCIS', 
        Nombres = 'ALONSO'  WHERE Id=2
SELECT * FROM tabla_clientes WHERE Id=2
ROLLBACK TRAN 
SELECT * FROM tabla_clientes WHERE Id=2




--Insertar datos tabla_clientes



BEGIN TRAN
BEGIN TRY 

DECLARE  @Apellido_Paterno varchar(50) = 'QUIROZ',
    @Apellido_Materno varchar(50)= 'MONTES',
	@Nombres varchar(50)= 'YIM YETZHAEL',
	@Telefono varchar(50)= '6643625450',
	@Correo varchar(50)= 'yim.quiroz17@tectijuana.edu.mx'

INSERT INTO tabla_clientes (Apellido_Paterno,Apellido_Materno,Nombres,Telefono,Correo) values (@Apellido_Paterno,@Apellido_Materno,@Nombres,@Telefono,@Correo)
END TRY
BEGIN CATCH
select  ERROR_NUMBER() AS ErrorNumber  
    , ERROR_MESSAGE() AS ErrorMessage  
    , ERROR_LINE() AS ErrorLine,
	( 'error al insertar hacer rollback' );
END CATCH  

select*from tabla_clientes
ROLLBACK TRAN


BEGIN TRAN
BEGIN TRY 

DECLARE  @Calle_y_Numero varchar(100) = 'PADRE KINO',
    @Colonia varchar(50)= 'LA GLORIA',
	@Municipio_Ciudad varchar(50)= 'TIJUANA',
	@Estado varchar(50)= 'BAJA CALIFORNIA',
	@CP INT= 22657,
	@Id_clientes INT= 1

INSERT INTO tabla_direccion(Calle_y_Numero,Colonia,Municipio_Ciudad,Estado,CP,Id_clientes) values (@Calle_y_Numero,@Colonia,@Municipio_Ciudad,@Estado,@CP,@Id_clientes)
END TRY
BEGIN CATCH
select  ERROR_NUMBER() AS ErrorNumber  
    , ERROR_MESSAGE() AS ErrorMessage  
    , ERROR_LINE() AS ErrorLine,
	( 'error al insertar hacer rollback' );
END CATCH  

select*from tabla_direccion
ROLLBACK TRAN

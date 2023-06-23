-- Crear elementos del catalogo
USE [SSI_DB_SIAPI_REFESSATV2]
GO

-- Genero Clave Primaria de la tabla  -> catalogos_elementos
ALTER TABLE dbo.catalogos_elementos ADD id int IDENTITY(1,1)  NOT NULL PRIMARY KEY; 

-- Genero Unique -> Nombre -> tabla catalogos
ALTER TABLE dbo.catalogos ADD CONSTRAINT UC_nombre UNIQUE (nombre);

-- Genero nuevo catalogo 
INSERT INTO [dbo].[catalogos]
           ([nombre]
           ,[is_editable]
           ,[created_at]
           ,[updated_at]
           ,[is_active])
     VALUES
           ('Tipo proceso'
           ,1
           ,'2022-04-07'
           ,'2022-04-07'
           ,1);

-- Elimino los viejos valores 
DELETE FROM dbo.catalogos_elementos WHERE catalogo_id = (SELECT id FROM catalogos WHERE nombre = 'tipo_proceso');

DELETE FROM catalogos WHERE nombre = 'tipo_proceso'; 

-- Registro los nuevos valores 
INSERT INTO [dbo].[catalogos_elementos]
           ([code]
           ,[nombre]
           ,[orden]
           ,[catalogo_id])
     VALUES
           ('Seleccione'
           ,'Seleccione'
           ,1
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso'))
		   ,('calificacion'
           ,'Calificación'
           ,2
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso'))
		   ,('desahogo'
           ,'Desahogo'
           ,3
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso'))
		   ,('programacion'
           ,'Programación'
           ,4
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso'))
		   ,('sancion '
           ,'Sanción '
           ,5
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso'))
		   ,('otros'
           ,'Otros'
           ,6
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso')) 
GO
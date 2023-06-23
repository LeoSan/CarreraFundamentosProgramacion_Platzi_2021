
-- Crear nuevo catalogo 
USE [SSI_DB_SIAPI_REFESSATV2]
GO

INSERT INTO [dbo].[catalogos]
           ([nombre]
           ,[is_editable]
           ,[created_at]
           ,[updated_at]
           ,[is_active])
     VALUES
           ('tipo_proceso'
           ,1
           ,'2022-04-07'
           ,'2022-04-07'
           ,1)
GO

-- Crear elementos del catalogo
USE [SSI_DB_SIAPI_REFESSATV2]
GO

INSERT INTO [dbo].[catalogos_elementos]
           ([code]
           ,[nombre]
           ,[orden]
           ,[catalogo_id])
     VALUES
           ('Seleccione'
           ,'Seleccione'
           ,1
           ,(SELECT id FROM catalogos WHERE nombre = 'tipo_proceso'))
		   ,('Calificacion'
           ,'Calificacion'
           ,2
           ,(SELECT id FROM catalogos WHERE nombre = 'tipo_proceso'))
		   ,('Desahogo'
           ,'Desahogo'
           ,3
           ,(SELECT id FROM catalogos WHERE nombre = 'tipo_proceso'))
		   ,('Programacion'
           ,'Programacion'
           ,4
           ,(SELECT id FROM catalogos WHERE nombre = 'tipo_proceso'))
		   ,('Otros'
           ,'Otros'
           ,5
           ,(SELECT id FROM catalogos WHERE nombre = 'tipo_proceso')) 
GO
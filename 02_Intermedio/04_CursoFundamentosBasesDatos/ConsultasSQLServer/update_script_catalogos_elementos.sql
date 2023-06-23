

-- Crear elementos del catalogo
USE [SSI_DB_SIAPI_REFESSATV2]
GO
DELETE FROM dbo.catalogos_elementos WHERE catalogo_id = (SELECT id FROM catalogos WHERE nombre = 'tipo_proceso');

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
           ,'Calificación'
           ,2
           ,(SELECT id FROM catalogos WHERE nombre = 'tipo_proceso'))
		   ,('Desahogo'
           ,'Desahogo'
           ,3
           ,(SELECT id FROM catalogos WHERE nombre = 'tipo_proceso'))
		   ,('Programacion'
           ,'Programación'
           ,4
           ,(SELECT id FROM catalogos WHERE nombre = 'tipo_proceso'))
		   ,('Sancion '
           ,'Sanción '
           ,5
           ,(SELECT id FROM catalogos WHERE nombre = 'tipo_proceso'))
		   ,('Otros'
           ,'Otros'
           ,6
           ,(SELECT id FROM catalogos WHERE nombre = 'tipo_proceso')) 
GO
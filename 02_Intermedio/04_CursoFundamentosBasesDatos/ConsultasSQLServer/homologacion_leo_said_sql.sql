USE [SSI_DB_SIAPI_REFESSATV2]
GO

-- Genero Clave Primaria de la tabla  -> catalogos_elementos
ALTER TABLE dbo.catalogos_elementos ADD id int IDENTITY(1,1)  NOT NULL PRIMARY KEY; 

-- Genero Unique -> Nombre -> tabla catalogos
ALTER TABLE dbo.catalogos ADD CONSTRAINT UC_nombre UNIQUE (nombre);

-- Subir la cantidad de caracteres en la columna code
ALTER TABLE dbo.catalogos_elementos ALTER COLUMN code VARCHAR (100) NOT NULL;

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
           ,'Calificaci�n'
           ,2
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso'))
		   ,('desahogo'
           ,'Desahogo'
           ,3
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso'))
		   ,('programacion'
           ,'Programaci�n'
           ,4
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso'))
		   ,('sancion '
           ,'Sanci�n '
           ,5
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso'))
		   ,('otros'
           ,'Otros'
           ,6
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso'));


-- Catalogo SIPAS Tipo proceso en alta documentos
INSERT INTO [dbo].[catalogos]
           ([nombre]
           ,[is_editable]
           ,[created_at]
           ,[updated_at]
           ,[is_active])
     VALUES
           ('Tipo proceso sipas'
           ,1
           ,'2022-04-18'
           ,'2022-04-18'
           ,1);

INSERT INTO [dbo].[catalogos_elementos]
           ([code]
           ,[nombre]
           ,[orden]
           ,[catalogo_id])
     VALUES
           ('Seleccione'
           ,'Seleccione'
           ,1
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('alta_expediente'
           ,'Alta de expediente'
           ,2
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('emplazamiento'
           ,'Emplazamiento'
           ,3
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('solicitud_notificacion'
           ,'Solicitud de notificaci�n'
           ,4
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('resultado_notificacion'
           ,'Resultado de la notificaci�n '
           ,5
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('comparecencia'
           ,'Comparecencia'
           ,6
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_cierre_procedimiento'
           ,'Acuerdo de cierre de procedimiento'
           ,7
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('resolucion'
           ,'Resoluci�n'
           ,8
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('solicitud_de_cobro'
           ,'Solicitud de cobro'
           ,9
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('informe_cobro_multa'
           ,'Informe de cobro de multa'
           ,10
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('recurso_administrativo'
           ,'Recurso administrativo'
           ,11
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('juicio_nulidad_fiscal'
           ,'Juicio de nulidad fiscal'
           ,12
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('juicio_amparo'
           ,'Juicio de amparo'
           ,13
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('resolucion_cumplimiento'
           ,'Resoluci�n en cumplimiento'
           ,14
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

 		   ,('acuerdo_terminacion_improcedencia'
           ,'Acuerdo de terminaci�n por improcedencia'
           ,15
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_solicitando_informacion_consignante'
           ,'Acuerdo de tr�mite solicitando informaci�n al consignante'
           ,16
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_solicitando_informacion_particular'
           ,'Acuerdo de tr�mite solicitando informaci�n al particular'
           ,17
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_solicitando_acreditacion_personalidad'
           ,'Acuerdo de tr�mite solicitando acreditaci�n de personalidad'
           ,18
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_archivo_falta_informacion'
           ,'Acuerdo de tr�mite archivo por falta de informaci�n'
           ,19
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_archivo_provisional_huelga'
           ,'Acuerdo de tr�mite archivo provisional por huelga'
           ,20
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_archivo_falta_informacion'
           ,'Acuerdo de archivo por falta de informaci�n'
           ,21
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_se_practique_notificacion_huelga'
           ,'Acuerdo de tr�mite se practique notificaci�n (Huelga)'
           ,22
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_se_practique_notificacion'
           ,'Acuerdo de tr�mite se practique notificaci�n'
           ,23
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_archivo_huelga'
           ,'Acuerdo de tr�mite archivo por huelga'
           ,24
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_pago_multa'
           ,'Acuerdo de tr�mite de pago de multa'
           ,25
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_pago_derechos'
           ,'Acuerdo de tr�mite pago de derechos'
           ,26
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('acuerdo_tramite_informando_particular'
           ,'Acuerdo de tr�mite informando al particular'
           ,27
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('inspeccion_programacion'
           ,'Inspecci�n - Programaci�n'
           ,28
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('inspeccion_desahogo'
           ,'Inspecci�n - Desahogo'
           ,29
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))

		   ,('inspeccion_calificacion'
           ,'Inspecci�n - Calificaci�n'
           ,30
           ,(SELECT id FROM catalogos WHERE nombre = 'Tipo proceso sipas'))




GO
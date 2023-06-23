
SELECT * FROM dbo.dshgo_documento doc


INSERT INTO [dbo].[dshgo_documento]
           ([desahogo_id]
           ,[tipo_documento_id]
           ,[ddoc_nombre_documento]
           ,[ddoc_url_documento]
           ,[ddoc_hash]
           ,[sys_usr_insert]
           ,[sys_fec_insert])
     VALUES
           (871277
           ,18
           ,'Resumen de datos de la actuación'
           ,''
           ,''
           ,'Christian Guillermo'
           ,'2022-01-06 15:59:49.613')
GO



INSERT INTO [dbo].[dshgo_documento]
           ([desahogo_id]
           ,[tipo_documento_id]
           ,[ddoc_nombre_documento]
           ,[ddoc_url_documento]
           ,[ddoc_hash]
           ,[sys_usr_insert]
           ,[sys_fec_insert])
     VALUES
           (871277
           ,5
           ,'Acta de inspección'
           ,'~/Uploads/Plantillas/Acta_Inspeccion.doc'
           ,''
           ,'Christian Guillermo'
           ,'2022-01-06 15:59:45.147')
GO
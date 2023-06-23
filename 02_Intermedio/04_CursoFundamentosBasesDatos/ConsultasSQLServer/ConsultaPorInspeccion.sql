USE [SSI_DB_SIAPI_REFESSATV2]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[PA_TodosDocumentos_ConsultarPorInspeccion]
		@inspeccion_id = 1138442

SELECT	'Return Value' = @return_value

GO


	SELECT * FROM ( (SELECT documento_id as documento_id, 
		   doc.inspeccion_id as inspeccion_id, 
		   0 as desahogo_id,
		   0 as calificacion_id,
		   (select top 1 emplazamiento_id from emplazamiento where inspeccion_comprobacion_id=doc.inspeccion_id) as emplazamiento_id,
		 --  inspector_id, 
		   doc.tipo_documento_id as tipo, 
		   doc_url_archivo  as url, 
		--   doc_esta_asignado, 
		   Convert(varchar(10),ins.in_fec_emision,103) as fecha, 
		   doc.sys_usr_insert as usuario,
		--   doc_forma_entrega, 
		--   doc_fec_limite_entrega, 
		--   doc_fec_entrega_programada, 
		--     doc_observaciones, 
		--   doc_estatus,

		   td_tipo_documento, 
		   td_url_plantilla,
		--   td_aplica_aleatoria, 
		--   td_aplica_directa, 
		--   td_aplica_automatica
			doc.documento_firmado
		   
	FROM dbo.documento doc
	INNER JOIN dbo.tipo_documento tipodoc ON tipodoc.tipo_documento_id = doc.tipo_documento_id
	INNER JOIN dbo.inspeccion ins ON ins.inspeccion_id=doc.inspeccion_id
	WHERE (doc.inspeccion_id  = 1138442) AND doc_url_archivo is NOT NULL
	)




	SELECT documento_id as documento_id, 
		   doc.inspeccion_id as inspeccion_id, 
		   0 as desahogo_id,
		   0 as calificacion_id,
		   (select top 1 emplazamiento_id from emplazamiento where inspeccion_comprobacion_id=doc.inspeccion_id) as emplazamiento_id,
		 --  inspector_id, 
		   doc.tipo_documento_id as tipo, 
		   doc_url_archivo  as url, 
		--   doc_esta_asignado, 
		   Convert(varchar(10),ins.in_fec_emision,103) as fecha, 
		   doc.sys_usr_insert as usuario,
		--   doc_forma_entrega, 
		--   doc_fec_limite_entrega, 
		--   doc_fec_entrega_programada, 
		     doc_observaciones, 
		--   doc_estatus,

		   td_tipo_documento, 
		   td_url_plantilla,
		--   td_aplica_aleatoria, 
		--   td_aplica_directa, 
		--   td_aplica_automatica
			doc.documento_firmado
		   
	FROM dbo.documento doc
	INNER JOIN dbo.tipo_documento tipodoc ON tipodoc.tipo_documento_id = doc.tipo_documento_id
	INNER JOIN dbo.inspeccion ins ON ins.inspeccion_id=doc.inspeccion_id
	WHERE (doc.inspeccion_id  = 1138442 AND td_tipo_documento != 'Otro')



	SELECT TOP 1
			   doc.dshgo_documento_id as documento_id,
			   0  as inspeccion_id, 
			   desahogo_id as desahogo_id,
			   0 as calificacion_id,
			   0 as emplazamiento_id,
			   doc.tipo_documento_id  as tipo, 
			   doc.ddoc_url_documento as url,
			   Convert(varchar(10),doc.sys_fec_insert,103) as fecha,
			   doc.sys_usr_insert as usuario,
			   td_tipo_documento, 
			   td_url_plantilla,
			   doc.ddoc_nombre_documento as doc_observaciones
			   	   
		FROM dbo.dshgo_documento doc
		INNER JOIN dbo.tipo_documento tipodoc ON tipodoc.tipo_documento_id = doc.tipo_documento_id
		WHERE doc.desahogo_id=1138442
		AND doc.tipo_documento_id<>17  and doc.tipo_documento_id<>18
		ORDER BY doc.sys_fec_insert DESC



		SELECT 
	doc.calif_documento_id as documento_id,
			0  as inspeccion_id, 
		   0 as desahogo_id,
		   calificacion_id as calificacion_id,
		   0 as emplazamiento_id,
	doc.tipo_documento_id as tipo,
	doc.cdoc_url_documento as url,
	Convert(varchar(10),doc.cdoc_fec_documento,103)  as fecha,
	doc.sys_usr_insert as usuario,
	td_tipo_documento,
	td_url_plantilla,
	'' AS documento_firmado,
	cdoc_observaciones as doc_observaciones
	FROM dbo.calif_documento  doc
	INNER JOIN dbo.tipo_documento tipodoc ON tipodoc.tipo_documento_id = doc.tipo_documento_id	 
	WHERE doc.cdoc_url_documento IS NOT NULL AND calificacion_id in (select calificacion_id from calificacion where desahogo_id=1138442) 
	) ) as resultado_archivos ORDER BY fecha
USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_TodosDocumentos_ConsultarPorInspeccion]    Script Date: 2022-04-05 9:45:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ana Karina
-- Create date: 12/04/2012
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_TodosDocumentos_ConsultarPorInspeccion]
	-- Add the parameters for the stored procedure here
	@inspeccion_id	int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    declare @desahogo_id int;
    declare @calificacion_id int;
    declare @in_etapa int;
    set @desahogo_id= (select desahogo_id from desahogo where inspeccion_id=@inspeccion_id);
    --set @calificacion_id=(select calificacion_id from calificacion where desahogo_id=@desahogo_id);
    set @in_etapa= (select in_etapa from inspeccion where inspeccion_id=@inspeccion_id);
    
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
		--   doc_observaciones, 
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
	WHERE (doc.inspeccion_id     = @inspeccion_id) AND doc_url_archivo is NOT NULL 
		AND doc.tipo_documento_id <> 16
	)
	UNION ALL
	(
	SELECT documento_id,
		   inspeccion_id, 
		   desahogo_id,
		   calificacion_id,
		   emplazamiento_id,
		   tipo, 
		   url,
		   fecha,
		   usuario,
		   td_tipo_documento, 
		   td_url_plantilla,
		   '' AS documento_firmado
	FROM(
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
			   td_url_plantilla
			   	   
		FROM dbo.dshgo_documento doc
		INNER JOIN dbo.tipo_documento tipodoc ON tipodoc.tipo_documento_id = doc.tipo_documento_id
		WHERE doc.desahogo_id=@desahogo_id
		AND doc.tipo_documento_id<>17  and doc.tipo_documento_id<>18
		--AND (@in_etapa=3 OR @in_etapa>4)
		ORDER BY doc.sys_fec_insert DESC
	) as tabla1 
	)
	UNION ALL
	
	(
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
	'' AS documento_firmado
	FROM dbo.calif_documento  doc
	INNER JOIN dbo.tipo_documento tipodoc ON tipodoc.tipo_documento_id = doc.tipo_documento_id	 
	WHERE doc.cdoc_url_documento IS NOT NULL AND calificacion_id in (select calificacion_id from calificacion where desahogo_id=@desahogo_id) 
	) ) as resultado_archivos ORDER BY fecha;
	
	--los otros documentos
	
	-- SELECT 2
	SELECT doc.dshgo_documento_id as documento_id,
		  desahogo_id,
		   doc.ddoc_url_documento,
		   doc.ddoc_nombre_documento  as nombre, 
		   doc.ddoc_url_documento as url,
		   Convert(varchar(10),doc.sys_fec_insert,103) as fecha,
		   doc.sys_usr_insert as usuario
		   , '' as doc_observaciones
	FROM dbo.dshgo_documento doc
	WHERE doc.desahogo_id=@desahogo_id
	AND
	(tipo_documento_id is null);
	
	-- SELECT 3
	SELECT documento_id
	,doc_url_archivo as url
	, SUBSTRING(doc.doc_observaciones, 0, CHARINDEX('|', doc.doc_observaciones, 0)) as nombre 
	, tipodoc.td_tipo_documento
	,convert(varchar(10)
	,doc.sys_fec_insert,103) as fecha
	,doc.sys_usr_insert as usuario   
	, SUBSTRING(doc.doc_observaciones, CHARINDEX('|', doc.doc_observaciones, 0)+1, LEN(doc.doc_observaciones)-CHARINDEX('|', doc.doc_observaciones, 0)) as doc_observaciones
	FROM dbo.documento doc
	INNER JOIN dbo.tipo_documento tipodoc ON tipodoc.tipo_documento_id = doc.tipo_documento_id
	where inspeccion_id = @inspeccion_id and tipodoc.td_tipo_documento = 'Otro'

	--UNION ALL
	
	
	--SELECT 
	--doc.calif_documento_id as documento_id,
	--doc.tipo_documento_id as tipo,
	--doc.cdoc_url_documento as url,
	--doc.cdoc_fec_documento as fecha,
	--doc.sys_usr_insert as usuario,
	--td_tipo_documento,
	--td_url_plantilla
	--FROM dbo.calif_documento  doc
	--INNER JOIN dbo.tipo_documento tipodoc ON tipodoc.tipo_documento_id = doc.tipo_documento_id	 
	--WHERE calificacion_id=@calificacion_id 
	
	
END
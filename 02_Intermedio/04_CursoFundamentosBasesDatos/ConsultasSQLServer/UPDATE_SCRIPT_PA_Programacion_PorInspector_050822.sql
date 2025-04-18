USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Programacion_PorInspector]    Script Date: 05/08/2022 05:25:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ariana Duarte
-- Create date: 28/12/2011
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Programacion_PorInspector]
	@participante_id int = -1,
	@fecha_inicio datetime = null,
	@fecha_fin datetime = null,
	@ordenar int = -1
	
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM (
	(SELECT CONVERT(varchar(10), in_fec_inspeccion, 103) fecha_inspeccion,
		stins_subtipo,
		mat_acronimo,
		CASE ISNULL(in_ct_nombre, '1') WHEN '1' THEN in_ct_razon_social ELSE in_ct_nombre END AS nombre,
		in_domicilio_inspeccion,
		(SELECT TOP 1 CONVERT(varchar(10), notif_fec_entrega, 103)
			FROM dbo.notificacion n
			LEFT JOIN dbo.notif_motivo_no_entrega nme ON nme.notif_motivo_no_entrega_id = n.notif_motivo_no_entrega_id
			WHERE inspeccion_id = i.inspeccion_id ORDER BY notif_fec_entrega DESC) fecha_entrega,
		(SELECT TOP 1
			CASE in_generar_citatorio WHEN 0 THEN 'Sin Citatorio' 
				ELSE CASE notif_se_recibio WHEN 1 THEN 'Recibió ' + ISNULL(notif_nombre_recibio,'') + ' ' + ISNULL(notif_dijo_ser, '') + ', ' + ISNULL(notif_observaciones, '')
				ELSE CASE notif_quedo_pegado WHEN 1 THEN 'No recibió, sí se dejó pegado, ' + ISNULL(nmtvne_motivo,'') + CASE WHEN notif_observaciones IS NOT NULL THEN ', ' ELSE ' ' END + ISNULL(notif_observaciones, '') 
				ELSE CASE notif_quedo_pegado WHEN 0 THEN 'No recibió, no se dejó pegado, ' + ISNULL(nmtvne_motivo,'') + CASE WHEN notif_observaciones IS NOT NULL THEN ', ' ELSE ' ' END + + ISNULL(notif_observaciones, '') 
				ELSE CASE WHEN notif_otro_motivo IS NOT NULL THEN  notif_otro_motivo + ', ' + ISNULL(notif_observaciones, '') 
				ELSE 'Sin información registrada' END END END END END
			FROM dbo.notificacion n
			LEFT JOIN dbo.notif_motivo_no_entrega nme ON nme.notif_motivo_no_entrega_id = n.notif_motivo_no_entrega_id
			WHERE inspeccion_id = i.inspeccion_id ORDER BY notif_fec_entrega DESC) observaciones,
		centro_trabajo_id,
		i.inspeccion_id,
		in_ct_nombre,
		tipo_inspeccion_id,
		in_ct_razon_social,
		mat_materia	,
		i.operativo_id,
		i.subtipo_inspeccion_id,
		in_fec_inspeccion
	 FROM dbo.inspeccion i
	 INNER JOIN dbo.inspec_participante ip ON ip.inspeccion_id = i.inspeccion_id
	 INNER JOIN dbo.participante par ON par.participante_id = ip.participante_id
	 LEFT JOIN dbo.subtipo_inspeccion si ON si.subtipo_inspeccion_id = i.subtipo_inspeccion_id 
	 LEFT JOIN dbo.materia m ON m.materia_id = i.materia_id
	WHERE (par.participante_id = @participante_id OR @participante_id = -1)
		AND (in_fec_inspeccion BETWEEN @fecha_inicio AND @fecha_fin OR @fecha_inicio IS NULL)
		AND in_fec_inspeccion IS NOT NULL
		AND in_etapa > 0
		AND in_estatus <> 2
		)
		

	UNION ALL	
	
	(SELECT CONVERT(varchar(10), in_fec_inspeccion, 103) fecha_inspeccion,
		stins_subtipo,
		mat_acronimo,
		CASE ISNULL(in_ct_nombre, '1') WHEN '1' THEN in_ct_razon_social ELSE in_ct_nombre END AS nombre,
		in_domicilio_inspeccion,
		(SELECT TOP 1 CONVERT(varchar(10), notif_fec_entrega, 103)
			FROM dbo.notificacion n
			LEFT JOIN dbo.notif_motivo_no_entrega nme ON nme.notif_motivo_no_entrega_id = n.notif_motivo_no_entrega_id
			WHERE inspeccion_id = i.inspeccion_id ORDER BY notif_fec_entrega DESC) fecha_entrega,
		(SELECT TOP 1
			CASE in_generar_citatorio WHEN 0 THEN 'Sin Citatorio' 
				ELSE CASE notif_se_recibio WHEN 1 THEN 'Recibió ' + ISNULL(notif_nombre_recibio,'') + ' ' + ISNULL(notif_dijo_ser, '') + ', ' + ISNULL(notif_observaciones, '')
				ELSE CASE notif_quedo_pegado WHEN 1 THEN 'No recibió, sí se dejó pegado, ' + ISNULL(nmtvne_motivo,'') + CASE WHEN notif_observaciones IS NOT NULL THEN ', ' ELSE ' ' END + ISNULL(notif_observaciones, '') 
				ELSE CASE notif_quedo_pegado WHEN 0 THEN 'No recibió, no se dejó pegado, ' + ISNULL(nmtvne_motivo,'') + CASE WHEN notif_observaciones IS NOT NULL THEN ', ' ELSE ' ' END + + ISNULL(notif_observaciones, '') 
				ELSE CASE WHEN notif_otro_motivo IS NOT NULL THEN  notif_otro_motivo + ', ' + ISNULL(notif_observaciones, '') 
				ELSE 'Sin información registrada' END END END END END
			FROM dbo.notificacion n
			LEFT JOIN dbo.notif_motivo_no_entrega nme ON nme.notif_motivo_no_entrega_id = n.notif_motivo_no_entrega_id
			WHERE inspeccion_id = i.inspeccion_id ORDER BY notif_fec_entrega DESC) observaciones,
		centro_trabajo_id,
		i.inspeccion_id,
		in_ct_nombre,
		tipo_inspeccion_id,
		in_ct_razon_social,
		mat_materia	,
		i.operativo_id,
		i.subtipo_inspeccion_id,
		in_fec_inspeccion
	 FROM dbo.inspeccion i
	 INNER JOIN dbo.inspec_adicional ia ON ia.inspeccion_id = i.inspeccion_id
	 INNER JOIN dbo.participante par ON par.inspector_id = ia.inspector_id
	 LEFT JOIN dbo.subtipo_inspeccion si ON si.subtipo_inspeccion_id = i.subtipo_inspeccion_id 
	 LEFT JOIN dbo.materia m ON m.materia_id = i.materia_id
	WHERE (par.participante_id = @participante_id OR @participante_id = -1)
		AND (in_fec_inspeccion BETWEEN @fecha_inicio AND @fecha_fin OR @fecha_inicio IS NULL)
		AND in_fec_inspeccion IS NOT NULL
		AND in_etapa > 0
		AND in_estatus <> 2)) tb1
	ORDER BY 
			CASE WHEN @ordenar = 1 THEN stins_subtipo END,
			CASE WHEN @ordenar = 2 THEN mat_materia  END,
			CASE WHEN @ordenar = 3 THEN nombre  END,
			CASE WHEN @ordenar = 4 THEN in_fec_inspeccion  END				
		
END
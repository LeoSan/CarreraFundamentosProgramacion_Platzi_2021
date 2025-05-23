USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Programacion_PorInspectorParaDesahogo]    Script Date: 04/08/2022 05:48:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ana Karina
-- Create date: 20/02/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Programacion_PorInspectorParaDesahogo]
	@participante_id int = -1,
	--@fecha_inicio datetime = null,
	--@fecha_fin datetime = null,
	@fecha_programada varchar(10)=null,
	@razon_social     varchar(255)=null,
	@no_inspeccion    varchar(255)=null
	
AS
BEGIN
	SET NOCOUNT ON;
	(
	SELECT CONVERT(varchar(10), in_fec_inspeccion, 103) fecha_inspeccion,
		stins_subtipo,
		i.subtipo_inspeccion_id,
		mat_acronimo,
		in_ct_razon_social + ' ' + ISNULL(in_ct_nombre, '') nombre,
		CASE ISNULL(in_ct_nombre, '1') WHEN '1' THEN in_ct_razon_social ELSE in_ct_nombre END AS nombre_dos,
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
		par.participante_id,
		i.inspeccion_id,
		i.in_fec_inspeccion,
		in_ct_nombre,
		in_domicilio_inspeccion,
		tipo_inspeccion_id,
		in_ct_razon_social,
		in_ct_rfc,
		mat_materia	,
		i.materia_id,
		i.in_num_expediente,
		i.in_alcance,
		d.dshgo_tipo_cierre,
		CASE si.subtipo_inspeccion_id
			WHEN 3 THEN 1
			ELSE CASE WHEN i.inspeccion_origen_id IS NOT NULL THEN 2 ELSE 0 END
		END as emp_rev
	 FROM dbo.inspeccion i
	 INNER JOIN dbo.inspec_participante ip ON ip.inspeccion_id = i.inspeccion_id
	 INNER JOIN dbo.participante par ON par.participante_id = ip.participante_id
	 --INNER JOIN dbo.notificacion n ON n.inspeccion_id = i.inspeccion_id
	 --LEFT JOIN dbo.notif_motivo_no_entrega nme ON nme.notif_motivo_no_entrega_id = n.notif_motivo_no_entrega_id
	 LEFT JOIN dbo.subtipo_inspeccion si ON si.subtipo_inspeccion_id = i.subtipo_inspeccion_id 
	 LEFT JOIN dbo.materia m ON m.materia_id = i.materia_id
	 LEFT JOIN dbo.desahogo d ON d.inspeccion_id=i.inspeccion_id
	WHERE (par.participante_id = @participante_id OR @participante_id = -1)
		AND (in_fec_inspeccion <GETDATE() OR CONVERT (date, in_fec_inspeccion)=CONVERT (date, GETDATE()))
		AND (CONVERT(varchar(10), in_fec_inspeccion, 103)=@fecha_programada OR @fecha_programada IS NULL)
		AND in_fec_inspeccion IS NOT NULL
		AND (in_ct_razon_social + ' ' + ISNULL(in_ct_nombre, '') like '%'+@razon_social+'%' OR @razon_social IS NULL)
		AND (in_num_expediente like  '%'+@no_inspeccion+'%' OR @no_inspeccion IS NULL)
		AND ((in_etapa=2) OR(in_etapa=1) OR (in_etapa=4))
		--AND (in_etapa<>3)
		AND (in_estatus<>2)
		--AND (in_etapa<>5)
		--AND (in_etapa<>6)
		--AND (in_etapa<>4)
	)
	union all
	(
		SELECT CONVERT(varchar(10), in_fec_inspeccion, 103) fecha_inspeccion,
		stins_subtipo,
		i.subtipo_inspeccion_id,
		mat_acronimo,
		in_ct_razon_social + ' ' + ISNULL(in_ct_nombre, '') nombre,
		CASE ISNULL(in_ct_nombre, '1') WHEN '1' THEN in_ct_razon_social ELSE in_ct_nombre END AS nombre_dos,
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
		par.participante_id,
		i.inspeccion_id,
		i.in_fec_inspeccion,
		in_ct_nombre,
		in_domicilio_inspeccion,
		tipo_inspeccion_id,
		in_ct_razon_social,
		in_ct_rfc,
		mat_materia	,
		i.materia_id,
		i.in_num_expediente,
		i.in_alcance,
		d.dshgo_tipo_cierre,
		CASE si.subtipo_inspeccion_id
			WHEN 3 THEN 1
			ELSE CASE WHEN i.inspeccion_origen_id IS NOT NULL THEN 2 ELSE 0 END
		END as emp_rev
	 FROM dbo.inspeccion i
	 INNER JOIN dbo.inspec_adicional ip ON ip.inspeccion_id = i.inspeccion_id
	 INNER JOIN dbo.inspector  inspec ON inspec.inspector_id=ip.inspector_id
	 INNER JOIN dbo.participante par ON par.inspector_id = inspec.inspector_id
	 
	 --INNER JOIN dbo.inspec_participante ip ON ip.inspeccion_id = i.inspeccion_id
	 --INNER JOIN dbo.participante par ON par.participante_id = ip.participante_id
	 --INNER JOIN dbo.notificacion n ON n.inspeccion_id = i.inspeccion_id
	 --LEFT JOIN dbo.notif_motivo_no_entrega nme ON nme.notif_motivo_no_entrega_id = n.notif_motivo_no_entrega_id
	 LEFT JOIN dbo.subtipo_inspeccion si ON si.subtipo_inspeccion_id = i.subtipo_inspeccion_id 
	 LEFT JOIN dbo.materia m ON m.materia_id = i.materia_id
	 LEFT JOIN dbo.desahogo d ON d.inspeccion_id=i.inspeccion_id
	WHERE (par.participante_id = @participante_id OR @participante_id = -1)
		AND (in_fec_inspeccion <GETDATE() OR CONVERT (date, in_fec_inspeccion)=CONVERT (date, GETDATE()))
		AND (CONVERT(varchar(10), in_fec_inspeccion, 103)=@fecha_programada OR @fecha_programada IS NULL)
		AND in_fec_inspeccion IS NOT NULL
		AND (in_ct_razon_social + ' ' + ISNULL(in_ct_nombre, '') like '%'+@razon_social+'%' OR @razon_social IS NULL)
		AND (in_num_expediente like  '%'+@no_inspeccion+'%' OR @no_inspeccion IS NULL)
		AND ((in_etapa=2)OR(in_etapa=1) OR (in_etapa=4))
		--AND (in_etapa<>3)
		AND (in_estatus<>2)
		--AND (in_etapa<>5)
		--AND (in_etapa<>6)
		--AND (in_etapa<>4)
	)
	ORDER BY in_fec_inspeccion DESC, in_ct_razon_social + ' ' + ISNULL(in_ct_nombre, '')
END
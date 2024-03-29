USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Calificacion_Consultar]    Script Date: 12/08/2022 01:53:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ernesto
-- Create date: 21/03/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Calificacion_Consultar]
	@fecha_ini					datetime = null,
	@fecha_fin					datetime = null,
	@cve_ur						int      = -1,
	@estatus                    int      = -1,
	@desahogo_id              int      = -1
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT cal.calificacion_id, CONVERT(varchar(10), in_fec_inspeccion, 103) fecha_inspeccion, cal.calif_fec_asignacion,
		stins_subtipo,
		i.subtipo_inspeccion_id,
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
		ct.centro_trabajo_id,
		p.participante_id,
		i.inspeccion_id,
		i.in_fec_inspeccion,
		in_ct_nombre,
		in_domicilio_inspeccion,
		ti.tipo_inspeccion_id,
		ti.tins_tipo,
		in_ct_razon_social,
		in_ct_rfc,
		mat_materia	,
		i.materia_id,
		i.in_num_expediente num,
		SUBSTRING(i.in_num_expediente,5,6) num1,
		i.in_num_expediente,
		i.in_alcance,
		calif_fec_asignacion,
		calif_fec_calificacion,
		CONVERT(varchar(10), calif_fec_asignacion, 103) fec_asignacion,
		CONVERT(varchar(10), calif_fec_calificacion, 103)fec_calificacion,
		(p.par_nombre + ' ' + p.par_primer_apellido + ' ' +ISNULL(p.par_segundo_apellido,''))participante,
		d.desahogo_id,
		i.normativa_version_id
	 FROM dbo.inspeccion i
	 INNER JOIN dbo.desahogo d ON d.inspeccion_id = i.inspeccion_id
	 INNER JOIN dbo.centro_trabajoDNE ct ON ct.centro_trabajo_id = i.centro_trabajo_id
	 LEFT JOIN dbo.calificacion cal ON cal.desahogo_id = d.desahogo_id
	 LEFT JOIN dbo.participante p ON p.participante_id = cal.participante_id
	 LEFT JOIN dbo.subtipo_inspeccion si ON si.subtipo_inspeccion_id = i.subtipo_inspeccion_id
	 LEFT JOIN  dbo.tipo_inspeccion ti ON ti.tipo_inspeccion_id = si.tipo_inspeccion_id
	 LEFT JOIN dbo.materia m ON m.materia_id = i.materia_id
	WHERE   (d.desahogo_id = @desahogo_id OR @desahogo_id = -1) 
	    AND in_fec_inspeccion IS NOT NULL
	    AND (i.in_etapa = 3 OR i.in_etapa = 5)
	    --AND (d.dshgo_tipo_desahogo = 2 OR d.dshgo_tipo_desahogo = 3)
		AND d.dshgo_tipo_desahogo not in (4)
		AND ((in_fec_inspeccion BETWEEN @fecha_ini and @fecha_fin) OR @fecha_ini IS NULL)
        AND (i.cve_ur = @cve_ur OR @cve_ur = -1) 
        AND ((calif_fec_asignacion IS NOT NULL AND @estatus = 1)OR (calif_fec_asignacion IS NULL AND @estatus = 2)OR @estatus = -1)
		AND cal.calificacion_origen_id IS NULL
	ORDER BY in_fec_inspeccion DESC
END


USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SExpedienteEtapa_Busqueda]    Script Date: 9/7/2022 12:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	    Ernesto 	
-- Create date: 25/10/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_SExpedienteEtapa_Busqueda]
	-- Add the parameters for the stored procedure here
	@se_num_expediente       varchar(100) = '', 
	@in_ct_razon_social      varchar(100) = '',
	@in_ct_rfc               varchar(100) = '',
	@in_num_expediente       varchar(100) = '',
	@cdoc_num_documento      varchar(100) = '',
	@s_etapa_2_id            int     = -1, --==Ultima etapa registrada
	@dct_cve_edorep          int     = -1,
	@cve_ur                  int     = -1,
	@responsable_atencion_id int     = -1,
	@fec_ini                 varchar(100) = '',
	@fec_fin                 varchar(100) = '',
	@see_estatus             int     = -1,
	@id_ct					 int     = -1	--para procedimientos sancionadores de la empresa, CS
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    WITH  UltimaEtapa as (
			SELECT MAX (s_expediente_etapa_id)ultimaEtapa_id,s_expediente_id as expediente_id from dbo.s_expediente_etapa where see_estatus = 2 GROUP BY s_expediente_id
				)

    -- Insert statements for procedure here
	
	SELECT 
		ct.dct_cve_edorep as ct_cve_edorep, 
		se_ct_razon_social as se_ct_nombre, *,
		CONVERT(varchar,DATEADD (DAY , see_plazo , see_fec_inicio ),103) vencimiento,
		CONVERT(varchar,se_fec_recepcion,103) fec_recepcion,
		CONVERT(varchar,see_fec_cierre,103) fec_cierre,
		CONVERT(varchar,in_fec_inspeccion,103) fec_inspeccion ,
		CONVERT(varchar,see_fec_documento,103) fec_documento,
		-- Última Etapa distinta de notificación de sanción SIPAS
		(select top 1 
			setapa_nombre 
			from dbo.inspeccion as i 
			left join dbo.s_expediente s_e on i.inspeccion_id = s_e.inspeccion_id
			left join dbo.s_expediente_etapa s_e_etapa on s_e_etapa.s_expediente_id = s_e.s_expediente_id
			left join dbo.s_etapa et on et.s_etapa_id = s_e_etapa.s_etapa_id
			where i.inspeccion_id = s_ex.inspeccion_id and setapa_nombre <> 'Solicitud de notificación' and setapa_nombre <> 'Resultado de la notificación'
			order by s_expediente_etapa_id desc
		) as etapa_sancion
	FROM
		dbo.s_expediente s_ex
		INNER JOIN dbo.s_expediente_etapa s_ex_et
			ON s_ex.s_expediente_id = s_ex_et.s_expediente_id
		INNER JOIN	UltimaEtapa
			ON ultimaEtapa_id = s_expediente_etapa_id AND expediente_id = s_ex_et.s_expediente_id
		INNER JOIN dbo.s_etapa s_et 
			ON s_et.s_etapa_id = s_ex_et.s_etapa_id
		INNER JOIN  dbo.inspeccion insp
			ON insp.inspeccion_id = s_ex.inspeccion_id
		INNER JOIN dbo.desahogo dshgo
			ON dshgo.inspeccion_id = insp.inspeccion_id
		INNER JOIN dbo.dshgo_centro_trabajo ct
			ON ct.desahogo_id = dshgo.desahogo_id
		INNER JOIN dbo.calificacion	calif
			ON calif.desahogo_id = dshgo.desahogo_id
		INNER JOIN dbo.calif_documento doc
			ON doc.calificacion_id = calif.calificacion_id AND calif.calificacion_origen_id IS NULL
		INNER JOIN dbo.materia mat
			ON mat.materia_id = insp.materia_id 
	WHERE	(s_ex.se_num_expediente = @se_num_expediente OR @se_num_expediente = '')
		AND (s_ex_et.see_estatus = @see_estatus OR @see_estatus = -1)
		AND (insp.in_ct_razon_social LIKE '%'+@in_ct_razon_social+'%' OR @in_ct_razon_social = '')
		AND (insp.in_ct_rfc LIKE @in_ct_rfc + '%' OR @in_ct_rfc = '')
		AND (insp.in_num_expediente = @in_num_expediente OR @in_num_expediente = '')
		AND (doc.cdoc_num_documento = @cdoc_num_documento OR @cdoc_num_documento = '')
		AND (ct.dct_cve_edorep = @dct_cve_edorep OR @dct_cve_edorep = -1)
		AND (s_ex.cve_ur = @cve_ur OR @cve_ur = -1)
		AND (s_ex.responsable_atencion_id = @responsable_atencion_id OR s_ex_et.responsable_atencion_id = @responsable_atencion_id OR @responsable_atencion_id = -1)
		AND (s_ex.se_fec_recepcion BETWEEN @fec_ini AND @fec_fin OR @fec_ini = '' OR @fec_fin = '')
		AND (s_ex_et.s_etapa_id = @s_etapa_2_id OR @s_etapa_2_id = -1)
		--AND (EXISTS (SELECT 1 
		--             FROM dbo.s_etapa_plazo
		--             WHERE s_etapa_2_id = @s_etapa_2_id AND s_etapa_1_id = s_ex_et.s_etapa_id)
				--	OR @s_etapa_2_id = -1)
		AND (ct.dct_dne_centro_trabajo_id = @id_ct OR @id_ct = -1)
		AND (tipo_documento_id = 14 OR tipo_documento_id = 15)
	--order by s_ex.se_num_expediente
END


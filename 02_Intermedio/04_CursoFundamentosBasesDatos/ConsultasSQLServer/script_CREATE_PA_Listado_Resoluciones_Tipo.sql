USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Listado_Resoluciones_Tipo]    Script Date: 28/04/2022 12:41:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		lcuenca
-- Create date: 2022-04-28
-- Description:	
-- =============================================

CREATE PROCEDURE [dbo].[PA_Listado_Resoluciones_Tipo] 
	@cen_cve_edorep int = -1,
	@cur_cve_ur		int = -1,
	@s_participante_id	int = -1,
	@fec_inicio		datetime = null,
	@fec_final		datetime = null,
	@tipo_parametro varchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @SQLString NVARCHAR(500);  
	
	SELECT
		 se.se_num_expediente 
		, se.inspeccion_id
		, se.s_expediente_id
		, CONVERT(VARCHAR(30),sE.se_fec_recepcion,103) as se_fec_recepcion
		, se.se_ct_razon_social		
		, edo.cen_descripcion
		, count(
			case when (see_estatus = 2 AND sres_sentido = 2) then s_resolucion_id end
		) as absolutorias
		,count(
			case when (see_estatus = 2 AND sres_sentido = 1) then s_resolucion_id end
		) as condenatorias
		, count(case when see_estatus = 2 then s_acuerdo_terminacion_id end) as acuerdoTerminacion
		, count(case when see_estatus = 2 then s_acuerdo_notificacion_id end) as acuerdoArchivo
		, count(
			case when see_estatus = 2 then 
				case sres_sentido when 3 then s_resolucion_id end
			end
		) as resolucionImprocedencia
		INTO #resultado
	FROM
		dbo.cat_entidades edo
		left join dbo.cat_unidad_respon ur on ur.cur_cve_edorep = edo.cen_cve_edorep
		left join dbo.s_expediente se on se.cve_ur = ur.cur_cve_ur
		left join dbo.s_expediente_etapa see on see.s_expediente_id = se.s_expediente_id and see.s_etapa_id in (7,14,18,19,23)
		left join dbo.s_resolucion sr on sr.s_expediente_etapa_id = see.s_expediente_etapa_id
		left join dbo.s_acuerdo_terminacion sat on sat.s_expediente_etapa_id = see.s_expediente_etapa_id
		left join dbo.s_acuerdo_notificacion san on san.s_expediente_etapa_id = see.s_expediente_etapa_id
	WHERE edo.cen_cve_edorep =9 AND  se.se_num_expediente IS NOT NULL
	GROUP BY se.se_num_expediente, se.inspeccion_id, se.se_fec_recepcion, se.se_ct_razon_social, edo.cen_descripcion, se.s_expediente_id;

	SET @SQLString = N'SELECT 
		 r.se_num_expediente 
		,r.se_fec_recepcion
		,r.se_ct_razon_social
		,r.cen_descripcion
		,r.s_expediente_id
		,r.inspeccion_id
		from #resultado r
		WHERE '+ @tipo_parametro +'';  

EXECUTE sp_executesql @SQLString;
	  
END














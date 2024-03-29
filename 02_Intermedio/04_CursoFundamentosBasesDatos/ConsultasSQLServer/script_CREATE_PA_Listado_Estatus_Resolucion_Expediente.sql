USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		lcuenca
-- Create date: 2022-04-28
-- Description:	
-- =============================================

CREATE PROCEDURE [dbo].[PA_Listado_Estatus_Solucion_Expediente] 
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
		s.se_num_expediente 
		, CONVERT(VARCHAR(30),s.se_fec_recepcion,103) as se_fec_recepcion
		, s.se_ct_razon_social
		, ce.cen_descripcion
		, s.s_expediente_id
		, s.inspeccion_id
		, count(DISTINCT s.s_expediente_id) as recibidos
		, count(case when see_estatus=2 
			AND ((s_etapa_id = 7)
			OR (s_etapa_id = 14)
			OR (s_etapa_id = 18)
			OR (s_etapa_id = 19)
			OR (s_etapa_id = 23)
			) 
		THEN s.s_expediente_id END) as resueltos
		into #resultado
		FROM s_expediente s
		    INNER JOIN dbo.s_expediente_etapa see ON see.s_expediente_id = s.s_expediente_id
			inner join dbo.cat_unidad_respon ur on ur.cur_cve_ur = s.cve_ur
			INNER JOIN dbo.cat_entidades ce ON ce.cen_cve_edorep = ur.cur_cve_edorep
	   WHERE (cur_cve_edorep = @cen_cve_edorep or @cen_cve_edorep = -1)
			and (cur_cve_ur = @cur_cve_ur or @cur_cve_ur = -1)	
			and (see.responsable_atencion_id = @s_participante_id or @s_participante_id = -1)	
			and (see_fec_inicio >= @fec_inicio or @fec_inicio is null)
			and (see_fec_inicio <= @fec_final or @fec_final is null) 
		group by 
		 s.se_num_expediente 
		,s.se_fec_recepcion
		,s.se_ct_razon_social
		,ce.cen_descripcion
		,s.s_expediente_id
		,s.inspeccion_id;

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














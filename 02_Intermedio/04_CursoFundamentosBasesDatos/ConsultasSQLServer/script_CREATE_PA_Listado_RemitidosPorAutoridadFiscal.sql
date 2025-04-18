USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Listado_RemitidosPorAutoridadFiscal]    Script Date: 06/05/2022 12:46:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lcuenca@air.org
-- Create date: 01/05/2022
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_Listado_RemitidosPorAutoridadFiscal] 
	-- Add the parameters for the stored procedure here
	@cve_edorep         int         = -1, 
	@cve_ur             int         = -1,
	@s_participante_id  int         = -1,
	@fecha1             varchar(20) = NULL,
	@fecha2             varchar(20) = NULL,
	@tipo_parametroA    varchar(50) = null,
	@tipo_parametroB    varchar(50) = null
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SQLString NVARCHAR(1000);  

		
-- DATA CONTABILIZADA DETALLE 		
	SELECT 
		s_expediente.cve_ur
		, s_expediente.se_num_expediente
		, s_expediente.s_expediente_id
		, s_expediente.inspeccion_id
		, s_expediente.se_ct_razon_social
		, CONVERT(VARCHAR(30),s_expediente.se_fec_recepcion,103) as se_fec_recepcion
		, cur_descripcion
		, COUNT(s_cobro_solicitud_id) as remitidos
		, dbo.FN_ObtenerCobrosConOficio(s_expediente.cve_ur,@cve_edorep,@s_participante_id,@fecha1,@fecha2) as remitidos_oficio
		, COUNT(s_cobro_solicitud_id)-(dbo.FN_ObtenerCobrosCobradosNoCobrados(s_expediente.cve_ur,1,@cve_edorep,@s_participante_id,@fecha1,@fecha2)+dbo.FN_ObtenerCobrosCobradosNoCobrados(s_expediente.cve_ur,0,@cve_edorep,@s_participante_id,@fecha1,@fecha2)) as pendientes
		, dbo.FN_ObtenerCobrosCobradosNoCobrados(s_expediente.cve_ur,1,@cve_edorep,@s_participante_id,@fecha1,@fecha2) as cobrados
		, dbo.FN_ObtenerCobrosCobradosNoCobrados(s_expediente.cve_ur,0,@cve_edorep,@s_participante_id,@fecha1,@fecha2) as no_cobrados
	 INTO #resultado
	FROM dbo.s_cobro_solicitud
	INNER JOIN dbo.s_expediente_etapa exet ON dbo.s_cobro_solicitud.s_expediente_etapa_id=exet.s_expediente_etapa_id
	INNER JOIN dbo.s_expediente            ON dbo.s_expediente.s_expediente_id=exet.s_expediente_id
	INNER JOIN dbo.cat_unidad_respon       ON dbo.cat_unidad_respon.cur_cve_ur =dbo.s_expediente.cve_ur
	LEFT JOIN  s_participante par          ON exet.responsable_atencion_id= par.s_participante_id
	WHERE
		(cur_cve_edorep = @cve_edorep OR @cve_edorep = -1)AND(dbo.s_expediente.cve_ur= @cve_ur  OR @cve_ur  = -1) 
		AND(s_participante_id = @s_participante_id  OR @s_participante_id = -1)
		AND (se_fec_recepcion BETWEEN @fecha1 AND @fecha2  OR @fecha1 is null)
	GROUP BY s_expediente.cve_ur,cur_descripcion, s_expediente.se_num_expediente, s_expediente.s_expediente_id, s_expediente.inspeccion_id, se_fec_recepcion,se_ct_razon_social
	
	SET @SQLString = N'SELECT 
		r.se_num_expediente 
	,r.se_fec_recepcion
	,r.se_ct_razon_social
	,r.s_expediente_id
	,r.inspeccion_id
	,r.cve_ur
	FROM #resultado r
	WHERE '+ @tipo_parametroA +' AND ' + @tipo_parametroB; 


	PRINT @SQLString
	
	EXECUTE sp_executesql @SQLString;

END
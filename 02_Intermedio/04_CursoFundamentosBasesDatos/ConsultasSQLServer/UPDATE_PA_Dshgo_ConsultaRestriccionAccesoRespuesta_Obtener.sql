USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Dshgo_ConsultaRestriccionAccesoRespuesta_Obtener]    Script Date: 07/04/2022 09:54:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		wILLIAM cALDERON
-- Create date: 24/02/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Dshgo_ConsultaRestriccionAccesoRespuesta_Obtener] 
	   
	       @desahogo_id						bigint = -1,
           @inspeccion_id					bigint = -1,
		   @in_num_expediente				varchar(50) = '',
		   @dshgo_consulta_estatus			int = -1,
		   @fecha_ini						datetime = null,
		   @fecha_fin						datetime = null
       
      
AS
BEGIN
    SET NOCOUNT ON;
	

		--DOCUMENTO
		SELECT  UR.ur_nombre AS UR,
			I.in_num_expediente,
		    DATENAME(day,C.dshgo_consulta_fecha_emision) +' de '+ DATENAME(month,C.dshgo_consulta_fecha_emision) + ' del '+ DATENAME(year,C.dshgo_consulta_fecha_emision) AS 'FECHA_DOCUMENTO',
			I.in_num_expediente AS expediente,
			DATENAME(day,I.in_fec_inspeccion) +' de '+ DATENAME(month,I.in_fec_inspeccion) + ' del '+ DATENAME(year,I.in_fec_inspeccion) AS 'fecha_inspeccion',
			I.in_ct_razon_social AS razon_social,
			I.in_domicilio_inspeccion AS domicilio_centro_trabajo,
			C.*,
			I.in_fec_inspeccion
				
		FROM [dbo].[dshgo_medida_precautoria_consulta] C   inner join desahogo D ON C.desahogo_id = D.desahogo_id
															     inner join inspeccion I ON I.inspeccion_id = D.inspeccion_id
															     inner join catalogo_ur  UR ON UR.cve_ur = I.cve_ur
																 INNER JOIN ( SELECT desahogo_id, count(desahogo_id) as total FROM dbo.dshgo_medida  GROUP BY desahogo_id) AS M ON M.desahogo_id = C.desahogo_id
		WHERE (C.desahogo_id = @desahogo_id OR @desahogo_id = -1)
		AND (M.desahogo_id = @desahogo_id OR @desahogo_id = -1)
		AND	  (I.inspeccion_id = @inspeccion_id OR @inspeccion_id = -1)
		AND	  (C.dshgo_consulta_estatus = @dshgo_consulta_estatus OR @dshgo_consulta_estatus= -1)
		AND	  (I.in_num_expediente = @in_num_expediente OR @in_num_expediente= '')
		AND	  ((C.dshgo_consulta_fecha_emision BETWEEN @fecha_ini and @fecha_fin) OR @fecha_ini IS NULL)
		and C.dshgo_consulta_estatus <> 0
	

END













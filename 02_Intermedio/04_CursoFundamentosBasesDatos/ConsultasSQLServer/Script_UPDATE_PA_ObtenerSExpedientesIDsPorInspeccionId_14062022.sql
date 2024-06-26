USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_ObtenerSExpedientesIDsPorInspeccionId]    Script Date: 14/06/2022 05:59:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Said Guerrero>
-- Create date: <01-03-2022>
-- Description:	<PA para obtener el n�mero de expediente SIPAS y el s_expediente_id para consultar las etapas, desde la inspeccion_id>
-- =============================================
ALTER PROCEDURE [dbo].[PA_ObtenerSExpedientesIDsPorInspeccionId] 
	@inspeccion_id int = -1
AS
BEGIN
	SET NOCOUNT ON;
    SELECT insp.in_fec_inspeccion
	,exp.s_expediente_id
	,exp.se_num_expediente
	,exp.se_ct_nombre
	,exp.se_ct_domicilio
	,'' as materia_nombre
	, (select top 1 s_expediente_etapa_id from dbo.s_expediente_etapa where s_expediente_id = exp.s_expediente_id and s_etapa_id IN (8,9,24,25,26)  order by sys_fec_insert desc) as s_expediente_etapa_id 
	FROM dbo.s_expediente as exp
	LEFT JOIN dbo.inspeccion as insp on exp.inspeccion_id = insp.inspeccion_id
	where exp.inspeccion_id = @inspeccion_id
END
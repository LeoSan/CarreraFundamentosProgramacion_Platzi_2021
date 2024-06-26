USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_OperativoAsignacion_Obtener]    Script Date: 21/07/2022 12:03:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ariana Duarte
-- Create date: 24/11/2011
-- Description:	
-- Old Query: cve_ur > 116 AND cve_ur <> 117 AND cve_ur <> 200 AND cve_ur < 211
-- New Query: ur_asignar_inspectores = 1
-- Requirement: Script_SIAPI_ADD_New_COLUMN_catalogo_ur_03062022.sql
-- =============================================
ALTER PROCEDURE [dbo].[PA_OperativoAsignacion_Obtener]
	@operativo_asignacion_id	int	= -1,
	@operativo_id				int = -1,
	@inspector_id				int = -1,
	@cve_edorep					int=-1,
	@cve_ur						int=-1
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT *,
	i.cve_edorep as ins_cve_edorep,
	i.cve_ur as ins_cve_ur
	FROM dbo.operativo_asignacion oa
	INNER JOIN dbo.cat_entidades ce
		ON ce.cen_cve_edorep = oa.oas_cve_edorep
	INNER JOIN dbo.catalogo_ur cu
		ON cu.cve_ur = oa.oas_cve_ur --AND ur_asignar_inspectores = 1
	INNER JOIN dbo.inspector i
		ON i.inspector_id = oa.inspector_id --and insp_estatus = 1
	LEFT JOIN dbo.participante p
		ON p.inspector_id = i.inspector_id
	LEFT JOIN dbo.usuario usr 
		ON usr.usuario_id = p.usuario_id
	WHERE (operativo_asignacion_id = @operativo_asignacion_id OR @operativo_asignacion_id = -1)
		AND (operativo_id = @operativo_id OR @operativo_id = -1)
		AND (oa.inspector_id = @inspector_id OR @inspector_id = -1)
		AND (oa.oas_cve_edorep=@cve_edorep OR @cve_edorep=-1)
		AND (oa.oas_cve_ur=@cve_ur OR @cve_ur=-1)
	ORDER BY cen_cve_edorep, cu.cve_ur
END
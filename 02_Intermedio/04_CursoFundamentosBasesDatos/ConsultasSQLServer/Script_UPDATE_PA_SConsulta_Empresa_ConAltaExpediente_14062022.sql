USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SConsulta_Empresa_ConAltaExpediente]    Script Date: 14/06/2022 05:01:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Carlos Soto
-- Create date: 26/10/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_SConsulta_Empresa_ConAltaExpediente]
	@ct_id				int			=-1,
	@emp_nombre			varchar(255)= '',
	@emp_rfc			varchar(13)	= '',	
	@ct_imss_registro	varchar(11)	= '',
	@ct_calle			varchar(100)= '',
	@ct_cve_edorep		smallint	= -1,
	@ct_cve_municipio	smallint	= -1,
	@expediente_id		int			= -1
AS
BEGIN
	SET NOCOUNT ON;

	SELECT  
		se.inspeccion_id,
		ct.dct_razon_social as ct_nombre,
		dct_rfc as se_ct_rfc,
		se.se_ct_domicilio,
		ct.dct_dne_centro_trabajo_id as centro_trabajo_id,
		se.se_ct_nombre,
		--ct.dct_imss_registro as ct_imss_registro,
		ct.dct_cve_edorep as ct_cve_edorep,
		ct.dct_cve_municipio as ct_cve_municipio
	into #resultado
	FROM
		dbo.s_expediente se
		INNER JOIN dbo.inspeccion insp ON insp.inspeccion_id = se.inspeccion_id
		INNER JOIN dbo.materia mat ON mat.materia_id = insp.materia_id	
		INNER JOIN dbo.desahogo d ON insp.inspeccion_id = d.inspeccion_id
		INNER JOIN dbo.dshgo_centro_trabajo ct ON ct.desahogo_id = d.desahogo_id
	WHERE	(se.s_expediente_id = @expediente_id OR @expediente_id = -1)
		AND (se.se_ct_razon_social LIKE '%' + @emp_nombre + '%' OR @emp_nombre ='')
		AND	(se.se_ct_rfc LIKE '%' + @emp_rfc + '%' OR @emp_rfc ='')
		AND	(se.se_ct_domicilio LIKE '%' + @ct_calle + '%' OR @ct_calle ='')
		AND	(ct.dct_imss_registro LIKE '%' + @ct_imss_registro + '%' OR @ct_imss_registro ='')
		AND (ct.dct_cve_edorep = @ct_cve_edorep OR @ct_cve_edorep = -1)
		AND (ct.dct_cve_municipio = @ct_cve_municipio OR @ct_cve_municipio = -1)
		AND EXISTS(Select s_expediente_etapa_id from dbo.s_expediente_etapa see where see.s_expediente_id = se.s_expediente_id and see.see_estatus = 2)

	SELECT
		inspeccion_id,
		ct_nombre,
		se_ct_rfc,
		se_ct_domicilio,
		centro_trabajo_id,
		se_ct_nombre,
		--ct_imss_registro,
		ct_cve_edorep,
		ct_cve_municipio,
		count(ct_nombre) as contador
	from
		#resultado
	group by
		ct_nombre,
		se_ct_rfc,
		se_ct_domicilio,
		centro_trabajo_id,
		se_ct_nombre,
		--ct_imss_registro,
		ct_cve_edorep,
		ct_cve_municipio,
		inspeccion_id

END














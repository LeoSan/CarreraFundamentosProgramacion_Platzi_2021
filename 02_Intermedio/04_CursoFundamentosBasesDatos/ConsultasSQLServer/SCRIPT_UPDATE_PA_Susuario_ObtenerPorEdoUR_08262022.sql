USE [SSI_DB_SIAPI_REFESSATV2]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Soto
-- Create date: 2012-10-08
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_Susuario_ObtenerPorEdoUR]
	@s_usuario_id		int			= -1,
	@susr_ur			int	=-1,
	@susr_edorep		int=-1,
	@txt_search     varchar(255) = null
AS
BEGIN
	SET NOCOUNT ON;
	
	
	SELECT 
	us.s_usuario_id,us.core_usuario_id,us.s_perfil_id, us.cve_ur, us.cve_edorep, susr_nombre, susr_primer_apellido, susr_segundo_apellido, susr_puesto, susr_login, susr_password, susr_email, susr_telefono, susr_fec_creacion, susr_fec_modificacion, susr_estatus, sprf_descripcion,
	cur.cur_descripcion,
	ISNULL(dbo.s_participante.spar_es_firmante,0) as firmante,
	ISNULL(dbo.s_participante.s_participante_id,0) as participante
	INTO #TABLA1
	 FROM dbo.s_usuario us
	 INNER JOIN dbo.s_perfil 
		ON dbo.s_perfil.s_perfil_id = us.s_perfil_id
	LEFT JOIN dbo.s_participante
	 ON dbo.s_participante.s_usuario_id=us.s_usuario_id
	INNER JOIN dbo.cat_unidad_respon cur
		ON cur.cur_cve_ur=us.cve_ur AND cur.cur_descrip_corta like 'DFT%'
		
	WHERE (us.cve_ur = @susr_ur OR @susr_ur = -1)
		AND (us.s_usuario_id = @s_usuario_id OR @s_usuario_id = -1)
		AND (us.cve_edorep = @susr_edorep OR @susr_edorep = -1)
		AND (us.susr_estatus <> 'Ninguno')
		-- AND (us.susr_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR us.susr_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR us.susr_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR cur.cur_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR sprf_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%')
		AND ((CONCAT(us.susr_nombre, ' ', us.susr_primer_apellido, ' ',us.susr_segundo_apellido,' ',cur.cur_descripcion, ' ', sprf_descripcion  ) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)

	ORDER BY us.cve_ur,us.s_perfil_id,susr_nombre;
	
	
	SELECT 
	us.s_usuario_id,us.core_usuario_id, us.s_perfil_id, us.cve_ur, us.cve_edorep, susr_nombre, susr_primer_apellido, susr_segundo_apellido, susr_puesto, susr_login, susr_password, susr_email, susr_telefono, susr_fec_creacion, susr_fec_modificacion, susr_estatus, sprf_descripcion,
	cur.cur_descripcion,
	ISNULL(dbo.s_participante.spar_es_firmante,0) as firmante,
	ISNULL(dbo.s_participante.s_participante_id,0) as participante
	INTO #TABLA2
	 FROM dbo.s_usuario us
	 INNER JOIN dbo.s_perfil 
		ON dbo.s_perfil.s_perfil_id = us.s_perfil_id
	LEFT JOIN dbo.s_participante
	 ON dbo.s_participante.s_usuario_id=us.s_usuario_id
	INNER JOIN dbo.cat_unidad_respon cur

		ON cur.cur_cve_ur=us.cve_ur AND (cur.cur_descrip_corta LIKE '%SUB. FED. TRAB.%' OR cur.cur_descrip_corta LIKE '%SDF%') 
	WHERE (us.cve_ur = @susr_ur OR @susr_ur = -1)
		AND (us.s_usuario_id = @s_usuario_id OR @s_usuario_id = -1)
		AND (us.cve_edorep = @susr_edorep OR @susr_edorep = -1)
		AND (us.susr_estatus <> 'Ninguno')
		--AND (us.susr_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR us.susr_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR us.susr_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR cur.cur_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR sprf_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%')
		AND ((CONCAT(us.susr_nombre, ' ', us.susr_primer_apellido, ' ',us.susr_segundo_apellido,' ',cur.cur_descripcion, ' ', sprf_descripcion  ) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
	ORDER BY us.cve_ur,us.s_perfil_id,susr_nombre;
	
	SELECT 
	us.s_usuario_id,us.core_usuario_id, us.s_perfil_id, us.cve_ur, us.cve_edorep, susr_nombre, susr_primer_apellido, susr_segundo_apellido, susr_puesto, susr_login, susr_password, susr_email, susr_telefono, susr_fec_creacion, susr_fec_modificacion, susr_estatus, sprf_descripcion,
	cur.cur_descripcion,
	ISNULL(dbo.s_participante.spar_es_firmante,0) as firmante,
	ISNULL(dbo.s_participante.s_participante_id,0) as participante
	INTO #TABLA3
	 FROM dbo.s_usuario us
	 INNER JOIN dbo.s_perfil 
		ON dbo.s_perfil.s_perfil_id = us.s_perfil_id
	LEFT JOIN dbo.s_participante
	 ON dbo.s_participante.s_usuario_id=us.s_usuario_id
	INNER JOIN dbo.cat_unidad_respon cur

		ON cur.cur_cve_ur=us.cve_ur AND (cur_descrip_corta LIKE '%OFIC. FED. TRAB.%' OR cur_descrip_corta LIKE '%OFT%' OR cur_descrip_corta LIKE '%ODFT%' )
	WHERE (us.cve_ur = @susr_ur OR @susr_ur = -1)
		AND (us.s_usuario_id = @s_usuario_id OR @s_usuario_id = -1)
		AND (us.cve_edorep = @susr_edorep OR @susr_edorep = -1)
		AND (us.susr_estatus <> 'Ninguno')
		-- AND (us.susr_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR us.susr_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR us.susr_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR cur.cur_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR sprf_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%')
		AND ((CONCAT(us.susr_nombre, ' ', us.susr_primer_apellido, ' ',us.susr_segundo_apellido,' ',cur.cur_descripcion, ' ', sprf_descripcion  ) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
	ORDER BY us.cve_ur,us.s_perfil_id,susr_nombre;
	
	SELECT 
	us.s_usuario_id,us.core_usuario_id, us.s_perfil_id, us.cve_ur, us.cve_edorep, susr_nombre, susr_primer_apellido, susr_segundo_apellido, susr_puesto, susr_login, susr_password, susr_email, susr_telefono, susr_fec_creacion, susr_fec_modificacion, susr_estatus, sprf_descripcion,
	cur.cur_descripcion,
	ISNULL(dbo.s_participante.spar_es_firmante,0) as firmante,
	ISNULL(dbo.s_participante.s_participante_id,0) as participante
	INTO #TABLA4
	 FROM dbo.s_usuario us
	 INNER JOIN dbo.s_perfil 
		ON dbo.s_perfil.s_perfil_id = us.s_perfil_id
	LEFT JOIN dbo.s_participante
	 ON dbo.s_participante.s_usuario_id=us.s_usuario_id
	INNER JOIN dbo.cat_unidad_respon cur

		ON cur.cur_cve_ur=us.cve_ur 
		AND 
		(cur_descrip_corta not like 'DFT%' AND (cur_descrip_corta not LIKE '%SUB. FED. TRAB.%' and  cur_descrip_corta not LIKE '%SDF%') and 
	(cur_descrip_corta not LIKE '%OFIC. FED. TRAB.%' and  cur_descrip_corta not LIKE '%OFT%' and  cur_descrip_corta not LIKE '%ODFT%' ))
	WHERE (us.cve_ur = @susr_ur OR @susr_ur = -1)
		AND (us.s_usuario_id = @s_usuario_id OR @s_usuario_id = -1)
		AND (us.cve_edorep = @susr_edorep OR @susr_edorep = -1)
		AND (us.susr_estatus <> 'Ninguno')
		-- AND (us.susr_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR us.susr_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR us.susr_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR cur.cur_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR sprf_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%')
		AND ((CONCAT(us.susr_nombre, ' ', us.susr_primer_apellido, ' ',us.susr_segundo_apellido,' ',cur.cur_descripcion, ' ', sprf_descripcion  ) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
	ORDER BY us.cve_ur,us.s_perfil_id,susr_nombre;
	
	SELECT * FROM #TABLA1
	UNION ALL
	SELECT * FROM #TABLA2
	UNION ALL
	SELECT * FROM #TABLA3
	UNION ALL
	SELECT * FROM #TABLA4
	
END
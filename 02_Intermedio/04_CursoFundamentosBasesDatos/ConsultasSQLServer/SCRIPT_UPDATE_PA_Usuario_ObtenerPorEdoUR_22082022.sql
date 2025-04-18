USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Usuario_ObtenerPorEdoUR]    Script Date: 22/08/2022 05:24:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ana karina Acosta	
-- Create date: 15/11/2011
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_Usuario_ObtenerPorEdoUR]
	@usuario_id		int			= -1,
	@usr_ur			int	=-1,
	@usr_edorep		int=-1,
	@txt_search     varchar(255) = null
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
	us.usuario_id,us.core_usuario_id, us.perfil_id, us.cve_ur, us.cve_edorep, usr_nombre, usr_primer_apellido, usr_segundo_apellido, usr_puesto, usr_login, usr_password, usr_email, usr_telefono, usr_fec_creacion, usr_fec_modificacion, usr_estatus,prf_descripcion,
	cur.cur_descripcion,
	ISNULL(dbo.participante.par_es_resp_juridico,0) as resp_juridico,
	ISNULL(dbo.participante.par_es_firmante,0) as firmante,
	ISNULL(dbo.participante.participante_id,0) as participante
	INTO #TABLA1
	 FROM dbo.usuario us
	 INNER JOIN dbo.perfil 
		ON dbo.perfil.perfil_id = us.perfil_id
	LEFT JOIN dbo.participante
	 ON dbo.participante.usuario_id=us.usuario_id
	INNER JOIN dbo.cat_unidad_respon cur
		ON cur.cur_cve_ur=us.cve_ur AND cur.cur_descrip_corta like 'DFT%'
		
	WHERE (us.cve_ur = @usr_ur OR @usr_ur = -1)
		AND (us.usuario_id = @usuario_id OR @usuario_id = -1)
		AND (us.cve_edorep = @usr_edorep OR @usr_edorep = -1)
		AND (us.usr_estatus <> 'Ninguno')
		AND (CONCAT(us.usr_nombre, ' ', us.usr_primer_apellido, ' ',us.usr_segundo_apellido, ' ', cur.cur_descripcion, ' ', prf_descripcion) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%'
		/*us.usr_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR us.usr_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR us.usr_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR cur.cur_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR prf_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%'*/)
	ORDER BY us.cve_ur,us.perfil_id,usr_nombre;
	
	
	SELECT 
	us.usuario_id,us.core_usuario_id, us.perfil_id, us.cve_ur, us.cve_edorep, usr_nombre, usr_primer_apellido, usr_segundo_apellido, usr_puesto, usr_login, usr_password, usr_email, usr_telefono, usr_fec_creacion, usr_fec_modificacion, usr_estatus,prf_descripcion,
	cur.cur_descripcion,
	ISNULL(dbo.participante.par_es_resp_juridico,0) as resp_juridico,
	ISNULL(dbo.participante.par_es_firmante,0) as firmante,ISNULL(dbo.participante.participante_id,0) as participante
	INTO #TABLA2
	 FROM dbo.usuario us
	 INNER JOIN dbo.perfil 
		ON dbo.perfil.perfil_id = us.perfil_id
		LEFT JOIN dbo.participante
	 ON dbo.participante.usuario_id=us.usuario_id
	INNER JOIN dbo.cat_unidad_respon cur
		ON cur.cur_cve_ur=us.cve_ur AND (cur.cur_descrip_corta LIKE '%SUB. FED. TRAB.%' OR cur.cur_descrip_corta LIKE '%SDF%') 
	WHERE (us.cve_ur = @usr_ur OR @usr_ur = -1)
		AND (us.usuario_id = @usuario_id OR @usuario_id = -1)
		AND (us.cve_edorep = @usr_edorep OR @usr_edorep = -1)
		AND (us.usr_estatus <> 'Ninguno')
		AND (CONCAT(us.usr_nombre, ' ', us.usr_primer_apellido, ' ',us.usr_segundo_apellido, ' ', cur.cur_descripcion, ' ', prf_descripcion) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%'
		/*us.usr_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR us.usr_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR us.usr_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR cur.cur_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR prf_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%'*/ )
	ORDER BY us.cve_ur,us.perfil_id,usr_nombre;
	
	SELECT 
	us.usuario_id,us.core_usuario_id, us.perfil_id, us.cve_ur, us.cve_edorep, usr_nombre, usr_primer_apellido, usr_segundo_apellido, usr_puesto, usr_login, usr_password, usr_email, usr_telefono, usr_fec_creacion, usr_fec_modificacion, usr_estatus,prf_descripcion,
	cur.cur_descripcion,
	ISNULL(dbo.participante.par_es_resp_juridico,0) as resp_juridico,
	ISNULL(dbo.participante.par_es_firmante,0) as firmante,ISNULL(dbo.participante.participante_id,0) as participante
	INTO #TABLA3
	 FROM dbo.usuario us
	 INNER JOIN dbo.perfil 
		ON dbo.perfil.perfil_id = us.perfil_id
		LEFT JOIN dbo.participante
	 ON dbo.participante.usuario_id=us.usuario_id
	INNER JOIN dbo.cat_unidad_respon cur
		ON cur.cur_cve_ur=us.cve_ur AND (cur_descrip_corta LIKE '%OFIC. FED. TRAB.%' OR cur_descrip_corta LIKE '%OFT%' OR cur_descrip_corta LIKE '%ODFT%' )
	WHERE (us.cve_ur = @usr_ur OR @usr_ur = -1)
		AND (us.usuario_id = @usuario_id OR @usuario_id = -1)
		AND (us.cve_edorep = @usr_edorep OR @usr_edorep = -1)
		AND (us.usr_estatus <> 'Ninguno')
		AND (CONCAT(us.usr_nombre, ' ', us.usr_primer_apellido, ' ',us.usr_segundo_apellido, ' ', cur.cur_descripcion, ' ', prf_descripcion) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%'  
		/*us.usr_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR us.usr_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR us.usr_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR cur.cur_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' 
		OR prf_descripcion  COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%'*/)
	ORDER BY us.cve_ur,us.perfil_id,usr_nombre;
	
	SELECT 
	us.usuario_id,us.core_usuario_id, us.perfil_id, us.cve_ur, us.cve_edorep, usr_nombre, usr_primer_apellido, usr_segundo_apellido, usr_puesto, usr_login, usr_password, usr_email, usr_telefono, usr_fec_creacion, usr_fec_modificacion, usr_estatus,prf_descripcion,
	cur.cur_descripcion,
	ISNULL(dbo.participante.par_es_resp_juridico,0) as resp_juridico,
	ISNULL(dbo.participante.par_es_firmante,0) as firmante,ISNULL(dbo.participante.participante_id,0) as participante
	INTO #TABLA4
	 FROM dbo.usuario us
	 INNER JOIN dbo.perfil 
		ON dbo.perfil.perfil_id = us.perfil_id
		LEFT JOIN dbo.participante
	 ON dbo.participante.usuario_id=us.usuario_id
	INNER JOIN dbo.cat_unidad_respon cur
		ON cur.cur_cve_ur=us.cve_ur 
		AND 
		(cur_descrip_corta not like 'DFT%' AND (cur_descrip_corta not LIKE '%SUB. FED. TRAB.%' and  cur_descrip_corta not LIKE '%SDF%') and 
	(cur_descrip_corta not LIKE '%OFIC. FED. TRAB.%' and  cur_descrip_corta not LIKE '%OFT%' and  cur_descrip_corta not LIKE '%ODFT%' ))
	WHERE (us.cve_ur = @usr_ur OR @usr_ur = -1)
		AND (us.usuario_id = @usuario_id OR @usuario_id = -1)
		AND (us.cve_edorep = @usr_edorep OR @usr_edorep = -1)
		AND (us.usr_estatus <> 'Ninguno')
		AND (
		CONCAT(us.usr_nombre, ' ', us.usr_primer_apellido, ' ',us.usr_segundo_apellido, ' ', cur.cur_descripcion, ' ', prf_descripcion) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%'  
      /* us.usr_nombre  LIKE '%'+@txt_search+'%' 
		OR us.usr_primer_apellido  LIKE '%'+@txt_search+'%' 
		OR us.usr_segundo_apellido  LIKE '%'+@txt_search+'%' 
		OR cur.cur_descripcion   LIKE '%'+@txt_search+'%' 
		OR prf_descripcion  LIKE '%'+@txt_search+'%'*/)
	ORDER BY us.cve_ur,us.perfil_id,usr_nombre;
	
	SELECT * FROM #TABLA1
	UNION ALL
	SELECT * FROM #TABLA2
	UNION ALL
	SELECT * FROM #TABLA3
	UNION ALL
	SELECT * FROM #TABLA4
	
END
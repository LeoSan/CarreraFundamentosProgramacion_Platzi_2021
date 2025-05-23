USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Participante_Obtener]    Script Date: 22/12/2022 02:17:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ariana Duarte
-- Create date: 15/11/2011
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Participante_Obtener] --11,-1,-1
	@participante_id	     int = -1,
	@cve_edorep			     int = -1,
	@cve_ur				     int = -1,
	@inspector_id		     int = -1,
	@dpart_tipo_participante int = -1,
	@estatus                 int = -1,
	@txt_search     varchar(255) = null,
	@usr_estatus    varchar(255) = null
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT *,
		CASE par_es_inspector
			WHEN 1 THEN 'Inspector' 
			ELSE CASE par_es_notificador
				WHEN 1 THEN 'Notificador'
				ELSE CASE par_es_firmante
					WHEN 1 THEN 'Firmante'
					ELSE CASE par_es_resp_juridico
						WHEN 1 THEN 'Responsable jurídico' 
						ELSE CASE par_es_dictaminador
						WHEN 1 THEN 'Dictaminador' END END END END END tipo,
		CASE par_estatus
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo' END estatus,
			ISNULL(par_nombre, '') + ' ' + ISNULL(par_primer_apellido, '') + ' ' + ISNULL(par_segundo_apellido, '') as nombre, 
		CONVERT(varchar(10), insp_fec_expedicion, 103) fec_expedicion,
		CONVERT(varchar(10), insp_fec_inicio, 103) fec_inicio,
		CONVERT(varchar(10), insp_fec_termino, 103) fec_termino
	FROM dbo.participante par
	INNER JOIN dbo.catalogo_ur ur
		ON ur.cve_ur = par.cve_ur
	LEFT JOIN dbo.inspector insp
		ON insp.inspector_id = par.inspector_id
	LEFT JOIN dbo.usuario us on par.usuario_id = us.usuario_id
	WHERE (participante_id = @participante_id OR @participante_id = -1)
		AND (par.cve_edorep = @cve_edorep OR @cve_edorep = -1)
		AND (par.inspector_id	 = @inspector_id	 OR @inspector_id	 = -1)
		AND (par.cve_ur	 = @cve_ur	 OR @cve_ur	 = -1)
		AND ((par_es_dictaminador = 1 OR par_es_inspector = 1 OR par_es_notificador =1) AND @dpart_tipo_participante = 5 OR @dpart_tipo_participante = -1)
		AND (par.par_estatus = @estatus OR @estatus = -1)
		AND (us.usr_estatus = @usr_estatus OR @usr_estatus IS NULL)
		AND ((CONCAT(us.usr_nombre, ' ', us.usr_primer_apellido, ' ',us.usr_segundo_apellido) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
	ORDER BY par_nombre
	
	SELECT *,
		ISNULL(par.par_nombre, '') + ' ' + ISNULL(par.par_primer_apellido, '') + ' ' + ISNULL(par.par_segundo_apellido, '') nombre_completo, us.usr_email
	FROM dbo.participante par 
	LEFT JOIN dbo.usuario us on par.usuario_id = us.usuario_id
	
	WHERE par.perfil_id = 2 AND par.par_estatus = 1
		AND (par.cve_ur	 = @cve_ur	 OR @cve_ur	 = -1)
		AND (us.usr_estatus = @usr_estatus OR @usr_estatus IS NULL)
		AND ((CONCAT(par.par_nombre, ' ', par.par_primer_apellido, ' ',par.par_segundo_apellido) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
		--AND ((par.par_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR par.par_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR par.par_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
	
	--INSPECTORES Y NOTIFICADORES
	SELECT *,
		ISNULL(par.par_nombre, '') + ' ' + ISNULL(par.par_primer_apellido, '') + ' ' + ISNULL(par.par_segundo_apellido, '') nombre_completo, us.usr_email
	FROM dbo.participante par
	LEFT JOIN dbo.usuario us on par.usuario_id = us.usuario_id
	
	WHERE (par.par_es_inspector = 1 OR par.par_es_notificador = 1) AND par.par_estatus = 1
		AND (par.cve_ur	 = @cve_ur	 OR @cve_ur	 = -1)
		AND (par.inspector_id	 = @inspector_id	 OR @inspector_id	 = -1)
		AND (us.usr_estatus = @usr_estatus OR @usr_estatus IS NULL)
		AND ((CONCAT(par.par_nombre, ' ', par.par_primer_apellido, ' ',par.par_segundo_apellido) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
		--AND ((par.par_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR par.par_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR par.par_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
		
	--RESPONSABLES JURIDICOS
	SELECT *,
		ISNULL(par.par_nombre, '') + ' ' + ISNULL(par.par_primer_apellido, '') + ' ' + ISNULL(par.par_segundo_apellido, '') nombre_completo, us.usr_email
	FROM dbo.participante par
	LEFT JOIN dbo.usuario us on par.usuario_id = us.usuario_id
	WHERE par.par_es_resp_juridico = 1 AND par.par_estatus = 1
		AND (par.cve_ur	 = @cve_ur	 OR @cve_ur	 = -1)
		AND (par.inspector_id	 = @inspector_id	 OR @inspector_id	 = -1)
		AND ((CONCAT(par.par_nombre, ' ', par.par_primer_apellido, ' ',par.par_segundo_apellido) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
		--AND ((par.par_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR par.par_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR par.par_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
		
	--FIRMANTES
	SELECT *,
		ISNULL(par.par_nombre, '') + ' ' + ISNULL(par.par_primer_apellido, '') + ' ' + ISNULL(par.par_segundo_apellido, '') nombre_completo, us.usr_email
	FROM dbo.participante par
	LEFT JOIN dbo.usuario us on par.usuario_id = us.usuario_id
	WHERE par.par_es_firmante = 1 AND par.par_estatus = 1
		AND (par.cve_ur	 = @cve_ur	 OR @cve_ur	 = -1)
		AND (par.inspector_id	 = @inspector_id	 OR @inspector_id	 = -1)
		AND ((CONCAT(par.par_nombre, ' ', par.par_primer_apellido, ' ',par.par_segundo_apellido) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
		--AND ((par.par_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR par.par_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR par.par_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
END


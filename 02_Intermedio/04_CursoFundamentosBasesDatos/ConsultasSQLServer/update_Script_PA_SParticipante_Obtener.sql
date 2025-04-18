USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SParticipante_Obtener]    Script Date: 17/05/2022 11:27:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		gabriel c
-- Create date: 11/10/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_SParticipante_Obtener]
	@s_participante_id	int = -1, 
	@s_perfil_id		int = -1, --Mod JC[20121025]
	@spar_es_firmante	int = -1, --Mod JC[20121030]
	@spar_es_reviso		int = -1, --Mod JC[20121030]
	@spar_es_elaboro	int = -1, --Mod JC[20121030]
	@cur_cve_ur			int = -1, --Mod JM[20121031]
	@cve_edorep			int = -1,
	@spar_estatus		int = -1,
	@txt_search         varchar(255) = null
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		par.spar_nombre + ' ' + par.spar_primer_apellido + ' ' + par.spar_segundo_apellido as nombre,
		case par.spar_estatus 
			when 1 then 'Activo'
			when 0 then 'Inactivo'
		end as estatus,
		case spar_es_elaboro when 1 then 'Elaboró' end as elaboro,
		case spar_es_firmante when 1 then 'Firmante' end as firmante,
		case spar_es_reviso when 1 then 'Revisó' end as reviso,	
		cur.cur_descripcion,
		par.*,
		usu.core_usuario_id,
		usu.susr_email,
		(select COUNT(s_expediente_etapa_id) from s_expediente_etapa see where see.responsable_atencion_id= par.s_participante_id) as expedientes
	FROM 
		s_participante par 
		inner join s_usuario usu ON par.s_usuario_id = usu.s_usuario_id
		left join cat_unidad_respon cur on par.cve_ur = cur.cur_cve_ur

	WHERE	
		(par.cve_edorep = @cve_edorep or @cve_edorep = -1)
		AND (cur.cur_cve_ur = @cur_cve_ur or @cur_cve_ur = -1)
		AND	(par.s_participante_id = @s_participante_id OR @s_participante_id = -1)
		AND	(par.spar_es_elaboro = 1 OR par.spar_es_reviso = 1)
		AND (usu.susr_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR usu.susr_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR usu.susr_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR @txt_search IS NULL)

END
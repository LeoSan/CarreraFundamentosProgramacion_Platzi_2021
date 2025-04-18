USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SParticipante_Obtener]    Script Date: 20/10/2022 06:45:11 p. m. ******/
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
	@txt_search         varchar(255) = '-1',
    @see_estatus        int = -1
AS
BEGIN
	SET NOCOUNT ON;


	DECLARE @usr_estatus varchar(255) = '';
	IF(@spar_estatus = 1)
		SET @usr_estatus = 'Activo';
	ELSE IF(@spar_estatus = 0)
		SET @usr_estatus = 'Inactivo';

IF (@txt_search = '-1')
	select 
		par.spar_nombre + ' ' + par.spar_primer_apellido + ' ' + par.spar_segundo_apellido as nombre,
		ISNULL(par.spar_prefijo_titulo,'')+' '+ ISNULL(par.spar_nombre,'') + ' ' + ISNULL(par.spar_primer_apellido,'') + ' ' + ISNULL(par.spar_segundo_apellido,'') as prefijo_nombre,
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
		(select COUNT(s_expediente_etapa_id) from s_expediente_etapa see where see.responsable_atencion_id= par.s_participante_id AND (see.see_estatus = @see_estatus OR @see_estatus = -1)) as expedientes
	from 
		s_participante par 
		inner join s_usuario usu ON par.s_usuario_id = usu.s_usuario_id
		left join cat_unidad_respon cur on par.cve_ur = cur.cur_cve_ur
	where	(par.cve_edorep = @cve_edorep or @cve_edorep = -1)
		
		AND (cur.cur_cve_ur = @cur_cve_ur or @cur_cve_ur = -1)
		AND	(par.s_participante_id = @s_participante_id OR @s_participante_id = -1)
		AND	(par.s_perfil_id = @s_perfil_id OR @s_perfil_id = -1)				--Mod JC[20121025]
		AND	(par.spar_es_elaboro = @spar_es_elaboro OR @spar_es_elaboro = -1)	--Mod JC[20121030]
		AND	(par.spar_es_firmante = @spar_es_firmante OR @spar_es_firmante = -1)--Mod JC[20121030]
		AND	(par.spar_es_reviso = @spar_es_reviso OR @spar_es_reviso = -1)		--Mod JC[20121030]
		AND	(par.spar_estatus = @spar_estatus OR @spar_estatus = -1)		--Mod JC[20121030]
		AND	(usu.susr_estatus = @usr_estatus OR @usr_estatus = '')
		ORDER BY nombre
ELSE 
	select 
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
	from 
		s_participante par 
		inner join s_usuario usu ON par.s_usuario_id = usu.s_usuario_id
		left join cat_unidad_respon cur on par.cve_ur = cur.cur_cve_ur

	WHERE	
		(par.cve_edorep = @cve_edorep or @cve_edorep = -1)
		AND (cur.cur_cve_ur = @cur_cve_ur or @cur_cve_ur = -1)
		AND	(par.s_participante_id = @s_participante_id OR @s_participante_id = -1)
		AND	(par.spar_estatus = @spar_estatus OR @spar_estatus = -1)
		--AND	(par.spar_es_elaboro = 1 OR par.spar_es_reviso = 1) /*Se quita ya que no deberia existir alguna restrincción para ver los usuarios*/
		--AND (usu.susr_nombre COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR usu.susr_primer_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR usu.susr_segundo_apellido COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%' OR @txt_search IS NULL) /*No permitia la busqueda adecuada buscando por nombre de usuario de forma completa*/
		AND ((CONCAT(usu.susr_nombre, ' ', usu.susr_primer_apellido, ' ',usu.susr_segundo_apellido, ' ', cur.cur_descripcion) COLLATE SQL_Latin1_General_Cp1_CI_AI LIKE '%'+@txt_search+'%') OR @txt_search IS NULL)
		AND	(usu.susr_estatus = @usr_estatus OR @usr_estatus = '') 
		ORDER BY nombre
END
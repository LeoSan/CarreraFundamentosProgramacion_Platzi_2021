USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_InspecParticipante_ObtenerPorTipo]    Script Date: 20/10/2022 06:57:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












-- =============================================
-- Author:		Gabriel Castillo
-- Create date: 30/11/2011
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_InspecParticipante_ObtenerPorTipo] --1,-1,0,-1
	-- Add the parameters for the stored procedure here
	@par_es_inspector INT =-1,
	@par_es_notificador  INT =-1,
	@par_es_firmante  INT =-1,
	@cve_ur int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	
	SELECT p.*,
			par_nombre + ' ' + par_primer_apellido + ' ' + ISNULL(par_segundo_apellido,'') as nombre,
			cur.ur_nombre, 
			us.usr_email, us.core_usuario_id 
		from
		participante p
		INNER JOIN dbo.usuario us on p.usuario_id = us.usuario_id
		AND us.usr_estatus = 'Activo'
		left join dbo.catalogo_ur cur
		on cur.cve_ur = p.cve_ur
		--LEFT JOIN dbo.inspector insp
		--ON insp.inspector_id = p.inspector_id and insp.insp_estatus = 1
		
		where
			(par_es_inspector = @par_es_inspector or @par_es_inspector =-1) AND
			(par_es_notificador = @par_es_notificador or @par_es_notificador = -1) AND
			(par_es_firmante = @par_es_firmante or @par_es_firmante= -1) AND
			(p.cve_ur = @cve_ur or  @cve_ur =-1)
			and 
			p.par_estatus=1 and par_es_resp_juridico=0 and (par_es_dictaminador is null or par_es_dictaminador =0)
			ORDER BY nombre
	
	
END

--select * FROM participante where par_es_notificador=1 AND par_estatus=1
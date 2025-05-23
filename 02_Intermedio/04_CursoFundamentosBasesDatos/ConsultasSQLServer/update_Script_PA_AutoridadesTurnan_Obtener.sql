USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_AutoridadesTurnan_Obtener]    Script Date: 17/05/2022 02:04:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		gabriel c
-- Create date: 08/10/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_AutoridadesTurnan_Obtener] 
	-- Add the parameters for the stored procedure here
	@cve_edorep int = -1,
	@cve_ur int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here ADD MMC 07-OCTUBRE-2015
    -- para subsanar el error en la Solicitud de Notificacion
    -- que reportó la Lic.Palatto en el SIPAS REFESSAT
    IF (@cve_ur = 117)
	   SET @cve_ur = 210
	   
	
	SELECT 
		p.participante_id,
		ISNULL(p.par_nombre,'') + ' ' + 
		ISNULL(p.par_primer_apellido,'') + ' ' + 
		ISNULL(p.par_segundo_apellido,'') as nombre,
		p.par_puesto as puesto,
		p.par_area_juridica as area,
		cur.cur_descripcion as ur,
		case p.par_estatus 
			when 1 then 'Activo'
			when 0 then 'Inactivo'
		End as estatus
		
	FROM 
		participante p left join 
		cat_unidad_respon cur on p.cve_ur = cur.cur_cve_ur 
	WHERE 
		par_es_firmante =1 
		--AND par_estatus = 1 
		AND 
		(cve_edorep =@cve_edorep or @cve_edorep=-1)
		AND (cur.cur_cve_ur = @cve_ur or @cve_ur =-1)
END










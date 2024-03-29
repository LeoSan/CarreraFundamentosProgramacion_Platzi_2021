USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SExpediente_ObtenerUltimaEtapa]    Script Date: 13/09/2022 05:24:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ernesto
-- Create date: 29/10/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_SExpediente_ObtenerUltimaEtapa]
	-- Add the parameters for the stored procedure here
	@s_expediente_id int = -1,
	@see_estatus    int = -1,
	@setapa_nivel	int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
    DECLARE @ultimaEtapa_id int;
    
    select top 1
		*,
		(select top 1 
			setapa_nombre 
			from dbo.inspeccion as i 
			left join dbo.s_expediente s_e on i.inspeccion_id = s_e.inspeccion_id
			left join dbo.s_expediente_etapa s_e_etapa on s_e_etapa.s_expediente_id = s_e.s_expediente_id
			left join dbo.s_etapa et on et.s_etapa_id = s_e_etapa.s_etapa_id
			WHERE s_e.s_expediente_id  = @s_expediente_id and setapa_nombre <> 'Solicitud de notificación' and setapa_nombre <> 'Resultado de la notificación'
			order by s_expediente_etapa_id desc ) etapa_padre
    from dbo.s_expediente_etapa  se
		inner join dbo.s_etapa etapa on  se.s_etapa_id = etapa.s_etapa_id
		inner join dbo.s_expediente ex	on ex.s_expediente_id = se.s_expediente_id
    where	se.s_expediente_id = @s_expediente_id
		and (see_estatus = @see_estatus or @see_estatus = -1)
		and (setapa_nivel = @setapa_nivel or @setapa_nivel = -1)
    order by s_expediente_etapa_id desc




		
    

    

END













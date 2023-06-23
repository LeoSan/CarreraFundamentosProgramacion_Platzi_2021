USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		SAID AND LEO
-- Create date: 2022-07-08
-- Description:	
-- =============================================

CREATE PROCEDURE [dbo].[PA_ConsultaEtapaPadreNotificacion] 
	@s_expediente_id int = -1
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @s_etapa_nombre VARCHAR(100) = ''
	
-- Obtengo la etapa actual 
	SELECT top 1 
		@s_etapa_nombre = setapa_nombre  
		FROM dbo.s_expediente as s_e 
		left join dbo.s_expediente_etapa s_e_etapa on s_e_etapa.s_expediente_id = s_e.s_expediente_id
		left join dbo.s_etapa et on et.s_etapa_id = s_e_etapa.s_etapa_id
		WHERE s_e.s_expediente_id = @s_expediente_id
		order by s_expediente_etapa_id desc	

	IF (@s_etapa_nombre <> '' AND @s_etapa_nombre = 'Solicitud de notificación' OR  @s_etapa_nombre = 'Resultado de la notificación' )
		BEGIN
		-- Obtengo la etapa padre para las notificaciones 
			SELECT top 1 
					setapa_nombre AS etapa_padre
					FROM dbo.s_expediente as s_e
					left join dbo.s_expediente_etapa s_e_etapa on s_e_etapa.s_expediente_id = s_e.s_expediente_id
					left join dbo.s_etapa et on et.s_etapa_id = s_e_etapa.s_etapa_id
					WHERE s_e.s_expediente_id = @s_expediente_id and setapa_nombre <> 'Solicitud de notificación' and setapa_nombre <> 'Resultado de la notificación'
					order by s_expediente_etapa_id desc;
		END
END














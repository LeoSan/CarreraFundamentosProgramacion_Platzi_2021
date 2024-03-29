USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_ObtenerFechasExpediente]    Script Date: 30/01/2023 02:55:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Said Guerrero>
-- Create date: <11-02-2022>
-- Description:	<PA para obtener fechas de creación de inspeccion, calificación y desahogo y su número de expediente>
-- =============================================
ALTER PROCEDURE [dbo].[PA_ObtenerFechasExpediente] 
	@inspeccion_id int = 1
AS
BEGIN
	SET NOCOUNT ON;
	SELECT c.calificacion_id,i.in_num_expediente as in_num_expediente
			, i.in_fec_inspeccion    as fecha_desahogo
			, i.sys_fec_insert       as fecha_programacion
			, c.calif_fec_asignacion as fecha_calificacion  
	FROM dbo.inspeccion as i
	LEFT JOIN desahogo as d ON d.inspeccion_id = i.inspeccion_id
	LEFT JOIN calificacion as c on d.desahogo_id = c.desahogo_id
	WHERE i.inspeccion_id = @inspeccion_id;
END


SELeCT * FROM dbo.desahogo 
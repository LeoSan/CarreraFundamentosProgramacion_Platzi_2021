USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Consulta_Centros_Trabajos_Colectivos]    Script Date: 08/03/2023 09:27:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PA_Consulta_Centros_Trabajos_Colectivos]
	@usuario_id int = -1
AS
BEGIN
SET NOCOUNT ON
 
	SELECT * ,
	
	(
		SELECT TOP 1 aa.inspeccion_id 
		FROM dbo.inspeccion as aa 
			WHERE aa.colectivo_id = a.colectivo_id 
				  AND (SELECT des.desahogo_id FROM dbo.desahogo as des WHERE des.inspeccion_id = aa.inspeccion_id) IS NULL
		ORDER BY aa.inspeccion_id ASC	
	) as secuencia_inspeccion_id

	FROM dbo.inspec_colectivo_inspecciones as a 
	WHERE a.usuario_id = @usuario_id ORDER BY a.fecha_creacion DESC
 
END



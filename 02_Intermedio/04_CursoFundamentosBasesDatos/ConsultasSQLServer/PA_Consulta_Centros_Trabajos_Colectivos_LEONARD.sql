USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Consulta_Centros_Trabajos_Colectivos]    Script Date: 14/03/2023 03:04:39 p. m. ******/
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
	(SELECT b.ct_nombre_comercial FROM db_dne.dbo.centro_trabajo b WHERE  b.centro_trabajo_id IN (SELECT TOP 1 aa.centro_trabajo_id FROM dbo.inspeccion as aa  WHERE colectivo_id = a.colectivo_id	AND ( (aa.in_etapa != 1 OR aa.in_etapa IS NULL ) AND  (aa.in_estatus!=0 OR aa.in_estatus IS NULL )  ))) as ct_nombre_comercial,
	(
		SELECT TOP 1 aa.inspeccion_id FROM dbo.inspeccion as aa  WHERE colectivo_id = 1	AND ( (aa.in_etapa != 1 OR aa.in_etapa IS NULL ) AND  (aa.in_estatus!=0 OR aa.in_estatus IS NULL )  )		
	) as secuencia_inspeccion_id

	FROM dbo.inspec_colectivo_inspecciones as a 
	WHERE a.usuario_id = @usuario_id AND  
		(
		SELECT  TOP 1 aa.inspeccion_id FROM dbo.inspeccion as aa  WHERE colectivo_id = a.colectivo_id	AND ( (aa.in_etapa != 1 OR aa.in_etapa IS NULL ) AND  (aa.in_estatus!=0 OR aa.in_estatus IS NULL )  )		
    	) > 0 ORDER BY a.fecha_creacion DESC
 
END



USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Obtener_Ultima_Inspeccion_Sin_Concluir_Colectiva]    Script Date: 09/03/2023 10:14:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PA_Obtener_Ultima_Inspeccion_Sin_Concluir_Colectiva]
	@colectivo_id int = -1
AS
BEGIN
SET NOCOUNT ON
 
	--Consulta A := extrae el ultimo valor para la secuencia 
	SELECT TOP 1 a.inspeccion_id 
	, a.centro_trabajo_id
	, a.in_ct_nombre
	,
	(	
		SELECT COUNT(a.inspeccion_id ) FROM dbo.inspeccion as a  WHERE colectivo_id = @colectivo_id	AND ( (a.in_etapa != 1 OR a.in_etapa IS NULL ) AND  (a.in_estatus!=0 OR a.in_estatus IS NULL )  )		
	) -
	(	
		SELECT COUNT(a.inspeccion_id) FROM dbo.inspeccion as a 	WHERE colectivo_id = @colectivo_id AND ( (a.in_etapa = 1  ) AND  (a.in_estatus = 0  )  )  
	) Total 
	FROM dbo.inspeccion as a 
		WHERE colectivo_id = @colectivo_id 
			  AND ( (a.in_etapa IS NULL  ) AND  (a.in_estatus IS NULL  )  ) 
	ORDER BY a.inspeccion_id DESC

	--Consulta B := forma una lista de aquellas inspecciones NO TERMINADAS 
	SELECT a.inspeccion_id 
		, a.centro_trabajo_id
		, a.in_ct_nombre
		,  a.in_etapa --tiene que ser 1 para estar terminada
		, a.in_estatus -- tiene que ser 0 para estar terminada
		FROM dbo.inspeccion as a 
			WHERE colectivo_id = @colectivo_id
			and ( (a.in_etapa != 1 OR a.in_etapa IS NULL ) AND  (a.in_estatus!=0 OR a.in_estatus IS NULL )  )
		ORDER BY a.inspeccion_id ASC

	--Consulta C := forma una lista de aquellas inspecciones TERMINADAS 
	SELECT a.inspeccion_id 
		, a.centro_trabajo_id
		, a.in_ct_nombre
		,  a.in_etapa --tiene que ser 1 para estar terminada
		, a.in_estatus -- tiene que ser 0 para estar terminada
		FROM dbo.inspeccion as a 
			WHERE colectivo_id = @colectivo_id
			and ( (a.in_etapa = 1  ) AND  (a.in_estatus = 0  )  )
		ORDER BY a.inspeccion_id ASC
 
END


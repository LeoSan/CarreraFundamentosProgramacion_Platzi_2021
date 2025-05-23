USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_DshgoAlcance_ObtenerTablero]    Script Date: 25/10/2022 03:05:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Canseco
-- Create date: 08/03/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_DshgoAlcance_ObtenerTablero] --11802
	@desahogo_id int,
	@no_terminadas int = null,
	@estatus int = -1
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		da.dshgo_alcance_id,
		da.desahogo_id,
		sb.submateria_id,
		sb.materia_id,
		smat_submateria,
		
		CASE dsal_estatus
			WHEN 1 THEN 'Revisado'
			ELSE '&nbsp;'
		END dsal_estatus,
		
		CASE sb.materia_id
			WHEN 2 THEN REPLACE(ISNULL(NULLIF(smat_nom, ''), '&nbsp;'), ' ', '-')
			WHEN 5 THEN REPLACE(ISNULL(NULLIF(smat_nom, ''), '&nbsp;'), ' ', '-')
			ELSE CONVERT(varchar, smat_consecutivo)
		END AS dsal_numero,
		ROW_NUMBER() OVER(ORDER BY sb.submateria_id) as id
	FROM
		dbo.dshgo_alcance		 da
		INNER JOIN dbo.desahogo	 ds	 ON ds.desahogo_id = da.desahogo_id
		INNER JOIN dbo.submateria sb ON da.submateria_id = sb.submateria_id
		INNER JOIN dbo.inspeccion i  ON	ds.inspeccion_id = i.inspeccion_id
		INNER JOIN dbo.materia ma ON ma.materia_id = i.materia_id 
	WHERE	ds.desahogo_id = @desahogo_id AND (dsal_no_aplica IS NULL OR dsal_no_aplica = 0)
		AND (dsal_estatus <> 1 OR dsal_estatus IS NULL OR @no_terminadas IS NULL)
		AND (
			(i.operativo_id IS NULL OR (i.operativo_id IS NOT NULL 	and (ma.mat_acronimo <> 'SH' and ma.mat_acronimo <> 'RSPC')))  and
			EXISTS (
			SELECT indicador_id FROM dbo.submateria sb INNER JOIN dbo.indicador id 
				ON sb.submateria_id = id.submateria_id AND (id.ind_alcance = 1 OR id.ind_alcance = 0)
			WHERE	da.submateria_id = sb.submateria_id --AND (ind_estatus = @estatus OR @estatus = -1)
			AND (((	EXISTS (
						SELECT ind_medida_id FROM dbo.ind_medida im
						WHERE im.indicador_id = id.indicador_id --AND (im.imed_estatus = @estatus OR @estatus = -1)
							AND imed_tipo_incumplimiento BETWEEN 2 AND 3
							AND im.ind_inciso_id IS NULL 
					) OR ind_incisos <> 0)	
				AND (EXISTS (
						SELECT inc.ind_inciso_id FROM ind_inciso inc INNER JOIN dbo.ind_medida im
							ON	inc.indicador_id = im.indicador_id AND	inc.ind_inciso_id = im.ind_inciso_id
						WHERE  id.indicador_id = inc.indicador_id AND inc.inc_alcance = 1
							AND imed_tipo_incumplimiento BETWEEN 2 AND 3
							--AND (inc_estatus = @estatus OR @estatus = -1)
							--AND (im.imed_estatus = @estatus OR @estatus = -1)
					) OR ind_incisos <> 1)
				) OR NOT (ma.mat_acronimo = 'SH' OR ma.mat_acronimo = 'RSPC'))
		)--= Mod GC =--
		OR(i.operativo_id IS NOT NULL 	and	(ma.mat_acronimo = 'SH' OR ma.mat_acronimo = 'RSPC') 
					AND EXISTS(
								select oi.operativo_indicador_id from operativo_indicador oi inner join operativo_alcance oa 
									on oa.operativo_alcance_id= oi.operativo_alcance_id 
									inner join indicador ind on oi.indicador_id= ind.indicador_id 
								where oa.operativo_id=i.operativo_id and oa.submateria_id=da.submateria_id
									
								
							)
					
			)--= Mod GC =--
		)
	ORDER BY smat_consecutivo
		
		
	--Agregado Ariana :)	
	SELECT
		CASE smat_es_nom WHEN 1 THEN REPLACE(smat_nom,' ','-') + '-STPS-' + CAST(smat_anio AS VARCHAR(4)) ELSE '' END + ' ' + smat_submateria sub,
		da.dshgo_alcance_id,
		da.desahogo_id,
		sb.submateria_id,
		sb.materia_id,
		smat_submateria,
		CASE dsal_no_aplica
			WHEN 1 THEN 'NO APLICA'
			WHEN 0 THEN 'SÍ APLICA' END no_aplica
	FROM
		dbo.dshgo_alcance		 da
		INNER JOIN dbo.desahogo	 ds	 ON ds.desahogo_id = da.desahogo_id
		INNER JOIN dbo.submateria sb ON da.submateria_id = sb.submateria_id
	WHERE	ds.desahogo_id = @desahogo_id
	--Agregado JC (=
	ORDER BY smat_consecutivo
END














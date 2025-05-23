USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Dshgo_Revision_ObtenerIndicadoresIncisos_Prueba]    Script Date: 25/10/2022 02:37:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC [PA_Dshgo_Revision_ObtenerIndicadoresIncisos] -1,1280415,-1,null,-1,null, -1,-1 

-- =============================================
-- Author:		Jose Canseco
-- Create date: 09/03/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Dshgo_Revision_ObtenerIndicadoresIncisos_Prueba]
	@desahogo_id			int = -1,
	@dshgo_alcance_id		int = -1,
	@indicador_id			int = -1,
	@con_incisos			int = null,
	@indicador_depende_id	int = -1,
	@ind_respuesta_depende	varchar(20) = null,
	@drev_respuesta			int = -1,
	@estatus int = -1	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @esOP tinyint = null;
		
	IF @desahogo_id <> -1 OR @dshgo_alcance_id <> -1
		SELECT TOP(1) @esOP = CASE ISNULL(i.operativo_id, 0) WHEN 0 THEN 0 ELSE 1 END
		FROM dbo.dshgo_alcance da
			INNER JOIN dbo.desahogo ds ON ds.desahogo_id = da.desahogo_id
			INNER JOIN dbo.inspeccion i ON ds.inspeccion_id = i.inspeccion_id
		WHERE	(ds.desahogo_id = @desahogo_id OR @desahogo_id = -1)
			AND (da.dshgo_alcance_id = @dshgo_alcance_id OR @dshgo_alcance_id = -1)
	
	IF @esOP = 0 OR @esOP IS NULL
	BEGIN
		PRINT 'NO_ES_OPERATIVO';
		
		SELECT
			da.desahogo_id,
			sb.materia_id,
			
			da.dshgo_alcance_id,
			sb.submateria_id,
			id.indicador_id,
			ic.ind_inciso_id,
			
			CASE sb.smat_es_nom
				WHEN 1 THEN 
					REPLACE(smat_nom, ' ', '-') + '-STPS-' + 
					CONVERT(varchar, smat_anio) + ' '
				ELSE CONVERT(varchar, smat_consecutivo) +'. '
			END + smat_submateria AS smat_submateria,
			
			ind_consecutivo,
			ind_indicador,
			ind_obligatorio,
			ind_alcance,
			ind_incisos,
			ind_conduce_medida,
			ind_dependiente,
			ind_estatus,
			id.ind_respuesta_depende,
			id.indicador_depende_id,
			
			CASE ind_aplica_alcance
				WHEN 1 THEN ind_alcance_inspeccion 
				ELSE 
					CASE ind_dependiente
						WHEN 1 THEN (
							SELECT TOP(1) 
								CASE ind_alcance
									WHEN 1 THEN ind_alcance_inspeccion
									ELSE REPLACE(REPLACE(ind_indicador, '¿', ''), '?', '')
								END 
							FROM dbo.indicador ind 
							WHERE ind.indicador_id = id.indicador_depende_id
						)
						ELSE REPLACE(REPLACE(ind_indicador, '¿', ''), '?', '')
					END
			END + CASE ind_incisos WHEN 1 THEN ' Carece de:' ELSE '' END AS ind_alcance_inspeccion,
			
			ic.ind_inciso_id,
			inc_consecutivo,
			inc_inciso,
			inc_alcance,
			inc_conduce_medida,
			inc_obligatorio,
			inc_estatus,
			REPLACE(inc_inciso, '?', '') AS inc_alcance_inspeccion,
			
			dr.dshgo_revision_id,
			dr.dshgo_alcance_id,
			dr.indicador_id,
			dr.ind_inciso_id,
			dr.drev_respuesta,
			dr.drev_observaciones,
			dr.sys_usr_insert,
			dr.sys_fec_insert,
			
			CASE dr.drev_respuesta
				WHEN 1 THEN 'Cuenta'
				WHEN 2 THEN 'No cuenta'
				WHEN 3 THEN 'No aplica'
				ELSE '&nbsp;'
			END AS drev_resultado
		FROM
			dbo.dshgo_alcance			 da
			INNER JOIN dbo.desahogo		 ds	ON	ds.desahogo_id = da.desahogo_id
			INNER JOIN dbo.submateria	 sb	ON	da.submateria_id = sb.submateria_id
			INNER JOIN dbo.inspeccion	 i	ON	ds.inspeccion_id = i.inspeccion_id
			INNER JOIN dbo.materia       ma ON ma.materia_id = i.materia_id
			INNER JOIN dbo.indicador	 id	ON	sb.submateria_id = id.submateria_id
											AND	(	id.ind_alcance = 1 --OR id.ind_alcance = 0)
												OR (EXISTS (
														SELECT inc.ind_inciso_id FROM dbo.ind_inciso inc
														INNER JOIN dbo.materia m ON m.materia_id = i.materia_id
														WHERE inc.indicador_id = id.indicador_id AND inc.inc_alcance = 1
															--AND (inc.inc_estatus = @estatus OR @estatus = -1) 
															AND (	EXISTS (
																		SELECT ind_medida_id FROM dbo.ind_medida im
																		WHERE im.ind_inciso_id = inc.ind_inciso_id --AND (im.imed_estatus = @estatus OR @estatus = -1)
																			AND im.indicador_id = inc.indicador_id
																			AND imed_tipo_incumplimiento BETWEEN 2 AND 3)
																OR	NOT (m.mat_acronimo = 'SH' OR m.mat_acronimo = 'RSPC'))
													) AND id.ind_alcance = 0))
											--AND (id.ind_estatus = @estatus OR @estatus = -1)
			LEFT JOIN dbo.ind_inciso	 ic	ON	id.indicador_id = ic.indicador_id
											AND	(@con_incisos IS NOT NULL OR ic.ind_inciso_id < 0)
											AND ic.inc_alcance = 1 --AND (ic.inc_estatus = @estatus OR @estatus = -1)
			LEFT JOIN dbo.dshgo_revision dr	ON	da.dshgo_alcance_id = dr.dshgo_alcance_id
											AND (ic.ind_inciso_id = dr.ind_inciso_id OR (dr.ind_inciso_id IS NULL AND ic.ind_inciso_id IS NULL))
											AND id.indicador_id = dr.indicador_id
		WHERE	(ds.desahogo_id = @desahogo_id OR @desahogo_id =-1)
			AND (da.dshgo_alcance_id = @dshgo_alcance_id OR @dshgo_alcance_id = -1)
			AND (id.indicador_id = @indicador_id OR @indicador_id = -1)
			AND (id.ind_estatus = 1) --add mmc 20-11-2014
			AND (drev_respuesta = @drev_respuesta OR @drev_respuesta = -1)
			AND	(@con_incisos IS NULL OR ic.ind_inciso_id > 0)
			AND (dsal_no_aplica IS NULL OR dsal_no_aplica = 0)
			AND	(	EXISTS (
						SELECT ind_medida_id FROM dbo.ind_medida im
						WHERE im.indicador_id = id.indicador_id --AND (im.imed_estatus = @estatus OR @estatus = -1)
							AND (im.ind_inciso_id IS NULL OR NOT (@con_incisos IS NULL AND id.ind_incisos = 0))
							AND (im.ind_inciso_id IS NOT NULL OR NOT (@con_incisos IS NULL AND id.ind_incisos = 1))
							AND (	(im.ind_inciso_id = ic.ind_inciso_id AND ic.inc_conduce_medida = 1) 
								OR	NOT (@con_incisos IS NOT NULL AND id.ind_incisos = 1))
							AND imed_tipo_incumplimiento BETWEEN 2 AND 3)
				OR	NOT (ma.mat_acronimo = 'SH' OR ma.mat_acronimo = 'RSPC'))
			AND (	id.indicador_depende_id = @indicador_depende_id
				OR (id.indicador_depende_id IS NULL AND @indicador_depende_id = -1) 
				OR NOT (ma.mat_acronimo = 'CGT' OR ma.mat_acronimo = 'CA' OR ma.mat_acronimo = 'AC'))
			AND (ind_respuesta_depende = @ind_respuesta_depende OR @ind_respuesta_depende IS NULL)
		ORDER BY ds.desahogo_id, sb.smat_consecutivo, ind_consecutivo, inc_consecutivo
		OPTION(MAXDOP 1)
	END
	ELSE BEGIN
		PRINT 'ES_OPERATIVO';
		
		SELECT
			da.desahogo_id,
			sb.materia_id,
			
			da.dshgo_alcance_id,
			sb.submateria_id,
			id.indicador_id,
			ic.ind_inciso_id,
			
			CASE sb.smat_es_nom
				WHEN 1 THEN 
					REPLACE(smat_nom, ' ', '-') + '-STPS-' + 
					CONVERT(varchar, smat_anio) + ' '
				ELSE CONVERT(varchar, smat_consecutivo) +'. '
			END + smat_submateria AS smat_submateria,
			
			ind_consecutivo,
			ind_indicador,
			ind_obligatorio,
			ind_alcance,
			ind_incisos,
			ind_conduce_medida,
			ind_dependiente,
			id.ind_respuesta_depende,
			id.indicador_depende_id,
			
			CASE ind_aplica_alcance
				WHEN 1 THEN ind_alcance_inspeccion 
				ELSE 
					CASE ind_dependiente
						WHEN 1 THEN (
							SELECT TOP(1) 
								CASE ind_alcance
									WHEN 1 THEN ind_alcance_inspeccion
									ELSE REPLACE(REPLACE(ind_indicador, '¿', ''), '?', '')
								END 
							FROM dbo.indicador ind 
							WHERE ind.indicador_id = id.indicador_depende_id
						)
						ELSE REPLACE(REPLACE(ind_indicador, '¿', ''), '?', '')
					END
			END + CASE ind_incisos WHEN 1 THEN ' Carece de:' ELSE '' END AS ind_alcance_inspeccion,
			
			ic.ind_inciso_id,
			inc_consecutivo,
			inc_inciso,
			inc_alcance,
			inc_conduce_medida,
			inc_obligatorio,
			REPLACE(inc_inciso, '?', '') AS inc_alcance_inspeccion,
			
			dr.dshgo_revision_id,
			dr.dshgo_alcance_id,
			dr.indicador_id,
			dr.ind_inciso_id,
			dr.drev_respuesta,
			dr.drev_observaciones,
			dr.sys_usr_insert,
			dr.sys_fec_insert,
			
			CASE dr.drev_respuesta
				WHEN 1 THEN 'Cuenta'
				WHEN 2 THEN 'No cuenta'
				WHEN 3 THEN 'No aplica'
				ELSE '&nbsp;'
			END AS drev_resultado
		FROM
			dbo.dshgo_alcance			 da
			INNER JOIN dbo.desahogo		 ds	ON	ds.desahogo_id = da.desahogo_id
			INNER JOIN dbo.submateria	 sb	ON	da.submateria_id = sb.submateria_id
			INNER JOIN dbo.inspeccion	 i	ON	ds.inspeccion_id = i.inspeccion_id
			INNER JOIN dbo.materia       ma ON ma.materia_id = i.materia_id
			INNER JOIN dbo.operativo_alcance oa   ON  i.operativo_id = oa.operativo_id
												  AND sb.submateria_id = oa.submateria_id
			INNER JOIN dbo.operativo_indicador oi ON  oa.operativo_alcance_id = oi.operativo_alcance_id
			INNER JOIN dbo.indicador	 id	ON	sb.submateria_id = id.submateria_id
											AND oi.indicador_id = id.indicador_id
											AND (	(oi.ind_inciso_id IS NULL AND @con_incisos IS NULL)
												OR	(oi.ind_inciso_id > 0 AND @con_incisos IS NOT NULL))
											--AND (	EXISTS (
											--			SELECT ind_inciso_id FROM dbo.ind_inciso inc
											--			WHERE inc.indicador_id = id.indicador_id AND (inc.inc_estatus = @estatus OR @estatus = -1)
											--				AND inc.ind_inciso_id = oi.ind_inciso_id
											--				AND  EXISTS (
											--						SELECT ind_medida_id FROM dbo.ind_medida im
											--						WHERE im.indicador_id = inc.indicador_id AND (im.imed_estatus = @estatus OR @estatus = -1)
											--							AND im.ind_inciso_id = inc.ind_inciso_id
											--							AND im.imed_tipo_incumplimiento BETWEEN 2 AND 3))
											--	OR	NOT ((i.materia_id = 2 OR i.materia_id = 5) AND id.ind_incisos = 1))
			LEFT JOIN dbo.ind_inciso	 ic	ON	id.indicador_id = ic.indicador_id
											AND	ic.ind_inciso_id = oi.ind_inciso_id
											AND id.ind_incisos = 1 --AND (ic.inc_estatus = @estatus OR @estatus = -1)
			LEFT JOIN dbo.dshgo_revision dr	ON	da.dshgo_alcance_id = dr.dshgo_alcance_id
											AND (ic.ind_inciso_id = dr.ind_inciso_id OR (dr.ind_inciso_id IS NULL AND ic.ind_inciso_id IS NULL))
											AND id.indicador_id = dr.indicador_id 
		WHERE	--(id.ind_estatus = @estatus OR @estatus = -1)
			(ds.desahogo_id = @desahogo_id OR @desahogo_id =-1)
			AND (da.dshgo_alcance_id = @dshgo_alcance_id OR @dshgo_alcance_id = -1)
			AND (id.indicador_id = @indicador_id OR @indicador_id = -1)
			AND (drev_respuesta = @drev_respuesta OR @drev_respuesta = -1)
			AND	(@con_incisos IS NULL OR id.ind_incisos > 0)
			AND (dsal_no_aplica IS NULL OR dsal_no_aplica = 0)
			AND	(	EXISTS (
						SELECT ind_medida_id FROM dbo.ind_medida im
						WHERE im.indicador_id = id.indicador_id --AND (im.imed_estatus = @estatus OR @estatus = -1)
							AND (im.ind_inciso_id IS NULL OR NOT (@con_incisos IS NULL AND id.ind_incisos = 0))
							AND (im.ind_inciso_id IS NOT NULL OR NOT (@con_incisos IS NULL AND id.ind_incisos = 1))
							AND (	(im.ind_inciso_id = ic.ind_inciso_id AND ic.inc_conduce_medida = 1)
								OR	NOT (@con_incisos IS NOT NULL AND id.ind_incisos = 1))
							AND imed_tipo_incumplimiento BETWEEN 2 AND 3)
				OR	NOT (ma.mat_acronimo = 'SH' OR ma.mat_acronimo = 'RSPC'))
			AND (	id.indicador_depende_id = @indicador_depende_id
				OR (id.indicador_depende_id IS NULL AND @indicador_depende_id = -1)
				OR NOT (ma.mat_acronimo = 'CGT' OR ma.mat_acronimo = 'CA' OR ma.mat_acronimo = 'AC'))
			AND (ind_respuesta_depende = @ind_respuesta_depende OR @ind_respuesta_depende IS NULL)
		ORDER BY ds.desahogo_id, sb.smat_consecutivo, ind_consecutivo, inc_consecutivo
		OPTION(MAXDOP 1)
	END

END
	



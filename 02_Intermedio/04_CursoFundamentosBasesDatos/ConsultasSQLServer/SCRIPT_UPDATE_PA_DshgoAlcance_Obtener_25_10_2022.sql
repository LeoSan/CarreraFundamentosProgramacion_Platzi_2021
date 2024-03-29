USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_DshgoAlcance_Obtener]    Script Date: 25/10/2022 02:43:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel C
-- Create date: 23/02/2012
-- Edit date:	19/07/2012 by Jose Canseco
-- Edit date:	24/09/2012 by Gabriel C
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_DshgoAlcance_Obtener] --1, 24391
	-- Add the parameters for the stored procedure here
	@inspeccion_id int =-1,
	@desahogo_id int = -1,
	@estatus int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		d.desahogo_id,
		i.inspeccion_id,
		i.in_num_expediente,I.operativo_id,
		da.desahogo_id AS da_desahogo_id,
		da.dshgo_alcance_id,
		da.submateria_id AS da_submateria_id, 
		da.sys_fec_insert,
		da.sys_usr_insert AS da_sys_usr_insert,
		da.dsal_estatus,
		da.dsal_no_aplica,
		sub.materia_id,
		ia.submateria_id,
		sub.smat_opcion_no_aplicar,
		sub.smat_alcance,
		sub.smat_es_nom,
		sub.smat_nom,
		sub.smat_consecutivo,
		sub.smat_submateria,
		ROW_NUMBER() OVER (ORDER BY smat_consecutivo) AS id
	FROM
		desahogo d
		LEFT JOIN inspeccion i ON d.inspeccion_id = i.inspeccion_id
		LEFT JOIN inspec_alcance ia ON i.inspeccion_id = ia.inspeccion_id
		LEFT JOIN submateria sub ON ia.submateria_id = sub.submateria_id
		INNER JOIN dbo.materia ma ON ma.materia_id = i.materia_id
								--== Mod JC ==--
								AND (sub.smat_estatus = @estatus OR @estatus = -1)
								--== Mod JC ==--
		LEFT JOIN dshgo_alcance da ON d.desahogo_id = da.desahogo_id and ia.submateria_id= da.submateria_id
	WHERE
	(d.inspeccion_id = @inspeccion_id OR @inspeccion_id = -1)
		AND	(d.desahogo_id = @desahogo_id OR @desahogo_id = -1)
		--AND sub.smat_estatus=1
		AND (
			(i.operativo_id IS NULL OR (i.operativo_id IS NOT NULL 	and (ma.mat_acronimo <>'SH' and ma.mat_acronimo <> 'RSPC')))  and
			EXISTS (
					SELECT indicador_id FROM dbo.submateria sb INNER JOIN dbo.indicador id 
						ON sb.submateria_id = id.submateria_id AND (id.ind_alcance = 1 OR id.ind_alcance = 0)
					WHERE	ia.submateria_id = sb.submateria_id --AND (ind_estatus = @estatus OR @estatus = -1)
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
					) 
				
				--= Mod GC =--
				OR(i.operativo_id IS NOT NULL 	and	(ma.mat_acronimo = 'SH' OR ma.mat_acronimo = 'RSPC') 
							AND EXISTS(
										select oi.operativo_indicador_id from operativo_indicador oi inner join operativo_alcance oa 
											on oa.operativo_alcance_id= oi.operativo_alcance_id 
											inner join indicador ind on oi.indicador_id= ind.indicador_id 
										where oa.operativo_id=i.operativo_id and oa.submateria_id=ia.submateria_id
											AND (
													(	EXISTS (
																SELECT ind_medida_id FROM dbo.ind_medida im
																	WHERE
																	im.indicador_id = ind.indicador_id
																	--AND (im.imed_estatus = @estatus OR @estatus = -1)
																	AND imed_tipo_incumplimiento BETWEEN 2 AND 3
																	AND im.ind_inciso_id IS NULL 
																) 
														 OR ind_incisos <> 0
													 )	
													 AND 
													 (
														EXISTS (
																		SELECT inc.ind_inciso_id FROM ind_inciso inc INNER JOIN dbo.ind_medida im
																			ON	inc.indicador_id = im.indicador_id AND	inc.ind_inciso_id = im.ind_inciso_id
																		WHERE  ind.indicador_id = inc.indicador_id AND inc.inc_alcance = 1
																			AND imed_tipo_incumplimiento BETWEEN 2 AND 3
																			--AND (inc_estatus = @estatus OR @estatus = -1) 
																			--AND (im.imed_estatus = @estatus OR @estatus = -1)
																) 
														 OR ind_incisos <> 1
													  )
																						
												)
										
									)
						--= Mod GC =--	
					)
		)
	ORDER BY smat_consecutivo


	SELECT 
		d.desahogo_id,
		i.inspeccion_id,
		i.in_num_expediente,
		da.desahogo_id AS da_desahogo_id,
		da.dshgo_alcance_id,
		da.submateria_id AS da_submateria_id, 
		da.sys_fec_insert,
		da.sys_usr_insert AS da_sys_usr_insert,
		da.dsal_estatus,
		da.dsal_no_aplica,
		sub.materia_id,
		da.submateria_id,
		sub.smat_opcion_no_aplicar,
		sub.smat_alcance,
		sub.smat_es_nom,
		sub.smat_nom,
		sub.smat_consecutivo,
		CASE sub.smat_es_nom
			WHEN 1 THEN 
				REPLACE(smat_nom, ' ', '-') + '-STPS-' + 
				CONVERT(varchar, smat_anio) + ' '
			ELSE ''
		END + sub.smat_submateria AS smat_submateria,
		--sub.smat_submateria,
		ROW_NUMBER() OVER (ORDER BY smat_consecutivo) AS id,i.operativo_id
	FROM
		desahogo d
		LEFT JOIN inspeccion i ON d.inspeccion_id = i.inspeccion_id
		LEFT JOIN dshgo_alcance da ON d.desahogo_id= da.desahogo_id 	
		LEFT JOIN submateria sub ON da.submateria_id = sub.submateria_id
		INNER JOIN dbo.materia ma ON ma.materia_id = i.materia_id 
								--== Mod JC ==--
								AND (sub.smat_estatus = @estatus OR @estatus = -1)
								--== Mod JC ==--
	
	WHERE 
		(d.inspeccion_id = @inspeccion_id OR @inspeccion_id = -1) AND
		(d.desahogo_id = @desahogo_id OR @desahogo_id = -1)
		AND (dsal_no_aplica IS NULL OR dsal_no_aplica = 0)
		AND 
		  ( (i.operativo_id IS NULL OR (i.operativo_id IS NOT NULL 	and (ma.mat_acronimo <> 'SH' and ma.mat_acronimo <> 'RSPC')))  and
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
			) 
			OR(i.operativo_id IS NOT NULL 	and	(ma.mat_acronimo = 'SH' OR ma.mat_acronimo = 'RSPC') 
							AND EXISTS(
										SELECT indicador_id FROM dbo.submateria sb INNER JOIN dbo.indicador id 
											ON sb.submateria_id = id.submateria_id --AND (id.ind_alcance = 2)
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
													WHERE  id.indicador_id = inc.indicador_id --AND inc.inc_alcance = 2
														AND imed_tipo_incumplimiento BETWEEN 2 AND 3
														--AND (inc_estatus = @estatus OR @estatus = -1)
														--AND (im.imed_estatus = @estatus OR @estatus = -1)
												) OR ind_incisos <> 1)
											) OR NOT (ma.mat_acronimo = 'SH' OR ma.mat_acronimo = 'RSPC'))
			
										
							)
				)
		)
		AND( EXISTS( select dr.dshgo_revision_id from dshgo_revision dr where dr.dshgo_alcance_id = da.dshgo_alcance_id))
	ORDER BY smat_consecutivo


END














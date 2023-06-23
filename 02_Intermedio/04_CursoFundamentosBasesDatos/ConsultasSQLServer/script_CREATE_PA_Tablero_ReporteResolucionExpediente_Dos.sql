USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		lcuenca@air.org
-- Create date: 04/02/2022 
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Tablero_Front_Resolucion_Por_Expedientes]  
	-- Add the parameters for the stored procedure here
	@cve_edorep        int      = -1, 
	@cve_ur            int      = -1,
	@s_participante_id int      = -1,
	@fecha1            varchar(20) = NULL,
	@fecha2            varchar(20) = NULL
AS
BEGIN
	SET NOCOUNT ON;

--Nota: Listado de Expedientes 
    -- Expedientes de Condenatoria 
	SELECT 
	 ex.s_expediente_id
	, ex.inspeccion_id
	, se_num_expediente
	, Convert(Varchar(10), se_fec_recepcion,103) fec_recepcion
	, Convert(Varchar(10),sres_fec_resolucion ,103) fec_resolucion
	, ex.se_ct_razon_social as se_ct_nombre
	, se_ct_domicilio
	, (SELECT top 1 mat.mat_acronimo FROM dbo.materia mat WHERE mat.materia_id = materia_id ) as mat_acronimo
	, sres_sentido
	, sres_tipo_resolucion
	, case sres_sentido
			when 2	then 'Absolutoria'
			else
				case sres_sentido
					when 1	then 
						case sres_tipo_resolucion
							when 12	then 'Condenatoria-Comparecencia'
								else 
									case sres_tipo_resolucion
										when 13	then 'Condenatoria-Rebeldía'
										else 
											case  when (select COUNT(*) from s_expediente_etapa t1 WHERE t1.s_expediente_id=ex.s_expediente_id and (t1.s_etapa_id=14) and t1.see_estatus=2) > 0
												then 'Improcedente - Acuerdos de tramites'
												else 
													case  when (select COUNT(*) from s_expediente_etapa t1 WHERE t1.s_expediente_id=ex.s_expediente_id and (t1.s_etapa_id=18 or t1.s_etapa_id=19 or t1.s_etapa_id=23) and t1.see_estatus=2) > 0
														then 'Improcedente - Acuerdos de archivo'
														else 
															case when (sres_sentido = 3 AND sres_tipo_resolucion = 12)
																then 'Improcedente - Resolución - Comparecencia'
																else 
																	case when (sres_sentido = 3 AND sres_tipo_resolucion = 13)
																		then 'Improcedente - Resolucion - Rebeldía'
																		else 'No Aplica' 
																	END																
															END
													END
											END
									END
								
						END
				END
		END as tipo_subtipo
    , CASE WHEN sres_determinacion_multa = 1
		THEN 'MM ('+ CAST((select COUNT(s_incumplimiento_id) from s_incumplimiento where s_incumplimiento.s_expediente_id=ex.s_expediente_id and s_incumplimiento.sinc_procede_sancion=1 and s_incumplimiento.sinc_procede=1) AS Varchar(255)) +')'
		ELSE 
			 CASE WHEN sres_determinacion_multa = 2
					THEN 'PTU ('+ CAST((select COUNT(s_incumplimiento_id) from s_incumplimiento where s_incumplimiento.s_expediente_id=ex.s_expediente_id and s_incumplimiento.sinc_procede_sancion=1 and s_incumplimiento.sinc_procede=1) AS Varchar(255)) +')'
					ELSE 
						 CASE WHEN sres_determinacion_multa = 3
								THEN 'Presunción ('+ CAST((select COUNT(s_incumplimiento_id) from s_incumplimiento where s_incumplimiento.s_expediente_id=ex.s_expediente_id and s_incumplimiento.sinc_procede_sancion=1 and s_incumplimiento.sinc_procede=1) AS Varchar(255)) +')'
								ELSE 'No Aplica'
						END
			END
	  END AS numero_sanciones 
	  , CASE WHEN sres_tipo_resolucion = 12
		  THEN 'Comparecencia ($'+ CAST( sres_monto_multa AS Varchar(255)) +')'
		  ELSE 
				CASE WHEN sres_tipo_resolucion = 13
						  THEN 'Rebeldía ($'+ CAST( sres_monto_multa AS Varchar(255)) +')'
						  ELSE 'No Aplica'
				END
	   END AS monto_multa
	, sres_determinacion_multa
	, sres_monto_multa
	, (select COUNT(s_incumplimiento_id) from s_incumplimiento where s_incumplimiento.s_expediente_id=ex.s_expediente_id and s_incumplimiento.sinc_procede_sancion=1 and s_incumplimiento.sinc_procede=1) as num_incumplimientos
	, (select COUNT(*) from s_expediente_etapa t1 WHERE t1.s_expediente_id=ex.s_expediente_id and (t1.s_etapa_id=14) and t1.see_estatus=2) as acuerdoT
	, (select COUNT(*) from s_expediente_etapa t1 WHERE t1.s_expediente_id=ex.s_expediente_id and (t1.s_etapa_id=18 or t1.s_etapa_id=19 or t1.s_etapa_id=23) and t1.see_estatus=2) as acuerdoA
	FROM s_resolucion res
	INNER JOIN s_expediente_etapa exet ON exet.s_expediente_etapa_id=res.s_expediente_etapa_id
	INNER JOIN s_expediente ex ON ex.s_expediente_id=exet.s_expediente_id
	INNER JOIN inspeccion ins ON ins.inspeccion_id=ex.inspeccion_id
	INNER JOIN dbo.cat_unidad_respon catu ON catu.cur_cve_ur =ex.cve_ur
	LEFT JOIN  s_participante par ON exet.responsable_atencion_id= par.s_participante_id
	WHERE
		(cur_cve_edorep = @cve_edorep  OR @cve_edorep = -1)
		AND (ex.cve_ur= @cve_ur  OR @cve_ur  = -1) 
		AND (s_participante_id = @s_participante_id OR @s_participante_id = -1)
		AND (se_fec_recepcion BETWEEN @fecha1 AND @fecha2 OR @fecha1 is null)
		AND exet.see_estatus=2
		AND res.s_resolucion_id=(select top 1 t1.s_resolucion_id from s_resolucion t1 
			 inner join s_expediente_etapa t2 on t1.s_expediente_etapa_id=t2.s_expediente_etapa_id
			 inner join s_expediente t3 on t2.s_expediente_id=t3.s_expediente_id
			 where t2.s_expediente_id=ex.s_expediente_id order by s_resolucion_id desc
			 )
	---unir con los otros expedientes de acuerdo de terminacion
	UNION ALL
	
	SELECT
		 ex.s_expediente_id
	   , ex.inspeccion_id
	   , se_num_expediente
	   , Convert(Varchar(10), se_fec_recepcion,103) fec_recepcion
	   , Convert(Varchar(10),exet.see_fec_documento ,103) AS fec_resolucion
	   , ex.se_ct_razon_social as se_ct_nombre
	   , se_ct_domicilio
	   , (SELECT top 1 mat.mat_acronimo FROM dbo.materia mat WHERE mat.materia_id = materia_id ) as mat_acronimo
	   , '' AS sres_sentido
	   , '' AS sres_tipo_resolucion
	   , '' as tipo_subtipo
	   , '' AS numero_sanciones
	   , '' AS monto_multa
	   , '' AS sres_determinacion_multa
	   , 0.00 AS sres_monto_multa
	   , '' as num_incumplimientos
	   , (select COUNT(*) from s_expediente_etapa t1 where t1.s_expediente_id=ex.s_expediente_id and (t1.s_etapa_id=14) and t1.see_estatus=2) as acuerdoT
	   , (select COUNT(*) from s_expediente_etapa t1 where t1.s_expediente_id=ex.s_expediente_id and (t1.s_etapa_id=18 or t1.s_etapa_id=19 or t1.s_etapa_id=23) and t1.see_estatus=2) as acuerdoA
	FROM s_acuerdo_terminacion ater
	INNER JOIN s_expediente_etapa exet ON exet.s_expediente_etapa_id=ater.s_expediente_etapa_id
	INNER JOIN s_expediente ex ON ex.s_expediente_id=exet.s_expediente_id
	INNER JOIN inspeccion ins ON ins.inspeccion_id=ex.inspeccion_id
	INNER JOIN dbo.cat_unidad_respon catu ON catu.cur_cve_ur =ex.cve_ur
	LEFT JOIN  s_participante par ON exet.responsable_atencion_id= par.s_participante_id
	WHERE
		(cur_cve_edorep = @cve_edorep OR @cve_edorep  = -1)
		AND (ex.cve_ur= @cve_ur  OR @cve_ur  = -1) 
		AND (s_participante_id = @s_participante_id OR @s_participante_id = -1)
		AND (se_fec_recepcion BETWEEN @fecha1 AND @fecha2 OR @fecha1 is null)
		AND exet.see_estatus=2
		AND ins.centro_trabajo_id not in
		(
			 select t2.centro_trabajo_id from s_expediente t1
			 inner join inspeccion t2 on t1.inspeccion_id=t2.inspeccion_id
			 inner join s_expediente_etapa t3 on t3.s_expediente_id=t1.s_expediente_id and t3.s_etapa_id=7
			 where t2.centro_trabajo_id=ins.centro_trabajo_id and t3.see_estatus=2
			 and t3.see_fec_documento>exet.see_fec_documento
		)
	
	--unir con los de acuerdo de archivo
	UNION ALL
	SELECT 
		 ex.s_expediente_id
	   , ex.inspeccion_id
	   , se_num_expediente
	   , Convert(Varchar(10), se_fec_recepcion,103) fec_recepcion
	   , Convert(Varchar(10), anot.sanotif_fec_escrito,103) AS fec_resolucion
	   , ex.se_ct_razon_social as se_ct_nombre
	   , se_ct_domicilio
	   , (SELECT top 1 mat.mat_acronimo FROM dbo.materia mat WHERE mat.materia_id = materia_id ) as mat_acronimo
	   , '' AS sres_sentido
	   , '' AS sres_tipo_resolucion
	   , '' as tipo_subtipo 
	   , '' AS numero_sanciones
	   , '' AS monto_multa
	   , '' AS sres_determinacion_multa
	   , 0.00 AS sres_monto_multa
	   , '' as num_incumplimientos
	   , (select COUNT(*) from s_expediente_etapa t1 where t1.s_expediente_id=ex.s_expediente_id and (t1.s_etapa_id=14) and t1.see_estatus=2) as acuerdoT
	   , (select COUNT(*) from s_expediente_etapa t1 where t1.s_expediente_id=ex.s_expediente_id and (t1.s_etapa_id=18 or t1.s_etapa_id=19 or t1.s_etapa_id=23) and t1.see_estatus=2) as acuerdoA
	FROM s_acuerdo_notificacion anot
	INNER JOIN s_expediente_etapa exet on exet.s_expediente_etapa_id=anot.s_expediente_etapa_id
	INNER JOIN s_expediente ex on ex.s_expediente_id=exet.s_expediente_id
	INNER JOIN inspeccion ins on ins.inspeccion_id=ex.inspeccion_id
	INNER JOIN dbo.cat_unidad_respon catu
	on catu.cur_cve_ur =ex.cve_ur
	LEFT JOIN  s_participante par ON exet.responsable_atencion_id= par.s_participante_id
	where
		(cur_cve_edorep= @cve_edorep OR @cve_edorep = -1)
		AND (ex.cve_ur= @cve_ur  OR @cve_ur  = -1) 
		AND (s_participante_id = @s_participante_id OR @s_participante_id = -1)
		AND (se_fec_recepcion BETWEEN @fecha1 AND @fecha2 OR @fecha1 is null)
		AND (exet.s_etapa_id=23 OR exet.s_etapa_id=18 OR exet.s_etapa_id=19)
		AND (select COUNT(*) from s_expediente_etapa t1 where t1.s_expediente_id=exet.s_expediente_id and t1.s_etapa_id=7 )=0
		AND exet.see_estatus=2
	

--Nota: Calculos de Totales 	
	SELECT 
		'TOTAL',
		'Resoluciones',
		CAST(COUNT(res.s_resolucion_id) AS VARCHAR) as cantidad,
		'Total',
		(SELECT COUNT(t1.inspeccion_id) FROM inspeccion t1 inner join s_expediente t2
			on t1.inspeccion_id=t2.inspeccion_id
			inner join s_expediente_etapa t3 ON t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			ON t4.cur_cve_ur =t2.cve_ur
			LEFT join s_resolucion t6 ON t6.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN s_acuerdo_terminacion t7 ON t7.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN s_acuerdo_notificacion t8 ON t8.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN  s_participante t5 ON t3.responsable_atencion_id= t5.s_participante_id
			
			WHERE (t4.cur_cve_edorep = @cve_edorep  OR @cve_edorep  = -1)	
			AND (t2.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id OR @s_participante_id = -1) AND (t2.se_fec_recepcion BETWEEN @fecha1 AND @fecha2  OR @fecha1 is null)
			AND t1.materia_id=1 AND t3.see_estatus=2
			AND ( (t8.s_acuerdo_notificacion_id is not null and  (t3.s_etapa_id=23 OR t3.s_etapa_id=18 OR t3.s_etapa_id=19)  and  (select COUNT(*) FROM s_expediente_etapa a1 where a1.s_expediente_id=t2.s_expediente_id and a1.s_etapa_id=7 )=0) or t8.s_acuerdo_notificacion_id is null )
			AND ( (t7.s_acuerdo_terminacion_id is not null AND t1.centro_trabajo_id not in (
					 select a2.centro_trabajo_id FROM s_expediente a1
					 inner join inspeccion a2 on a1.inspeccion_id=a2.inspeccion_id
					 inner join s_expediente_etapa a3 on a3.s_expediente_id=a1.s_expediente_id and a3.s_etapa_id=7
					 where a2.centro_trabajo_id=t1.centro_trabajo_id and a3.see_estatus=2
					 and a3.see_fec_documento>t3.see_fec_documento
				)	) 	
				or t7.s_acuerdo_terminacion_id is null
			)
			AND (t6.s_resolucion_id is not null or t7.s_acuerdo_terminacion_id is not null or t8.s_acuerdo_notificacion_id is not null)
			AND (( t6.s_resolucion_id is not null and
			t6.s_resolucion_id=(select top 1 a1.s_resolucion_id from s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by a1.s_resolucion_id desc
			 ))
			 or t6.s_resolucion_id is null
			 )
		) total_cgt
		,
		(SELECT COUNT(t1.inspeccion_id) FROM inspeccion t1 inner join s_expediente t2
			on t1.inspeccion_id=t2.inspeccion_id
			inner join s_expediente_etapa t3 on t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t2.cve_ur
			left join s_resolucion t6 on t6.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN s_acuerdo_terminacion t7 on t7.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN s_acuerdo_notificacion t8 ON t8.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN  s_participante t5 ON t3.responsable_atencion_id= t5.s_participante_id
			where
			(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)	AND
			(t2.cve_ur= @cve_ur  OR @cve_ur  = -1) AND(t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
			AND (t2.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
			AND t1.materia_id=2 AND t3.see_estatus=2
			
			AND ( (t8.s_acuerdo_notificacion_id is not null and 
				(t3.s_etapa_id=23 OR t3.s_etapa_id=18 OR t3.s_etapa_id=19) 
				 and  (select COUNT(*) FROM s_expediente_etapa a1 where a1.s_expediente_id=t2.s_expediente_id and a1.s_etapa_id=7 )=0) or 
				t8.s_acuerdo_notificacion_id is null
			)
			
			AND
			( (t7.s_acuerdo_terminacion_id is not null AND t1.centro_trabajo_id not in
				(
					 select a2.centro_trabajo_id FROM s_expediente a1
					 inner join inspeccion a2 on a1.inspeccion_id=a2.inspeccion_id
					 inner join s_expediente_etapa a3 on a3.s_expediente_id=a1.s_expediente_id and a3.s_etapa_id=7
					 where a2.centro_trabajo_id=t1.centro_trabajo_id and a3.see_estatus=2
					 and a3.see_fec_documento>t3.see_fec_documento
				)	) 	
				or t7.s_acuerdo_terminacion_id is null
			)
			AND
			(t6.s_resolucion_id is not null or t7.s_acuerdo_terminacion_id is not null or t8.s_acuerdo_notificacion_id is not null)
			AND 
			(( t6.s_resolucion_id is not null and
			t6.s_resolucion_id=(select top 1 a1.s_resolucion_id FROM s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by a1.s_resolucion_id desc
			 ))
			 or t6.s_resolucion_id is null
			 )
		) total_sh
		,
		(SELECT COUNT(t1.inspeccion_id) FROM inspeccion t1 inner join s_expediente t2
			on t1.inspeccion_id=t2.inspeccion_id
			inner join s_expediente_etapa t3 on t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t2.cve_ur
			left join s_resolucion t6 on t6.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN s_acuerdo_terminacion t7 on t7.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN s_acuerdo_notificacion t8 ON t8.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN  s_participante t5 ON t3.responsable_atencion_id= t5.s_participante_id
			where
			(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)	AND
			(t2.cve_ur= @cve_ur  OR @cve_ur  = -1) AND(t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
			AND (t2.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
			AND t1.materia_id=3 AND t3.see_estatus=2

			AND ( (t8.s_acuerdo_notificacion_id is not null and 
				(t3.s_etapa_id=23 OR t3.s_etapa_id=18 OR t3.s_etapa_id=19) 
				 and  (select COUNT(*) FROM s_expediente_etapa a1 where a1.s_expediente_id=t2.s_expediente_id and a1.s_etapa_id=7 )=0) or 
				t8.s_acuerdo_notificacion_id is null
			)
			
			AND
			( (t7.s_acuerdo_terminacion_id is not null AND t1.centro_trabajo_id not in
				(
					 select a2.centro_trabajo_id FROM s_expediente a1
					 inner join inspeccion a2 on a1.inspeccion_id=a2.inspeccion_id
					 inner join s_expediente_etapa a3 on a3.s_expediente_id=a1.s_expediente_id and a3.s_etapa_id=7
					 where a2.centro_trabajo_id=t1.centro_trabajo_id and a3.see_estatus=2
					 and a3.see_fec_documento>t3.see_fec_documento
				)	) 	
				or t7.s_acuerdo_terminacion_id is null
			)
			AND
			(t6.s_resolucion_id is not null or t7.s_acuerdo_terminacion_id is not null or t8.s_acuerdo_notificacion_id is not null)
			AND 
			(( t6.s_resolucion_id is not null and
			t6.s_resolucion_id=(select top 1 a1.s_resolucion_id FROM s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by a1.s_resolucion_id desc
			 ))
			 or t6.s_resolucion_id is null
			 )
		) total_ca
		,
		(SELECT COUNT(t1.inspeccion_id) FROM inspeccion t1 inner join s_expediente t2
			on t1.inspeccion_id=t2.inspeccion_id
			inner join s_expediente_etapa t3 on t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t2.cve_ur
			left join s_resolucion t6 on t6.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN s_acuerdo_terminacion t7 on t7.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN s_acuerdo_notificacion t8 ON t8.s_expediente_etapa_id=t3.s_expediente_etapa_id
			LEFT JOIN  s_participante t5 ON t3.responsable_atencion_id= t5.s_participante_id
			where
			(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)	AND
			(t2.cve_ur= @cve_ur  OR @cve_ur  = -1) AND(t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
			AND (t2.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
			AND t1.materia_id=4 AND t3.see_estatus=2
			
			AND ( (t8.s_acuerdo_notificacion_id is not null and 
				(t3.s_etapa_id=23 OR t3.s_etapa_id=18 OR t3.s_etapa_id=19) 
				 and  (select COUNT(*) FROM s_expediente_etapa a1 where a1.s_expediente_id=t2.s_expediente_id and a1.s_etapa_id=7 )=0) or 
				t8.s_acuerdo_notificacion_id is null
			)
			AND
			( (t7.s_acuerdo_terminacion_id is not null AND t1.centro_trabajo_id not in
				(
					 select a2.centro_trabajo_id FROM s_expediente a1
					 inner join inspeccion a2 on a1.inspeccion_id=a2.inspeccion_id
					 inner join s_expediente_etapa a3 on a3.s_expediente_id=a1.s_expediente_id and a3.s_etapa_id=7
					 where a2.centro_trabajo_id=t1.centro_trabajo_id and a3.see_estatus=2
					 and a3.see_fec_documento>t3.see_fec_documento
				)	) 	
				or t7.s_acuerdo_terminacion_id is null
			)
			AND
			(t6.s_resolucion_id is not null or t7.s_acuerdo_terminacion_id is not null or t8.s_acuerdo_notificacion_id is not null)
			AND 
			(( t6.s_resolucion_id is not null and
			t6.s_resolucion_id=(select top 1 a1.s_resolucion_id FROM s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by a1.s_resolucion_id desc
			 ))
			 or t6.s_resolucion_id is null
			 )
		) total_ac
		,
		(SELECT COUNT(s_resolucion_id) FROM s_resolucion t1
			inner join s_expediente_etapa t2 on t2.s_expediente_etapa_id=t1.s_expediente_etapa_id
			inner join s_expediente t3 on t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t3.cve_ur
			LEFT JOIN  s_participante t5 ON t2.responsable_atencion_id= t5.s_participante_id
			where
				(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (t3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (t3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND t1.sres_sentido=2 AND t2.see_estatus=2
				AND
			t1.s_resolucion_id=(select top 1 a1.s_resolucion_id FROM s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by s_resolucion_id desc
			 )
		) as cant_abs
		,
		(SELECT COUNT(s_resolucion_id) FROM s_resolucion t1
			inner join s_expediente_etapa t2 on t2.s_expediente_etapa_id=t1.s_expediente_etapa_id
			inner join s_expediente t3 on t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t3.cve_ur
			LEFT JOIN  s_participante t5 ON t2.responsable_atencion_id= t5.s_participante_id
			where
				(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (t3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (t3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND t1.sres_sentido=1 and t1.sres_tipo_resolucion=12 AND t2.see_estatus=2
				AND
			t1.s_resolucion_id=(select top 1 a1.s_resolucion_id from s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by s_resolucion_id desc
			 )
		) as cant_comp_cond
		,
		(SELECT COUNT(s_resolucion_id) FROM s_resolucion t1
			inner join s_expediente_etapa t2 on t2.s_expediente_etapa_id=t1.s_expediente_etapa_id
			inner join s_expediente t3 on t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t3.cve_ur
			LEFT JOIN  s_participante t5 ON t2.responsable_atencion_id= t5.s_participante_id
			where
				(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (t3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (t3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND t1.sres_sentido=1 and t1.sres_tipo_resolucion=13 AND t2.see_estatus=2
				AND
			t1.s_resolucion_id=(select top 1 a1.s_resolucion_id from s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by s_resolucion_id desc
			 )
		) as cant_rebel_cond
		,
		(
		SELECT 
		COUNT(*)
		FROM s_acuerdo_terminacion a1
			inner join s_expediente_etapa a2 on a2.s_expediente_etapa_id=a1.s_expediente_etapa_id
			inner join s_expediente a3 on a3.s_expediente_id=a2.s_expediente_id
			inner join dbo.cat_unidad_respon a4
			on a4.cur_cve_ur =a3.cve_ur
			inner join inspeccion a6 on a6.inspeccion_id=a3.inspeccion_id
			LEFT JOIN  s_participante a5 ON a2.responsable_atencion_id= a5.s_participante_id
			where
				(a4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)
				AND(a3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND
				(a5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (a3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND a2.see_estatus=2
				AND a6.centro_trabajo_id not in
				(
					 select t2.centro_trabajo_id from s_expediente t1
					 inner join inspeccion t2 on t1.inspeccion_id=t2.inspeccion_id
					 inner join s_expediente_etapa t3 on t3.s_expediente_id=t1.s_expediente_id and t3.s_etapa_id=7
					 where t2.centro_trabajo_id=a6.centro_trabajo_id and t3.see_estatus=2
					 and t3.see_fec_documento>a2.see_fec_documento
				)
		) AS cant_acuerdo_t
		,
		(
		SELECT 
		COUNT(*)
		from s_acuerdo_notificacion anot
			inner join s_expediente_etapa exet on exet.s_expediente_etapa_id=anot.s_expediente_etapa_id
			inner join s_expediente ex on ex.s_expediente_id=exet.s_expediente_id
			inner join dbo.cat_unidad_respon catu
			on catu.cur_cve_ur =ex.cve_ur
			LEFT JOIN  s_participante par ON exet.responsable_atencion_id= par.s_participante_id
			where
				(cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (ex.cve_ur= @cve_ur  OR @cve_ur  = -1) AND(s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				and
				(exet.s_etapa_id=23 OR exet.s_etapa_id=18 OR exet.s_etapa_id=19)
				AND 
				exet.see_estatus=2
		)AS cant_acuerdo_a
		,
		(SELECT COUNT(s_resolucion_id) FROM s_resolucion t1
			inner join s_expediente_etapa t2 on t2.s_expediente_etapa_id=t1.s_expediente_etapa_id
			inner join s_expediente t3 on t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t3.cve_ur
			LEFT JOIN  s_participante t5 ON t2.responsable_atencion_id= t5.s_participante_id
			where
				(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (t3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (t3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND t1.sres_sentido=3 and t1.sres_tipo_resolucion=13 AND t2.see_estatus=2
				AND
			t1.s_resolucion_id=(select top 1 a1.s_resolucion_id from s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by s_resolucion_id desc
			 )
		) as cant_rebel_impr
		,
		(SELECT COUNT(s_resolucion_id) FROM s_resolucion t1
			inner join s_expediente_etapa t2 on t2.s_expediente_etapa_id=t1.s_expediente_etapa_id
			inner join s_expediente t3 on t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t3.cve_ur
			LEFT JOIN  s_participante t5 ON t2.responsable_atencion_id= t5.s_participante_id
			where
				(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (t3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (t3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND t1.sres_sentido=3 and t1.sres_tipo_resolucion=12 AND t2.see_estatus=2
				AND
			t1.s_resolucion_id=(select top 1 a1.s_resolucion_id from s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by s_resolucion_id desc
			 )
		) as cant_comp_impr
		,
		(select COUNT(s_incumplimiento_id) from s_incumplimiento t7 
			inner join s_expediente t3 on t3.s_expediente_id=t7.s_expediente_id
			inner join s_expediente_etapa t2 on t2.s_expediente_id=t3.s_expediente_id
			inner join s_resolucion t1 on t1.s_expediente_etapa_id=t2.s_expediente_etapa_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t3.cve_ur
			LEFT JOIN  s_participante t5 ON t2.responsable_atencion_id= t5.s_participante_id
			where
				(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (t3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (t3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND t1.sres_determinacion_multa=1 AND t2.see_estatus=2
				AND t7.sinc_procede_sancion=1 and t7.sinc_procede=1
				AND
			t1.s_resolucion_id=(select top 1 a1.s_resolucion_id from s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by s_resolucion_id desc
			 )
		) as num_incumplimientos1,
		(select COUNT(s_incumplimiento_id) from s_incumplimiento t7 
			inner join s_expediente t3 on t3.s_expediente_id=t7.s_expediente_id
			inner join s_expediente_etapa t2 on t2.s_expediente_id=t3.s_expediente_id
			inner join s_resolucion t1 on t1.s_expediente_etapa_id=t2.s_expediente_etapa_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t3.cve_ur
			LEFT JOIN  s_participante t5 ON t2.responsable_atencion_id= t5.s_participante_id
			where
				(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (t3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (t3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND t1.sres_determinacion_multa=2 AND t2.see_estatus=2
				AND t7.sinc_procede_sancion=1 and t7.sinc_procede=1
				AND
			t1.s_resolucion_id=(select top 1 a1.s_resolucion_id from s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by s_resolucion_id desc
			 )
		) as num_incumplimientos2,
		(select COUNT(s_incumplimiento_id) from s_incumplimiento t7 
			inner join s_expediente t3 on t3.s_expediente_id=t7.s_expediente_id
			inner join s_expediente_etapa t2 on t2.s_expediente_id=t3.s_expediente_id
			inner join s_resolucion t1 on t1.s_expediente_etapa_id=t2.s_expediente_etapa_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t3.cve_ur
			LEFT JOIN  s_participante t5 ON t2.responsable_atencion_id= t5.s_participante_id
			where
				(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (t3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (t3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND t1.sres_determinacion_multa=3 AND t2.see_estatus=2
				AND t7.sinc_procede_sancion=1 and t7.sinc_procede=1
				AND
			t1.s_resolucion_id=(select top 1 a1.s_resolucion_id from s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by s_resolucion_id desc
			 )
		) as num_incumplimientos3,
		
		(SELECT SUM(sres_monto_multa) FROM s_resolucion t1
			inner join s_expediente_etapa t2 on t2.s_expediente_etapa_id=t1.s_expediente_etapa_id
			inner join s_expediente t3 on t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t3.cve_ur
			LEFT JOIN  s_participante t5 ON t2.responsable_atencion_id= t5.s_participante_id
			where
				(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (t3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (t3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND t1.sres_tipo_resolucion=12 AND t2.see_estatus=2
				AND
			t1.s_resolucion_id=(select top 1 a1.s_resolucion_id from s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by s_resolucion_id desc
			 )
		) as multa_comp,
		(SELECT SUM(sres_monto_multa) FROM s_resolucion t1
			inner join s_expediente_etapa t2 on t2.s_expediente_etapa_id=t1.s_expediente_etapa_id
			inner join s_expediente t3 on t3.s_expediente_id=t2.s_expediente_id
			inner join dbo.cat_unidad_respon t4
			on t4.cur_cve_ur =t3.cve_ur
			LEFT JOIN  s_participante t5 ON t2.responsable_atencion_id= t5.s_participante_id
			where
				(t4.cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (t3.cve_ur= @cve_ur  OR @cve_ur  = -1) AND (t5.s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (t3.se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				AND t1.sres_tipo_resolucion=13 AND t2.see_estatus=2
				AND
			t1.s_resolucion_id=(select top 1 a1.s_resolucion_id from s_resolucion a1 
			 inner join s_expediente_etapa a2 on a1.s_expediente_etapa_id=a2.s_expediente_etapa_id
			 inner join s_expediente a3 on a2.s_expediente_id=a3.s_expediente_id
			 where a2.s_expediente_id=t2.s_expediente_id order by s_resolucion_id desc
			 )
		) as multa_rebel,
		(
		SELECT 
		COUNT(*)
		from s_acuerdo_notificacion anot
			inner join s_expediente_etapa exet on exet.s_expediente_etapa_id=anot.s_expediente_etapa_id
			inner join s_expediente ex on ex.s_expediente_id=exet.s_expediente_id
			inner join dbo.cat_unidad_respon catu
			on catu.cur_cve_ur =ex.cve_ur
			LEFT JOIN  s_participante par ON exet.responsable_atencion_id= par.s_participante_id
			where
				(cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)AND
				 (ex.cve_ur= @cve_ur  OR @cve_ur  = -1) AND(s_participante_id = @s_participante_id            OR @s_participante_id = -1)
				AND (se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
				and
				(exet.s_etapa_id=23 OR exet.s_etapa_id=18 OR exet.s_etapa_id=19)
				AND (select COUNT(*) from s_expediente_etapa t1 where t1.s_expediente_id=exet.s_expediente_id and t1.s_etapa_id=7 )=0
				AND 
				exet.see_estatus=2
		)AS cant_acuerdo_a2 
	from s_resolucion res
	inner join s_expediente_etapa exet on exet.s_expediente_etapa_id=res.s_expediente_etapa_id
	inner join s_expediente ex on ex.s_expediente_id=exet.s_expediente_id
	inner join inspeccion ins on ins.inspeccion_id=ex.inspeccion_id
	inner join dbo.cat_unidad_respon catu
	on catu.cur_cve_ur =ex.cve_ur
	LEFT JOIN  s_participante par ON exet.responsable_atencion_id= par.s_participante_id
	where
		(cur_cve_edorep       = @cve_edorep              OR @cve_edorep        = -1)
		AND
		 (ex.cve_ur= @cve_ur  OR @cve_ur  = -1) 
		AND
		(s_participante_id = @s_participante_id            OR @s_participante_id = -1)
		AND 
		(se_fec_recepcion BETWEEN @fecha1 AND @fecha2      OR @fecha1 is null)
		AND exet.see_estatus=2
		AND res.s_resolucion_id=(select top 1 t1.s_resolucion_id from s_resolucion t1 
			 inner join s_expediente_etapa t2 on t1.s_expediente_etapa_id=t2.s_expediente_etapa_id
			 inner join s_expediente t3 on t2.s_expediente_id=t3.s_expediente_id
			 where t2.s_expediente_id=ex.s_expediente_id order by s_resolucion_id desc
			 )
END














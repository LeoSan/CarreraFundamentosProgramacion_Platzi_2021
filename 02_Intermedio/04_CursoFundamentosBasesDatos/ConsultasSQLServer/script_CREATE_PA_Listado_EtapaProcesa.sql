USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		lcuenca
-- Create date: 2022-04-28
-- Description:	
-- =============================================

CREATE PROCEDURE [dbo].[PA_Listado_EtapaProcesal] 
	@cen_cve_edorep int = -1,
	@cur_cve_ur		int = -1,
	@s_participante_id	int = -1,
	@fec_inicio		datetime = null,
	@fec_final		datetime = null,
	@tipo_parametroA varchar(50) = null,
	@tipo_parametroB varchar(50) = null,
	@tipo_parametroC varchar(50) = null

AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @SQLString NVARCHAR(500);  
	
	-- Listo las materias 
		SELECT urs.cur_cve_ur, mat.materia_id ,cur_descrip_corta, mat.mat_acronimo,cur_cve_edorep
		INTO #materia_ur
		FROM dbo.materia mat,dbo.cat_unidad_respon urs
		WHERE mat.mat_acronimo IN ('CGT','SH','CA','AC')
		GROUP BY  urs.cur_cve_ur, mat.materia_id , cur_descrip_corta, mat.mat_acronimo,cur_cve_edorep
		ORDER BY urs.cur_cve_ur;
				
	-- Listo las etapas  
		SELECT MAX (s_expediente_etapa_id) ultimaEtapa_id, s_expediente_id as expediente_id 
		INTO #UltimaEtapa
		from dbo.s_expediente_etapa ex_etapa
		INNER JOIN  dbo.s_etapa etapa  ON etapa.s_etapa_id = ex_etapa.s_etapa_id
		where (see_estatus = 2 AND setapa_nivel = 1) GROUP BY s_expediente_id

-- Listo las etapas con las inpecciones 

               SELECT  ROW_NUMBER() OVER(ORDER BY urs.cur_cve_ur, urs.materia_id) id , cur_descrip_corta, urs.mat_acronimo, ex.se_num_expediente, ex.se_ct_razon_social, ex.s_expediente_id , ex.inspeccion_id, CONVERT(VARCHAR(30),ex.se_fec_recepcion,103) as se_fec_recepcion
					
					,COUNT(CASE WHEN s_etapa_id = 1 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) Alta
					,COUNT(CASE WHEN s_etapa_id = 2 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) Emplazamiento
					,COUNT(CASE WHEN s_etapa_id = 5 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) Comparecencia
					,COUNT(CASE WHEN s_etapa_id = 6 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) AcuerdoProcedimiento
					,COUNT(CASE WHEN s_etapa_id = 7 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) Resolucion
					,COUNT(CASE WHEN s_etapa_id = 8 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) SolicitudCobro
					,COUNT(CASE WHEN s_etapa_id = 9 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) InformeCobro
					,COUNT(CASE WHEN s_etapa_id = 14 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) AcuerdoImprocedencia
					,COUNT(CASE WHEN (s_etapa_id = 19  OR s_etapa_id = 20 OR s_etapa_id = 23) AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) AcuerdoArchivo
					,COUNT(CASE WHEN s_etapa_id = 15 OR s_etapa_id = 16
					             OR s_etapa_id = 17 OR s_etapa_id = 18
					             OR s_etapa_id = 21
					             OR s_etapa_id = 22 
					             OR s_etapa_id = 24 OR s_etapa_id = 25
					             OR s_etapa_id = 26  AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) AcuerdoTramite,
					COUNT(CASE WHEN s_etapa_id = 10 OR s_etapa_id = 11
					             OR s_etapa_id = 12 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) Impugnacion
					INTO #resultados
					FROM   #materia_ur urs 
					LEFT JOIN  dbo.inspeccion insp ON  urs .materia_id = insp.materia_id
					LEFT JOIN  dbo.s_expediente ex ON insp.inspeccion_id = ex.inspeccion_id AND urs.cur_cve_ur = ex.cve_ur 
					LEFT JOIN #UltimaEtapa ON expediente_id = ex.s_expediente_id
					LEFT JOIN dbo.s_expediente_etapa exet ON exet.s_expediente_etapa_id = ultimaEtapa_id AND exet.s_expediente_id = ex.s_expediente_id
					           
                    WHERE (cur_cve_edorep = @cen_cve_edorep OR @cen_cve_edorep = -1)
                          AND (urs.cur_cve_ur = @cur_cve_ur OR 	@cur_cve_ur = -1)
                          AND (cur_descrip_corta LIKE 'DFT%' OR cur_descrip_corta LIKE 'SFT%'  OR cur_descrip_corta LIKE 'DGAJ%' OR cur_descrip_corta LIKE 'SUB%') AND ex.se_num_expediente IS NOT NULL 
					GROUP BY  urs.cur_cve_ur,urs.materia_id, urs.cur_descrip_corta, urs.mat_acronimo, ex.se_num_expediente, ex.se_ct_razon_social, ex.s_expediente_id , ex.inspeccion_id, ex.se_fec_recepcion
				    ORDER BY cur_descrip_corta, urs.materia_id;

-- Del listado de las etapas y expedientes cuento el total 

	               SELECT *
				   INTO #resultado_dos
	               FROM #resultados
	               
	               UNION ALL
					
					SELECT (ROW_NUMBER() OVER(ORDER BY  urs.materia_id))* 100000 id ,'Total',urs.mat_acronimo,ex.se_num_expediente,ex.se_ct_razon_social, ex.s_expediente_id , ex.inspeccion_id, CONVERT(VARCHAR(30),ex.se_fec_recepcion,103) as se_fec_recepcion,
					
					COUNT(CASE WHEN s_etapa_id = 1 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) Alta,
					COUNT(CASE WHEN s_etapa_id = 2 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) Emplazamiento,
					COUNT(CASE WHEN s_etapa_id = 5 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) Comparecencia,
					COUNT(CASE WHEN s_etapa_id = 6 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) AcuerdoProcedimiento,
					COUNT(CASE WHEN s_etapa_id = 7 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) Resolución,
					COUNT(CASE WHEN s_etapa_id = 8 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) SolicitudCobro,
					COUNT(CASE WHEN s_etapa_id = 9 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) InformeCobro
					,
					COUNT(CASE WHEN s_etapa_id = 14 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) AcuerdoImprocedencia,
					COUNT(CASE WHEN (s_etapa_id = 19  OR s_etapa_id = 20 OR s_etapa_id = 23) AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) AcuerdoArchivo,
					COUNT(CASE WHEN s_etapa_id = 15 OR s_etapa_id = 16
					             OR s_etapa_id = 17 OR s_etapa_id = 18
					             OR s_etapa_id = 21
					             OR s_etapa_id = 22 
					             OR s_etapa_id = 24 OR s_etapa_id = 25
					             OR s_etapa_id = 26  AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) AcuerdoTramite,
					COUNT(CASE WHEN s_etapa_id = 10 OR s_etapa_id = 11
					             OR s_etapa_id = 12 AND (exet.responsable_atencion_id = @s_participante_id OR @s_participante_id = -1)
                                                   AND(exet.see_fec_inicio BETWEEN @fec_inicio AND @fec_final OR @fec_inicio	IS NULL) 
                                                   THEN ultimaEtapa_id END) Impugnacion
					FROM #materia_ur urs 
					LEFT JOIN  dbo.inspeccion insp ON  urs .materia_id = insp.materia_id
					LEFT JOIN  dbo.s_expediente ex ON insp.inspeccion_id = ex.inspeccion_id AND urs.cur_cve_ur = ex.cve_ur 
					LEFT JOIN  #UltimaEtapa ON expediente_id = ex.s_expediente_id
					LEFT JOIN dbo.s_expediente_etapa exet ON exet.s_expediente_etapa_id = ultimaEtapa_id AND exet.s_expediente_id = ex.s_expediente_id
                    WHERE (cur_cve_edorep = @cen_cve_edorep OR @cen_cve_edorep = -1)
                          AND (urs.cur_cve_ur = @cur_cve_ur OR 	@cur_cve_ur = -1)
                          AND (cur_descrip_corta LIKE 'DFT%' OR cur_descrip_corta LIKE 'SFT%'  OR cur_descrip_corta LIKE 'DGAJ%'OR cur_descrip_corta LIKE 'SUB%') AND ex.se_num_expediente IS NOT NULL
                    GROUP BY  urs.materia_id, urs.mat_acronimo, ex.se_num_expediente, ex.se_ct_razon_social, ex.s_expediente_id , ex.inspeccion_id,  se_fec_recepcion;
  
  	SET @SQLString = N'SELECT 
		 r.se_num_expediente 
		,r.se_fec_recepcion
		,r.se_ct_razon_social
		,r.s_expediente_id
		,r.inspeccion_id
		FROM #resultado_dos r
		WHERE cur_descrip_corta = ''' + @tipo_parametroA + ''' AND mat_acronimo ='''+ @tipo_parametroB +''' AND ' + @tipo_parametroC; 

	PRINT @SQLString;

	EXECUTE sp_executesql @SQLString;

END














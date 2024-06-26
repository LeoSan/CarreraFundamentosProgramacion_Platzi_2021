USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Inspeccion_AgregarAleatoria]    Script Date: 26/10/2022 10:28:37 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Canseco
-- Create date: 27/12/2011
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Inspeccion_AgregarAleatoria]
	@anio	 int,
	@mes	 int,
	@cve_ur	 int,
	@cve_ur_comision int = null,
	@anio_periodicas int = 1,
	@sys_usr varchar(20) = null


AS
BEGIN

    SET NOCOUNT ON;
	DECLARE @acronomo CHAR(8)

	SET @anio_periodicas *= -365;
	--== Checar si ya se agregaron empresas para el año,mes y unidad responsable ==--
	IF NOT EXISTS (SELECT 1 FROM dbo.inspeccion WHERE mes_id = @mes AND in_anio = @anio AND cve_ur = @cve_ur AND in_tipo_programacion_id = 1 AND operativo_id IS NULL)   --La variable cve_ur se utliza en la entidad dbo.inspeccion--
	BEGIN
		DECLARE @prog_anual_id	int,
				@prog_mes_id	int,
				@cen_cve_edorep	int,
				@pctNacional	int,
				@pctForaneas	int,
				@numCentros		int,
				@inspTotalOP	int,
				@inspTotal		int,
				@aleatoriaTotal int,
				@inspGrupo		int = 0,
				@inspContador	int = 0,
				@mg_id int, @m_id int,
				@metropolitano	char(1) = '%',
				--== Para el cursor ==--
				@materia_grupo_id int,
				@jurisdiccion	int,
				@num_materias	int,
				@pct_iniciales	int,
				@pct_periodicas	int,
				@iniciales_id	int,
				@periodicas_id	int,
				@valor1 int, 
				@valor2 int, 
				@valor3 int,
				@cursorAtributo_id int,
				@prioridaddne int,
				@top int = 0,
				@row int = 0;
		DECLARE @InspeccionesInsertadas table(inspeccion_id int);
		DECLARE @aplica_rspc int, @aplica_ac int, @aplica_sh int, @aplica_declare int, @numIteracion int = 0;
		
		
		
		--== Asigna valores a los campos ==--
		SELECT
			@prog_anual_id = pa.prog_anual_id,
			@prog_mes_id = pm.prog_mes_id,
			@cen_cve_edorep = ent.cen_cve_edorep,
			@pctNacional = pmes_total_nacional,
			@pctForaneas = pmes_total_foraneas,
			@inspTotalOP = (
				SELECT SUM(operent_num_operativos) FROM dbo.operativo_entidad oe
					INNER JOIN dbo.operativo o ON o.operativo_id = oe.operativo_id
				WHERE oe.operent_cve_edorep = ent.cen_cve_edorep AND oe.operent_cve_ur = ur.cur_cve_ur
					AND o.prog_anual_id = pm.prog_anual_id AND o.oper_estatus = 1 AND o.mes_id = pm.mes_id
			),
			--== Total mensual por entidad ==--
			@inspTotal = ISNULL(pe.pent_total_mensual, 0),
			@aleatoriaTotal = CEILING(CONVERT(decimal(18,2), @inspTotal) * CONVERT(decimal(18,2), pa.panual_pct_prog_aleatoria) / 100.0),
			@metropolitano = CASE pe.pent_pct_foraneas WHEN 1 THEN '%' ELSE 'S' END
		FROM
			dbo.cat_unidad_respon ur
			INNER JOIN dbo.cat_entidades ent ON ur.cur_cve_edorep = ent.cen_cve_edorep
			INNER JOIN dbo.prog_entidad pe ON ent.cen_cve_edorep = pe.pent_cve_edorep AND ur.cur_cve_ur = pe.pent_cve_ur
			INNER JOIN dbo.prog_mes pm ON pe.prog_mes_id = pm.prog_mes_id
			INNER JOIN dbo.prog_anual pa ON pm.prog_anual_id = pa.prog_anual_id
		WHERE pa.panual_anio = @anio AND pm.mes_id = @mes AND ur.cur_cve_ur = @cve_ur  --la entidad donde se utiliza la cve_ur es dbo.cat_unidad_respon--
		SELECT
			@mg_id = mg.materia_grupo_id,
			@m_id = mgd.materia_id
		FROM
			dbo.materia_grupo mg
			INNER JOIN dbo.materia_grupo_detalle mgd ON mg.materia_grupo_id = mgd.materia_grupo_id
		WHERE mg_nombre = 'CGT'

		--====================================--
		--== Insertar Operativos Aleatorias ==--
		--====================================--
		SELECT
			@inspContador = 0,
			@numIteracion = 1,
			@jurisdiccion = -1
		WHILE @inspContador < @inspTotalOP AND @numIteracion < 2 
		BEGIN 
			DECLARE @operativo_id int,
					@materia_id			int,
					@tipo_inspeccion_id	int,
					@prog_atributo_id	int,
					@motivo_inspeccion_id int,
					@numOperativos		int,
					@inspectores		int,
					@oper_tipo_operativo int;
			DECLARE Operativos CURSOR FOR
				SELECT
				    o.operativo_id,
					materia_id,
					tipo_inspeccion_id,
					prog_atributo_id,
					motivo_inspeccion_id,
					oper_asignar_inspectores,
					operent_num_operativos,
					CASE WHEN materia_id = @m_id THEN 1 ELSE -1 END AS jurisdiccion,
					o.oper_tipo_operativo
				FROM dbo.operativo o 
				INNER JOIN dbo.operativo_entidad oe ON o.operativo_id = oe.operativo_id
				WHERE	prog_anual_id = @prog_anual_id
					AND mes_id = @mes AND oper_estatus = 1
					AND oper_es_prog_aleatoria = 1
					--AND oper_tipo_operativo = 1 -- solo los programados
					AND operent_cve_edorep = @cen_cve_edorep
					AND operent_cve_ur = @cve_ur									--La entidad donde es utlizada la variable UR es en operativo entidad--
			--== Abrir cursor ==--
			OPEN Operativos
			--== Selecciona el primer row del cursor ==--
			FETCH NEXT FROM Operativos
			INTO @operativo_id, @materia_id, @tipo_inspeccion_id, @prog_atributo_id, 
				 @motivo_inspeccion_id, @inspectores, @numOperativos, @jurisdiccion, @oper_tipo_operativo
			--== Itera en todos los row del cursor ==--
			WHILE @@FETCH_STATUS = 0
			BEGIN
				DECLARE @InspeccionesOperativos TABLE(inspeccion_id int);
				--== Sleccionar todos los centros que ya tuvieron una inspeccion en el anio ==--
				SELECT centro_trabajo_id, materia_id INTO #conInspeccion3 FROM dbo.inspeccion 
				WHERE in_anio = @anio AND operativo_id IS NOT NULL
				
				--== START MOD ERNESTO ==--
				--== Calcula porcentajes de periodos DNE ==--
				SELECT
					@valor1 = @numOperativos * (pa_dne_valor1 / 100.00), 
					@valor2 = @numOperativos * (pa_dne_valor2 / 100.00),  
					@valor3 = @numOperativos * (pa_dne_valor3 / 100.00),
					@prioridaddne = pa_dne_prioridad
				FROM dbo.prog_atributo
				WHERE prog_atributo_id = @prog_atributo_id
				--== Crea tabla con valores de atributos ==--
				--== Obtiene atributos sin nulos ==--
				SELECT
					prog_atributo_id, 
					pa_dne_aplica, 
					ISNULL( pa_dne_prioridad,0 ) pa_dne_prioridad , 
					pa_dne_valor1, 
					pa_dne_valor2, 
					pa_dne_valor3, 
					pa_tamanio_aplica, 
					ISNULL( pa_tamanio_prioridad,0 ) pa_tamanio_prioridad , 
					pa_tamanio_valor1, 
					pa_tamanio_valor2, 
					pa_prioritaria_aplica, 
					ISNULL( pa_prioritaria_prioridad,0 ) pa_prioritaria_prioridad ,
					pa_clase_aplica, 
					ISNULL( pa_clase_prioridad,0 ) pa_clase_prioridad , 
					pa_clase_valor1, 
					pa_clase_valor2, 
					pa_clase_valor3, 
					pa_clase_valor4, 
					pa_clase_valor5, 
					pa_prima_aplica, 
					ISNULL( pa_prima_prioridad,0 ) pa_prima_prioridad , 
					pa_prima_valor1, 
					pa_prima_valor2, 
					pa_rspc_aplica, 
					ISNULL( pa_rspc_prioridad,0 ) pa_rspc_prioridad , 
					pa_sustancias_aplica, 
					ISNULL( pa_sustancias_prioridad,0 ) pa_sustancias_prioridad , 
					pa_liquidos_aplica, 
					ISNULL( pa_liquidos_prioridad,0 ) pa_liquidos_prioridad , 
					pa_piroforicos_aplica, 
					ISNULL( pa_piroforicos_prioridad,0 ) pa_piroforicos_prioridad , 
					pa_actividad_aplica, 
					ISNULL( pa_actividad_prioridad,0 ) pa_actividad_prioridad , 
					pa_actividad_tipo, 
					pa_ultima_aplica, 
					ISNULL( pa_ultima_prioridad,0 ) pa_ultima_prioridad , 
					pa_ultima_valor1, 
					pa_ptu_aplica, 
					ISNULL( pa_ptu_prioridad,0 ) pa_ptu_prioridad , 
					pa_reincidente_aplica, 
					ISNULL( pa_reincidente_prioridad,0 ) pa_reincidente_prioridad , 
					pa_pendientes_aplica, 
					ISNULL( pa_pendientes_prioridad,0 ) pa_pendientes_prioridad ,
					pa_capacitacion_aplica, 
					ISNULL( pa_capacitacion_prioridad,0 ) pa_capacitacion_prioridad , 
					pa_declare_aplica, 
					ISNULL( pa_declare_prioridad,0 ) pa_declare_prioridad , 
					pa_declare_valor1, 
					pa_passt_aplica, 
					ISNULL( pa_passt_prioridad,0 ) pa_passt_prioridad , 
					pa_passt_valor1, 
					pa_agencias_aplica, 
					ISNULL( pa_agencias_prioridad,0 ) pa_agencias_prioridad , 
					pa_agencias_valor1
				INTO #tablaAtributos3
				FROM dbo.prog_atributo
				WHERE prog_atributo_id = @prog_atributo_id
				--== Unpivot de atributos ==--
				SELECT
					REPLACE(atributo, '_aplica', '') AS atributo,
					aplica,
					atributo2,
					prioridad,
					ROW_NUMBER() OVER (ORDER BY aplica) AS atributo_id
				INTO #TablaAtributoPrioridad3
				FROM #tablaAtributos3
					UNPIVOT (
						aplica FOR atributo IN (
							pa_dne_aplica,
							pa_tamanio_aplica,
							pa_prioritaria_aplica,
							pa_clase_aplica,
							pa_prima_aplica,
							pa_rspc_aplica,
							pa_sustancias_aplica,
							pa_liquidos_aplica,
							pa_piroforicos_aplica,
							pa_actividad_aplica,
							pa_ultima_aplica,
							pa_ptu_aplica,
							pa_reincidente_aplica,
							pa_pendientes_aplica,
							pa_capacitacion_aplica,
							pa_declare_aplica,
							pa_passt_aplica,
							pa_agencias_aplica
						)
					) AS Aplican
					UNPIVOT (
						prioridad FOR atributo2 IN (
							pa_dne_prioridad,
							pa_tamanio_prioridad,
							pa_prioritaria_prioridad,
							pa_clase_prioridad,
							pa_prima_prioridad,
							pa_rspc_prioridad,
							pa_sustancias_prioridad,
							pa_liquidos_prioridad,
							pa_piroforicos_prioridad,
							pa_actividad_prioridad,
							pa_ultima_prioridad,
							pa_ptu_prioridad,
							pa_reincidente_prioridad,
							pa_pendientes_prioridad,
							pa_capacitacion_prioridad,
							pa_declare_prioridad,
							pa_passt_prioridad,
							pa_agencias_prioridad
						)
					) as Prioridades
					WHERE REPLACE(atributo, '_aplica', '') = REPLACE (atributo2, '_prioridad', '') AND aplica = 1
				--== Tabla para centros con atributos ==--
				DECLARE @CentrosResultado3 TABLE(centro_trabajo_id int, prioridad decimal(14,10))
				DELETE FROM @CentrosResultado3 WHERE centro_trabajo_id > 0;

				--== Selecciona los atributos especiales para hacer la seleccion de los centros ==--
				SELECT
					@aplica_sh = CASE pa.pa_passt_aplica WHEN 1 THEN CASE pa.pa_passt_valor1 WHEN 1 THEN 0 ELSE 1 END ELSE 0 END,
					@aplica_ac = CASE pa.pa_agencias_aplica WHEN 1 THEN CASE pa.pa_agencias_valor1 WHEN 1 THEN 1 ELSE 0 END ELSE 0 END,
					@aplica_rspc = CASE pa.pa_rspc_aplica WHEN 1 THEN 1 ELSE 0 END,
					@aplica_declare = CASE pa.pa_declare_aplica WHEN 1 THEN CASE pa.pa_declare_valor1 WHEN 1 THEN 0 ELSE 1 END ELSE 0 END
				FROM dbo.prog_atributo pa WHERE prog_atributo_id = @prog_atributo_id
				--== Selecciona el acronomo de materia  ==--
				SELECT @acronomo=m.mat_acronimo FROM dbo.materia m WHERE m.materia_id = @materia_id
				--== Selecciona a los centros que son aptos para seleccion ==--
				SELECT 
					(	SELECT TOP(1) cm_fec_ultima_inspeccion FROM dbo.materia m 
							INNER JOIN dbo.centro_materiaDNE cm ON cm.cm_materia COLLATE Latin1_General_CI_AS = m.mat_acronimo
						WHERE m.materia_id = @materia_id AND cm.centro_trabajo_id = ct.centro_trabajo_id
						ORDER BY cm_fec_ultima_inspeccion DESC
					) as cm_fec_ultima_inspeccion_materia,
					emp_rfc, emp_nombre,
					ct.centro_trabajo_id,
					ct_num_trabajadores,
					ct_actividad_imss_riesgo,
					ct_prima_riesgo,
					ct_tiene_rspc,
					ct_sust_quimicas_peligrosas,
					ct_liquidos_inflamables,
					ct_materiales_piroforicos,
					ct_actividad_scian,
					ct_visitada_oper_ptu,
					ct_reincidente_violacion_grave,
					ct_proc_pendientes_ultimo_anio,
					ct_sin_planes,
					ct_en_declare,
					ct_en_passt,
					ct_es_agencia_colocacion,
					ct_nombre,
					ct_imss_registro,
					ct_calle,
					ct_num_exterior,
					ct_num_interior,
					ct_colonia,
					ct_cp,
					ct_cve_edorep,
					ct_cve_municipio,
					ct_es_prioritario,
					rama_industrial_id,
					ct.sys_fec_insert
				INTO #CT3 FROM dbo.empresaDNE emp  WITH (NOLOCK)
					INNER JOIN centro_trabajoDNE ct WITH (NOLOCK) ON   ct.empresa_id = emp.empresa_id
					INNER JOIN dbo.cat_municipios mun ON mun.cmu_cve_municipio = ct.ct_cve_municipio AND mun.cmu_cve_edorep = ct.ct_cve_edorep
				WHERE	ct_estatus = 1 AND emp_estatus = 1 AND ct_cve_edorep = @cen_cve_edorep 
					AND (ct_jurisdiccion = @jurisdiccion OR @jurisdiccion = -1) 
					AND mun.cmu_cve_ur = @cve_ur AND mun.cmu_metropolitano LIKE @metropolitano						-----La entidad es cat_municipios "cmu_cve_ur"---
					AND NOT EXISTS (SELECT 1 FROM #conInspeccion3 i WHERE i.centro_trabajo_id = ct.centro_trabajo_id)
					AND EXISTS (
						SELECT 1 FROM dbo.prog_actividad_scian pas
							INNER JOIN dbo.cat_scian s1  ON s1.cae_id = pas.pas_cae_id
							INNER JOIN dbo.cat_scian s2 ON s1.cae_sector = s2.cae_sector 
								AND (s1.cae_subsector IS NULL OR s1.cae_subsector = s2.cae_subsector)
								AND (s1.cae_rama IS NULL OR s1.cae_rama = s2.cae_rama)
								AND s1.cae_subrama IS NULL AND s1.cae_clase IS NULL
								AND s2.cae_id = ct_actividad_scian
							INNER JOIN dbo.prog_atributo pa ON pa.prog_atributo_id = pas.prog_atributo_id 
						WHERE pa.prog_atributo_id = @prog_atributo_id --AND pas_ponderacion = 1
							AND pa.pa_actividad_aplica = 1 AND pa.pa_actividad_tipo = 2
					)	--== Para SH ==--
					AND (ct_en_passt = 0 OR ct_en_passt IS NULL OR @aplica_sh <> 1 OR @acronomo <> 'SH')
						--== Para AC ==--
					AND (tipo_agencia_id IS NOT NULL OR @aplica_ac <> 1 OR @acronomo <> 'AC')
						--== Para RSPC ==--
					AND (ct_tiene_rspc = 1 OR @aplica_rspc <> 1 OR @acronomo <> 'RSPC')
						--== Para DECLARE
					AND (ct_en_declare = 0 OR ct_en_declare IS NULL OR @aplica_declare <> 1)


					INSERT @CentrosResultado3
					SELECT
						centro_trabajo_id,
						SUM(ISNULL(1 / CAST(NULLIF(prioridad, 0) as decimal(14, 10)), 0.0000000001)) as prioridad
					FROM
						#CT3
						INNER JOIN #TablaAtributoPrioridad3	ON atributo <> 'pa_dne'
						INNER JOIN dbo.prog_atributo		ON dbo.prog_atributo.prog_atributo_id = @prog_atributo_id
							--Tamaño de la empresa--			  
					WHERE	(ct_num_trabajadores BETWEEN pa_tamanio_valor1 AND pa_tamanio_valor2 OR atributo <> 'pa_tamanio')
							--Empresas prioritarias--
						AND	(ct_es_prioritario = 1 OR atributo <> 'pa_prioritaria')
							--Clase de riesgo--
						AND (	(	(pa_clase_valor1 = 1 AND ct_actividad_imss_riesgo = 1)
								OR	(pa_clase_valor2 = 1 AND ct_actividad_imss_riesgo = 2)
								OR	(pa_clase_valor3 = 1 AND ct_actividad_imss_riesgo = 3)
								OR	(pa_clase_valor4 = 1 AND ct_actividad_imss_riesgo = 4)
								OR	(pa_clase_valor5 = 1 AND ct_actividad_imss_riesgo = 5))
							OR	atributo <> 'pa_clase')
							--Prima de riesgo IMSS--
						AND (ct_prima_riesgo BETWEEN pa_prima_valor1 AND pa_prima_valor2 OR atributo <> 'pa_prima')
							--Recipientes sujetos a presión y calderas--
						AND (ct_tiene_rspc = 1 OR atributo <> 'pa_rspc')
							--Manejo, almacenamiento y transportación de sustancias químicas peligrosas--
						AND (ct_sust_quimicas_peligrosas = 1 OR atributo <> 'pa_sustancias')
							--Líquidos inflamables en inventario mayor a 1400 litros--
						AND (ct_liquidos_inflamables = 1 OR atributo <> 'pa_liquidos')
							--Materiales pirofóricos o explosivos en inventario--
						AND (ct_materiales_piroforicos = 1 OR atributo <> 'pa_piroforicos')
							--Actividad económica--
						AND (	
								EXISTS (
									SELECT 1d FROM dbo.prog_actividad_scian
										INNER JOIN dbo.cat_scian s1  ON s1.cae_id = pas_cae_id
										INNER JOIN dbo.cat_scian s2 ON s1.cae_sector = s2.cae_sector 
											AND (s1.cae_subsector IS NULL OR s1.cae_subsector = s2.cae_subsector)
											AND (s1.cae_rama IS NULL OR s1.cae_rama = s2.cae_rama)
											AND s1.cae_subrama IS NULL AND s1.cae_clase IS NULL
											AND s2.cae_id = ct_actividad_scian
									WHERE prog_atributo_id = dbo.prog_atributo.prog_atributo_id --AND pas_ponderacion = 1
								)
							OR	atributo <> 'pa_actividad') 
							--Fecha de última inspección--
						AND (	(pa_ultima_valor1 < 4 AND cm_fec_ultima_inspeccion_materia >= DATEADD(DAY, pa_ultima_valor1 * -365, GETDATE()))
							OR	(pa_ultima_valor1 = 4 AND cm_fec_ultima_inspeccion_materia <= DATEADD(DAY, pa_ultima_valor1 * -365, GETDATE()))
							OR	atributo <> 'pa_ultima')
							--En último operativo de PTU no visitada o visitada con incumplimientos
						AND (	NOT EXISTS (
									SELECT 1 FROM dbo.centro_materiaDNE cm
									WHERE DATEDIFF(YEAR, ISNULL(cm_fec_ultima_inspeccion, GETDATE()), DATEADD(YEAR, -1, GETDATE())) = 0
										AND cm.centro_trabajo_id = #CT3.centro_trabajo_id AND cm.cm_es_ptu = 1
								)
							OR	ct_visitada_oper_ptu = 1 OR atributo <> 'pa_ptu')
							--Reincidentes en violaciones graves
						AND (ct_reincidente_violacion_grave = 1 OR atributo <> 'pa_reincidente') 
							--Procesos sancionadores pendientes en el último año
						AND (ct_proc_pendientes_ultimo_anio = 1 OR atributo <> 'pa_pendientes')
							--Sin planes y programas de capacitación y adiestramiento o con planes vencidos
						AND (ct_sin_planes = 1 OR atributo <> 'pa_capacitacion')
							--Empresas en DECLARE
						AND (ct_en_declare = pa_declare_valor1 OR atributo <> 'pa_declare')
							--Empresas en PASST
						AND (ct_en_passt = pa_passt_valor1 OR atributo <> 'pa_passt')
							--Agencias de colocación
						AND (ct_es_agencia_colocacion = pa_agencias_valor1 OR atributo <> 'pa_agencias')
                        GROUP BY #CT3.centro_trabajo_id 
					    
					    INSERT @CentrosResultado3
						SELECT centro_trabajo_id, 0 as prioridad FROM #CT3
						WHERE  NOT EXISTS (SELECT 1 FROM @CentrosResultado3 ct3 WHERE #CT3.centro_trabajo_id = ct3.centro_trabajo_id)
                
				
				--== Seleccionar los centros que son aptos para una inspeccion ==--
				SELECT DISTINCT TOP (ISNULL(@numOperativos, 0)) centro_trabajo_id,prioridad 
				INTO #ctAgregar3 
				FROM (
							SELECT TOP (ISNULL(@valor1, 0)) dne.centro_trabajo_id,prioridad 
							FROM #CT3 dne INNER JOIN @CentrosResultado3 cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
							WHERE dne.sys_fec_insert > DATEADD(DAY, -365, GETDATE()) ORDER BY prioridad DESC, NEWID()
				
					UNION ALL
				
							SELECT TOP (ISNULL(@valor2, 0)) dne.centro_trabajo_id, prioridad--, 2 as x
							FROM #CT3 dne INNER JOIN @CentrosResultado3 cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
							WHERE dne.sys_fec_insert BETWEEN DATEADD(DAY, -1095, GETDATE()) AND DATEADD(DAY, -365, GETDATE()) ORDER BY prioridad DESC, NEWID()
					
					UNION ALL
					
							SELECT TOP (ISNULL(@valor3, 0)) dne.centro_trabajo_id, prioridad--, 3 as x
							FROM #CT3 dne INNER JOIN @CentrosResultado3 cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
							WHERE dne.sys_fec_insert < DATEADD(DAY, -1095, GETDATE()) ORDER BY prioridad DESC, NEWID()
					
					UNION ALL				
						
							SELECT TOP (ISNULL(@numOperativos, 0)) dne.centro_trabajo_id, prioridad--, 0 as x
							FROM #CT3 dne INNER JOIN @CentrosResultado3 cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
							ORDER BY prioridad DESC, NEWID()
					
				) as tablappal
				--=====================--
				--== END MOD ERNESTO ==--
				SET @top = @numOperativos;
				IF (@top > @inspTotalOP - @inspContador)
					SET @top = @inspTotalOP - @inspContador;
				--== Insertar @inspTotalOP - @inspContador de inspecciones
				INSERT INTO dbo.inspeccion (
					mes_id,
					materia_id,
					motivo_inspeccion_id,
					in_medio_informacion,
					in_req_documentos_inicio,
					in_req_documentos_termino,
					subtipo_inspeccion_id,
					operativo_id,
					cve_ur,
					cve_rama,
					centro_trabajo_id,
					in_anio,
					in_ct_rfc,
					in_ct_razon_social,
					in_ct_nombre,
					in_ct_imss_registro,
					in_ct_clase_riesgo,
					--in_alcance,
					in_domicilio_inspeccion,
					in_en_declare,
					in_en_passt,
					in_etapa,
					in_estatus,
					in_tipo_programacion_id,
					sys_usr_insert,
					sys_fec_insert,
					in_aplica_especial
				)
				--== OUTPUT ==--
				OUTPUT INSERTED.inspeccion_id
				INTO @InspeccionesOperativos
				--== OUTPUT ==--
				SELECT TOP (@top)
					@mes,
					@materia_id,
					@motivo_inspeccion_id,
					(SELECT
						CASE motiv_pedir_campo_adicional 
							WHEN 1 THEN oper_medio_informacion 
							ELSE NULL 
						END
					 FROM dbo.operativo o, dbo.motivo_inspeccion mi
					 WHERE	o.motivo_inspeccion_id = mi.motivo_inspeccion_id 
						AND o.motivo_inspeccion_id = @motivo_inspeccion_id
						AND o.operativo_id = @operativo_id),
					(SELECT oper_fec_inicio FROM dbo.operativo WHERE operativo_id = @operativo_id),
					(SELECT oper_fec_termino FROM dbo.operativo WHERE operativo_id = @operativo_id),
					4, -- Extraordinaria
					@operativo_id,
					@cve_ur,
					ct.rama_industrial_id,
					ct.centro_trabajo_id,
					@anio,
					ct.emp_rfc,
					ct.emp_nombre,
					ct.ct_nombre,
					ct.ct_imss_registro,
					ct.ct_actividad_imss_riesgo,
					--1, -- General
					--== Domicilio ==--
					CASE WHEN NULLIF(ct.ct_calle, '') IS NULL THEN '' ELSE ct.ct_calle + ' ' END + 
					CASE WHEN NULLIF(ct.ct_num_exterior, '') IS NULL THEN '' ELSE 'No. ' + ct.ct_num_exterior + ', ' END +
					CASE WHEN NULLIF(ct.ct_num_interior, '') IS NULL THEN '' ELSE 'Interior ' + ct.ct_num_interior + ', ' END +
					CASE WHEN NULLIF(ct.ct_colonia, '') IS NULL THEN '' ELSE 'Colonia ' + ct.ct_colonia + ', ' END +
					CASE WHEN NULLIF(ct.ct_cp, '') IS NULL THEN '' ELSE 'C.P. ' + ct.ct_cp + ', ' END + 
					(SELECT cmu_descripcion + ', ' COLLATE Latin1_General_CI_AS FROM dbo.cat_municipios 
					 WHERE cmu_cve_edorep = ct.ct_cve_edorep AND cmu_cve_municipio = ct.ct_cve_municipio) + 
					(SELECT cen_descripcion COLLATE Latin1_General_CI_AS 
					 FROM dbo.cat_entidades WHERE cen_cve_edorep = ct.ct_cve_edorep),
					ct.ct_en_declare,
					ct.ct_en_passt,
					0,
					null, -- Porque la ariana lo pido null en el estatus
					1,
					@sys_usr,
					GETDATE(),
					CASE @oper_tipo_operativo WHEN 2 THEN @operativo_id ELSE NULL END
				FROM
					#ctAgregar3 cta
					INNER JOIN #CT3 ct ON cta.centro_trabajo_id = ct.centro_trabajo_id
				--== Actualiza el contador de inspecciones insertadas ==--
				SET @inspContador = @inspContador + @@RowCount;
				
				--== Agregar inspectores a las inspecciones si es que hay ==--
				IF (SELECT COUNT(inspeccion_id) FROM @InspeccionesOperativos) > 0
				BEGIN
					--============================================--
					--== Insertar Participantes equitativamente ==--
					--============================================--
					DECLARE @p_id int,
							@nump int;
					DECLARE @InspeccionesOperativos2 TABLE(inspeccion_id int);
					--== Selecciona a los participantes asignados y los de la UR ==-
					SELECT participante_id INTO #participantes
					FROM (	SELECT participante_id FROM dbo.participante 
							WHERE cve_ur = @cve_ur AND par_es_inspector = 1 AND par_estatus = 1			---- cve_UR  se utiliza en la entidad dbo.participante-------
						UNION ALL
							SELECT participante_id FROM dbo.participante p, dbo.operativo_asignacion oa 
							WHERE par_estatus = 1 AND p.inspector_id = oa.inspector_id AND operativo_id = @operativo_id 
								AND oa.oas_cve_ur = @cve_ur AND oa.oas_cve_edorep = @cen_cve_edorep		------cve_UR se utiliza en la entidad dbo.opertivo_asignacion----
					) as tb
					ORDER BY NEWID()
					--== Seleccionar el numero de inspecciones por participante ==--
					SELECT
						@nump = CEILING(
							CONVERT(decimal(18,2), (SELECT NULLIF(COUNT(inspeccion_id), 0) FROM @InspeccionesOperativos)) /
							CONVERT(decimal(18,2), (SELECT NULLIF(COUNT(participante_id), 0) FROM #participantes))
						)
					--== Cursor para iterar entre todos los participantes ==--
					DECLARE Participantes CURSOR FOR SELECT participante_id FROM #participantes
					--== Abrir cursor ==--
					OPEN Participantes
					--== Selecciona el primer row del cursor ==--
					FETCH NEXT FROM Participantes INTO @p_id
					WHILE @@FETCH_STATUS = 0
					BEGIN
						--== Agrega inspecciones aleatoriamente para el inspectores ==--
						INSERT INTO dbo.inspec_participante (
							inspeccion_id,
							participante_id,
							ipar_tipo_participacion,
							sys_usr_insert,
							sys_fec_insert
						)
						--== OUTPUT ==--
						OUTPUT INSERTED.inspeccion_id
						INTO @InspeccionesOperativos2
						--== OUTPUT ==--
						SELECT TOP(ISNULL(@nump, 0))
							inspeccion_id,
							@p_id,
							1,--(SELECT TOP(1) fundamento_designacion_id FROM dbo.fundamento_designacion ORDER BY NEWID()),
							@sys_usr,
							GETDATE()
						FROM @InspeccionesOperativos ORDER BY NEWID()
						--== Borra las inspecciones que han sido agregadas para que no se repitan ==--
						DELETE FROM @InspeccionesOperativos WHERE inspeccion_id IN (SELECT inspeccion_id FROM @InspeccionesOperativos2)
						--== Si ya no hay inspecciones que agregarles inspector terminar el WHILE ==--
						IF (SELECT COUNT(inspeccion_id) FROM @InspeccionesOperativos) = 0 BREAK;
						--== Selecciona el siguiente row del cursor ==--
						FETCH NEXT FROM Participantes INTO @p_id
					END
					--== Cierra el cursor ==--
					CLOSE Participantes;
					--== Libera memoria ==--
					DEALLOCATE Participantes;
					DROP TABLE #participantes;
					--============================================--
					--== Insertar Participantes equitativamente ==--
					--============================================--
				END
				
				--== Eliminar tablas temporales ==--
				DROP TABLE
					#CT3,
					#ctAgregar3,
					#conInspeccion3,
					#tablaAtributos3,
					#TablaAtributoPrioridad3
				--== Si ya no hay se agregaron todas la inspecciones terminar el WHILE ==--	
				IF (@inspTotalOP <= @inspContador) 
				BEGIN
					SET @numIteracion += 1;
					BREAK;
				END	
				--== Selecciona el siguiente row del cursor ==--
				FETCH NEXT FROM Operativos
				INTO @operativo_id, @materia_id, @tipo_inspeccion_id, @prog_atributo_id, 
					 @motivo_inspeccion_id, @inspectores, @numOperativos, @jurisdiccion, @oper_tipo_operativo
			END
			--== Cierra el cursor ==--
			CLOSE Operativos;
			--== Libera memoria ==--
			DEALLOCATE Operativos;
			
			--== Hace que termine el WHILE en dos iteraciones
			SET @numIteracion += 1;
		END
		--====================================--
		--== Insertar Operativos Aleatorias ==--
		--====================================--
		
		--======================================--
		--== Insertar Inspecciones Aleatorias ==--
		--======================================--
		SELECT
			@aleatoriaTotal = @aleatoriaTotal - @inspContador,
			@inspContador = 0,
			@numIteracion = 0,
			@jurisdiccion = -1
		WHILE @inspContador < @inspTotal AND @numIteracion < 2
		BEGIN
			--== Cursor para iterar entre todos los grupos de materia ==--
			DECLARE ProgMateria CURSOR FOR
				SELECT mg.materia_grupo_id, mg_jurisdiccion, mg_num_materias, 
					   pmat_pct_iniciales, pmat_pct_periodicas, 
					   prog_atributo_iniciales_id, prog_atributo_periodicas_id
				FROM
					dbo.prog_materia pm 
					INNER JOIN dbo.materia_grupo mg ON pm.materia_grupo_id = mg.materia_grupo_id
				WHERE prog_anual_id = @prog_anual_id
				--== MAX_SMALL_INT = 32767 ==--
				ORDER BY ISNULL(pmat_prioridad, 32767), mg.materia_grupo_id
			--== abrir el cursor ==--
			OPEN ProgMateria
			--== Selecciona el primer row del cursor ==--
			FETCH NEXT FROM ProgMateria
			INTO @materia_grupo_id, @jurisdiccion, @num_materias, 
				 @pct_iniciales, @pct_periodicas, @iniciales_id, @periodicas_id
			--== Itera en todos los row del cursor ==--
			WHILE @@FETCH_STATUS = 0
			BEGIN
			
				SELECT  emp_rfc, emp_nombre,
						    ct.*
					INTO #CT_OUTER FROM dbo.empresaDNE emp  WITH (NOLOCK)
					     INNER JOIN centro_trabajoDNE ct WITH (NOLOCK) ON    ct.empresa_id = emp.empresa_id
						INNER JOIN dbo.cat_municipios mun ON mun.cmu_cve_municipio = ct.ct_cve_municipio AND mun.cmu_cve_edorep = ct.ct_cve_edorep
					WHERE	ct_estatus = 1 AND emp_estatus = 1 AND ct_cve_edorep = @cen_cve_edorep 
						AND (ct_jurisdiccion = @jurisdiccion OR @jurisdiccion = -1) 
						AND mun.cmu_cve_ur = @cve_ur AND mun.cmu_metropolitano LIKE @metropolitano     -----la variable cve_ur se utiliza en la entidad dbo.cat_municipios----
						
			
				IF (@iniciales_id IS NOT NULL)
				BEGIN
					--== INICIAL ==--
					--== Sleccionar todos los centros que ya tuvieron una inspeccion en el anio ==--
					SELECT centro_trabajo_id, i.materia_id INTO #conInspeccion FROM dbo.inspeccion i
						INNER JOIN dbo.materia_grupo_detalle mgd ON i.materia_id = mgd.materia_id
					WHERE in_anio = @anio AND operativo_id IS NULL AND mgd.materia_grupo_id = @materia_grupo_id
					--== Calcular cuantos centros se agregan ==--
					SELECT
						@inspGrupo = CEILING(CONVERT(decimal(18,2), @inspTotal) * (CONVERT(decimal(18,2), @pct_iniciales) / 100.00)),
						@numCentros = CEILING(@inspGrupo / CONVERT(decimal(18,2), @num_materias)),
						@jurisdiccion = CASE @num_materias WHEN 1 THEN CASE WHEN @materia_grupo_id = @mg_id THEN @jurisdiccion ELSE -1 END ELSE @jurisdiccion END
					
					--== START MOD ERNESTO ==--
					--== Calcula porcentajes de periodos DNE ==--
					SELECT
						@valor1 = @numCentros * (pa_dne_valor1 / 100.00), 
						@valor2 = @numCentros * (pa_dne_valor2 / 100.00),  
						@valor3 = @numCentros * (pa_dne_valor3 / 100.00),
						@prioridaddne = pa_dne_prioridad
					FROM dbo.prog_atributo
					WHERE prog_atributo_id = @iniciales_id
					--== Crea tabla con valores de atributos ==--
					--== Obtiene atributos sin nulos ==--
					SELECT
						prog_atributo_id, 
						pa_dne_aplica, 
						ISNULL( pa_dne_prioridad,0 ) pa_dne_prioridad , 
						pa_dne_valor1, 
						pa_dne_valor2, 
						pa_dne_valor3, 
						pa_tamanio_aplica, 
						ISNULL( pa_tamanio_prioridad,0 ) pa_tamanio_prioridad , 
						pa_tamanio_valor1, 
						pa_tamanio_valor2, 
						pa_prioritaria_aplica, 
						ISNULL( pa_prioritaria_prioridad,0 ) pa_prioritaria_prioridad ,
						pa_clase_aplica, 
						ISNULL( pa_clase_prioridad,0 ) pa_clase_prioridad , 
						pa_clase_valor1, 
						pa_clase_valor2, 
						pa_clase_valor3, 
						pa_clase_valor4, 
						pa_clase_valor5, 
						pa_prima_aplica, 
						ISNULL( pa_prima_prioridad,0 ) pa_prima_prioridad , 
						pa_prima_valor1, 
						pa_prima_valor2, 
						pa_rspc_aplica, 
						ISNULL( pa_rspc_prioridad,0 ) pa_rspc_prioridad , 
						pa_sustancias_aplica, 
						ISNULL( pa_sustancias_prioridad,0 ) pa_sustancias_prioridad , 
						pa_liquidos_aplica, 
						ISNULL( pa_liquidos_prioridad,0 ) pa_liquidos_prioridad , 
						pa_piroforicos_aplica, 
						ISNULL( pa_piroforicos_prioridad,0 ) pa_piroforicos_prioridad , 
						pa_actividad_aplica, 
						ISNULL( pa_actividad_prioridad,0 ) pa_actividad_prioridad , 
						pa_actividad_tipo, 
						pa_ultima_aplica, 
						ISNULL( pa_ultima_prioridad,0 ) pa_ultima_prioridad , 
						pa_ultima_valor1, 
						pa_ptu_aplica, 
						ISNULL( pa_ptu_prioridad,0 ) pa_ptu_prioridad , 
						pa_reincidente_aplica, 
						ISNULL( pa_reincidente_prioridad,0 ) pa_reincidente_prioridad , 
						pa_pendientes_aplica, 
						ISNULL( pa_pendientes_prioridad,0 ) pa_pendientes_prioridad ,
						pa_capacitacion_aplica, 
						ISNULL( pa_capacitacion_prioridad,0 ) pa_capacitacion_prioridad , 
						pa_declare_aplica, 
						ISNULL( pa_declare_prioridad,0 ) pa_declare_prioridad , 
						pa_declare_valor1, 
						pa_passt_aplica, 
						ISNULL( pa_passt_prioridad,0 ) pa_passt_prioridad , 
						pa_passt_valor1, 
						pa_agencias_aplica, 
						ISNULL( pa_agencias_prioridad,0 ) pa_agencias_prioridad , 
						pa_agencias_valor1
					INTO #tablaAtributos
					FROM dbo.prog_atributo
					WHERE prog_atributo_id = @iniciales_id
					--== Unpivot de atributos ==--
					SELECT
						REPLACE(atributo, '_aplica', '') AS atributo,
						aplica,
						atributo2,
						prioridad,
						ROW_NUMBER() OVER (ORDER BY aplica) AS atributo_id
					INTO #TablaAtributoPrioridad 
					FROM #tablaAtributos 
						UNPIVOT (
							aplica FOR atributo IN (
								pa_dne_aplica,
								pa_tamanio_aplica,
								pa_prioritaria_aplica,
								pa_clase_aplica,
								pa_prima_aplica,
								pa_rspc_aplica,
								pa_sustancias_aplica,
								pa_liquidos_aplica,
								pa_piroforicos_aplica,
								pa_actividad_aplica,
								pa_ultima_aplica,
								pa_ptu_aplica,
								pa_reincidente_aplica,
								pa_pendientes_aplica,
								pa_capacitacion_aplica,
								pa_declare_aplica,
								pa_passt_aplica,
								pa_agencias_aplica
							)
						) AS Aplican
						UNPIVOT (
							prioridad FOR atributo2 IN (
								pa_dne_prioridad,
								pa_tamanio_prioridad,
								pa_prioritaria_prioridad,
								pa_clase_prioridad,
								pa_prima_prioridad,
								pa_rspc_prioridad,
								pa_sustancias_prioridad,
								pa_liquidos_prioridad,
								pa_piroforicos_prioridad,
								pa_actividad_prioridad,
								pa_ultima_prioridad,
								pa_ptu_prioridad,
								pa_reincidente_prioridad,
								pa_pendientes_prioridad,
								pa_capacitacion_prioridad,
								pa_declare_prioridad,
								pa_passt_prioridad,
								pa_agencias_prioridad
							)
						) as Prioridades
						WHERE REPLACE(atributo, '_aplica', '') = REPLACE (atributo2, '_prioridad', '') AND aplica = 1
					--== Tabla para centros con atributos ==--
					DECLARE @CentrosResultado TABLE(centro_trabajo_id int,prioridad decimal(14, 10))
					DELETE FROM @CentrosResultado WHERE centro_trabajo_id > 0;

					--== Selecciona los atributos especiales para hacer la seleccion de los centros ==--
					SELECT
						@aplica_sh = CASE pa.pa_passt_aplica WHEN 1 THEN CASE pa.pa_passt_valor1 WHEN 1 THEN 0 ELSE 1 END ELSE 0 END,
						@aplica_ac = CASE pa.pa_agencias_aplica WHEN 1 THEN CASE pa.pa_agencias_valor1 WHEN 1 THEN 1 ELSE 0 END ELSE 0 END,
						@aplica_rspc = CASE pa.pa_rspc_aplica WHEN 1 THEN 1 ELSE 0 END,
						@aplica_declare = CASE pa.pa_declare_aplica WHEN 1 THEN CASE pa.pa_declare_valor1 WHEN 1 THEN 0 ELSE 1 END ELSE 0 END
					FROM dbo.prog_atributo pa WHERE prog_atributo_id = @iniciales_id
					--== Selecciona a los centros que son aptos para seleccion ==--
					SELECT  emp_rfc, emp_nombre,
						    centro_trabajo_id,
							ct_num_trabajadores,
							ct_actividad_imss_riesgo,
							ct_prima_riesgo,
							ct_tiene_rspc,
							ct_sust_quimicas_peligrosas,
							ct_liquidos_inflamables,
							ct_materiales_piroforicos,
							ct_actividad_scian,
							ct_visitada_oper_ptu,
							ct_reincidente_violacion_grave,
							ct_proc_pendientes_ultimo_anio,
							ct_sin_planes,
							ct_en_declare,
							ct_en_passt,
							ct_es_agencia_colocacion,
							ct_nombre,
							ct_imss_registro,
							ct_calle,
							ct_num_exterior,
							ct_num_interior,
							ct_colonia,
							ct_cp,
							ct_cve_edorep,
							ct_cve_municipio,
							ct_es_prioritario,
							rama_industrial_id,
							ct.sys_fec_insert
					INTO #CT FROM  #CT_OUTER ct
					WHERE NOT EXISTS(
								SELECT 1 FROM #conInspeccion i WHERE i.centro_trabajo_id = ct.centro_trabajo_id
							UNION ALL
								SELECT centro_trabajo_id FROM dbo.centro_materiaDNE cm
									INNER JOIN dbo.materia m ON cm.cm_materia COLLATE Latin1_General_CI_AS = m.mat_acronimo
									INNER JOIN dbo.materia_grupo_detalle mgd ON m.materia_id = mgd.materia_id
								WHERE centro_trabajo_id = ct.centro_trabajo_id AND mgd.materia_grupo_id = @materia_grupo_id
							)
							--== Para SH ==--
						AND (ct_en_passt = 0 OR ct_en_passt IS NULL OR @aplica_sh <> 1 OR @materia_grupo_id <> 4)
							--== Para AC ==--
						AND (tipo_agencia_id IS NOT NULL OR @aplica_ac <> 1 OR @materia_grupo_id <> 5)
							--== Para RSPC ==--
						AND (ct_tiene_rspc = 1 OR @aplica_rspc <> 1 OR @materia_grupo_id <> 6)
							--== Para DECLARE
						AND (ct_en_declare = 0 OR ct_en_declare IS NULL OR @aplica_declare <> 1)


						INSERT @CentrosResultado
						SELECT
							centro_trabajo_id,
							SUM(ISNULL(1 / CAST(NULLIF(prioridad, 0) as decimal(14, 10)), 0.0000000001)) as prioridad
						FROM
							#CT ct
							INNER JOIN #TablaAtributoPrioridad	ON atributo <> 'pa_dne'
							INNER JOIN dbo.prog_atributo		ON dbo.prog_atributo.prog_atributo_id = @iniciales_id
								--Tamaño de la empresa--			  
						WHERE	(ct_num_trabajadores BETWEEN pa_tamanio_valor1 AND pa_tamanio_valor2 OR atributo <> 'pa_tamanio')
								--Empresas prioritarias--
							AND (ct_es_prioritario = 1 OR atributo <> 'pa_prioritaria')
								--Clase de riesgo--
							AND (	(	(pa_clase_valor1 = 1 AND ct_actividad_imss_riesgo = 1)
									OR	(pa_clase_valor2 = 1 AND ct_actividad_imss_riesgo = 2)
									OR	(pa_clase_valor3 = 1 AND ct_actividad_imss_riesgo = 3)
									OR	(pa_clase_valor4 = 1 AND ct_actividad_imss_riesgo = 4)
									OR	(pa_clase_valor5 = 1 AND ct_actividad_imss_riesgo = 5))
								OR atributo <> 'pa_clase')
								--Prima de riesgo IMSS--
							AND (ct_prima_riesgo BETWEEN pa_prima_valor1 AND pa_prima_valor2 OR atributo <> 'pa_prima')
								--Recipientes sujetos a presión y calderas--
							AND (ct_tiene_rspc = 1 OR atributo <> 'pa_rspc')
								--Manejo, almacenamiento y transportación de sustancias químicas peligrosas--
							AND (ct_sust_quimicas_peligrosas = 1 OR atributo <> 'pa_sustancias')
								--Líquidos inflamables en inventario mayor a 1400 litros--
							AND (ct_liquidos_inflamables = 1 OR atributo <> 'pa_liquidos')
								--Materiales pirofóricos o explosivos en inventario--
							AND (ct_materiales_piroforicos = 1 OR atributo <> 'pa_piroforicos')
								--Actividad económica--
							AND (	(pa_actividad_tipo = 1 AND EXISTS (
											SELECT 1 FROM dbo.prog_actividad_rama 
											WHERE prog_atributo_id = dbo.prog_atributo.prog_atributo_id 
												AND rama_industrial_id = par_cve_rama AND par_ponderacion = 1 
										)
									)
								OR	(pa_actividad_tipo = 2 AND EXISTS (
											SELECT 1 FROM dbo.cat_scian s1 
												INNER JOIN dbo.prog_actividad_scian ON pas_cae_id = s1.cae_id
												INNER JOIN dbo.cat_scian s2 ON s1.cae_sector = s2.cae_sector 
													AND s2.cae_id = ct_actividad_scian 
													AND s1.cae_subsector IS NULL AND s1.cae_rama  IS NULL 
													AND s1.cae_subrama   IS NULL AND s1.cae_clase IS NULL
											WHERE pas_ponderacion = 1 AND prog_atributo_id = dbo.prog_atributo.prog_atributo_id
										)
									)
								OR	atributo <> 'pa_actividad')

								--En último operativo de PTU no visitada o visitada con incumplimientos
							AND ((	NOT EXISTS (
										SELECT 1 FROM dbo.centro_materiaDNE cm
										WHERE DATEDIFF(YEAR, ISNULL(cm_fec_ultima_inspeccion, GETDATE()), DATEADD(YEAR, -1, GETDATE())) = 0
											AND cm.centro_trabajo_id = ct.centro_trabajo_id AND cm.cm_es_ptu = 1)    
								OR	ct_visitada_oper_ptu = 1) OR atributo <> 'pa_ptu')
								--Reincidentes en violaciones graves
							AND (ct_reincidente_violacion_grave = 1 OR atributo <> 'pa_reincidente') 
								--Procesos sancionadores pendientes en el último año
							AND (ct_proc_pendientes_ultimo_anio = 1 OR atributo <> 'pa_pendientes')
								--Sin planes y programas de capacitación y adiestramiento o con planes vencidos
							AND (ct_sin_planes = 1 OR atributo <> 'pa_capacitacion')
								--Empresas en DECLARE
							AND (ct_en_declare = pa_declare_valor1 OR atributo <> 'pa_declare')
								--Empresas en PASST
							AND (ct_en_passt = pa_passt_valor1 OR atributo <> 'pa_passt')
								--Agencias de colocación
							AND (ct_es_agencia_colocacion = pa_agencias_valor1 OR atributo <> 'pa_agencias')
						    GROUP BY ct.centro_trabajo_id 
						    
							INSERT @CentrosResultado
							SELECT centro_trabajo_id, 0 as prioridad FROM #CT dne
							WHERE NOT EXISTS (SELECT 1 FROM @CentrosResultado ct1 WHERE dne.centro_trabajo_id = ct1.centro_trabajo_id)
				
				
					--== Seleccionar los centros que son aptos para una inspeccion ==--
					SELECT DISTINCT TOP (ISNULL(@numCentros, 0)) centro_trabajo_id, prioridad
					INTO #ctAgregar 
					FROM (	
								SELECT TOP (ISNULL(@valor1, 0)) dne.centro_trabajo_id, prioridad--, 1 as x
								FROM #CT dne INNER JOIN @CentrosResultado cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
								WHERE dne.sys_fec_insert > DATEADD(DAY, -365, GETDATE()) ORDER BY prioridad DESC, NEWID()
							
						UNION ALL
						
								SELECT TOP (ISNULL(@valor2, 0)) dne.centro_trabajo_id, prioridad--, 2 as x
								FROM #CT dne INNER JOIN @CentrosResultado cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
								WHERE dne.sys_fec_insert BETWEEN DATEADD(DAY, -1095, GETDATE()) AND DATEADD(DAY, -365, GETDATE()) ORDER BY prioridad DESC, NEWID()
					
						UNION ALL
					
								SELECT TOP (ISNULL(@valor3, 0)) dne.centro_trabajo_id, prioridad--, 3 as x
								FROM #CT dne INNER JOIN @CentrosResultado cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
								WHERE dne.sys_fec_insert < DATEADD(DAY, -1095, GETDATE()) ORDER BY prioridad DESC, NEWID()
						
						UNION ALL				
						
								SELECT TOP (ISNULL(@numCentros, 0)) dne.centro_trabajo_id, prioridad--, 0 as x
								FROM #CT dne INNER JOIN @CentrosResultado cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
								ORDER BY prioridad DESC, NEWID()
						
					) as tablappal
					--=====================--
					--== END MOD ERNESTO ==--
					
					--== Selecciona el verdadero top ==--
					SET @top = @inspGrupo;
					IF (@top > @aleatoriaTotal - @inspContador)
						SET @top = @aleatoriaTotal - @inspContador;
					--== Agregar las inspecciones del materia_grupo_id que fueron pasadas para el siguiente mes ==--
					INSERT INTO dbo.inspeccion (
						mes_id,
						materia_id,
						motivo_inspeccion_id,
						subtipo_inspeccion_id,
						cve_ur,
						cve_rama,
						centro_trabajo_id,
						in_anio,
						in_ct_rfc,
						in_ct_razon_social,
						in_ct_nombre,
						in_ct_imss_registro,
						in_ct_clase_riesgo,
						in_alcance,
						in_domicilio_inspeccion,
						in_en_declare,
						in_en_passt,
						in_etapa,
						in_estatus,
						in_tipo_programacion_id,
						sys_usr_insert,
						sys_fec_insert,
						materia_grupo_id
					)
					--== OUTPUT ==--
					OUTPUT INSERTED.inspeccion_id
					INTO @InspeccionesInsertadas
					--== OUTPUT ==--
					SELECT TOP (@top)
						@mes,
						materia_id,
						motivo_inspeccion_id,
						subtipo_inspeccion_id,
						cve_ur,
						cve_rama,
						centro_trabajo_id,
						in_anio,
						in_ct_rfc,
						in_ct_razon_social,
						in_ct_nombre,
						in_ct_imss_registro,
						in_ct_clase_riesgo,
						in_alcance,
						in_domicilio_inspeccion,
						in_en_declare,
						in_en_passt,
						0,
						NULL,
						1,
						@sys_usr,
						GETDATE(),
						@materia_grupo_id
					FROM dbo.inspeccion i 
					WHERE	in_aplica_especial IS NOT NULL AND operativo_id IS NULL
						AND in_estatus = 2 AND subtipo_inspeccion_id = 1 -- Inicial
						AND in_anio = @anio AND mes_id = (@mes - 1)
						AND cve_ur = @cve_ur AND i.materia_grupo_id = @materia_grupo_id			---La variable cve_ur se utliza en la entidad dbo.inspeccion----
						AND NOT EXISTS (
							SELECT 1 FROM dbo.inspeccion i2
							WHERE	i2.cve_ur = @cve_ur AND i2.subtipo_inspeccion_id = 1 -- Inicial							---La variable cve_ur se utliza en la entidad dbo.inspeccion----
								AND i2.in_anio = @anio AND i2.mes_id = @mes AND i2.centro_trabajo_id = i.centro_trabajo_id
								AND i2.materia_id = i.materia_id AND i2.materia_grupo_id = i.materia_grupo_id
						)
					--== Obtener el numero de inspecciones que se agregaron de las ==--
					SET @row = @@RowCount;
					SET @inspContador = @inspContador + @row;
					SET @top = @top - @row;
					IF (@top > @aleatoriaTotal - @inspContador)
						SET @top = @aleatoriaTotal - @inspContador;
					
					--== Insertar @aleatoriaTotal - @inspContador de inspecciones
					INSERT INTO dbo.inspeccion (
						mes_id,
						materia_id,
						motivo_inspeccion_id,
						subtipo_inspeccion_id,
						cve_ur,
						cve_rama,
						centro_trabajo_id,
						in_anio,
						in_ct_rfc,
						in_ct_razon_social,
						in_ct_nombre,
						in_ct_imss_registro,
						in_ct_clase_riesgo,
						in_alcance,
						in_domicilio_inspeccion,
						in_en_declare,
						in_en_passt,
						in_etapa,
						in_estatus,
						in_tipo_programacion_id,
						sys_usr_insert,
						sys_fec_insert,
						materia_grupo_id
					)
					--== OUTPUT ==--
					OUTPUT INSERTED.inspeccion_id
					INTO @InspeccionesInsertadas
					--== OUTPUT ==--
					SELECT TOP (@top)
						@mes,
						materia_id,
						(SELECT TOP(1) mi.motivo_inspeccion_id FROM dbo.motivo_inspeccion mi 
							INNER JOIN dbo.motivo_materia mm ON mi.motivo_inspeccion_id = mm.motivo_inspeccion_id 
							INNER JOIN dbo.motivo_subtipo ms ON mi.motivo_inspeccion_id = ms.motivo_inspeccion_id
						 WHERE mm.materia_id = mpd.materia_id AND ms.subtipo_inspeccion_id = 1), -- Inicial
						1, -- Inicial
						@cve_ur,
						rama_industrial_id,
						ct.centro_trabajo_id,
						@anio,
						ct.emp_rfc,
						ct.emp_nombre,
						ct_nombre,
						ct_imss_registro,
						ct_actividad_imss_riesgo,
						1, -- General
						--== Domicilio ==--
						CASE WHEN NULLIF(ct_calle, '') IS NULL THEN '' ELSE ct_calle + ' ' END + 
						CASE WHEN NULLIF(ct_num_exterior, '') IS NULL THEN '' ELSE 'No. ' + ct_num_exterior + ', ' END +
						CASE WHEN NULLIF(ct_num_interior, '') IS NULL THEN '' ELSE 'Interior ' + ct_num_interior + ', ' END +
						CASE WHEN NULLIF(ct_colonia, '') IS NULL THEN '' ELSE 'Colonia ' + ct_colonia + ', ' END +
						CASE WHEN NULLIF(ct_cp, '') IS NULL THEN '' ELSE 'C.P. ' + ct_cp + ', ' END + 
						(SELECT cmu_descripcion + ', ' COLLATE Latin1_General_CI_AS FROM dbo.cat_municipios 
						 WHERE cmu_cve_edorep = ct.ct_cve_edorep AND cmu_cve_municipio = ct.ct_cve_municipio) + 
						(SELECT cen_descripcion COLLATE Latin1_General_CI_AS 
						 FROM dbo.cat_entidades WHERE cen_cve_edorep = ct.ct_cve_edorep),
						ct_en_declare,
						ct_en_passt,
						0,
						null, -- Porque la ariana lo pido null en el estatus
						1,
						@sys_usr,
						GETDATE(),
						@materia_grupo_id
					FROM
						dbo.materia_grupo_detalle mpd, #ctAgregar cta
						INNER JOIN #CT ct ON cta.centro_trabajo_id = ct.centro_trabajo_id
					WHERE mpd.materia_grupo_id = @materia_grupo_id
					ORDER BY cta.prioridad DESC, ct.centro_trabajo_id, mpd.materia_id
					--== Actualiza el contador de inspecciones insertadas ==--
					SET @inspContador = @inspContador + @@RowCount;
					--== Eliminar tablas temporales
					DROP TABLE
						#CT,
						#ctAgregar,
						#conInspeccion,
						#tablaAtributos,
						#TablaAtributoPrioridad
					--== Si el total de inspecciones aleatorias ya se cumplio terminar ==--
					IF (@aleatoriaTotal <= @inspContador) 
					BEGIN 
						SET @numIteracion += 1;
						BREAK;
					END
				END
				
				IF (@periodicas_id IS NOT NULL)
				BEGIN
					--== PERIODICA ==--
					--== Sleccionar todos los centros que ya tuvieron una inspeccion en el anio ==--
					SELECT i.centro_trabajo_id, i.materia_id INTO #conInspeccion2 FROM dbo.inspeccion i
						INNER JOIN dbo.materia_grupo_detalle mgd ON i.materia_id = mgd.materia_id
					WHERE in_anio = @anio AND operativo_id IS NULL AND mgd.materia_grupo_id = @materia_grupo_id
					--== Calcular cuantos centros se agregan ==--
					SELECT
						@inspGrupo = CEILING(CONVERT(decimal(18,2), @inspTotal) * (CONVERT(decimal(18,2), @pct_periodicas) / 100.00)),
						@numCentros = CEILING(@inspGrupo / CONVERT(decimal(18,2), @num_materias)),
						@jurisdiccion = CASE @num_materias WHEN 1 THEN  CASE WHEN @materia_grupo_id = @mg_id THEN @jurisdiccion ELSE -1 END ELSE @jurisdiccion END
					
					--== START MOD ERNESTO ==--
					--== Aleatoria con atributos ==--
					--== Calcula porcentajes de periodos DNE ==--
					SELECT
						@valor1 = @numCentros * (pa_dne_valor1 / 100.00), 
						@valor2 = @numCentros * (pa_dne_valor2 / 100.00),  
						@valor3 = @numCentros * (pa_dne_valor3 / 100.00),
						@prioridaddne = pa_dne_prioridad
					FROM dbo.prog_atributo
					WHERE prog_atributo_id = @periodicas_id
					--== Crea tabla con valores de atributos ==--
					--== Obtiene atributos sin nulos ==--
					SELECT
						prog_atributo_id, 
						pa_dne_aplica, 
						ISNULL( pa_dne_prioridad,0 ) pa_dne_prioridad , 
						pa_dne_valor1, 
						pa_dne_valor2, 
						pa_dne_valor3, 
						pa_tamanio_aplica, 
						ISNULL( pa_tamanio_prioridad,0 ) pa_tamanio_prioridad , 
						pa_tamanio_valor1, 
						pa_tamanio_valor2, 
						pa_prioritaria_aplica, 
						ISNULL( pa_prioritaria_prioridad,0 ) pa_prioritaria_prioridad ,
						pa_clase_aplica, 
						ISNULL( pa_clase_prioridad,0 ) pa_clase_prioridad , 
						pa_clase_valor1, 
						pa_clase_valor2, 
						pa_clase_valor3, 
						pa_clase_valor4, 
						pa_clase_valor5, 
						pa_prima_aplica, 
						ISNULL( pa_prima_prioridad,0 ) pa_prima_prioridad , 
						pa_prima_valor1, 
						pa_prima_valor2, 
						pa_rspc_aplica, 
						ISNULL( pa_rspc_prioridad,0 ) pa_rspc_prioridad , 
						pa_sustancias_aplica, 
						ISNULL( pa_sustancias_prioridad,0 ) pa_sustancias_prioridad , 
						pa_liquidos_aplica, 
						ISNULL( pa_liquidos_prioridad,0 ) pa_liquidos_prioridad , 
						pa_piroforicos_aplica, 
						ISNULL( pa_piroforicos_prioridad,0 ) pa_piroforicos_prioridad , 
						pa_actividad_aplica, 
						ISNULL( pa_actividad_prioridad,0 ) pa_actividad_prioridad , 
						pa_actividad_tipo, 
						pa_ultima_aplica, 
						ISNULL( pa_ultima_prioridad,0 ) pa_ultima_prioridad , 
						pa_ultima_valor1, 
						pa_ptu_aplica, 
						ISNULL( pa_ptu_prioridad,0 ) pa_ptu_prioridad , 
						pa_reincidente_aplica, 
						ISNULL( pa_reincidente_prioridad,0 ) pa_reincidente_prioridad , 
						pa_pendientes_aplica, 
						ISNULL( pa_pendientes_prioridad,0 ) pa_pendientes_prioridad ,
						pa_capacitacion_aplica, 
						ISNULL( pa_capacitacion_prioridad,0 ) pa_capacitacion_prioridad , 
						pa_declare_aplica, 
						ISNULL( pa_declare_prioridad,0 ) pa_declare_prioridad , 
						pa_declare_valor1, 
						pa_passt_aplica, 
						ISNULL( pa_passt_prioridad,0 ) pa_passt_prioridad , 
						pa_passt_valor1, 
						pa_agencias_aplica, 
						ISNULL( pa_agencias_prioridad,0 ) pa_agencias_prioridad , 
						pa_agencias_valor1
					INTO #tablaAtributos2
					FROM dbo.prog_atributo
					WHERE prog_atributo_id = @periodicas_id
					--== Unpivot de atributos ==--
					SELECT
						REPLACE(atributo, '_aplica', '') AS atributo,
						aplica,
						atributo2,
						prioridad,
						ROW_NUMBER() OVER (ORDER BY aplica) AS atributo_id 
					INTO #TablaAtributoPrioridad2 
					FROM #tablaAtributos2 
						UNPIVOT (
							aplica for atributo in (
								pa_dne_aplica,
								pa_tamanio_aplica,
								pa_prioritaria_aplica,
								pa_clase_aplica,
								pa_prima_aplica,
								pa_rspc_aplica,
								pa_sustancias_aplica,
								pa_liquidos_aplica,
								pa_piroforicos_aplica,
								pa_actividad_aplica,
								pa_ultima_aplica,
								pa_ptu_aplica,
								pa_reincidente_aplica,
								pa_pendientes_aplica,
								pa_capacitacion_aplica,
								pa_declare_aplica,
								pa_passt_aplica,
								pa_agencias_aplica
							)
						) as Aplican
						UNPIVOT (
							prioridad for atributo2 in (
								pa_dne_prioridad,
								pa_tamanio_prioridad,
								pa_prioritaria_prioridad,
								pa_clase_prioridad,
								pa_prima_prioridad,
								pa_rspc_prioridad,
								pa_sustancias_prioridad,
								pa_liquidos_prioridad,
								pa_piroforicos_prioridad,
								pa_actividad_prioridad,
								pa_ultima_prioridad,
								pa_ptu_prioridad,
								pa_reincidente_prioridad,
								pa_pendientes_prioridad,
								pa_capacitacion_prioridad,
								pa_declare_prioridad,
								pa_passt_prioridad,
								pa_agencias_prioridad
							)
						) as Prioridades
						WHERE REPLACE(atributo, '_aplica', '') = REPLACE(atributo2, '_prioridad', '') AND aplica = 1
					--== Tabla para centros con atributos ==--
					DECLARE @CentrosResultado2 TABLE(centro_trabajo_id int,prioridad decimal(14, 10))
					DELETE FROM @CentrosResultado2 WHERE centro_trabajo_id > 0;
			
					--== Selecciona los atributos especiales para hacer la seleccion de los centros ==--
					SELECT
						@aplica_sh = CASE pa.pa_passt_aplica WHEN 1 THEN CASE pa.pa_passt_valor1 WHEN 1 THEN 0 ELSE 1 END ELSE 0 END,
						@aplica_ac = CASE pa.pa_agencias_aplica WHEN 1 THEN CASE pa.pa_agencias_valor1 WHEN 1 THEN 1 ELSE 0 END ELSE 0 END,
						@aplica_rspc = CASE pa.pa_rspc_aplica WHEN 1 THEN 1 ELSE 0 END,
						@aplica_declare = CASE pa.pa_declare_aplica WHEN 1 THEN CASE pa.pa_declare_valor1 WHEN 1 THEN 0 ELSE 1 END ELSE 0 END
					FROM dbo.prog_atributo pa WHERE prog_atributo_id = @periodicas_id
					
					--== Selecciona a los centros que son aptos para seleccion ==--
					SELECT  emp_rfc, emp_nombre, cm_fec_ultima_inspeccion_materia,
					        ct.centro_trabajo_id,
							ct_num_trabajadores,
							ct_actividad_imss_riesgo,
							ct_prima_riesgo,
							ct_tiene_rspc,
							ct_sust_quimicas_peligrosas,
							ct_liquidos_inflamables,
							ct_materiales_piroforicos,
							ct_actividad_scian,
							ct_visitada_oper_ptu,
							ct_reincidente_violacion_grave,
							ct_proc_pendientes_ultimo_anio,
							ct_sin_planes,
							ct_en_declare,
							ct_en_passt,
							ct_es_agencia_colocacion,
							ct_nombre,
							ct_imss_registro,
							ct_calle,
							ct_num_exterior,
							ct_num_interior,
							ct_colonia,
							ct_cp,
							ct_cve_edorep,
							ct_cve_municipio,
							ct_es_prioritario,
							rama_industrial_id,
							ct.sys_fec_insert
					INTO #CT2 FROM #CT_OUTER ct WITH (NOLOCK)
						INNER JOIN (
							SELECT ct.centro_trabajo_id,
								(	SELECT TOP(1) cm_fec_ultima_inspeccion FROM dbo.materia_grupo_detalle mgd
										INNER JOIN dbo.materia m ON m.materia_id = mgd.materia_id
										INNER JOIN dbo.centro_materiaDNE cm ON cm.cm_materia COLLATE Latin1_General_CI_AS = m.mat_acronimo
									WHERE mgd.materia_grupo_id = @materia_grupo_id AND cm.centro_trabajo_id = ct.centro_trabajo_id
									ORDER BY cm_fec_ultima_inspeccion DESC
								) as cm_fec_ultima_inspeccion_materia
							FROM #CT_OUTER ct 
							WHERE	NOT EXISTS (SELECT 1 FROM #conInspeccion2 i WHERE i.centro_trabajo_id = ct.centro_trabajo_id)
									--== Para SH ==--
								AND (ct_en_passt = 0 OR ct_en_passt IS NULL OR @aplica_sh <> 1 OR @materia_grupo_id <> 4)
									--== Para AC ==--
								AND (tipo_agencia_id IS NOT NULL OR @aplica_ac <> 1 OR @materia_grupo_id <> 5)
									--== Para RSPC ==--
								AND (ct_tiene_rspc = 1 OR @aplica_rspc <> 1 OR @materia_grupo_id <> 6)
									--== Para DECLARE
								AND (ct_en_declare = 0 OR ct_en_declare IS NULL OR @aplica_declare <> 1)
						) AS tb ON tb.centro_trabajo_id = ct.centro_trabajo_id
					WHERE cm_fec_ultima_inspeccion_materia <= DATEADD(DAY, @anio_periodicas, GETDATE())
					      

						INSERT @CentrosResultado2
						SELECT
							ct.centro_trabajo_id,
							SUM(ISNULL(1 / CAST(NULLIF(prioridad, 0) as decimal(14, 10)), 0.0000000001)) as prioridad
						FROM
							#CT2 ct
							INNER JOIN #TablaAtributoPrioridad2	ON atributo <> 'pa_dne'
							INNER JOIN dbo.prog_atributo		ON dbo.prog_atributo.prog_atributo_id = @periodicas_id
								--Tamaño de la empresa--			  
						WHERE	(ct_num_trabajadores BETWEEN pa_tamanio_valor1 AND pa_tamanio_valor2 OR atributo <> 'pa_tamanio')
								--Empresas prioritarias--
							AND (ct_es_prioritario = 1 OR atributo <> 'pa_prioritaria')
								--Clase de riesgo--
							AND (	(	(pa_clase_valor1 = 1 AND ct_actividad_imss_riesgo = 1)
									OR	(pa_clase_valor2 = 1 AND ct_actividad_imss_riesgo = 2)
									OR	(pa_clase_valor3 = 1 AND ct_actividad_imss_riesgo = 3)
									OR	(pa_clase_valor4 = 1 AND ct_actividad_imss_riesgo = 4)
									OR	(pa_clase_valor5 = 1 AND ct_actividad_imss_riesgo = 5))
								OR atributo <> 'pa_clase')
								--Prima de riesgo IMSS--
							AND (ct_prima_riesgo BETWEEN pa_prima_valor1 AND pa_prima_valor2 OR atributo <> 'pa_prima')
								--Recipientes sujetos a presión y calderas--
							AND (ct_tiene_rspc = 1 OR atributo <> 'pa_rspc')
								--Manejo, almacenamiento y transportación de sustancias químicas peligrosas--
							AND (ct_sust_quimicas_peligrosas = 1 OR atributo <> 'pa_sustancias')
								--Líquidos inflamables en inventario mayor a 1400 litros--
							AND (ct_liquidos_inflamables = 1 OR atributo <> 'pa_liquidos')
								--Materiales pirofóricos o explosivos en inventario--
							AND (ct_materiales_piroforicos = 1 OR atributo <> 'pa_piroforicos')
								--Actividad económica--
							AND (	(pa_actividad_tipo = 1 AND EXISTS (
											SELECT 1 FROM dbo.prog_actividad_rama 
											WHERE prog_atributo_id = dbo.prog_atributo.prog_atributo_id 
												AND rama_industrial_id = par_cve_rama AND par_ponderacion = 1 
										)
									)
								OR	(pa_actividad_tipo = 2 AND EXISTS (
											SELECT 1 FROM dbo.cat_scian s1 
												INNER JOIN dbo.prog_actividad_scian ON pas_cae_id = s1.cae_id
												INNER JOIN dbo.cat_scian s2 ON s1.cae_sector = s2.cae_sector 
													AND s2.cae_id = ct_actividad_scian 
													AND s1.cae_subsector IS NULL AND s1.cae_rama  IS NULL 
													AND s1.cae_subrama   IS NULL AND s1.cae_clase IS NULL
											WHERE pas_ponderacion = 1 AND prog_atributo_id = dbo.prog_atributo.prog_atributo_id
										)
									)
								OR	atributo <> 'pa_actividad')  
								--Fecha de última inspección--
							AND (	(pa_ultima_valor1 < 4 AND cm_fec_ultima_inspeccion_materia >= DATEADD(DAY, pa_ultima_valor1 * -365, GETDATE()))
								OR	(pa_ultima_valor1 = 4 AND cm_fec_ultima_inspeccion_materia <= DATEADD(DAY, pa_ultima_valor1 * -365, GETDATE()))
								OR	atributo <> 'pa_ultima')
								--En último operativo de PTU no visitada o visitada con incumplimientos
							AND ((	NOT EXISTS (
										SELECT 1 FROM dbo.centro_materiaDNE cm
										WHERE DATEDIFF(YEAR, ISNULL(cm_fec_ultima_inspeccion, GETDATE()), DATEADD(YEAR, -1, GETDATE())) = 0
											AND cm.centro_trabajo_id = ct.centro_trabajo_id AND cm.cm_es_ptu = 1)
								OR	ct_visitada_oper_ptu = 1) OR atributo <> 'pa_ptu')
								--Reincidentes en violaciones graves
							AND (ct_reincidente_violacion_grave = 1 OR atributo <> 'pa_reincidente')
								--Procesos sancionadores pendientes en el último año
							AND (ct_proc_pendientes_ultimo_anio = 1 OR atributo <> 'pa_pendientes') 
								--Sin planes y programas de capacitación y adiestramiento o con planes vencidos
							AND (ct_sin_planes = 1 OR (atributo <> 'pa_capacitacion'))
								--Empresas en DECLARE
							AND (ct_en_declare = pa_declare_valor1 OR atributo <> 'pa_declare') 
								--Empresas en PASST
							AND (ct_en_passt = pa_passt_valor1 OR atributo <> 'pa_passt') 
								--Agencias de colocación
							AND (ct_es_agencia_colocacion = pa_agencias_valor1 OR atributo <> 'pa_agencias')
					  GROUP BY ct.centro_trabajo_id 
						    INSERT @CentrosResultado2
							SELECT centro_trabajo_id, 0 AS prioridad FROM #CT2 ct
							WHERE NOT EXISTS (SELECT 1 FROM @CentrosResultado2 ct2 WHERE ct.centro_trabajo_id = ct2.centro_trabajo_id)
				
					--== Seleccionar los centros que son aptos para una inspeccion ==--
					SELECT DISTINCT TOP (ISNULL(@numCentros, 0)) centro_trabajo_id, prioridad
					INTO #ctAgregar2 
					FROM (	
								SELECT TOP (ISNULL(@valor1, 0)) dne.centro_trabajo_id, prioridad--, 1 as x
								FROM #CT2 dne INNER JOIN @CentrosResultado2 cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
								WHERE dne.sys_fec_insert > DATEADD(DAY, -365, GETDATE())  ORDER BY prioridad DESC, NEWID()
						
						UNION ALL
							
								SELECT TOP (ISNULL(@valor2, 0)) dne.centro_trabajo_id, prioridad--, 2 as x
								FROM #CT2 dne INNER JOIN @CentrosResultado2 cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
								WHERE dne.sys_fec_insert BETWEEN DATEADD(DAY, -1095, GETDATE()) AND DATEADD(DAY, -365, GETDATE()) ORDER BY prioridad DESC, NEWID()
						
						UNION ALL
						
								SELECT TOP (ISNULL(@valor3, 0)) dne.centro_trabajo_id, prioridad--, 3 as x
								FROM #CT2 dne INNER JOIN @CentrosResultado2 cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
								WHERE  dne.sys_fec_insert < DATEADD(DAY, -1095, GETDATE()) ORDER BY prioridad DESC, NEWID()
							
						UNION ALL				
						
								SELECT TOP (ISNULL(@numCentros, 0)) dne.centro_trabajo_id, prioridad--, 0 as x
								FROM #CT2 dne INNER JOIN @CentrosResultado2 cp ON dne.centro_trabajo_id = cp.centro_trabajo_id
								ORDER BY prioridad DESC, NEWID()
						
					) as tablappal
					--=============================--
					--== END MOD ERNESTO ==--
					
					--== Selecciona el verdadero top ==--
					SET @top = @inspGrupo;
					IF (@top > @aleatoriaTotal - @inspContador)
						SET @top = @aleatoriaTotal - @inspContador;
					--== Agregar las inspecciones del materia_grupo_id que fueron pasadas para el siguiente mes ==--
					INSERT INTO dbo.inspeccion (
						mes_id,
						materia_id,
						motivo_inspeccion_id,
						subtipo_inspeccion_id,
						cve_ur,
						cve_rama,
						centro_trabajo_id,
						in_anio,
						in_ct_rfc,
						in_ct_razon_social,
						in_ct_nombre,
						in_ct_imss_registro,
						in_ct_clase_riesgo,
						in_alcance,
						in_domicilio_inspeccion,
						in_en_declare,
						in_en_passt,
						in_etapa,
						in_estatus,
						in_tipo_programacion_id,
						sys_usr_insert,
						sys_fec_insert,
						materia_grupo_id
					)
					--== OUTPUT ==--
					OUTPUT INSERTED.inspeccion_id
					INTO @InspeccionesInsertadas
					--== OUTPUT ==--
					SELECT TOP (@top)
						@mes,
						materia_id,
						motivo_inspeccion_id,
						subtipo_inspeccion_id,
						cve_ur,
						cve_rama,
						centro_trabajo_id,
						in_anio,
						in_ct_rfc,
						in_ct_razon_social,
						in_ct_nombre,
						in_ct_imss_registro,
						in_ct_clase_riesgo,
						in_alcance,
						in_domicilio_inspeccion,
						in_en_declare,
						in_en_passt,
						0,
						NULL,
						1,
						@sys_usr,
						GETDATE(),
						@materia_grupo_id
					FROM dbo.inspeccion i 
					WHERE	in_aplica_especial IS NOT NULL AND operativo_id IS NULL
						AND in_estatus = 2 AND subtipo_inspeccion_id = 2 -- Periodica
						AND in_anio = @anio AND mes_id = (@mes - 1)
						AND cve_ur = @cve_ur AND i.materia_grupo_id = @materia_grupo_id			---La variable cve_ur se utliza en la entidad dbo.inspeccion----
						AND NOT EXISTS (
							SELECT 1 FROM dbo.inspeccion i2
							WHERE	i2.cve_ur = @cve_ur AND i2.subtipo_inspeccion_id = 2 -- Periodica			---La variable cve_ur se utliza en la entidad dbo.inspeccion----
								AND i2.in_anio = @anio AND i2.mes_id = @mes AND i2.centro_trabajo_id = i.centro_trabajo_id
								AND i2.materia_id = i.materia_id AND i2.materia_grupo_id = i.materia_grupo_id
						)
					--== Obtener el numero de inspecciones que se agregaron de las ==--
					SET @row = @@RowCount;
					SET @top = @top - @row;
					SET @inspContador = @inspContador + @row;
					IF (@top > @aleatoriaTotal - @inspContador)
						SET @top = @aleatoriaTotal - @inspContador;
					
					--== Insertar @aleatoriaTotal - @inspContador de inspecciones
					INSERT INTO dbo.inspeccion (
						mes_id,
						materia_id,
						motivo_inspeccion_id,
						subtipo_inspeccion_id,
						cve_ur,
						cve_rama,
						centro_trabajo_id,
						in_anio,
						in_ct_rfc,
						in_ct_razon_social,
						in_ct_nombre,
						in_ct_imss_registro,
						in_ct_clase_riesgo,
						in_alcance,
						in_domicilio_inspeccion,
						in_en_declare,
						in_en_passt,
						in_etapa,
						in_estatus,
						in_tipo_programacion_id,
						sys_usr_insert,
						sys_fec_insert,
						materia_grupo_id
					)
					--== OUTPUT ==--
					OUTPUT INSERTED.inspeccion_id
					INTO @InspeccionesInsertadas
					--== OUTPUT ==--
					SELECT TOP (@top)
						@mes,
						materia_id,
						(SELECT TOP(1) mi.motivo_inspeccion_id FROM dbo.motivo_inspeccion mi 
							INNER JOIN dbo.motivo_materia mm ON mi.motivo_inspeccion_id = mm.motivo_inspeccion_id 
							INNER JOIN dbo.motivo_subtipo ms ON mi.motivo_inspeccion_id = ms.motivo_inspeccion_id
						 WHERE mm.materia_id = mpd.materia_id AND ms.subtipo_inspeccion_id = 2), --Periodica
						2, --Periodica
						@cve_ur,
						rama_industrial_id,
						ct.centro_trabajo_id,
						@anio,
						ct.emp_rfc,
						ct.emp_nombre,
						ct_nombre,
						ct_imss_registro,
						ct_actividad_imss_riesgo,
						1, -- General
						--== Domicilio ==--
						CASE WHEN NULLIF(ct_calle, '') IS NULL THEN '' ELSE ct_calle + ' ' END + 
						CASE WHEN NULLIF(ct_num_exterior, '') IS NULL THEN '' ELSE 'No. ' + ct_num_exterior + ', ' END +
						CASE WHEN NULLIF(ct_num_interior, '') IS NULL THEN '' ELSE 'Interior ' + ct_num_interior + ', ' END +
						CASE WHEN NULLIF(ct_colonia, '') IS NULL THEN '' ELSE 'Colonia ' + ct_colonia + ', ' END +
						CASE WHEN NULLIF(ct_cp, '') IS NULL THEN '' ELSE 'C.P. ' + ct_cp + ', ' END + 
						(SELECT cmu_descripcion + ', ' COLLATE Latin1_General_CI_AS FROM dbo.cat_municipios 
						 WHERE cmu_cve_edorep = ct.ct_cve_edorep AND cmu_cve_municipio = ct.ct_cve_municipio) + 
						(SELECT cen_descripcion COLLATE Latin1_General_CI_AS 
						 FROM dbo.cat_entidades WHERE cen_cve_edorep = ct.ct_cve_edorep),
						ct_en_declare,
						ct_en_passt,
						0,
						null, -- Porque la ariana lo pido null en el estatus
						1,
						@sys_usr,
						GETDATE(),
						@materia_grupo_id
					FROM
						dbo.materia_grupo_detalle mpd, #ctAgregar2 cta
						INNER JOIN #CT2 ct ON cta.centro_trabajo_id = ct.centro_trabajo_id
					WHERE mpd.materia_grupo_id = @materia_grupo_id
					ORDER BY cta.prioridad DESC, ct.centro_trabajo_id, mpd.materia_id
					--== Actualiza el contador de inspecciones insertadas ==--
					SET @inspContador = @inspContador + @@RowCount;
					--== Eliminar tablas temporales ==--
					DROP TABLE
						#CT2,
						#ctAgregar2,
						#conInspeccion2,
						#tablaAtributos2,
						#TablaAtributoPrioridad2
					--== Si el total de inspecciones aleatorias ya se cumplio terminar ==--
					IF (@aleatoriaTotal <= @inspContador) 
					BEGIN 
						SET @numIteracion += 1;
						BREAK;
					END
				END
				
				DROP TABLE #CT_OUTER
				--== Selecciona el siguiente row del cursor ==--
				FETCH NEXT FROM ProgMateria
				INTO @materia_grupo_id, @jurisdiccion, @num_materias, 
					 @pct_iniciales, @pct_periodicas, @iniciales_id, @periodicas_id
			END
			--== Cierra el cursor ==--
			CLOSE ProgMateria;
			--== Libera memoria ==--
			DEALLOCATE ProgMateria;
			--== Hace que termine el WHILE en dos iteraciones
			SET @numIteracion += 1;
		END
		--============================================--
		--== Insertar Participantes equitativamente ==--
		--============================================--
		DECLARE @participante_id int,
				@numInspParticipante int;
		DECLARE @InspeccionesInsertadas2 TABLE(inspeccion_id int);
		--== Seleccionar el numero de inspecciones por participante ==--
		SELECT
			@numInspParticipante = CEILING(
				CONVERT(decimal(18,2), (SELECT NULLIF(COUNT(inspeccion_id), 0) FROM @InspeccionesInsertadas)) /
				CONVERT(decimal(18,2), (SELECT NULLIF(COUNT(participante_id), 0) FROM dbo.participante WHERE cve_ur = @cve_ur AND par_es_inspector = 1 AND par_estatus = 1))		---La variable cve_ur se utliza en la entidad dbo.participante----
			)
		--== Cursor para iterar entre todos los participantes ==--
		DECLARE Participantes CURSOR FOR
			SELECT participante_id FROM dbo.participante 
			WHERE cve_ur = @cve_ur AND par_es_inspector = 1 AND par_estatus = 1		---La variable cve_ur se utliza en la entidad dbo.participante----
		--== Abrir cursor ==--
		OPEN Participantes
		--== Selecciona el primer row del cursor ==--
		FETCH NEXT FROM Participantes INTO @participante_id
		--== Itera en todos los row del cursor ==--
		WHILE @@FETCH_STATUS = 0
		BEGIN
			--== Agrega inspecciones aleatoriamente para el inspectores ==--
			INSERT INTO dbo.inspec_participante (
				inspeccion_id,
				participante_id,
				ipar_tipo_participacion,
				sys_usr_insert,
				sys_fec_insert
			)
			--== OUTPUT ==--
			OUTPUT INSERTED.inspeccion_id
			INTO @InspeccionesInsertadas2
			--== OUTPUT ==--
			SELECT TOP(ISNULL(@numInspParticipante, 0))
				inspeccion_id,
				@participante_id,
				1,--(SELECT TOP(1) fundamento_designacion_id FROM dbo.fundamento_designacion ORDER BY NEWID()),
				@sys_usr,
				GETDATE()
			FROM @InspeccionesInsertadas ORDER BY NEWID()
			--== Borra las inspecciones que han sido agregadas para que no se repitan ==--
			DELETE FROM @InspeccionesInsertadas WHERE inspeccion_id IN (SELECT inspeccion_id FROM @InspeccionesInsertadas2)
			--== Si ya no hay inspecciones que agregarles inspector terminarl el WHILE ==--
			IF (SELECT COUNT(inspeccion_id) FROM @InspeccionesInsertadas) = 0 BREAK;
			--== Selecciona el siguiente row del cursor ==--
			FETCH NEXT FROM Participantes INTO @participante_id
		END
		--== Cierra el cursor ==--
		CLOSE Participantes;
		--== Libera memoria ==--
		DEALLOCATE Participantes;
		--============================================--
		--== Insertar Participantes equitativamente ==--
		--============================================--
		--======================================--
		--== Insertar Inspecciones Aleatorias ==--
		--======================================--
	END
END














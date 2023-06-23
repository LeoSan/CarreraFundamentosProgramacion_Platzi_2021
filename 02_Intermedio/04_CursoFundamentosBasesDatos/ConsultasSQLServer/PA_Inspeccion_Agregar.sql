USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Inspeccion_Agregar]    Script Date: 07/03/2023 10:57:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













-- =============================================
-- Author:		Ariana Duarte
-- Create date: 29/11/2011
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Inspeccion_Agregar]
	@inspeccion_id							int = null,
	@inspector_id							int = null,
	@notificador_id							int = null,
	@mes_id									int = null,
	@materia_id								int = null,
	@fundamento_designacion_id				int = null,
	@motivo_inspeccion_id					int = null,
	@subtipo_inspeccion_id					int = null,
	@operativo_id							int = null,
	@cve_ur									int = null,
	@cve_rama								int = null,
	@centro_trabajo_id						int = null,
	@in_anio								int = null,
	@in_num_expediente						varchar(50) = null,
	@in_otra_submateria						varchar(400) = null,
	@in_ct_rfc								varchar(14) = null,
	@in_ct_razon_social						varchar(255) = null,
	@in_ct_nombre							varchar(255) = null,
	@in_ct_imss_registro					varchar(11) = null,
	@in_ct_clase_riesgo						varchar(10) = null,
	@in_fec_inspeccion						datetime = null,
	@in_alcance								int = null,
	@in_habilitar_dias_inhabiles			int = null,
	@in_habilitar_horas_inhabiles			int = null,
	@in_incluye_noms_esp					int = null,
	@in_fec_emision							datetime = null,
	@in_es_inspeccion_en_centro				int = null,
	@in_domicilio_inspeccion				varchar(400) = null,
	@in_firman_titulares					int = null,
	@in_nombre_firmante						varchar(100) = null,
	@in_cargo_firmante						varchar(100) = null,
	@in_generar_citatorio					int = null,
	@in_incluir_notificador					int = null,
	@in_en_declare							int = null,
	@in_en_passt							int = null,
	@in_medio_informacion					varchar(200) = null,
	@in_req_documentos_inicio				datetime = null,
	@in_req_documentos_termino				datetime = null,
	@in_rsp_tipo_equipo						varchar(50) = null,
	@in_rsp_equipo							varchar(1000) = null,
	@in_rsp_num_control						varchar(30) = null,
	@in_rsp_fec_autorizacion_provisional	datetime = null,
	@in_rsp_tipo_aviso						varchar(70) = null,
	@in_rsp_folio							varchar(10) = null,
	@in_rsp_pruebas							varchar(250) = null,
	@in_resultado							int = null,
	@in_etapa								int = null,
	@in_estatus								int = null,
	@in_domicilio_inspeccion2				varchar(400) = null,
	@in_tipo_programacion_id				int = null,
	@sys_usr								varchar(20) = null,
	@in_otra_materia_motivo					varchar(200)=null,
	@in_otra_materia_submateria				int=null,
	@normativa_version_id					int=1,
	@colectivo_id					int=-1

AS
BEGIN
    SET NOCOUNT ON;


	IF(@operativo_id IS NOT NULL AND @operativo_id<>-1)
	BEGIN	
		IF NOT EXISTS(SELECT inspeccion_id FROM dbo.inspeccion WHERE mes_id=@mes_id AND in_anio=@in_anio AND centro_trabajo_id = @centro_trabajo_id and in_num_expediente is null and subtipo_inspeccion_id=@subtipo_inspeccion_id and operativo_id is null) AND (@inspeccion_id IS NULL OR @inspeccion_id = -1 OR @inspeccion_id = 0)
		BEGIN
			INSERT INTO dbo.inspeccion(
				inspector_id,
				notificador_id,
				mes_id,
				materia_id,
				fundamento_designacion_id,
				motivo_inspeccion_id,
				subtipo_inspeccion_id,
				operativo_id,
				cve_ur,
				cve_rama,
				centro_trabajo_id,
				in_anio,
				in_num_expediente,
				in_otra_submateria,
				in_ct_rfc,
				in_ct_razon_social,
				in_ct_nombre,
				in_ct_imss_registro,
				in_ct_clase_riesgo,
				in_fec_inspeccion,
				in_alcance,
				in_habilitar_dias_inhabiles,
				in_habilitar_horas_inhabiles,
				in_incluye_noms_esp,
				in_fec_emision,
				in_es_inspeccion_en_centro,
				in_domicilio_inspeccion,
				in_firman_titulares,
				in_nombre_firmante,
				in_cargo_firmante,
				in_generar_citatorio,
				in_incluir_notificador,
				in_en_declare,
				in_en_passt,
				in_medio_informacion,
				in_req_documentos_inicio,
				in_req_documentos_termino,
				in_rsp_tipo_equipo,
				in_rsp_equipo,
				in_rsp_num_control,
				in_rsp_fec_autorizacion_provisional,
				in_rsp_tipo_aviso,
				in_rsp_folio,
				in_rsp_pruebas,
				in_resultado,
				in_etapa,
				in_estatus,
				in_domicilio_inspeccion2,
				in_tipo_programacion_id,
				sys_usr_insert,
				in_otra_materia_motivo,
				in_otra_materia_submateria,
				normativa_version_id,
				sys_fec_insert,
				colectivo_id
			) VALUES (
				@inspector_id,
				@notificador_id,
				@mes_id,
				@materia_id,
				@fundamento_designacion_id,
				@motivo_inspeccion_id,
				@subtipo_inspeccion_id,
				@operativo_id,
				@cve_ur,
				@cve_rama,
				@centro_trabajo_id,
				@in_anio,
				@in_num_expediente,
				@in_otra_submateria,
				@in_ct_rfc,
				@in_ct_razon_social,
				@in_ct_nombre,
				@in_ct_imss_registro,
				@in_ct_clase_riesgo,
				@in_fec_inspeccion,
				@in_alcance,
				@in_habilitar_dias_inhabiles,
				@in_habilitar_horas_inhabiles,
				@in_incluye_noms_esp,
				@in_fec_emision,
				@in_es_inspeccion_en_centro,
				@in_domicilio_inspeccion,
				@in_firman_titulares,
				@in_nombre_firmante,
				@in_cargo_firmante,
				@in_generar_citatorio,
				@in_incluir_notificador,
				@in_en_declare,
				@in_en_passt,
				@in_medio_informacion,
				@in_req_documentos_inicio,
				@in_req_documentos_termino,
				@in_rsp_tipo_equipo,
				@in_rsp_equipo,
				@in_rsp_num_control,
				@in_rsp_fec_autorizacion_provisional,
				@in_rsp_tipo_aviso,
				@in_rsp_folio,
				@in_rsp_pruebas,
				@in_resultado,
				@in_etapa,
				@in_estatus,
				@in_domicilio_inspeccion2,
				@in_tipo_programacion_id,
				@sys_usr,
				@in_otra_materia_motivo,
				@in_otra_materia_submateria,
				@normativa_version_id,
				GETDATE(),
				@colectivo_id
			)
			SET @inspeccion_id = SCOPE_IDENTITY();
		END
		ELSE BEGIN
		--	UPDATE dbo.inspeccion SET 
		--		inspector_id = ISNULL(@inspector_id,inspector_id),
		--		notificador_id = ISNULL(@notificador_id, notificador_id),
		--		mes_id = ISNULL(@mes_id, mes_id),
		--		materia_id = ISNULL(@materia_id, materia_id),
		--		fundamento_designacion_id = ISNULL(@fundamento_designacion_id, fundamento_designacion_id),
		--		motivo_inspeccion_id = ISNULL(@motivo_inspeccion_id, motivo_inspeccion_id),
		--		subtipo_inspeccion_id = ISNULL(@subtipo_inspeccion_id, subtipo_inspeccion_id),
		--		operativo_id = ISNULL(@operativo_id, operativo_id),
		--		cve_ur = ISNULL(@cve_ur, cve_ur),
		--		cve_rama = ISNULL(@cve_rama, cve_rama),
		--		centro_trabajo_id = ISNULL(@centro_trabajo_id, centro_trabajo_id),
		--		in_anio = ISNULL(@in_anio, in_anio),
		--		in_num_expediente = ISNULL(@in_num_expediente, in_num_expediente),
		--		in_otra_submateria = ISNULL(@in_otra_submateria, in_otra_submateria),
		--		in_ct_rfc = ISNULL(@in_ct_rfc, in_ct_rfc),
		--		in_ct_razon_social = ISNULL(@in_ct_razon_social, in_ct_razon_social),
		--		in_ct_nombre = ISNULL(@in_ct_nombre, in_ct_nombre),
		--		in_ct_imss_registro = ISNULL(@in_ct_imss_registro, in_ct_imss_registro),
		--		in_ct_clase_riesgo = ISNULL(@in_ct_clase_riesgo, in_ct_clase_riesgo),
		--		in_fec_inspeccion = ISNULL(@in_fec_inspeccion, in_fec_inspeccion),
		--		in_alcance = ISNULL(@in_alcance, in_alcance),
		--		in_habilitar_dias_inhabiles = ISNULL(@in_habilitar_dias_inhabiles, in_habilitar_dias_inhabiles),
		--		in_habilitar_horas_inhabiles = ISNULL(@in_habilitar_horas_inhabiles, in_habilitar_horas_inhabiles),
		--		in_incluye_noms_esp = ISNULL(@in_incluye_noms_esp, in_incluye_noms_esp),
		--		in_fec_emision = ISNULL(@in_fec_emision, in_fec_emision),
		--		in_es_inspeccion_en_centro = ISNULL(@in_es_inspeccion_en_centro, in_es_inspeccion_en_centro),
		--		in_domicilio_inspeccion = ISNULL(@in_domicilio_inspeccion, in_domicilio_inspeccion),
		--		in_firman_titulares = ISNULL(@in_firman_titulares, in_firman_titulares),
		--		in_nombre_firmante = ISNULL(@in_nombre_firmante, in_nombre_firmante),
		--		in_cargo_firmante = ISNULL(@in_cargo_firmante, in_cargo_firmante),
		--		in_generar_citatorio = ISNULL(@in_generar_citatorio, in_generar_citatorio),
		--		in_incluir_notificador = ISNULL(@in_incluir_notificador, in_incluir_notificador),
		--		in_en_declare = ISNULL(@in_en_declare, in_en_declare),
		--		in_en_passt = ISNULL(@in_en_passt, in_en_passt),
		--		in_medio_informacion = ISNULL(@in_medio_informacion, in_medio_informacion),
		--		in_req_documentos_inicio = ISNULL(@in_req_documentos_inicio, in_req_documentos_inicio),
		--		in_req_documentos_termino = ISNULL(@in_req_documentos_termino, in_req_documentos_termino),
		--		in_rsp_tipo_equipo = ISNULL(@in_rsp_tipo_equipo, in_rsp_tipo_equipo),
		--		in_rsp_equipo = ISNULL(@in_rsp_equipo, in_rsp_equipo),
		--		in_rsp_num_control = ISNULL(@in_rsp_num_control, in_rsp_num_control),
		--		in_rsp_fec_autorizacion_provisional = ISNULL(@in_rsp_fec_autorizacion_provisional, in_rsp_fec_autorizacion_provisional),
		--		in_rsp_tipo_aviso = ISNULL(@in_rsp_tipo_aviso, in_rsp_tipo_aviso),
		--		in_rsp_folio = ISNULL(@in_rsp_folio, in_rsp_folio),
		--		in_rsp_pruebas = ISNULL(@in_rsp_pruebas, in_rsp_pruebas),
		--		in_resultado = ISNULL(@in_resultado, in_resultado),
		--		in_etapa = ISNULL(@in_etapa, in_etapa),
		--		in_estatus = ISNULL(@in_estatus, in_estatus),
		--		sys_usr_update = ISNULL(@sys_usr, sys_usr_update),
		--		sys_fec_update = GETDATE()
		--	WHERE inspeccion_id = @inspeccion_id
		--END
		SELECT @inspeccion_id=inspeccion_id FROM dbo.inspeccion WHERE mes_id=@mes_id AND in_anio=@in_anio AND centro_trabajo_id = @centro_trabajo_id and in_estatus is null and operativo_id is null
		END
		--return @inspeccion_id
	END
	ELSE
	BEGIN
		IF NOT EXISTS(SELECT inspeccion_id FROM dbo.inspeccion WHERE mes_id=@mes_id AND in_anio=@in_anio AND centro_trabajo_id = @centro_trabajo_id and in_num_expediente is null and subtipo_inspeccion_id=@subtipo_inspeccion_id AND operativo_id=@operativo_id) AND (@inspeccion_id IS NULL OR @inspeccion_id = -1 OR @inspeccion_id = 0)
		BEGIN
			INSERT INTO dbo.inspeccion(
				inspector_id,
				notificador_id,
				mes_id,
				materia_id,
				fundamento_designacion_id,
				motivo_inspeccion_id,
				subtipo_inspeccion_id,
				operativo_id,
				cve_ur,
				cve_rama,
				centro_trabajo_id,
				in_anio,
				in_num_expediente,
				in_otra_submateria,
				in_ct_rfc,
				in_ct_razon_social,
				in_ct_nombre,
				in_ct_imss_registro,
				in_ct_clase_riesgo,
				in_fec_inspeccion,
				in_alcance,
				in_habilitar_dias_inhabiles,
				in_habilitar_horas_inhabiles,
				in_incluye_noms_esp,
				in_fec_emision,
				in_es_inspeccion_en_centro,
				in_domicilio_inspeccion,
				in_firman_titulares,
				in_nombre_firmante,
				in_cargo_firmante,
				in_generar_citatorio,
				in_incluir_notificador,
				in_en_declare,
				in_en_passt,
				in_medio_informacion,
				in_req_documentos_inicio,
				in_req_documentos_termino,
				in_rsp_tipo_equipo,
				in_rsp_equipo,
				in_rsp_num_control,
				in_rsp_fec_autorizacion_provisional,
				in_rsp_tipo_aviso,
				in_rsp_folio,
				in_rsp_pruebas,
				in_resultado,
				in_etapa,
				in_estatus,
				in_domicilio_inspeccion2,
				in_tipo_programacion_id,
				sys_usr_insert,
				in_otra_materia_motivo,
				in_otra_materia_submateria,
				normativa_version_id,
				sys_fec_insert,
				colectivo_id
			) VALUES (
				@inspector_id,
				@notificador_id,
				@mes_id,
				@materia_id,
				@fundamento_designacion_id,
				@motivo_inspeccion_id,
				@subtipo_inspeccion_id,
				@operativo_id,
				@cve_ur,
				@cve_rama,
				@centro_trabajo_id,
				@in_anio,
				@in_num_expediente,
				@in_otra_submateria,
				@in_ct_rfc,
				@in_ct_razon_social,
				@in_ct_nombre,
				@in_ct_imss_registro,
				@in_ct_clase_riesgo,
				@in_fec_inspeccion,
				@in_alcance,
				@in_habilitar_dias_inhabiles,
				@in_habilitar_horas_inhabiles,
				@in_incluye_noms_esp,
				@in_fec_emision,
				@in_es_inspeccion_en_centro,
				@in_domicilio_inspeccion,
				@in_firman_titulares,
				@in_nombre_firmante,
				@in_cargo_firmante,
				@in_generar_citatorio,
				@in_incluir_notificador,
				@in_en_declare,
				@in_en_passt,
				@in_medio_informacion,
				@in_req_documentos_inicio,
				@in_req_documentos_termino,
				@in_rsp_tipo_equipo,
				@in_rsp_equipo,
				@in_rsp_num_control,
				@in_rsp_fec_autorizacion_provisional,
				@in_rsp_tipo_aviso,
				@in_rsp_folio,
				@in_rsp_pruebas,
				@in_resultado,
				@in_etapa,
				@in_estatus,
				@in_domicilio_inspeccion2,
				@in_tipo_programacion_id,
				@sys_usr,
				@in_otra_materia_motivo,
				@in_otra_materia_submateria,
				@normativa_version_id,
				GETDATE(),
				@colectivo_id
			)
			SET @inspeccion_id = SCOPE_IDENTITY();
		END
		ELSE 
		BEGIN
		SELECT @inspeccion_id=inspeccion_id FROM dbo.inspeccion WHERE mes_id=@mes_id AND in_anio=@in_anio AND centro_trabajo_id = @centro_trabajo_id and in_estatus is null AND operativo_id=@operativo_id
		END
		
	END
	return @inspeccion_id
END
















USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		lcuenca@air.org
-- Create date: 04/05/2022
-- Description:	
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[PA_Listado_Resolucion_Cumplimiento]
	@cen_cve_edorep int = -1,
	@cve_ur						int = -1,
	@responsable_atencion_id	int = -1,
	@fec_ini					datetime = NULL,
	@fec_fin					datetime = NULL

AS
BEGIN
    SET NOCOUNT ON;
    
	WITH UltimaEtapa AS (
			SELECT MAX (s_expediente_etapa_id) ultimaEtapa_id, s_expediente_id expediente_id FROM dbo.s_expediente_etapa 
			WHERE see_estatus = 2 GROUP BY s_expediente_id)
			
	SELECT 
		  se.se_num_expediente
		, se.s_expediente_id
		, se.inspeccion_id
		, CONVERT(VARCHAR(10), se_fec_recepcion, 103) fec_recepcion
		, se_ct_nombre
		, se_ct_domicilio
		, CONVERT(VARCHAR(10), simpug_fec_demanda, 103) as fec_demanda
		, CONVERT(VARCHAR(10), simpug_fec_sentencia, 103) fec_sentencia
		, simpug_tipo_impugnacion
		, CASE simpug_tipo_impugnacion
			WHEN 1 THEN 'Recurso administrativo'
			WHEN 2 THEN 'Juicio de nulidad'
			WHEN 3 THEN 'Juicio de amparo'
			END AS medio_instaurado
		, 0 juicio_nulidad
		, 0 juicio_amparo
		, CONVERT(VARCHAR(10), sres_fec_resolucion, 103) fec_resolucion
		, CASE sres_determinacion_multa
			WHEN 1 THEN 'Multa mínima'
			WHEN 2 THEN 'PTU'
			WHEN 3 THEN 'Presunción' END determinacion_multa
		,  sres_monto_multa
		, '$'+ CAST( sres_monto_multa AS Varchar(255)) +'' as monto_resol_inicial
		, CONVERT(VARCHAR(10),sresc_fec_resolucion, 103) fec_resolucion_cumplimiento
		, sresc_monto_multa
		, '$'+ CAST( sresc_monto_multa AS Varchar(255)) +'' as monto_resol_cumplimiento
		, (SELECT top 1 t2.setapa_nombre from s_etapa t2 inner join s_expediente_etapa t1 on t2.s_etapa_id=t1.s_etapa_id where t1.see_estatus=2 and t1.s_expediente_id=se.s_expediente_id order by t1.s_expediente_etapa_id desc ) as ultimo_paso
	    , (SELECT top 1 Convert(Varchar(10),t1.see_fec_documento ,103) from s_expediente_etapa t1 where t1.see_estatus=2 and t1.s_expediente_id=se.s_expediente_id order by t1.s_expediente_etapa_id desc) as fecha_ultimo_paso
		, src.sys_usr_insert
		, dbo.FN_SUsuario_ObtenerNombrePorLogin(src.sys_usr_insert) dictaminador_realizo		 
	
	FROM dbo.s_expediente se
	INNER JOIN dbo.s_expediente_etapa see ON see.s_expediente_id = se.s_expediente_id
	INNER JOIN  s_etapa et ON see.s_etapa_id = et.s_etapa_id
	INNER JOIN dbo.s_resolucion_cumplimiento src ON src.s_expediente_etapa_id = see.s_expediente_etapa_id
	INNER JOIN dbo.s_resolucion sr ON sr.s_resolucion_id = src.s_resolucion_id
	INNER JOIN dbo.s_impugnacion si ON si.s_impugnacion_id = src.s_impugnacion_id
	INNER JOIN dbo.cat_unidad_respon cur ON cur.cur_cve_ur = se.cve_ur
	LEFT JOIN	UltimaEtapa ON UltimaEtapa.ultimaEtapa_id = see.s_expediente_etapa_id AND ultimaEtapa.expediente_id = see.s_expediente_id
	LEFT JOIN  s_participante par ON se.responsable_atencion_id= par.s_participante_id
	WHERE (cur_cve_edorep = @cen_cve_edorep OR @cen_cve_edorep = -1)
		AND (se.cve_ur = @cve_ur OR @cve_ur = -1)
		AND (sresc_fec_resolucion BETWEEN @fec_ini AND @fec_fin OR @fec_ini IS NULL)
		AND (s_participante_id = @responsable_atencion_id OR @responsable_atencion_id = -1)
		AND see.see_estatus=2

END
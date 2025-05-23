USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SExpediente_ObtenerEtapas]    Script Date: 2022-05-27 2:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ernesto
-- Create date: 29/10/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_SExpediente_ObtenerEtapas]
	-- Add the parameters for the stored procedure here
	@s_expediente_id int = -1,
	@s_expediente_etapa_id int = -1,
	@proceso varchar(100) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SET DATEFIRST 7;
    
    DECLARE @fec_actual datetime = GETDATE()
    
    
    SELECT d.s_documento_id,*, 
           CONVERT(VARCHAR,dbo.FN_EtapaObtenerFechaVencimiento(ex_etapa.see_plazo,ex_etapa.see_plazo_tipo_dias,ex_etapa.see_fec_inicio),103) fec_vencimiento,
           CASE WHEN see_semaforo IS NULL THEN
			   CASE 
			        WHEN dbo.FN_EtapaObtenerDiasEnVencimiento(dbo.FN_EtapaObtenerFechaVencimiento(ex_etapa.see_plazo,ex_etapa.see_plazo_tipo_dias,ex_etapa.see_fec_inicio),ex_etapa.see_fec_inicio,ex_etapa.see_plazo_tipo_dias) < 0  THEN 3 --rojo
					WHEN dbo.FN_EtapaObtenerDiasEnVencimiento(dbo.FN_EtapaObtenerFechaVencimiento(ex_etapa.see_plazo,ex_etapa.see_plazo_tipo_dias,ex_etapa.see_fec_inicio),ex_etapa.see_fec_inicio,ex_etapa.see_plazo_tipo_dias) <= 1 THEN 2 --amarillo
					ELSE 1 --verde
				END 
			ELSE see_semaforo
			END semaforo
		   , dbo.FNObtenerNombreSParticipante(ex_etapa.responsable_atencion_id) as asignado,
		   CONVERT(varchar,see_fec_documento,103) fec_documento,
		   dbo.FN_SUsuario_ObtenerNombrePorLogin(ex_etapa.sys_usr_update) actualizo
    FROM  dbo.s_expediente_etapa ex_etapa
    INNER JOIN dbo.s_etapa etapa
    ON ex_etapa.s_etapa_id = etapa.s_etapa_id
    LEFT JOIN dbo.s_etapa_tipo et on ex_etapa.s_etapa_id = et.s_etapa_id and ex_etapa.s_etapa_tipo_id = et.s_etapa_tipo_id
    LEFT JOIN dbo.s_participante part
    ON part.s_participante_id = ex_etapa.elaboro_id
    LEFT JOIN dbo.s_documento d on d.s_expediente_etapa_id = ex_etapa.s_expediente_etapa_id
    LEFT JOIN dbo.s_tipo_documento td on d.s_tipo_documento_id = td.s_tipo_documento_id
			and d.s_tipo_documento_id = td.s_tipo_documento_id
    WHERE ex_etapa.s_expediente_id = @s_expediente_id OR @s_expediente_id = -1
		 AND (ex_etapa.s_expediente_etapa_id = @s_expediente_etapa_id OR @s_expediente_etapa_id = -1)
    ORDER BY ex_etapa.s_expediente_etapa_id ASC
    

	--OBTENER OTROS DOCUMENTOS CARGADOS EN LAS ETAPAS DE SANCION

	SELECT s_documento_id,sdoc_url_archivo as url,descripcion,dbo.FN_SUsuario_ObtenerNombrePorLogin(sys_usr_insert) usuario,sys_fec_insert as fecha,proceso 
	FROM dbo.s_documento 
	WHERE descripcion is not null 
		AND (proceso = @proceso or @proceso = null)
		AND (se_s_expediente_id = @s_expediente_id or @s_expediente_id = -1)
   
END














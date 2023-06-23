USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SExpediente_Eliminar]    Script Date: 07/07/2022 11:04:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











-- =============================================
-- Author:		Jose
-- Create date: 13/12/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_SExpediente_Eliminar]
	@s_expediente_id int
AS
BEGIN
	SET NOCOUNT ON;
	
	--== selecciona todos los s_expediente_etapa_id para poder eliminar el expediente ==--
	select s_expediente_etapa_id into #temp from dbo.s_expediente_etapa where s_expediente_id = @s_expediente_id
	
	--== Elimiar todos los s_expedientes_etapas ==--
	delete from dbo.s_notif_requerir where s_notif_solicitud_id in (select s_notif_solicitud_id from dbo.s_notif_solicitud where s_expediente_etapa_id in (select * from #temp))
	delete from dbo.s_acuerdo_notificacion where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.notif_sancionador where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_notif_resultado where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_notif_solicitud where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_docto_valores where s_documento_id in (select s_documento_id from dbo.s_documento where s_expediente_etapa_id in (select * from #temp))
	delete from dbo.s_documento where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_prueba where s_acuerdo_cierre_id in (select s_acuerdo_cierre_id from dbo.s_acuerdo_cierre where s_expediente_etapa_id in (select * from #temp))
	delete from dbo.s_acuerdo_cierre where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_acuerdo_comparecencia where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_acuerdo_escrito_particular where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_acuerdo_terminacion where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_cobro_informe where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_oficio_cobro_detalle where s_cobro_solicitud_id in (select s_cobro_solicitud_id from dbo.s_cobro_solicitud where s_expediente_etapa_id in (select * from #temp))
	delete from dbo.s_cobro_solicitud where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_comparecencia where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_emplazamiento where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_impugnacion_archivo where s_impugnacion_id in (select s_impugnacion_id from dbo.s_impugnacion where s_expediente_etapa_id in (select * from #temp))
	delete from dbo.s_resolucion_cumplimiento where s_impugnacion_id in (select s_impugnacion_id from dbo.s_impugnacion where s_expediente_etapa_id in (select * from #temp))
	delete from dbo.s_impugnacion where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_resolucion where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_resolucion_cumplimiento where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_expediente_anexo where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_expediente_copia where s_expediente_etapa_id in (select * from #temp)
	delete from dbo.s_expediente_etapa where s_expediente_etapa_id in (select * from #temp)
	
	--== Eliminar el s_expedite ==--
	delete from dbo.s_control_archivo where s_expediente_id = @s_expediente_id
	delete from dbo.s_incumplimiento where s_expediente_id = @s_expediente_id
	delete from dbo.s_expediente where s_expediente_id = @s_expediente_id
END












USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Calificacion_ConsultarPorParticipante]    Script Date: 05/08/2022 05:37:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		Ana Karina
-- Create date: 22/03/2012
-- Modificado por: Miriam Meneses Castillo 
-- Fecha Modificación: 24 Abril 2014
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_Calificacion_ConsultarPorParticipante] 
	-- Add the parameters for the stored procedure here
	@participante_id			int	     =-1,
	@fecha_ini					datetime = null,
	@fecha_fin					datetime = null,
	@cve_ur						int      = -1,
	@estatus                    int      = -1,
	@desahogo_id                int      = -1,
	@calificacion_id			int		= -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	
	
	DECLARE @strSQLConsulta VARCHAR(6000);
	DECLARE @strparticipante_id VARCHAR(200);
	DECLARE @strfecha_ini VARCHAR(200);
	DECLARE @strfecha_fin VARCHAR(200);
	DECLARE @strcve_ur VARCHAR(200);
	DECLARE @strestatus VARCHAR(200);
	DECLARE @strdesahogo_id VARCHAR(200);
	DECLARE @strCalificacionID VARCHAR(200);


	SET @strSQLConsulta = "";
	SET @strparticipante_id = "";
	SET @strfecha_ini = "";
	SET @strfecha_fin = "";
	SET @strcve_ur = "";
	SET @strestatus = "";
	SET @strdesahogo_id = "";
	
    IF(@participante_id > 0)
		SET @strparticipante_id = " AND par.participante_id = " + Convert(varchar,@participante_id)
	
	IF(@desahogo_id > 0)
		SET @strdesahogo_id = " AND d.desahogo_id = " + Convert(varchar,@desahogo_id)
	
	IF(@fecha_ini <> "" or @fecha_ini is not null)
		SET @strfecha_ini = " AND calif_fec_asignacion >= " + CONVERT(varchar(10), @fecha_ini, 103)
	
	IF(@fecha_fin <> "" or @fecha_fin is not null)
		SET @strfecha_fin = " AND calif_fec_asignacion <= " + CONVERT(varchar(10), @fecha_fin, 103)
	
	IF(@cve_ur > 0)
		SET @strcve_ur = " AND i.cve_ur = " + Convert(varchar,@cve_ur)
	
	IF(@estatus > 0)
		SET @strestatus = " AND c.calif_estatus = " + Convert(varchar,@estatus)

	IF(@calificacion_id > -1)
	begin
		SET @strCalificacionID = " AND c.calificacion_id = " + Convert(varchar,@calificacion_id)
	end
	else
	begin
		SET @strCalificacionID = " AND c.calificacion_origen_id IS NULL " 
	end 
	
	SET @strSQLConsulta = " SELECT CONVERT(varchar(10), in_fec_inspeccion, 103) fecha_inspeccion, " +
		" stins_subtipo, i.subtipo_inspeccion_id, " +
		" mat_acronimo, CASE ISNULL(in_ct_nombre, '1') WHEN '1' THEN in_ct_razon_social ELSE in_ct_nombre END AS nombre, " +
		" in_domicilio_inspeccion, " +
		" (SELECT TOP 1 CONVERT(varchar(10), notif_fec_entrega, 103) " +
		"	FROM dbo.notificacion n " +
		"	LEFT JOIN dbo.notif_motivo_no_entrega nme ON nme.notif_motivo_no_entrega_id = n.notif_motivo_no_entrega_id " +
		"	WHERE inspeccion_id = i.inspeccion_id ORDER BY notif_fec_entrega DESC) fecha_entrega, " +
		" (SELECT TOP 1 " +
		"	CASE in_generar_citatorio WHEN 0 THEN 'Sin Citatorio' "+
		"		ELSE CASE notif_se_recibio WHEN 1 THEN 'Recibió ' + ISNULL(notif_nombre_recibio,'') + ' ' + ISNULL(notif_dijo_ser, '') + ', ' + ISNULL(notif_observaciones, '') " +
		"		ELSE CASE notif_quedo_pegado WHEN 1 THEN 'No recibió, sí se dejó pegado, ' + ISNULL(nmtvne_motivo,'') + CASE WHEN notif_observaciones IS NOT NULL THEN ', ' ELSE ' ' END + ISNULL(notif_observaciones, '') " +
		"		ELSE CASE notif_quedo_pegado WHEN 0 THEN 'No recibió, no se dejó pegado, ' + ISNULL(nmtvne_motivo,'') + CASE WHEN notif_observaciones IS NOT NULL THEN ', ' ELSE ' ' END + + ISNULL(notif_observaciones, '')  " +
		"		ELSE CASE WHEN notif_otro_motivo IS NOT NULL THEN  notif_otro_motivo + ', ' + ISNULL(notif_observaciones, '') " +
		"		ELSE 'Sin información registrada' END END END END END " +
		"	FROM dbo.notificacion n " +
		"	LEFT JOIN dbo.notif_motivo_no_entrega nme ON nme.notif_motivo_no_entrega_id = n.notif_motivo_no_entrega_id " +
		"	WHERE inspeccion_id = i.inspeccion_id ORDER BY notif_fec_entrega DESC) observaciones, " +
		" centro_trabajo_id, 		par.participante_id, 		i.inspeccion_id, " +
		" i.in_fec_inspeccion, 		in_ct_nombre, 		in_domicilio_inspeccion, " +
		" tipo_inspeccion_id, 		in_ct_razon_social, 		in_ct_rfc, " +
		" mat_materia	, 		i.materia_id, 		i.in_num_expediente, " +
		" i.in_alcance, 		d.desahogo_id, 		c.calificacion_id, " +
		" c.participante_id,		c.calif_acredita_personalidad,		c.calif_contiene_medidas, " +
		" c.calif_contiene_violaciones,		c.calif_cumple_requisitos,		c.calif_escrito_dentro_plazo, " +
		" c.calif_estatus,		c.calif_fec_asignacion,		c.calif_fec_calificacion, " +
		" c.calif_fec_recibio_escrito,		c.calif_num_fojas,		c.calif_se_recibio_escrito, " +
		" c.calif_solventa_violaciones,		c.calif_valoracion_pruebas,		SUBSTRING(i.in_num_expediente,5,6) num1, i.in_num_expediente num, " +
		" (select participante.par_nombre+' '+participante.par_primer_apellido+' '+ISNULL(participante.par_segundo_apellido,'') from participante where participante.participante_id=c.participante_id) as nombre_dictaminador, " +
		" c.calif_fec_asignacion, c.calificacion_origen_id, " +
		" CONVERT(varchar(10), calif_fec_asignacion, 103) fecha_asignacion, " +
		" CONVERT(varchar(10), calif_fec_calificacion, 103) fecha_calificacion, " +
		" case dbo.FN_ObtenerNombres(i.inspeccion_id, 2, 0) " +
		" when '' then REPLACE(dbo.FN_ObtenerNombres(i.inspeccion_id, 1, 0),'<br/>','') " +
		" else " +
		"	REPLACE(dbo.FN_ObtenerNombres(i.inspeccion_id, 1, 0) " +
		"	+', '+ dbo.FN_ObtenerNombres(i.inspeccion_id, 2, 0),'<br/>','') " +
		" END as inspectores, " +
		" dbo.FN_ObtenerNombresInspectoresDshgo(d.desahogo_id) as inspectores_desahogo, " +
		" dshgo_tipo_desahogo " +
	 " FROM dbo.inspeccion i " +
	 " INNER JOIN dbo.desahogo d ON d.inspeccion_id=i.inspeccion_id " +
	 " INNER JOIN dbo.calificacion c ON c.desahogo_id=d.desahogo_id " +
	 " INNER JOIN dbo.participante par ON par.participante_id = c.participante_id " +
	 " LEFT JOIN dbo.subtipo_inspeccion si ON si.subtipo_inspeccion_id = i.subtipo_inspeccion_id " +
	 " LEFT JOIN dbo.materia m ON m.materia_id = i.materia_id " +
	 " WHERE calif_fec_asignacion IS NOT NULL " + @strCalificacionID +
	 @strparticipante_id + @strdesahogo_id + @strfecha_ini + 
	 @strfecha_fin + @strcve_ur + @strestatus +
	" ORDER BY in_ct_razon_social + ' ' + ISNULL(in_ct_nombre, '')"
	print(@strSQLConsulta)
	EXEC (@strSQLConsulta)
	
END

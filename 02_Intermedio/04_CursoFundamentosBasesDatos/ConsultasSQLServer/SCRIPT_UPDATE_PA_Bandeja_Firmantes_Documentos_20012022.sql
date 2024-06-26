USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Bandeja_Firmantes_Documentos]    Script Date: 20/12/2022 10:12:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	<registro de documentos para firma>
-- =============================================
ALTER PROCEDURE [dbo].[PA_Bandeja_Firmantes_Documentos]
(
	@sentencia CHAR(30) = 'SELECT',
	@firmantes_documentos_id INT = NULL,
	@fd_inspeccion_id INT = NULL,
	@fd_desahogo_id INT = NULL,
	@fd_calificacion_id INT = NULL,
	@fd_proceso CHAR(200) = NULL,
	@fd_estatus INT = NULL,
	@fd_fecha_firma datetime = null,
	@fd_total_documentos INT = NULL,
	@fd_total_firmados INT = NULL,
	@fd_participante_id INT = NULL
)
AS
	BEGIN
		SET NOCOUNT ON

		IF (@sentencia = 'SELECTFIRMANTE')
			BEGIN
				SELECT *, in_num_expediente, in_fec_inspeccion, sys_usr_insert as registro_programacion FROM dbo.firmantes_documentos as fd
				INNER JOIN dbo.inspeccion as i
				ON fd.fd_inspeccion_id = i.inspeccion_id
				WHERE (fd_participante_id = @fd_participante_id OR @fd_participante_id IS NULL) 
				AND (firmantes_documentos_id = @firmantes_documentos_id OR @firmantes_documentos_id IS NULL)
				AND (fd_estatus = @fd_estatus OR @fd_estatus IS NULL) ORDER BY fd.fd_fecha_generacion ASC
			END
		ELSE IF (@sentencia = 'INSERT')
			BEGIN
				INSERT INTO dbo.firmantes_documentos (
					fd_inspeccion_id,
					fd_desahogo_id,
					fd_calificacion_id,
					fd_proceso,
					fd_estatus,
					fd_fecha_generacion,
					fd_total_documentos,
					fd_total_firmados,
					fd_participante_id
				)VALUES (				
					@fd_inspeccion_id,
					@fd_desahogo_id,
					@fd_calificacion_id,
					@fd_proceso,
					@fd_estatus,
					GETDATE(),
					@fd_total_documentos,
					@fd_total_firmados,
					@fd_participante_id
				)

				SELECT firmantes_documentos_id = SCOPE_IDENTITY()
			END
		ELSE IF (@sentencia = 'UPDATE')
			BEGIN
				UPDATE dbo.firmantes_documentos
				SET 
					fd_inspeccion_id = ISNULL(@fd_inspeccion_id, fd_inspeccion_id),
					fd_desahogo_id = ISNULL(@fd_desahogo_id, fd_desahogo_id),
					fd_calificacion_id = ISNULL(@fd_calificacion_id, fd_calificacion_id),
					fd_proceso = ISNULL(@fd_proceso, fd_proceso),
					fd_estatus = ISNULL(@fd_estatus, fd_estatus),
					fd_fecha_firma = ISNULL(@fd_fecha_firma, fd_fecha_firma),
					fd_total_documentos = ISNULL(@fd_total_documentos, fd_total_documentos),
					fd_total_firmados = ISNULL(@fd_total_firmados, fd_total_firmados),
					fd_participante_id = ISNULL(@fd_participante_id, fd_participante_id)
				WHERE firmantes_documentos_id = @firmantes_documentos_id
			END
			ELSE IF (@sentencia = 'SELECTIDDOCFIRM')
			BEGIN
				SELECT firmantes_documentos_id
				FROM dbo.firmantes_documentos 				
				WHERE (fd_inspeccion_id = @fd_inspeccion_id OR @fd_inspeccion_id IS NULL) 
				AND (fd_participante_id = @fd_participante_id OR @fd_participante_id IS NULL) 				
				AND (fd_proceso = @fd_proceso OR @fd_proceso IS NULL)
			END
	END
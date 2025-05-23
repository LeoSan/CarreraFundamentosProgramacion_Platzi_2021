USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_CalifDocumento_AgregarActualizar]    Script Date: 09/08/2022 05:32:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











-- =============================================
-- Author:		Ariana
-- Create date: 23/03/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_CalifDocumento_AgregarActualizar]
	@calif_documento_id		int = null,
	@tipo_documento_id		int = null,
    @calificacion_id		int = null,
	@participante_id		int = null,
	@cdoc_num_documento		varchar(40) = null,
	@cdoc_fec_documento		datetime = null,
	@cdoc_nombre_documento	varchar(200) = null,
	@cdoc_firma_titular		int = null,
	@cdoc_firmante			varchar(70) = null,
	@cdoc_puesto			varchar(100) = null,
	@cdoc_observaciones		varchar(400) = null,
	@cdoc_url_documento		varchar(255) = null,
	@cdoc_hash				varchar(100) = null,
	@sys_usr				varchar(150) = null,
	@participante_juridico_id int		= null,
	@cve_ur					int = null,
	@documento_firmado		int = null,
	@doc_url_archivo_sin_firmas varchar(255) = null

AS
BEGIN
    SET NOCOUNT ON;


IF NOT EXISTS(SELECT calif_documento_id FROM dbo.calif_documento WHERE calificacion_id = @calificacion_id AND tipo_documento_id = @tipo_documento_id	)
BEGIN
    INSERT INTO dbo.calif_documento (
		tipo_documento_id,
		calificacion_id,
		participante_id,
		cdoc_num_documento,
		cdoc_fec_documento,
		cdoc_nombre_documento,
		cdoc_firma_titular,
		cdoc_firmante,
		cdoc_puesto,
		cdoc_observaciones,
		cdoc_url_documento,
		cdoc_hash,
		sys_usr_insert,
		sys_fec_insert,
		participante_juridico_id,
		cve_ur,
		documento_firmado

) VALUES (
		@tipo_documento_id,
		@calificacion_id,
		@participante_id,
		@cdoc_num_documento,
		@cdoc_fec_documento,
		@cdoc_nombre_documento,
		@cdoc_firma_titular,
		@cdoc_firmante,
		@cdoc_puesto,
		@cdoc_observaciones,
		@cdoc_url_documento,
		@cdoc_hash,
		@sys_usr,
		GETDATE(),
		@participante_juridico_id,
		@cve_ur,
		@documento_firmado

)
	SET @calif_documento_id = SCOPE_IDENTITY()

END ELSE BEGIN
	UPDATE dbo.calif_documento SET 
		tipo_documento_id = ISNULL(@tipo_documento_id, tipo_documento_id),
		calificacion_id = ISNULL(@calificacion_id, calificacion_id),
		participante_id = ISNULL(@participante_id, participante_id),
		cdoc_num_documento = ISNULL(@cdoc_num_documento, cdoc_num_documento),
		cdoc_fec_documento = ISNULL(@cdoc_fec_documento, cdoc_fec_documento),
		cdoc_nombre_documento = ISNULL(@cdoc_nombre_documento, cdoc_nombre_documento),
		cdoc_firma_titular = ISNULL(@cdoc_firma_titular, cdoc_firma_titular),
		cdoc_firmante = ISNULL(@cdoc_firmante, cdoc_firmante),
		cdoc_puesto = ISNULL(@cdoc_puesto, cdoc_puesto),
		cdoc_observaciones = ISNULL(@cdoc_observaciones, cdoc_observaciones),
		cdoc_url_documento = ISNULL(@cdoc_url_documento, cdoc_url_documento),
		cdoc_hash = ISNULL(@cdoc_hash, cdoc_hash),
		participante_juridico_id = ISNULL(@participante_juridico_id, participante_juridico_id),
		cve_ur = ISNULL(@cve_ur, cve_ur),
		documento_firmado = ISNULL(@documento_firmado,documento_firmado),
		doc_url_archivo_sin_firmas = ISNULL(@doc_url_archivo_sin_firmas,doc_url_archivo_sin_firmas)

		WHERE calificacion_id = @calificacion_id AND tipo_documento_id = @tipo_documento_id
		
		SELECT @calif_documento_id = calif_documento_id FROM dbo.calif_documento WHERE calificacion_id = @calificacion_id AND tipo_documento_id = @tipo_documento_id
END
	RETURN @calif_documento_id
END






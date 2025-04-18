USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Documento_AgregarActualizar2]    Script Date: 09/08/2022 06:51:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David
-- Create date: 27/12/2011
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Documento_AgregarActualizar2]

	--@documento_id                int,
	@inspeccion_id               int,
	@inspector_id                int = null,
	@tipo_documento_id           smallint = null,
	@doc_url_archivo             varchar(500) = null,
	@doc_esta_asignado           tinyint = null,
	@doc_fec_documento           datetime = null,
	@doc_forma_entrega           tinyint = null,
	@doc_fec_limite_entrega      datetime = null,
	@doc_fec_entrega_programada  datetime = null,
	@doc_observaciones           varchar(1000) = null,
	@doc_estatus                 tinyint = null,
	@sys_usr                     varchar(150),
	
	@doc_firman_titulares		 int = null,
	@doc_nombre_firmante		 varchar(100) = null,	
	@doc_cargo_firmante			 varchar(100) = null,
	@documento_firmado           int = null,
	@doc_url_archivo_sin_firmas  varchar(500) = null
	

AS
BEGIN
    SET NOCOUNT ON;


IF NOT EXISTS(SELECT documento_id FROM documento WHERE inspeccion_id = @inspeccion_id and tipo_documento_id = @tipo_documento_id)
BEGIN
    INSERT INTO documento (
		--documento_id,
		inspeccion_id,
		inspector_id,
		tipo_documento_id,
		doc_url_archivo,
		doc_esta_asignado,
		doc_fec_documento,
		doc_forma_entrega,
		doc_fec_limite_entrega,
		doc_fec_entrega_programada,
		doc_observaciones,
		doc_estatus,
		sys_usr_insert,
		sys_fec_insert,
		
		doc_firman_titulares,
		doc_nombre_firmante,
		doc_cargo_firmante

		) VALUES (
				--@documento_id,
				@inspeccion_id,
				@inspector_id,
				@tipo_documento_id,
				@doc_url_archivo,
				@doc_esta_asignado,
				@doc_fec_documento,
				@doc_forma_entrega,
				@doc_fec_limite_entrega,
				@doc_fec_entrega_programada,
				@doc_observaciones,
				@doc_estatus,
				@sys_usr,
				GETDATE(),
		
				@doc_firman_titulares,
				@doc_nombre_firmante,
				@doc_cargo_firmante
		) RETURN SCOPE_IDENTITY()

END ELSE IF(@tipo_documento_id = 16)
	   BEGIN
		   INSERT INTO documento (
			--documento_id,
			inspeccion_id,
			inspector_id,
			tipo_documento_id,
			doc_url_archivo,
			doc_esta_asignado,
			doc_fec_documento,
			doc_forma_entrega,
			doc_fec_limite_entrega,
			doc_fec_entrega_programada,
			doc_observaciones,
			doc_estatus,
			sys_usr_insert,
			sys_fec_insert,
		
			doc_firman_titulares,
			doc_nombre_firmante,
			doc_cargo_firmante

	) VALUES (
			--@documento_id,
			@inspeccion_id,
			@inspector_id,
			@tipo_documento_id,
			@doc_url_archivo,
			@doc_esta_asignado,
			@doc_fec_documento,
			@doc_forma_entrega,
			@doc_fec_limite_entrega,
			@doc_fec_entrega_programada,
			@doc_observaciones,
			@doc_estatus,
			@sys_usr,
			GETDATE(),
		
			@doc_firman_titulares,
			@doc_nombre_firmante,
			@doc_cargo_firmante
	) RETURN SCOPE_IDENTITY()
	END
	ELSE BEGIN
		UPDATE documento SET 
			inspeccion_id 	             = ISNULL(@inspeccion_id, inspeccion_id),
			inspector_id 	             = ISNULL(@inspector_id, inspector_id),
			tipo_documento_id 	         = ISNULL(@tipo_documento_id, tipo_documento_id),
			doc_url_archivo 			 = ISNULL(@doc_url_archivo, doc_url_archivo),
			doc_esta_asignado 	         = ISNULL(@doc_esta_asignado, doc_esta_asignado),
			doc_fec_documento 	         = ISNULL(@doc_fec_documento, doc_fec_documento),
			doc_forma_entrega 	         = ISNULL(@doc_forma_entrega, doc_forma_entrega),
			doc_fec_limite_entrega 	     = ISNULL(@doc_fec_limite_entrega, doc_fec_limite_entrega),
			doc_fec_entrega_programada 	 = ISNULL(@doc_fec_entrega_programada, doc_fec_entrega_programada),
			doc_observaciones 	         = ISNULL(@doc_observaciones, doc_observaciones),
			doc_estatus 	             = ISNULL(@doc_estatus, doc_estatus),
			sys_usr_update 	             = ISNULL(@sys_usr, sys_usr_update),
			sys_fec_update 	             = GETDATE() ,
		
			doc_firman_titulares		 = ISNULL(@doc_firman_titulares, doc_firman_titulares),
			doc_nombre_firmante		     = ISNULL(@doc_nombre_firmante, doc_nombre_firmante),
			doc_cargo_firmante		     = ISNULL(@doc_cargo_firmante, doc_cargo_firmante),
			documento_firmado            = ISNULL(@documento_firmado, documento_firmado),
			doc_url_archivo_sin_firmas   = ISNULL(@doc_url_archivo_sin_firmas, doc_url_archivo_sin_firmas)

		  WHERE inspeccion_id = @inspeccion_id and tipo_documento_id = @tipo_documento_id  
		   return(SELECT documento_id FROM documento WHERE inspeccion_id = @inspeccion_id and tipo_documento_id = @tipo_documento_id)
	END
END
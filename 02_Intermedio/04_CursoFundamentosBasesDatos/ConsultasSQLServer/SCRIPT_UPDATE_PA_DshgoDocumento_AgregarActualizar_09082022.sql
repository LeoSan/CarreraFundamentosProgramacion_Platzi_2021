USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_DshgoDocumento_AgregarActualizar]    Script Date: 09/08/2022 05:31:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











-- =============================================
-- Author:		Ana Karina
-- Create date: 06/03/2012
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_DshgoDocumento_AgregarActualizar]
	-- Add the parameters for the stored procedure here
	@dshgo_documento_id			int,
	@desahogo_id				int = null,
	@tipo_documento_id			int = null,
	@ddoc_nombre_documento		varchar(200) = null,
	@ddoc_url_documento			varchar(255) = null,
	@ddoc_hash					varchar(100) = null,
	@sys_usr					varchar(150) = null,
	@documento_firmado          int = null,
	@doc_url_archivo_sin_firmas  varchar(500) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT dshgo_documento_id FROM dbo.dshgo_documento WHERE dshgo_documento_id = @dshgo_documento_id )
BEGIN
    INSERT INTO dshgo_documento (
		--dshgo_documento_id,
		 desahogo_id, tipo_documento_id, ddoc_nombre_documento, ddoc_url_documento, ddoc_hash, sys_usr_insert, sys_fec_insert

) VALUES (
		--@documento_id,
		@desahogo_id,
		@tipo_documento_id,
		@ddoc_nombre_documento,
		@ddoc_url_documento,
		@ddoc_hash,
		@sys_usr,
		GETDATE()
)

END ELSE BEGIN
	UPDATE dshgo_documento SET 
		desahogo_id 	             = ISNULL(@desahogo_id, desahogo_id),
		tipo_documento_id 	         = ISNULL(@tipo_documento_id, tipo_documento_id),
		ddoc_nombre_documento 		 = ISNULL(@ddoc_nombre_documento, ddoc_nombre_documento),
		ddoc_url_documento 	         = ISNULL(@ddoc_url_documento, ddoc_url_documento),
		ddoc_hash 					 = ISNULL(@ddoc_hash,ddoc_hash),
		documento_firmado            = ISNULL(@documento_firmado, documento_firmado),
		doc_url_archivo_sin_firmas   = ISNULL(@doc_url_archivo_sin_firmas, doc_url_archivo_sin_firmas)
	  WHERE dshgo_documento_id = @dshgo_documento_id
END
END
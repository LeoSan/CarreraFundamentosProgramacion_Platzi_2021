USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SDocumentoObtener]    Script Date: 11/07/2022 12:37:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		lcuenca@air.org 
-- Create date: 11/07/2022
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[PA_SDocumentoObtenerArchivoProceso] 
	@sentencia CHAR(20) = 'original',
	@s_documento_id int = -1,
	@s_expediente_etapa_id int = -1,
	@s_tipo_documento_id int = -1
AS
BEGIN
	SET NOCOUNT ON;

	IF (@sentencia = 'original')
		BEGIN
		
			SELECT sia.s_impugacion_archivo_id
			, sia.siarch_descripcion
			, sia.siarch_url_archivo
			, sia.siarch_fec_archivo
			, sia.sys_usr_insert 
			FROM dbo.s_impugnacion_archivo as sia 
			WHERE sia.s_impugacion_archivo_id = @s_documento_id  OR @s_documento_id  = -1
		
		END
	ELSE IF (@sentencia = 'solo-documento')
		BEGIN
			SELECT * FROM dbo.s_documento
			WHERE (s_documento_id  = @s_documento_id  OR @s_documento_id  = -1)        AND
				  (s_expediente_etapa_id = @s_expediente_etapa_id OR @s_expediente_etapa_id = -1) AND		  
				  (s_tipo_documento_id = @s_tipo_documento_id  OR @s_tipo_documento_id = -1) 
			ORDER BY s_documento_id;	
		END
END
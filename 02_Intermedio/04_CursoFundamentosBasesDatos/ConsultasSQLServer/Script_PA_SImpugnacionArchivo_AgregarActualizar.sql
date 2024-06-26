USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SImpugnacionArchivo_AgregarActualizar]    Script Date: 11/07/2022 01:46:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











-- =============================================
-- Author:		Jose Canseco
-- Create date: 12/11/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_SImpugnacionArchivo_AgregarActualizar]
	@s_impugacion_archivo_id int = null,
	@s_impugnacion_id		 int = null,
	@siarch_descripcion		 varchar(400) = null,
	@siarch_url_archivo		 varchar(255) = null,
	@siarch_fec_archivo		 datetime = null,
	@sys_usr				 varchar(20),
	@proceso		         varchar(400) = null
AS
BEGIN
	SET NOCOUNT ON;
	
	IF NOT EXISTS (SELECT s_impugacion_archivo_id FROM dbo.s_impugnacion_archivo WHERE s_impugacion_archivo_id = @s_impugacion_archivo_id)
	BEGIN
		
		INSERT dbo.s_impugnacion_archivo (
			--s_impugacion_archivo_id,
			s_impugnacion_id,
			siarch_descripcion,
			siarch_url_archivo,
			siarch_fec_archivo,
			sys_usr_insert,
			sys_fec_insert,
			proceso
		) VALUES (
			--@s_impugacion_archivo_id,
			@s_impugnacion_id,
			@siarch_descripcion,
			@siarch_url_archivo,
			@siarch_fec_archivo,
			@sys_usr,
			GETDATE(),
			@proceso
		)
		
		SET @s_impugacion_archivo_id = SCOPE_IDENTITY();
	END
	ELSE BEGIN
		UPDATE dbo.s_impugnacion_archivo SET
			siarch_descripcion	= ISNULL(@siarch_descripcion, siarch_descripcion),
			siarch_url_archivo	= ISNULL(@siarch_url_archivo, siarch_url_archivo),
			siarch_fec_archivo	= ISNULL(@siarch_fec_archivo, siarch_fec_archivo),
			sys_usr_update		= @sys_usr,
			sys_fec_update		= GETDATE(),
			proceso             = ISNULL(@proceso, proceso)
		WHERE s_impugacion_archivo_id = @s_impugacion_archivo_id
	END
	
	RETURN @s_impugacion_archivo_id
	
END












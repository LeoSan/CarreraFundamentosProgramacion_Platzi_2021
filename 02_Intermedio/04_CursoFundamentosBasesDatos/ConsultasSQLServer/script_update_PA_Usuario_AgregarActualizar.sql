USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Usuario_AgregarActualizar]    Script Date: 26/04/2022 05:35:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ariana Duarte
-- Create date: 14/11/2011
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Usuario_AgregarActualizar]
	@usuario_id			  int,
	@perfil_id			  int = null,
	@cve_ur				  int = null,
	@cve_edorep			  int = null,
	@core_usuario_id	  int = null,
	@usr_nombre			  varchar(30) = null,
	@usr_primer_apellido  varchar(30) = null,
	@usr_segundo_apellido varchar(30) = null,
	@usr_puesto			  varchar(100) = null,
	@usr_login			  varchar(20) = null,
	@usr_password		  varchar(10) = null,
	@usr_email			  varchar(100) = null,
	@usr_lada			  varchar(10) = null,
	@usr_telefono		  varchar(50) = null,
	@usr_estatus		  varchar(15) = null,
	@update_data_at       datetime = null
AS
BEGIN
    SET NOCOUNT ON;

	IF NOT EXISTS(SELECT usuario_id FROM dbo.usuario WHERE usuario_id = @usuario_id) BEGIN
		INSERT INTO dbo.usuario (
			perfil_id,
			cve_ur,
			cve_edorep,
			usr_nombre,
			usr_primer_apellido,
			usr_segundo_apellido,
			usr_puesto,
			usr_login,
			usr_password,
			usr_email,
			usr_telefono,
			usr_estatus,
			usr_fec_creacion,
			core_usuario_id,
			update_data_at
		) VALUES (
			@perfil_id,
			@cve_ur,
			@cve_edorep,
			@usr_nombre,
			@usr_primer_apellido,
			@usr_segundo_apellido,
			@usr_puesto,
			@usr_login,
			@usr_password,
			@usr_email,
			@usr_telefono,
			@usr_estatus,
			@update_data_at,
			@core_usuario_id,
			GETDATE()
		)
		SET @usuario_id = SCOPE_IDENTITY();
	END
	ELSE BEGIN
		UPDATE dbo.usuario SET 
			perfil_id			 = ISNULL(@perfil_id, perfil_id),
			cve_ur				 = ISNULL(@cve_ur,cve_ur),
			cve_edorep			 = ISNULL(@cve_edorep, cve_edorep),
			usr_nombre			 = ISNULL(@usr_nombre, usr_nombre),
			usr_primer_apellido	 = ISNULL(@usr_primer_apellido,usr_primer_apellido),
			usr_segundo_apellido = ISNULL(@usr_segundo_apellido,usr_segundo_apellido),
			usr_puesto			 = ISNULL(@usr_puesto, usr_puesto),
			usr_login			 = ISNULL(@usr_login, usr_login),
			usr_password		 = ISNULL(@usr_password, usr_password),
			usr_email			 = ISNULL(@usr_email, usr_email),
			usr_telefono		 = ISNULL(@usr_telefono, usr_telefono),
			usr_estatus			 = ISNULL(@usr_estatus, usr_estatus),
			core_usuario_id	     = ISNULL(@core_usuario_id, core_usuario_id),
			update_data_at       = ISNULL(@update_data_at, update_data_at),
			usr_fec_modificacion = GETDATE()
		WHERE usuario_id = @usuario_id
	END
	RETURN @usuario_id
END

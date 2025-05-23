USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_OperativoAsignacion_AgregarActualizar]    Script Date: 20/07/2022 01:02:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ariana Duarte
-- Create date: 24/11/2011
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_OperativoAsignacion_AgregarActualizar]
	@operativo_asignacion_id	int = null,
	@operativo_id				int = null,
	@inspector_id				int = null,
	@oas_cve_edorep				int = null,
	@oas_cve_ur					int = null,
	@sys_usr					varchar(20) = null

AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @operativo_asignacion_validado int = -1;
	
	IF( @operativo_asignacion_id = 0) BEGIN --Condición para Insertar
	
		-- Valido si lo que voy insertar esta en la tabla
		IF NOT EXISTS(SELECT operativo_asignacion_id FROM dbo.operativo_asignacion WHERE operativo_id = @operativo_id AND inspector_id = @inspector_id ) BEGIN
			INSERT INTO dbo.operativo_asignacion(
				operativo_id,
				inspector_id,
				oas_cve_edorep,
				oas_cve_ur,
				sys_usr_insert,
				sys_fec_insert
			) VALUES (
				@operativo_id,
				@inspector_id,
				@oas_cve_edorep,
				@oas_cve_ur,
				@sys_usr,
				GETDATE()
			)
			--PRINT 'ENTRE INSERT';	
			RETURN  @operativo_asignacion_validado;
		END
		ELSE BEGIN
			SET @operativo_asignacion_validado = ( SELECT operativo_asignacion_id FROM dbo.operativo_asignacion  WHERE operativo_id = @operativo_id AND inspector_id=@inspector_id)
			RETURN  @operativo_asignacion_validado;
		END
	END
	ELSE BEGIN --Condición para Editar

		UPDATE dbo.operativo_asignacion SET 
			operativo_id = ISNULL(@operativo_id, operativo_id),
			inspector_id = ISNULL(@inspector_id, inspector_id),
			oas_cve_edorep = ISNULL(@oas_cve_edorep, oas_cve_edorep),
			oas_cve_ur = ISNULL(@oas_cve_ur, oas_cve_ur)
		WHERE operativo_asignacion_id = @operativo_asignacion_id
		--PRINT 'UPDATE';
	END
END
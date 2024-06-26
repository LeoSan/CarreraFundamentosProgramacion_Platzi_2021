USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Castillo
-- Create date: 29/11/2011
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_OperativoAsignacion_EliminarPorOperativoId]
	-- Add the parameters for the stored procedure here
	@operativo_id int = null,
	@inspector_id int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @operativo_asignacion_id int;
	SET @operativo_asignacion_id = ( SELECT operativo_asignacion_id FROM dbo.operativo_asignacion  WHERE operativo_id = @operativo_id AND inspector_id=@inspector_id)

    -- Delete Operativo asignado a un usuario
	DELETE FROM dbo.operativo_asignacion WHERE operativo_id = @operativo_id AND inspector_id = @inspector_id

	-- Retorno la Id principal 
	RETURN  @operativo_asignacion_id;
END














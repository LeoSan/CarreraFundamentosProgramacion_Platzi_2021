USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		gabriel
-- Create date:  19/03/2012
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_DshgoInterrogatorioAbierta_Eliminar] 
		@dshgo_interrogado_id int,
		@dshgo_interrogatorio_abierta_id int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS(SELECT 1 FROM dshgo_interrogatorio_abierta where dshgo_interrogatorio_abierta_id=@dshgo_interrogatorio_abierta_id)
		BEGIN
			PRINT 'Entro la parte eliminar completa'
			-- Eliminar de manera completa 
			DELETE FROM dbo.dshgo_interrogatorio_abierta WHERE dshgo_interrogado_id= @dshgo_interrogado_id
		END
	ELSE 
		BEGIN
			PRINT 'Entro la parte eliminar regitro unico'
			-- Eliminar de manera unica
			DELETE FROM dbo.dshgo_interrogatorio_abierta WHERE dshgo_interrogatorio_abierta_id= @dshgo_interrogatorio_abierta_id
		END
END














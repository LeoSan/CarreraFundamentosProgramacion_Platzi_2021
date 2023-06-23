USE [SSI_DB_SIAPI_REFESSATV2]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lcuenca@air.org
-- Create date: 18/08/2022
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_SParrafoTexto_Eliminar]
	@s_docto_parrafo_texto_id   int = NULL

AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @VALIDA_COMPARECENCIA  INT = 0;
	DECLARE @VALIDA_MATERIA        INT = 0;
	DECLARE @VALIDA_NO_APLICA      INT = 0;
	DECLARE @s_docto_parrafo_id      INT = 0;

	SELECT @s_docto_parrafo_id= s_docto_parrafo_id  FROM dbo.s_docto_parrafo_texto	WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id; 

	SELECT  @VALIDA_COMPARECENCIA = sdp_cond_comparecencia FROM dbo.s_docto_parrafo WHERE s_docto_parrafo_id = @s_docto_parrafo_id;
	SELECT  @VALIDA_MATERIA       = sdp_cond_materia       FROM dbo.s_docto_parrafo WHERE s_docto_parrafo_id = @s_docto_parrafo_id;
	SELECT  @VALIDA_NO_APLICA     = sdp_cond_otra          FROM dbo.s_docto_parrafo WHERE s_docto_parrafo_id = @s_docto_parrafo_id;

	IF(@VALIDA_COMPARECENCIA = 1 )
	BEGIN
		-- Elimino [dbo.s_docto_parrafo_comparecencia]
		DELETE FROM dbo.s_docto_parrafo_comparecencia WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id;
	END

	IF(@VALIDA_MATERIA = 1 )
	BEGIN
		-- Elimino [dbo.s_docto_parrafo_materia]
		DELETE FROM dbo.s_docto_parrafo_materia WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id;
	END

	--Elimino [dbo.s_docto_parrafo_texto]
	DELETE FROM dbo.s_docto_parrafo_texto	WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id; 

END
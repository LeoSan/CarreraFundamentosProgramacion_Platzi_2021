USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_DshgoDocumento_Eliminar]    Script Date: 12/04/2022 12:52:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Juan Mora
-- Create date: 09/03/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_DshgoDocumento_Eliminar]
	@dshgo_documento_id int
AS
BEGIN
	SET NOCOUNT ON;
	
    DELETE dshgo_documento
	WHERE dshgo_documento_id = @dshgo_documento_id;

	DELETE FROM dbo.documento WHERE documento_id = @dshgo_documento_id;

END













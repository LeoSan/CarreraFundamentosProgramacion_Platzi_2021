USE [SSI_DB_SIAPI_REFESSATV2]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LEONARD 
-- Create date: 05/10/2022
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_plantilla_prueba]  
	-- Add the parameters for the stored procedure here
	@tipo_documento_id		int		= -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM dbo.tipo_documento_prueba WHERE (tipo_documento_id=@tipo_documento_id OR @tipo_documento_id=-1);
    
END




USE [SSI_DB_SIAPI_REFESSATV2]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Leonard Cuenca 
-- Create date: 07/04/2022
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[PA_dshgo_documento_Eliminar]
	@desahogo_id int
AS
BEGIN
	SET NOCOUNT ON;
	
    DELETE dshgo_documento
	WHERE desahogo_id = @desahogo_id

END
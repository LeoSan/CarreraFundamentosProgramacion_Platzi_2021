USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LCUENCA@AIR.ORG
-- Create date: Consulta para descargar documentos operativos  
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[PA_OperativosDocto_ObtenerDocPorID]
	-- Add the parameters for the stored procedure here
	@operativo_docto_id int = -1
AS
BEGIN
	SET NOCOUNT ON;

		SELECT 
			od.*
		FROM
			operativo_docto od
		WHERE 
			(operativo_docto_id =@operativo_docto_id or @operativo_docto_id =-1)
	
END















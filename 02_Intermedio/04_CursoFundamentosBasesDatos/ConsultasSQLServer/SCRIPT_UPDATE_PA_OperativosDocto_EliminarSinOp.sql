USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		cuenca@air.org
-- Create date: 
-- Description:	Permite eliminar esos documentos que son null 
-- =============================================
CREATE PROCEDURE [dbo].[PA_OperativosDocto_EliminarSinOp]
AS
BEGIN
	SET NOCOUNT ON;

	DELETE
	FROM 
		operativo_docto WHERE operativo_id is null	
END














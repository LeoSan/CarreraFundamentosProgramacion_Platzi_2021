USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lcuenca@air.org
-- Create date: 22/09/2022
-- Description:	Permite eliminar masivamente y de manera individual un personal del listado 
-- =============================================
CREATE PROCEDURE [dbo].[PA_DshgoListadoPMasivo_Eliminar]
	 @desahogo_id INT = -1
	,@dshgo_listado_personal_id INT = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
    -- Script para eliminar masivamente 
	DELETE 	FROM [dbo].[dshgo_listado_personal]
	  WHERE ( @desahogo_id = -1 OR (desahogo_id = @desahogo_id) )  AND	( @dshgo_listado_personal_id = -1 OR ( dshgo_listado_personal_id = @dshgo_listado_personal_id) )

END



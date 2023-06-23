USE [SSI_DB_SIAPI_REFESSATV2]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[PA_SIPAS_Parrafo_BuscarActualizar]
		@sentencia = N'SEARCH',
		@buscar_parrafo = N'toda'

SELECT	'Return Value' = @return_value

GO

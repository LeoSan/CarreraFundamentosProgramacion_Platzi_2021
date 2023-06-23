USE [SSI_DB_SIAPI_REFESSATV2]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		lcuenca@air.org
-- Create date: 24/08/2022
-- Description:	SE CREO ESTE METODO PARA QUE PUEDA VALIDAR SOLO LAS PREGUNTAS OBLIGATORIAS, PERMITA INDICARLE AL USUARIO CUALES SON LAS QUE LES FALTA DEL LISTADO DE PREGUNTAS OBLIGATORIAS
-- =============================================
CREATE FUNCTION [dbo].[FN_validaPreguntasObligatoriaS]
(
	-- Add the parameters for the function here
	@dshgo_interrogado_id int,
	@dpreg_tipo_pregunta INT = -1
)
RETURNS varchar(max)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Concat varchar(max)=''
	
	-- Add the T-SQL statements to compute the return value here
	SELECT @Concat += ('<p>'+dp.dpreg_pregunta + ': <span style="font-weight: normal;">' + dpr.dpresp_respuesta) + '</span></p>'
	FROM
		dbo.dshgo_interrogatorio di 
		left join dshgo_pregunta dp 
			on di.dshgo_pregunta_id=dp.dshgo_pregunta_id
		left join dshgo_pregunta_respuesta dpr 
			on di.dshgo_pregunta_respuesta= dpr.dshgo_pregunta_respuesta
	WHERE
		(di.dshgo_interrogado_id= @dshgo_interrogado_id) AND ( dp.dpreg_tipo_pregunta = @dpreg_tipo_pregunta)
	ORDER BY
		di.dshgo_interrogado_id
	

		
	-- Return the result of the function/
	RETURN @Concat

END



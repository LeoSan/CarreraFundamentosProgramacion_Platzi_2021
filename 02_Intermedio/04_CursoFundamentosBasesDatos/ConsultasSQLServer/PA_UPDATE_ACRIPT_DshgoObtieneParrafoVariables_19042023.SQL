USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  UserDefinedFunction [dbo].[DshgoObtieneParrafoVariables]    Script Date: 19/04/2023 07:29:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ana Karina
-- Create date: 08/03/2012
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION [dbo].[DshgoObtieneParrafoVariables] 
(
	-- Add the parameters for the function here
	@parrafo varchar(max),
	@dshgo_documento_id int
)
RETURNS varchar(max)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @string    varchar(max) --parrafo para operaciones
	DECLARE @pos       int			--Posicion cirre de tag
	DECLARE @pos2	   int			--Posicion inicio de tag
	DECLARE @variable  varchar(max) --Variable con tags 
	
	SET @string = @parrafo
	
	SET @pos    =  patindex('%>%' , @string) --posicion del primer cierre de tag 

	WHILE @pos <> 0 --mientras exista un cirre de tag
	BEGIN
	
		
		SET @variable = left(@string, @pos )     --Selecciona valores ala izquierda del cierre de tag 
		SET @pos2 =  patindex('%<%' , @variable) --posicion de inicio de tag 
		SET @variable = right(@variable, @pos  - (@pos2-1)) --Selecciona variable dentro de tags
  
		--Busca variables encontradas en tabla valor_variable y las sustituye en el parrafo
		SELECT @parrafo = REPLACE(@parrafo,@variable,(SELECT CASE WHEN dv_valor = 'PERSONA QUE ATIENDE LA VISITA' THEN 'la ' + dv_valor 
						 WHEN dv_valor = 'REPRESENTANTE LEGAL' THEN 'el ' + dv_valor 
						 WHEN dv_valor = 'REPRESENTANTE PATRONAL' THEN 'el ' + dv_valor 
						 WHEN dv_valor = 'PATRÓN' THEN 'el ' + dv_valor 
						 WHEN dv_valor = 'SECRETARIO GENERAL DEL SINDICATO' THEN 'el ' + dv_valor 
						 WHEN dv_valor = 'REPRESENTANTE LEGAL DEL SECRETARIO GENERAL DEL SINDICATO' THEN 'el ' + dv_valor 
						 WHEN dv_valor = 'REPRESENTANTE COMÚN DE LOS TRABAJADORES' THEN 'el ' + dv_valor 
						 WHEN dv_valor = 'NINGUNA PERSONA POR PARTE DE LOS TRABAJADORES' THEN 'el ' + dv_valor 
						 ELSE UPPER(dv_valor) END)) 
		FROM dbo.docto_variable docVar
		INNER JOIN  dbo.docto_valores docVal ON docVal.docto_variable_id = docvar.docto_variable_id
		WHERE var_variable = @variable AND  dshgo_documento_id = @dshgo_documento_id
			  
 
		SET @string = stuff(@string, 1, @pos, '') --Elimina caracteres del parrafo que se encunentran antes del cierre del tag
		SET @pos =  patindex('%>%' , @string)     --posicion del siguiente cierre de tag
 
 
 
	END --Fin de while
	
	RETURN @parrafo

END





USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SDoctoParrafoTexto_Eliminar]    Script Date: 18/08/2022 05:43:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lcuenca@air.org
-- Create date: 18/08/2022
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[PA_SDoctoParrafoTexto_Eliminar]
	@s_docto_parrafo_id        int          = NULL

AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @VALIDA_COMPARECENCIA  INT = 0;
	DECLARE @VALIDA_MATERIA        INT = 0;
	DECLARE @VALIDA_NO_APLICA      INT = 0;

	SELECT  @VALIDA_COMPARECENCIA = sdp_cond_comparecencia    FROM dbo.s_docto_parrafo WHERE s_docto_parrafo_id = @s_docto_parrafo_id;
	SELECT  @VALIDA_MATERIA = sdp_cond_materia   FROM dbo.s_docto_parrafo WHERE s_docto_parrafo_id = @s_docto_parrafo_id;
	SELECT  @VALIDA_NO_APLICA = sdp_cond_otra    FROM dbo.s_docto_parrafo WHERE s_docto_parrafo_id = @s_docto_parrafo_id;


IF ( (@VALIDA_COMPARECENCIA = 1) AND (@VALIDA_MATERIA = 0))
	BEGIN
		PRINT('SOY COMPARECENCIA ' );
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo_comparecencia]
		DECLARE @table table(s_docto_parrafo_texto_id int);
		INSERT INTO @table(s_docto_parrafo_texto_id) SELECT s_docto_parrafo_texto_id  FROM dbo.s_docto_parrafo_texto WHERE s_docto_parrafo_id = @s_docto_parrafo_id;
		DECLARE @MaxLoop INT = (SELECT COUNT(*) FROM @table);
		--Bucle 
		WHILE @MaxLoop > 0
			BEGIN
				--Obtenemos los datos 
				DECLARE @s_docto_parrafo_texto_id INT = (SELECT TOP(1) s_docto_parrafo_texto_id FROM @table ORDER BY s_docto_parrafo_texto_id);
				-- Elimino [dbo.s_docto_parrafo_comparecencia]
				DELETE FROM dbo.s_docto_parrafo_comparecencia WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id;
				
				--Nuestro contador 
				DELETE FROM @table WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id;
				SET @MaxLoop = (SELECT COUNT(*) FROM @table);
			END 
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo_texto]
		DELETE FROM dbo.s_docto_parrafo_texto	WHERE s_docto_parrafo_id = @s_docto_parrafo_id;
		
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo]
		DELETE FROM dbo.s_docto_parrafo WHERE s_docto_parrafo_id = @s_docto_parrafo_id;

	END 

IF ((@VALIDA_MATERIA = 1) AND (@VALIDA_COMPARECENCIA = 0) )
	BEGIN
		PRINT('SOY MATERIA ' );
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo_materia]
		DECLARE @tableMateria table(s_docto_parrafo_texto_id int);
		INSERT INTO @tableMateria(s_docto_parrafo_texto_id) SELECT s_docto_parrafo_texto_id  FROM dbo.s_docto_parrafo_texto WHERE s_docto_parrafo_id = @s_docto_parrafo_id;
		DECLARE @MaxLoop2 INT = (SELECT COUNT(*) FROM @tableMateria);

		--Bucle 
		WHILE @MaxLoop2 > 0
			BEGIN
				--Obtenemos los datos 
				DECLARE @s_docto_parrafo_texto_id_materia INT = (SELECT TOP(1) s_docto_parrafo_texto_id FROM @tableMateria ORDER BY s_docto_parrafo_texto_id);
				-- Elimino [dbo.s_docto_parrafo_materia]
				DELETE FROM dbo.s_docto_parrafo_materia WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id_materia;

				
				--Nuestro contador 
				DELETE FROM @tableMateria WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id_materia;
				SET @MaxLoop2 = (SELECT COUNT(*) FROM @tableMateria);
			END 
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo_texto]
		DELETE FROM dbo.s_docto_parrafo_texto	WHERE s_docto_parrafo_id = @s_docto_parrafo_id
		
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo]
		DELETE FROM dbo.s_docto_parrafo WHERE s_docto_parrafo_id = @s_docto_parrafo_id
			
	END 

IF ((@VALIDA_MATERIA = 1) AND (@VALIDA_COMPARECENCIA = 1) )
	BEGIN
		PRINT('SOY MATERIA && COMPARECENCIA ' );
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo_materia]
		DECLARE @tableHibrido table(s_docto_parrafo_texto_id int);
		INSERT INTO @tableHibrido(s_docto_parrafo_texto_id) SELECT s_docto_parrafo_texto_id  FROM dbo.s_docto_parrafo_texto WHERE s_docto_parrafo_id = @s_docto_parrafo_id;
		DECLARE @MaxLoop3 INT = (SELECT COUNT(*) FROM @tableHibrido);

		--Bucle 
		WHILE @MaxLoop3 > 0
			BEGIN
				--Obtenemos los datos 
				DECLARE @s_docto_parrafo_texto_id_hibrido INT = (SELECT TOP(1) s_docto_parrafo_texto_id FROM @tableHibrido ORDER BY s_docto_parrafo_texto_id);
				-- Elimino [dbo.s_docto_parrafo_materia]
				DELETE FROM dbo.s_docto_parrafo_materia WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id_hibrido;
				-- Elimino [dbo.s_docto_parrafo_comparecencia]
				DELETE FROM dbo.s_docto_parrafo_comparecencia WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id_hibrido;
				
				--Nuestro contador 
				DELETE FROM @tableHibrido WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id_hibrido;
				SET @MaxLoop3 = (SELECT COUNT(*) FROM @tableHibrido);
			END 
		
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo_texto]
		DELETE FROM dbo.s_docto_parrafo_texto	WHERE s_docto_parrafo_id = @s_docto_parrafo_id
		
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo]
		DELETE FROM dbo.s_docto_parrafo WHERE s_docto_parrafo_id = @s_docto_parrafo_id
			
	END 			
IF (@VALIDA_NO_APLICA = 1)
	BEGIN 
		PRINT('SOY NO APLICA' );
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo_texto]
		DELETE FROM dbo.s_docto_parrafo_texto	WHERE s_docto_parrafo_id = @s_docto_parrafo_id
		
		--Elimino Primero la relación multiple de la tabla [dbo.s_docto_parrafo]
		DELETE FROM dbo.s_docto_parrafo WHERE s_docto_parrafo_id = @s_docto_parrafo_id

	END
END
USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		lcuenca@air.org
-- Create date: August 19 2022
-- Description:	Search a word in parrafo
-- =============================================
CREATE PROCEDURE [dbo].[PA_SIPAS_Parrafo_BuscarActualizar]
	@sentencia CHAR(6) = 'SEARCH',
	@buscar_parrafo varchar(255) = NULL,
	@s_docto_parrafo_texto_id  INT = -1,
	@dpt_parrafo VARCHAR(max) = NULL
	
AS
BEGIN
	SET NOCOUNT ON;
	IF (@sentencia = 'SEARCH')
        BEGIN
			SELECT 
			parrafo.s_docto_parrafo_id, 
			parrafo.sdp_variable, 
			REPLACE(REPLACE(parrafo.sdp_variable,'<','&lt;'),'>','&gt;') variabletags,
			REPLACE(REPLACE(parrafo.sdp_variable,'<',''),'>','') variablesintags,
			parrafo.sdp_tipo_parrafo, 
			parrafo.sdp_cond_materia, 
			parrafo.sdp_cond_otra, 
			parrafo.sdp_condicion, 
			parrafo.sdp_estatus,
		   
			texto.s_docto_parrafo_texto_id, 
			texto.dpt_consecutivo, 
			texto.dpt_parrafo, 

			LOWER(REPLACE(texto.dpt_parrafo, @buscar_parrafo , '---' + @buscar_parrafo + '+++')) dpt_parrafo_search,

			REPLACE(REPLACE(texto.dpt_parrafo,'<','&lt;'),'>','&gt;') parrafotags,
			0 as dpt_condicion,
			texto.cve_ur,
			ur.ur_nombre, 
			tipo.std_tipo_documento
	
			FROM 
			dbo.s_docto_parrafo_texto texto
			INNER JOIN dbo.s_docto_parrafo parrafo ON texto.s_docto_parrafo_id       = parrafo.s_docto_parrafo_id   
			INNER JOIN dbo.s_tipo_documento tipo   ON parrafo.s_tipo_documento_id = tipo.s_tipo_documento_id    
			LEFT JOIN dbo.catalogo_ur ur   ON texto.cve_ur = ur.cve_ur    
			WHERE texto.dpt_parrafo LIKE '%' + @buscar_parrafo + '%'  
			ORDER BY parrafo.s_docto_parrafo_id
		END
	ELSE IF (@sentencia = 'UPDATE')
        BEGIN
			UPDATE dbo.s_docto_parrafo_texto SET 
				dpt_parrafo	= @dpt_parrafo
			WHERE s_docto_parrafo_texto_id = @s_docto_parrafo_texto_id
		END
END
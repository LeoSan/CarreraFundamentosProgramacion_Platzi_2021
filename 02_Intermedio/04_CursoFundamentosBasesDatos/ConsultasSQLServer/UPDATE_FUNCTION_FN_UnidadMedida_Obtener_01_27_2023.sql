
USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_UnidadMedida_Obtener]    Script Date: 26/01/2023 05:18:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:  Said Guerrero
-- Create date: 23/Dic/2022
-- Description: 
-- =============================================
 /* 
 Retorna el ID de la unidad de sanción realcionada al expediente de acuerdo con la fecha del acta de inspección
 */
ALTER FUNCTION [dbo].[FN_UnidadMedida_Obtener]
(
 @s_expediente_id int 
)
RETURNS decimal(18,2)
AS
BEGIN
 DECLARE @Result decimal(18,2)
 declare @fec_acta_inspeccion datetime = NULL;

 SELECT @fec_acta_inspeccion = des.dshgo_fec_cierre FROM s_expediente s_exp
  INNER JOIN inspeccion insp on insp.inspeccion_id = s_exp.inspeccion_id
  INNER JOIN desahogo des on des.inspeccion_id = insp.inspeccion_id
  WHERE s_exp.s_expediente_id = @s_expediente_id;

 SELECT TOP 1 @Result = s_unidad_sancion_id FROM s_unidad_sancion 
 WHERE estatus = 1 AND (fec_publicacion_dof < @fec_acta_inspeccion OR @fec_acta_inspeccion IS NULL) 
 order by fec_publicacion_dof DESC
  
 RETURN @Result

END

-- =============================================
---
-- =============================================

USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_TablaProcesoAC_Obtener]    Script Date: 26/10/2022 04:30:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David
-- Create date: 15/03/2012

-- =============================================
ALTER PROCEDURE [dbo].[PA_TablaProcesoAC_Obtener] ---121,10320 
	-- Add the parameters for the stored procedure here
	@desahogo_id int, 
	@inspeccion_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @acronomo CHAR(8) = 'AC';
	        
	     if  exists( SELECT i.materia_id  FROM dbo.inspeccion i INNER JOIN dbo.materia m ON m.materia_id = i.materia_id  WHERE m.mat_acronimo = @acronomo and inspeccion_id = @inspeccion_id)
	     begin
	        
	        
              select  UPPER( ISNULL(d.dshgo_proceso_descripcion,'NO APLICA')) AS dshgo_proceso_descripcion,  --Descripción del proceso de reclutamiento:
                       UPPER(ISNULL(d.dshgo_proceso_productos, 'NO APLICA')) AS dshgo_proceso_productos,  -- TARIFA
                       CASE  dct_dne_tipo_agencia_id --AGENCIA
						 WHEN 1 THEN 'AGENCIA CON FINES DE LUCRO'
						 WHEN 2 THEN 'AGENCIA SIN FINES DE LUCRO'
						 WHEN 3 THEN 'AGENCIAS DE CONTRATACIÓN COLECTIVA'
						 ELSE 'NO APLICA'
					  END as 'tipo_agencia'
                      from 
                       inspeccion i inner join desahogo d on i.inspeccion_id = d.inspeccion_id 
               left join dbo.dshgo_centro_trabajo  ct on d.desahogo_id = ct.desahogo_id
                                         where d.desahogo_id = @desahogo_id and i.inspeccion_id = @inspeccion_id
        end else begin
                select '' as dshgo_proceso_descripcion, '' as dshgo_proceso_productos, '' as tipo_agencia from dshgo_centro_trabajo where 1 = -1
        end 
          
  
END













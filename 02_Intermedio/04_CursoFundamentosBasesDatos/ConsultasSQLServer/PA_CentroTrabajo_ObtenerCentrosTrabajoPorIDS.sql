USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_CentroTrabajo_ObtenerCentrosTrabajoPorIDS]    Script Date: 02/03/2023 05:11:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
 
ALTER PROCEDURE [dbo].[PA_CentroTrabajo_ObtenerCentrosTrabajoPorIDS]   
 -- Add the parameters for the stored procedure here  
 @centros_trabajo_ids text  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;   
 SELECT a.centro_trabajo_id 
    , a.ct_nombre 
    , a.ct_nombre_comercial 
    , a.ct_calle
	, ct_calle + ' No.Ext ' + ct_num_exterior + 
		CASE RTRIM(LTRIM(' No.Int ' + ISNULL(ct_num_interior,''))) 
			WHEN 'No.Int' THEN '' ELSE ' No.Int ' + ct_num_interior
		END + ' Colonia ' + ct_colonia + ', CP ' + ct_cp as ct_domicilio,
		a.ct_cve_edorep,
		a.ct_cve_municipio
 FROM db_dne.dbo.centro_trabajo as a  
  WHERE a.centro_trabajo_id IN ( SELECT Value FROM dbo.SplitString(@centros_trabajo_ids, ',')   ) 
END
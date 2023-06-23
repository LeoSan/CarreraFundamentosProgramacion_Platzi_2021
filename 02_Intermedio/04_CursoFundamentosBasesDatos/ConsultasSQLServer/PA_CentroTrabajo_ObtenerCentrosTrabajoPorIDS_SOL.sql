USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_CentroTrabajo_ObtenerCentrosTrabajoPorIDS]    Script Date: 09/03/2023 12:04:19 p. m. ******/
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
		a.ct_cve_municipio,
		a.ct_cve_municipio,
		a.ct_imss_registro,
		a.ct_actividad_imss_riesgo,
	db_dne.dbo.empresa.*,
	(SELECT TOP(1) (a.ct_calle + 
		CASE RTRIM(LTRIM(' No. ' + ISNULL(a.ct_num_exterior,'')))
			WHEN 'No.' THEN '' ELSE ' No. ' + a.ct_num_exterior 
			END + 
		CASE RTRIM(LTRIM(' Interior ' + ISNULL(a.ct_num_interior,''))) 
			WHEN 'Interior' THEN '' ELSE ', Interior ' + a.ct_num_interior
		END + 
		CASE RTRIM(LTRIM(' Colonia ' + ISNULL(a.ct_colonia,'')))
			WHEN 'Colonia' THEN '' ELSE  ', Colonia ' + a.ct_colonia 
		 END  + 
		CASE RTRIM(LTRIM(' C.P. ' + ISNULL(a.ct_cp,''))) 
			WHEN 'C.P.' THEN '' ELSE  ', C.P. ' + a.ct_cp 
		END)
		 as domicilio_fiscal 
		 FROM db_dne.dbo.centro_trabajo  WHERE db_dne.dbo.centro_trabajo.empresa_id=db_dne.dbo.empresa.empresa_id AND db_dne.dbo.centro_trabajo.ct_estatus=1
		 ORDER BY db_dne.dbo.centro_trabajo.sys_fec_insert DESC) as domicilio_fiscal
	FROM db_dne.dbo.centro_trabajo as a  
	left join db_dne.dbo.empresa on a.empresa_id = db_dne.dbo.empresa.empresa_id
	 WHERE (a.centro_trabajo_id IN ( SELECT Value FROM dbo.SplitString(@centros_trabajo_ids, ',')   ) and a.ct_estatus=1)
END
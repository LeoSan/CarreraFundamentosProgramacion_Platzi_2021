USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Inspeccion_ConsultarEmpresa]    Script Date: 04/08/2022 07:05:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ariana Duarte
-- Create date: 10/04/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Inspeccion_ConsultarEmpresa]
	@in_ct_nombre		varchar(255) = NULL,
	@in_num_expediente	varchar(50) = NULL,
	@in_ct_rfc			varchar(14) = NULL,
	@fecha_ini			datetime = NULL,
	@fecha_fin			datetime = NULL,
	@cve_ur				int = -1,
	@participante_id	int = -1,
	@cur_cve_edorep		int = -1
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Temporal NVARCHAR(MAX);
	DECLARE @SqlParameter1 Varchar(200);
	DECLARE @SqlParameter2 Varchar(200);
	DECLARE @SqlParameter3 Varchar(200);
	DECLARE @SqlParameter4 Varchar(200);
	DECLARE @SqlParameter5 Varchar(200);
	DECLARE @SqlParameter6 Varchar(200);
	DECLARE @SqlParameter7 Varchar(200);
	DECLARE @tabla1 TABLE(centro_trabajo_id INT)



	IF(@in_ct_nombre IS NOT NULL )
	 SET @SqlParameter1=' AND isnull(in_ct_nombre,in_ct_razon_social) LIKE '+ '''%' + @in_ct_nombre  + '%'''
	ELSE
	 SET @SqlParameter1=''


	IF(@in_num_expediente IS NOT NULL )
	SET @SqlParameter2=' AND in_num_expediente ='+ ''''+@in_num_expediente+''''
	ELSE
	SET @SqlParameter2=''

	IF(@in_ct_rfc IS NOT NULL )
	SET @SqlParameter3=' AND in_ct_rfc LIKE ' +'''%' + @in_ct_rfc  + '%'''
	ELSE
	SET @SqlParameter3=''


	IF(@cve_ur>0 )
	SET @SqlParameter4=' AND cve_ur	='+ ''''+convert(varchar,@cve_ur)+''''
	ELSE
	SET @SqlParameter4=''

	IF(@participante_id >0 )
	SET @SqlParameter5=' AND participante_id ='+ ''''+convert(varchar,@participante_id)+'''' 
	ELSE
	SET @SqlParameter5=''

	IF(@cur_cve_edorep >0 )
	SET @SqlParameter6=' AND cur_cve_edorep ='+ ''''+convert(varchar,@cur_cve_edorep)+''''
	ELSE
	SET @SqlParameter6=''

	IF(@fecha_ini >0 )
	SET @SqlParameter7=' AND in_fec_inspeccion BETWEEN '''+ Convert(varchar,@fecha_ini,101)+ ''' AND '''+ convert(varchar,@fecha_fin,101) +''''
	ELSE
	SET @SqlParameter7=''

	SET @Temporal ='
	   select distinct (centro_trabajo_id)
       FROM dbo.inspeccion i
       INNER JOIN dbo.inspec_participante ip ON ip.inspeccion_id = i.inspeccion_id
       LEFT JOIN dbo.cat_unidad_respon ur ON ur.cur_cve_ur = i.cve_ur
       WHERE in_etapa > 0 '+@SqlParameter1+@SqlParameter2+@SqlParameter3+@SqlParameter4+@SqlParameter5+@SqlParameter6+@SqlParameter7;



print  @Temporal;

INSERT INTO @tabla1
EXEC (@Temporal)

   SELECT 
		i.centro_trabajo_id,
		emp_rfc as in_ct_rfc,
		CASE ISNULL(ct_nombre, '1') WHEN '1' THEN emp_nombre ELSE ct_nombre END AS nombre_empresa,
		emp_nombre as in_ct_razon_social,
		ct_calle + 
		CASE RTRIM(LTRIM(' No. ' + ISNULL(ct_num_exterior,'')))
			WHEN 'No.' THEN '' ELSE ' No. ' + ct_num_exterior 
			END + 
		CASE RTRIM(LTRIM(' Interior ' + ISNULL(ct_num_interior,''))) 
			WHEN 'Interior' THEN '' ELSE ', Interior ' + ct_num_interior
		END + 
		CASE RTRIM(LTRIM(' Colonia ' + ISNULL(ct_colonia,'')))
			WHEN 'Colonia' THEN '' ELSE  ', Colonia ' + ct_colonia 
		 END  + 
		CASE RTRIM(LTRIM(' C.P. ' + ISNULL(ct_cp,''))) 
			WHEN 'C.P.' THEN '' ELSE  ', C.P. ' + ct_cp 
		END
		as in_domicilio_inspeccion,
		(SELECT TOP 1 dct_cve_edorep FROM dbo.dshgo_centro_trabajo ct WHERE ct.dct_dne_centro_trabajo_id = i.centro_trabajo_id) cve_edorep,
		(SELECT TOP 1 dct_cve_municipio FROM dbo.dshgo_centro_trabajo ct WHERE ct.dct_dne_centro_trabajo_id = i.centro_trabajo_id) cve_municipio,
		(SELECT TOP(1) CONVERT(varchar(10), cm_fec_ultima_inspeccion, 103) FROM dbo.centro_materiaDNE 
		 WHERE cm_materia = 'CGT' AND centro_trabajo_id = i.centro_trabajo_id ORDER BY cm_fec_ultima_inspeccion DESC) as ultima_inspeccion_cgt,
		(SELECT TOP(1) CONVERT(varchar(10), cm_fec_ultima_inspeccion, 103) FROM dbo.centro_materiaDNE 
		 WHERE cm_materia = 'SH' AND centro_trabajo_id = i.centro_trabajo_id ORDER BY cm_fec_ultima_inspeccion DESC)  as ultima_inspeccion_sh,
		(SELECT TOP(1) CONVERT(varchar(10), cm_fec_ultima_inspeccion, 103) FROM dbo.centro_materiaDNE 
		  WHERE cm_materia = 'CA' AND centro_trabajo_id = i.centro_trabajo_id ORDER BY cm_fec_ultima_inspeccion DESC)  as ultima_inspeccion_ca
		
	FROM dbo.empresaDNE e 
	INNER JOIN dbo.centro_trabajoDNE i ON e.empresa_id=i.empresa_id
	INNER JOIN @tabla1 t1 ON t1.centro_trabajo_id=i.centro_trabajo_id


END

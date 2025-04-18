USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Notificacion_Busqueda]    Script Date: 04/08/2022 06:45:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ariana Duarte
-- Create date: 23/12/2011
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Notificacion_Busqueda]
	@notif_estatus_entrega		int = -1,
	@notif_estatus_asignacion	int = -1,
	@notif_forma_entrega		int = -1,
	@tipo_documento_id			int = -1,
	@inspector_id				int = -1,
	@in_ct_nombre				varchar(255) = '',
	@ct_cve_municipio			int = -1,
	@fecha_ini					datetime = null,
	@fecha_fin					datetime = null,
	@cve_ur						int = -1,
	@tipo						varchar(255) = ''
AS
BEGIN
    SET NOCOUNT ON;

	
	
	--insert into bitacora_debug (fecha,cadena) values (GETDATE(),@str_parametros)	

	DECLARE  @Query1  nvarchar(4000),@Query2  nvarchar(4000)
    
    SET @Query1=N'SELECT *,
		CASE notif_forma_entrega
			WHEN 1 THEN insp_nombre
			WHEN 2 THEN ''No aplica'' END inspector_nombre,
		CONVERT(varchar(10), notif_fec_limite_entrega, 103) fec_limite_entrega,
		CONVERT(varchar(10), notif_fec_entrega_programada, 103) fec_entrega_programada,
		CONVERT(varchar(10), notif_fec_entrega, 103) fec_entrega,
		CASE ISNULL(in_ct_nombre, ''1'') WHEN ''1'' THEN in_ct_razon_social ELSE in_ct_nombre END AS nombre,
		CASE notif_forma_entrega
			WHEN 1 THEN ''Notificación''
			WHEN 2 THEN ''Correo certificado'' END forma_entrega
    FROM dbo.notificacion n
	INNER JOIN dbo.inspeccion i ON i.inspeccion_id = n.inspeccion_id
	INNER JOIN dbo.centro_trabajoDNE ct ON ct.centro_trabajo_id = i.centro_trabajo_id
	LEFT JOIN dbo.tipo_documento td ON td.tipo_documento_id = n.tipo_documento_id
	LEFT JOIN dbo.inspector ins ON ins.inspector_id = n.inspector_id
	WHERE	 notif_estatus_asignacion >= 1 
	    AND  i.in_estatus IS NOT NULL '
	    
if @notif_estatus_entrega <> -1
  set @Query1=@Query1+'AND   notif_estatus_entrega = @notif_estatus_entrega  '

if @tipo = 'asignacion'
 set @query1 = @Query1+'AND notif_estatus_entrega != 1'
if @notif_estatus_asignacion <> -1
  set @Query1=@Query1+'AND   notif_estatus_asignacion = @notif_estatus_asignacion  '
		
if @notif_forma_entrega <> -1
  set @Query1=@Query1+'AND   notif_forma_entrega = @notif_forma_entrega  '

if @tipo_documento_id <> -1
  set @Query1=@Query1+'AND   n.tipo_documento_id = @tipo_documento_id  '

if @inspector_id <> -1
  set @Query1=@Query1+'AND   n.inspector_id = @inspector_id  '
  
if @ct_cve_municipio <> -1
  set @Query1=@Query1+'AND   ct_cve_municipio = @ct_cve_municipio  '

if @in_ct_nombre <> ''
  set @Query1=@Query1+'AND   in_ct_nombre  LIKE ''%'' + @in_ct_nombre + ''%''   '

if @fecha_ini is not null
  set @Query1=@Query1+'AND   (notif_fec_limite_entrega between @fecha_ini and @fecha_fin)  '

if @cve_ur <> -1
  set @Query1=@Query1+'AND   i.cve_ur = @cve_ur  '

Set @Query1=@Query1+'ORDER BY n.notif_fec_limite_entrega DESC  '




SET @Query2=N'SELECT *,
		CASE notif_forma_entrega
			WHEN 1 THEN insp_nombre
			WHEN 2 THEN ''No aplica'' END inspector_nombre,
		CONVERT(varchar(10), notif_fec_limite_entrega, 103) fec_limite_entrega,
		CONVERT(varchar(10), notif_fec_entrega_programada, 103) fec_entrega_programada,
		CONVERT(varchar(10), notif_fec_entrega, 103) fec_entrega,
		CASE ISNULL(in_ct_nombre, ''1'') WHEN ''1'' THEN in_ct_razon_social ELSE in_ct_nombre END AS nombre,
		CASE notif_forma_entrega
			WHEN 1 THEN ''Notificación''
			WHEN 2 THEN ''Correo certificado'' END forma_entrega
    FROM dbo.notificacion n
	INNER JOIN dbo.inspeccion i ON i.inspeccion_id = n.inspeccion_id
	INNER JOIN dbo.centro_trabajoDNE ct ON ct.centro_trabajo_id = i.centro_trabajo_id
	INNER JOIN dbo.tipo_documento td ON td.tipo_documento_id = n.tipo_documento_id
	left JOIN dbo.inspector ins ON ins.inspector_id = n.inspector_id
	WHERE	notif_estatus_asignacion = 1  
	  AND   i.in_estatus IS NOT NULL	'
	
if @notif_estatus_entrega <> -1
  set @Query2=@Query2+'AND   notif_estatus_entrega = @notif_estatus_entrega  '

  if @tipo = 'asignacion'
 set @Query2 = @Query2+'AND notif_estatus_entrega != 1'

if @notif_estatus_asignacion <> -1
  set @Query2=@Query2+'AND   notif_estatus_asignacion = @notif_estatus_asignacion  '

if @notif_forma_entrega <> -1
  set @Query2=@Query2+'AND   notif_forma_entrega = @notif_forma_entrega  '  

if @tipo_documento_id <> -1
  set @Query2=@Query2+'AND   n.tipo_documento_id = @tipo_documento_id  '    

if @inspector_id <> -1
  set @Query2=@Query2+'AND   n.inspector_id = @inspector_id  '    
  
if @ct_cve_municipio <> -1
  set @Query2=@Query2+'AND  ct_cve_municipio = @ct_cve_municipio  '  
  
if @in_ct_nombre <> ''
  set @Query2=@Query2+'AND  in_ct_nombre  LIKE ''%'' + @in_ct_nombre + ''%''   '  

if @fecha_ini is not null
  set @Query2=@Query2+'AND  (notif_fec_limite_entrega between @fecha_ini and @fecha_fin)  ' 

if @cve_ur <> -1
  set @Query2=@Query2+'AND  i.cve_ur = @cve_ur  '

set @Query2=@Query2+'ORDER BY n.notif_fec_limite_entrega DESC  '


EXEC sp_executesql @Query1, N'@notif_estatus_entrega int,@notif_estatus_asignacion int, @notif_forma_entrega int, @tipo_documento_id int, @inspector_id int, @ct_cve_municipio int, @in_ct_nombre nvarchar(255), @fecha_ini datetime, @fecha_fin datetime, @cve_ur int', @notif_estatus_entrega, @notif_estatus_asignacion, @notif_forma_entrega, @tipo_documento_id, @inspector_id, @ct_cve_municipio, @in_ct_nombre, @fecha_ini, @fecha_fin, @cve_ur
EXEC sp_executesql @Query2, N'@notif_estatus_entrega INT, @notif_estatus_asignacion INT, @notif_forma_entrega INT, @tipo_documento_id INT, @inspector_id INT, @ct_cve_municipio INT, @in_ct_nombre  nvarchar(255), @fecha_ini DATETIME, @fecha_fin DATETIME, @cve_ur INT', @notif_estatus_entrega, @notif_estatus_asignacion, @notif_forma_entrega, @tipo_documento_id, @inspector_id, @ct_cve_municipio, @in_ct_nombre, @fecha_ini, @fecha_fin, @cve_ur



print @Query1
print @Query2
END

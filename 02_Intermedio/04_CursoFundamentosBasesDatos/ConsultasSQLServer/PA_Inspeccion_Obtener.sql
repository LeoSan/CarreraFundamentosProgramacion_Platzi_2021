USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Inspeccion_Obtener]    Script Date: 08/03/2023 04:09:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   

-- =============================================  
-- Author:  Ariana Duarte  
-- Create date: 30/11/2011  
-- Description:   
-- =============================================  
ALTER PROCEDURE [dbo].[PA_Inspeccion_Obtener]  
 @inspeccion_id int = -1,  
 @mes_id int = -1,  
 @cve_ur int = -1,  
 @centro_trabajo_id int = -1,  
 @in_anio int = -1,  
 @operativo_id   int =-1,  
 @tipo_inspeccion_id int=-1,  
 @in_tipo_programacion_id int = -1,  
 @in_aplica_especial int = -1,  
 @in_estatus int = -1  
AS  
BEGIN  
 SET NOCOUNT ON;  
   
declare @condiciones nvarchar(1000),@condiciones2 nvarchar(1000)
set @condiciones =N''

       
         IF @inspeccion_id  <> -1
         SET @condiciones=@condiciones + ' AND inspeccion_id = @inspeccion_id'  
         IF @mes_id  <> -1 
          SET @condiciones=@condiciones + ' and mes_id = @mes_id'
        IF @cve_ur  <> -1
         SET @condiciones=@condiciones + ' and i.cve_ur = @cve_ur'
          IF @centro_trabajo_id  <> -1
           SET @condiciones=@condiciones + ' and centro_trabajo_id = @centro_trabajo_id'
         IF @in_anio  <> -1 
          SET @condiciones=@condiciones + ' and in_anio = @in_anio'
          IF @operativo_id    <> -1 
           SET @condiciones=@condiciones + ' and i.operativo_id=@operativo_id'
         IF @tipo_inspeccion_id <>-1
          SET @condiciones=@condiciones + ' and si.tipo_inspeccion_id=@tipo_inspeccion_id'
         IF @in_tipo_programacion_id  <> -1 
          SET @condiciones=@condiciones + ' and i.in_tipo_programacion_id = @in_tipo_programacion_id'
         IF @in_aplica_especial  <>-1 
          SET @condiciones=@condiciones + ' and i.in_aplica_especial = @in_aplica_especial'
         IF @in_estatus  <> -1 
          SET @condiciones=@condiciones + ' and in_estatus = @in_estatus'
         
        
 DECLARE @Query1 nvarchar(4000)
 SET @Query1=N'
 SELECT *,
   tp.tipo_programacion,	
   dbo.FN_ObtenerSubMateria(i.inspeccion_id, 1) as submateria,
   CONVERT(Varchar(10),in_fec_emision,103) fec_emision,
   (SELECT TOP(1)fd_fundamento FROM dbo.inspec_participante, dbo.fundamento_designacion 
			WHERE fundamento_designacion_id = ipar_tipo_participacion AND inspeccion_id = i.inspeccion_id) AS fd_fundamento, i.colectivo_id as id_colectivo
  FROM dbo.inspeccion i  
  INNER JOIN dbo.subtipo_inspeccion si ON si.subtipo_inspeccion_id = i.subtipo_inspeccion_id  
  INNER JOIN dbo.tipo_inspeccion ti ON ti.tipo_inspeccion_id = si.tipo_inspeccion_id  
  INNER JOIN dbo.tipo_programacion tp ON tp.tipo_programacion_id = i.in_tipo_programacion_id 
  LEFT JOIN dbo.materia m ON m.materia_id = i.materia_id  
  LEFT JOIN dbo.cat_unidad_respon cur on cur.cur_cve_ur = i.cve_ur
  LEFT JOIN dbo.motivo_inspeccion mi ON	mi.motivo_inspeccion_id = i.motivo_inspeccion_id
  WHERE 1=1'+ @condiciones;
  
  set @condiciones2 =N''

       
         IF @inspeccion_id  <> -1
         SET @condiciones2=@condiciones2 + ' AND inspeccion_id = @inspeccion_id'  
         IF @mes_id  <> -1 
          SET @condiciones2=@condiciones2 + ' and mes_id = @mes_id'
        IF @cve_ur  <> -1
         SET @condiciones2=@condiciones2 + ' and i.cve_ur = @cve_ur'
          IF @centro_trabajo_id  <> -1
           SET @condiciones2=@condiciones2 + ' and centro_trabajo_id = @centro_trabajo_id'
         IF @in_anio  <> -1 
          SET @condiciones2=@condiciones2 + ' and in_anio = @in_anio'
          IF @operativo_id    <> -1 
           SET @condiciones2=@condiciones2 + ' and i.operativo_id=@operativo_id'
         IF @tipo_inspeccion_id <>-1
          SET @condiciones2=@condiciones2 + ' and si.tipo_inspeccion_id=@tipo_inspeccion_id'
         IF @in_tipo_programacion_id  <> -1 
          SET @condiciones2=@condiciones2 + ' and i.in_tipo_programacion_id = @in_tipo_programacion_id'
         IF @in_aplica_especial  <>-1 
          SET @condiciones2=@condiciones2 + ' and i.in_aplica_especial = @in_aplica_especial'
  
  DECLARE @Query2 nvarchar(4000)
 SET @Query2=N'  
 SELECT *,
 tp.tipo_programacion,	
 dbo.FN_ObtenerSubMateria(i.inspeccion_id, 1) as submateria,
 (SELECT TOP(1)fd_fundamento FROM dbo.inspec_participante, dbo.fundamento_designacion 
			WHERE fundamento_designacion_id = ipar_tipo_participacion AND inspeccion_id = i.inspeccion_id) AS fd_fundamento, i.colectivo_id as id_colectivo
  FROM dbo.inspeccion i  
  INNER JOIN dbo.subtipo_inspeccion si ON si.subtipo_inspeccion_id = i.subtipo_inspeccion_id  
  INNER JOIN dbo.tipo_inspeccion ti ON ti.tipo_inspeccion_id = si.tipo_inspeccion_id  
  INNER JOIN dbo.tipo_programacion tp ON tp.tipo_programacion_id = i.in_tipo_programacion_id 
  LEFT JOIN dbo.materia m ON m.materia_id = i.materia_id  
  LEFT JOIN dbo.motivo_inspeccion mi ON	mi.motivo_inspeccion_id = i.motivo_inspeccion_id
     WHERE in_estatus <> 2 ' + @condiciones2+' ORDER BY in_num_expediente' 
   
    exec sp_executesql @query1, N'@inspeccion_id int ,@mes_id int, @cve_ur int, @centro_trabajo_id int , @in_anio int ,  @operativo_id   int , @tipo_inspeccion_id int, @in_tipo_programacion_id int, @in_aplica_especial int  , @in_estatus int  ',@inspeccion_id  ,@mes_id , @cve_ur , @centro_trabajo_id  , @in_anio  ,  @operativo_id    , @tipo_inspeccion_id , @in_tipo_programacion_id , @in_aplica_especial  , @in_estatus 
    exec sp_executesql @query2, N'@inspeccion_id int ,@mes_id int, @cve_ur int, @centro_trabajo_id int , @in_anio int ,  @operativo_id   int , @tipo_inspeccion_id int, @in_tipo_programacion_id int, @in_aplica_especial int  ',@inspeccion_id  ,@mes_id , @cve_ur , @centro_trabajo_id  , @in_anio  ,  @operativo_id    , @tipo_inspeccion_id , @in_tipo_programacion_id , @in_aplica_especial  

	print  @query1

	print  @query2

END  
  
  
  
  
  
  
  

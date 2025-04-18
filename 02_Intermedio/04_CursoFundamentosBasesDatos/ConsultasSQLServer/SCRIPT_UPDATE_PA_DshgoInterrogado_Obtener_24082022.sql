USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_DshgoInterrogado_Obtener]    Script Date: 24/08/2022 02:04:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  gabriel  
-- Create date: 27/02/2012  
-- Description: <Description,,>  
-- =============================================  
ALTER PROCEDURE [dbo].[PA_DshgoInterrogado_Obtener]--1,-1,4  
 -- Add the parameters for the stored procedure here  
 @dshgo_participante_id int =-1,  
 @dshgo_interrogado_id int = -1,  
 @desahogo_id int = -1  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
   
declare @condiciones nvarchar(1000)
set @condiciones =N''
	IF @dshgo_participante_id <>-1
		SET @condiciones=@condiciones+ ' and dp.dshgo_participante_id =@dshgo_participante_id'
	if @desahogo_id <>-1
		set @condiciones=@condiciones+' and d.desahogo_id = @desahogo_id '
   IF @dshgo_interrogado_id <>- 1
        set @condiciones=@condiciones + ' and di.dshgo_interrogado_id = @dshgo_interrogado_id'
   


declare @query1 nvarchar(4000)
	set @query1= N'SELECT   
 ROW_NUMBER() OVER(ORDER BY di.dshgo_interrogado_id) as id,  
 d.desahogo_id,  
 d.inspeccion_id,  
 di.dshgo_interrogado_id,  
 di.dshgo_participante_id,  
 di.dint_domicilio_notificaciones,  
 di.dint_mismo_domicilio,  
 ti.tidef_identificacion,  
 CASE di.tipo_identificacion_id WHEN 6 then ''No aplica''  
 ELSE di.dint_num_identificacion END as num_identificacion,  
 di.dint_num_identificacion,  
 ti.tidef_expedida_por,  
 di.tipo_identificacion_id,  
 dp.dpart_nombre,  
 dp.dpart_puesto,  
 d.dshgo_no_interrogatorios,  
 dbo.FN_ConcatenarPreguntasyRespuestas(di.dshgo_interrogado_id) as preguntas,  
 dbo.FN_validaPreguntasObligatorias(di.dshgo_interrogado_id, 2) as valPregunta,  
    
 CASE dint_mismo_domicilio  
  WHEN 1 THEN ''EL MISMO EN EL QUE SE ACTÚA''  
  ELSE dint_domicilio_notificaciones END domicilio_notificaciones  
from    
 dshgo_interrogado di left join dshgo_participante dp   
  on di.dshgo_participante_id= dp.dshgo_participante_id   
 left join desahogo d on d.desahogo_id= dp.desahogo_id  
 left join tipo_identificacion ti on di.tipo_identificacion_id= ti.tipo_identificacion_id  
WHERE  1=1'+@condiciones;
 
 
 
exec sp_executesql @query1, N'@dshgo_participante_id int,@dshgo_interrogado_id int,@desahogo_id int',@dshgo_participante_id,@dshgo_interrogado_id,@desahogo_id
 
END

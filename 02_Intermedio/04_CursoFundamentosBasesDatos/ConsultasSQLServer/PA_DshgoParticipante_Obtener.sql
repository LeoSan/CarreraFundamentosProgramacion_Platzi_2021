USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_DshgoParticipante_Obtener]    Script Date: 11/04/2023 01:34:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David
-- Create date: 24/2/2012
-- Description:	
-- modificado por:Leonardo Atilano Ponce
-- Fecha de modificación: 21/08/2014
-- =============================================
ALTER PROCEDURE [dbo].[PA_DshgoParticipante_Obtener] --1,240987,-1
	@dshgo_participante_id	int	= -1,
	@desahogo_id		int = -1,
	@dpart_tipo_participante int =-1
	
AS
BEGIN
	SET NOCOUNT ON;
	declare @str_parametros varchar(1000)
	set @str_parametros = 'exec PA_DshgoParticipante_Obtener '

	set @str_parametros = @str_parametros + '. @dshgo_participante_id	= ' + isnull(ltrim(rtrim(CONVERT(varchar(100),@dshgo_participante_id))),'Null')
	set @str_parametros = @str_parametros + '. @desahogo_id				= ' + isnull(ltrim(rtrim(CONVERT(varchar(100),@desahogo_id))),'Null')	
	set @str_parametros = @str_parametros + '. @dpart_tipo_participante	= ' + isnull(ltrim(rtrim(CONVERT(varchar(100),@dpart_tipo_participante))),'Null')		
	
	--insert into bitacora_debug (fecha,cadena) values (GETDATE(),@str_pvachar arametros)	
declare @condiciones nvarchar(1000)
set @condiciones =N''
	IF @dshgo_participante_id <>-1
		SET @condiciones=@condiciones+ ' and dshgo_participante_id =@dshgo_participante_id'
	if @desahogo_id <>-1
		set @condiciones=@condiciones+' and desahogo_id = @desahogo_id '		
	
declare @query1 nvarchar(4000)
	set @query1= N'	SELECT *,RANK() OVER (ORDER BY dshgo_participante_id) as id,
		ISNULL(dpart_nombre, '''') + '' '' + 
		CASE dpart_tipo_participante
			WHEN 1 THEN ''Inspector''
			WHEN 2 THEN ''Testigo''
			WHEN 3 THEN ''Interrogado''
			WHEN 4 THEN ''Comisión''
			WHEN 5 THEN ''Representante de los trabajadores''
			WHEN 6 THEN ''Representante de la empresa''
			WHEN 7 THEN ''Experto'' ELSE '''' END nombreParticipante
	FROM dbo.dshgo_participante 
	WHERE 1=1'
	 
	/*IF @dshgo_participante_id <>-1
		SET @query1=@query1+ ' and dshgo_participante_id =@dshgo_participante_id'
	if @desahogo_id <>-1
		set @query1=@query1+' and desahogo_id = @desahogo_id '*/
		
	set @query1 = @query1 + @condiciones	
	
	exec sp_executesql @query1, N'@dshgo_participante_id int,@desahogo_id int',@dshgo_participante_id	,@desahogo_id
		
declare @query2 nvarchar(4000)
	set @query2=N'	SELECT *,
		RANK() OVER (ORDER BY dshgo_participante_id) as id,
		ISNULL(dpart_nombre, '''') + '' '' + 
		CASE dpart_tipo_participante
			WHEN 1 THEN ''Inspector''
			WHEN 2 THEN ''Testigo''
			WHEN 3 THEN ''Interrogado''
			WHEN 4 THEN ''Comisión''
			WHEN 5 THEN ''Representante de los trabajadores''
			WHEN 6 THEN ''Representante de la empresa''
			WHEN 7 THEN ''Experto'' ELSE '''' END nombreParticipante,
		CASE dpart_manifestacion
			WHEN 1 THEN ''Se reserva derechos''
			WHEN 2 THEN ''Nada que agregar''
			WHEN 3 THEN dpart_manifestacion_indicado ELSE '''' END manifestacion,
		CASE dpart_firma
			WHEN 1 THEN ''Sí''
			WHEN 0 THEN ''No'' END firma,
		CASE dpart_firma
			WHEN 1 THEN ''NO APLICA''
			WHEN 0 THEN motnof_motivo END motivo_no_firma
	FROM dbo.dshgo_participante dp
	LEFT JOIN dbo.motivo_no_firma mnf ON mnf.motivo_no_firma_id = dp.motivo_no_firma_id 
	WHERE dpart_firma IS NOT NULL '
	/*IF @dshgo_participante_id <>-1
		SET @query2=@query2+ ' and dshgo_participante_id =@dshgo_participante_id'
	if @desahogo_id <>-1
		set @query2=@query2+' and desahogo_id = @desahogo_id '*/
		
	set @query2 = @query2 + @condiciones	
	
	exec sp_executesql @query2 , N'@dshgo_participante_id int,@desahogo_id int',@dshgo_participante_id	,@desahogo_id
	
		--por tipo
		
	declare @Query3 nvarchar(4000)	
	set @Query3=N' SELECT 
		RANK() OVER (ORDER BY dshgo_participante_id) as id,
		ISNULL(dpart_nombre, '''') dpart_nombre,
		dp.dshgo_participante_id as participante_id,
		
		CASE dpart_tipo_participante
			WHEN 1 THEN ''Inspector(es)''
			WHEN 4 THEN (
						SELECT top 1 case dc.dcom_parte_representa when 1 then ''POR PARTE DE LA EMPRESA DE LA COMISIÓN''  when 2 then ''POR PARTE DE LOS TRABAJADORES DE LA COMISIÓN'' ELSE '''' END
						from dshgo_comision dc where dc.dshgo_participante_id = dp.dshgo_participante_id)
			WHEN 5 THEN (select top 1 trep_tipo_representante from 
							tipo_representante tr 
							inner join dshgo_rep_trabajadores drt on drt.tipo_representante_id = tr.tipo_representante_id 
							and drt.dshgo_participante_id = dp.dshgo_participante_id)
			WHEN 6 THEN (select top 1 trep_tipo_representante from 
							tipo_representante tr 
							inner join dshgo_rep_empresa dre on dre.tipo_representante_id = tr.tipo_representante_id 
								and dre.dshgo_participante_id = dp.dshgo_participante_id)
			WHEN 7 THEN ''Experto(s)'' ELSE '''' END tipo_participante,
		CASE dpart_tipo_participante
		    WHEN 7 THEN (select top 1 code_participante from dbo.inspec_experto where inspec_experto_id = (select top 1 inspec_experto_id from dbo.dshgo_experto where dshgo_participante_id = dp.dshgo_participante_id)) ELSE '''' END tipo_experto,
		CASE dpart_manifestacion
			WHEN 1 THEN ''Se reserva su derecho para hacerlo valer en el momento oportuno''
			WHEN 2 THEN ''No tiene nada que agregar''
			WHEN 3 THEN dpart_manifestacion_indicado ELSE '''' END  manifestacion,
		CASE dpart_firma
			WHEN 1 THEN ''Sí''
			WHEN 0 THEN ''No, '' END firma,
			dpart_firma,
		case dpart_firma
			WHEN 0 THEN	(select top 1 motnof_motivo from motivo_no_firma mnf where mnf.motivo_no_firma_id=dp.motivo_no_firma_id) 
			ELSE '''' END no_firma,
			
		CASE dpart_manifestacion
			WHEN 1 THEN ''Se reserva su derecho para hacerlo valer en el momento oportuno''
			WHEN 2 THEN ''No tiene nada que agregar''
			WHEN 3 THEN dpart_manifestacion_indicado ELSE '''' END  manifestacion,
		CASE motivo_no_firma_id
			WHEN 4 THEN dpart_otro_motivo_no_firma
			ELSE '''' END otro_no_firma
			
	FROM dbo.dshgo_participante dp
	WHERE   dpart_firma IS NOT NULL'
	/*
	IF @dshgo_participante_id <>-1
		SET @Query3=@Query3+ ' and dshgo_participante_id =@dshgo_participante_id'
	if @desahogo_id <>-1
		set @Query3=@Query3+' and desahogo_id = @desahogo_id '	*/	
		
	set @query3 = @query3 + @condiciones
	
	
	if @dpart_tipo_participante<>-1
		set @Query3=@Query3+' and dpart_tipo_participante=@dpart_tipo_participante '	
	
		exec sp_executesql @query3, N'@dshgo_participante_id int,@desahogo_id int,@dpart_tipo_participante int',@dshgo_participante_id	,@desahogo_id,@dpart_tipo_participante 
		
	declare @Query4 nvarchar(4000)
	--los que no son Inspectores y expertos
	set @Query4=N' SELECT 
		RANK() OVER (ORDER BY dshgo_participante_id) as id,
		ISNULL(dpart_nombre, '''') dpart_nombre,
			
		''El '' +
		CASE dpart_tipo_participante
			WHEN 1 THEN ''Inspector''
			WHEN 2 THEN ''Testigo''
			WHEN 3 THEN ''Interrogado''
			WHEN 4 THEN ''Comisión''
			WHEN 5 THEN ''Representante de los trabajadores''
			WHEN 6 THEN ''Representante de la empresa''
			WHEN 7 THEN ''Experto'' ELSE '''' END +
			'', en uso de la palabra manifiesta:''
			 tipo_participante,
		CASE dpart_manifestacion
			WHEN 1 THEN ''Se reserva su derecho para hacerlo valer en el momento oportuno''
			WHEN 2 THEN ''No tiene nada que agregar''
			WHEN 3 THEN dpart_manifestacion_indicado ELSE '''' END  manifestacion,
		CASE dpart_firma
			WHEN 1 THEN ''Sí''
			WHEN 0 THEN ''No'' END firma,
		case dpart_firma
			WHEN 0 THEN	(select top 1 motnof_motivo from motivo_no_firma mnf where mnf.motivo_no_firma_id=motivo_no_firma_id) 
			ELSE '''' END no_firma,
		CASE dp.motivo_no_firma_id
			WHEN 4 THEN dp.dpart_otro_motivo_no_firma
			ELSE '''' END otro_no_firma
		
	FROM dbo.dshgo_participante dp
	WHERE (dpart_tipo_participante>1 AND dpart_tipo_participante<7) 
	AND dpart_firma IS NOT NULL	'
	
	/*IF @dshgo_participante_id <>-1
		SET @query4=@query4+ ' and dshgo_participante_id =@dshgo_participante_id'
	if @desahogo_id <>-1
		set @query4=@query4+' and desahogo_id = @desahogo_id '*/
		
	set @query4 = @query4 + @condiciones			
	set @query4=@query4+'	ORDER BY dpart_tipo_participante'
	--select @query4
	print @query3;
	exec sp_executesql @query4, N'@dshgo_participante_id int,@desahogo_id int',@dshgo_participante_id	,@desahogo_id  
	
END















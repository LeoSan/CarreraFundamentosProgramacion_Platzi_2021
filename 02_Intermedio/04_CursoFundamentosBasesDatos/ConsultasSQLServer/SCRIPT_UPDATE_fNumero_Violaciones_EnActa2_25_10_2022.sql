USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  UserDefinedFunction [dbo].[fNumero_Violaciones_EnActa2]    Script Date: 25/10/2022 11:30:37 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fNumero_Violaciones_EnActa2] (@inspeccion_id int, @materia_id int)
RETURNS int
AS
BEGIN

/** Declaración de variables  **/
DECLARE @num_violaciones_CGT int
DECLARE @num_violaciones_SH int
DECLARE @acronomo CHAR(8)
SET @num_violaciones_CGT =0
SET @num_violaciones_SH =0

/** Asigno Variables   **/
SELECT @acronomo=m.mat_acronimo FROM dbo.materia m WHERE m.materia_id = @materia_id

if @acronomo <> 'SH' 
begin 
	select @num_violaciones_CGT=COUNT(*) 
		from dshgo_revision dr, indicador i, ind_medida im, dshgo_alcance da, desahogo d, inspeccion ip
			where 
				ip.inspeccion_id=@inspeccion_id and dr.dshgo_alcance_id=da.dshgo_alcance_id and da.desahogo_id=d.desahogo_id and d.inspeccion_id=ip.inspeccion_id
				and dr.indicador_id=i.indicador_id and i.indicador_id=im.indicador_id
				and ind_conduce_medida=1 and im.imed_respuesta=dr.drev_respuesta
				and ip.materia_id<>2
end
else 
--if @materia_id =2 
begin 

	select @num_violaciones_SH=COUNT(*) from inspeccion ip, desahogo d, dshgo_alcance da, dshgo_revision dr , ind_medida im
	where ip.inspeccion_id=@inspeccion_id and dr.dshgo_alcance_id=da.dshgo_alcance_id and dr.drev_respuesta=2
	and da.desahogo_id=d.desahogo_id and d.inspeccion_id=ip.inspeccion_id 
	and dr.indicador_id=im.indicador_id and im.imed_tipo_incumplimiento=3
	and ((dr.ind_inciso_id is null) or (dr.ind_inciso_id is not null and dr.ind_inciso_id=im.ind_inciso_id))
    and ip.materia_id=2  
end 
	RETURN @num_violaciones_CGT+ @num_violaciones_SH
END

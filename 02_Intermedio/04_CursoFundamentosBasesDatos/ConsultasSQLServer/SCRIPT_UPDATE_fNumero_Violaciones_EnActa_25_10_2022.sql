USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  UserDefinedFunction [dbo].[fNumero_Violaciones_EnActa]    Script Date: 25/10/2022 11:49:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fNumero_Violaciones_EnActa] (@inspeccion_id int)
RETURNS int
AS
BEGIN
/** Declaración de variables  **/
DECLARE @num_violaciones_CGT int
DECLARE @num_violaciones_SH int
DECLARE @acronomo  CHAR(8)
declare @materia_id int
set @num_violaciones_CGT =0
set @num_violaciones_SH =0

/** Asigno Variables   **/
select @materia_id=materia_id from inspeccion where inspeccion_id=@inspeccion_id;
SELECT @acronomo=materia_id FROM dbo.materia m WHERE m.materia_id = @materia_id

if @acronomo <> 'SH'  
begin 
	select @num_violaciones_CGT=COUNT(*) 
		from dshgo_revision dr, indicador i, ind_medida im, dshgo_alcance da, desahogo d, inspeccion ip
			where 
				ip.inspeccion_id=@inspeccion_id and dr.dshgo_alcance_id=da.dshgo_alcance_id and da.desahogo_id=d.desahogo_id and d.inspeccion_id=ip.inspeccion_id
				and dr.indicador_id=i.indicador_id and i.indicador_id=im.indicador_id
				and ind_conduce_medida=1 and im.imed_respuesta=dr.drev_respuesta
--				and ip.materia_id<>2
end
else 
if @acronomo = 'SH' 
begin 
	select @num_violaciones_SH=COUNT(*) from desahogo d, dshgo_alcance da, dshgo_revision dr 
	LEFT JOIN ind_medida im_ind ON dr.indicador_id=im_ind.indicador_id and dr.ind_inciso_id is null
	LEFT JOIN ind_medida im_inc ON dr.indicador_id=im_inc.indicador_id and dr.ind_inciso_id=im_inc.ind_inciso_id
	where d.inspeccion_id=@inspeccion_id and dr.dshgo_alcance_id=da.dshgo_alcance_id and dr.drev_respuesta=2
	and da.desahogo_id=d.desahogo_id 
	and (im_ind.imed_tipo_incumplimiento=3 or im_inc.imed_tipo_incumplimiento=3)
end 

	RETURN @num_violaciones_CGT+ @num_violaciones_SH
END

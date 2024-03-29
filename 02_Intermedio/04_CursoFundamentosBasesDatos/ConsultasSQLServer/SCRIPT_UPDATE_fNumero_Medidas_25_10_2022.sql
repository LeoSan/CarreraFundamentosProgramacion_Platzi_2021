USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  UserDefinedFunction [dbo].[fNumero_Medidas]    Script Date: 25/10/2022 11:11:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fNumero_Medidas] (@inspeccion_id int)
RETURNS int
AS
BEGIN
/** Declaración de variables  **/
DECLARE @desahogo_id AS INT
DECLARE @materia_id AS INT
DECLARE @acronomo CHAR(8)
DECLARE @num_medidas int
SET @num_medidas=0


/** Asigno Variables   **/
SELECT @desahogo_id=d.desahogo_id from desahogo d , inspeccion i where d.inspeccion_id=i.inspeccion_id and i.inspeccion_id=@inspeccion_id
SELECT @materia_id=materia_id from inspeccion i where i.inspeccion_id=@inspeccion_id
SELECT @acronomo=m.mat_acronimo FROM dbo.materia m WHERE m.materia_id = @materia_id


if (@acronomo = 'SH' OR @acronomo='RSPC') 		
	BEGIN
		select @num_medidas=(select count(*) from dshgo_medida dm, ind_medida im 
		where dm.desahogo_id=@desahogo_id and dm.ind_medida_id=im.ind_medida_id)
		+ (select count(*) from dshgo_med_descatalogada where desahogo_id=@desahogo_id)
		+ (select count(*) from dshgo_revision dr, ind_inciso inc, ind_medida im where dr.drev_respuesta=2 and inc.ind_inciso_id=im.ind_inciso_id and dr.ind_inciso_id=inc.ind_inciso_id 
				and dr.dshgo_alcance_id in (select da.dshgo_alcance_id from dshgo_alcance da where desahogo_id=@desahogo_id AND (da.dsal_no_aplica = 0 OR da.dsal_no_aplica IS NULL))
			) 
	END
	RETURN @num_medidas
END


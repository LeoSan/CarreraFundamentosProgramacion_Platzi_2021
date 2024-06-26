USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SExpediente_Asignacion_Consultar]    Script Date: 01/09/2022 07:13:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		gabriel c
-- Create date: 25/10/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_SExpediente_Asignacion_Consultar] 
	-- Add the parameters for the stored procedure here
	@s_expediente_id int = null,
	@se_num_expediente varchar(40) = null, 
	@se_ct_nombre varchar(MAX) = null,
	@se_ct_rfc varchar(14) =null,
	@in_num_expediente varchar(50) =null,
	@se_estatus tinyint =null,
	@s_etapa_2_id smallint = null,
	@s_participante_id int = null,
	@cdoc_num_documento varchar(40) = null,
	@fecha1 datetime = null,
	@fecha2 datetime =null,
	@cve_ur int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET DATEFIRST 7;
	DECLARE @fec_actual datetime = GETDATE();
    -- Insert statements for procedure here
	
	
	
	 WITH  UltimaEtapa as (
			SELECT MAX (s_expediente_etapa_id) ultimaEtapa_id, s_expediente_id as expediente_id from dbo.s_expediente_etapa where see_estatus = 2 GROUP BY s_expediente_id
				)
				
select 

	ex.cve_ur,
	ex.s_expediente_id,
	exet.s_expediente_etapa_id,
	exet.s_etapa_id,
	ex.se_num_expediente,
	ex.se_ct_razon_social as se_ct_nombre,
	ex.se_ct_domicilio,
	ex.se_ct_rfc,
	ins.in_num_expediente,
	ex.se_estatus,
	exet.responsable_atencion_id as responsable,
	par.s_participante_id,
	se_fec_recepcion,
	(select setapa_nombre from s_etapa se where se.s_etapa_id= exet.s_etapa_id) as paso,
	--CONVERT(varchar(10),isnull(exet.sys_fec_update, exet.sys_fec_insert),103) 
	CONVERT(varchar,exet.see_fec_documento,103) as fecha,
	
	case exet.s_etapa_id 
		when 1 then dbo.FN_SUsuario_ObtenerNombrePorLogin(exet.sys_usr_insert)
		else dbo.FN_SUsuario_ObtenerNombrePorLogin(exet.sys_usr_update)
	end 
	 as dictaminador,
	 case exet.s_etapa_id 
		when 1 then 
			CONVERT(
				VARCHAR,
				dbo.FN_EtapaObtenerFechaVencimiento(
						(select top 1 see_plazo from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.s_etapa_id=2),
						1,
						exet.see_fec_inicio
				),
				103
			)
		else
			CONVERT(
				VARCHAR,
				dbo.FN_EtapaObtenerFechaVencimiento(
					(select top 1 seet.see_plazo from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1),
					(select top 1 seet.see_plazo_tipo_dias from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1),
					(select top 1 seet.see_fec_inicio from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1)),
				103) 
	end
	 fec_vencimiento,
	ex.*, exet.*,
	cald.cdoc_num_documento,
	CASE exet.s_etapa_id WHEN 1 THEN
		--CASE WHEN see_semaforo IS NULL THEN
			CASE 
				WHEN dbo.FN_EtapaObtenerDiasEnVencimiento(
							dbo.FN_EtapaObtenerFechaVencimiento(
									(select top 1 see_plazo from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.s_etapa_id=2),
									1,
									exet.see_fec_inicio
							),
							(select top 1 seet.see_fec_inicio from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1),
							(select top 1 seet.see_plazo_tipo_dias from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1)
					) <  0 THEN 3 --rojo
				WHEN dbo.FN_EtapaObtenerDiasEnVencimiento(
							dbo.FN_EtapaObtenerFechaVencimiento(
									(select top 1 see_plazo from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.s_etapa_id=2),
									1,
									exet.see_fec_inicio
							),
							(select top 1 seet.see_fec_inicio from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1),
							(select top 1 seet.see_plazo_tipo_dias from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1))
					<= 1 THEN 2 --amarillo
				ELSE 1 --verde
			--END
			--ELSE see_semaforo
		END
	ELSE
		--CASE WHEN see_semaforo IS NULL THEN
			CASE 
				WHEN dbo.FN_EtapaObtenerDiasEnVencimiento(dbo.FN_EtapaObtenerFechaVencimiento((select top 1 seet.see_plazo from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1),(select top 1 seet.see_plazo_tipo_dias from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1), (select top 1 seet.see_fec_inicio from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1)) ,(select top 1 seet.see_fec_inicio from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1),(select top 1 seet.see_plazo_tipo_dias from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1)) <  0 THEN 3 --rojo
				WHEN dbo.FN_EtapaObtenerDiasEnVencimiento(dbo.FN_EtapaObtenerFechaVencimiento((select top 1 seet.see_plazo from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1),(select top 1 seet.see_plazo_tipo_dias from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1), (select top 1 seet.see_fec_inicio from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1)) ,(select top 1 seet.see_fec_inicio from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1),(select top 1 seet.see_plazo_tipo_dias from s_expediente_etapa seet where seet.s_expediente_id= exet.s_expediente_id and seet.see_estatus=1)) <= 1 THEN 2 --amarillo
				ELSE 1 --verde
			--END
			--ELSE see_semaforo
		END
	END semaforo -- select *  
from 
	s_expediente ex inner join s_expediente_etapa exet 
			on ex.s_expediente_id = exet.s_expediente_id
		INNER JOIN	UltimaEtapa
		ON ultimaEtapa_id = s_expediente_etapa_id AND expediente_id = exet.s_expediente_id
		left join s_participante par 
			on exet.responsable_atencion_id= par.s_participante_id 
		left join s_etapa et 
			on exet.s_etapa_id = et.s_etapa_id
		left join inspeccion ins 
			on ins.inspeccion_id= ex.inspeccion_id
		left join desahogo d
			on d.inspeccion_id= ins.inspeccion_id
		left join calificacion cal 
			on cal.desahogo_id= d.desahogo_id
		left join calif_documento cald
			on cald.calificacion_id = cal.calificacion_id
		--left join dbo.s_etapa_plazo  sep
		--	on et.s_etapa_id = sep.s_etapa_1_id
WHERE
--(exet.see_estatus=2) AND
(ex.s_expediente_id= @s_expediente_id or @s_expediente_id is null) AND
(se_num_expediente= @se_num_expediente or @se_num_expediente is null) AND
(cald.tipo_documento_id =14 or cald.tipo_documento_id = 15) AND
(se_ct_razon_social like '%'+ @se_ct_nombre +'%' or @se_ct_nombre is null) AND
(se_ct_rfc = @se_ct_rfc or @se_ct_rfc is null) AND
(in_num_expediente = @in_num_expediente or @in_num_expediente is null) AND
(
	(
		Exists(Select 1 from s_expediente_etapa see1 where see1.see_estatus=1 and see1.s_expediente_id=exet.s_expediente_id and see1.responsable_atencion_id is not null and @se_estatus=1)
	or 
		Exists(Select 1 from s_expediente_etapa see2 where see2.see_estatus=1 and see2.s_expediente_id=exet.s_expediente_id  and see2.responsable_atencion_id is null and @se_estatus=0) 
	)  
	or @se_estatus is null
) AND
--(s_etapa_2_id = @s_etapa_2_id or @s_etapa_2_id is null) AND

(exet.s_etapa_id= @s_etapa_2_id OR @s_etapa_2_id is null) AND

(cdoc_num_documento = @cdoc_num_documento or @cdoc_num_documento is null) AND
(s_participante_id = @s_participante_id or @s_participante_id is null) AND
(se_fec_recepcion between @fecha1 and @fecha2 or @fecha1 is null) 
AND
(ex.cve_ur= @cve_ur or @cve_ur is null)
Order by  ex.s_expediente_id asc, exet.s_expediente_etapa_id desc ,exet.s_etapa_id Desc--
END

USE [SSI_DB_SIAPI_REFESSATV2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		lcuenca
-- Create date: 2022-04-28
-- Description:	
-- =============================================

CREATE PROCEDURE [dbo].[PA_Listado_Impugnaciones] 
	@cen_cve_edorep int = -1,
	@cur_cve_ur		int = -1,
	@s_participante_id	int = -1,
	@fec_inicio		datetime = null,
	@fec_final		datetime = null,
	@tipo_parametro varchar(50) = null,
	@tipo_inpugnacion varchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @SQLString NVARCHAR(500);  
	
	SELECT 
		 se.se_num_expediente 
		, se.inspeccion_id
		, se.s_expediente_id
		, CONVERT(VARCHAR(30),se.se_fec_recepcion,103) as se_fec_recepcion
		, se.se_ct_razon_social		
		, edo.cen_descripcion
		,simpug_tipo_impugnacion
		,count(
			case when see_estatus = 2 then 
				case simpug_sentido
					when 'Confirma' then s_impugnacion_id
					when 'Validez' then s_impugnacion_id
					when 'Se otorga' then s_impugnacion_id
				end
			end
		) as favor
		,count(
			case when see_estatus = 2 then 
				case simpug_sentido
					when 'Revoca' then s_impugnacion_id
					when 'Nulidad lisa y llana' then s_impugnacion_id
					when 'Se niega' then s_impugnacion_id
				end
			end
		) as contra
		
		, count(
			case when see_estatus = 2 then 
				case simpug_sentido
					when 'Revoca para efectos' then s_impugnacion_id
					when 'Nulidad para efectos' then s_impugnacion_id
					when 'Para efectos' then s_impugnacion_id
				end
			end
		) as efectos
		, count(case see_estatus when 1 then s_impugnacion_id end) as proceso
		INTO #resultado
	FROM
		dbo.cat_entidades edo
		inner join dbo.cat_unidad_respon ur on ur.cur_cve_edorep = edo.cen_cve_edorep
		inner join dbo.s_expediente se on se.cve_ur = ur.cur_cve_ur
		inner join dbo.s_expediente_etapa see on see.s_expediente_id = se.s_expediente_id and see.s_etapa_id in (10,11,12)
		inner join dbo.s_impugnacion si on si.s_expediente_etapa_id = see.s_expediente_etapa_id
	WHERE (ur.cur_cve_ur = @cur_cve_ur or @cur_cve_ur = -1)
		and (see.responsable_atencion_id = @s_participante_id or @s_participante_id = -1)
		and (see_fec_inicio >= @fec_inicio or @fec_inicio is null)
		and (see_fec_inicio <= @fec_final or @fec_final is null)
	GROUP BY cen_cve_edorep, simpug_tipo_impugnacion, se.se_num_expediente, se.inspeccion_id, se.se_fec_recepcion,se.se_ct_razon_social, edo.cen_descripcion,se.s_expediente_id; 

	SET @SQLString = N'SELECT 
		 r.se_num_expediente 
		,r.se_fec_recepcion
		,r.se_ct_razon_social
		,r.cen_descripcion
		,r.s_expediente_id
		,r.inspeccion_id
		from #resultado r
		WHERE '+ @tipo_parametro +' AND simpug_tipo_impugnacion = '+@tipo_inpugnacion;  

	--@tipo_inpugnacion = 1 - 2 - 3 - 4
	print  @SQLString;

	EXECUTE sp_executesql @SQLString;
	  
END














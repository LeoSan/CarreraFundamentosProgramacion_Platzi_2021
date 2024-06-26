USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SControlArchivo_Obtener]    Script Date: 23/06/2022 01:14:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Gabriel
-- Create date: 19/12/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_SControlArchivo_Obtener] --1,'00027','2012','146',2
	-- Add the parameters for the stored procedure here
	@s_control_archivo_id int = -1, 
	@num_exp varchar(75) ='',
	@anio_exp varchar(4) = '',
	@cve_ur varchar(3)='',
	@tipo int =-1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
			se.s_expediente_id,
			se.se_num_expediente,
			se.se_ct_nombre,
			se.se_ct_domicilio,
			mat.mat_materia,
			(
				select setapa_nombre 
				from s_etapa where s_etapa_id = (
													select top 1 s_etapa_id 
													from s_expediente_etapa see 
													where see.s_expediente_id= se.s_expediente_id and see_estatus=2 
													order by s_expediente_etapa_id desc)
			) ultimaEtapa,
			dbo.FN_SParticipante_ObtenerNombreSinPrefijo(sca.s_participante_id) responsable,
			CASE @tipo 
					WHEN 1 THEN 
						'Devolución ' +  case sca.scarch_tipo  
										when 1 then 'Seguimiento' 
										when 2 then 'Consulta' 
									End	
					WHEN 2 THEN 
						'Préstamo '+ case sca.scarch_tipo  
										when 1 then 'Seguimiento' 
										when 2 then 'Consulta' 
									End	
			END	ultimoMovimiento,
			CASE @tipo 
					WHEN 1 THEN 
						sca.scarch_fec_entrega
					WHEN 2 THEN 
						sca.scarch_fec_recibe
			END	ultimoMovimientoFecha,
			CASE @tipo
					WHEN 1 THEN 
						isnull(dbo.FN_SParticipante_ObtenerNombreSinPrefijo(sca.s_entrega_id),sca.scarch_otro_participante)
					WHEN 2 THEN 
						isnull(dbo.FN_SParticipante_ObtenerNombreSinPrefijo(sca.s_recibe_id),sca.scarch_otro_participante)
			END usrUltimo,
			
			CASE 
				WHEN sca.s_control_archivo_id is not null and sca.scarch_fec_entrega Is not null then
					'En archivo'
				WHEN sca.s_control_archivo_id IS not null and sca.scarch_fec_recibe Is not null   then
					'Prestado'
			END estatus,
			
			sca.*
			
		
	FROM 
			s_expediente se 
			left join s_control_archivo sca  on sca.s_expediente_id=se.s_expediente_id
			left join inspeccion i on se.inspeccion_id= i.inspeccion_id
			left join materia mat on i.materia_id= mat.materia_id
	WHERE
		(sca.s_control_archivo_id= @s_control_archivo_id or @s_control_archivo_id= -1) AND
		(se.se_num_expediente like @num_exp or  @num_exp=''  ) AND 
		( YEAR(se.se_fec_recepcion) = @anio_exp or  @anio_exp=''  ) 
	order by 
		sca.sys_fec_insert desc
END













USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_SIncumplimiento_CopiarViolaciones]    Script Date: 26/10/2022 04:12:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Canseco
-- Create date: 01/11/2012
-- Description:	Agregar Actualizar tabla dbo.s_incumplimiento desde las violaciones/medidas de calif_violacion
-- =============================================
ALTER PROCEDURE [dbo].[PA_SIncumplimiento_CopiarViolaciones]
	@s_expediente_id int,
	@sys_usr		 varchar(20)
AS
BEGIN
	SET NOCOUNT ON;
	
	if not exists (select s_incumplimiento_id from dbo.s_incumplimiento where s_expediente_id = @s_expediente_id)	
	begin
		declare @subtipo_inspeccion_id int, @calificacion_id int
		select
			@subtipo_inspeccion_id = subtipo_inspeccion_id,
			@calificacion_id = c.calificacion_id
		from
			dbo.s_expediente se
			inner join dbo.inspeccion i on i.inspeccion_id = se.inspeccion_id
			inner join dbo.desahogo d on d.inspeccion_id = i.inspeccion_id
			inner join dbo.calificacion c on c.desahogo_id = d.desahogo_id
		where s_expediente_id = @s_expediente_id
		
		if @subtipo_inspeccion_id = 3
		begin
			insert into dbo.s_incumplimiento (
				s_expediente_id,
				submateria_id,
				sinc_orden,
				sinc_descripcion,
				sinc_marco,
				sinc_tipo_incumplimiento,
				sys_usr_insert,
				sys_fec_insert,
				ind_medida_id
			)
			select
				@s_expediente_id as s_expediente_id,
				submateria_id,
				ROW_NUMBER() OVER(ORDER BY smat_consecutivo, ind_consecutivo, inc_consecutivo) as orden,
				violacion,
				ind_fundamento,
				tipo_incumplimiento,
				@sys_usr as sys_usr,
				GETDATE() sys_fec,
				ind_medida_id
			from
				(	SELECT
						ind.submateria_id,
						dbo.ObtieneMedidaInfoAdicional(med.imed_medida,dm.dshgo_medida_id) AS violacion,
						case ind.ind_incisos
							when 1 then inc_fundamento
							else ind_fundamento
						end ind_fundamento,
						2 as tipo_incumplimiento,
						med.ind_medida_id,
						smat_consecutivo,
						ind_consecutivo,
						inc_consecutivo
					FROM
						dbo.dshgo_medida			dm
						INNER JOIN dbo.ind_medida	med	ON	dm.ind_medida_id = med.ind_medida_id
						INNER JOIN dbo.indicador	ind	ON	ind.indicador_id = med.indicador_id
						LEFT JOIN dbo.ind_inciso	inc	ON	inc.indicador_id = med.indicador_id
														AND	(	inc.ind_inciso_id = med.ind_inciso_id 
															OR	inc.ind_inciso_id IS NULL
															OR	med.ind_inciso_id IS NULL)
						INNER JOIN dbo.calificacion	ca	ON	ca.desahogo_id = dm.desahogo_id
						LEFT JOIN dbo.submateria	s	ON	ind.submateria_id = s.submateria_id
					WHERE	ca.calificacion_id = @calificacion_id
						AND dm.dmed_cumplimiento_espontaneo = 0
						--AND med.imed_estatus = 1
				UNION ALL
					SELECT
						dm.submateria_id,
						dm.dmd_medida AS violacion,
						dm.dmd_fundamento as ind_fundamento,
						2 as tipo_incumplimiento,
						null as ind_medida_id,
						smat_consecutivo,
						null as ind_consecutivo,
						null as inc_consecutivo
					FROM
						dshgo_med_descatalogada		dm
						INNER JOIN dbo.calificacion	ca	ON	ca.desahogo_id = dm.desahogo_id
						LEFT JOIN submateria		s	ON	dm.submateria_id = s.submateria_id
					WHERE	ca.calificacion_id = @calificacion_id
						AND (dm.dmd_cumplimiento_espontaneo = 0 /*OR dm.dmd_cumplimiento_espontaneo is null*/)
				) as tmp
			order by smat_consecutivo, ind_consecutivo, inc_consecutivo
		end
		else begin
			insert into dbo.s_incumplimiento (
				s_expediente_id,
				submateria_id,
				sinc_orden,
				sinc_descripcion,
				sinc_marco,
				sinc_tipo_incumplimiento,
				sys_usr_insert,
				sys_fec_insert,
				ind_medida_id
			)
			select
				@s_expediente_id as s_expediente_id,
				ind.submateria_id,
				ROW_NUMBER() OVER(ORDER BY sm.smat_consecutivo, ind_consecutivo, inc_consecutivo) as orden,
				ISNULL(
					dbo.ObtieneMedidaInfoAdicionalViolaciones2(imed_medida, dr.dshgo_alcance_id, dr.indicador_id, ISNULL(dr.drev_respuesta, 0)),
					cviol_violacion
				) as violacion,
				ISNULL(
					case ind.ind_incisos
						when 1 then inc_fundamento
						else ind_fundamento
					end,
					case m.mat_acronimo
						when 'CGT' then 'Artículos 132 fracciones I y XXIV de la Ley Federal del Trabajo; y 17 y 18 del Reglamento General para la Inspección y Aplicación de Sanciones por Violaciones a la Legislación Laboral.'
						when 'SH' then 'Artículos 132 fracciones I y XXIV de la Ley Federal del Trabajo; 17 y 18 del Reglamento General para la Inspección y Aplicación de Sanciones por Violaciones a la Legislación Laboral; y 17 fracción VIII del Reglamento Federal de Seguridad, Higiene y Medio Ambiente de Trabajo.'
						when 'CA' then 'Artículos 132 fracciones I y XXIV de la Ley Federal del Trabajo; y 17 y 18 del Reglamento General para la Inspección y Aplicación de Sanciones por Violaciones a la Legislación Laboral.'
						when 'AC' then 'Artículos 132 fracciones I y XXIV de la Ley Federal del Trabajo; 17 y 18 del Reglamento General para la Inspección y Aplicación de Sanciones por Violaciones a la Legislación Laboral; y 9 fracción VII, 19 fracción IV y 31 del Reglamento de Agencias de Colocación de Trabajadores publicado en el Diario Oficial de la Federación (DOF) el 3 de marzo de 2006.'
						when 'RSPC' then 'Artículos 132 fracciones I y XXIV de la Ley Federal del Trabajo; 17 y 18 del Reglamento General para la Inspección y Aplicación de Sanciones por Violaciones a la Legislación Laboral;  17 fracción VIII del Reglamento Federal de Seguridad, Higiene y Medio Ambiente de Trabajo; y punto 5.1 de la Norma Oficial Mexicana NOM-020-STPS-2002, Recipientes sujetos a presión y calderas – Funcionamiento – Condiciones de seguridad, publicada en el Diario Oficial de la Federación el 28 de agosto de 2002.'
						else ''
					end 
				) as ind_fundamento,
				case imed.imed_tipo_incumplimiento
					when 1 then 1
					when 2 then 1
					--when 3 then 2
					else 2
				end tipo_incumplimiento,
				@sys_usr as sys_usr,
				getdate() as sys_fec,
				imed.ind_medida_id
			from
				dbo.s_expediente se
				inner join dbo.inspeccion i on i.inspeccion_id = se.inspeccion_id
				inner join dbo.desahogo d on d.inspeccion_id = i.inspeccion_id
				inner join dbo.calificacion c on c.desahogo_id = d.desahogo_id
				inner join dbo.calif_violacion cv on cv.calificacion_id = c.calificacion_id
				inner join dbo.materia m ON m.materia_id = i.materia_id
				left join dbo.dshgo_revision dr on dr.dshgo_revision_id = cv.dshgo_revision_id
				left join dbo.ind_inciso inc on inc.indicador_id = dr.indicador_id and inc.ind_inciso_id = dr.ind_inciso_id
				left join dbo.indicador ind on ind.indicador_id = dr.indicador_id
				left join dbo.submateria sm on ind.submateria_id = sm.submateria_id
				left join dbo.ind_medida imed on imed.indicador_id = ind.indicador_id
											and (imed.ind_inciso_id = dr.ind_inciso_id or (dr.ind_inciso_id is null and imed.ind_inciso_id is null))
				
			where	cv.cviol_procede = 1
				and s_expediente_id = @s_expediente_id
			order by sm.smat_consecutivo, ind_consecutivo, inc_consecutivo
		end
	end
END













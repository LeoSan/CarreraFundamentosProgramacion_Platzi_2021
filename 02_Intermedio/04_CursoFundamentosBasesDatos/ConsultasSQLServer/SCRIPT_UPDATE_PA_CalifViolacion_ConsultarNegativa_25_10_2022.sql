USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_CalifViolacion_ConsultarNegativa]    Script Date: 25/10/2022 01:09:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ariana Duarte
-- Create date: 12/04/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_CalifViolacion_ConsultarNegativa]
	@calif_violacion_id		int = -1,
    @calificacion_id		int = -1

AS
BEGIN
    SET NOCOUNT ON;

		SELECT 
			'Por no dar el patrón las facilidades necesarias a ' + ISNULL(dbo.FN_ObtenerNombresInspectoresDshgo(d.desahogo_id), '') + ', inspector(es) federal(es) del trabajo, para la práctica de la INSPECCIÓN ' + ISNULL(stins_subtipo, '') + ' EN MATERIA DE ' + ISNULL(UPPER(mat_materia), '') + ' (NEGATIVA PATRONAL) de fecha ' + ISNULL(CONVERT(VARCHAR(10), in_fec_inspeccion, 103), '') + ', en cumplimiento a la orden de inspección con número de expediente ' + ISNULL(in_num_expediente, '') + ', emitida por ' + ISNULL(in_nombre_firmante, '') + ', ' + ISNULL(in_cargo_firmante, '' ) + ' de la ' + ISNULL(LTRIM(RTRIM(ur_nombre)), '') + ' de la Secretaría del Trabajo y Previsión Social, toda vez que ' + ISNULL(dpart_nombre, '') + ', ' + ISNULL(dpart_puesto, '') + ', en su carácter de ' + ISNULL(trep_tipo_representante, '') + ' de la empresa, se manifestó en el sentido de negarse a dar todo tipo de facilidades para el desahogo de la visita de inspección, toda vez que: ' + ISNULL(dshgo_motivo_negativa, '') + '.' as violacion,
			cviol_procede
		FROM dbo.calificacion c
			INNER JOIN dbo.desahogo d ON d.desahogo_id = c.desahogo_id
			INNER JOIN dbo.inspeccion i ON i.inspeccion_id = d.inspeccion_id
			INNER JOIN dbo.subtipo_inspeccion si ON si.subtipo_inspeccion_id = i.subtipo_inspeccion_id
			INNER JOIN dbo.materia m ON m.materia_id = i.materia_id
			INNER JOIN dbo.catalogo_ur ur ON ur.cve_ur = i.cve_ur
			INNER JOIN dbo.dshgo_participante dp ON dp.desahogo_id = d.desahogo_id
			INNER JOIN dbo.dshgo_rep_empresa dre ON dre.dshgo_participante_id = dp.dshgo_participante_id
			INNER JOIN dbo.tipo_representante tr ON tr.tipo_representante_id = dre.tipo_representante_id
			LEFT JOIN dbo.calif_violacion cv on cv.calificacion_id = c.calificacion_id
		WHERE	(c.calificacion_id = @calificacion_id OR @calificacion_id = -1)
			AND (calif_violacion_id = @calif_violacion_id OR @calif_violacion_id = -1)
			AND d.dshgo_tipo_desahogo = 3

		SELECT 
			'Por no dar el patrón las facilidades necesarias a ' + ISNULL(dbo.FN_ObtenerNombresInspectoresDshgo(d.desahogo_id), '') + ', inspector(es) federal(es) del trabajo, para la práctica de la INSPECCIÓN ' + ISNULL(stins_subtipo, '') + ' EN MATERIA DE ' + ISNULL(UPPER(mat_materia), '') + ' (NEGATIVA PATRONAL) de fecha ' + ISNULL(CONVERT(VARCHAR(10), in_fec_inspeccion, 103), '') + ', en cumplimiento a la orden de inspección con número de expediente ' + ISNULL(in_num_expediente, '') + ', emitida por ' + ISNULL(in_nombre_firmante, '') + ', ' + ISNULL(in_cargo_firmante, '' ) + ' de la ' + RTRIM(ISNULL(LTRIM(RTRIM(ur_nombre)), '')) + ' de la Secretaría del Trabajo y Previsión Social, toda vez que ' + ISNULL(dpart_nombre, '') + ', ' + ISNULL(dpart_puesto, '') + ', en su carácter de ' + ISNULL(trep_tipo_representante, '') + ' de la empresa, se manifestó en el sentido de negarse a dar todo tipo de facilidades para el desahogo de la visita de inspección, toda vez que: ' + ISNULL(dshgo_motivo_negativa, '') + '.' as Imed_medida,
			'' Imed_medida,
			CASE m.mat_acronimo
				WHEN 'CGT' THEN 'Artículos 132 fracciones I y XXIV de la Ley Federal del Trabajo; y 29 y 30 del Reglamento General de Inspección del Trabajo y Aplicación de Sanciones.'
				WHEN 'SH' THEN 'Artículos 132 fracciones I y XXIV de la Ley Federal del Trabajo; y 29 y 30 del Reglamento General de Inspección del Trabajo y Aplicación de Sanciones; y 7 fracción XXI del Reglamento Federal de Seguridad y Salud en el Trabajo, publicado en el Diario Oficial de la Federación el 13 de noviembre de 2014.'
				WHEN 'CA' THEN 'Artículos 132 fracciones I y XXIV de la Ley Federal del Trabajo; y 29 y 30 del Reglamento General de Inspección del Trabajo y Aplicación de Sanciones.'
				WHEN 'AC' THEN 'Artículos 132 fracciones I y XXIV de la Ley Federal del Trabajo; y 29 y 30 del Reglamento General de Inspección del Trabajo y Aplicación de Sanciones; y 9 fracción VII, 19 fracción IV, 30, 30 BIS y 31 del Decreto por el que se reforman, adicionan y derogan diversas disposiciones del Reglamento de Agencias de Colocación de Trabajadores publicado en el Diario Oficial de la Federación el 21 de mayo de 2014.'
				WHEN 'RSPC' THEN 'Artículos 132 fracciones I y XXIV de la Ley Federal del Trabajo; y 29 y 30 del Reglamento General de Inspección del Trabajo y Aplicación de Sanciones;  y 7 fracción XXI del Reglamento Federal de Seguridad y Salud en el Trabajo, publicado en el Diario Oficial de la Federación el 13 de noviembre de 2014.'
				ELSE '' END Ind_fundamento,
			cviol_procede
		FROM dbo.calificacion c
			INNER JOIN dbo.desahogo d ON d.desahogo_id = c.desahogo_id
			INNER JOIN dbo.inspeccion i ON i.inspeccion_id = d.inspeccion_id
			INNER JOIN dbo.subtipo_inspeccion si ON si.subtipo_inspeccion_id = i.subtipo_inspeccion_id
			INNER JOIN dbo.materia m ON m.materia_id = i.materia_id
			INNER JOIN dbo.catalogo_ur ur ON ur.cve_ur = i.cve_ur
			INNER JOIN dbo.dshgo_participante dp ON dp.desahogo_id = d.desahogo_id
			INNER JOIN dbo.dshgo_rep_empresa dre ON dre.dshgo_participante_id = dp.dshgo_participante_id
			INNER JOIN dbo.tipo_representante tr ON tr.tipo_representante_id = dre.tipo_representante_id
			LEFT JOIN dbo.calif_violacion cv on cv.calificacion_id = c.calificacion_id
		WHERE	(c.calificacion_id = @calificacion_id OR @calificacion_id = -1)
			AND (calif_violacion_id = @calif_violacion_id OR @calif_violacion_id = -1)
			AND d.dshgo_tipo_desahogo = 3
			AND cviol_procede = 1

END

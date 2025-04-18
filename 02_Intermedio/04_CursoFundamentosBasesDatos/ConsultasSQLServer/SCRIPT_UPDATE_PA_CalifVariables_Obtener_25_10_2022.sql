USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_CalifVariables_Obtener]    Script Date: 25/10/2022 11:59:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ana Karina
-- Create date: 05/04/2012
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_CalifVariables_Obtener] 
	-- Add the parameters for the stored procedure here
	@calif_documento_id	int = -1
AS
BEGIN
	SET NOCOUNT ON;

	select top 1 insp.insp_num_credencial,
	    i.inspeccion_id,
	    --datos del documento
	    calif_documento_id, 
	    doc.tipo_documento_id, 
	    doc.calificacion_id, 
	    doc.participante_id, cdoc_num_documento, cdoc_fec_documento, 
	    cdoc_nombre_documento, cdoc_firma_titular, cdoc_firmante, 
	    cdoc_puesto, cdoc_observaciones, cdoc_url_documento, cdoc_hash,
		--== Datos del Centro ==--
		in_ct_nombre,
		in_ct_razon_social, 
		in_ct_rfc, 
		in_domicilio_inspeccion,
		ct_nombre_comercial,
		--== Datos de la actuacion ==--
		in_fec_inspeccion,
		dbo.FN_ObtenerFechaconLetra( CONVERT(varchar, in_fec_inspeccion, 103)) as fecha_inicio,
		in_num_expediente,
		tins_tipo,
		stins_subtipo,
		mat_materia,
		dbo.FN_ObtenerSubMateria(i.inspeccion_id, -1) as submateria,
		motiv_nombre_corto,
		motiv_pedir_campo_adicional,
		motiv_nombre_dato_adicional,
		in_medio_informacion,
		CONVERT(varchar, in_req_documentos_inicio, 103) in_req_documentos_inicio,
		CONVERT(varchar, in_req_documentos_termino, 103) in_req_documentos_termino,
		
		--== Inspectores asignados ==--
		dbo.FN_ObtenerNombres(i.inspeccion_id, 1, 0) as inspector_nombre,
		(	SELECT TOP(1)fd_fundamento FROM dbo.inspec_participante, dbo.fundamento_designacion 
			WHERE fundamento_designacion_id = ipar_tipo_participacion AND inspeccion_id = i.inspeccion_id) AS fd_fundamento,
		dbo.FN_ObtenerNombres(i.inspeccion_id, 2, 1) as adicional_nombre_fundamento,
		dbo.FN_ObtenerNombres(i.inspeccion_id, 2, 0) as adicional_nombre,
		dbo.FN_ObtenerNombres(i.inspeccion_id, 3, 0) as expertos_nombre,
		
		--== Datos del documento ==--
		dbo.FN_ObtenerFechaconLetra(CONVERT(varchar, in_fec_emision, 103) )  in_fec_emision,
		CASE in_es_inspeccion_en_centro
			WHEN 1 THEN 'Sí'
			WHEN 0 THEN 'No'
			ELSE 'NULL'
		END in_es_inspeccion_en_centro,
		CASE in_es_inspeccion_en_centro
			WHEN 0 THEN in_domicilio_inspeccion2
			ELSE in_ct_razon_social
		END AS in_domicilio_inspeccion2,
		c.rama_nombre,
		CASE in_firman_titulares
			WHEN 1 THEN 'Sí'
			WHEN 0 THEN 'No'
			ELSE 'NULL'
		END in_firman_titulares,
		in_nombre_firmante,
		in_cargo_firmante,
		in_incluir_notificador,
		dbo.FN_ObtenerNombres(i.inspeccion_id, 4, 0) as notificador_nombre,
		
		--== Copias ==--
		dbo.FN_ObtenerNombres(i.inspeccion_id, 5, 0) as copias_nombre,	    
	    dbo.FN_ObtenerFechaconLetra(CONVERT(varchar(10),dshgo_fec_cierre, 103)) as fec_cierre,
	    (select top 1 dbo.motivo_informe.minf_motivo from dbo.dshgo_motivo_informe inner join dbo.motivo_informe
			on dbo.dshgo_motivo_informe.motivo_informe_id=dbo.motivo_informe.motivo_informe_id and desh.desahogo_id=dbo.dshgo_motivo_informe.desahogo_id) as motivo_informe,
		(select cen_descripcion from dbo.cat_entidades where cen_cve_edorep=dct.dct_cve_edorep) as entidad_inspeccion,
		(select cmu_descripcion from dbo.cat_municipios where cmu_cve_municipio=dct.dct_cve_municipio and cmu_cve_edorep=dct.dct_cve_edorep) as lugar_inspeccion,
		(select top 1 dpart_nombre from dbo.dshgo_participante as par1 
				inner join dbo.dshgo_rep_empresa as rep1 on par1.dshgo_participante_id=rep1.dshgo_participante_id
		 where par1.desahogo_id=desh.desahogo_id )as nombre_representate,
		 (select top 1 dpart_puesto from dbo.dshgo_participante as par1 
				inner join dbo.dshgo_rep_empresa as rep1 on par1.dshgo_participante_id=rep1.dshgo_participante_id
		 where par1.desahogo_id=desh.desahogo_id )as puesto_representate,
		(select top 1 trep_tipo_representante from tipo_representante
				inner join dbo.dshgo_rep_empresa as rep1 on rep1.tipo_representante_id=tipo_representante.tipo_representante_id
				inner join dbo.dshgo_participante as par1 on par1.dshgo_participante_id=rep1.dshgo_participante_id
		 where par1.desahogo_id=desh.desahogo_id) as tipo_representante,
		
		--Notificacion--
		dbo.FN_ObtenerFechaconLetra(CONVERT(varchar, notif.notif_fec_entrega, 103) )
		 fecha_notificacion,
		(select top 1 notif_motivo_no_entrega.nmtvne_motivo from notif_motivo_no_entrega where notif_motivo_no_entrega.notif_motivo_no_entrega_id=notif.notif_motivo_no_entrega_id)
		 as motivo_no_entregada,
		 case dbo.FN_ObtenerNombres(i.inspeccion_id, 2, 0)
		 when '' then REPLACE(dbo.FN_ObtenerNombres(i.inspeccion_id, 1, 0),'<br/>','')
		 else
			REPLACE(dbo.FN_ObtenerNombres(i.inspeccion_id, 1, 0)
			+', '+ dbo.FN_ObtenerNombres(i.inspeccion_id, 2, 0),'<br/>','')
		END as inspectores,
		dbo.FN_ObtenerNombresInspectoresDshgo(desh.desahogo_id) as inspectores_participantes,
		dbo.FN_ObtenerFechaconLetra(Convert(varchar(10),dct_notario_fec_emision,103)) notario_fec_emision ,
		dbo.FN_Obtiene_RepTrabajadores(desh.desahogo_id) AS tipo_rep_trab,
		cur.cve_ur,
	    *,
	     testab_establecimiento,ddf.ddf_calle + ' '+ case when isnull(ddf.ddf_num_exterior, '') = '' then ddf.ddf_num_exterior else  ddf.ddf_num_interior end   + ', Colonia ' + ddf.ddf_colonia + ', C.P. ' + ddf.ddf_cp + ', ' + ddf.ddf_poblacion + ', ' + cen2.cen_descripcion  as ddfDomicilio, cen.cen_descripcion as estadoCT, cri.rama_nombre  as rama2,
	     CASE isnull(desh.dshgo_no_cuenta_solidaria, '') 
			WHEN '1' THEN 'Sí'
			ELSE 'No'
		END cuenta_contratista, 
	    dpart2.dpart_nombre as  rep_trab, reptrab.drtrab_motivo_ausencia
		,ds.dsol_calle + ' '+ case when isnull(ds.dsol_num_exterior, '') = '' then ds.dsol_num_exterior else  ds.dsol_num_interior end  + ', Colonia ' + ds.dsol_colonia + ', C.P. ' + ds.dsol_cp + ', ' + ds.dsol_poblacion + ', ' + cen3.cen_descripcion  as soliDomicilio
	  ,
	  CASE desh.notif_forma_constatacion_id
		  WHEN 4 THEN desh.dshgo_otra_forma_constatacion 
		  ELSE (select top 1 nf.nfmac_forma from notif_forma_constatacion nf where nf.notif_forma_constatacion_id = desh.notif_forma_constatacion_id) END 
	  AS forma_constatacion, desh.dshgo_motivo_negativa  
	  ,desh.dshgo_fec_cierre_parcial, reptest.dtes_motivo_inspector
	   ,  
	  CASE m.mat_acronimo
         WHEN 'CA' THEN 'Comisión Mixta de Capacitación y Adiestramiento'
         WHEN 'AC' THEN 'Comisión de Seguridad e Higiene'
         WHEN 'RSPC' THEN 'Comisión de Seguridad e Higiene'
         ELSE 'Comisión de ' + m.mat_materia
		 END  TIPO_COMISION,
		 dpart2.dpart_puesto as 'puesto_rep_trab',
         (select top(1)  creqfon_motivacion_acuerdo from  dbo.calif_requisito_respuesta careq inner join dbo.calif_requisito_fondo cafon
			on careq.calif_requisito_fondo_id=cafon.calif_requisito_fondo_id
          where careq.calificacion_id=doc.calificacion_id and creqresp_respuesta=2) as motivacion_reprog,
          (select top(1) creqfon_fundamento_motivacion from  dbo.calif_requisito_respuesta careq inner join dbo.calif_requisito_fondo cafon
			on careq.calif_requisito_fondo_id=cafon.calif_requisito_fondo_id
          where careq.calificacion_id=doc.calificacion_id and creqresp_respuesta=2) as fundamento_reprog,
          
          (select top(1) ISNULL([par_nombre],'') + ' ' + ISNULL([par_primer_apellido],'') + ' ' + ISNULL([par_segundo_apellido],'') from dbo.participante par
          --where cur.cve_ur = par.cve_ur and par.par_es_resp_juridico = 1) as responsable_juridico,
          where doc.participante_juridico_id = par.participante_id) as responsable_juridico,
          
          (select top(1) [par_area_juridica] from dbo.participante par
          --where cur.cve_ur = par.cve_ur and par.par_es_resp_juridico = 1) as area_juridica,
          where doc.participante_juridico_id = par.participante_id) as area_juridica,
          
          (select top(1) [par_puesto] from dbo.participante par
          --where cur.cve_ur = par.cve_ur and par.par_es_resp_juridico = 1) as cargo_responsable_juridico
          where doc.participante_juridico_id = par.participante_id) as cargo_responsable_juridico
          ,
           dbo.FN_ConcatenarRubricas(calif_documento_id) as rubricas,
          CASE cali.calif_escrito_dentro_plazo
			WHEN 1 THEN 'DENTRO'
			ELSE 'FUERA'
		END comparecencia_dentro_fuera,
		cur.ur_circunscripcion_sipas circunscripcion_sipas,
		ur_domicilio domicilio_ur
	   
	   FROM calif_documento doc 
	    INNER JOIN dbo.calificacion				cali on cali.calificacion_id=doc.calificacion_id
	    INNER JOIN dbo.desahogo					desh ON desh.desahogo_id=cali.desahogo_id
	    INNER JOIN dbo.inspeccion                    i   on desh.inspeccion_id=i.inspeccion_id				
	    INNER JOIN dbo.subtipo_inspeccion		    si	ON	si.subtipo_inspeccion_id = i.subtipo_inspeccion_id
		INNER JOIN dbo.tipo_inspeccion			ti	ON	ti.tipo_inspeccion_id = si.tipo_inspeccion_id
		LEFT JOIN dbo.catalogo_rama_industrial	c	ON	c.cve_rama = i.cve_rama
		LEFT JOIN dbo.materia					m	ON	m.materia_id = i.materia_id
		LEFT JOIN dbo.motivo_inspeccion			mi	ON	mi.motivo_inspeccion_id = i.motivo_inspeccion_id	 
		LEFT JOIN dbo.catalogo_ur               cur ON i.cve_ur = cur.cve_ur
		LEFT JOIN dbo.inspec_participante       ip  on ip.inspeccion_id = i.inspeccion_id
		LEFT JOIN dbo.participante             p   ON ip.participante_id = p.participante_id
	    LEFT JOIN dbo.fundamento_designacion    fd  ON ip.ipar_tipo_participacion = fd.fundamento_designacion_id
		LEFT JOIN dbo.inspector                 insp on i.notificador_id = insp.inspector_id
		LEFT JOIN dbo.materia_subtipo			ms   on ms.materia_id=i.materia_id and ms.subtipo_inspeccion_id=i.subtipo_inspeccion_id
		LEFT JOIN dbo.dshgo_centro_trabajo		dct   on dct.desahogo_id=desh.desahogo_id
		LEFT JOIN dbo.dshgo_participante        dpar on dpar.desahogo_id=desh.desahogo_id and dpar.dpart_tipo_participante = 6
		LEFT JOIN dbo.dshgo_rep_empresa        repe on repe.dshgo_participante_id=dpar.dshgo_participante_id
		LEFT JOIN dshgo_participante           dpart2 on  dpart2.desahogo_id = desh.desahogo_id and dpart2.dpart_tipo_participante = 5
		LEFT JOIN dbo.dshgo_rep_trabajadores    reptrab on reptrab.dshgo_participante_id=dpart2.dshgo_participante_id
		
		LEFT JOIN dshgo_participante           dpart3 on  dpart3.desahogo_id = desh.desahogo_id and dpart3.dpart_tipo_participante = 2
		LEFT JOIN dbo.dshgo_testigo            reptest on reptest.dshgo_participante_id=dpart3.dshgo_participante_id and dtes_designado_por = 3
	
		LEFT JOIN dbo.notificacion              notif on notif.inspeccion_id=i.inspeccion_id and notif.tipo_documento_id = 2
		LEFT join tipo_establecimiento          te   on te.tipo_establecimiento_id = desh.tipo_establecimiento_id
	    left join dbo.dshgo_domicilio_fiscal    ddf  on  ddf.dshgo_centro_trabajo_id = dct.dshgo_centro_trabajo_id
		left join dbo.cat_entidades             cen  on cen.cen_cve_edorep = dct.dct_notario_cve_edorep
		left join dbo.cat_entidades             cen2 on cen2.cen_cve_edorep = ddf.ddf_cve_edorep
		left join dbo.cat_scian                 cs   on dct.dct_cae_id= cs.cae_id
		left join dbo.centro_trabajoDNE         ctd  on ctd.centro_trabajo_id = dct.dct_dne_centro_trabajo_id
        left join catalogo_rama_industrial      cri  on cri.cve_rama = ctd.rama_industrial_id
        left join dshgo_solidaria               ds   on ds.dshgo_centro_trabajo_id = dct.dshgo_centro_trabajo_id
		left join dbo.cat_entidades             cen3 on cen3.cen_cve_edorep = ds.dsol_cve_edorep
		WHERE (calif_documento_id = @calif_documento_id)
		ORDER BY dpar.dpart_tipo_participante, dpart3.dshgo_participante_id desc
END














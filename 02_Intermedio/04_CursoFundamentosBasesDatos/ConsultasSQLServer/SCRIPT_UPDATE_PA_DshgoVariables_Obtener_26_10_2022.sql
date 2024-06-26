USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_DshgoVariables_Obtener]    Script Date: 26/10/2022 09:58:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ana karina
-- Create date: 06/03/2012
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[PA_DshgoVariables_Obtener] 
	-- Add the parameters for the stored procedure here
	@dshgo_documento_id	int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 1 insp.insp_num_credencial,
	    i.inspeccion_id,
		--== Datos del Centro ==--
		in_ct_nombre,
		in_ct_razon_social, 
		in_ct_rfc, 
		in_domicilio_inspeccion,
		
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
		dbo.FN_ObtenerNombres(i.inspeccion_id, 5, 0) as copias_nombre
	    , 
	    
	    dbo.FN_ObtenerFechaconLetra(CONVERT(varchar(10),dshgo_fec_cierre, 103)) as fec_cierre
,
	   dbo.FN_ObtenerFechaconLetra(CONVERT(varchar(10),dshgo_fec_cierre_parcial, 103)) as fec_cierre_parcial
,	   dbo.FN_ObtenerFechaconLetra(CONVERT(varchar(10),dshgo_fec_reinicio, 103)) as fec_reinicio
,
	   dbo.FN_ObtenerFechaconLetra(CONVERT(varchar(10),dshgo_fec_cierre_parcial2, 103)) as fec_cierre_parcial2
,	   dbo.FN_ObtenerFechaconLetra(CONVERT(varchar(10),dshgo_fec_reinicio2, 103)) as fec_reinicio2
,
		 (select top 1 dbo.motivo_informe.minf_motivo from dbo.dshgo_motivo_informe inner join dbo.motivo_informe
			on dbo.dshgo_motivo_informe.motivo_informe_id=dbo.motivo_informe.motivo_informe_id and desh.desahogo_id=dbo.dshgo_motivo_informe.desahogo_id) as motivo_informe,
		ISNULL((select cen_descripcion from dbo.cat_entidades where cen_cve_edorep=dct.dct_cve_edorep),dbo.FN_ObtenerEstadoPorCentroTrabajo(i.centro_trabajo_id)) as entidad_inspeccion,
		ISNULL((select cmu_descripcion from dbo.cat_municipios where cmu_cve_municipio=dct.dct_cve_municipio and cmu_cve_edorep=dct.dct_cve_edorep),dbo.FN_ObtenerMunicipioPorCentroTrabajo(i.centro_trabajo_id)) as lugar_inspeccion,
		
		
		(select top 1 dpart_nombre from dbo.dshgo_participante as par1 
				inner join dbo.dshgo_rep_empresa as rep1 on par1.dshgo_participante_id=rep1.dshgo_participante_id
		 where par1.desahogo_id=doc.desahogo_id )as nombre_representate,
		 (select top 1 dpart_puesto from dbo.dshgo_participante as par1 
				inner join dbo.dshgo_rep_empresa as rep1 on par1.dshgo_participante_id=rep1.dshgo_participante_id
		 where par1.desahogo_id=doc.desahogo_id )as puesto_representate,
		(select top 1 trep_tipo_representante from tipo_representante
				inner join dbo.dshgo_rep_empresa as rep1 on rep1.tipo_representante_id=tipo_representante.tipo_representante_id
				inner join dbo.dshgo_participante as par1 on par1.dshgo_participante_id=rep1.dshgo_participante_id
		 where par1.desahogo_id=doc.desahogo_id) as tipo_representante,
		
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
		case dbo.FN_ObtenerNombresInspectoresDshgo(desh.desahogo_id)
			when '' then 
				case dbo.FN_ObtenerNombres(i.inspeccion_id, 2, 0)
				 when '' then REPLACE(dbo.FN_ObtenerNombres(i.inspeccion_id, 1, 0),'<br/>','')
				 else
					REPLACE(dbo.FN_ObtenerNombres(i.inspeccion_id, 1, 0)
					+', '+ dbo.FN_ObtenerNombres(i.inspeccion_id, 2, 0),'<br/>','')
				END
			else dbo.FN_ObtenerNombresInspectoresDshgo(desh.desahogo_id)
		end 
		 as inspectores_participantes,
		

		dbo.FN_ObtenerFechaconLetra(Convert(varchar(10),dct_notario_fec_emision,103)) notario_fec_emision ,
		dbo.FN_Obtiene_RepTrabajadores(doc.desahogo_id) AS tipo_rep_trab,
	    *,
	     dct.dct_calle + 
		CASE RTRIM(LTRIM(' No. ' + ISNULL(dct.dct_num_exterior,'')))
			WHEN 'No.' THEN '' ELSE ' No. ' + dct.dct_num_exterior 
			END + 
		CASE RTRIM(LTRIM(' Interior ' + ISNULL(dct.dct_num_interior,''))) 
			WHEN 'Interior' THEN '' ELSE ', Interior ' + dct.dct_num_interior
		END + 
		CASE RTRIM(LTRIM(' Colonia ' + ISNULL( dct.dct_colonia ,'')))
			WHEN 'Colonia' THEN '' ELSE  ', Colonia ' +  dct.dct_colonia 
		 END  + 
		CASE RTRIM(LTRIM(' C.P. ' + ISNULL(dct.dct_cp,''))) 
			WHEN 'C.P.' THEN '' ELSE  ', C.P. ' + dct.dct_cp
		END + ', ' 
		+ case when dct.dct_poblacion IS null then ISNULL(dct.dct_poblacion, '') else dct.dct_poblacion 
		+ ', '
		end 
		
		 + isnull((select top 1 cmu_descripcion from dbo.cat_municipios where cmu_cve_municipio = dct.dct_cve_municipio and cmu_cve_edorep= dct.dct_cve_edorep),'') 
		  + ', ' +
		isnull((select top 1 cen_descripcion from dbo.cat_entidades where cen_cve_edorep= dct.dct_cve_edorep),'')
		 as dshgoDomicilio,
	    
	    
	    ddf.ddf_calle + 
		CASE RTRIM(LTRIM(' No. ' + ISNULL(ddf.ddf_num_exterior,'')))
			WHEN 'No.' THEN '' ELSE ' No. ' + ddf.ddf_num_exterior 
			END + 
		CASE RTRIM(LTRIM(' Interior ' + ISNULL(ddf.ddf_num_interior,''))) 
			WHEN 'Interior' THEN '' ELSE ', Interior ' + ddf.ddf_num_interior
		END + 
		CASE RTRIM(LTRIM(' Colonia ' + ISNULL( ddf.ddf_colonia ,'')))
			WHEN 'Colonia' THEN '' ELSE  ', Colonia ' +  ddf.ddf_colonia 
		 END  + 
		CASE RTRIM(LTRIM(' C.P. ' + ISNULL(ddf.ddf_cp,''))) 
			WHEN 'C.P.' THEN '' ELSE  ', C.P. ' + ddf.ddf_cp
		END + ', ' 
		+ case when ddf.ddf_poblacion IS null then ISNULL(ddf.ddf_poblacion, '') else ddf.ddf_poblacion 
		+ ', '
		end 
		
		 + isnull((select top 1 cmu_descripcion from dbo.cat_municipios where cmu_cve_municipio = ddf.ddf_cve_municipio and cmu_cve_edorep= ddf.ddf_cve_edorep),'')  + ', ' + cen2.cen_descripcion
		 as ddfDomicilio,
	      cen.cen_descripcion as estadoCT, cri.rama_nombre  as rama2,
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
	  ,desh.dshgo_fec_cierre_parcial
	  ,desh.dshgo_fec_cierre_parcial2
	  ,reptest.dtes_motivo_inspector,  
	  CASE m.mat_acronimo
         WHEN 'CA' THEN 'Comisión Mixta de Capacitación y Adiestramiento'
         WHEN 'AC' THEN 'Comisión de Seguridad e Higiene'
         WHEN 'RSPC' THEN 'Comisión de Seguridad e Higiene'
         ELSE  'Comisión de ' + m.mat_materia end  TIPO_COMISION, dpart2.dpart_puesto as 'puesto_rep_trab',
          desh.dshgo_motivo_no_comision ,
          cur.ur_domicilio domicilio_ur,
		desh.dshgo_fec_reinicio,
		desh.dshgo_fec_reinicio2,
		case dct_dne_seguridad_social_id
		when 1 then 'IMSS'
		when 2 then 'ISSSTE'
		when 3 then 'PROPIO'
		else 'NO CUENTA'
		end as 'esquema',
		case dct_clase_riesgo
		when '-- Se' then 'NO CUENTA CON EL DOCUMENTO'
		else dct_clase_riesgo
		end as clase_riesgo
	   
		FROM dshgo_documento doc 
	    INNER JOIN dbo.desahogo					desh on desh.desahogo_id=doc.desahogo_id
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
		LEFT JOIN dshgo_participante           dpart2 on  dpart2.desahogo_id = doc.desahogo_id and dpart2.dpart_tipo_participante = 5
		LEFT JOIN dbo.dshgo_rep_trabajadores    reptrab on reptrab.dshgo_participante_id=dpart2.dshgo_participante_id
		
		LEFT JOIN dshgo_participante           dpart3 on  dpart3.desahogo_id = doc.desahogo_id and dpart3.dpart_tipo_participante = 2
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
		
		/*--agregado de variables de emplazamiento */
		LEFT JOIN dbo.emplazamiento             emp  on emp.inspeccion_comprobacion_id=i.inspeccion_id
		WHERE (dshgo_documento_id = @dshgo_documento_id  OR @dshgo_documento_id = -1) 
		ORDER BY dpar.dpart_tipo_participante, dpart3.dshgo_participante_id DESC
END














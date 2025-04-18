USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Dshgo_Participantes_ConsultarEstado]    Script Date: 25/10/2022 12:30:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		DAVID
-- Create date: 20/02/2012
-- Description:	Consultar si esta completo el estatus de participantes para marcar en tablero
-- Tipo documentos: 1 Informe
--	                2 Acta
--	                3 Negativa
-- =============================================
ALTER PROCEDURE [dbo].[PA_Dshgo_Participantes_ConsultarEstado]   -- 10477, 164 ,2,2
	@inspeccion_id int,
	@desahogo_id int,
	@tipo_documento  int,
	@materia_id int
AS
BEGIN
	SET NOCOUNT ON;
	/** Declaración de variables  **/
	DECLARE @tipo_rep int;
	DECLARE @regresar bit;
	DECLARE @acronomo CHAR(10)
	SET @regresar = 1;

	/** Asigno Variables   **/
	SELECT @acronomo=m.mat_acronimo FROM dbo.materia m WHERE m.materia_id = @materia_id

	print(@acronomo)
	
	    --inspector al menos 1
	     if((select COUNT(1) from dshgo_participante where desahogo_id = @desahogo_id and dpart_tipo_participante = 1) = 0)
	     begin
	         set @regresar = 0;
	     end 
	     
	     --experto
	    if exists ( select * from dshgo_participante dp inner join dshgo_experto de on dp.dshgo_participante_id = de.dshgo_participante_id
	     where dpart_tipo_participante = 7 and desahogo_id = @desahogo_id and 
	     (de.tipo_identificacion_id != 6 and (de.dexp_num_identificacion = '' or de.dexp_num_identificacion is null)))
	     begin 
	       set @regresar = 0;
	     end;
	     
	       if((select COUNT(1) from dshgo_participante where desahogo_id = @desahogo_id and dpart_tipo_participante = 6) = 0)
	     begin
	         set @regresar = 0;
	     end
	     else begin
	             select @tipo_rep =  tipo_representante_id
	             from  dshgo_rep_empresa dre inner join dshgo_participante dp
	             on dp.dshgo_participante_id = dre.dshgo_participante_id and dp.dpart_tipo_participante = 6 
				 where desahogo_id = @desahogo_id
	             
	             if(@tipo_rep = 1) 
	             begin
	                  if exists ( select 1  from dshgo_rep_empresa dre inner join dshgo_participante dp 
	                                        on dp.dshgo_participante_id = dre.dshgo_participante_id and dp.dpart_tipo_participante = 6 and desahogo_id = @desahogo_id and 
											 ((dp.dpart_nombre is  null or dp.dpart_nombre = '') or 
											 (dre.dremp_acreditacion_num_escritura is  null or  dre.dremp_acreditacion_num_escritura = '') or
											 (dre.dremp_acreditacion_fec_emision is  null or dre.dremp_acreditacion_fec_emision = '') or 
											 (dre.dremp_acrecitacion_notario_numero is  null or dre.dremp_acrecitacion_notario_numero = '') or 
											 (dre.dremp_acreditacion_notario is  null or dre.dremp_acreditacion_notario = '') or 
											 ((dre.dremp_identificacion_numero is  null or dre.dremp_identificacion_numero = '') and dre.tipo_identificacion_id != 6))
	                   
	                           ) begin 
	                             set @regresar = 0;  
	                             end
	             end
	             
	             if(@tipo_rep = 2) 
	             begin
	                  if exists ( select 1  from dshgo_rep_empresa dre 
										    inner join dshgo_participante dp 
												   on dp.dshgo_participante_id = dre.dshgo_participante_id and dp.dpart_tipo_participante = 6 and desahogo_id = @desahogo_id and 
										    ((dp.dpart_nombre is  null or dp.dpart_nombre = '') or (dp.dpart_puesto is  null or dp.dpart_puesto = '') or 
										    (dremp_se_identifica = 1 and ((dre.dremp_identificacion_numero is  null or dre.dremp_identificacion_numero = '') and dre.tipo_identificacion_id != 6)) or 
										    (dremp_se_acredita = 1 and (dre.dremp_acreditacion_documento is  null or dre.dremp_acreditacion_documento = '')) )
	                             ) begin
	                               set @regresar = 0; 
	                               end
	             end
	             
	             if(@tipo_rep = 3) 
	             begin
	                  if exists ( select 1 from dshgo_rep_empresa dre 
										    inner join dshgo_participante dp 
												   on dp.dshgo_participante_id = dre.dshgo_participante_id and dp.dpart_tipo_participante = 6 and desahogo_id = @desahogo_id and 
										    ((dp.dpart_nombre is  null or dp.dpart_nombre = '') or 
										    (((dre.dremp_identificacion_numero is  null or dre.dremp_identificacion_numero = '') and dre.tipo_identificacion_id != 6)) or 
										  --  (dremp_se_acredita = 1 and (dre.dremp_acreditacion_documento is  null or dre.dremp_acreditacion_documento = '')) or
										    (dremp_tipo_acreditacion = 0 and  (dre.dremp_acreditacion_rfc is  null or dre.dremp_acreditacion_rfc = '')) or
										    (dremp_tipo_acreditacion = 0 and  (dre.dremp_acreditacion_actividad is  null or dre.dremp_acreditacion_actividad = '')) or
										    (dremp_tipo_acreditacion = 0 and  (dre.dremp_acreditacion_fec_inscripcion is  null or dre.dremp_acreditacion_fec_inscripcion = '')) or
										    (dremp_tipo_acreditacion = 0 and  (dre.dremp_acreditacion_fec_inicio is  null or dre.dremp_acreditacion_fec_inicio = '')) or
										    (dremp_tipo_acreditacion = 1 and  (dremp_acreditacion_giro_economico is  null or dremp_acreditacion_giro_economico = '')) or 
										    (dremp_tipo_acreditacion = 1 and  (dremp_acreditacion_reg_patronal is  null or dremp_acreditacion_reg_patronal = '')))
	                            ) begin
	                              set @regresar = 0;
	                              end
	             end
	             
	             if(@tipo_rep = 4) 
	             begin
	                  if exists (select 1 from dshgo_rep_empresa dre 
										    inner join dshgo_participante dp 
												   on dp.dshgo_participante_id = dre.dshgo_participante_id and dp.dpart_tipo_participante = 6 and desahogo_id = @desahogo_id and 
										    ((dp.dpart_nombre is  null or dp.dpart_nombre = '') or 
										    ((dremp_acreditacion_empresa_contratista is null or dremp_acreditacion_empresa_contratista = '')) or
										    (dremp_se_acredita = 1 and (dre.dremp_acreditacion_contrato_servicios is  null or dre.dremp_acreditacion_contrato_servicios = '')) or
										    (dremp_se_identifica = 1 and ((dre.dremp_identificacion_numero is  null or dre.dremp_identificacion_numero = '') and dre.tipo_identificacion_id != 6)) or 
										    (dremp_se_identifica = 0 and (dre.dremp_media_filiacion is  null or dre.dremp_media_filiacion = '')))
										    
					            ) begin
					              set @regresar = 0;
					              end;
	             end
	             
	          end 
	     
	if(@tipo_documento in(2,3)) 
	begin 
	     if(@acronomo != 'AC')
	     begin
	     
	     if not exists (select 1 from dshgo_participante where desahogo_id = @desahogo_id and dpart_tipo_participante = 5)
	     begin
	         set @regresar = 0;
	     end
	     else begin
	             select @tipo_rep =  tipo_representante_id
	             from  dshgo_rep_trabajadores drt inner join dshgo_participante dp
	             on dp.dshgo_participante_id = drt.dshgo_participante_id and dp.dpart_tipo_participante = 5 
				 where desahogo_id = @desahogo_id  
	             
	             if(@tipo_rep = 6) 
	             begin
	                   if exists (select 1   from dshgo_rep_trabajadores drt inner join dshgo_participante dp 
	                                        on dp.dshgo_participante_id = drt.dshgo_participante_id and dp.dpart_tipo_participante = 5 and desahogo_id = @desahogo_id and 
											 ((dp.dpart_nombre is  null or dp.dpart_nombre = '') or 
											 (drt.drtrab_toma_nota_fecha is  null or drt.drtrab_toma_nota_fecha = '' ) or
											 ((drt.drtrab_identificacion_numero is  null or drt.drtrab_identificacion_numero = '') and drt.tipo_identificacion_id != 6 ))
	                             )
	                             begin 
	                             set @regresar = 0;
	                             end;
	             end
	             
	             if(@tipo_rep = 7)  
	             begin
	                  if exists ( select 1  from dshgo_rep_trabajadores drt inner join dshgo_participante dp 
	                                        on dp.dshgo_participante_id = drt.dshgo_participante_id and dp.dpart_tipo_participante = 5 and desahogo_id = @desahogo_id and 
											 ((dp.dpart_nombre is  null or dp.dpart_nombre = '') or 
											  (drt.drtrab_acreditacion_num_escritura is  null or drt.drtrab_acreditacion_num_escritura = '' ) or
											  (drt.drtrab_acreditacion_fec_emision is  null or drt.drtrab_acreditacion_fec_emision = '' ) or
											  (drt.drtrab_acreditacion_notario is  null or drt.drtrab_acreditacion_notario = '' ) or
											  (drt.drtrab_acreditacion_notario_numero is  null or drt.drtrab_acreditacion_notario_numero = '' ) or
											  ((drt.drtrab_identificacion_numero is  null or drt.drtrab_identificacion_numero = '') and drt.tipo_identificacion_id != 6))
	                  )
	                  begin
	                  set @regresar = 0;
	                  end;
	             end
	             
	             if(@tipo_rep = 8) 
	             begin
	                 if exists ( select 1 from dshgo_rep_trabajadores drt inner join dshgo_participante dp 
	                                        on dp.dshgo_participante_id = drt.dshgo_participante_id and dp.dpart_tipo_participante = 5 and desahogo_id = @desahogo_id and 
											 ((dp.dpart_nombre is  null or dp.dpart_nombre = '') or 
											  (dp.dpart_puesto is  null or dp.dpart_puesto = '') or 
											  (drtrab_se_acredita = 1 and (drt.drtrab_acreditacion_documento is  null or drtrab_acreditacion_documento = '')) or
										      (drt.drtrab_se_identifica = 1 and ((drt.drtrab_identificacion_numero is  null or drt.drtrab_identificacion_numero = '') and drt.tipo_identificacion_id != 6)))
	                  )
	                  begin
	                  set @regresar = 0;
	                  end;
	             end
	             
	             if(@tipo_rep = 9) 
	             begin
	                  if exists ( select 1 from dshgo_rep_trabajadores drt inner join dshgo_participante dp 
	                                        on dp.dshgo_participante_id = drt.dshgo_participante_id and dp.dpart_tipo_participante = 5 and desahogo_id = @desahogo_id and 
											 ((drt.drtrab_motivo_ausencia is  null or drt.drtrab_motivo_ausencia = '') 
											-- or (drt.dshgo_sindicato_id is not null)
											 )
											
					 ) begin 
					   set @regresar = 0; 
					   end
	             end
	             
	        end 
	        end
	       
	
	     if not exists (select 1 from dshgo_participante where desahogo_id = @desahogo_id and dpart_tipo_participante = 2)
	     begin
	         set @regresar = 0;
	     end
	     else begin
	            
	        
	                  if exists( select 1   from dshgo_testigo drt inner join dshgo_participante dp 
	                                        on dp.dshgo_participante_id = drt.dshgo_participante_id and dp.dpart_tipo_participante = 2 and desahogo_id = @desahogo_id and 
	                                        ((dtes_num_testigo = 0) and (drt.dtes_motivo_inspector is null or drt.dtes_motivo_inspector = ''))
							   )
							   begin
							   set @regresar = 0; 
							   end
	           
	             
	        
	                    if exists (select top 1 1  from dshgo_testigo drt inner join dshgo_participante dp 
	                                        on dp.dshgo_participante_id = drt.dshgo_participante_id and dtes_num_testigo > 0
	                                        and (dtes_num_testigo >0)
	                                        and (dtes_designado_por=0 or
												 (dp.dpart_nombre is null or dp.dpart_nombre = '') or
	                                             (dp.dpart_puesto is null or dp.dpart_puesto= '' ) or
	                                             (dtes_es_mismo_domicilio = 0 and (dtes_domicilio_notificaciones is null or dtes_domicilio_notificaciones ='') ) or
	                                             ((drt.dtes_num_identificacion is null or dtes_num_identificacion ='')) and tipo_identificacion_id != 6)
	                                        where dp.dshgo_participante_id  = (select top 1 dshgo_participante_id from dshgo_participante where  dpart_tipo_participante = 2 and desahogo_id = @desahogo_id)
	                                      
	                                        
	                  ) begin  set @regresar = 0; end
	                  
	                    if exists (select 1  from dshgo_testigo drt inner join dshgo_participante dp 
	                                        on dp.dshgo_participante_id = drt.dshgo_participante_id 
	                                        and (dtes_designado_por =1 or dtes_designado_por =2 or dtes_designado_por=0)
	                                        and (dtes_num_testigo >0)
	                                        and ((dp.dpart_nombre is null or dp.dpart_nombre = '') or (dp.dpart_puesto is null or dp.dpart_puesto= '' ) 
	                                        or
	                                            (dtes_es_mismo_domicilio = 0 and (dtes_domicilio_notificaciones is null or dtes_domicilio_notificaciones ='')  
	                                        or
	                                            ((drt.dtes_num_identificacion is null or dtes_num_identificacion ='') and tipo_identificacion_id != 6)
	                                         or dtes_designado_por=0
	                                             )
	                                           )
	                                          where dp.dshgo_participante_id  =  
	                                          (select top 1 dshgo_participante_id from dshgo_participante where  dpart_tipo_participante = 2 
	                                          and desahogo_id = @desahogo_id order by dshgo_participante_id desc)
	                                     
	                                         
	                  ) begin  set @regresar = 0; end
	                  
	                      if exists (select 1  from dshgo_testigo drt inner join dshgo_participante dp 
	                                        on dp.dshgo_participante_id = drt.dshgo_participante_id 
	                                       and (dtes_num_testigo >0)
	                                        and dtes_designado_por = 3 and (dtes_motivo_inspector = '' or dtes_motivo_inspector is null)
	                                          where dp.dshgo_participante_id  =  
	                                          (select top 1 dshgo_participante_id from dshgo_participante where  dpart_tipo_participante = 2 
	                                          and desahogo_id = @desahogo_id order by dshgo_participante_id desc)
	                                     
	                                         
	                  ) begin  set @regresar = 0; end
	           
	           
	          
	             
	          end 
	          
	           if(@acronomo = 'SH' OR @acronomo = 'CA' OR @acronomo = 'RSPC')
	          begin
						 if not exists (select 1 from dshgo_participante where desahogo_id = @desahogo_id and dpart_tipo_participante = 4)
				                        begin
				           	            set @regresar = 0;
				                        end
				 else begin
			            
			        
							  if(( select dshgo_participa_comision  from desahogo  where  desahogo_id = @desahogo_id) = 0)
							   begin 
							   set @regresar = 0;
							   end
							   else begin 
			                               
								if exists (select  1  from desahogo desh inner join  dshgo_participante dp  on dp.desahogo_id = desh.desahogo_id and desh.dshgo_participa_comision = 1
																	 	inner join dshgo_comision drt 
																	  	on dp.dshgo_participante_id = drt.dshgo_participante_id and dp.dpart_tipo_participante = 4 and dcom_parte_representa  = 1
																		where desh.desahogo_id =  @desahogo_id 
																		 and ((dp.dpart_nombre is null or dp.dpart_nombre = '') or
																			 (dp.dpart_puesto is null or dp.dpart_puesto= '' ) or
																			 ((drt.dcom_num_identificacion is null or dcom_num_identificacion ='')  and tipo_identificacion_id != 6))
													 or  exists (select * from desahogo where desahogo_id = @desahogo_id and dshgo_participa_comision in(2, 3) 
													                  and (dshgo_motivo_no_comision is null or dshgo_motivo_no_comision = '') )
			                                        
			                                         
							  ) begin  set @regresar = 0; end
			                  
								  if exists (select  1  from desahogo desh inner join  dshgo_participante dp  on dp.desahogo_id = desh.desahogo_id and desh.dshgo_participa_comision = 1
																	 	inner join dshgo_comision drt 
																	  	on dp.dshgo_participante_id = drt.dshgo_participante_id and dp.dpart_tipo_participante = 4 and dcom_parte_representa  = 2
																		where desh.desahogo_id =  @desahogo_id 
																		 and ((dp.dpart_nombre is null or dp.dpart_nombre = '') or
																			 (dp.dpart_puesto is null or dp.dpart_puesto= '' ) or
																			 ((drt.dcom_num_identificacion is null or dcom_num_identificacion ='') and tipo_identificacion_id != 6))
													 or  exists (select * from desahogo where desahogo_id = @desahogo_id and dshgo_participa_comision in(2, 3) 
													                  and (dshgo_motivo_no_comision is null or dshgo_motivo_no_comision = '') )
			                                        
							  ) begin  set @regresar = 0; end
			           
			           
			          
						  end
					  end 
	        end
	
	end
	
	 select @regresar;
	
END














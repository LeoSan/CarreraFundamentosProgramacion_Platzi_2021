-- Script para Mejorar la consulta [PA_Inspeccion_ConsultarEmpresa] 

--SSI_DB_SIAPI_REFESSATV2
USE[SSI_DB_SIAPI_REFESSATV2]
CREATE NONCLUSTERED INDEX IDX_in_ct_nombre ON SSI_DB_SIAPI_REFESSATV2.dbo.inspeccion (in_ct_nombre);
CREATE NONCLUSTERED INDEX IDX_in_ct_razon_social ON SSI_DB_SIAPI_REFESSATV2.dbo.inspeccion (in_ct_razon_social);
CREATE NONCLUSTERED INDEX IDX_in_num_expediente ON SSI_DB_SIAPI_REFESSATV2.dbo.inspeccion (in_num_expediente);
CREATE NONCLUSTERED INDEX IDX_in_ct_rfc ON SSI_DB_SIAPI_REFESSATV2.dbo.inspeccion (in_ct_rfc);
CREATE NONCLUSTERED INDEX IDX_cve_ur ON SSI_DB_SIAPI_REFESSATV2.dbo.inspeccion (cve_ur);
CREATE NONCLUSTERED INDEX IDX_in_fec_inspeccion ON SSI_DB_SIAPI_REFESSATV2.dbo.inspeccion (in_fec_inspeccion);
CREATE NONCLUSTERED INDEX IDX_in_etapa ON SSI_DB_SIAPI_REFESSATV2.dbo.inspeccion (in_etapa);
CREATE NONCLUSTERED INDEX IDX_ipar_tipo_participacion ON SSI_DB_SIAPI_REFESSATV2.dbo.inspec_participante (ipar_tipo_participacion);
CREATE NONCLUSTERED INDEX IDX_ipar_centro_mat ON SSI_DB_SIAPI_REFESSATV2.dbo.centro_materia (cm_materia);


--BD_DNE
USE[db_dne]
CREATE NONCLUSTERED INDEX IDX_ipar_ct_nombre ON db_dne.dbo.centro_trabajo (ct_nombre);
CREATE NONCLUSTERED INDEX IDX_ipar_ct_calle ON db_dne.dbo.centro_trabajo (ct_calle);
CREATE NONCLUSTERED INDEX IDX_ipar_ct_cp ON db_dne.dbo.centro_trabajo (ct_cp);
CREATE NONCLUSTERED INDEX IDX_ipar_ct_imss_registro ON db_dne.dbo.centro_trabajo (ct_imss_registro);
CREATE NONCLUSTERED INDEX IDX_ipar_emp_rfc ON db_dne.dbo.empresa (emp_rfc);
CREATE NONCLUSTERED INDEX IDX_ipar_emp_nombre ON db_dne.dbo.empresa (emp_nombre);
CREATE NONCLUSTERED INDEX IDX_ipar_emp_nombre_comercial ON db_dne.dbo.empresa (emp_nombre_comercial);
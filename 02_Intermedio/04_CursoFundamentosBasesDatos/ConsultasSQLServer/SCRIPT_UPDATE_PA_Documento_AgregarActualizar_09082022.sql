USE [SSI_DB_SIAPI_REFESSATV2]
GO
/****** Object:  StoredProcedure [dbo].[PA_Documento_AgregarActualizar]    Script Date: 09/08/2022 05:31:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













-- =============================================
-- Author:		Ernesto
-- Create date: 14/11/2011
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_Documento_AgregarActualizar]

	@documento_id                int,
	@inspeccion_id               int,
	@inspector_id                int,
	@tipo_documento_id           smallint,
	@doc_url_archivo             varchar(200),
	@doc_esta_asignado           tinyint,
	@doc_fec_documento           datetime,
	@doc_forma_entrega           tinyint,
	@doc_fec_limite_entrega      datetime,
	@doc_fec_entrega_programada  datetime,
	@doc_observaciones           varchar(1000),
	@doc_estatus                 tinyint,
	@sys_usr                     varchar(150)
	

AS
BEGIN
    SET NOCOUNT ON;


IF NOT EXISTS(SELECT documento_id FROM documento WHERE documento_id = @documento_id )
BEGIN
    INSERT INTO documento (
		--documento_id,
		inspeccion_id,
		inspector_id,
		tipo_documento_id,
		doc_url_archivo,
		doc_esta_asignado,
		doc_fec_documento,
		doc_forma_entrega,
		doc_fec_limite_entrega,
		doc_fec_entrega_programada,
		doc_observaciones,
		doc_estatus,
		sys_usr_insert,
		sys_fec_insert

) VALUES (
		--@documento_id,
		@inspeccion_id,
		@inspector_id,
		@tipo_documento_id,
		@doc_url_archivo,
		@doc_esta_asignado,
		@doc_fec_documento,
		@doc_forma_entrega,
		@doc_fec_limite_entrega,
		@doc_fec_entrega_programada,
		@doc_observaciones,
		@doc_estatus,
		@sys_usr,
		GETDATE()
)

END ELSE BEGIN
	UPDATE documento SET 
		inspeccion_id 	             = ISNULL(@inspeccion_id, inspeccion_id),
		inspector_id 	             = ISNULL(@inspector_id, inspector_id),
		tipo_documento_id 	         = ISNULL(@tipo_documento_id, tipo_documento_id),
		doc_url_archivo 			 = ISNULL(@doc_url_archivo, doc_url_archivo),
		doc_esta_asignado 	         = ISNULL(@doc_esta_asignado, doc_esta_asignado),
		doc_fec_documento 	         = ISNULL(@doc_fec_documento, doc_fec_documento),
		doc_forma_entrega 	         = ISNULL(@doc_forma_entrega, doc_forma_entrega),
		doc_fec_limite_entrega 	     = ISNULL(@doc_fec_limite_entrega, doc_fec_limite_entrega),
		doc_fec_entrega_programada 	 = ISNULL(@doc_fec_entrega_programada, doc_fec_entrega_programada),
		doc_observaciones 	         = ISNULL(@doc_observaciones, doc_observaciones),
		doc_estatus 	             = ISNULL(@doc_estatus, doc_estatus),
		sys_usr_update 	             = ISNULL(@sys_usr, sys_usr_update),
		sys_fec_update 	             = GETDATE() 

	  WHERE documento_id = @documento_id
END

END














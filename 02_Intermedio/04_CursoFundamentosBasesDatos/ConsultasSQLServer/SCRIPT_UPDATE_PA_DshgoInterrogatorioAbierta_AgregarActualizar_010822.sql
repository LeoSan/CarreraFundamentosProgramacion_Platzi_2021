USE [SSI_DB_SIAPI_REFESSATV2]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		gabriel
-- Create date: 05/03/2012
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[PA_DshgoInterrogatorioAbierta_AgregarActualizar] 
	@dshgo_interrogatorio_abierta_id int = NULL,
	@dshgo_interrogado_id int=null,
	@diabie_pregunta varchar(400)=null,
	@diabie_respuesta varchar(400)=null,
	@sys_usr varchar(20)=null
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT 1 FROM dshgo_interrogatorio_abierta where dshgo_interrogatorio_abierta_id=@dshgo_interrogatorio_abierta_id)
		BEGIN
			INSERT INTO dbo.dshgo_interrogatorio_abierta
				   (dshgo_interrogado_id
				   ,diabie_pregunta
				   ,diabie_respuesta
				   ,sys_usr_insert
				   ,sys_fec_insert)
			 VALUES
				   (@dshgo_interrogado_id,
					@diabie_pregunta,
					@diabie_respuesta,
					@sys_usr, 
					GETDATE())
		END
	ELSE 
		BEGIN
			UPDATE 
				dbo.dshgo_interrogatorio_abierta
			SET dshgo_interrogado_id = ISNULL(@dshgo_interrogado_id,dshgo_interrogado_id ),
				diabie_pregunta = ISNULL(@diabie_pregunta, diabie_pregunta),
				diabie_respuesta = ISNULL(@diabie_respuesta,diabie_respuesta),
				sys_usr_insert = ISNULL(@sys_usr,sys_usr_insert),
				sys_fec_insert = GETDATE()
			WHERE 
			dshgo_interrogatorio_abierta_id=@dshgo_interrogatorio_abierta_id
		END
END













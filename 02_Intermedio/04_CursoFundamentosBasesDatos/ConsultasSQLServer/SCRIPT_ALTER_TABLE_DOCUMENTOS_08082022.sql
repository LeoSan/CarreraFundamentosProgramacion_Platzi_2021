USE [SSI_DB_SIAPI_REFESSATV2]
GO

	ALTER TABLE dbo.dshgo_documento ALTER COLUMN sys_usr_insert VARCHAR(150);
	ALTER TABLE dbo.operativo_docto ALTER COLUMN sys_usr_insert VARCHAR(150);
	ALTER TABLE dbo.documento ALTER COLUMN sys_usr_insert VARCHAR(150);
	ALTER TABLE dbo.calif_documento ALTER COLUMN sys_usr_insert VARCHAR(150);
GO

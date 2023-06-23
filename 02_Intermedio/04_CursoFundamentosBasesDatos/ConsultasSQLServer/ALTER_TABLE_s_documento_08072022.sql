USE [SSI_DB_SIAPI_REFESSATV2]

ALTER TABLE dbo.s_documento 
	ADD proceso_padre varchar(255) default null;


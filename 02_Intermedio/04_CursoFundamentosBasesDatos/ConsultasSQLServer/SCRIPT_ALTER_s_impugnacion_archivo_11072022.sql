USE [SSI_DB_SIAPI_REFESSATV2]

ALTER TABLE dbo.s_impugnacion_archivo 
	ADD proceso varchar(255) default null;
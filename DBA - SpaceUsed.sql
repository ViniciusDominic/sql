/* DISPONIBILIDADE ATUAL DE ESPAÇO EM DISCO */

EXECUTE master.sys.xp_fixeddrives

SELECT 75563/1024 AS QTD_GB_LIVRE

CREATE TABLE tabela_drives (
DATA DATE DEFAULT getdate(),
DRIVE CHAR(1),
ESPACO_LIVRE_MB BIGINT
)

INSERT tabela_drives (DRIVE, ESPACO_LIVRE_MB)
EXECUTE master.sys.xp_fixeddrives


/* ESPAÇO USADO PELA BASE DE DADOS */

USE [ALTERDATA_ERP]
GO
EXEC sp_spaceused @updateusage = N'TRUE'
GO

/* ESPAÇO USADO POR UMA TABELA */

USE [ALTERDATA_ERP]
GO
EXECUTE sp_spaceused @objname = 'dbo.Documento'
GO

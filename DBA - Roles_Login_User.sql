EXEC sp_srvrolepermission 'bulkadmin'

EXEC sp_dbfixedrolepermission 'db_accessadmin'

USE [master]
GO

CREATE LOGIN exemplo WITH PASSWORD='senha'
GO

USE [ALTERDATA_ERP]
GO

CREATE USER exemplo FOR LOGIN exemplo
GO

CREATE ROLE GPEXEMPLO
GO

GRANT SELECT ON SCHEMA :: dbo TO GPEXEMPLO
GO

ALTER ROLE GPEXEMPLO ADD MEMBER exemplo
GO
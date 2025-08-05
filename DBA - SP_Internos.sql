/* PROCEDIMENTOS INTERNOS */
 
 USE [ALTERDATA_ERP]
 GO

EXEC SP_HELPDB
EXEC SP_WHO2
EXEC SP_HELP PedidoDeVenda
EXEC SP_HELPINDEX PedidoDeVenda
EXEC SP_HELPTRIGGER PedidoDeVenda
EXEC SP_HELPTEXT tD_PedidoDeVenda
EXEC sp_srvrolepermission 'bulkadmin'
EXEC sp_dbfixedrolepermission 'db_accessadmin'

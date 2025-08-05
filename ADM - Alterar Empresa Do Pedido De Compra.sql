USE [ALTERDATA_ERP]
GO

SELECT CdEmpresa, CdEmpresaFinanceiro, * FROM dbo.PedidoDeCompra /* PEGAR O ID DO PEDIDO DE COMPRA */
WHERE cdchamada='044948'
AND CdEmpresa='16'
GO

UPDATE dbo.PedidoDeCompra /* PEGAR O ID DO PEDIDO DE COMPRA */
SET CdEmpresa='16',
CdEmpresaFinanceiro='16'
WHERE IdPedidoDeCompra='00A0001LZL'
AND cdchamada='044948'
GO

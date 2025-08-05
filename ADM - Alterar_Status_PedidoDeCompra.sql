USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.PedidoDeCompra /* PEGAR O ID DO PEDIDO DE COMPRA */
WHERE cdchamada='061709'
AND CdEmpresa='16'
GO

SELECT * FROM dbo.PedidoDeCompra /* PEGAR O ID DO PEDIDO DE COMPRA */
WHERE IdPedidoDeCompra='00A00025NE'
GO

UPDATE dbo.PedidoDeCompra
SET StPedidoDeCompra='A'
WHERE IdPedidoDeCompra='00A00025NE'

SELECT * FROM dbo.PedidoDeCompraItem
WHERE IdPedidoDeCompra='00A00025NE'

UPDATE dbo.PedidoDeCompraItem
SET StPedidoDeCompraItem='A'
WHERE IdPedidoDeCompra='00A00025NE'
GO
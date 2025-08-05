USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.PedidoDeCompra WHERE CdChamada = '066804'

SELECT * FROM DBO.APAGAR WHERE NRTITULO='066804-1'

SELECT * FROM dbo.PedidoDeCompraPagamento WHERE IdPedidoDeCompra = '00A0002BE8'

SELECT * FROM dbo.Adiantamento WHERE IdAPagar = '00A000776F'

SELECT * FROM dbo.AdiantamentoPagamento WHERE IdAdiantamento = '7585'

--DELETE dbo.AdiantamentoPagamento WHERE IdPedidoDeCompra = '00A0002BE8' AND IdAdiantamentoPagamento = '4990'--

--SELECT * FROM vw_Adiantamento WHERE IdAdiantamento = '7198'
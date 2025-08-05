USE [ALTERDATA_ERP]
GO

SELECT StPedidoDeVenda, * FROM DBO.PedidoDeVenda
WHERE CdChamada='224732'
GO

UPDATE DBO.PedidoDeVenda
SET StPedidoDeVenda='T',
DtCancelamento=NULL,
IdUsuarioCancelamento=NULL
WHERE IdPedidoDeVenda='00A00053A7'

SELECT StPedidoDeVendaItem, * FROM DBO.PedidoDeVendaItem
WHERE IdPedidoDeVenda='00A00053A7'
GO

UPDATE DBO.PedidoDeVendaItem
SET StPedidoDeVendaItem='T', QtPedida='20',QtAtendida='20'
WHERE IdPedidoDeVendaItem IN ('00A0006TNP')
GO
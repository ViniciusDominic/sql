/* QUERY PARA CONFERÊNCIA DOS PEDIDO DE COMPRA SEM NF-E VINCULADA */

USE [ALTERDATA_ERP]
GO

SELECT 
t1.CdChamada AS CODIGO_PEDIDO,
t1.CdEmpresa AS EMPRESA_PEDIDO,
t1.StPedidoDeCompra AS STATUS_PEDIDO,
t2.StAntecipado AS PAGAMENTO_ANTECIPADO,
t1.DtEmissao AS DATA_DO_PEDIDO
FROM dbo.PedidoDeCompra t1
INNER JOIN dbo.PedidoDeCompraPagamento t2 on t2.IdPedidoDeCompra=t1.IdPedidoDeCompra

WHERE t1.IdPedidoDeCompra NOT IN  ( SELECT	t1.IdPedidoDeCompra
								FROM	dbo.PedidoDeCompra t1
										INNER JOIN dbo.PedidoDeCompraItem t2 on t2.IdPedidoDeCompra=t1.IdPedidoDeCompra
										INNER JOIN dbo.PedidoDeCompraItem_DocumentoItem t3 on t3.IdPedidoDeCompra=t2.IdPedidoDeCompra
										INNER JOIN dbo.DocumentoItem t4 on t4.IdDocumentoItem=t3.IdDocumentoItem
										INNER JOIN dbo.Documento t5 on t5.IdDocumento=t4.IdDocumento

								WHERE	T1.IdUsuario='00A000006I' AND t1.DtEmissao >='2024-01-01'
								)
	AND IdUsuario='00A000006I' 
	AND DtEmissao >='2024-01-01'
	ORDER BY DATA_DO_PEDIDO
/* QUERY PARA CONFERÊNCIA E EXCLUSÃO DE LIXO DE BASE DOS PEDIDOS DE VENDA*/

USE [ALTERDATA_ERP]
GO

SELECT * FROM DBO.Representante_PedidoDeVendaIte
SELECT * FROM DBO.PedidoDeVendaHistorico
SELECT * FROM DBO.PedidoDeVendaItem_DocumentoItem
--SELECT * FROM DBO.PedidoDeVendaIntegracao--
--SELECT * FROM DBO.PedidoDeVendaItem_ComplQuantIG--
--SELECT * FROM DBO.PedidoDeVendaItemEmpresa--
--SELECT * FROM DBO.PedidoDeVendaLog--
--SELECT * FROM DBO.PedidoDeVendaPagamento--

SELECT * FROM DBO.Representante_PedidoDeVendaIte
WHERE IdPedidoDeVendaItem NOT IN ( SELECT IdPedidoDeVendaItem FROM dbo.PedidoDeVendaItem ) --2.433--

SELECT * FROM DBO.PedidoDeVendaHistorico
WHERE IdPedidoDeVenda NOT IN ( SELECT IdPedidoDeVenda FROM dbo.PedidoDeVenda ) --609 rows--

SELECT * FROM DBO.PedidoDeVendaItem_DocumentoItem
WHERE IdPedidoDeVenda NOT IN ( SELECT IdPedidoDeVenda FROM dbo.PedidoDeVenda ) --8 rows--


SELECT @@VERSION AS [VERSÃO],
SYSDATETIME() AS [DATA]

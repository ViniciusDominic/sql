USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.PedidoDeCompra /* PEGAR O ID DO PEDIDO DE COMPRA */
WHERE cdchamada='062112'
AND CdEmpresa='16'
GO

SELECT * FROM dbo.Pessoa
WHERE CdCPF_CGC='05.570.714/0008-25'

UPDATE dbo.PedidoDeCompra
SET  IdpessoaFornecedor='00A0000II9'
WHERE IdPedidoDeCompra='00A0002647'
GO
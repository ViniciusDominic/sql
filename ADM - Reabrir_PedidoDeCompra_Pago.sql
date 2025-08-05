USE [ALTERDATA_ERP]
GO

/* PASSO 1 */

/* COLETAR AS INFORMA��ES DO PEDIDO DE COMPRA */

SELECT * FROM dbo.PedidoDeCompra where CdChamada = '042003' -- CONSULTAR O PEDIDO DE COMPRA PELO CDCHAMADA E COLETAR SEU ID --
SELECT * FROM dbo.PedidoDeCompraPagamento where IdPedidoDeCompra = '00A0001I54' -- CONSULTAR O ID DE COMPRA PAGAMENTO ATRAV�S DO ID PEDIDO DE COMPRA --

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* PASSO 2 */

/* DELETAR O IDAPAGAR EXCLU�DO CASO EXISTA ALGUM REGISTRO */

SELECT * FROM dbo.apagar where NrTitulo like '042003-%' -- CONSULTAR SE EXISTE T�TULO APGAR EXCL�DO E DELETAR --
GO

DELETE dbo.APagar
WHERE IdAPagar = '00A0004A6C'

DELETE dbo.APagarItem
WHERE IdAPagar = '00A0004A6C'
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------

/* PASSO 3 */

/* COLETAR OS DADOS DOS CAMPOS NmEntidadeOrigem='PedidoDeCompraPagamento' e IdEntidadeOrigem='00A000124U' PARA REFAZER O V�NCULO AP�S EDI��O DO PEDIDO */

SELECT * FROM dbo.apagar -- CONSULTAR T�TULO PAGO DO PEDIDO DE COMPRA --
WHERE IdAPagar='00A0004KLG'
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* PASSO 4 */

/* DESVINCULAR O T�TULO PAGO DO PEDIDO */

UPDATE dbo.apagar -- APAGAR O IdEntidadeOrigem e o NmEntidadeOrigem do t�tulo do pedido de compra --
SET IdEntidadeOrigem = null, NmEntidadeOrigem = null
WHERE IdAPagar = '00A0004KLG'
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* PASSO 5 */

/* REABRIR O PEDIDO DE COMPRA */

SELECT * FROM dbo.PedidoDeCompra /* PEGAR O ID DO PEDIDO DE COMPRA */
WHERE cdchamada='042003'
AND CdEmpresa='16'
GO

SELECT * FROM dbo.PedidoDeCompraItem /* PEGAR O ID DO PEDIDO DE COMPRA */
WHERE IdPedidoDeCompra='00A0001I54'
GO

UPDATE dbo.PedidoDeCompra
SET StPedidoDeCompra='A'
WHERE IdPedidoDeCompra='00A0001I54'
GO

UPDATE dbo.PedidoDeCompraItem
SET StPedidoDeCompraItem='A'
WHERE IdPedidoDeCompra='00A0001I54'
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* PASSO 6 */

--DELETAR T�TULO DUPLICADO P�S EDI��O DO PEDIDO--

SELECT * FROM dbo.apagar where NrTitulo like '042003-%'
GO

DELETE FROM dbo.APagarItem WHERE IdAPagar IN ('00A0004KKC','00A0004MXV','00A0004MXW')

DELETE FROM dbo.apagar WHERE IdAPagar IN ('00A0004KKC','00A0004MXV','00A0004MXW')
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* PASSO 7 */

/*VINCULAR O T�TULO DE VOLTA AO PEDIDO DE COMPRA*/

UPDATE dbo.apagar
SET IdEntidadeOrigem = '00A000124U', NmEntidadeOrigem = 'PedidoDeCompraPagamento'
WHERE IdAPagar = '00A0004KLG'
GO

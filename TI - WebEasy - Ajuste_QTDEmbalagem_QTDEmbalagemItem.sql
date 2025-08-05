USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.CodigoProduto WHERE CdChamada = '000945' -- IdProduto=00A00002WJ para exemplo --

SELECT QtEmbalagem,* FROM dbo.produto WHERE IdProduto = '00A00002WJ'

SELECT QtEmbalagem,QtEmbalagemItem,IdUnidadeEmbalagem,* FROM dbo.PedidoDeVendaItem 

SELECT	QtEmbalagem, --calculo ( QtPedida / QtEmbalagem )
		QtPedida, --quantidade item pedido
		QtEmbalagemItem, -- iqual a coluna QtEmbalagem do cadastro de produto
		IdUnidadeEmbalagem, -- iqual a coluna IdUnidadeEmbalagem, do cadastro de produto
		* 

FROM dbo.PedidoDeVendaItem 


UPDATE dbo.PedidoDeVendaItem 
SET QtEmbalagem = t2.QtEmbalagem,
	QtEmbalagemItem = QtPedida / t2.QtEmbalagem ,
	IdUnidadeEmbalagem = t2.IdUnidadeEmbalagem FROM	dbo.PedidoDeVendaItem t1
												INNER JOIN dbo.produto t2 ON t1.IdProduto = t2.IdProduto
												INNER JOIN dbo.pedidodevenda t3 ON t3.IdPedidoDeVenda = t1.IdPedidoDeVenda
												WHERE (t1.QtEmbalagem = '0' OR t1.QtEmbalagem is null)
														AND t3.DtEmissao >= '2023-12-10'



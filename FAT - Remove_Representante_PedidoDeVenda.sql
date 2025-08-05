/* QUERY PARA REMOÇÃO DE REPRESENTANTE A MAIS EM PEDIDO DE VENDA */

USE [ALTERDATA_ERP]
GO

/* REMOVER REPRESENTANTE DO PEDIDO DE VENDA */

SELECT * FROM dbo.PedidoDeVenda
WHERE CdChamada='211864'

SELECT * FROM dbo.PedidoDeVendaItem
WHERE IdPedidoDeVenda='00A0004NHT'

SELECT * FROM dbo.Representante_PedidoDeVendaIte
WHERE IdPedidoDeVendaItem IN ('00A0006BG8',
'00A0006BG9')

DELETE dbo.Representante_PedidoDeVendaIte
WHERE IdPedidoDeVendaItem IN ('00A0006BG8')
AND IdPessoaRepresentante='00A000027A'

/* REMOVER REPRESENTANTE DO DOCUMENTO */

SELECT * FROM dbo.Documento
WHERE NrDocumento='132069'

SELECT * FROM dbo.DocumentoItem
WHERE IdDocumento='00A0007322'

SELECT * FROM dbo.DocumentoItemValores
WHERE IdDocumento='00A0007322'

SELECT * FROM dbo.DocumentoItemRepasse
WHERE IdDocumentoItem IN ('00A000FKV2')

DELETE dbo.DocumentoItemRepasse
WHERE IdDocumentoItem IN ('00A000FKV2')
AND AlRepasseDuplicata='5.5'

/* REMOVER REPRESENTANTE DO TÍTULO ARECEBER */

SELECT * FROM DBO.AReceber
WHERE IdPessoa='00A0000QIS'

SELECT * FROM DBO.AReceberItem
WHERE IdAReceber='00A0005LGF'

SELECT * FROM DBO.AReceberItem_Pessoa
WHERE IdAReceberItem='00A00079HF'

DELETE DBO.AReceberItem_Pessoa
WHERE IdAReceberItem='00A00079HF'
AND IdPessoa='00A000027A'
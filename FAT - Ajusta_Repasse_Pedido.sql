/* QUERY PARA AJUSTE DO REPRESENTANTE DE REPASSE DOS PEDIDOS */

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

SELECT @@VERSION AS [VERSÃO],
SYSDATETIME() AS [DATA]


/* QUERY PARA DESVINCULAR E EXCLUIR PEDIDOS DUPLICADOS */

SELECT IdEntidadeOrigem, * FROM NSYS.orcamento
WHERE orcamento_id='42915'

SELECT IdEntidadeOrigem, * FROM NSYS.orcamento
WHERE orcamento_id='43075'

UPDATE NSYS.orcamento -- ALTERAR O CÓDIGO DE CHAMADA DO DESTINO PARA O DO PEDIDO QUE FICARÁ ATIVO NO ERP --
SET CdChamadaDestino='228189'
WHERE orcamento_id='38949'

select * from dbo.pedidodevenda
where CdChamada in ('220506', '220507')

delete dbo.PedidoDeVendaItem -- DELETAR O ID DO PEDIDO QUE FOI CANCELADO NO ERP --
where IdPedidoDeVendaItem='00A00056VJ'
and IdPedidoDeVenda='00A0003ZSB'

SELECT @@VERSION AS [VERSÃO],
SYSDATETIME() AS [DATA]
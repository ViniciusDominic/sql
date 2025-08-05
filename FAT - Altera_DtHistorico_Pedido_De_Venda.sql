/* QUERY PARA ALTERAR O DtHistorico do pedido de venda */

SELECT * FROM dbo.PedidoDeVenda
WHERE CdChamada='196572'

-- PAUSAR OS GATILHOS DA TABELA ANTES DO UPDATE --

UPDATE dbo.PedidoDeVendaHistorico
SET DtHistorico='2024-05-29 00:00:00.000'
WHERE IdPedidoDeVenda='00A0005BOE'
select * from dbo.pedidodevenda
where cdchamada='139774'

select * from dbo.PedidoDeVendaItem
where IdPedidoDeVenda='00A00031V5'

UPDATE dbo.PedidoDeVendaItem
set IdSetorSaida='00A000003M'
where IdPedidoDeVendaItem='00A0003XB0'

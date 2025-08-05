select	t1.CdChamada,
		t4.orcamento_id

from	dbo.PedidoDeVenda t1
		inner join dbo.PedidoDeVendaItem t2 on t2.IdPedidoDeVenda = t1.IdPedidoDeVenda
		inner join dbo.Representante_PedidoDeVendaIte t3 on t3.IdPedidoDeVendaItem = t2.IdPedidoDeVendaItem
		inner join nsys.orcamento t4 on t4.CdChamadaDestino = t1.CdChamada
		inner join weasy.OrcamentoRepresentante t5 on t5.IdOrcamento = t4.orcamento_id

where t5.IdPessoaRepresentante <> t3.IdPessoaRepresentante
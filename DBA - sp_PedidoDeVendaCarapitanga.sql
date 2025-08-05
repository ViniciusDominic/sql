USE [ALTERDATA_ERP]
GO
/** Object:  StoredProcedure [dbo].[sp_PedidoDeVendaCarapitanga]    Script Date: 27/02/2025 09:58:39 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER Procedure [dbo].[sp_PedidoDeVendaCarapitanga] As
Begin

update dbo.PedidoDeVendaItem 
set IdTipoMovCobranca = t3.IdTipoMovCobranca	from	dbo.PedidoDeVenda t1 
												inner join dbo.PedidoDeVendaItem t2 on t2.IdPedidoDeVenda = t1.IdPedidoDeVenda
												inner join dbo.TipoMovCobranca t3 on (t3.CdEmpresa = t1.CdEmpresa) and t3.TpMesReferencia = 'P'
where (t2.IdTipoMovCobranca is null or t2.IdTipoMovCobranca = '') and t2.StPedidoDeVendaItem in ('A','L','P');

update dbo.PedidoDeVendaItem set VlPesoBruto = (QtPedida * t2.VlPesoBruto), VlPesoLiquido = (QtPedida * t2.VlPesoLiquido) from dbo.PedidoDeVendaItem t1 inner join dbo.produto t2 on t1.idproduto = t2.IdProduto 
where t1.VlPesoLiquido <> (QtPedida * t2.VlPesoLiquido) and t1.IdPedidoDeVenda in (select IdPedidoDeVenda from dbo.PedidoDeVenda where CdEmpresa in ('7','14','16','22') and StPedidoDeVenda in ('A','L','P'));

--update dbo.PedidoDeVenda set DsObservacaoDocumento = null where DsObservacaoDocumento like 'org.mozilla.javascript.%';
--update dbo.PedidoDeVenda set IdPessoaTransportador = null where IdPessoaTransportador not like '00A0%';

update dbo.pedidodevenda set IdOperacao = '00A000002M' where cdempresa in ('7','14','16','22') and IdPrazo = '00A0000021' and IdOperacao <> '00A000002M' and DtEmissao >= '2024-05-28';

update dbo.pedidodevenda set idpessoatransportador = null where cdempresa = '22' and idpessoatransportador = '8990'  and stpedidodevenda in ('A','L','P');

update dbo.pedidodevenda set TpIndAtendimentoPresencial = '2' where dtemissao >= '2021-09-01' and TpIndAtendimentoPresencial <> '2' and stpedidodevenda <> 'T';

update dbo.pedidodevenda set tpindicativointermediador = '0' where TpIndAtendimentoPresencial <> '1' and stpedidodevenda <> 'T' and tpindicativointermediador is null;

--update dbo.PedidoDeVendaitem set IdInformacaoGeral1 = '00A0000108' where IdPreco = '00A000001H' and IdInformacaoGeral1 is null;
--update dbo.PedidoDeVendaitem set IdInformacaoGeral1 = '00A0000109' where IdPreco <> '00A000001H' and IdInformacaoGeral1 is null;

 update dbo.PedidoDeVenda 
 set IdMensagem3 = '00A0000041', IdMeioContato = '00A000002Y', DsEspecie = 'SACO'
 from dbo.PedidoDeVenda t1 inner join dbo.PedidoDeVendaitem t2 on t2.IdPedidoDeVenda = t1.IdPedidoDeVenda
 where t1.CdEmpresa = '30' and t1.StPedidoDeVenda not in ('T','X','C') and t1.IdMensagem3 is null and (t2.VlDesoneracaoICMS <> '0' or t2.VlDesoneracaoICMS is not null);

update dbo.PedidoDeVenda set IdMensagem4 = '00A0000035' where CdEmpresa = '30' and StPedidoDeVenda not in ('L','T','X','P','C') and IdMensagem4 is null;

update dbo.PedidoDeVenda set TpFretePorConta = 'E' where TpFretePorConta = 'D' and cdempresa in ('14','22') and StPedidoDeVenda in ('A','L','P');

update dbo.PedidoDeVenda set CdEmpresaFinanceiro = '1'
where	idoperacao in (select idoperacao from dbo.operacao where StAtualizaFinanceiro = 'S')
		and CdEmpresaFinanceiro <> '1' and CdEmpresa in ('1','2','3','4','5','6','7','8','16','19','20','22','27','29','31','32')	and StPedidoDeVenda in ('A','L','P');


/* COMANDO DE AJUSTE PARA OS PEDIDOS DO WEBEASY NOS CAMPOS QTDEMBALAGEM E QTDEMBALAGEMITEM DO PEDIDO DE VENDA */

update dbo.PedidoDeVendaItem 
set QtEmbalagem = t2.QtEmbalagem,
	QtEmbalagemItem = QtPedida / t2.QtEmbalagem ,
	IdUnidadeEmbalagem = t2.IdUnidadeEmbalagem from	dbo.PedidoDeVendaItem t1
												inner join dbo.produto t2 on t1.IdProduto = t2.IdProduto
												inner join dbo.pedidodevenda t3 on t3.IdPedidoDeVenda = t1.IdPedidoDeVenda
												where (t1.QtEmbalagem = '0' or t1.QtEmbalagem is null)
														and t3.CdEmpresa in ('7','8','14','16','19','20','22')
														and t3.DtEmissao >= '2023-12-10'
														and t2.IdGrupoProduto in ('00A000002N','00A000002P','00A000002Q','00A000002S','00A000001H')
														and t3.StPedidoDeVenda in ('A','L','P')

/* COMANDO PARA AJUSTAR QUANTIDADE DE EMBALAGEM DOS ITENS DA EMPRESA 30 APÓS O SISTEMA SELECIONAR OS LOTES LOGO APÓS A LIBERAÇÃO DO PEDIDO */

update	dbo.PedidoDeVendaItem 
set		QtEmbalagemitem = (t2.QtPedida * t2.QtEmbalagem)
		from	dbo.PedidoDeVenda t1
				inner join dbo.PedidoDeVendaItem t2 on t1.IdPedidoDeVenda = t2.IdPedidoDeVenda
				inner join dbo.produto t3 on t2.idproduto = t3.IdProduto 
		where	t1.CdEmpresa = '30' and t2.QtEmbalagemitem <> (t2.QtPedida * t2.QtEmbalagem) and t1.StPedidoDeVenda in ('A','L');

/* COMANDO PARA AJUSTAR PESO BRUTO E PESO LIQUIDO DOS ITENS DA EMPRESA 30 APÓS O SISTEMA SELECIONAR OS LOTES LOGO APÓS A LIBERAÇÃO DO PEDIDO */

update dbo.PedidoDeVendaItem 
set VlPesoBruto = (QtPedida * t3.VlPesoBruto), VlPesoLiquido = (QtPedida * t3.VlPesoLiquido) 
			from	dbo.PedidoDeVenda t1
					inner join dbo.PedidoDeVendaItem t2 on t2.IdPedidoDeVenda = t1.IdPedidoDeVenda
					inner join dbo.produto t3 on t2.idproduto = t3.IdProduto 
			where	t1.CdEmpresa = '30' and t2.VlPesoLiquido <> (t2.QtPedida * t3.VlPesoLiquido) and t3.IdGrupoProduto = '00A000002F' and t1.DtEmissao > '2024-03-01';


/* COMANDO PARA INSERIR MENSAGENS DE ACORDO COM A EMPRESA E CALCULO_DE_ICMS DO PRODUTO*/

update dbo.PedidoDeVenda
set IdMensagem1 = '00A000002C'
			from	dbo.PedidoDeVenda t1
					inner join dbo.PedidoDeVendaItem t2 on t2.IdPedidoDeVenda = t1.IdPedidoDeVenda
					inner join dbo.produto t3 on t2.idproduto = t3.IdProduto 
			where	t1.CdEmpresa = '22' and t1.DtEmissao > '2024-04-01' and IdMensagem1 is null and t3.IdCalculoICMS = '00A0000003' and t1.StPedidoDeVenda in ('A','L','P') 
					and t2.IdProduto not in ('00A00047VS','00A000410U');

update dbo.PedidoDeVenda
set IdMensagem2 = '00A000002I'
			from	dbo.PedidoDeVenda t1
					inner join dbo.PedidoDeVendaItem t2 on t2.IdPedidoDeVenda = t1.IdPedidoDeVenda
					inner join dbo.produto t3 on t2.idproduto = t3.IdProduto 
			where	t1.CdEmpresa = '22' and t1.DtEmissao > '2024-04-01' and IdMensagem2 is null and t3.IdCalculoICMS in ('00A0000009','00A000000C') and t1.StPedidoDeVenda in ('A','L','P');

update dbo.PedidoDeVenda
set IdMensagem3 = '00A0000047'
			from	dbo.PedidoDeVenda t1
					inner join dbo.PedidoDeVendaItem t2 on t2.IdPedidoDeVenda = t1.IdPedidoDeVenda
					inner join dbo.produto t3 on t2.idproduto = t3.IdProduto 
			where	t1.CdEmpresa = '22' and t1.DtEmissao > '2024-04-01' and IdMensagem3 is null and t2.IdProduto in ('00A00047VS','00A000410U') and t1.StPedidoDeVenda in ('A','L','P');

update dbo.PedidoDeVenda
set IdMensagem1 = '00A000001L', IdMensagem2 = '00A000002K'
			from	dbo.PedidoDeVenda t1
					inner join dbo.PedidoDeVendaItem t2 on t2.IdPedidoDeVenda = t1.IdPedidoDeVenda
					inner join dbo.produto t3 on t2.idproduto = t3.IdProduto 
			where	t1.CdEmpresa = '7' and t1.DtEmissao > '2024-03-01' and IdMensagem1 is null and t3.IdCalculoICMS in ('00A0000003') and t1.StPedidoDeVenda in ('A','L','P') and t2.IdCFOP = '5.101';

--Cadastrar transportador 021661 - 20.009.878/0003-67 - TAFF BRASIL TRANSPORTES LTDA nos pedidos do setores da MG.
update dbo.pedidodevenda set idpessoatransportador = '00A0000ORS' 
where cdempresa = '16' and (idpessoatransportador is null or idpessoatransportador = '') and stpedidodevenda in ('A','L','P') and IdSetor = '00A000005R' and DtEmissao >= '2024-05-13';

--Cadastrar transportador 005437 -30.900.159/0001-23 - ALAN PEREIRA DE CARVALHO 02866225562 nos pedidos do setores da BA.
update dbo.pedidodevenda set idpessoatransportador = '00A00005CG' 
where cdempresa in ('14','16') and (idpessoatransportador is null or idpessoatransportador = '') and stpedidodevenda in ('A','L','P') and IdSetor in ('00A000003L','00A0000047') and DtEmissao >= '2024-07-01';

--Cadastrar transportador 007060 - 28.216.024/0001-00 - IMG TRANSPORTES EIRELI - KANEJO SP nos pedidos do setores da SP.
update dbo.pedidodevenda set idpessoatransportador = '00A000074C' 
where cdempresa in ('16','22') and (idpessoatransportador is null or idpessoatransportador = '') and stpedidodevenda in ('A','L','P') and IdSetor in ('00A000003M','00A000005C') and DtEmissao >= '2024-07-01';

--Ajuste para retirar pedido de Programação/Ressuprimento do painel do modulo FatLiberaPedido
--update dbo.PedidoDeVendaHistorico
--set		TpPedidoDeVenda = 'M' from	dbo.PedidoDeVenda t1
--									inner join dbo.PedidoDeVendaHistorico t2 on t1.IdPedidoDeVenda = t2.IdPedidoDeVenda
--where t1.IdOperacao in ('00A000007E','00A000007F') and t1.IdOperacaoOE in ('00A000007D','00A000007G') and StPedidoDeVenda in ('A') and t2.TpPedidoDeVenda <> 'M';

--Ajuste para colocar pedido de Programação/Ressuprimento do painel do modulo FatLiberaPedido
update dbo.PedidoDeVendaHistorico
set		TpPedidoDeVenda = 'P' from	dbo.PedidoDeVenda t1
									inner join dbo.PedidoDeVendaHistorico t2 on t1.IdPedidoDeVenda = t2.IdPedidoDeVenda
where t1.IdOperacao not in ('00A000007E','00A000007F') and t1.IdOperacaoOE in ('00A000007D','00A000007G') and StPedidoDeVenda in ('L','P') and t2.TpPedidoDeVenda <> 'P';

update dbo.PedidoDeVendaHistorico
set		TpPedidoDeVenda = 'P' from	dbo.PedidoDeVenda t1
									inner join dbo.PedidoDeVendaHistorico t2 on t1.IdPedidoDeVenda = t2.IdPedidoDeVenda
where t1.IdOperacaoOE in ('00A000007D','00A000007G') and StPedidoDeVenda in ('L','P') and t2.TpPedidoDeVenda <> 'P';

update dbo.PedidoDeVenda set TpPedidoDeVenda = 'P' where TpPedidoDeVenda = 'M';

--Cadastrar transportador 010799 - 37.240.286/0001-92 - MARCOS HENRIQUE UNO BORTOLOTO nos pedidos do setores da INT SP.
update dbo.pedidodevenda set idpessoatransportador = '00A0000C6C' 
where cdempresa in ('16','22') and (idpessoatransportador is null or idpessoatransportador = '' or idpessoatransportador = '00A000074C' ) and stpedidodevenda in ('A','L','P') and IdSetor in ('00A0000094','00A0000096') and DtEmissao >= '2024-10-01';

--Comando para ajustar informações tributarias dos itens dos pedidos cadastrados pelo Webeasy na empresa 30.
update dbo.PedidoDeVendaItem
set		AlICMS = t5.AlICMS, VlICMS = (((t2.VlItem * (1 - (t5.AlReducaoBaseICMS/100))) * t5.AlICMS)/100), CdSituacaoTributaria = t5.CdSituacaoTributariaReducaoICMS, VlBaseICMS = (t2.VlItem * (1 - (t5.AlReducaoBaseICMS/100))),
		CdSituacaoTributariaPIS = '01', VlBasePIS = (t2.VlItem - ((t2.VlItem * t5.AlICMS ) / 100)), AlPIS = '1.65', VlPIS = ((t2.VlItem - ((t2.VlItem * t5.AlICMS ) / 100)) * '0.0165'),
		CdSituacaoTributariaCOFINS = '01', VlBaseCOFINS = (t2.VlItem - ((t2.VlItem * t5.AlICMS ) / 100)), AlCOFINS = '7.60', VlCOFINS = ((t2.VlItem - ((t2.VlItem * t5.AlICMS ) / 100)) * '0.076'),
		TpDesoneracaoICMS = t5.TpDesoneracaoICMS, VlDesoneracaoICMS = ((t2.VlItem * t5.AlICMS ) / 100)- (((t2.VlItem *'0.40') * t5.AlICMS)/100),
		VlBaseFCP = null, VlBaseIPI = null, TpDesconsideracaoItem = 'N'

		from dbo.PedidoDeVenda t1 
			inner join dbo.PedidoDeVendaItem t2 on t2.IdPedidoDeVenda = t1.IdPedidoDeVenda
			inner join dbo.Produto t3 on t3.IdProduto = t2.IdProduto
			inner join dbo.PessoaEndereco t4 on t4.IdPessoa = t1.IdPessoaCliente and t4.CdEndereco = t1.CdEnderecoPrincipal
			inner join dbo.CalculoICMS_UF t5 on t5.IdCalculoICMS = t3.IdCalculoICMS and t5.IdCalculoICMS = '00A000000H' and t5.IdUFDestino = t4.IdUF and t5.IdCFOP = t2.IdCFOP

where	t1.CdEmpresa = '30' and t1.DtEmissao >= '2025-01-01' and StPedidoDeVenda in ('A','L') and (VlBaseFCP is not null or VlBaseFCP = '')

--Ajustar Natureza de lançamento da empresa 30 Caso venha errado do Webeasy.
update dbo.PedidoDeVendaPagamento set IdFormaPagamento = '00A000002K', IdNaturezaLancamento = '00A00000CR'
where IdPedidoDeVenda in (select IdPedidoDeVenda from dbo.PedidoDeVenda where dtemissao > '2025-02-01' and CdEmpresa in ('30'))
		and IdNaturezaLancamento <> '00A00000CR';

--Ajustar FormaDePamento da empresa 30 Caso venha errado do Webeasy.
update dbo.PedidoDeVendaPagamento set IdFormaPagamento = '00A000002K' 
where IdPedidoDeVenda in (select IdPedidoDeVenda from dbo.PedidoDeVenda where dtemissao > '2025-02-01' and CdEmpresa in ('30'))
		and IdFormaPagamento not in ('00A000002K','00A000002M');

--Ajustar FormaDePamento das empresas 7,14,16 e 22 Caso venha errado do Webeasy.
update dbo.PedidoDeVendaPagamento set IdFormaPagamento = '00A000000N' 
where IdPedidoDeVenda in (select IdPedidoDeVenda from dbo.PedidoDeVenda where dtemissao > '2025-02-01' and CdEmpresa in ('7','14','16','22'))
		and IdFormaPagamento not in ('00A000000N','00A000000P') and IdNaturezaLancamento = '00A0000004'

--Ajustar DsVolumes dos pedidos de venda na aba transportador--
		
		UPDATE dbo.PedidoDeVenda
SET DsVolumes = REPLACE (DsVolumes,'.0','')
WHERE DsVolumes LIKE '%.0%'
AND DtEmissao >='2025-02-22'

End
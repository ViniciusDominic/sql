

--Caracteristica de filtro.

select * from dbo.CaracteristicaPessoa

00A000006W - REPRESENTANTE PJ
00A000006X - REPRESENTANTE PF

--Script para geração de comissão por produto, representantes PJ.

select	t1.CdEmpresa, t5.NmCurto, t1.NmTitulo,
		t1.NrTitulo,  t1.DtEmissao,t1.DtVencimento,
		t1.DtBaixa, 
		--t1.VlTitulo, 
		t4.NmProduto,
		t6.VlItemAtualizadoDtBaixa as VlBaseRepasse,
		t3.AlRepasse, 
		(t6.VlItemAtualizadoDtBaixa*t3.AlRepasse)/100 as VlRepasse

from	dbo.areceber t1
		inner join dbo.AReceberItem t2 on t1.IdAReceber = t2.IdAReceber
		inner join dbo.AReceberItem_Pessoa t3 on t2.IdAReceberitem = t3.IdAReceberItem
		left join dbo.produto t4 on t2.IdProduto = t4.IdProduto
		inner join dbo.pessoa t5 on t5.IdPessoa = t3.IdPessoa
		inner join dbo.AReceberItemBaixa t6 on t2.IdAReceberItem = t6.IdAReceberItem

where	t6.IdTipoBaixa in ('00A0000001','00A0000003') and
		t1.DtBaixa BETWEEN '2022-11-01' and '2022-11-30' 
		--and t5.IdPessoa in (select IdPessoa from dbo.Pessoa_CaracteristicaPessoa where IdCaracteristicaPessoa = '00A000006W')
		and t5.IdPessoa in ('00A000023B','00A000021J')
order by t5.NmCurto asc
		--EDUVIRGES BRAZ = 00A000023B
		--ANDRE LUIS = 00A000021J


---------------------------------------------------------------------------------------------
--Script para geração de comissão por titulo, representantes CLT.

select	t1.CdEmpresa, t5.NmCurto, t1.NmTitulo,
		t1.NrTitulo,  t1.DtEmissao,t1.DtVencimento,
		t1.DtBaixa, t1.VlTitulo,
		sum ((t6.VlItemAtualizadoDtBaixa*t3.AlRepasse)/100/t1.VlTitulo)*100 as AlRepasse,
		sum (t6.VlItemAtualizadoDtBaixa*t3.AlRepasse)/100 as VlRepasse
from	dbo.areceber t1
		inner join dbo.AReceberItem t2 on t1.IdAReceber = t2.IdAReceber
		inner join dbo.AReceberItem_Pessoa t3 on t2.IdAReceberitem = t3.IdAReceberItem
		inner join dbo.pessoa t5 on t5.IdPessoa = t3.IdPessoa
		inner join dbo.AReceberItemBaixa t6 on t2.IdAReceberItem = t6.IdAReceberItem
where	t6.IdTipoBaixa in ('00A0000001','00A0000003') and
		t1.DtBaixa BETWEEN '2022-10-21' and '2022-11-20' 
		and t5.IdPessoa in (select IdPessoa from dbo.Pessoa_CaracteristicaPessoa where IdCaracteristicaPessoa = '00A000006X' and IdPessoa not in ('00A000023B','00A000021J'))
		--and t5.IdPessoa = '00A00006C9' --Representante ELEN GUIMARAES LS

group by t1.CdEmpresa, t5.NmCurto, t1.NmTitulo, t1.NrTitulo, t1.DtEmissao, t1.DtVencimento, t1.DtBaixa, t1.VlTitulo
order by t5.NmCurto

---------------------------------------------------------------------------------------------






select * from dbo.AReceber where NrTitulo = 'RENEG46891-5/6' 00A0002WKX










select * from dbo.PedidoDeVenda
where cdchamada='186149'

select IdDocumento, StNFEletronica, * from dbo.lotedoc
where StNFEletronica='E'
and DtEmissao='2024-02-23 00:00:00.000'

update dbo.lotedoc
set StNFEletronica='A'
where iddocumento in ('00A0005ILR',
'00A0005ILS',
'00A0005ILT')

select * from dbo.LoteDoc
where nrdocumento='14679'

select * from dbo.LoteDocPagamento
where iddocumento='00A0006AV9'

update dbo.LoteDocPagamento
set VlTitulo='3734.08'
where IdDocumentoPagamento='00A000CWGR'
and IdDocumento='00A0006AV9'
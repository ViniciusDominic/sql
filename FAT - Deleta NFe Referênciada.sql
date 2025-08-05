select * from dbo.LoteDoc
where DtReferencia='2025-02-21 00:00:00.000'
order by DtReferencia desc


select * from dbo.Documentoreferenciado
where IdDocumento='00A0007A47'

delete dbo.Documentoreferenciado
where IdDocumento='00A0007A47'
and IdDocumentoReferenciado='19173'



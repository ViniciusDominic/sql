USE [ALTERDATA_ERP]
GO

SELECT * FROM DBO.LoteDoc
WHERE DtReferencia='2023-04-20 00:00:00.000'
AND IdDocumento='00A00043ID'

SELECT * FROM dbo.DocumentoReferenciado
WHERE IdDocumento='00A00043ID'

DELETE dbo.DocumentoReferenciado
where IdDocumento='00A00043ID'
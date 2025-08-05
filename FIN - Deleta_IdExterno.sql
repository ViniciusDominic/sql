USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.AReceber
WHERE NrTitulo in ('64479-1')
AND CdEmpresa='16'
GO


SELECT IdExterno, * from dbo.HistoricoCarteira
WHERE IdAReceber in ('00A0002U9Q')
GO

UPDATE dbo.HistoricoCarteira
SET IdExterno=NULL
WHERE IdAReceber in ('00A0002U9Q')
GO
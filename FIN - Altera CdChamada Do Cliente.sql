USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.Pessoa
WHERE CdChamada='017369'
GO

SELECT * FROM dbo.Pessoa
ORDER BY CdChamada DESC
GO

UPDATE dbo.Pessoa
SET CdChamada='017387'
WHERE IdPessoa='00A0000KH3'
GO
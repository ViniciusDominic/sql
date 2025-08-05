USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.TipoBaixa
WHERE IdTipoBaixa='00A0000013'

UPDATE dbo.TipoBaixa
SET StGeraComissao='S'
WHERE IdTipoBaixa='00A0000013'
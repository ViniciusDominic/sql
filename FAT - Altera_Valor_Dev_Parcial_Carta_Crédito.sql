/* AJUSTA VALOR DA CARTA DE CR�DITO GERADA PELO M�DULO DE DEVOLU��O PARCIAL */

USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.LoteDocDevolucao
WHERE CdChamada='000894'

SELECT * FROM dbo.LoteDocDevolucaoItem
WHERE IdLoteDocDevolucao='00A00000RP'

UPDATE dbo.LoteDocDevolucao
SET VlDevolucao='4860.00', VlCartaCredito='4860.00'
WHERE IdLoteDocDevolucao='00A00000RP'

USE [ALTERDATA_ERP]
GO

SELECT NrTitulo, * from dbo.APagar 
WHERE NrTitulo='RD-15'-- TÍTULO CORRETO --
AND CdEmpresa='17'
GO


UPDATE dbo.APagar
SET NmEntidadeOrigem = NULL,
IdEntidadeOrigem = NULL
WHERE IdAPagar = '00A00053HQ' -- UTILIZAR O iDAReceber 
GO

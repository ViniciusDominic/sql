/* QUERY PARA ALTERA��O DA DATA DE EMISS�O DO T�TULO APAGAR */

SELECT Dtemissao, DtReferencia, * FROM dbo.APagar
WHERE NrTitulo IN ('1105')
AND CdEmpresa='16'
GO

UPDATE dbo.APagar
SET DtEmissao='2025-06-30 00:00:00.000', DtReferencia='2025-06-30 00:00:00.000'
WHERE idapagar in ('00A0007OSY')
AND CdEmpresa='16'
GO

SELECT @@VERSION AS [VERS�O],
SYSDATETIME() AS [DATA]
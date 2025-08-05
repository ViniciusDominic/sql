/* QUERY PARA ALTERAÇÃO DA DATA DE EMISSÃO DO TÍTULO APAGAR */

SELECT Dtemissao, DtReferencia, * FROM dbo.APagar
WHERE NrTitulo IN ('1105')
AND CdEmpresa='16'
GO

UPDATE dbo.APagar
SET DtEmissao='2025-06-30 00:00:00.000', DtReferencia='2025-06-30 00:00:00.000'
WHERE idapagar in ('00A0007OSY')
AND CdEmpresa='16'
GO

SELECT @@VERSION AS [VERSÃO],
SYSDATETIME() AS [DATA]
/* QUERY PARA ATUALIZAÇÃO DAS INFORMAÇÕES DE ENCERRAMENTO DO MDF-E */

USE [ALTERDATA_ERP]
GO

SELECT StEncerramento, NrProtocoloEncerramento, DtEncerramento, * FROM DBO.MDFe
WHERE NrMDFe='100'
AND CdEmpresa='05'

UPDATE DBO.MDFe
SET StEncerramento='U', NrProtocoloEncerramento='926250004864110', DtEncerramento='2025-06-08 09:28:59.000',
DsJustificativaCancelamento='NULL', StCancelamento='N',CdErro='',DsErro=''
WHERE IdMDFe='98823'
AND CdEmpresa='05'
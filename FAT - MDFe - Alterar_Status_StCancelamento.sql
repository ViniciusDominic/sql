/* QUERY PARA ATUALIZAÇÃO DAS INFORMAÇÕES DE ENCERRAMENTO DO MDF-E */

USE [ALTERDATA_ERP]
GO

SELECT StEncerramento, NrProtocoloEncerramento, DtEncerramento, * FROM DBO.MDFe
WHERE NrMDFe='101'
AND CdEmpresa='04'

UPDATE DBO.MDFe
SET StEncerramento='U', NrProtocoloEncerramento='926240007265779', DtEncerramento='2024-11-17 09:26:01.000',
/*CdErro='NULL'*/DsErro='NULL'
where IdMDFe='97537'
and CdEmpresa='04'
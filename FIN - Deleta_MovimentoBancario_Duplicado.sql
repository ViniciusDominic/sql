USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.MovimentoBancario
WHERE NrTitulo='9077-1' /*  */
AND IdContaBancaria='00A000006G'
AND IdMovimentoBancario in ('00A000ADE2','00A000ADEG')

SELECT * FROM dbo.AReceber
WHERE NrTitulo='9077-1'
AND CdEmpresa='22'

SELECT * FROM dbo.AReceberItem
WHERE IdAReceber='00A0003MBE'

SELECT * FROM dbo.AReceberItemBaixa
WHERE IdMovimentoBancario in ('00A000ADE2',
'00A000ADEG')

DELETE dbo.MovimentoBancario
WHERE IdMovimentoBancario='00A000ADE2'
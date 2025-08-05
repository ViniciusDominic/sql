USE [ALTERDATA_ERP]
GO

SELECT VlTitulo , VlOriginal, VlAberto, 
* FROM DBO.AReceber
WHERE NrTitulo='000811-1'

UPDATE DBO.AReceber 
SET VlTitulo ='37459.27',
VlOriginal ='37459.27',
VlAberto ='37459.27'
WHERE IdAReceber='00A0005FMD'


SELECT VlItem , --00A0000T65--
* FROM DBO.AReceberItem
WHERE IdAReceber='00A0005FMD'
and IdProduto='00A0000T65'

UPDATE DBO.AReceberItem
SET VlItem='655.32'
WHERE IdAreceber='00A0005FMD'
AND IdAReceberItem='00A00071H8'


SELECT * FROM DBO.LancamentoCCusto
WHERE IdEntidadeOrigem='00A0005K23'
AND NmEntidadeOrigem='Esp.LP_DocumentoAPagar'

UPDATE DBO.LancamentoCCusto
SET VlLancamento='1625.44'
WHERE IdEntidadeOrigem='00A0005K23'
AND NmEntidadeOrigem='Esp.LP_DocumentoAPagar'


select * from dbo.produto
where NmProduto like '%26/31%'

USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.Documento
WHERE NrDocumento='12898'
--WHERE CdChaveAcessoNFEletronica='26221118301240000191550010000128981000343955'--

SELECT * FROM dbo.LoteEstoque
WHERE IdLoteEstoque='00A0003HHU'

UPDATE dbo.documento
SET NrDocumento='12884'
WHERE IdDocumento='00A0003HHU'
--WHERE nrdocumento='12898'--

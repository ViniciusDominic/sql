USE [ALTERDATA_ERP]
GO

SELECT * FROM DBO.PedidoDeCompra -- Coletar o IdPedidoDeCompra --
WHERE CdChamada IN ('063932')

SELECT * FROM DBO.PedidoDeCompraItem -- Coletar o IdPedidoDeCompraItem --
WHERE IdPedidoDeCompra IN ('00A000285K')

SELECT * FROM DBO.CentroDeCusto -- Coletar o IdCentroDeCusto --
WHERE NmCentroDeCusto LIKE '%LOG%' --00A0000DT9--

SELECT	* FROM	dbo.LancamentoCCusto
WHERE IdEntidadeOrigem = '00A0004DS2' -- Preencher com o IdPedidoDeCompraItem --
AND NmEntidadeOrigem = 'PEDIDODECOMPRAITEM'

UPDATE dbo.LancamentoCCusto 
SET IdCentroDeCusto='00A0000DT9' -- Alterar o IdCentroDeCusto no pedido de compra --
where IdEntidadeOrigem = '00A0004DS2' -- Preencher com o IdPedidoDeCompraItem --
AND NmEntidadeOrigem = 'PEDIDODECOMPRAITEM'

-------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM dbo.Documento -- Coletar o IdDocumento --
WHERE NrDocumento IN ('87452')
AND DsObservacao LIKE '%QU%'

SELECT * FROM DBO.DocumentoItem -- Coletar o IdDocumentoItem --
WHERE IdDocumento IN ('00A00073QU')

SELECT	* FROM	dbo.LancamentoCCusto
where IdEntidadeOrigem IN ('00A000FMV7') -- Preencher com o IdDocumentoItem --
AND NmEntidadeOrigem = 'DOCUMENTOITEM'

UPDATE	dbo.LancamentoCCusto
SET IdCentroDeCusto='00A0000DT9' -- Alterar o IdCentroDeCusto no documento --
WHERE IdEntidadeOrigem IN ('00A000FMV7') -- Preencher com o IdDocumentoItem --
AND NmEntidadeOrigem = 'DOCUMENTOITEM'

-- Alterar o centro de custo pelo front do sistema no módulo APagar, para finalizar a rotina --
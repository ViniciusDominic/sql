/* QUERY PARA AJUSTAR PEDIDO FATURADO COM O STATUS NÃO INTEGRADO */

USE [ALTERDATA_ERP]
GO

SELECT CdChamadaDestino AS [CODIGO_PEDIDO_ERP],
orcamento_importado,* FROM NSYS.orcamento
WHERE orcamento_id='30134'

UPDATE NSYS.orcamento
SET CdChamadaDestino='218034', orcamento_importado='1'
WHERE orcamento_id='30134'
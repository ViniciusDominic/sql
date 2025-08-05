/* QUERY PARA ALTERAÇÃO DA QUANTIDADE E VALORES DE ITENS DEVOLVIDOS PARCIALMENTE */

USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.LoteDocDevolucao
--WHERE StLoteDocDevolucao='A'--
WHERE CdChamada='001006'

SELECT QtDevolucaoAtendida, * FROM dbo.LoteDocDevolucaoItem
WHERE IdLoteDocDevolucao='00A00000V8'

UPDATE dbo.LoteDocDevolucaoItem
SET QtDevolucaoAtendida='1.433333333'
WHERE IdLoteDocDevolucaoItem IN ('00A000039I')

UPDATE dbo.LoteDocDevolucaoItem
SET QtDevolucaoAtendida='0.366666'
WHERE IdLoteDocDevolucaoItem IN ('00A000032I')

UPDATE dbo.LoteDocDevolucaoItem
SET QtDevolucaoAtendida='0.433333'
WHERE IdLoteDocDevolucaoItem IN ('00A00002WZ')

SELECT * FROM dbo.LoteDocDevolucaoPagamento
WHERE IdLoteDocDevolucao='00A00000TU'

UPDATE dbo.LoteDocDevolucaoPagamento
SET VlTitulo='11916.16'
WHERE IdLoteDocDevolucaoPagamento='00A00000OU'
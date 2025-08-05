SELECT O.cd_empresa, O.orcamento_id, S.NmSetor, O.orcamento_cadastro_data, CP.CdChamada, QtItem, o.StOrcamento, o.StSolicitaAprovacao
FROM NSYS.item_orcamento IO
JOIN NSYS.orcamento O ON O.orcamento_id = IO.orcamento_id
JOIN dbo.CodigoProduto CP ON CP.IdProduto = IO.produto_id
JOIN dbo.Setor S ON S.IdSetor = IO.item_idsetor
WHERE O.orcamento_importado=0
AND CP.StCodigoPrincipal='S'
AND ISNULL(IO.StOrcamentoItem,'') not in ('C')
AND CP.CdChamada='008047'
AND NmSetor='ESTOQUE CENTRAL - PERNAMBUCO - 16'
AND O.orcamento_cadastro_data <= '2025-01-31'
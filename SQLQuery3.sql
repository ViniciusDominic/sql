USE [ALTERDATA_ERP]
GO

--CREATE VIEW vw_CADASTRO_VAREJO AS--

/* VIWER CRIADA COM A MOTIVAÇÃO DE EXTRAIR DE FORMA UNIFICADA AS SEGUINTES INFORMAÇÕES:
CÓDIGO PRINCIPAL DO PRODUTO, NOME, EMBALAGEM, PESO LÍQUIDO, CANAL DE VENDA, NCM, EAN13, DUN14, CST PIS, CST COFINS */

SELECT
		CP.CdChamada AS [CÓDIGO],
		P.NmProduto AS [NOME],
		P.QtEmbalagem AS [EMBALAGEM],
		P.VlPesoLiquido AS [PESO],
		U.CdSigla AS [UNIDADE_MEDIDA],
		CPP.NmCaracteristicaProduto AS [TIPO_PRODUTO],
		CF.CdClassificacao AS [NCM],
		t11.CdChamada AS [EAN13],
		T12.CdChamada AS [DUN14],
		 CASE
		 WHEN CPP.NmCaracteristicaProduto='PEIXE - VAREJO' THEN '06'
		 ELSE '01' END AS [CST_PIS],
         CASE
		 WHEN CPP.NmCaracteristicaProduto='PEIXE - VAREJO' THEN '06'
		 ELSE '01' END AS [CST_COFINS],
		 GETDATE() AS [DATA_EMISSÃO]
		
			
FROM	dbo.CodigoProduto AS CP
		INNER JOIN dbo.Produto AS P
		ON  CP.IdProduto = P.IdProduto AND CP.StCodigoPrincipal='S'

		INNER JOIN dbo.ProdutoCaracteristicaProduto PCP
		ON PCP.IdProduto = P.IdProduto
		
		INNER JOIN dbo.CaracteristicaProduto CPP
		ON CPP.IdCaracteristicaProduto = PCP.IdCaracteristicaProduto AND CPP.CdClassificacao LIKE '4.02%' AND CPP.TpCaracteristica = 'A'
		
		INNER JOIN dbo.ClassificacaoFiscal AS CF
		ON P.IdClassificacaoFiscal = CF.IdClassificacaoFiscal

		INNER JOIN dbo.Unidade AS U
		ON U.IdUnidade = P.IdUnidade

		JOIN (SELECT t11.IdProduto, t11.CdChamada FROM dbo.CodigoProduto as t11 where IdTipoCodigoProduto = '00A0000007' ) t11 ON t11.IdProduto = P.IdProduto
		
		JOIN (SELECT t12.IdProduto, t12.CdChamada FROM dbo.CodigoProduto as t12 where IdTipoCodigoProduto = '00A000000N' ) t12 ON t12.IdProduto = P.IdProduto
		
		ORDER BY CÓDIGO 


/* AS */

/* A instrução SQL a seguir cria dois aliases, um para a coluna CustomerID e outro para a coluna CustomerName:

SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

São necessárias aspas duplas ou colchetes se o nome alternativo contiver espaços:

SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers;

A instrução SQL a seguir cria um alias chamado "Endereço" que combina quatro colunas (Endereço, Código Postal, Cidade e País):

SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers;

A instrução SQL a seguir seleciona todos os pedidos do cliente com CustomerID=4 (Around the Horn).
Usamos as tabelas "Clientes" e "Pedidos" e damos a elas os aliases de tabela "c" e "o" respectivamente (aqui usamos aliases para tornar o SQL mais curto):

SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName="Around the Horn" AND c.CustomerID=o.CustomerID; */


/* DISTINCT */

SELECT DISTINCT NmPessoa
FROM dbo.Pessoa

/* COUNT */

SELECT COUNT(*) AS QT_PESSOAS
FROM dbo.Pessoa

SELECT COUNT(DISTINCT TpPessoa) AS QT_TIPO_PESSOA
FROM dbo.Pessoa

SELECT COUNT(TpPessoa) AS QT_PESSOA_FISICA
FROM dbo.Pessoa
WHERE TpPessoa='F'

/* TOP + ORDER BY */

SELECT TOP 100 *
FROM dbo.Pessoa
ORDER BY CdChamada DESC

/* BETWEEN */

SELECT * FROM DBO.Pessoa
WHERE CdChamada BETWEEN '020000' AND '1000000'
ORDER BY CdChamada DESC

SELECT * FROM DBO.Pessoa
WHERE CdChamada NOT BETWEEN '020000' AND '1000000'
ORDER BY CdChamada DESC

SELECT DtEmissao AS [DATA_DO_PEDIDO], * FROM dbo.PedidoDeCompra
WHERE DtEmissao BETWEEN '2023-01-01 00:00:00.000' AND '2023-12-03 00:00:00.000'
AND CdEmpresa IN('01','16')
ORDER BY DtEmissao DESC
GO

/* IN */

SELECT * FROM DBO.Pessoa
WHERE CdCPF_CGC IN ('51.994.407/0001-12','49.456.865/0001-56')

/* LIKE */

SELECT * FROM DBO.Pessoa
WHERE NmCurto LIKE 'RESTAU%'

SELECT * FROM DBO.Pessoa
WHERE NmCurto LIKE '%PIZZA%'

SELECT * FROM DBO.Pessoa
WHERE NmCurto LIKE '%VIAGEM'

SELECT * FROM DBO.Pessoa
WHERE NmCurto LIKE '%PIZZ_'

/* SUM */

SELECT SUM (VlItem) AS VL_TOTAL
FROM DBO.PedidoDeVendaItem
WHERE DtEntrega='2024-11-05 00:00:00.000'

/* MIN */

SELECT MIN (VlItem) AS VL_MINIMO
FROM DBO.PedidoDeVendaItem
WHERE DtEntrega='2024-11-05 00:00:00.000'

/* MAX */

SELECT MAX (VlItem) AS VL_MAX
FROM DBO.PedidoDeVendaItem
WHERE DtEntrega='2024-11-05 00:00:00.000'

/* MÉDIA */

SELECT AVG (VlItem) AS VL_MEDIO
FROM DBO.PedidoDeVendaItem
WHERE DtEntrega='2024-11-05 00:00:00.000'
 
/* GROUP BY */

SELECT TpPessoa, COUNT (TpPessoa) AS TIPO_PESSOA_CADASTRADA
FROM DBO.Pessoa
GROUP BY TpPessoa

SELECT IdProduto, COUNT(IdProduto) AS QT_PRODUTO_DOCUMENTO
FROM dbo.DocumentoItem
GROUP BY IdProduto

SELECT NmCurto, COUNT (NmCurto) QT_NOMES
FROM DBO.Pessoa
WHERE NmCurto = ''
GROUP BY NmCurto

/* HAVING */

SELECT NmCurto, COUNT (NmCurto) QT_NOMES
FROM DBO.Pessoa
GROUP BY NmCurto
HAVING COUNT (NmCurto) > '2'

SELECT NmCurto, COUNT (NmCurto) QT_NOMES
FROM DBO.Pessoa
WHERE NmPessoa IS NOT NULL
GROUP BY NmCurto
HAVING COUNT (NmCurto) > '0'
 
 /* UNION */

 SELECT IdPessoa, CdChamada, NmPessoa, NmCurto
 FROM DBO.PESSOA
 WHERE NmCurto LIKE '%PIZZA%'
 UNION -- REMOVE DUPLICIDADE -- /* UNION ALL - CONTABILIZA DUPLICIDADE */
 SELECT IdPessoa, CdChamada, NmPessoa, NmCurto
 FROM DBO.PESSOA
 WHERE NmCurto LIKE '%BAR%'
 ORDER BY CdChamada DESC

 /* SUBQUERYS */

 SELECT * FROM DBO.Produto
 WHERE IdProduto IN ( SELECT IdProduto FROM dbo.Produto_Empresa WHERE CdEmpresa='17' )

 /* DATEPART */

 SELECT COUNT (CdChamada) AS QT_PEDIDOS, DATEPART(YEAR,DtEmissao) AS ANO_EMISSÃO
 FROM DBO.PedidoDeVenda
 GROUP BY DATEPART(YEAR,DtEmissao)
 ORDER BY ANO_EMISSÃO DESC
















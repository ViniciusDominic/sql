/* QUERY PARA CONFERÊNCIA DOS LOGS DE ERRO DAS INTEGRAÇÕES DOS PEDIDOS */

USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.altLog 
WHERE TpCategoria = '5' 
AND NmModuloOrigem = 'Pedido de Venda' 
AND DtReferencia > '2020-10-01' 
AND DsLog = 'Exclusão de Pré-Pedido/Pedido de Venda'
GO

/*DELETE dbo.altLog 
WHERE TpCategoria = '5' 
AND NmModuloOrigem = 'Pedido de Venda' 
AND DtReferencia > '2020-10-01' 
AND DsLog = 'Exclusão de Pré-Pedido/Pedido de Venda'
AND Id='3389166'
GO*/

SELECT @@VERSION AS [VERSÃO],
SYSDATETIME() AS [DATA]

Microsoft SQL Server 2019 (RTM-GDR) (KB5046056) - 15.0.2125.1 (X64)   Sep 20 2024 13:52:26   Copyright (C) 2019 Microsoft Corporation  Enterprise Edition (64-bit) on Windows Server 2019 Datacenter 10.0 <X64> (Build 17763: ) (Hypervisor) 
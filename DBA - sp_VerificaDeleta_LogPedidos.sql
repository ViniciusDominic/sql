USE [ALTERDATA_ERP]
GO

CREATE OR ALTER PROCEDURE sp_VerificaEDeleta_LogPedidos
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM dbo.altLog 
        WHERE TpCategoria = '5' 
          AND NmModuloOrigem = 'Pedido de Venda' 
          AND DtReferencia > '2020-10-01' 
          AND DsLog = 'Exclusão de Pré-Pedido/Pedido de Venda'
    )
    BEGIN
        DELETE TOP (100)
        FROM dbo.altLog
        WHERE TpCategoria = '5' 
          AND NmModuloOrigem = 'Pedido de Venda' 
          AND DtReferencia > '2020-10-01' 
          AND DsLog = 'Exclusão de Pré-Pedido/Pedido de Venda';

        PRINT 'Até 100 registros foram deletados com sucesso.';
    END
    ELSE
    BEGIN
        PRINT 'Nenhum registro encontrado. Nada foi deletado.';
    END
END
GO

EXEC sp_VerificaEDeleta_LogPedidos;

USE [ALTERDATA_ERP]
GO

CREATE PROCEDURE SP_Atualiza_DsVolumes
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Verifica se existem registros que atendem aos critérios
    IF EXISTS (
        SELECT 1 FROM dbo.PedidoDeVenda
        WHERE DtEmissao >= '2025-02-22'
        AND NmEntidadeOrigem = 'WEBEASY'
        AND DsVolumes LIKE '%.0%'
    )
    BEGIN
        -- Executa o update caso os registros existam
        UPDATE dbo.PedidoDeVenda
        SET DsVolumes = REPLACE(DsVolumes, '.0', '')
        WHERE DsVolumes LIKE '%.0%'
        AND DtEmissao >= '2025-02-22';
    END
END;

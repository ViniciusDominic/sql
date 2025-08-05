USE [ALTERDATA_ERP]
GO

SELECT * FROM dbo.areceber
WHERE NrTitulo='130321-1'
AND CdEmpresa='01'
GO

SELECT * FROM dbo.HistoricoCarteira /* VERIFICAR O IdTipoCobran�a DO T�TULO*/
WHERE IdAReceber='00A0005IRQ'

SELECT * FROM dbo.TipoCobranca /* VERIFICAR O TIPO DE COBRAN�A */
WHERE IdTipoCobranca='00A0000003'

UPDATE dbo.HistoricoCarteira
SET IdTipoCobranca='00A0000003'
WHERE IdAReceber='00A0005IRQ'
GO


SELECT * FROM dbo.Documento
WHERE NrDocumento='10647'

SELECT * FROM dbo.DocumentoItem
WHERE IdDocumento='00A0006RWT'

SELECT * FROM dbo.DocumentoItemValores
WHERE IdDocumento='00A0006RWT'

SELECT * FROM dbo.DocumentoItemRepasse
WHERE IdDocumentoItem IN ('00A000ETI5','00A000ETI4')

DELETE dbo.DocumentoItemRepasse
WHERE IdDocumentoItem IN ('00A000ETI4')
AND IdPessoa='00A000027A'

SELECT * FROM dbo.pessoa
WHERE NmCurto LIKE '%ANDRE LUIS%'

UPDATE dbo.DocumentoItemRepasse
SET IdPessoa='00A000021J'
WHERE IdDocumentoItem IN ('00A000ETI5')
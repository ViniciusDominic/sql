SELECT * FROM DBO.Documento
WHERE NrDocumento='102963'

-- ID DOCUMENTO 00A0005E0K --

SELECT * FROM DBO.DocumentoItem
WHERE IdDocumento='00A0005E0K'

-- ID DO ITEM 00A000BDW6 --

SELECT * FROM DBO.DocumentoItemValores
WHERE IdDocumento='00A0005E0K'

UPDATE DBO.DocumentoItemValores
SET VlPesoLiquido='100', VlPesoBruto='168.48'
WHERE IdDocumentoItem='00A000BE5O'
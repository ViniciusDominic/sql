/* REPLACE, TRANSLATE, STUFF */

SELECT DsComplementoItem,
REPLACE (DsComplementoItem,'Viveiro',''), -- REPLACE: SUBSTITUI UMA SEQUÊNCIA EXATA DENTRO DE UM TEXTO --
 * FROM dbo.DocumentoItem

UPDATE dbo.documentoitem
SET DsComplementoItem = REPLACE(DsComplementoItem, 'Viveiro ', '')
WHERE DsComplementoItem LIKE '%Viveiro%'

SELECT DsComplementoItem,
TRANSLATE (DsComplementoItem,'()-','[]=') -- TRANSLATE: SUBSTITUI MÚTIPLOS CARACTERES, INDEPENDENTE DA SUA POSIÇÃO --
FROM dbo.DocumentoItem


SELECT DsComplementoItem, STUFF(DsComplementoItem,1,8,'') -- STUFF: SUBSTITUI UMA SEQUÊNCIA DE CARACTERES, INFORMANDO POSIÇÃO INICIAL E FINAL --
FROM dbo.documentoitem
WHERE IdDocumentoItem='00A00018RY'

UPDATE dbo.documentoitem
SET DsComplementoItem = STUFF(DsComplementoItem,1,8,'')
WHERE DsComplementoItem LIKE 'Viveiro%'


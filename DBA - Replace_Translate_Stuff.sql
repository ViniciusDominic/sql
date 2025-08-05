/* REPLACE, TRANSLATE, STUFF */

SELECT DsComplementoItem,
REPLACE (DsComplementoItem,'Viveiro',''), -- REPLACE: SUBSTITUI UMA SEQU�NCIA EXATA DENTRO DE UM TEXTO --
 * FROM dbo.DocumentoItem

UPDATE dbo.documentoitem
SET DsComplementoItem = REPLACE(DsComplementoItem, 'Viveiro ', '')
WHERE DsComplementoItem LIKE '%Viveiro%'

SELECT DsComplementoItem,
TRANSLATE (DsComplementoItem,'()-','[]=') -- TRANSLATE: SUBSTITUI M�TIPLOS CARACTERES, INDEPENDENTE DA SUA POSI��O --
FROM dbo.DocumentoItem


SELECT DsComplementoItem, STUFF(DsComplementoItem,1,8,'') -- STUFF: SUBSTITUI UMA SEQU�NCIA DE CARACTERES, INFORMANDO POSI��O INICIAL E FINAL --
FROM dbo.documentoitem
WHERE IdDocumentoItem='00A00018RY'

UPDATE dbo.documentoitem
SET DsComplementoItem = STUFF(DsComplementoItem,1,8,'')
WHERE DsComplementoItem LIKE 'Viveiro%'


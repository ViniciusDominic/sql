USE [ALTERDATA_PACK_CARAPITANGA]
GO

SELECT	* FROM	wponto.movimen
WHERE cdempresa ='99'
AND dtmovimentacao='2023-02-10'
AND idfuncionario in (select idfuncionario from wdp.F00099 where NmFuncionario like '%vinicius%')

UPDATE wponto.movimen
SET hrmovimentacao1='0802'
WHERE	cdempresa ='99'
AND dtmovimentacao='2023-02-13'
AND idfuncionario in (select idfuncionario from wdp.F00099 where NmFuncionario like '%vinicius%')
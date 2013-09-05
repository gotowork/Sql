-- consulta con diluciones

SELECT  Samples.StorageDate,    Methods.Version AS VersionMetodo, Samples.CalibId AS Calibracion, ElementLines.ElementName AS Elemento, Samples.Id AS IDMuestra, 
                      Samples.Name AS Muestra, ElementLines.AverageResult
	, case 
		when ElementLines.PrintAverageResult = '^ *****' then 'NULL'
		else replace(ElementLines.PrintAverageResult, ',', '.') end as Result
	, Samples.Comment
	
FROM         Samples INNER JOIN
                      Methods ON Samples.MethodId = Methods.Id INNER JOIN
                      ElementLines ON Samples.Id = ElementLines.SampleId
WHERE    (Methods.Version = 76) 
		AND (Samples.CalibId = 364) 

		--and ElementLines.ElementName = 'Ag3280'
		--and Samples.Name = 'SS13000693'
		
ORDER BY  Elemento, IDMuestra


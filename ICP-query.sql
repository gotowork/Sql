SELECT     Methods.Version AS VersionMetodo, Samples.CalibId AS Calibracion, ElementLines.ElementName AS Elemento, Samples.Id AS IDMuestra, 
                      Samples.Name AS Muestra, ElementLines.AverageResult
	, case 
		when ElementLines.PrintAverageResult = '^ *****' then 'NULL'
		else replace(ElementLines.PrintAverageResult, ',', '.') end as Result
	, len(substring(ElementLines.PrintAverageResult, CHARINDEX (',', ltrim(ElementLines.PrintAverageResult))+2, 10)) as Num_decimales
	
FROM         Samples INNER JOIN
                      Methods ON Samples.MethodId = Methods.Id INNER JOIN
                      ElementLines ON Samples.Id = ElementLines.SampleId
WHERE    (Methods.Version = 76) AND (Samples.CalibId = 338) --and ElementLines.ElementName = 'Ag3280'
		
ORDER BY  Elemento, IDMuestra
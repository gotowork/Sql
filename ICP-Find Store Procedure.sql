--------------------------------------------------------------------------------------------------
-- RECUPERANDO METODOS ---------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- TEST:
-- spFindIcpMethods

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'spFindIcpMethods')
   DROP PROCEDURE spFindIcpMethods
GO

CREATE PROCEDURE spFindIcpMethods
as
BEGIN
	select Q.Id as MethodId, P.Name, P.Version
	from (select Name, max(Version)as Version from dbo.Methods group by Name) P
	left join dbo.Methods Q on P.Name = Q.Name and P.Version = Q.Version
END
GO

--------------------------------------------------------------------------------------------------
-- RECUPERANDO NOMBRE DE MUESTRAS ----------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- TEST:
-- spFindIcpSamples '20130611', '20130613', 'EPA 200.7 Determination'

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'spFindIcpSamples')
   DROP PROCEDURE spFindIcpSamples
GO

CREATE PROCEDURE spFindIcpSamples
@DateIni smalldatetime,
@DateEnd smalldatetime,
@MethodName varchar(50)
as
BEGIN	
	SELECT Sel = cast(0 as bit), Methods.Id as MethodId, Methods.Version, _SampleTypes.Label, Samples.SampleTypeId,
		Samples.StorageDate, Samples.CalibId, Samples.Id AS SamplesId, Samples.Name
	FROM Samples INNER JOIN
			  Methods ON Samples.MethodId = Methods.Id
		INNER JOIN _SampleTypes ON _SampleTypes.Id = Samples.SampleTypeId
	WHERE Samples.StorageDate between @DateIni and @DateEnd
		 and Methods.Name = @MethodName
	ORDER BY  SamplesId
END
GO

--------------------------------------------------------------------------------------------------
-- RECUPERANDO LECTURAS --------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- TEST:
/* 
spFindIcpAnalysis @DateIni = '20130611', @DateEnd='20130613', 
@MethodName='EPA 200.7 Determination', 
@SamplesSelected= '9963|9964|9965|9966|9967|9968'
*/
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'spFindIcpAnalysis')
   DROP PROCEDURE spFindIcpAnalysis
GO

CREATE PROCEDURE spFindIcpAnalysis
@DateIni smalldatetime,
@DateEnd smalldatetime,
@MethodName varchar(50),
@SamplesSelected varchar(1000) -- 1|2|3|5.....
as
BEGIN
	-- construir tabla de muestras seleccionadas
	select *
	into #tmp
	from dbo.SplitStrings_CTE(@SamplesSelected, '|')

	-- consulta con diluciones
	SELECT Sel = cast(0 as bit), Methods.Id as MethodId, Methods.Version, Samples.StorageDate, Samples.CalibId, ElementLines.ElementName, Samples.Id AS SamplesId, 
		 Samples.Name, ElementLines.AverageResult
		, case 
			when ElementLines.PrintAverageResult = '^ *****' then 'NULL'
			else replace(ElementLines.PrintAverageResult, ',', '.') end as Result
		, Samples.Comment as Dilution2
		
	FROM Samples INNER JOIN Methods ON Samples.MethodId = Methods.Id 
		INNER JOIN ElementLines ON Samples.Id = ElementLines.SampleId
		INNER JOIN #tmp ON Samples.Id = item
	WHERE Samples.StorageDate between @DateIni and @DateEnd
		 and Methods.Name = @MethodName						
	ORDER BY  ElementLines.ElementName, SamplesId
END
GO

--------------------------------------------------------------------------------------------------
-- RECUPERANDO ELEMENTOS, LONGITUD DE ONDA Y PLASMA VIEW -----------------------------------------
--------------------------------------------------------------------------------------------------
-- TEST:
/* 
spFindIcpElements 
*/
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'spFindIcpElements')
   DROP PROCEDURE spFindIcpElements
GO

CREATE PROCEDURE spFindIcpElements
as
BEGIN

	select distinct 
		A.elementSymbol, A.wavelength, 
		A.lineOrder, CASE A.instrumentView	
						WHEN 1 THEN 'Axial'
						ELSE 'Radial'
					 END as plasmaView	
	from dbo.TblMethodLines A
		inner join dbo.TblReportableMethod B on A.ReportableMethodID = B.ReportableMethodID	
	order by ElementSymbol, wavelength

END
GO
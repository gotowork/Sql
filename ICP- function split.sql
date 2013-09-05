-- select * from dbo.SplitStrings_CTE('aaa|bbb|ccc|ddd', '|')
IF OBJECT_ID (N'dbo.SplitStrings_CTE') IS NOT NULL
   DROP FUNCTION dbo.SplitStrings_CTE
GO

CREATE FUNCTION dbo.SplitStrings_CTE(@List nvarchar(1000), @Delimiter nvarchar(1))
RETURNS @returns TABLE ([id] int, item varchar(100), PRIMARY KEY CLUSTERED([id]))
AS
BEGIN
;WITH cte AS
 (
  SELECT SUBSTRING(@List, 0, CHARINDEX(@Delimiter, @List)) AS item ,
         CAST(STUFF(@List + @Delimiter, 1, CHARINDEX(@Delimiter, @List), '') AS nvarchar (1000)) AS stitem,
         1 AS [id]
  UNION ALL
  SELECT SUBSTRING(stitem, 0, CHARINDEX(@Delimiter, stitem)),
         CAST(STUFF (stitem, 1, CHARINDEX(@Delimiter, stitem), '' ) AS nvarchar (1000)),
         [id] + 1
  FROM cte
  WHERE stitem != ''
  )
  INSERT @returns
  SELECT [id], REPLACE(item, ' ','' ) AS item
  FROM cte
  WHERE item > ''
  RETURN
END
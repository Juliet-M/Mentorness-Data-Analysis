SELECT count(*)
  FROM [LeafCastDB].[dbo].[Stats]
  WHERE Province IS NULL OR [Country/Region] IS NULL OR Latitude IS NULL OR Longitude IS NULL 
  OR Date IS NULL OR Confirmed IS NULL OR RECOVERED IS NULL OR Deaths IS NULL

  SELECT 
  MIN(Date) AS Start_Date,
  MAX(Date) AS End_Date
  FROM [LeafCastDB].[dbo].[Stats]
  
SELECT COUNT 
(DISTINCT DATEPART(MONTH, Date)) AS month_num
FROM [LeafCastDB].[dbo].[Stats]

 ALTER TABLE dbo.Stats
 ALTER COLUMN Confirmed INT;

 ALTER TABLE dbo.Stats
 ALTER COLUMN Deaths INT;

 ALTER TABLE dbo.Stats
 ALTER COLUMN Recovered INT;

 ALTER TABLE dbo.Stats
 ALTER COLUMN Latitude FLOAT;

  ALTER TABLE dbo.Stats
 ALTER COLUMN Longitude FLOAT;

SELECT
DATEPART(MONTH, Date) AS Month,
AVG(Confirmed) AS AvgConfirmed,
AVG(Deaths) AS AvgDeaths,
AVG(Recovered) AS AvgRecovered
FROM [LeafCastDB].[dbo].[Stats]
GROUP BY
 DATEPART(MONTH, Date);

 SELECT 
 DATEPART(YEAR, Date) AS Year,
 MAX(Confirmed) AS MaxConfirmed,
 MAX(Deaths) AS MaxDeaths,
 MAX(Recovered) AS MaxRecovered
 FROM [LeafCastDB].[dbo].[Stats]
GROUP BY
 DATEPART(YEAR, Date);

  SELECT 
 DATEPART(YEAR, Date) AS Year,
 SUM(Confirmed) AS TotalConfirmed,
 SUM(Deaths) AS TotalDeaths,
 SUM(Recovered) AS TotalRecovered
 FROM [LeafCastDB].[dbo].[Stats]
GROUP BY
 DATEPART(YEAR, Date);

 SELECT 
 COUNT(*) AS TotalCases,
 AVG(Confirmed) AS AVGConfirmed,
 VAR(Confirmed) AS VarianceConfirmed,
 STDEV(Confirmed) AS STDEVConfirmed
FROM [LeafCastDB].[dbo].[Stats]

 SELECT 
 DATEPART(MONTH,Date) AS Month,
 COUNT(*) AS TotalCases,
 AVG(Deaths) AS AVGDeaths,
 VAR(Deaths) AS VarianceDeaths,
 STDEV(Deaths) AS STDEVDeaths
FROM [LeafCastDB].[dbo].[Stats]
GROUP BY
DATEPART(MONTH, Date)

 SELECT 
 COUNT(*) AS TotalCases,
 AVG(Recovered) AS AVGRecovered,
 VAR(Recovered) AS VarianceRecovered,
 STDEV(Recovered) AS STDEVRecovered
FROM [LeafCastDB].[dbo].[Stats]

SELECT [Country/Region], Confirmed
FROM [LeafCastDB].[dbo].[Stats]
WHERE Confirmed = (SELECT 
MAX(Confirmed) FROM [LeafCastDB].[dbo].[Stats]);

SELECT [Country/Region], Confirmed
FROM [LeafCastDB].[dbo].[Stats]
WHERE Confirmed = (SELECT 
MIN(Confirmed) FROM [LeafCastDB].[dbo].[Stats]);


SELECT TOP 5 [Country/Region], Recovered
FROM [LeafCastDB].[dbo].[Stats]
ORDER BY Recovered DESC


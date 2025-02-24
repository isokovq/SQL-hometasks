WITH Calendar AS (
    SELECT 
        CAST('2025-01-01' AS DATE) AS Date, 
        1 AS DayOfYear
    UNION ALL
    SELECT 
        DATEADD(DAY, 1, Date), 
        DayOfYear + 1
    FROM Calendar
    WHERE DayOfYear < 31
)
SELECT 
    FORMAT(Date, 'yyyyMMdd') AS ID,
    Date,
    DAY(Date) AS Day,
    CASE 
        WHEN DAY(Date) IN (11, 12, 13) THEN CAST(DAY(Date) AS VARCHAR) + 'th'
        WHEN RIGHT(CAST(DAY(Date) AS VARCHAR), 1) = '1' THEN CAST(DAY(Date) AS VARCHAR) + 'st'
        WHEN RIGHT(CAST(DAY(Date) AS VARCHAR), 1) = '2' THEN CAST(DAY(Date) AS VARCHAR) + 'nd'
        WHEN RIGHT(CAST(DAY(Date) AS VARCHAR), 1) = '3' THEN CAST(DAY(Date) AS VARCHAR) + 'rd'
        ELSE CAST(DAY(Date) AS VARCHAR) + 'th'
    END AS DaySuffix,
    DATENAME(WEEKDAY, Date) AS DayOfWeek,
    DayOfYear,
    DATEPART(WEEK, Date) AS WeekOfYear,
    -- Corrected WeekOfMonth Calculation
    (DATEPART(WEEK, Date) - DATEPART(WEEK, DATEADD(DAY, -DAY(Date) + 1, Date)) + 1) AS WeekOfMonth,
    MONTH(Date) AS Month,
    DATENAME(MONTH, Date) AS MonthName,
    DATEPART(QUARTER, Date) AS Quarter,
    CASE 
        WHEN DATEPART(QUARTER, Date) = 1 THEN 'First'
        WHEN DATEPART(QUARTER, Date) = 2 THEN 'Second'
        WHEN DATEPART(QUARTER, Date) = 3 THEN 'Third'
        WHEN DATEPART(QUARTER, Date) = 4 THEN 'Fourth'
    END AS QuarterName,
    YEAR(Date) AS Year
FROM Calendar
OPTION (MAXRECURSION 31);

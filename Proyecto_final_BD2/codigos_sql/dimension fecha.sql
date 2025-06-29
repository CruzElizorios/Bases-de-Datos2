-- Crear la tabla de dimensiones de fecha
CREATE TABLE [datawarehouse_2025_G12].dbo.Dim_Fecha_G12 (
    fecha_key INT PRIMARY KEY,
    fecha DATE,
    año INT,
    mes INT,
    dia INT,
    trimestre INT,
    semestre INT,
    nombre_mes VARCHAR(20),
    nombre_dia VARCHAR(20),
    semana_anio INT
);
-- Población de la tabla de fechas
WITH CTE_Fechas AS (
    SELECT CAST('2000-01-01' AS DATE) AS fecha
    UNION ALL
    SELECT DATEADD(DAY, 1, fecha)
    FROM CTE_Fechas
    WHERE fecha < '2030-12-31'
)
INSERT INTO [datawarehouse_2025_G12].dbo.Dim_Fecha_G12 
SELECT
    YEAR(fecha) * 10000 + MONTH(fecha) * 100 + DAY(fecha) AS fecha_key,
    fecha,
    YEAR(fecha) AS año,
    MONTH(fecha) AS mes,
    DAY(fecha) AS dia,
    CEILING(MONTH(fecha) / 3.0) AS trimestre,
    CEILING(MONTH(fecha) / 6.0) AS semestre,
    DATENAME(MONTH, fecha) AS nombre_mes,
    DATENAME(WEEKDAY, fecha) AS nombre_dia,
    DATEPART(WEEK, fecha) AS semana_anio
FROM CTE_Fechas OPTION (MAXRECURSION 0)
 
 -- CONVIERTE LOS ID EN INT (estaban en float)
 -- CONVIERTE las fechas de varchar a date y solo me quedo con los valores no nulos
 -- se utiliza el 101 por el formato que tienen las fechas, MM/DD/YYYY
 SELECT CAST([EMPLOYEE_ID] AS INT) AS [EMPLOYEE_ID]
      ,[FULL_NAME]
      ,[CATEGORY]
      ,(TRY_CONVERT(date, TRIM(EMPLOYMENT_DATE), 101)) as EMPLOYMENT_DATE
      ,(TRY_CONVERT(date, TRIM(BIRTH_DATE), 101)) as BIRTH_DATE
      ,[EDUCATION_LEVEL]
      ,[GENDER]
  FROM [bd_staging_2025_G12].[dbo].[stg_empleados_G12]
  WHERE EMPLOYEE_ID IS NOT NULL
  
  -- ver tipos de datos columnas
  EXEC sp_columns 'stg_empleados_G12';


  SELECT top(10) [EMPLOYEE_ID]
      ,[FULL_NAME]
      ,[CATEGORY]
      ,[EMPLOYMENT_DATE]
      ,[BIRTH_DATE]
  FROM [bd_staging_2025_G12].[dbo].[stg_empleados_G12]
  WHERE EMPLOYEE_ID IS NOT NULL

  SELECT [EMPLOYEE_ID]
      ,[FULL_NAME]
      ,[CATEGORY]
      ,[EMPLOYMENT_DATE]
      ,[BIRTH_DATE]
      ,[EDUCATION_LEVEL]
      ,[GENDER]
  FROM [bd_staging_2025_G12].[dbo].[stg_empleados_G12]
  WHERE EMPLOYEE_ID IS NOT NULL


SELECT BIRTH_DATE FROM stg_empleados_G12 
WHERE TRY_CAST(BIRTH_DATE AS DATE) IS NULL;

SELECT DISTINCT [EMPLOYEE_ID] FROM stg_empleados_G12;

  
truncate table [bd_staging_2025_G12].[dbo].[stg_billing_G12]
truncate table [bd_staging_2025_G12].[dbo].[stg_billing_detail_G12]
truncate table [bd_staging_2025_G12].[dbo].[stg_discounts_G12]
truncate table [bd_staging_2025_G12].[dbo].[stg_prices_G12]

--drop table  [bd_staging_2025_G12].[dbo].[stg_regiones]
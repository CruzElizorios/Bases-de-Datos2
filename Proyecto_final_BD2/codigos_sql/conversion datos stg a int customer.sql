-- clientes mayoristas

SELECT top(10) [CUSTOMER_ID]
      ,[FULL_NAME]
      ,(TRY_CONVERT(date, TRIM(BIRTH_DATE), 101)) as BIRTH_DATE
      ,[CITY]
      ,[STATE]
      ,[ZIPCODE]
  FROM [bd_staging_2025_G12].[dbo].[stg_customer_W_G12]

  --muestra los clientes donde falla la conversion de fecha
  SELECT * FROM [bd_staging_2025_G12].[dbo].[stg_customer_W_G12] WHERE (TRY_CONVERT(date, TRIM(BIRTH_DATE), 101)) is null;

  -- reemplaza el campo extraño por un string vacio y convierte la fecha
  SELECT [CUSTOMER_ID]
      ,[FULL_NAME]
      ,(TRY_CONVERT(date, REPLACE(BIRTH_DATE, 'j', ''), 101)) as BIRTH_DATE
      ,[CITY]
      ,[STATE]
      ,[ZIPCODE]
  FROM [bd_staging_2025_G12].[dbo].[stg_customer_W_G12]

-- clientes minoristas   
  SELECT [CUSTOMER_ID]
      ,[FULL_NAME]
      ,(TRY_CONVERT(date, TRIM(BIRTH_DATE), 101)) as BIRTH_DATE
      ,[CITY]
      ,[STATE]
      ,[ZIPCODE]
  FROM [bd_staging_2025_G12].[dbo].[stg_customer_W_G12]
  
  --1018 1197 tienen asteriscos
   SELECT * FROM [bd_staging_2025_G12].[dbo].[stg_customer_R_G12] WHERE (TRY_CONVERT(date, TRIM(BIRTH_DATE), 101)) is null;
    
SELECT [CUSTOMER_ID]
      ,[FULL_NAME]
      ,BIRTH_DATE
      ,[CITY]
      ,[STATE]
      ,[ZIPCODE]
  FROM [bd_staging_2025_G12].[dbo].[stg_customer_R_G12]

-- transformacion dela fecha sin errores
   SELECT [CUSTOMER_ID]
      ,[FULL_NAME]
	  ,(TRY_CONVERT(date,REPLACE(BIRTH_DATE, '*', ''), 101)) as BIRTH_DATE
      ,[CITY]
      ,[STATE]
      ,[ZIPCODE]
  FROM [bd_staging_2025_G12].[dbo].[stg_customer_R_G12]

 -- ver tabla completa 
 SELECT TOP (1000) [CUSTOMER_ID]
      ,[FULL_NAME]
      ,[BIRTH_DATE]
      ,[CITY]
      ,[STATE]
      ,[ZIPCODE]
      ,[TIPO_CLIENTE]
  FROM [bd_intermedia_2025_G12].[dbo].[int_customer_G12]
SELECT TOP (1000) [PRODUCTO_KEY]
      ,[CUSTOMER_KEY]
      ,[EMPLOYEE_KEY]
      ,[REGION_KEY]
      ,[fecha_key]
      ,[BILLING_ID]
      ,[DATE]
      ,[QUANTITY]
      ,[total_facturado]
      ,[total_facturado_con_descuento]
      ,[PRICE]
      ,[descuento]
      ,[Cantidad_Latas]
      ,[Cantidad_Litros_Vendidos]
  FROM [datawarehouse_2025_G12].[dbo].[Fact_Ventas_G12]
  where BILLING_ID = 660746 -- 636034

--- HAY QUE VER DONDE HAY PRODUCTO DUPLICADO Y CLIENTE PARA SUMAR LA CANTIDAD DE 
--- EN UN SOLO TOTAL, ESTA MODIFICACION SE DEBE HACER EN LA INTERMEDIA,
--- ANTES DE CREAR LA FACT, EN ESTE EJEMPLO EL PRODUCTO 3 Y 28 ESTAN REPETIDOS
SELECT *
  FROM [bd_intermedia_2025_G12].[dbo].[int_tmp_fact]
  where BILLING_ID = 660746 -- 636034


SELECT f.*
FROM [datawarehouse_2025_G12].[dbo].[Fact_Ventas_G12] f
JOIN (
    SELECT PRODUCTO_KEY, BILLING_ID
    FROM [datawarehouse_2025_G12].[dbo].[Fact_Ventas_G12]
    GROUP BY PRODUCTO_KEY, BILLING_ID
    HAVING COUNT(*) > 1
) repetidos
ON f.PRODUCTO_KEY = repetidos.PRODUCTO_KEY
AND f.BILLING_ID = repetidos.BILLING_ID;


-- solucion al problema

SELECT
	BILLING_ID
	,DATE
	,CUSTOMER_ID
	,EMPLOYEE_ID
	,PRODUCT_ID
	,SUM(QUANTITY) AS QUANTITY
	,REGION
FROM [bd_intermedia_2025_G12].[dbo].[int_tmp_fact]
where BILLING_ID >= 636001 and BILLING_ID <= 636019 --para comprobar
GROUP BY
	BILLING_ID
	,DATE
	,CUSTOMER_ID
	,EMPLOYEE_ID
	,PRODUCT_ID
	,REGION
--order by BILLING_ID; 


-- solucion al problema cantidad 1.656.463 antes 1.676.294

-- ver valores repetidos
SELECT top(13) f.*
FROM [bd_intermedia_2025_G12].[dbo].[int_tmp_fact] f
JOIN (
    SELECT PRODUCT_ID, BILLING_ID
    FROM [bd_intermedia_2025_G12].[dbo].[int_tmp_fact]
    GROUP BY PRODUCT_ID, BILLING_ID
    HAVING COUNT(*) > 1
) repetidos
ON f.PRODUCT_ID = repetidos.PRODUCT_ID
AND f.BILLING_ID = repetidos.BILLING_ID
order by BILLING_ID;

--- HAY 113 REGISTROS SIN PRECIOS PORQUE NO HAY EN PRECIOS PARA FECHAS ANTES DEL 2006 09:00HS

--select * from [datawarehouse_2025_G12].[dbo].[Fact_Ventas_G12] f
--where f.PRICE is null

--select *
--from [bd_intermedia_2025_G12].[dbo].[int_prices_G12] p
--WHERE YEAR([FROM]) = 2006;

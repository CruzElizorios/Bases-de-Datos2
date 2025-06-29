SELECT top(1) *
  FROM [bd_intermedia_2025_G12].[dbo].[int_pre_fact_G12]
  where EMPLOYEE_ID is null
-- nulos price 113
-- COMANDO PARA VER SI HAY NULOS EN LAS COLUMNAS
  SELECT
    CASE
        WHEN COUNT(CASE WHEN BILLING_ID IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS BILLING_ID_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN DATE IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS DATE_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN CUSTOMER_ID IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS CUSTOMER_ID_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN EMPLOYEE_ID IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS EMPLOYEE_ID_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN PRODUCT_ID IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS PRODUCT_ID_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN QUANTITY IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS QUANTITY_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN REGION IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS REGION_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN total_facturado IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS total_facturado_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN total_facturado_con_descuento IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS total_facturado_con_descuento_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN PRICE IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS PRICE_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN descuento IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS descuento_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN Cantidad_Latas IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS Cantidad_Latas_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN Cantidad_Litros_Vendidos IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS Cantidad_Litros_Vendidos_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN ZIPCODE IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS ZIPCODE_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN PRODUCTO_KEY IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS PRODUCTO_KEY_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN CUSTOMER_KEY IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS CUSTOMER_KEY_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN EMPLOYEE_KEY IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS EMPLOYEE_KEY_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN REGION_KEY IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS REGION_KEY_Tiene_Nulos,
    CASE
        WHEN COUNT(CASE WHEN fecha_key IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS fecha_key_Tiene_Nulos,
	CASE
        WHEN COUNT(CASE WHEN GrupoEtario_KEY IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS GrupoEtario_KEY_Tiene_Nulos,
	CASE
        WHEN COUNT(CASE WHEN EDAD_CLIENTE IS NULL THEN 1 END) > 0 THEN 'Sí'
        ELSE 'No'
    END AS EDAD_CLIENTE_Tiene_Nulos
FROM [bd_intermedia_2025_G12].[dbo].[int_pre_fact_G12];


--Precios
--------------------------
SELECT
    PRODUCT_ID,
    DATE AS [FROM],
    LEAD(DATE, 1) OVER (PARTITION BY PRODUCT_ID ORDER BY DATE) AS [UNTIL],
    PRICE
FROM
    [dbo].[stg_prices_G12]
ORDER BY
    PRODUCT_ID, [FROM]

--------------------------
--FACT
--------------------------
with CTE_Total_Facturado AS (
select v.billing_id, v.date, SUM(v.quantity) * SUM(p.PRICE) AS total_facturado
from [dbo].[int_tmp_fact] v --1.676.294
left join [dbo].[int_prices_G12] p --con inner 1.642.971 quedan sin precio
on v.PRODUCT_ID = p.PRODUCT_ID
and v.date >= p.[FROM]
and (v.date < p.UNTIL or p.UNTIL is null)
group by v.billing_id, v.date
)
,
CTE_Descuentos AS (
select v.billing_id, v.date, v.total_facturado, isnull(MAX(d.PERCENTAGE/100.00),0.00) AS descuento
from CTE_Total_Facturado v --1656457
left join [dbo].[int_discounts_G12] d
on v.date >= d.[FROM]
and (v.date < d.UNTIL or d.UNTIL is null)
and v.total_facturado > d.TOTAL_BILLING
group by v.billing_id, v.date, v.total_facturado
)
select v.*
,v.quantity * p.PRICE AS total_facturado
,v.quantity * p.PRICE * (1-d.descuento)  AS total_facturado_con_descuento
,p.PRICE
,d.descuento
,case when pr.ES_LATA = 'Si' then v.QUANTITY else 0 end Cantidad_Latas
,case when pr.MEDICIONES = 'Liter' then pr.CAPACIDAD * v.QUANTITY else (pr.CAPACIDAD/1000.00) * v.QUANTITY end Cantidad_Litros_Vendidos
,cu.ZIPCODE
,datediff(year,cu.BIRTH_DATE , v.DATE) as EDAD_CLIENTE
--Agrego las PK de las dimension
,pr.PRODUCTO_KEY
,cu.CUSTOMER_KEY
,emp.EMPLOYEE_KEY
,reg.REGION_KEY
,fec.fecha_key
,eta.GrupoEtario_KEY
from [dbo].[int_tmp_fact] v 
left join [dbo].[int_prices_G12] p 
on v.PRODUCT_ID = p.PRODUCT_ID
and v.date >= p.[FROM]
and (v.date < p.UNTIL or p.UNTIL is null)
left join CTE_Descuentos d
on v.billing_id = d.billing_id
left join [datawarehouse_2025_G12].[dbo].[Dim_Productos_G12] pr
on v.Product_ID = pr.Product_ID
left join [datawarehouse_2025_G12].[dbo].[Dim_Empleados_G12] emp
on v.EMPLOYEE_ID = emp.EMPLOYEE_ID
left join [datawarehouse_2025_G12].[dbo].[Dim_Customer_G12] cu
on v.CUSTOMER_ID = cu.CUSTOMER_ID
left join [datawarehouse_2025_G12].[dbo].[Dim_Regiones_G12] reg
on cu.ZIPCODE = reg.ZIPCODE
left join [datawarehouse_2025_G12].[dbo].[Dim_Fecha_G12] fec
on CONVERT(INT, FORMAT(v.DATE, 'yyyyMMdd')) = fec.fecha_key
left join [datawarehouse_2025_G12].[dbo].[Dim_GrupoEtario_G12] eta
on datediff(year,cu.BIRTH_DATE , v.DATE) BETWEEN eta.DESDE and eta.HASTA;

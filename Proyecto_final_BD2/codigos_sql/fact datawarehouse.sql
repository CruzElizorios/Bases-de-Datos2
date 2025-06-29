USE [datawarehouse_2025_G12]
-- creacion en SSIS
--GO

--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE TABLE [dbo].[Fact_Ventas_G12](
--	[PRODUCTO_KEY] [int] NULL,
--	[CUSTOMER_KEY] [int] NULL,
--	[EMPLOYEE_KEY] [int] NULL,
--	[REGION_KEY] [int] NULL,
--	[BILLING_ID] [int] NULL,
--	[DATE] [datetime] NULL,
--	[QUANTITY] [int] NULL,
--	[total_facturado] [float] NULL,
--	[total_facturado_con_descuento] [float] NULL,
--	[PRICE] [float] NULL,
--	[descuento] [float] NULL,
--	[Cantidad_Latas] [int] NULL,
--	[Cantidad_Litros_Vendidos] [float] NULL,
--) ON [PRIMARY]
--GO


ALTER TABLE dbo.Fact_Ventas_G12
ADD CONSTRAINT FK_FactVentas_Producto FOREIGN KEY (PRODUCTO_KEY)
REFERENCES dbo.Dim_Productos_G12(PRODUCTO_KEY);

ALTER TABLE dbo.Fact_Ventas_G12
ADD CONSTRAINT FK_FactVentas_Cliente FOREIGN KEY (CUSTOMER_KEY)
REFERENCES dbo.Dim_Customer_G12(CUSTOMER_KEY);

ALTER TABLE dbo.Fact_Ventas_G12
ADD CONSTRAINT FK_FactVentas_Empleado FOREIGN KEY (EMPLOYEE_KEY)
REFERENCES dbo.Dim_Empleados_G12(EMPLOYEE_KEY);

ALTER TABLE dbo.Fact_Ventas_G12
ADD CONSTRAINT FK_FactVentas_Region FOREIGN KEY (REGION_KEY)
REFERENCES dbo.Dim_Regiones_G12(REGION_KEY);

ALTER TABLE dbo.Fact_Ventas_G12
ADD CONSTRAINT FK_FactVentas_Fecha FOREIGN KEY (fecha_key)
REFERENCES dbo.Dim_Fecha_G12(fecha_key);

ALTER TABLE dbo.Fact_Ventas_G12
ADD CONSTRAINT FK_FactVentas_gEtario FOREIGN KEY (GrupoEtario_KEY)
REFERENCES dbo.Dim_GrupoEtario_G12(GrupoEtario_KEY);

ALTER TABLE dbo.Fact_Ventas_G12 
ALTER COLUMN PRODUCTO_KEY INT NOT NULL;

ALTER TABLE dbo.Fact_Ventas_G12 
ALTER COLUMN CUSTOMER_KEY INT NOT NULL;

ALTER TABLE dbo.Fact_Ventas_G12 
ALTER COLUMN REGION_KEY INT NOT NULL;

ALTER TABLE dbo.Fact_Ventas_G12 
ALTER COLUMN fecha_key INT NOT NULL;

ALTER TABLE dbo.Fact_Ventas_G12 
ALTER COLUMN  BILLING_ID INT NOT NULL;

ALTER TABLE dbo.Fact_Ventas_G12
ADD CONSTRAINT PK_FactVentas PRIMARY KEY (PRODUCTO_KEY, BILLING_ID);

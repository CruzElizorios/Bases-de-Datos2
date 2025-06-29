USE [datawarehouse_2025_G12]
GO

/****** Object:  Table [dbo].[int_productos_G12]    Script Date: 13/06/2025 12:13:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Productos_G12](
	[PRODUCTO_KEY] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[PRODUCT_ID] [int] NULL,
	[DETAIL] [varchar](50) NULL,
	[PACKAGE] [varchar](50) NULL,
	[TIPO_PRODUCTO] [nvarchar](50) NULL,
	[CAPACIDAD] [int] NULL,
	[MEDICIONES] [nvarchar](50) NULL,
	[ES_LATA] [nvarchar](2) NULL,
	[CAPACIDAD_CM3] [int] NULL
) ON [PRIMARY]
GO



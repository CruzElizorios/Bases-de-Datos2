USE [datawarehouse_2025_G12]
GO

/****** Object:  Table [dbo].[int_regiones_G12]    Script Date: 13/06/2025 12:58:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Regiones_G12](
	[REGION_KEY] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[REGION] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[ZIPCODE] [varchar](50) NULL
) ON [PRIMARY]
GO



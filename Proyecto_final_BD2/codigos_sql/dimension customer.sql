USE [datawarehouse_2025_G12]
GO

/****** Object:  Table [dbo].[int_customer_G12]    Script Date: 13/06/2025 12:55:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Customer_G12](
	[CUSTOMER_KEY] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[CUSTOMER_ID] [int] NULL,
	[FULL_NAME] [nvarchar](255) NULL,
	[BIRTH_DATE] [date] NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIPCODE] [bigint] NULL,
	[TIPO_CLIENTE] [nvarchar](17) NULL
) ON [PRIMARY]
GO



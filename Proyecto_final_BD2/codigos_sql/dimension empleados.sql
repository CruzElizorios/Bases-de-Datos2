USE [datawarehouse_2025_G12]
GO

/****** Object:  Table [dbo].[int_empleados_G12]    Script Date: 13/06/2025 13:02:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Empleados_G12](
	[EMPLOYEE_KEY] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[EMPLOYEE_ID] [int] NULL,
	[FULL_NAME] [nvarchar](255) NULL,
	[CATEGORY] [nvarchar](255) NULL,
	[EMPLOYMENT_DATE] [date] NULL,
	[BIRTH_DATE] [date] NULL,
	[EDUCATION_LEVEL] [nvarchar](255) NULL,
	[GENDER] [nvarchar](255) NULL
) ON [PRIMARY]
GO


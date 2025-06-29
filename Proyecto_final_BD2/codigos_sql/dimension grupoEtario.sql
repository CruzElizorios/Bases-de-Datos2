USE [datawarehouse_2025_G12]

CREATE TABLE Dim_GrupoEtario_G12 (
    GrupoEtario_KEY INT PRIMARY KEY IDENTITY(1,1),
    GRUPO VARCHAR(50),
    DESDE INT,
    HASTA INT
);

INSERT INTO Dim_GrupoEtario_G12(GRUPO, DESDE, HASTA)
VALUES 
('Niñez', 0, 12),
('Teenager', 13, 19),
('Adulto Joven', 20, 39),
('Adulto Medio', 40, 50),
('Adulto Mayor', 51, 65),
('Senior', 66, 120); 

select * from [dbo].[Dim_GrupoEtario_G12]
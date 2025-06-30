# 📦 Proyecto DataWarehouse G12 – BD2-2025

El proyecto final consistió en el diseño e implementación de un **DataWarehouse de ventas** para una empresa ficticia  llamada *The Drinking Company*,  integrando múltiples fuentes de datos a través de procesos ETL en SSIS. El objetivo fue lograr una arquitectura funcional de Business Intelligence que permitiera análisis y visualizaciones efectivas con Power BI.

## 🎯 Objetivo

Desarrollar un entorno **DataWarehouse** con enfoque en ventas, aplicando prácticas de modelado dimensional, control de calidad de datos y flujos ETL optimizados.

---

## 🛠️ Actividades principales

1. **Extracción de datos** desde fuentes como:
   - Archivos `.csv`, `.xlsx`, `.xml`
   - Bases de datos relacionales (MySQL y SQL Server)

2. **Transformación, depuración e integración** de datos mediante:
   - Carga en entorno de *staging* y luego en *intermedia*
   - Reglas de negocio aplicadas en flujos SSIS
   - Migración a esquema tipo estrella en el DataWarehouse

3. **Control de calidad y errores**, incluyendo:
   - Validación de duplicados
   - Tratamiento de valores nulos y errores tipográficos
   - Conversión de tipos

4. **Construcción de visualizaciones interactivas** en Power BI:
   - Análisis por región, cliente, categoría de producto, segmento etario, entre otras
   - Dashboard con métricas clave de rendimiento (KPIs)

---

## 🧰 Herramientas utilizadas

| Herramienta                       | Función                                     |
|----------------------------------|---------------------------------------------|
| **SQL Server**                   | Motor principal para staging y DWH         |
| **Visual Studio con SSIS**       | Desarrollo de procesos ETL                  |
| **Power BI**                     | Visualización y análisis                    |
| **MySQL y MySQL Workbench**      | Orígenes de datos externos                  |
| **SQL Server Management Studio** | Administración y prueba de consultas SQL    |

---

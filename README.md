# 📊 Data Warehouse RRHH - Proyecto Personal

Este proyecto es un data warehouse open source diseñado para el análisis de datos de Recursos Humanos. Simula un entorno de analítica empresarial usando herramientas modernas de ingeniería de datos, con ETL automatizado, modelo dimensional y visualización interactiva.

---

## 🔧 Tecnologías utilizadas

- **PostgreSQL** – Almacenamiento del data warehouse (modelo estrella)
- **Apache Airflow** – Orquestación de procesos ETL
- **Metabase** – Plataforma de visualización de datos (BI)
- **Docker + Docker Compose** – Contenedores para facilitar la instalación

---

## 🚀 ¿Cómo levantar el entorno?

### 1. Clonar el repositorio

```bash
git clone https://github.com/tomasvella/datawarehouse-rrhh
cd datawarehouse-rrhh
```

### 2. Descargar el dataset

Descargá el dataset desde Kaggle:

🔗 [IBM HR Analytics - Attrition Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

Guardalo como:

```
data/raw/HR-Employee-Attrition.csv
```

### 3. Levantar los servicios

```bash
docker-compose up --build -d
```

Esto iniciará:

- PostgreSQL (con esquema inicial)
- Apache Airflow
- Metabase

---

## 🌐 Accesos a las interfaces

| Servicio | URL                   | Usuario                    | Contraseña |
| -------- | --------------------- | -------------------------- | ---------- |
| Airflow  | http://localhost:8080 | admin                      | admin      |
| Metabase | http://localhost:3000 | Crear en el primer ingreso |

---

## 🗂️ Estructura del proyecto

```
data-warehouse-rrhh/
├── airflow/
│   ├── dags/                            # DAGs de Airflow
│   │    └── data/                       # Carpeta creada por el contenedor para persistir
│   └── Dockerfile                       # Imagen personalizada de Airflow
├── db/
│   └── init/
│       └── modelado_dimensional.sql     # Script SQL para crear el modelo estrella
├── data/
│   └── raw/
│       └── HR-Employee-Attrition.csv    # Dataset descargado
├── metabase/
│   └── metabase-data/                   # Volumen persistente de Metabase
├── docker-compose.yml
└── README.md
```

---

## 🧠 Métricas sugeridas

- Tasa de rotación de empleados
- Distribución de empleados por género y edad
- Satisfacción laboral por departamento
- Relación entre nivel educativo y desempeño
- Análisis de performance por área y rol

---

## 🧪 Ideas para expandir el proyecto

- Agregar logs simulados de login/asistencia (`fact_asistencias`)
- Incorporar un esquema de capacitaciones
- Agregar carga incremental con `Airflow`
- Validaciones de calidad de datos con `Great Expectations`
- Versionado de modelos con `dbt`

---

## 🪪 Licencia

Este proyecto es open source bajo licencia MIT.  
Podés usarlo y modificarlo libremente para fines educativos o personales.

---

## 🙌 Créditos

Dataset proporcionado por IBM y disponible en Kaggle.  
Este proyecto fue diseñado con fines educativos y demostrativos.

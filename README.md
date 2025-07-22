# 📊 Data Warehouse RRHH - Proyecto Personal

Este proyecto es un data warehouse open source diseñado para el análisis de datos de Recursos Humanos. Simula un entorno de analítica empresarial usando herramientas modernas de ingeniería de datos, con ETL automatizado y modelo dimensional.

---

## 🔧 Tecnologías utilizadas

- **PostgreSQL** – Almacenamiento del data warehouse (modelo estrella)
- **Apache Airflow** – Orquestación de procesos ETL
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

---

## 🌐 Accesos a las interfaces

| Servicio | URL                   | Usuario | Contraseña |
| -------- | --------------------- | ------- | ---------- |
| Airflow  | http://localhost:8080 | admin   | admin      |

---

## 📂 Acceso a la base de datos

```
psql -h localhost -U airflow -d dwh
```

Contraseña: airflow

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
├── docker-compose.yml
└── README.md
```

---

## 🧠 Métricas sugeridas

### 📉 Métricas de Rotación (Attrition)

- Tasa de rotación general y por departamento
- Análisis de rotación por género y nivel educativo
- Relación entre rotación y satisfacción laboral

### 😊 Métricas de Satisfacción

- Niveles de satisfacción laboral por departamento
- Satisfacción con el ambiente laboral
- Correlación entre satisfacción y desempeño

### 💰 Métricas de Compensación

- Salarios promedios por departamento y nivel
- Distribución de stock options
- Relación entre compensación y desempeño

### 📊 Métricas de Desempeño

- Calificaciones promedio por departamento
- Desempeño vs. Años en la empresa
- Relación entre desempeño y satisfacción

### 🕒 Métricas de Antigüedad

- Tiempo promedio en la empresa
- Tiempo en el puesto actual
- Rotación por antigüedad

### 🏢 Métricas de Estructura

- Distribución de empleados por departamento y género
- Pirámide organizacional por niveles
- Niveles educativos por departamento

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

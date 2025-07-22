-- Dimensión fecha
CREATE TABLE IF NOT EXISTS dim_date (
    dim_date_id         DATE PRIMARY KEY,
    year                INT NOT NULL,
    month               INT NOT NULL,
    quarter             INT NOT NULL
);

-- Dimensión trabajo / puesto
CREATE TABLE IF NOT EXISTS dim_job (
    job_id              SERIAL PRIMARY KEY,
    job_role            VARCHAR(100) NOT NULL,
    job_level           VARCHAR(50)
);

-- Dimensión departamento
CREATE TABLE IF NOT EXISTS dim_department (
    department_id       SERIAL PRIMARY KEY,
    department          VARCHAR(100) NOT NULL
);

-- Dimensión educación
CREATE TABLE IF NOT EXISTS dim_education (
    education_id        SERIAL PRIMARY KEY,
    education           VARCHAR(50) NOT NULL,
    field               VARCHAR(100)
);

-- Dimensión género
CREATE TABLE IF NOT EXISTS dim_gender (
    gender_id           SERIAL PRIMARY KEY,
    gender              VARCHAR(20) NOT NULL
);

-- Dimensión estado civil
CREATE TABLE IF NOT EXISTS dim_marital_status (
    marital_id          SERIAL PRIMARY KEY,
    marital_status      VARCHAR(50) NOT NULL
);

-- Tabla de hechos empleados
CREATE TABLE IF NOT EXISTS fact_employees (
    employee_id              SERIAL PRIMARY KEY,
    dim_date_id              DATE NOT NULL REFERENCES dim_date(dim_date_id),
    dim_job_id               INT NOT NULL REFERENCES dim_job(job_id),
    dim_department_id        INT NOT NULL REFERENCES dim_department(department_id),
    dim_education_id         INT NOT NULL REFERENCES dim_education(education_id),
    dim_gender_id            INT NOT NULL REFERENCES dim_gender(gender_id),
    dim_marital_id           INT NOT NULL REFERENCES dim_marital_status(marital_id),
    monthly_income           NUMERIC(12,2),
    performance_rating       INT,
    job_satisfaction         INT,
    environment_satisfaction INT,
    attrition                BOOLEAN,
    years_at_company         INT,
    years_in_current_role    INT,
    stock_option_level       INT
);

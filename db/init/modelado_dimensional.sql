-- Dimensiones
CREATE TABLE dim_empleado (
    id SERIAL PRIMARY KEY,
    employee_id INT UNIQUE,
    nombre VARCHAR(100),
    genero VARCHAR(10),
    edad INT,
    estado_civil VARCHAR(20),
    nivel_educativo VARCHAR(50),
    departamento VARCHAR(50),
    puesto VARCHAR(50)
);

CREATE TABLE dim_fecha (
    id SERIAL PRIMARY KEY,
    fecha DATE UNIQUE,
    año INT,
    mes INT,
    dia INT,
    dia_semana VARCHAR(20)
);

-- Hechos
CREATE TABLE fact_rotacion (
    id SERIAL PRIMARY KEY,
    employee_id INT,
    fecha_id INT,
    attrition BOOLEAN,
    motivo_salida VARCHAR(100),
    satisfaction_level FLOAT,
    performance_rating INT,
    FOREIGN KEY (employee_id) REFERENCES dim_empleado(employee_id),
    FOREIGN KEY (fecha_id) REFERENCES dim_fecha(id)
);

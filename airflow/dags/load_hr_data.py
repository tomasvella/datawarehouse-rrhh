from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import pandas as pd
import psycopg2


def load_empleados():
    df = pd.read_csv('/opt/airflow/dags/data/HR-Employee-Attrition.csv')

    # Conexión a la base PostgreSQL del DWH
    conn = psycopg2.connect(
        host="postgres",
        database="dwh",
        user="airflow",
        password="airflow"
    )
    cur = conn.cursor()

    for _, row in df.iterrows():
        cur.execute("""
            INSERT INTO dim_empleado (
                employee_id, nombre, genero, edad, estado_civil,
                nivel_educativo, departamento, puesto
            )
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (employee_id) DO NOTHING;
        """, (
            row['EmployeeNumber'],
            row.get('EmployeeName', f"Empleado {row['EmployeeNumber']}"),
            row['Gender'],
            row['Age'],
            row['MaritalStatus'],
            row['EducationField'],
            row['Department'],
            row['JobRole']
        ))

    conn.commit()
    cur.close()
    conn.close()


with DAG(
    dag_id="load_hr_data",
    start_date=datetime(2023, 1, 1),
    schedule_interval=None,
    catchup=False,
    description="Carga inicial de empleados desde CSV a la dimensión"
) as dag:

    load_task = PythonOperator(
        task_id="load_dim_empleado",
        python_callable=load_empleados
    )

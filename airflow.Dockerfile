FROM apache/airflow:2.5.3

COPY ./ ./
RUN pip install --upgrade pip setuptools wheel
RUN pip install apache-airflow[postgres]
RUN pip install --no-cache-dir -r airflow_requirements.txt
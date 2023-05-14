FROM python:3.10.0
WORKDIR /app
COPY ./ ./
RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r mlflow_requirements.txt
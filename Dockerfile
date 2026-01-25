FROM python:3.12-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

RUN python gs_fiap_monitor/manage.py collectstatic --noinput

EXPOSE 8000

CMD ["python", "gs_fiap_monitor/manage.py", "runserver", "0.0.0.0:8000"]

# docker/backend.Dockerfile

FROM python:3.11-slim

WORKDIR /app

COPY ./backend/requirements.txt .

RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    netcat-openbsd && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install mysqlclient

COPY ./backend .

RUN chmod +x wait-for-it.sh

CMD ["./wait-for-it.sh", "db", "3306", "--", "python", "manage.py", "runserver", "0.0.0.0:8000"]

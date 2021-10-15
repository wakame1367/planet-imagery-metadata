FROM python:3.9-slim-buster

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
    build-essential \
    && pip install --no-cache-dir \
    autopep8 \
    flake8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV APP /app
WORKDIR $APP

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
